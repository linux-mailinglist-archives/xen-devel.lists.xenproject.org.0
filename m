Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED2BD28FF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142020.1476294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fle-0006K1-FG; Mon, 13 Oct 2025 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142020.1476294; Mon, 13 Oct 2025 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Fld-0006FX-PO; Mon, 13 Oct 2025 10:27:01 +0000
Received: by outflank-mailman (input) for mailman id 1142020;
 Mon, 13 Oct 2025 10:27:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8FcD-0004Rd-KQ
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:17 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca33047a-a81d-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:17:16 +0200 (CEST)
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by CY1PR12MB9584.namprd12.prod.outlook.com (2603:10b6:930:fe::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:17:08 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:130:cafe::ff) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Mon,
 13 Oct 2025 10:17:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:00 -0700
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
X-Inumbo-ID: ca33047a-a81d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktoi5nDnnTlbfzdRseF0AMao2mcBDvnHPCT4QXJZkZufDEYFxKJpmxS+3rP3bEG+RbnmjgU+kF+xgyjvzeqDhXgMsqMplXJUsJ/YbV/N0QzucJXmDLm7iOG7yj+xksPjotWj5PftcG1Y22Xx8ukQCrBFPEwLoHqDRViUcYUwHgJAl4DDCtdYZFTfRNNQqKHNFbTRBhxtseDBJKpji6Glp9tcmL8LtoVMFm1jv9jpKpp8u/4ldZVtnAaTZTr9nFIZjsXOQLwxXo2KJ+RuKQ3Pn3Me/R26mrjZfJHvBqTfu5tm7llnmCTJecqXFtuyoY5cIHSc7oQYu3ifjWRzwjvk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KspG00dL/uTSTckav1aVO2+7yDsgTFfRaMoKgya74ho=;
 b=D05SzqYpCDAEkU1AYhDJhdk/t4TNMe9UJs7mxy0gPedo73DKNkGuUrhILlsoW2bHsBZyHBg6cX200mcsjPy4VWgzgBkw7wcWSQrlT9NyaEJsRCcZX72TBJCY62xq6CzlNKvtuPVVIcfYwhTqSDIN3q3kroTFNCJiVNlNrpgygRAaXl2ofgWt6qpZ4JfQpM0Yqw+TieqhW3zaT0TBiemNpILGe8JmGOmUCAS39gSCsv30pXHNERhzlCE2ogA0N1I9pqKYKJZ9V6ET39FJouG0t75c5a/zpGj52uqo7MFX0eZoUIheED3BnqxjTawSVmIZLfvGLxr4Wmo0v7pBKy275w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KspG00dL/uTSTckav1aVO2+7yDsgTFfRaMoKgya74ho=;
 b=3kpQF41ma9QpCGinQkQfj2SUQot+ORaR8mOpCDVniDXQyrT/ZrpW5cahe7GMM2SHTJFIacSAXJ5dSeA7NP+jLV7uik7YtqLsTby6s0Fmoc57Y3A0hM9ssf6/XiD5/DjmWz6qMiIQdWqbdsCu6NZHsGB0d6KrpHaoWWKmp3rf2ek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Christopher Clark
	<christopher.w.clark@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 13/28] xen/domctl: wrap domain_soft_reset() with CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:25 +0800
Message-ID: <20251013101540.3502842-14-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013101540.3502842-1-Penny.Zheng@amd.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CY1PR12MB9584:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c30853-9f6c-49d8-4ae3-08de0a41aa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5SVYWqj3Lgb55uQIPjs1Xsieucs38cY6PJGF+qSRHCzE2OqAbmQCQtdlsnCq?=
 =?us-ascii?Q?F6PpWtXRhwqxHRapefS/SsaUHUMAZ3qV3MndUchW8zuzJ3wWcK1FTmac5T9o?=
 =?us-ascii?Q?ySY7fTC9fVkTsE+nRSLENf33FWfq3TO8VhxwOwOtSqlPWEaVbDxmeJCO5T/o?=
 =?us-ascii?Q?lS+W04UGBKqDFzMD2+jecvd5j0mq4bjCQ+FqhwNeT2UqRVqp0Ba+3bA122mI?=
 =?us-ascii?Q?M+xbKKQKuN3C/WrJwkTD8tTUCnnuM29EHH9w5Wp+8RX1xzeBysAaBT29HMMa?=
 =?us-ascii?Q?gXyq/l7DWg1WWHmfgShjGFSvVbFuegXZkrHBPBNVww1csXjS/p563VksrnL7?=
 =?us-ascii?Q?Efj3YvyPmOuAm407tVY73nT053PbXNUwEjuyMlcqcBCmDFLfumM4aRroWRpJ?=
 =?us-ascii?Q?G1ciqVMOxivcNq6Svtg3oOweSTkERHEBpUTh6ox9QYnKhbHo49a900N1klQ5?=
 =?us-ascii?Q?Md7Q67RMEQecx6fRtrMSEUPT+vJ1RtnzlXo5+q/jMNKrjXBk2Nf+4wZ1iopP?=
 =?us-ascii?Q?0DV7a/khmzFxmhRbVgj5CP71e7FT+5w6ClWpBc92LsLmD5Walh0+3lzAl8y2?=
 =?us-ascii?Q?BHLU3KJCVidt5Tr+74LSsDU0SLIF9UNGqDpFbbMqaUuvgJqfWPkdOClhcEOs?=
 =?us-ascii?Q?h1VvBHWXwnjbEe0AEPbvMpaBnHtyg2OaHsZ5Iq3gN9kOcbts4KMQcXjeHHVU?=
 =?us-ascii?Q?aEo7tA1Gx4GU+hFlsHZAiKPYlQDm+e0hCWEQHaBT0smCiWrE/rLGnP8vVm4K?=
 =?us-ascii?Q?X8coZnl+dCNGPUvG8puiMtQAG94x0Jt2YKzDEI+rxez2qKbq5l5JvzcrQOjl?=
 =?us-ascii?Q?H5TUf7ulCN27a0w6bzl7moxmDtujy8lXTwrhLy7yBi2C7/FMBDQxkXqkiFUN?=
 =?us-ascii?Q?RLFitWkX8yy6uAZDWloepZ1AI1noLn6Iox3qoSfLbLSzJLAKq4yF3VN1gTh/?=
 =?us-ascii?Q?/8gxPYdaF3QTIZOxGguTypizyiQxpoQfEgjOtYPR5qtxrH+GvSelqb6H2UAn?=
 =?us-ascii?Q?871uMf31syEA36D15MiJA5RbZNtOaZto0/HtKkcSEbuAOgAIhc+Gmxdf6l5b?=
 =?us-ascii?Q?p38pO5m4RJ15nzyykcRIsgF2XeDqSBTYyU+r+V4PIuKM8qYnn3f+JcRG1xAd?=
 =?us-ascii?Q?CLsJva6jzEk9cjZKXVGLfF7ecipHWMqxvTlxWjpw92FYDb6tD/LFsNmKWFBQ?=
 =?us-ascii?Q?n6HVp1XEX3tkmVmmGxDoA5cO9Ygq/NPUlIwDlGk9zCKj61+LdQwY7q3wOYdd?=
 =?us-ascii?Q?Mup/cs0wqojrpOFUXMfvyiqlqhJyvrXwIsTjfeSfIctfPR7G2hm7KHjjvntQ?=
 =?us-ascii?Q?whUnO5IFyIIY39MoobSFFlxpyGDsI9rDCN7c9v8cN1NrgacKMmpjR2U8tAfL?=
 =?us-ascii?Q?AIvdz/22Nbc1jhrbZRUb1Q1yE2/7QmJ34VyRvziJb0vWD8v9ODLwEzOIxKqK?=
 =?us-ascii?Q?XJR1OxbwAyxg6jEZd+8QvCkV4ptJ0vJySdrx4akzE2Yjz38cqlKiCdHxOz2z?=
 =?us-ascii?Q?dv30RdmaFxKjCKHJTTIEtxoXrzfzs7UjH03xMOf3sUEKr5neZP3ihpn8FVkv?=
 =?us-ascii?Q?1d8UOZEBrqzn3u64nZI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:07.9367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c30853-9f6c-49d8-4ae3-08de0a41aa51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9584

Function domain_soft_reset() is responsible for domain soft reset domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
Tracking its calling chain, and the following functions shall also be wrapped
with CONFIG_MGMT_HYPERCALLS:
- grant_table_warn_active_grants()
- argo_soft_reset()
- arch_domain_soft_reset()
Otherwise they will become unreachable when MGMT_HYPERCALLS=n and hence
violating Misra rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- remove unnessary wrapping in stub.c
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
- wrap XEN_DOMCTL_soft_reset-case transiently
---
v2 -> v3:
- add back stub wrapping for ppc/riscv
- remove transient wrapping around XEN_DOMCTL_soft_reset-case
- address "violating Misra rule 2.1" in commit message
---
 xen/arch/arm/domain.c    | 2 ++
 xen/arch/ppc/stubs.c     | 2 ++
 xen/arch/riscv/stubs.c   | 2 ++
 xen/arch/x86/domain.c    | 2 ++
 xen/common/argo.c        | 2 ++
 xen/common/domain.c      | 2 ++
 xen/common/grant_table.c | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index e36719bce4..948ca35e19 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -875,10 +875,12 @@ void arch_domain_unpause(struct domain *d)
 {
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     return -ENOSYS;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index bdaf474c5c..ecaffe0d2e 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -214,10 +214,12 @@ void arch_domain_unpause(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index a74e56843c..291c8a23e8 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -188,10 +188,12 @@ void arch_domain_unpause(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88..5b3c5e8caf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1030,6 +1030,7 @@ void arch_domain_unpause(struct domain *d)
         viridian_time_domain_thaw(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int arch_domain_soft_reset(struct domain *d)
 {
     struct page_info *page = virt_to_page(d->shared_info), *new_page;
@@ -1131,6 +1132,7 @@ int arch_domain_soft_reset(struct domain *d)
 
     return ret;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void arch_domain_creation_finished(struct domain *d)
 {
diff --git a/xen/common/argo.c b/xen/common/argo.c
index cbe8911a43..a451546d57 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2351,6 +2351,7 @@ argo_destroy(struct domain *d)
     write_unlock(&L1_global_argo_rwlock);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void
 argo_soft_reset(struct domain *d)
 {
@@ -2374,3 +2375,4 @@ argo_soft_reset(struct domain *d)
 
     write_unlock(&L1_global_argo_rwlock);
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 976172c7d3..678e81b400 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1689,6 +1689,7 @@ void domain_unpause_except_self(struct domain *d)
         domain_unpause(d);
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 int domain_soft_reset(struct domain *d, bool resuming)
 {
     struct vcpu *v;
@@ -1726,6 +1727,7 @@ int domain_soft_reset(struct domain *d, bool resuming)
 
     return rc;
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int vcpu_reset(struct vcpu *v)
 {
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..24ef1205c9 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3962,6 +3962,7 @@ int gnttab_release_mappings(struct domain *d)
     return 0;
 }
 
+#ifdef CONFIG_MGMT_HYPERCALLS
 void grant_table_warn_active_grants(struct domain *d)
 {
     struct grant_table *gt = d->grant_table;
@@ -4006,6 +4007,7 @@ void grant_table_warn_active_grants(struct domain *d)
 
 #undef WARN_GRANT_MAX
 }
+#endif /* CONFIG_MGMT_HYPERCALLS */
 
 void
 grant_table_destroy(
-- 
2.34.1


