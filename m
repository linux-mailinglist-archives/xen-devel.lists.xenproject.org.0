Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A779EA94D6A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961167.1352795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmp-0006L6-9j; Mon, 21 Apr 2025 07:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961167.1352795; Mon, 21 Apr 2025 07:41:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6lmp-0006Ih-6L; Mon, 21 Apr 2025 07:41:51 +0000
Received: by outflank-mailman (input) for mailman id 961167;
 Mon, 21 Apr 2025 07:41:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljk-0007m8-A9
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:40 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2414::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a340b8fe-1e83-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 09:38:38 +0200 (CEST)
Received: from BN9PR03CA0234.namprd03.prod.outlook.com (2603:10b6:408:f8::29)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 07:38:35 +0000
Received: from BN2PEPF000055DF.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::d5) by BN9PR03CA0234.outlook.office365.com
 (2603:10b6:408:f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 07:38:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DF.mail.protection.outlook.com (10.167.245.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Mon, 21 Apr 2025 07:38:34 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:38:32 -0500
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
X-Inumbo-ID: a340b8fe-1e83-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtT4ELWSd9huXwW75KTVR22+C9q+hRzjGCeuP0PPXbMSrUz4894wXOosK4OM0SXP6gscuH7t2EWDkl0s1h+SZ12C4UBciHiouH5WZtt/whojNyBUT8ZL9i0lDaDAR9vj4O5xu1mzmFjrDXh6pWJw7xJFRreeCc22Ik4dhwNcx49SQ6P7Sjf9M0pyetslrTPal2Jo4Fu6r9vibHgD69FAhg71wRCfneK+KguZ0VODzR1c2Czu7z927/7tJUieobxwoVGSF2fQtB5XQbNaqFrVnGszw8I1bU2+kbp9CGIm1uI8HMJeRBjrNP0exn5CnUieWwIrEOBpGppKFUqQAfc8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0coEvbNIv0VbAslUDsH+eGX4i+dWXPk3ASTSHLtwxU=;
 b=ZMvjQzFTa+3anupjl4L0gmJdS5xib1cdPvTppcYkVZgwYe9YTea62ImPgfred1P6xHvH/rBPuXduageU2PkBoDmIcfWtufW7WfJ8sbQyIVw7JnG5GjwhbVnLqw9fG5PujfRTnOpx61+FRVKsof1m3oWp7D4saIoNtDDodvjW/vV0lu2tGRJw7qLBuU/1WN/Ky8XKnH5Buih5rmHPpC4fF5IsV4bWp6zHtF2Dz9doKWRybpnfNGzwPmw8XSRX+Ff0yfgUVBhY3VgUNOtieCQPqONUfNnJQ4mM3h/+sIGx9tjZCznQAXokPH7hnWoU4iiMKgCsIGHuw4zgfVxG0o9a0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0coEvbNIv0VbAslUDsH+eGX4i+dWXPk3ASTSHLtwxU=;
 b=A1adtXLTpQoco4iOPG7qbS96gGlV6V7slmSlqFh6ZU+KN4uoGg81Wut+AmgWB5wP3ZhEcn1h/WPTTuiPkooj0+nqyRpHLeiks3vQMRKKlxylaikCflSAH9UMeNywZWBNIfjeqc5HQSknv9XOkdIsGUy6JMA1dOUBh5o3yhB53Os=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 17/20] xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:20 +0800
Message-ID: <20250421073723.3863060-18-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DF:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: bae1f005-c9db-4fc0-48fa-08dd80a785ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIRb7Zw8xY2tI+P34Zf+sblaMMMqUv2Zy3FgaCT6PoyhuZDj3HRocMRDhZ7d?=
 =?us-ascii?Q?18nHDVNwA6wUFwihoCeSE6TWsDAWiBI6MLCrVMoYrQXg5Oc4Wy89LKk0nlJN?=
 =?us-ascii?Q?dX0PFUgB2Lunr6htLmXnTiLrQWxBOvMGYaIfnhYP8KbJy0KrYuu8eq+wPYaM?=
 =?us-ascii?Q?6jN3lGX0Yn1PMSqVbT/YruA6a0yI3m53pQvWL0sM3Ejg9b5R53yqaaZlRYyk?=
 =?us-ascii?Q?m+8cbDFUA4gmPviRvQUXgPvECqC6c0BCmmYGZcMxY6qg/ykqyQgcZKoTNiff?=
 =?us-ascii?Q?XnTTg8u2toDarb5g0EyiwTUhA9LlzltSGJVKE+fITthS2Xo81N6IKE2dcEUY?=
 =?us-ascii?Q?Bf2aPOdb9r5O47PCFRZFfrlly218kjWsuagv+WYRYrwi14c/t4O7AweghKPv?=
 =?us-ascii?Q?jqTC1zcsR5VWB3QdKd2kC33kAbKAPOpP6FUVzDWR1++gtDM5nchONJFEFQ0Y?=
 =?us-ascii?Q?sJ/E/78/yzw3lbrNY2QCHx00sZjDXIHEl3SwgzPHxh0Wvt5q/Vh4GuF4o//c?=
 =?us-ascii?Q?lsvxM8TW+parSztcIz+TZs08QzuV+62KZYWH4a0UgUxiPRogCmtXomfcY7n/?=
 =?us-ascii?Q?psKtT5HYeND5no6CT9Pq78owJRxSBA1+z5xAPwH9qybE/S1C1pb8e43b/s9m?=
 =?us-ascii?Q?LzZXC3h0pI454vOIbc+XRS0tCn2Uv5/j3OogPBBmJ2Urd22X4numkEDXTxrM?=
 =?us-ascii?Q?HegYQXJzhqnR0oKgsITe1Og6sPuBblg4jFByhZH9kmV302QoB2S8LWAHMr+R?=
 =?us-ascii?Q?r2fHLmS5Dqa0QBpEoS9Np+Fj7XG0IZ80fv4KDiIk8uVBvnfJZINx+sLj8d8a?=
 =?us-ascii?Q?5bqSjT68zG9trLpZc/HTzSK4lsJxXebqnQpOuSZTDRRBJOU1RV2sjJG84CwU?=
 =?us-ascii?Q?+2Ccww4ZzSNxuj/tcHimFVhdLqcKQLE9iHyX7qtEtYhum5So7tTEN4khD0Nq?=
 =?us-ascii?Q?Cdt4ECP15KMBp+oL6QLoQ/dKFSPkZoRX4p+6VK+MgrrTjXAkVF2Xs6OYDSDg?=
 =?us-ascii?Q?xPjVCAEv41953A7aRHtNZPKMlVVd62pt9UNpdTAgGmUyaZ1aiSWsba4Nnwf7?=
 =?us-ascii?Q?2ajBkhiQ6hCdnn98y9ybV7SLrn0Y5ptLh4S+M/T7QPZnNwbQlBZUmJRxH3cd?=
 =?us-ascii?Q?B761yolIG6h6sGL3bC/JElB/gDEO1jnU6XToEtt5/xDivlY2edLL4YVWFk/j?=
 =?us-ascii?Q?GsH6j4H2ysuoRNycBF3LddNor3L/aqrGS6X93ei3NHmFwXWda0NWpYSxBinS?=
 =?us-ascii?Q?6TWoTBHRVDeKYumDJjFjB1KmHxTbeqZgvvz6T3597m71M6Ohdsyu6/LjBUwF?=
 =?us-ascii?Q?XahHkkNon4AWvXVNKebMcU9+/JmYmEnBw4esYxEwZxObMPifb96fVDKHibO6?=
 =?us-ascii?Q?PDfjIv9Psreq3A3OyjZ0nT63Tl+ZlKStA38znon9OQ9PuFbF3ToTkOgJSIfl?=
 =?us-ascii?Q?Z1IYSgeKnoBr5yPG4GiraX2vjvLeiGqxzZ6psZ/kbUfcSlWuWHNSRmXZx2Sz?=
 =?us-ascii?Q?HzdDIVduUpH/tnvfjZX/Pt9DNOjdi+drVHJC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:38:34.8574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae1f005-c9db-4fc0-48fa-08dd80a785ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DF.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362

All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
so this commit makes CONFIG_COVERAGE depend on CONFIG_SYSCTL.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
 xen/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index f7cc5ffaab..84d26b3f46 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -37,7 +37,7 @@ config SELF_TESTS
 
 config COVERAGE
 	bool "Code coverage support"
-	depends on !LIVEPATCH
+	depends on !LIVEPATCH && SYSCTL
 	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
 	help
 	  Enable code coverage support.
-- 
2.34.1


