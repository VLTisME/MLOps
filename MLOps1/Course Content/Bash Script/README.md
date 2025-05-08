# I. Introduction  

## 1.1 Overview  
**Bash scripting** is a foundational tool for automating both simple and complex tasks in Unix-like operating systems (Linux, macOS). By placing a set of shell commands inside a script file (typically with a `.sh` extension), you can efficiently execute sequences of instructions, making your workflow reproducible and maintainable.  

**Key benefits:**  
- Automates repetitive and tedious command-line tasks.  
- Simplifies batch processing, system administration, and application deployment.  
- Enhances reproducibility by saving all command logic in one place.  

**What is a Bash script?**  
A Bash script is a plain text file containing commands that the Bash shell can run. It may include variables, conditionals (if statements), loops, and more, making it a full scripting language for orchestration and automation.  

**Common file extension:** `.sh` (e.g., `myscript.sh`)  

---  

## 1.2 Relevance to MLOps  

In **MLOps (Machine Learning Operations)**, Bash scripting is especially important for:  

- **Automating pipelines:**  
  Streamline the steps involved in model training, data preprocessing, model deployment, and monitoring by chaining commands into executable scripts.  
- **Resource management:**  
  Automate the setup and teardown of experimental environments, monitor GPU/CPU/memory usage, and handle log files, making system resource management efficient.  
- **Task scheduling:**  
  Use tools like **CronJobs** to automatically update datasets, retrain models, or perform periodic health checks, ensuring no manual oversight is required for routine operations.  

**Real-World Examples:**  
- Schedule nightly retraining of models on fresh data with a `cron` job that calls a Bash script.  
- Chain together Docker commands, data syncing, and model evaluation in a single, repeatable script.  
- Automate log cleanup and system health checks to run before deploying new ML models.  

> _Learning Bash scripting is a must-have skill for any engineer or data scientist working in MLOps or DevOps._  

---  

# II. Lecture Objectives  

By the end of this lesson, you will be able to:  

- **Understand** the purpose and basic structure of Bash scripts, including the use of the shebang (`#!/bin/bash`) and script arguments.  
- **Write and run** your own Bash scripts, handling files, variables, and user input.  
- **Master essential commands**, syntax, and control structures such as conditionals (`if`), loops (`for`, `while`), and functions.  
- **Explore advanced features** including:  
  - String manipulation  
  - Redirection operators (input/output with `>`, `>>`, `<`, and piping with `|`)  
  - Error handling and exit codes.  
- **Automate real-world tasks** using Makefiles and scheduled jobs with Cron (CronJobs), crucial for deploying production-ready ML and data workflows.  
- **Troubleshoot and debug** Bash scripts effectively, emphasizing best practices and common pitfalls.  

---  

# III. Content Summary  

## 3.1 Bash Scripting Basics  

### 3.1.1 Structure of a Bash Script  

**Core Components Explained:**  

```bash  
#!/bin/bash  # Shebang: Tells system to use Bash interpreter  
# This is a comment (ignored during execution)  

# Access command-line arguments:  
input_file=\$1  # First argument → \$1  
output_dir=\$2   # Second argument → \$2  

echo "Processing $input_file → $output_dir"  
date            # Run system date command  
```

## Shebang (`#!/bin/bash`) Explained  

**What it does:**  
Specifies the absolute path to the Bash interpreter that should execute the script.  

**Key points:**  
1. **Mandatory First Line**  
   Must be the **very first line** in the script (no empty lines/comments above it)  

2. **Interpreter Directive**  
   Tells the OS: "Run this script using the Bash shell located at `/bin/bash`"  

3. **Portability**  
   - Works on Linux/macOS systems where Bash is installed at `/bin/bash`  
   - Alternative for portability: `#!/usr/bin/env bash`  

**Example:**  
```bash  
#!/bin/bash  # ← Shebang line  
echo "This script is guaranteed to use Bash"

**Key Features:**  
- **Shebang Line:** `#!/bin/bash` must be first line  
- **Arguments:** `$0` = script name, `$1`-`$n` = arguments  
- **Variables:** No spaces around `=` in assignments (`count=5`)  

**Real-World MLOps Example:**  
```bash  
#!/bin/bash  
# Model training script  
train_data=\$1  
test_data=\$2  

echo "Starting training with:"  
echo "- Train: $train_data"  
echo "- Test: $test_data"  

python train.py --train "$train_data" --test "$test_data"  
```

---  
### 3.1.2 How to Run a Bash Script  

**Step-by-Step Guide:**  

1. **Create Script:**  
```bash  
nano preprocess.sh  # Create/edit script  
```

2. **Add Execute Permission:**  
```bash  
chmod +x preprocess.sh  # Makes file executable  
```

3. **Run with Arguments:**  
```bash  
./preprocess.sh raw_data/ processed_data/  
```

**Common Errors & Solutions:**  

| Error                          | Solution                     |  
|--------------------------------|------------------------------|  
| `Permission denied`           | Run `chmod +x filename.sh`   |  
| `No such file/directory`      | Check shebang line           |  
| `Unexpected operator`         | Use spaces in conditionals    |  

**Advanced Execution:**  
```bash  
# Run with output logging  
./train_model.sh 2>&1 | tee training.log  

# Pass environment variables  
BATCH_SIZE=256 ./script.sh  
```

---  

## 3.2 Popular Syntaxes  

### Essential Syntax Deep Dive  

**1. Argument Handling:**  
```bash  
#!/bin/bash  
echo "Script name: \$0"  
echo "Total args: $#"  
echo "All args: $@"  
```

**2. Variable Best Practices:**  
```bash  
model_name="resnet50"  # Assign  
echo ${model_name^^}   # Output: RESNET50  
unset model_name       # Remove variable  
```

**3. Conditional Execution:**  
```bash  
# Only run if previous command succeeds  
download_data.sh && \
process_data.py || \
echo "Pipeline failed"  
```  

**4. Command Substitution:**  
```bash  
# Store command output in variable  
current_date=$(date +%F)  
echo "Today: $current_date"  
```

---  

## 3.3 Essential Syntax and Commands  

### 3.3.1 Output Redirection  

**Practical MLOps Uses:**  

1. **Capture Training Metrics:**  
```bash  
python train.py > metrics.txt 2> errors.log  
```

2. **Append to Log File:**  
```bash  
echo "[$(date)] Starting epoch $epoch" >> training.log  
```

### 3.3.2 Here Documents  

**Dynamic Config Generation:**  
```bash  
cat > model_config.yaml << EOF  
model:  
  name: \$1  
  layers: \$2  
training:  
  epochs: ${EPOCHS:-100}  # Default 100 if unset  
EOF  
```

### 3.3.3 Piping  

**Data Processing Pipeline:**  
```bash  
cat server.log | \
grep "ERROR" | \
awk '{print \$5}' | \
sort | \
uniq -c > error_report.txt  
```

---  

## 3.4 Control Structures  

### 3.4.1 If-Else Statements  

**File Existence Check:**  
```bash  
if [[ -f "model.pt" ]]; then  
    echo "Model found - starting inference"  
    python infer.py  
else  
    echo "Error: model.pt missing!"  
    exit 1  
fi  
```

**Numerical Comparison:**  
```bash  
if (( $num_gpus >= 2 )); then  
    echo "Enabling distributed training"  
    torchrun --nproc_per_node 2 train.py  
fi  
```

### 3.4.2 For Loops  
**Basic loop:**  
```bash  
for lr in 0.1 0.01 0.001; do  
  python train.py --lr $lr  
done  
```

**File processing:**  
```bash  
for file in *.csv; do  
  python clean.py $file  
done
```

### 3.4.3 While Loops  
**Counter-based:**  
```bash  
count=0  
while [[ $count -lt 5 ]]; do  
  echo "Iteration $count"  
  ((count++))  
done  
```

**Process monitoring:**  
```bash  
while [[ $(docker ps | wc -l) -gt 0 ]]; do  
  echo "Containers still running..."  
  sleep 10  
done  
```

---  

## 3.5 Useful String Operations  

### 3.5.1 Replace Substrings  
```bash  
path="/home/user/experiments"  
echo "${path/user/guest}"  # /home/guest/experiments  
```

### 3.5.2 Split Strings  
```bash  
IFS="/" read -ra path_parts <<< "/data/models/bert"  
echo "Model: ${path_parts[-1]}"  # bert  
```

### 3.5.3 Delete Substrings  
```bash  
filename="model_v1.pt"  
echo "${filename%.*}"  # model_v1  
```
## 3.6 Advanced Use Cases and Tricks  

### 3.6.1 String Manipulation Tricks  

**Advanced Pattern Replacement:**  
```bash  
path="/home/mycomputer/Documents/home/m1/linux/scripts"  

# Replace first occurrence  
echo "${path/home/house}"    # /house/mycomputer/Documents/home/m1/linux/scripts  

# Replace all occurrences  
echo "${path//home/house}"   # /house/mycomputer/Documents/house/m1/linux/scripts  

# Convert case  
echo "${path,,}"  # lowercase: /home/mycomputer/documents/home/m1/linux/scripts  
echo "${path^^}"  # uppercase: /HOME/MYCOMPUTER/DOCUMENTS/HOME/M1/LINUX/SCRIPTS  

# Extract filename  
echo "${path##*/}"  # scripts  

# Remove path components  
echo "${path##*m1/}"  # linux/scripts  

# Split into array  
IFS="/" read -ra parts <<< "$path"  
echo "Last element: ${parts[-1]}"  # scripts  
```  

**Key Syntax Explained:**  
- `${var/pattern/repl}` - Replace first match  
- `${var//pattern/repl}` - Replace all matches  
- `${var##*/}` - Remove longest prefix match (dirname stripping)  
- `IFS="/"` - Set field separator for splitting  
- `${parts[-1]}` - Array last element (Bash 4+)  

---  

### 3.6.2 Yes/No Prompt with Error Handling  

**Robust Implementation:**  
```bash  
#!/bin/bash  

while true; do  
    read -p "Do you want to proceed? [y/n]: " answer  
    case "${answer,,}" in  # Convert to lowercase  
        y|yes)  
            echo "Starting installation..."  
            apt install package-name  
            break  
            ;;  
        n|no)  
            echo "Installation cancelled"  
            exit 0  
            ;;  
        *)  
            echo "Invalid input! Please enter y/n"  
            ;;  
    esac  
done  
```  

**Best Practices:**  
1. Use `case` for multiple match patterns  
2. Convert input to lowercase `${answer,,}`  
3. Include both short (`y/n`) and long (`yes/no`) options  
4. Loop until valid input is received  

---  

### 3.6.3 Real-Time File Monitoring  

**Enhanced File Watcher:**  
```bash  
#!/bin/bash  

file=\$1  
interval=2  # Check every 2 seconds  

# Initial validation  
[[ -f "$file" ]] || { echo "Error: File not found"; exit 1; }  

last_size=$(stat -c%s "$file")  
echo "Monitoring $file (Ctrl+C to exit)"  

while true; do  
    current_size=$(stat -c%s "$file")  
    
    if (( current_size > last_size )); then  
        bytes_added=$((current_size - last_size))  
        echo -e "\nNew data (${bytes_added} bytes):"  
        tail -c "$bytes_added" "$file"  
    fi  
    
    last_size=$current_size  
    sleep "$interval"  
done  
```  

**Features:**  
- Validates file existence first  
- Shows exact bytes added  
- Configurable check interval  
- Clean exit on Ctrl+C  

---  

### 3.6.4 CSV Data Analysis Pipeline  

**Production-Grade Frequency Counter:**  
```bash  
#!/bin/bash  

input_dir=\$1  
target_column=5  # Adjust based on CSV structure  

# Safely collect CSV files  
csv_files=()  
while IFS= read -r -d $'\0' file; do  
    [[ "$file" != *"copy"* ]] && csv_files+=("$file")  
done < <(find "$input_dir" -name "*.csv" -print0)  

# Extract and count values from first CSV  
declare -A frequency  
while IFS=, read -r -a fields; do  
    ((frequency[${fields[$target_column]}]++))  
done < <(tail -n +2 "${csv_files[0]}")  

# Display sorted results  
printf "%-20s %s\n" "Value" "Count"  
for key in "${!frequency[@]}"; do  
    printf "%-20s %d\n" "$key" "${frequency[$key]}"  
done | sort -k2 -nr  
```  

**Improvements Over Original:**  
1. Uses `find -print0` for safe filename handling  
2. Proper CSV parsing with `IFS=,`  
3. Associative array for efficient counting  
4. Professional output formatting  
5. Numeric sort by frequency count  

**Usage:**  
```bash  
./analyze_csv.sh data/  # Process all CSVs in data directory  
```  

---  

## 3.7 Best Practices Checklist  

1. **Always quote variables:**  
   `cp "$file" "$dest/"` instead of `cp $file $dest`  

2. **Use `[[ ]]` for conditionals:**  
   More features and safer than `[ ]`  

3. **Handle spaces in filenames:**  
   `while IFS= read -r -d $'\0' file`  

4. **Validate inputs:**  
   ```bash  
   [[ -d "$input_dir" ]] || { echo "Invalid directory"; exit 1; }  
   ```

5. **Use error handling:**  
   ```bash  
   set -euo pipefail  
   trap 'echo "Error on line $LINENO"' ERR  
   ```

6. **Avoid parsing `ls`:**
   Use `find` or globs (`*.csv`) instead  

7. **Document with shebang:**
   `#!/usr/bin/env bash` for portability
   
   
   
   
   
   
   
   
   
   ## 3.7 Makefile Basics  

### 3.7.1 Purpose of Makefiles  
**Key Benefits:**  
- Manage task dependencies (e.g., build before deploy)  
- Automate repetitive workflows  
- Standardize project commands  

**Basic Structure:**  
```makefile  
.PHONY: clean build deploy  # Declare non-file targets  

clean:  
    @echo "Cleaning temporary files"  
    rm -rf *.tmp  

build:  
    @echo "Compiling project..."  
    gcc -o main src/*.c  

deploy: build  # Depends on build target  
    @echo "Deploying to production"  
    scp main user@server:/app  
```  

**Execution Examples:**  
```bash  
make clean   # Remove temporary files  
make deploy  # Runs build first, then deploy  
```  

**MLOps Use Case:**  
```makefile  
.PHONY: train serve monitor  

train:  
    python train.py --data-dir $(DATA_DIR)  

serve: train  
    docker build -t model-server .  
    docker run -p 5000:5000 model-server  

monitor:  
    python monitor.py --endpoint http://localhost:5000  
```  

---  

## 3.8 Introduction to CronJobs  

### 3.8.1 CronJob Fundamentals  
**Key Features:**  
- Schedule tasks at specific times  
- Run scripts/programs automatically  
- Managed through `crontab` interface  

**Crontab Syntax:**  
```  
* * * * * command_to_execute  
│ │ │ │ │  
│ │ │ │ └── Day of week (0-6) [0=Sunday]  
│ │ │ └──── Month (1-12)  
│ │ └────── Day of month (1-31)  
│ └──────── Hour (0-23)  
└────────── Minute (0-59)  
```  

**Common Patterns:**  
```bash  
0 3 * * *  /backup.sh       # Daily at 3 AM  
*/15 * * * * monitor.py     # Every 15 minutes  
0 0 1 * * invoice_generator # Monthly at midnight  
```  

### 3.8.2 Practical Cron Management  

**1. Edit Crontab:**  
```bash  
crontab -e  # Opens in default editor  
```  

**2. List Active Jobs:**  
```bash  
crontab -l  
```  

**3. MLOps Example (Model Retraining):**  
```  
# Retrain model every Sunday at 2 AM  
0 2 * * 0 /home/user/mlops/retrain.sh  
```  

**4. Log Management:**  
```  
# Rotate logs daily at midnight  
0 0 * * * /usr/sbin/logrotate /etc/logrotate.conf  
```  

**Best Practices:**  
1. Use absolute paths in commands  
2. Redirect output to logs:  
   ```bash  
   0 4 * * * /backup.sh > /var/log/backup.log 2>&1  
   ```  
3. Test with future times first  
4. Separate environment variables:  
   ```bash  
   SHELL=/bin/bash  
   PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin  
   ```  

---  

# 4. Conclusion  

**Why Bash Scripting Matters for MLOps:**  
1. **Automation Foundation:** Streamline data preprocessing, model training, and deployment  
2. **Portability:** Runs on any Linux/Unix system without additional dependencies  
3. **Integration:** Easily combines Python/R models with system tools  
4. **Scalability:** Builds pipelines that handle large datasets efficiently  

**Key Takeaways:**  
- Master variables, control structures, and I/O redirection  
- Combine Makefiles for complex workflow orchestration  
- Leverage CronJobs for scheduled maintenance/retraining  
- Follow scripting best practices for reliability  

---  

# 5. References & Resources  

## 5.1 Core References  
- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/)  
- [Crontab Guru](https://crontab.guru/) (Interactive cron scheduler)  
- [Makefile Tutorial](https://makefiletutorial.com/)  

## 5.2 MLOps-Focused Resources  
1. **Automated Pipeline Design:**  
   - [Kubeflow Pipelines](https://www.kubeflow.org/)  
   - [MLflow Projects](https://mlflow.org/docs/latest/projects.html)  
2. **Production Best Practices:**  
   - [Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)  
   - [ShellCheck](https://www.shellcheck.net/) (Static analysis tool)  
3. **Advanced Scheduling:**  
   - [Apache Airflow](https://airflow.apache.org/)  
   - [Prefect](https://www.prefect.io/)
   
   
   
# Some notes
1. 
```bash
sh test1.sh
```
is different from
```bash
.\test1.sh
```

because even when in test1.sh has #!/bin/bash, the first one will force the script to run under sh, while the second one runs under bash as specified in the .sh file 
