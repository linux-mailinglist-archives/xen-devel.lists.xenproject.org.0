Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D883FA7104A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 07:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927090.1329919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJp1-0006mv-Ft; Wed, 26 Mar 2025 06:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927090.1329919; Wed, 26 Mar 2025 06:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txJp1-0006kq-CF; Wed, 26 Mar 2025 06:01:03 +0000
Received: by outflank-mailman (input) for mailman id 927090;
 Wed, 26 Mar 2025 06:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txJiQ-0008HQ-KQ
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 05:54:14 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2412::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd294f7f-0a06-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 06:54:12 +0100 (CET)
Received: from MW4P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::32)
 by CY8PR12MB8363.namprd12.prod.outlook.com (2603:10b6:930:7a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 05:54:08 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:303:115:cafe::24) by MW4P220CA0027.outlook.office365.com
 (2603:10b6:303:115::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 05:54:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 05:54:07 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Mar 2025 00:54:04 -0500
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
X-Inumbo-ID: bd294f7f-0a06-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHLXg3q/yNGN4jx2CJFDrP4BVSdIYc64w4lJ3979yONSbUb/4rEDcAXgfyVMJsOhgKJuNGDPv0RRTbE0VkMC4Vb0yjYtkFCwzpzyqyT1IUWClh2eaWbBo1qSNeMZw8ii4f2wHbKJufQlf3JA3GaWZB40+OC5Yz3vDuzKiJBOD+8KTO+XPApy9Ik8J0N1yRWcHjo3yLg8jjDqI0+adTE3qEeVH++Opl4f5rxojpQKATlW6WEyOCulZGYWMwfrO3yDtGaYUM1nPiXvOsfz2OuaYKHm9g7M/4/y5PFvitXTVK91f81X7PCwgHPnr18/ucrW01zIYo0XrsIobDCJmVr11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqCQBy/NPdR47E/oqD+gJgPZnc9PR5ehQnPBjBa07EM=;
 b=Ebav8g3iqP6K2Z+Ko4/LZtP/SeRe+/TXkgqG6nYArkV/Y5tJ6Ws4AMKHHnfdV62RmMeAwPsw0+5dy9plr7Ka6TNCjgKgUYk5D+/IViBsl2nRa/Reww6/XHOohPOqymCvyjkl7/UfjJjM7cAZT4bffn86I4M2yq7cYuQ8po4pyqf6JKa8oqEP9/4BHe4YE3D2RkEKiJ1xnxTjXjNc2XqyDvFWUMyPUo0p0Dx5QcQ7Gz5Ejmx9YF2vfxERheOpT1fBxH0IVTfPMDTKCL4NT8bjmGe4tA3zZ6liK9A4KBVebBeHcqr+BGWJhfrdfwS3Ag0v2EjxsLsiNG540op/Jfr0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqCQBy/NPdR47E/oqD+gJgPZnc9PR5ehQnPBjBa07EM=;
 b=B4Utn5DFDvs/LO2zpLMb80WZoQmRg95zarxuHGIOTD0nPTRVMAP94Tafd61VSEO7hj7VSUrTrt5lndt4V9UkktN5FYhsh71+Kq4S36RTwzdLpqahsyiP1U2CBivn5dba1YGTZtCbndq+NAOfE+o6PlxS+gpIJoAXIvRYA0fFSyM=
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
Subject: [PATCH v2 16/19] xen/sysctl: make CONFIG_COVERAGE depend on CONFIG_SYSCTL
Date: Wed, 26 Mar 2025 13:50:50 +0800
Message-ID: <20250326055053.3313146-17-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250326055053.3313146-1-Penny.Zheng@amd.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|CY8PR12MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e683c2d-66a2-45c6-a7f8-08dd6c2a9f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HNHQlFrHA51tKR9JgbDtSu0m45QIJ3TXezgJ9i+ClB5eg9KZuepTfMKo5hwg?=
 =?us-ascii?Q?M+boYcwV4FrhwR8zSzPY/uGpzKLcH+yBkERb6BjMYcQAhonLrMZBWIF7tuOA?=
 =?us-ascii?Q?pO6B82FfK02OZWB+jamaaRwBwvSikGQv8vr3jPIKb2IyEPXzHQ0HGC0bZBTD?=
 =?us-ascii?Q?qWsibGZY8iYjVMbZrQsf86SPSamtLX2XAOjVJFoCh3QXkvMHnZODCx+6MubO?=
 =?us-ascii?Q?D6v7/b2VcANb/M0M4CG9oHRgdw215tMZzPSq6AnM+WgmlCPJnL8CdMBSJyGt?=
 =?us-ascii?Q?8Kiiqu9Zi8dXeMVw02Gfj82FrDVymgEdFVAoisZNbT1J56GMnFwkA4iGRwzy?=
 =?us-ascii?Q?abgndeIJo6GKIEELvPnNKxa0vuj2dqs/fG1B5s9UW2TA7YPvPxOMpxUWyCw7?=
 =?us-ascii?Q?duudVj2y5BhQT/a5ZL0KdohGr3CLlSSvB80KRJw7svxURNEhj2h/oxCim2Nc?=
 =?us-ascii?Q?bqc6+YGGBpw30QImEXMrH1ZxBL+5PChtwNvoibxYu4P2NkFQvHdQsQDDqLnd?=
 =?us-ascii?Q?WSSgZssJtyv51UiP8U6F9ZFI1r4FcAuTniCFK/+fMpVh8W7MyIwKG00yHdpq?=
 =?us-ascii?Q?X5StiJmzzJsn5dAtofaKJbJU9zSPNvb1jNnJAzHHpkth60G1WlRawqLDrFUO?=
 =?us-ascii?Q?23x1pJf1HBQsqM0z28Mn92I75xCFJ9GxCCNl4O4i0vc9V4A6m8rmOCjsh+LZ?=
 =?us-ascii?Q?az9WOqADCTvHo9GoiUyz/grDm36iNcNnyZqomoIhL7MiDGjsG5MHvc9aTzri?=
 =?us-ascii?Q?dOgB3yOPKvtDYvMPx9s/0DeI1sfSG4Aitx3FtfGG3093SfjhLZ7djjzlkush?=
 =?us-ascii?Q?XsGPnPp51emJ/HvgNSfUQEwRiKoVi2ssZd9ZunC7EpsPB8Hqr6bUO5OXV3RQ?=
 =?us-ascii?Q?+X2A/q1iRBcx/54qK4RIYvvn0en6JOCKYGvYaVrwpTaPK+Zeylk/qtsKlG5s?=
 =?us-ascii?Q?ADXpemEpQoXZidVPD1cTKTXlC+Zn6MctBPbz37+SlBzGa6NAsZNIEPS40oSA?=
 =?us-ascii?Q?bByj/jQXmkZGj3l2wzRvKkbGIUWcPAejQiwMaw3vbeE2zOGSza4Osryka6N7?=
 =?us-ascii?Q?o/EEIJa4yNselJqQIQ/b2qpyKWacDWScFsXnqMxcap6oUCsO1wp/M8iDjruJ?=
 =?us-ascii?Q?9cs+LIhytl//niugGIMxSHgtw8Qayfnb3gv8LAg+QK7NK4ledQVfyp2zOD36?=
 =?us-ascii?Q?s6JAvl9roBXbzM8yuAFMw969e7OJ8SYUAsa81dQjlzflm8tb1YfF2Fyco7B0?=
 =?us-ascii?Q?jEzAGXdRLSyjbimq3L/3JLYq7mBZPgUwM7EaqlyEdm7+W3wI5KVgHyg9TeS6?=
 =?us-ascii?Q?417CTvzHbQ2YSQsEe1lEklePz3Mb4KAJLX3L5j+rgr+70x02kEY/mrK1n/ik?=
 =?us-ascii?Q?n5TIR5eCLng/aJwsav9aMUf10E1G6hbMOVAUI5lo0kOpXNVAeZo076ykTq1M?=
 =?us-ascii?Q?im2pAkXfKEO9EAvQRCWCwAjeTskVty7QYYbQ8iXyGtDpARg/sWAXliSqh/2U?=
 =?us-ascii?Q?+GrKo3xARh69p2E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 05:54:07.2230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e683c2d-66a2-45c6-a7f8-08dd6c2a9f4e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8363

All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
so this commit makes CONFIG_COVERAGE depend on CONFIG_SYSCTL.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1 -> v2:
- commit message refactor
---
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


