# Define variables
NUMBER_OF_DAYS=7 # Default number of days
FROM_DATE="" # From date (optional)
TO_DATE="" # To date (optional)
INPUT="" # Input from user

# Get input from user
echo "Enter the number of days (optional): "
read NUMBER_OF_DAYS

echo "Enter the from date (optional): "
read FROM_DATE

echo "Enter the to date (optional): "
read TO_DATE

# Check if the user has provided a from and to date
if [[ -n "$FROM_DATE" && -n "$TO_DATE" ]]; then
  # Find the files created between the two dates
  find . -type f -newermt "$FROM_DATE" -not -newermt "$TO_DATE"
else
  # Find the files created within the last $NUMBER_OF_DAYS
  find . -type f -mtime -$NUMBER_OF_DAYS
fi

# Get the size of each file
for file in $(find . -type f -newermt "$FROM_DATE" -not -newermt "$TO_DATE" -o -mtime -$NUMBER_OF_DAYS); do
  size=$(du -b "$file" | cut -f1)

  # Print the file name and size
  echo "$file: $size bytes"
done
