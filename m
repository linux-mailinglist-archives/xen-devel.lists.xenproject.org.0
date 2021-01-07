Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913542EE6FF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63099.112027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc07-0002Pv-3y; Thu, 07 Jan 2021 20:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63099.112027; Thu, 07 Jan 2021 20:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc06-0002PV-UB; Thu, 07 Jan 2021 20:35:18 +0000
Received: by outflank-mailman (input) for mailman id 63099;
 Thu, 07 Jan 2021 20:35:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc05-0002Nv-Gz
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:35:17 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc58d9c1-b043-48ec-8ac7-10de9cae0e9a;
 Thu, 07 Jan 2021 20:35:12 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZ0FX043493;
 Thu, 7 Jan 2021 20:35:09 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35wcuxxk13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:35:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KYSkl084920;
 Thu, 7 Jan 2021 20:35:09 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35w3qu7dqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:35:08 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107KZ7Be030848;
 Thu, 7 Jan 2021 20:35:07 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:35:07 +0000
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
X-Inumbo-ID: dc58d9c1-b043-48ec-8ac7-10de9cae0e9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=e5kvjTNHNZ5bZzwKzEgSd2kZPMSBlSOmboG8wtJ3sfg=;
 b=cN4Dx+o3/OP0VaT3D9MWwzuLuQMBERnsYuO0VksUB1jyDZ8v8z5N8Vts54r8gzw7ph0k
 h8/u39QXHtgTIhFbJXLH50WvxmniWdq7qhBzRobOCXbFgk0RSHsB7+0JbAYM6eK63EEc
 zbIy22RYAgXfeycoZ3wR8HR+U0fsuoq1yOOhHX9omSd+Ncpbz5eWXdh2ocLZi4QOmBy7
 iJf8WcRj6Icuso+Ncxr7eXce8ZpOrrPpa/Oup+XwhCgiUhLxgEyDNbNFDJ76914FfISN
 piv4nl4f4xkFyoI9htnL8HGH/aIA6dtVrqRPL7/BOBYRIuWp4Aot8ogCmMR9I5PjJ1ww EQ== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com
Subject: [PATCH 2/4] x86: Introduce MSR_UNHANDLED
Date: Thu,  7 Jan 2021 15:34:56 -0500
Message-Id: <1610051698-23675-3-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070120

When toolstack updates MSR policy, this MSR offset (which is an invalid
MSR index) is used to indicate hypervisor behavior when a guest accesses
an MSR which is not explicitly emulated.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 xen/include/xen/lib/x86/msr.h | 17 ++++++++++++++++-
 xen/lib/x86/msr.c             | 16 +++++++++-------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/lib/x86/msr.h b/xen/include/xen/lib/x86/msr.h
index 48ba4a59c036..7911ae31eb48 100644
--- a/xen/include/xen/lib/x86/msr.h
+++ b/xen/include/xen/lib/x86/msr.h
@@ -2,8 +2,21 @@
 #ifndef XEN_LIB_X86_MSR_H
 #define XEN_LIB_X86_MSR_H
 
+/*
+ * Behavior on accesses to MSRs that are not handled by emulation:
+ *  0 = return #GP, warning emitted
+ *  1 = read as 0, writes are dropped, no warning
+ *  2 = read as 0, writes are dropped, warning emitted
+ */
+#define MSR_UNHANDLED_NEVER     0
+#define MSR_UNHANDLED_SILENT    1
+#define MSR_UNHANDLED_VERBOSE   2
+
+/* MSR that is not explicitly processed by emulation */
+#define MSR_UNHANDLED -1
+
 /* Maximum number of MSRs written when serialising msr_policy. */
-#define MSR_MAX_SERIALISED_ENTRIES 2
+#define MSR_MAX_SERIALISED_ENTRIES 3
 
 /* MSR policy object for shared per-domain MSRs */
 struct msr_policy
@@ -45,6 +58,8 @@ struct msr_policy
             bool taa_no:1;
         };
     } arch_caps;
+
+    uint8_t ignore_msrs;
 };
 
 #ifdef __XEN__
diff --git a/xen/lib/x86/msr.c b/xen/lib/x86/msr.c
index 7d71e92a380a..cf53768dfa4e 100644
--- a/xen/lib/x86/msr.c
+++ b/xen/lib/x86/msr.c
@@ -6,11 +6,11 @@
  * Copy a single MSR into the provided msr_entry_buffer_t buffer, performing a
  * boundary check against the buffer size.
  */
-static int copy_msr_to_buffer(uint32_t idx, uint64_t val,
+static int copy_msr_to_buffer(uint32_t idx, uint64_t val, uint32_t flags,
                               msr_entry_buffer_t msrs,
                               uint32_t *curr_entry, const uint32_t nr_entries)
 {
-    const xen_msr_entry_t ent = { .idx = idx, .val = val };
+    const xen_msr_entry_t ent = { .idx = idx, .val = val, .flags = flags };
 
     if ( *curr_entry == nr_entries )
         return -ENOBUFS;
@@ -29,17 +29,18 @@ int x86_msr_copy_to_buffer(const struct msr_policy *p,
     const uint32_t nr_entries = *nr_entries_p;
     uint32_t curr_entry = 0;
 
-#define COPY_MSR(idx, val)                                      \
+#define COPY_MSR(idx, val, flags)                                      \
     ({                                                          \
         int ret;                                                \
                                                                 \
         if ( (ret = copy_msr_to_buffer(                         \
-                  idx, val, msrs, &curr_entry, nr_entries)) )   \
+                  idx, val, flags, msrs, &curr_entry, nr_entries)) )   \
             return ret;                                         \
     })
 
-    COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw);
-    COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw);
+    COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw, 0);
+    COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw, 0);
+    COPY_MSR(MSR_UNHANDLED, 0, p->ignore_msrs);
 
 #undef COPY_MSR
 
@@ -77,7 +78,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
         if ( copy_from_buffer_offset(&data, msrs, i, 1) )
             return -EFAULT;
 
-        if ( data.flags ) /* .flags MBZ */
+        if ( data.idx != MSR_UNHANDLED && data.flags )
         {
             rc = -EINVAL;
             goto err;
@@ -101,6 +102,7 @@ int x86_msr_copy_from_buffer(struct msr_policy *p,
 
         case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
         case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
+        case MSR_UNHANDLED:           p->ignore_msrs = data.flags & 0xff;       break;
 
 #undef ASSIGN
 
-- 
1.8.3.1


