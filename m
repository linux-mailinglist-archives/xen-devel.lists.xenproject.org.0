Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F8DB50FDA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:46:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117673.1463779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWr-00052g-JL; Wed, 10 Sep 2025 07:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117673.1463779; Wed, 10 Sep 2025 07:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFWr-0004z2-Da; Wed, 10 Sep 2025 07:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1117673;
 Wed, 10 Sep 2025 07:46:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFR4-0005yt-N5
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:40:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60d28b3f-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:40:09 +0200 (CEST)
Received: from SA1P222CA0050.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::25)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:40:05 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::e6) by SA1P222CA0050.outlook.office365.com
 (2603:10b6:806:2d0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:40:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:40:05 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:59 -0700
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
X-Inumbo-ID: 60d28b3f-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRICTrNU67ZZpg+NMZAoAEAty63a7dMpNWSparigDqIak/bGRTuMFmtBZADeIYeP9xoknkWhGufme7DFQQrA7nbJJDniNDl80CqX6pgPCYFS0S03ERjsZWtvaWtZGdLVKK32Yu6D9K0fpXt09bNFDEu9Uv4PEw5XFFY6u4Eb4Kz7zO2At0lLvAR6q3qBUKFr46Fgmk+z62MgpLuzKdxO3wlX0RV2KQy0BiCszYeUO7CVF3Cfjp4srjgnLZaoILUDUcQO89OvAiZ6iQ4/0lw2QmGXB4yqQzaNAie2qlrjO3zgeoTe7XYtqOblFGcjncdMathPq60Nx5NmH1g5L6/BJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tKDNAZvqvuPmF10rFrm9o444l6QmZ2SjcvG0/5ayxc=;
 b=WZV6A6I1IFfZC6biKICiGX8FS8RrZoUDNY59OgPAWAsGwgdjN8bgSUs1MOkb8vwJc7DZ5vkZprYwNur6/YEa5yJZvxTF6SSdlLCkVb144N9U3vyr3O5wth4kcTuPd7xfXIoCyCZkD6Rl7J3aS3aihKTEhWyOB+dtTYi4Kd7nFLaytFBg1l4v6bpPgzMzegi3miNmfEibWwaFGCtdQQ0/H4mgSjXqTLbcTTN4TfJaIXDS/qb5nWvnKODp7NCaVmzuI+ODVmApZLc92n4i3P6NQi7XUcogTOboDQC/MNMSsoOlW4xinxxg42JQmI2ZzRQUffrEqZ37yyjKTx8IyWEgMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tKDNAZvqvuPmF10rFrm9o444l6QmZ2SjcvG0/5ayxc=;
 b=s0iZflX9s3YyVO20yYjbrYOgX8GXitBswvZzPDZvykYxD5s4W6pWnH0duK1DrFNK5BDqm3KWsIPeq9r7tW3yTg2XkiRV0BZA8H61ShHox2y8vIOUs9a9PrBqzxKJgNzBYpxsB1tJqZU6eoWlHCAiRRKeVJWI5Uo9K9xdymR/2lk=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 23/26] xen/x86: make CONFIG_X86_PSR depend on CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:24 +0800
Message-ID: <20250910073827.3622177-24-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c214b1f-f8a1-4d6a-7ff2-08ddf03d4262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IfSMDZiEiwg+FaFrka9ZjgB2LTHGlltIkvQVALxlCJH4Tm7rtkdeyUlrktKB?=
 =?us-ascii?Q?v6Mi1zFiJIIU5hR9QYIPOzScUcN1obqRJFxzTJJIcCLO1fsrkxvnzucIWaAm?=
 =?us-ascii?Q?3aT4K7//oj+gMzMbR8UAwX4SR98UMHs/CcX3DUPJ9+9jwRWbCn4tu/XqShcB?=
 =?us-ascii?Q?+NtyirfjshJTMG9vCgNGnuvzBL1n41aLQArOo1rgFxZMuOgUxcxtNqpf1i2k?=
 =?us-ascii?Q?WPUk11QP53MHGKCMFJzj5SvNUN45sInqylVNDXNKtIGCfS27grLCM65fMhjo?=
 =?us-ascii?Q?MqeBu2HIpzx4wruUmsCpYzzrQj915xi+Ls9jCVReZ/+JxE0q3IQ9+gLbeayq?=
 =?us-ascii?Q?DBmjqrzICRtEEYWaCvEBeu9JY2oBCzEMpoqIHoq2KpCCxoF8Vy6bmr4Wz/zq?=
 =?us-ascii?Q?la6PvTu5h7nI4mK2wW786HxUSicXg2QuMzkCYj9J+9TzJ6Eqsy6QDBFsA5hV?=
 =?us-ascii?Q?OY0Pg3s5JAteK17uG0HwwmcQMcAXWVn3YmvhYsqpfQsbzjjUvu6j1j0Qyw53?=
 =?us-ascii?Q?NyVhbqWKZHvLX0rDnqZoBaUKu04/zWsah6k4L+l3V7DGjRU/Ve6WQjCHunhq?=
 =?us-ascii?Q?tYCC+qM0ZkW2gUAVcUGKsWZzkiwHeCIujRa2eKKqX5c3TwqZ2DD+guVQVUC4?=
 =?us-ascii?Q?B09EFfTFD51OpAXhGM9cNOH3CHrRT/iW1v+0Irsi5R3ttzshn5HL0sz0OZgw?=
 =?us-ascii?Q?LrY34IZKeGOFQ1hh+zhKRpNT5s/1q5rjo7DB4GzbdEKyLCF10hAcfUfuQ4eG?=
 =?us-ascii?Q?DFXNadw2pD4+3wwXSL7i/n47z666Uca9erj2IpuXNX1WsBuGNe/zp5IC6nUh?=
 =?us-ascii?Q?jzgnGR50BY+Ns3LcTlg7cHY5YKj8c6tkZZxvvEsA8DdeJX4+bR2rUSXXuo2p?=
 =?us-ascii?Q?9WqPMNcJht0rJ7aR17ak5sopVGjJxhkUKYuNDkUFH3z7p1pcYyqt9FzbLfi3?=
 =?us-ascii?Q?olIH+KRZJHSj+UtRTAGgbXAfeO3Gb3Ey4RIVYX+Af0JxyWm99TRgOAZDu04+?=
 =?us-ascii?Q?b1l6gyaqHth08oenAdM1bIrg7L3XSmumB8pGl4yOug5d4dBn9zokPo/ub1DE?=
 =?us-ascii?Q?A4mZu0CX3Su7SujlxTEpEj2or+3ygDlsOv7lMw03tm08Y/BJwHC9ynUOWmcR?=
 =?us-ascii?Q?vrg3UxgaVczfLsl3ba/EFVL99qAELTigICUIiu4t0OcvW76WG52BM8w9Xb/S?=
 =?us-ascii?Q?b1TfllTjnsg/jyvPc+KZhTxEQhgp7/htXOKdbo7lAujE3eCzTbXPk329lARU?=
 =?us-ascii?Q?38QrJ/8FmQMiPdHLLEH49DVYZTcydd9RVpikbF6n0ZE48T704U0DHLGK8iab?=
 =?us-ascii?Q?OtOhnDDIwxBCFhnrylBSx6o6klhCRQKXb/NH0bgeLP3+QpZ0WBdSB5csCAEw?=
 =?us-ascii?Q?M+9Cwbn9siAINKkYIwUv+fcTotlEp1g9ifWQME9uGH2EcSTBGj+QiFzzZAp+?=
 =?us-ascii?Q?zTZpEp8emWRU/vK8pNMQfw/UShmM59xPoU+9jSSiAdXvku7P6zFlLU4Ij2wn?=
 =?us-ascii?Q?cB0vqpDL9dE71ILyOOc4CbH7hxKZMpXv1SAW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:40:05.3309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c214b1f-f8a1-4d6a-7ff2-08ddf03d4262
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115

Users control/monitor Intel Platform Shared Resource (PSR) through
related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
MGMT_HYPERCALLS. With this change, we could remove MGMT_HYPERCALLS-wrapping
in psr.c

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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


