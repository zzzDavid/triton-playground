import matplotlib.pyplot as plt

# Data
latencies = [770.849, 787.233, 574.129, 409.709]
l2_utilization = [4.6875, 4.6875, 7.8125, 31.25]
l1_utilization = [18.75, 18.75, 31.25, 100.0]

# Create a figure and two axes
fig, ax1 = plt.subplots()

# set size
fig.set_size_inches(10, 6)
# limit y axis
ax1.set_ylim([0, 1000])
# limit x axis
ax1.set_xlim([-0.2, 3.2])

# Plot latency data on the left y-axis with star markers
ax1.plot(latencies, color='tab:blue', marker='*', markersize=16, label='Latency')
ax1.set_ylabel('Latency (us)', color='tab:blue', fontsize=16)
ax1.tick_params(axis='y', labelcolor='tab:blue')
ax1.tick_params(axis='both', which='major', labelsize=16)

# Create a twin Axes sharing the xaxis for utilization data
ax2 = ax1.twinx()

# Plot utilization data on the right y-axis with larger markers and dotted lines
ax2.plot(l2_utilization, color='tab:orange', marker='s', markersize=12, linestyle='dotted', label='L2 Utilization')
ax2.plot(l1_utilization, color='tab:green', marker='^', markersize=12, linestyle='dotted', label='L1 Utilization')
ax2.set_ylabel('Utilization (%)', color='black', fontsize=16)
ax2.tick_params(axis='y', labelcolor='black')
ax2.tick_params(axis='both', which='major', labelsize=16)

# Move the legend outside the plot
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc='center left', bbox_to_anchor=(0, 0.5), fontsize=18)

# Title and layout adjustments
plt.title('Latency and Utilization', fontsize=16)
plt.xticks(range(len(latencies)), ['Baseline', '+DMA Broadcast', '+Ping Pong', '+Tuned tile sizes'])
plt.tight_layout()

# save the plot as a file, but high res
plt.savefig('plot.png', dpi=300)
