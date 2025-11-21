Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9CC789BF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168671.1494719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtT-0007WO-Pz; Fri, 21 Nov 2025 11:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168671.1494719; Fri, 21 Nov 2025 11:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtT-0007Rx-Ji; Fri, 21 Nov 2025 11:01:35 +0000
Received: by outflank-mailman (input) for mailman id 1168671;
 Fri, 21 Nov 2025 11:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrN-0008Dv-Pp
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:25 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22466583-c6c9-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 11:59:23 +0100 (CET)
Received: from CH0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:610:b1::13)
 by CY5PR12MB6645.namprd12.prod.outlook.com (2603:10b6:930:42::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:59:17 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::1b) by CH0PR13CA0008.outlook.office365.com
 (2603:10b6:610:b1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 10:59:17 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:17 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:15 -0800
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
X-Inumbo-ID: 22466583-c6c9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkCbCIX2JSHTC0qFgslGT1yCz9+FZvGDqVkH4celR4Le7V3MtKVuC7Yw40NLzJ3BR7bg4hZegtBZM2l9RgyS0aqUBBAmD3f11v/m81X/wl+V+czQA51E7C8WyctZ/uOuY7JCChKEuIc1rbcp1bHyWmKhDXoDsnWB1wAFH16Wy/tiYnjcfsBRUhaoHRxzb4jn9LwXVZZX9duqGz4YmMjbjSpWPkqnFChSXBytXb6VZxHMJUurDe5ReXQB3vAOlSjPnKW2AAIEt5MGJhnC6SO8ADq2yuQ3rdGN9s7kFdosJcV5jIeEgqY4anBPVlcSXff+dHKXMZX+It/4d8Z2kkDbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bok7u4Xk+jAmguRQIjJccc8H+q65eQAsNIZzfh2MqlE=;
 b=hjIrAUnmKTfgGZGb4fLX513VZWTHa2RYbMiWWwGsdRrLHqlb2oDBRpYu5xbwNBd14fndoZVfkm0tlyFz1gtkSnISnZAy5sB/csEamQzAdUvsmxSOKvzG70Gsj9jnagJ3wzFYr/6zy2xUvT115vlvJqt/SFRgUpIjvWbqmrAhl6rNz19XSI/sSk1y4GscXH52dCor/RDBQFzerhi2VAkrLqMB/O1dDeAj2QNRyRLeGigsjzjD6HCTk+FaFfjS/3XJMJ9F9USSQUFyhQibSIOra8XQKsdCHufLTfguXBkYHeSS8JVJGAjuo7qI3oA61tjqqHnGXf/hFTqUDiErw42TDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bok7u4Xk+jAmguRQIjJccc8H+q65eQAsNIZzfh2MqlE=;
 b=N6KaD++mA6MdxZFClLVvvy6Go+cPRAcWhplY6Ih0SnsW9UofK+AGJPx6h9LfvxDXJHDKKHGOGX9Fkdr5INXJ7+6gEpYpbHfpRNkrCqfatuzqJg9tAesqnj6H770o7CM3/oQeBBg1GxP0aBx8F9rK0s0huu61ybqpeZQnBEkxXHk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 18/24] xen/domctl: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:55 +0800
Message-ID: <20251121105801.1251262-19-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|CY5PR12MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: f530720f-1606-4d31-0141-08de28ed0437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?90bMlelL283CidhHjedQ5xMwk11EtBNdvE5uTplqvuYWkW2PhYVNVcfdE+oo?=
 =?us-ascii?Q?IespSUyKVSJRxpe87ajzIx4hisJZmtSRReu1LhmOZfnW4YdA5oVhL5TezymT?=
 =?us-ascii?Q?28joA4TftmAOxJeQkO0YRaOYBxkjHLHs9iv8ubjaHlv9Quv8Ks2OzXx4WGe9?=
 =?us-ascii?Q?+Dd6W0eT5IydQS573S07PLpRNGR36pEWD35hN7+/8QFEAexb5lUcGgSN+t5Z?=
 =?us-ascii?Q?QVKZwbuNwvSnl/fdifLq/DZVGApeX2/L6kly5/5u9EDXqIlzY1x3utRaVxIN?=
 =?us-ascii?Q?9m/9fwJTsFOXBNHSn8YPMmavmt/ldu/BNbTNSiMzF9HcASgdcAqeAStJU8xT?=
 =?us-ascii?Q?ibdSIMrNEP5Ep7manFYIbPQmZDp3uGG/dNktzpZKd+sNt5fHVapo7Z28Dezj?=
 =?us-ascii?Q?OvH9mdp99k+c32zj8dQJYcIhAcZCtmGeBtNoo28OEn5AgFhp/1AyA1YBUCuq?=
 =?us-ascii?Q?ULy7QWq/3B6slCV6oQmetqP4KpMesMNrTlaHyNj9zaVohHXTKpJ7a2KeUIUM?=
 =?us-ascii?Q?cCuZMCu0wKAjsX9Z0hUfxGaduVZKBUPw4PGsDcwB//A6AbzshFKtp+7Eq7TL?=
 =?us-ascii?Q?CSPJEnqkqMIA1oes43Om5wOelUtfzNWiafY5Fmh89pF9uZByh4XDjuDv+tb/?=
 =?us-ascii?Q?e6dN4IP7TyTwCNGqDuYa3LZlF8ZsclQNI+zyo8UF5Mvb491M+MTRnl2kXtid?=
 =?us-ascii?Q?5+/wDvA0iDoVu6wvslIY+4qpIsVSmYZCQTiyYyxKaQC1C2pxmAVfA4/iNocr?=
 =?us-ascii?Q?KtFrz1JxWnBXn2mJRl6Htc1JJ2RVTgiYqKey1GdKTMTZrtorWIiyCGlH55dD?=
 =?us-ascii?Q?aLpr3AXuXSCo5xjMqDUM+Fobh44XzDHgV0Kdqai30sl3IgY/qxC/QzjwTTq0?=
 =?us-ascii?Q?viEk2le0oiiLjGDFnj29XklR2gyrHKjSimEiBm1Fp0Me/dQd4PW5Ia+j2Hox?=
 =?us-ascii?Q?Ae+stMbTSwmpU89o2mz/C9KalnIo90pJzn6cW14JtvIDsdSG2wmvLr4vKxT/?=
 =?us-ascii?Q?loR58yL3ZerYcjqJg48qm/TpSzL0xPtRv5EOz3dD87n9TxTQR/lTnbwvR17u?=
 =?us-ascii?Q?9HPHT7Pig1PJIMsBfQwREAMAQb04GOo6bN5VjRoo9N3LblSBW3q85R+EWRJ3?=
 =?us-ascii?Q?HlMdAFiy0VN75ZStnYJE4H+NaWubkKBi5PNrPI7s71oYkDwN2CLWY6A646vW?=
 =?us-ascii?Q?p3fa331UEpJWILCXyUOjCWDg/woRPthI29YbfkvSstFtbRDUeKUPt3ynG2co?=
 =?us-ascii?Q?GXKYRppacNINSL3sU95HaSBZ7dT/lOw2LXUXdYopg69/UZJvOn6BeJYgE4wL?=
 =?us-ascii?Q?9UoLwwvtNG+dDT4xM2a0klmuXoihnrRuDylgLAFyaj5XI7LyIQ1SAy/+umTp?=
 =?us-ascii?Q?9hP82/0HJaHC/CzDlIcGoTQjksYZU8cLSyYQhKAFmM7IoGCkLV/VLbN853Xy?=
 =?us-ascii?Q?HoRWUdCxvhE0p5qyNRYomRnONpcrepy3wzdoQVOvLcbz7J222uWgytcOwSU7?=
 =?us-ascii?Q?Yf6hWMF+k1UvjQGUWunwKVOo3DrYS/9gpPPCwao9fbUjTado9a8RGR83jXyQ?=
 =?us-ascii?Q?O6d7Ec/eg39sZUR+aeE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:17.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f530720f-1606-4d31-0141-08de28ed0437
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6645

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
index c808c989fc..8368c6ecf0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -191,6 +191,7 @@ config TBOOT
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


