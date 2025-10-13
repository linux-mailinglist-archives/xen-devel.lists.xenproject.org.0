Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645BBD28F9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142010.1476267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlZ-0005Pj-Tl; Mon, 13 Oct 2025 10:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142010.1476267; Mon, 13 Oct 2025 10:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FlZ-0005Mh-LK; Mon, 13 Oct 2025 10:26:57 +0000
Received: by outflank-mailman (input) for mailman id 1142010;
 Mon, 13 Oct 2025 10:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL+L=4W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v8Fcc-0004Hi-L5
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:17:42 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d98b2b52-a81d-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:17:41 +0200 (CEST)
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by DM4PR12MB7621.namprd12.prod.outlook.com (2603:10b6:8:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 10:17:37 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::92) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Mon,
 13 Oct 2025 10:17:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 10:17:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 13 Oct 2025 03:17:34 -0700
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
X-Inumbo-ID: d98b2b52-a81d-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ2gXsa75XYomjU3Yi8GFNMekrFsw3HewXctVnwPdnos8I4qb8+3adi5wFXBl/iLXPx3+v0Pi6Zm6lwxWXrW3ikc6NUo0NcsuCs9Dm6wZMF6fiWjrvOpFgk+4fbUzR+E0A4c+wqfPWZFNUUti79i39uFaLTreKN/++reDpxAxRACnSAzO+RTThxOXB7XkHQyRLdFsOYJVua9cXLrM4g/W1nwxgqI94jmmc811NKBTS0CXRBiHwU4TWLD2q6gMOrqlhTfEl5BnQsAhgcXQYzmGb9JppDj4hTCM7GDOMRWoCdu7jwYGL6IvWmpidGA7tXFRnGa8o2dVDUjt+oxzGO99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQ8meT+JhGxwEETbHE/iPNj73Aytz7+DEMOJq422ey4=;
 b=AmrPS8/1DaeG1kwXP/uYbwUvgr2MDrqscBvC4UKTYK0ZhQgcKolLu8NXm1Fxd1Z9xBO+ITyEg9AcN3dSA8+kRe7ymvFH/dok6srINbHt/EbmiK4PyDoYLiuUsCh13w+6MK54M73IemdsNYKX0VG8TpoL6qY+e+sB3qDWt4zj/noGKCJDhVEnzNK4eUEhqYlWzKPPsg09CSi+ijJ6l+1oJOG/Wsw70a0L8ouAUJCqa/8ZMNLzo6m/SmXN06zcnxF7WEb/bOvBStW6MaajubRP/WP3jjTUY/kan+Y+LL557j7E3reMDPG3pI5BnRbjNIwMrQH7XOcHFPLJWzKUSc/P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQ8meT+JhGxwEETbHE/iPNj73Aytz7+DEMOJq422ey4=;
 b=T/9bEOJsoNyvjOE6N/2B6GtFK13llOOuW+G6NEY+zw4rtKaadTlB/C1kqJ4g0hNEK1Wo1Foa+NVIJo2ypMDGxM9hCql+MKHicUZ386R1hqNU6iitQYK0O8utNVKTTKs06GCtMC4/sbtTU+WuTHpTOohcy6skmykKIJRldp+mwT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <oleksii.kurochko@gmail.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 24/28] xen/domctl: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
Date: Mon, 13 Oct 2025 18:15:36 +0800
Message-ID: <20251013101540.3502842-25-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DM4PR12MB7621:EE_
X-MS-Office365-Filtering-Correlation-Id: b598fbf8-17ff-4ee8-d5d6-08de0a41bb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9tgLuiR1iSisWsIT5hgHuq045Yf3pDVoResna01sQqTOX6Defy/3vZ2px++z?=
 =?us-ascii?Q?GKC/ad/wa5FUQ6yrSLIYrWHMa6tTxPtxbZh3yBUaNLeFe98vS9HK9u+OLI2S?=
 =?us-ascii?Q?LMPPAZGXIAgLJV7AU9UH9pDnwaRpU1ilL5e41B+k4sBwEhUUXc1ruOGV7xtF?=
 =?us-ascii?Q?PDbOA31W7ofKqDn/2z7f7DejUgntSkt13jq7w6cWgMJeZp5u0x1H23K8Hlud?=
 =?us-ascii?Q?FGYvo7oczep0bNchfm+wwbF4D+F8qvQJ60xZpGqYqcO/MRlMM5ECSXeQfKER?=
 =?us-ascii?Q?4WnSO+luYZB6uDEaUwDc3pvYTV+eyKy63Bpq9oenRWHntaKr5Z9dUYlBCQE8?=
 =?us-ascii?Q?69Ht0I4pBr+47lUuFyYhrf6ENIKhBgzIpc/rZtkKPhOFyNU4XvTlTYsMAQCN?=
 =?us-ascii?Q?Mivlw1fbal+SSrwtUMJ+GtmrOC2YNhpF6a8DdD9Vn5jqnlcDFUNPLDa2e+tY?=
 =?us-ascii?Q?hsXm0nt+2c9hJ2V77rDigi/97wnmKFxob1e8zhroF01Dw3kacxqkw6jqAHaB?=
 =?us-ascii?Q?PsT05ulXJdwfBU7LzryDmye4ZOpd/0EEcRbT/INXcaDNls+nE+tP3XfvjtlF?=
 =?us-ascii?Q?YETpP9clG/5xYR6UJoomSdlk6YrZc943XXedBGoU8YY4ADpxtIgKbGiVccxd?=
 =?us-ascii?Q?36q9kxhJwCLHB0ioT07Ki2mVMUChvOZXBLkndBf4BTuo0mGn5PYFzy0gjHr8?=
 =?us-ascii?Q?h8XLHPRjoo2eL26iVPinnGtavpk+7v8tJuYdFktGRBTj02lepPTfhIel7E0e?=
 =?us-ascii?Q?0n23mjUE9ZV+EALsqOUoz2L9gZy0XxNA2hqlPiXLnecCK37Lal7XvAjlJ3DL?=
 =?us-ascii?Q?XynY2XVYU2Rex8kCv1A3frDV8pStcjKlzoBGjXvbmXdb+XLjfYYCRpWlnNvS?=
 =?us-ascii?Q?gNUfITiXzjdjVPMP6YvnSVnEBUZAPnMJPL4f4SLBBzEhdOzkmabG3JDVLKi2?=
 =?us-ascii?Q?T4u7jhLUyn4glqUYPFDCaSMzoLll21VsNiCA5C+I3/L2c5FBBuybTFiG/IzV?=
 =?us-ascii?Q?kVT5gS8mONVJMzHHwtIXgji8xiTRlYOMkz+rVNDs1vlRGYL/8S388gvaAmgT?=
 =?us-ascii?Q?a+kRSmBxY8fDTEwiLNkt3uERU5IWrYlZV9H7QOxr6cXyw4jlSqjYIgn2uc76?=
 =?us-ascii?Q?/b0GX2ricwEtiMHzG0UtEw3v453NkbSurwxkmfJZzS7vDBOR21S9GeAgXDWT?=
 =?us-ascii?Q?CemxAhoAjrych/M9A7A+hLUmw2m/8k7rVFueLWNHKA+19Qtw4ufEciBa+lpU?=
 =?us-ascii?Q?kOLZwbqawZibqnZkL4zmAr4pfdKlZPwXwPdUpWMfNectp/kbWrMdzYzZy0ef?=
 =?us-ascii?Q?x/enEpN3NSc/4FDSAjM5ytG7N4QfSJ1RxX2J6jTdAWfQsgnK8R5rB3/GPdt7?=
 =?us-ascii?Q?Gr0pWV6jSDjvi+JFKGCNDV+VzDQ+Gma0lDbJXS56wJEG50Rd7iK79eVDeVax?=
 =?us-ascii?Q?hs4sjRUqueTPrP1rFls1dbyW9K4H/APodkbRMX+IhtWgK4MvCi7N8CcrH/Gf?=
 =?us-ascii?Q?6BvTKeHzjdkfqU63jYBBPlxr53x+7+x/oL9AdyLe6Rg2z7frHe0jtQYCd4Q3?=
 =?us-ascii?Q?nc8NCQhFPAZVAGi0r04=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:17:36.8214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b598fbf8-17ff-4ee8-d5d6-08de0a41bb88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7621

Users control/monitor Intel Platform Shared Resource (PSR) through
related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
MGMT_HYPERCALLS. With this change, we could remove MGMT_HYPERCALLS-wrapping
in psr.c.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/arch/x86/Kconfig |  1 +
 xen/arch/x86/psr.c   | 18 ------------------
 2 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 3f0f3a0f3a..21da8c1a69 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -190,6 +190,7 @@ config TBOOT
 config X86_PSR
 	bool "Platform Shared Resource support" if EXPERT
 	default INTEL
+	depends on MGMT_HYPERCALLS
 	help
 	  Support of Platform Shared Resource technology, which is basis for
 	  monitoring and control of resources like cache and memory bandwidth.
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 80ce5804b4..4f2c2d0042 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -135,11 +135,9 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
-#ifdef CONFIG_MGMT_HYPERCALLS
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
-#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -422,7 +420,6 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -435,7 +432,6 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -448,14 +444,11 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -467,7 +460,6 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -483,9 +475,7 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = l3_cdp_get_feat_info,
-#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -501,14 +491,11 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = cat_get_feat_info,
-#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -523,7 +510,6 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -561,9 +547,7 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
-#ifdef CONFIG_MGMT_HYPERCALLS
     .get_feat_info = mba_get_feat_info,
-#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -826,7 +810,6 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
-#ifdef CONFIG_MGMT_HYPERCALLS
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -858,7 +841,6 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
-#endif /* CONFIG_MGMT_HYPERCALLS */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
-- 
2.34.1


