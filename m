Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6982EE704
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:37:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63111.112063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc20-0002p4-AJ; Thu, 07 Jan 2021 20:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63111.112063; Thu, 07 Jan 2021 20:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc20-0002oW-5K; Thu, 07 Jan 2021 20:37:16 +0000
Received: by outflank-mailman (input) for mailman id 63111;
 Thu, 07 Jan 2021 20:37:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc1y-0002nT-A0
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:37:14 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ddceb0db-16f4-4455-9777-5fe10b7c2522;
 Thu, 07 Jan 2021 20:37:13 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZUcw089093;
 Thu, 7 Jan 2021 20:37:11 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35wftxdsxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:37:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KPSxN184454;
 Thu, 7 Jan 2021 20:35:10 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 35w3g39gc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:35:10 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 107KZ9Ir010984;
 Thu, 7 Jan 2021 20:35:09 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:35:09 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ddceb0db-16f4-4455-9777-5fe10b7c2522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Nd9FgzdDJHVDkvYwI1BHZjOCLONh5hp3MW2VXCsHVvg=;
 b=0IL0ZeeSDJ9DrvNbrr+UCKRgoq+n2Rk4ARshakUOFq9xUl1DbhC/NrPI7pJ0t5SAh7dY
 vnlUqfELcP2aN0rLDigCfPk/zYRIfh3Zo++n6+bT5ScQz9qSEEknJkB7hWKCozaHZklo
 SmPTKoxwM2haxpb47gF4rncXbNfGKSzWaGdyreHNLose8zdvNVapV5ajHq5Kj2ulKYsQ
 E3P6uzM86C9GG1t068bIAKc9OJ9mZ03+PCL4Y9lLdp10Cxv2TM7xH6ANIQpEgFl/ku5Q
 kg4OGK7fE/Sc/EFVRkSkmrwlMWE/IpERYhfw82zmtQcwxPD+l9fkCGeK39yJPzFIhD8q aA== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com
Subject: [PATCH 4/4] tools/libs: Apply MSR policy to a guest
Date: Thu,  7 Jan 2021 15:34:58 -0500
Message-Id: <1610051698-23675-5-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070120

When creating a guest, if ignore_msrs option has been specified,
apply it to guest's MSR policy.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---

 tools/include/xenctrl.h           |   2 +
 tools/libs/guest/Makefile         |   1 +
 tools/libs/guest/xg_msrs_x86.c    | 110 ++++++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_dom.c      |   5 +-
 tools/libs/light/libxl_internal.h |   2 +
 tools/libs/light/libxl_x86.c      |   7 +++
 6 files changed, 125 insertions(+), 2 deletions(-)
 create mode 100644 tools/libs/guest/xg_msrs_x86.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 3796425e1eca..1d6a38e73dcf 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1835,6 +1835,8 @@ int xc_cpuid_apply_policy(xc_interface *xch,
                           const uint32_t *featureset,
                           unsigned int nr_features, bool pae, bool itsc,
                           bool nested_virt, const struct xc_xend_cpuid *xend);
+int xc_msr_apply_policy(xc_interface *xch, uint32_t domid,
+                        unsigned int ignore_msr);
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 1c729040b337..452155ea0385 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -56,6 +56,7 @@ SRCS-y                 += xg_dom_compat_linux.c
 
 SRCS-$(CONFIG_X86)     += xg_dom_x86.c
 SRCS-$(CONFIG_X86)     += xg_cpuid_x86.c
+SRCS-$(CONFIG_X86)     += xg_msrs_x86.c
 SRCS-$(CONFIG_ARM)     += xg_dom_arm.c
 
 ifeq ($(CONFIG_LIBXC_MINIOS),y)
diff --git a/tools/libs/guest/xg_msrs_x86.c b/tools/libs/guest/xg_msrs_x86.c
new file mode 100644
index 000000000000..464ce9292ad8
--- /dev/null
+++ b/tools/libs/guest/xg_msrs_x86.c
@@ -0,0 +1,110 @@
+/******************************************************************************
+ * xc_msrs_x86.c
+ *
+ * Update MSR policy of a domain.
+ *
+ * Copyright (c) 2021, Oracle and/or its affiliates.
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
+#include "xen/lib/x86/msr.h"
+
+
+
+int xc_msr_apply_policy(xc_interface *xch, uint32_t domid, unsigned int ignore_msr)
+{
+    int rc;
+    unsigned int nr_leaves, nr_msrs;
+    xen_msr_entry_t *msrs = NULL;
+    struct msr_policy *p = NULL;
+    xc_dominfo_t di;
+    unsigned int err_leaf, err_subleaf, err_msr;
+
+    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
+         di.domid != domid )
+    {
+        ERROR("Failed to obtain d%d info", domid);
+        rc = -ESRCH;
+        goto out;
+    }
+
+    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain policy info size");
+        rc = -errno;
+        goto out;
+    }
+
+    rc = -ENOMEM;
+    if ( (msrs = calloc(nr_msrs, sizeof(*msrs))) == NULL ||
+         (p = calloc(1, sizeof(*p))) == NULL )
+        goto out;
+
+    /* Get the domain's default policy. */
+    nr_leaves = 0;
+    rc = xc_get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                              : XEN_SYSCTL_cpu_policy_pv_default,
+                                  &nr_leaves, NULL, &nr_msrs, msrs);
+    if ( rc )
+    {
+        PERROR("Failed to obtain %s default policy", di.hvm ? "hvm" : "pv");
+        rc = -errno;
+        goto out;
+    }
+
+    rc = x86_msr_copy_from_buffer(p, msrs, nr_msrs, &err_msr);
+    if ( rc )
+    {
+        ERROR("Failed to deserialise MSR (err msr %#x) (%d = %s)",
+              err_msr, -rc, strerror(-rc));
+        goto out;
+    }
+
+    p->ignore_msrs = ignore_msr;
+
+    rc = x86_msr_copy_to_buffer(p, msrs, &nr_msrs);
+    if ( rc )
+    {
+        ERROR("Failed to serialise MSR (%d = %s)", -rc, strerror(-rc));
+        goto out;
+    }
+
+    nr_leaves = 0;
+    rc = xc_set_domain_cpu_policy(xch, domid, nr_leaves, NULL, nr_msrs, msrs,
+                                  &err_leaf, &err_subleaf, &err_msr);
+    if ( rc )
+    {
+        PERROR("Failed to set d%d's MSR policy (err leaf %#x, subleaf %#x, msr %#x)",
+               domid, err_leaf, err_subleaf, err_msr);
+        rc = -errno;
+    }
+
+out:
+    free(msrs);
+    free(p);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
+
diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
index 19168572fd3e..1f2abf6679d7 100644
--- a/tools/libs/light/libxl_dom.c
+++ b/tools/libs/light/libxl_dom.c
@@ -383,9 +383,10 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
     /* Construct a CPUID policy, but only for brand new domains.  Domains
      * being migrated-in/restored have CPUID handled during the
      * static_data_done() callback. */
-    if (!state->restore)
+    if (!state->restore) {
         libxl__cpuid_legacy(ctx, domid, false, info);
-
+        libxl__msr_policy(ctx, domid, info);
+    }
     return rc;
 }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index c79523ba9248..4f369e6a6f14 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2054,6 +2054,8 @@ _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
 
 _hidden void libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                  libxl_domain_build_info *info);
+_hidden void libxl__msr_policy(libxl_ctx *ctx, uint32_t domid,
+                               libxl_domain_build_info *info);
 
 /* Calls poll() again - useful to check whether a signaled condition
  * is still true.  Cannot fail.  Returns currently-true revents. */
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 86d272999d67..92ec1da77139 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -1,5 +1,6 @@
 #include "libxl_internal.h"
 #include "libxl_arch.h"
+#include "xen/lib/x86/msr.h"
 
 int libxl__arch_domain_prepare_config(libxl__gc *gc,
                                       libxl_domain_config *d_config,
@@ -838,6 +839,12 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
     return rc;
 }
 
+void libxl__msr_policy(libxl_ctx *ctx, uint32_t domid,
+                       libxl_domain_build_info *info)
+{
+    if (info->ignore_msrs != LIBXL_IGNORE_MSRS_NEVER)
+        xc_msr_apply_policy(ctx->xch, domid, info->ignore_msrs);
+}
 
 /*
  * Local variables:
-- 
1.8.3.1


