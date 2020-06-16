Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EBF1FB606
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:23:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDQu-00017r-Nb; Tue, 16 Jun 2020 15:23:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xJom=75=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jlDQt-00017i-8H
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:23:27 +0000
X-Inumbo-ID: 5287aa40-afe5-11ea-b8fc-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5287aa40-afe5-11ea-b8fc-12813bfff9fa;
 Tue, 16 Jun 2020 15:23:26 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 482C2A2F1B;
 Tue, 16 Jun 2020 17:23:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 43D40A2EB4;
 Tue, 16 Jun 2020 17:23:24 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QhxJwfgYP_-e; Tue, 16 Jun 2020 17:23:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id A4B42A2F1B;
 Tue, 16 Jun 2020 17:23:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0bmM42s5bl3B; Tue, 16 Jun 2020 17:23:23 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 843CDA2EB4;
 Tue, 16 Jun 2020 17:23:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 77283214C8;
 Tue, 16 Jun 2020 17:22:53 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PSsucB3G25kB; Tue, 16 Jun 2020 17:22:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id E204B215F4;
 Tue, 16 Jun 2020 17:22:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FEy7X_fQbIBF; Tue, 16 Jun 2020 17:22:47 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id C7EA5214C8;
 Tue, 16 Jun 2020 17:22:47 +0200 (CEST)
Date: Tue, 16 Jun 2020 17:22:47 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1945850288.8766285.1592320967782.JavaMail.zimbra@cert.pl>
In-Reply-To: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
Subject: [PATCH v1 5/7] tools/libxc: add xc_ptbuf_* functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxc: add xc_ptbuf_* functions
Thread-Index: KAn5ItxMsuAqHW3ZzkheyNf1oni9hpY5dAoC
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add functions in libxc that use the new HVMOP_vmtrace interface.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/libxc/include/xenctrl.h |  59 +++++++++++++++++++
 tools/libxc/xc_tbuf.c         | 108 ++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 113ddd935d..0a972deb7d 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1585,6 +1585,65 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask);
 
 int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask);
 
+/**
+ * Enable Intel Processor Trace for given vCPU in given DomU.
+ * Allocate the trace ringbuffer with given size.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm size trace buffer size in bytes, must be power of 2, between 4 kB and 4 GB
+ * @return 0 on success, -1 on failure
+ */
+int xc_ptbuf_enable(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t size);
+
+/**
+ * Disable Intel Processor Trace for given vCPU in given DomU.
+ * Deallocate the trace ringbuffer.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_ptbuf_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu);
+
+/**
+ * Map the trace buffer into Dom0.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm buf pointer to the mapped buffer will be written there
+ * @parm trace buffer size (in bytes) will be written there
+ * @return 0 on success, -1 on failure
+ */
+int xc_ptbuf_map(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint8_t **buf, uint64_t *size);
+
+/**
+ * Unmap the trace buffer from Dom0.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm buf pointer to the mapped buffer
+ * @parm size of the trace buffer (in bytes)
+ * @return 0 on success, -1 on failure
+ */
+int xc_ptbuf_unmap(xc_interface *xch, uint8_t *buf, uint64_t size);
+
+/**
+ * Get current offset inside the trace ringbuffer.
+ * This allows to determine how much data was written into the buffer.
+ * Once buffer overflows, the offset will reset to 0 and the previous
+ * data will be overriden.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @parm offset current offset inside trace buffer will be written there
+ * @return 0 on success, -1 on failure
+ */
+int xc_ptbuf_get_offset(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *offset);
+
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
 
diff --git a/tools/libxc/xc_tbuf.c b/tools/libxc/xc_tbuf.c
index 283fbd1c8f..8fab7f7d79 100644
--- a/tools/libxc/xc_tbuf.c
+++ b/tools/libxc/xc_tbuf.c
@@ -79,6 +79,114 @@ int xc_tbuf_get_size(xc_interface *xch, unsigned long *size)
     return rc;
 }
 
+int xc_ptbuf_enable(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t size)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->version = HVMOP_VMTRACE_INTERFACE_VERSION;
+    arg->cmd = HVMOP_vmtrace_ipt_enable;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+    arg->size = size;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_ptbuf_get_offset(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *offset)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->version = HVMOP_VMTRACE_INTERFACE_VERSION;
+    arg->cmd = HVMOP_vmtrace_ipt_get_offset;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    if ( rc == 0 )
+    {
+        *offset = arg->offset;
+    }
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_ptbuf_map(xc_interface *xch, uint32_t domid, uint32_t vcpu, uint8_t **buf, uint64_t *size)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+    uint8_t *mapped_buf;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->version = HVMOP_VMTRACE_INTERFACE_VERSION;
+    arg->cmd = HVMOP_vmtrace_ipt_get_buf;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    if ( rc == 0 )
+    {
+        mapped_buf = (uint8_t *)xc_map_foreign_range(xch, DOMID_XEN, arg->size, PROT_READ, arg->mfn);
+
+        if ( mapped_buf == NULL )
+            return -1;
+
+        *buf = mapped_buf;
+        *size = arg->size;
+    }
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_ptbuf_unmap(xc_interface *xch, uint8_t *buf, uint64_t size)
+{
+    xenforeignmemory_unmap(xch->fmem, buf, size >> PAGE_SHIFT);
+    return 0;
+}
+
+int xc_ptbuf_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu)
+{
+    DECLARE_HYPERCALL_BUFFER(xen_hvm_vmtrace_op_t, arg);
+    int rc = -1;
+
+    arg = xc_hypercall_buffer_alloc(xch, arg, sizeof(*arg));
+    if ( arg == NULL )
+        return -1;
+
+    arg->version = HVMOP_VMTRACE_INTERFACE_VERSION;
+    arg->cmd = HVMOP_vmtrace_ipt_disable;
+    arg->domain = domid;
+    arg->vcpu = vcpu;
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
 int xc_tbuf_enable(xc_interface *xch, unsigned long pages, unsigned long *mfn,
                    unsigned long *size)
 {
-- 
2.20.1


