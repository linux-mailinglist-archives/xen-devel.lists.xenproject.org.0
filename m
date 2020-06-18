Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D8F1FFECE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 01:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm4Ak-0001bK-NP; Thu, 18 Jun 2020 23:42:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZeQT=77=cert.pl=michall@srs-us1.protection.inumbo.net>)
 id 1jm4Aj-0001b9-BE
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 23:42:17 +0000
X-Inumbo-ID: 56ece1f2-b1bd-11ea-bb0d-12813bfff9fa
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56ece1f2-b1bd-11ea-bb0d-12813bfff9fa;
 Thu, 18 Jun 2020 23:42:16 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 11DE2A30D9;
 Fri, 19 Jun 2020 01:42:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 09E4BA30C7;
 Fri, 19 Jun 2020 01:42:14 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id STBNX7WuqB4b; Fri, 19 Jun 2020 01:42:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 61647A30D9;
 Fri, 19 Jun 2020 01:42:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id A093swVWaL80; Fri, 19 Jun 2020 01:42:13 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 42F71A30C7;
 Fri, 19 Jun 2020 01:42:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 32F14216FE;
 Fri, 19 Jun 2020 01:41:43 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JhuFvCO24gwZ; Fri, 19 Jun 2020 01:41:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 77C612165A;
 Fri, 19 Jun 2020 01:41:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rn7me6lTfX3G; Fri, 19 Jun 2020 01:41:37 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir.nask.net.pl [172.16.10.10])
 by belindir.nask.net.pl (Postfix) with ESMTP id 558C7215FA;
 Fri, 19 Jun 2020 01:41:37 +0200 (CEST)
Date: Fri, 19 Jun 2020 01:41:37 +0200 (CEST)
From: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1593123263.9820951.1592523697296.JavaMail.zimbra@cert.pl>
In-Reply-To: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
Subject: [PATCH v2 5/7] tools/libxc: add xc_vmtrace_* functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.16.10.10]
X-Mailer: Zimbra 8.6.0_GA_1194 (ZimbraWebClient - GC83 (Win)/8.6.0_GA_1194)
Thread-Topic: tools/libxc: add xc_vmtrace_* functions
Thread-Index: hSzh8Vr462omVBiCuz/GiNtdRkOdyOzjXSg4
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
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add functions in libxc that use the new HVMOP_vmtrace interface.

Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
---
 tools/libxc/Makefile          |  1 +
 tools/libxc/include/xenctrl.h | 39 ++++++++++++++
 tools/libxc/xc_vmtrace.c      | 97 +++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 tools/libxc/xc_vmtrace.c

diff --git a/tools/libxc/Makefile b/tools/libxc/Makefile
index fae5969a73..605e44501d 100644
--- a/tools/libxc/Makefile
+++ b/tools/libxc/Makefile
@@ -27,6 +27,7 @@ CTRL_SRCS-y       += xc_csched2.c
 CTRL_SRCS-y       += xc_arinc653.c
 CTRL_SRCS-y       += xc_rt.c
 CTRL_SRCS-y       += xc_tbuf.c
+CTRL_SRCS-y       += xc_vmtrace.c
 CTRL_SRCS-y       += xc_pm.c
 CTRL_SRCS-y       += xc_cpu_hotplug.c
 CTRL_SRCS-y       += xc_resume.c
diff --git a/tools/libxc/include/xenctrl.h b/tools/libxc/include/xenctrl.h
index 113ddd935d..101cc9b712 100644
--- a/tools/libxc/include/xenctrl.h
+++ b/tools/libxc/include/xenctrl.h
@@ -1585,6 +1585,45 @@ int xc_tbuf_set_cpu_mask(xc_interface *xch, xc_cpumap_t mask);
 
 int xc_tbuf_set_evt_mask(xc_interface *xch, uint32_t mask);
 
+/**
+ * Enable Intel Processor Trace for given vCPU in given DomU.
+ * Allocate the trace ringbuffer with given size.
+ *
+ * @parm xch a handle to an open hypervisor interface
+ * @parm domid domain identifier
+ * @parm vcpu vcpu identifier
+ * @return 0 on success, -1 on failure
+ */
+int xc_vmtrace_ipt_enable(xc_interface *xch, uint32_t domid,
+                          uint32_t vcpu);
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
+int xc_vmtrace_ipt_disable(xc_interface *xch, uint32_t domid,
+                           uint32_t vcpu);
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
+int xc_vmtrace_ipt_get_offset(xc_interface *xch, uint32_t domid,
+                              uint32_t vcpu, uint64_t *offset);
+
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
 
diff --git a/tools/libxc/xc_vmtrace.c b/tools/libxc/xc_vmtrace.c
new file mode 100644
index 0000000000..5f0551ad71
--- /dev/null
+++ b/tools/libxc/xc_vmtrace.c
@@ -0,0 +1,97 @@
+/******************************************************************************
+ * xc_vmtrace.c
+ *
+ * API for manipulating hardware tracing features
+ *
+ * Copyright (c) 2020, Michal Leszczynski
+ *
+ * Copyright 2020 CERT Polska. All rights reserved.
+ * Use is subject to license terms.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "xc_private.h"
+#include <xen/trace.h>
+
+int xc_vmtrace_ipt_enable(
+        xc_interface *xch, uint32_t domid, uint32_t vcpu)
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
+
+    rc = xencall2(xch->xcall, __HYPERVISOR_hvm_op, HVMOP_vmtrace,
+                  HYPERCALL_BUFFER_AS_ARG(arg));
+
+    xc_hypercall_buffer_free(xch, arg);
+    return rc;
+}
+
+int xc_vmtrace_ipt_get_offset(
+        xc_interface *xch, uint32_t domid, uint32_t vcpu, uint64_t *offset)
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
+int xc_vmtrace_ipt_disable(xc_interface *xch, uint32_t domid, uint32_t vcpu)
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
-- 
2.20.1


