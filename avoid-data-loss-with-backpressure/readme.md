# A Practical guide for avoiding data loss and backpressure problems with Fluent Bit

Fluent Bit is a widely used open-source data collection agent, processor, and forwarder that enables you to collect logs, metrics, and traces from various sources, filter and transform them, and then forward them to multiple destinations. With over ten billion Docker pulls, Fluent Bit has established itself as a preferred choice for log processing, collecting, and shipping.
At its core, Fluent Bit is a simple data pipeline consisting of various stages, as depicted below.

Most data pipelines eventually suffer from backpressure, which is when data is ingested at a higher rate than the ability to flush it. Backpressure causes problems such as high memory usage, service downtime, and data loss. Network failures, latency, or third-party service failures are common scenarios where backpressure occurs.
Fluent Bit offers special strategies to deal with backpressure to help ensure data safety and reduce downtime. Recognizing when Fluent Bit is experiencing backpressure and knowing how to address it is crucial for maintaining a healthy data pipeline.
This post provides a practical guide on how to detect and avoid backpressure problems with Fluent Bit.


# Directory Structure

```
│   # Contains empty fluent bit configuration used for idenitfying the minimum resource required to run fluent bit
├── fluent-bit-empty.conf
│
│   # Contains fluent bit configuration that reproduces fluent bit container getting due to OOM error
├── fluent-bit-oom.conf
│
│   # Contains fluent bit configuration that produces a quick fix for the above backpressure problem using mem_buf_limit property
├── fluent-bit-memory-limit.conf
│  
│   # Contains fluent bit configuration that produces a permanent fix for the above backpressure problem using storage.max_chunks_up property
├── fluent-bit-filesystem.conf
```