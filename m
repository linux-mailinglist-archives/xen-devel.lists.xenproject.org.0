Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50B2EE6FD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 21:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63101.112040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc0B-0002U5-Ju; Thu, 07 Jan 2021 20:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63101.112040; Thu, 07 Jan 2021 20:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxc0B-0002TJ-ER; Thu, 07 Jan 2021 20:35:23 +0000
Received: by outflank-mailman (input) for mailman id 63101;
 Thu, 07 Jan 2021 20:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2pyT=GK=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1kxc0A-0002Nv-H6
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 20:35:22 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 046297dd-aae7-4367-bbc6-18123069346c;
 Thu, 07 Jan 2021 20:35:13 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KZ0FY043493;
 Thu, 7 Jan 2021 20:35:10 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 35wcuxxk16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 20:35:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107KYTNd084995;
 Thu, 7 Jan 2021 20:35:10 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 35w3qu7dqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 20:35:09 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107KZ8Yu030852;
 Thu, 7 Jan 2021 20:35:08 GMT
Received: from ovs104.us.oracle.com (/10.149.224.204)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 20:35:08 +0000
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
X-Inumbo-ID: 046297dd-aae7-4367-bbc6-18123069346c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Bhn1XpcYtMjdOpy5EowmGrcJmomV82yzTHtsIJQu40A=;
 b=LNkPhjN/1mKq6dcW9CcPaSO7HXu8CtViKdQ9RgoO9FhFnEGnTw5eCvYCvQFCFsbnyfRs
 /r2JBsJleBpbknC1KwZxNnOoech2/uVnR6mGHBMmSFIBdHQBah+Ut6kVvLlUSm0PKJ8l
 wIThNXauAPWMMUbmN6SVilTI2e4dT06Sqyq/YBeMt5rKtR7yG+JJW+Mk5wC97XT+PhzB
 0liLoxp78FJvIaL/Nh2kMb9yng0xeUK0N03gFDk3KxZI3Oc/iKW8I8ABt8WOcYljoHR0
 BbwBUSPU5L6zGh4AN+4hFT1o1pgJjFGjiZ2N8LZLYKhWel9Dxg3rCkXL9MjEjgJbGWuA ew== 
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrvsky@oracle.com
Subject: [PATCH 3/4] x86: Allow non-faulting accesses to non-emulated MSRs if policy permits this
Date: Thu,  7 Jan 2021 15:34:57 -0500
Message-Id: <1610051698-23675-4-git-send-email-boris.ostrovsky@oracle.com>
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

Starting with commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")
accesses to unhandled MSRs result in #GP sent to the guest. This caused a
regression for Solaris who tries to acccess MSR_RAPL_POWER_UNIT and (unlike,
for example, Linux) does not catch exceptions when accessing MSRs that
potentially may not be present.

Instead of special-casing RAPL registers we decide what to do when any
non-emulated MSR is accessed based on ignore_msrs field of msr_policy.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---

 xen/arch/x86/hvm/svm/svm.c     | 10 ++++------
 xen/arch/x86/hvm/vmx/vmx.c     | 10 ++++------
 xen/arch/x86/msr.c             | 20 ++++++++++++++++++++
 xen/arch/x86/pv/emul-priv-op.c |  8 ++++----
 xen/include/asm-x86/msr.h      |  3 ++-
 5 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b819897a4a9f..c9a93448f071 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1965,8 +1965,8 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         break;
 
     default:
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
-        goto gpf;
+        if ( guest_unhandled_msr(v, msr, msr_content, false) )
+            goto gpf;
     }
 
     HVM_DBG_LOG(DBG_LEVEL_MSR, "returns: ecx=%x, msr_value=%"PRIx64,
@@ -2151,10 +2151,8 @@ static int svm_msr_write_intercept(unsigned int msr, uint64_t msr_content)
         break;
 
     default:
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 msr, msr_content);
-        goto gpf;
+        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
+            goto gpf;
     }
 
     return X86EMUL_OKAY;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 2d4475ee3de2..34524c7a6f00 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3017,8 +3017,8 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
             break;
         }
 
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
-        goto gp_fault;
+        if ( guest_unhandled_msr(curr, msr, msr_content, false) )
+            goto gp_fault;
     }
 
 done:
@@ -3319,10 +3319,8 @@ static int vmx_msr_write_intercept(unsigned int msr, uint64_t msr_content)
              is_last_branch_msr(msr) )
             break;
 
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 msr, msr_content);
-        goto gp_fault;
+        if ( guest_unhandled_msr(v, msr, &msr_content, true) )
+            goto gp_fault;
     }
 
     return X86EMUL_OKAY;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index be8e36386250..e624fc8694bf 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -164,6 +164,26 @@ int init_vcpu_msr_policy(struct vcpu *v)
     return 0;
 }
 
+/* Returns true if policy requires #GP to the guest. */
+bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr,
+                         uint64_t *val, bool is_write)
+{
+    const struct msr_policy *mp = v->domain->arch.msr;
+
+    if ( unlikely(mp->ignore_msrs != MSR_UNHANDLED_NEVER) && !is_write )
+        *val = 0;
+
+    if ( likely(mp->ignore_msrs != MSR_UNHANDLED_SILENT) ) {
+        if ( is_write )
+            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
+                    " unimplemented\n", msr, *val);
+        else
+            gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", msr);
+    }
+
+    return (mp->ignore_msrs == MSR_UNHANDLED_NEVER);
+}
+
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 {
     const struct vcpu *curr = current;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index dbceed8a05fd..96d90eb30adc 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -984,7 +984,8 @@ static int read_msr(unsigned int reg, uint64_t *val,
         }
         /* fall through */
     default:
-        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
+        if ( !guest_unhandled_msr(curr, reg, val, false) )
+            return X86EMUL_OKAY;
         break;
 
     normal:
@@ -1146,9 +1147,8 @@ static int write_msr(unsigned int reg, uint64_t val,
         }
         /* fall through */
     default:
-        gdprintk(XENLOG_WARNING,
-                 "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
-                 reg, val);
+        if ( !guest_unhandled_msr(curr, reg, &val, true) )
+            return X86EMUL_OKAY;
         break;
 
     invalid:
diff --git a/xen/include/asm-x86/msr.h b/xen/include/asm-x86/msr.h
index 16f95e734428..43a48e1a50ce 100644
--- a/xen/include/asm-x86/msr.h
+++ b/xen/include/asm-x86/msr.h
@@ -345,5 +345,6 @@ int init_vcpu_msr_policy(struct vcpu *v);
  */
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
 int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
-
+bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr,
+                         uint64_t *val, bool is_write);
 #endif /* __ASM_MSR_H */
-- 
1.8.3.1


