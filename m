Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F2CB50FA8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117574.1463658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQ6-0006EP-O6; Wed, 10 Sep 2025 07:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117574.1463658; Wed, 10 Sep 2025 07:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQ6-0006Ch-LJ; Wed, 10 Sep 2025 07:39:10 +0000
Received: by outflank-mailman (input) for mailman id 1117574;
 Wed, 10 Sep 2025 07:39:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQ4-0005yt-GW
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b29f9b7-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:07 +0200 (CEST)
Received: from SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::27)
 by CH2PR12MB9544.namprd12.prod.outlook.com (2603:10b6:610:280::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:03 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::60) by SJ0P220CA0017.outlook.office365.com
 (2603:10b6:a03:41b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:38:58 -0700
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
X-Inumbo-ID: 3b29f9b7-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjYAtNysZXPnxXPZywMkxtpRWtfpd0NwvpyfkkblJm1e59WLAj2246pYtPCzq5JFp39U54cpe3mnAjL7t2Y2jj+Y9arDj8vYaEMVDMoJBk5PRkF68ujK7tecqR22xz6tUp+3gvA/xMbto4KdDXXX5swevDphnG1eQAMdudMj2xSmAb2QVcNeTOM2jgfdsEFW6FFzEqL9O18+mNBhBcOdnnbTJQ7+9yVEGgakNtT6MZeHDQx9Fn5JWfzqcL/0Tztxq79m+YrgWtbsHOzxsanZ3erQ7dEL6pgyyb3MziswfCi1A7N/9BtN5O5tsv52TWu/8EaTVRCDNY7Yq1Nc+LSnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxOcHOXvmIbr0QEYbINptXR3BM3f6TIv8bBEhB3MSPE=;
 b=K1hjXjn5Ga2XHPikBmzNn+vjOkL0V6r49xymlNlLHa/rExtLmz9rVlCr6VREfyBsEFLIp/dVZ8vWi+G1qxKsPo6j2OJzMqViKXW3ytP7Q5RH8iRUEigFse2as7dpfz5UGpuNrw8V/+FghSw0TQgHFb3AO9vzog83iZgeaRSTtrfvvjs7E1U/QGFnfFZTM/SKcXLwsbVmnT/7X0XQurQmOAWrBmlj5IbsvhdnxXkcpYkHCAtB9N7nIUn0yx4Q634MSgAwAhKlmwCRsjPmk/4kbCk6Bfj6n51pbjUZ0yHW8liKe6iVrLMFjPY6/CnXX9h/DN3YpiZUnp4WQBpZetVzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxOcHOXvmIbr0QEYbINptXR3BM3f6TIv8bBEhB3MSPE=;
 b=G6oMCg++PlJB6Rd0kHxqX4agvhUXF9o26MSDdbEXyKXA+l6Ykt9E+aXcouZaeyI0ZIW8wmTlWrKRyKqpjrj1z61/qMM95aXUtJmZOwSELYa0p/XHgqY/3F9/OaZBgYnV4InWKpX6V2wAAn9wvxwolNT1rIlnZoKFvBsKBnVNTzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 01/26] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Date: Wed, 10 Sep 2025 15:38:02 +0800
Message-ID: <20250910073827.3622177-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CH2PR12MB9544:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b828ef-62d5-4e73-9dec-08ddf03d1d54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lRcMgvABeNNSS2kzOiQqAFxZsOU80Lms3fMDKFzLs8n1XXULDq3vlLz1L10w?=
 =?us-ascii?Q?Pso4n9h6GceDPmRuPjCQXHGwa3TLHJ9dLrge0spr1jzeC+yMK2pvs7j43piy?=
 =?us-ascii?Q?9m6kSBdu9OorssHsKcu0gizxqywA/+2D+KmIgKaiVxTIvEjaGUXF1S2o+0g7?=
 =?us-ascii?Q?aFacyBLcHQ5PuJ8f1lC/pzcE6ZZCDrtPhGAiWrrdEBh8Pp8mKxS9VUMnNKNd?=
 =?us-ascii?Q?OWMK7QRdeAVh1WRr/rBFx41BGpDWJJP9K3mJjOmBAKinwr1z4ashoSGhc9WY?=
 =?us-ascii?Q?hE91x/mUGA7uR7hCrMMf7WbGqcu6eZ//OIC53RVmhxeHyPm7kyx9KqMqtkbI?=
 =?us-ascii?Q?1rRliw6p6OenpUYNtGSiOMbz75+4zlJICunGwSgtNBLrbCdYQJp+xEEmenAf?=
 =?us-ascii?Q?1er0JD9VDGV3RrRB7b8EpEFIMBar0ulGDdfSf8k/l/pR2RfhZyYYQ9VLXMOi?=
 =?us-ascii?Q?Md2Y+5fJzU1TuCfXZTM5avEuqHpUmoP/foIs2fNqbZvhEyC+aCC9krY/230F?=
 =?us-ascii?Q?9nlM6KZjm7uwLEwNwIpl4h0WgspXgFp44EfXvAqZRm8bH6oaV5sOI+ggrkfr?=
 =?us-ascii?Q?7nMedc8rRVNc44WtbnIENyp8n9s/Ndt1n/uvpeZlHDY58E3311r7NnT2eBwY?=
 =?us-ascii?Q?GEV5tX48neYqKU29W57nhf+r/9e57x6qS104Uos2hJMRH8AJyf6x4cUNKGLt?=
 =?us-ascii?Q?KfcWs0ToPny9AWtR4HcNx1eGRglbNB5dUOZnB7VKKQgA4njYFd+vfIT9pz7B?=
 =?us-ascii?Q?5wuKmqmH2+hRj4/131I3AKaNVtDNKMHBsoXWx0CMiOuwUnQI/wO6JL1jX4PN?=
 =?us-ascii?Q?Q5WeBO+5Lk74cVZRviTFpePVslr3bfHsG6YFCRdwYw0rJ/SEDAeLMQ7KlJSy?=
 =?us-ascii?Q?h+XwJApY2ahxkyddzcCdJ/wFFOUvOKEeS1SQJ75PvB9926i5P04WqQGVx0qc?=
 =?us-ascii?Q?DMhQWozoGi8WCIFV351E4+lEwiQPo291LOHeSKdpI6juX+zIHd24GK2vBR38?=
 =?us-ascii?Q?iivnPNGayNCY2NlnKQ5UT13R5mFt3CpJwvHURAIPi4e+VRaZh6xLliMTM0xL?=
 =?us-ascii?Q?FSpta82ZhbuHP6ERD3XRAeLfFb2I3al//aQkvFKPviGMoaikL/mg3mDJD8oC?=
 =?us-ascii?Q?d4FsguwB/F9BREYDxpGT15Do7EFSHxAV30OaG7jd5lKAfJtecDSaLTSQNT9d?=
 =?us-ascii?Q?YSiPEvzp7Lnqlmgptku3ZNaE5I1GscGCXzlJG877n9EthVVo8LZknd17TOH9?=
 =?us-ascii?Q?LDY4YF0GCc+EL9h1Hwjsb3gFpN07Vxy9pgdgxfG1ghUgn8ENbbsBGUfuFsjl?=
 =?us-ascii?Q?R3YKO1zziwiK7PuqAnDsI1ybF5xlfnGLAgeCkKP4Uh5KJKp+WRdfJPWub4ab?=
 =?us-ascii?Q?Ikl2amTrP7igYbeE/dX1pDDeBMr2e4iWSzSBXEr/piIwBxNPO9+VnJGXXffz?=
 =?us-ascii?Q?frP2zuGPDrq5wYFnnfiBPgMRTLSlOCHkvxoswxKIDGf2TAmdiuKK51IpOmmk?=
 =?us-ascii?Q?ONHu8sKYB07xv2GGXaDhHglyLaJZ3VkYAPnH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:03.1589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b828ef-62d5-4e73-9dec-08ddf03d1d54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9544

In order to fix CI error of a randconfig picking both PV_SHIM_EXCLUSIVE=y and
HVM=y results in hvm.c being built, but domctl.c not being built, which leaves
a few functions, like domctl_lock_acquire/release() undefined, causing linking
to fail.
To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE Makefile
/hypercall-defs section, with this adjustment, we also need to release
redundant vnuma_destroy() stub definition from PV_SHIM_EXCLUSIVE guardian,
to not break compilation
Above change will leave dead code in the shim binary temporarily and will be
fixed with the introduction of "wrap domctl-op with CONFIG_MGMT_HYPERCALLS".

Fixes: 568f806cba4c ("xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove paging_domctl hypercall-defs
---
 xen/arch/x86/Makefile        | 2 +-
 xen/common/Makefile          | 5 +----
 xen/include/hypercall-defs.c | 4 +---
 xen/include/xen/domain.h     | 4 ----
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index d7aed7d92c..84a83839d6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -28,6 +28,7 @@ obj-y += delay.o
 obj-y += desc.o
 obj-bin-y += dmi_scan.init.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-bin-y += dom0_build.init.o
 obj-y += domain_page.o
 obj-y += e820.o
@@ -79,7 +80,6 @@ obj-y += vm_event.o
 obj-y += xstate.o
 
 ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
 endif
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 0c7d0f5d46..be442a3e47 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
 obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
+obj-y += domctl.o
 obj-y += domid.o
 obj-y += event_2l.o
 obj-y += event_channel.o
@@ -70,10 +71,6 @@ obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo un
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
-ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
-obj-y += domctl.o
-endif
-
 extra-y := symbols-dummy.o
 
 obj-$(CONFIG_COVERAGE) += coverage/
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 8370b4b289..221dc25f6f 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -200,8 +200,8 @@ sysctl(xen_sysctl_t *u_sysctl)
 #if defined(CONFIG_X86) && defined(CONFIG_PAGING)
 paging_domctl_cont(xen_domctl_t *u_domctl)
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl(xen_domctl_t *u_domctl)
+#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 platform_op(xen_platform_op_t *u_xenpf_op)
 #endif
 #ifdef CONFIG_HVM
@@ -280,9 +280,7 @@ hvm_op                             do       do       do       do       do
 #ifdef CONFIG_SYSCTL
 sysctl                             do       do       do       do       do
 #endif
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 domctl                             do       do       do       do       do
-#endif
 #ifdef CONFIG_KEXEC
 kexec_op                           compat   do       -        -        -
 #endif
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93..11d2505420 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -185,11 +185,7 @@ struct vnuma_info {
     struct xen_vmemrange *vmemrange;
 };
 
-#ifndef CONFIG_PV_SHIM_EXCLUSIVE
 void vnuma_destroy(struct vnuma_info *vnuma);
-#else
-static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
-#endif
 
 extern bool vmtrace_available;
 
-- 
2.34.1


