Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A161B079FE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 17:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045369.1415475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4AM-00027y-8z; Wed, 16 Jul 2025 15:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045369.1415475; Wed, 16 Jul 2025 15:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4AM-00025p-5I; Wed, 16 Jul 2025 15:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1045369;
 Wed, 16 Jul 2025 15:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPeD=Z5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uc4AK-00025i-1O
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 15:35:28 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2407::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d84b8d6-625a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 17:35:25 +0200 (CEST)
Received: from SJ0PR03CA0052.namprd03.prod.outlook.com (2603:10b6:a03:33e::27)
 by BL4PR12MB9483.namprd12.prod.outlook.com (2603:10b6:208:590::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 15:35:20 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::b8) by SJ0PR03CA0052.outlook.office365.com
 (2603:10b6:a03:33e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Wed,
 16 Jul 2025 15:35:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 15:35:18 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 10:35:16 -0500
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
X-Inumbo-ID: 7d84b8d6-625a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNpPw33hOtbk8cLRERNESLMl2UYMk/UB68if9Q5vm/MgTUVDQsl/wMklV/X2asT7TWUAg6DDtObh814Ww0UnOj2b1HawLvUbBr0IfL0QHMHWIVxGyNdB2D25YhLhHUysFKNpt5msMEH8BPYo8djVz+Xxed70Ee5WBsOu7gijP3d6HpEgwUJXYyEVINT1844IIRStp/ggTYzDJAHgzc7/A8HveTj+k/SV2ME4EkZSW7GowMW18RNAjjOA5tn4UUtAcIBcKmTKLscf9tuQXZvmwEF+mN2QmGovPEeZT3kCl4uauw+TTSjE7IWEhtjBaPx89Ip10aT2+YztdHh0zDkR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOOgjRjVvWALzMEUCF6yHM2u41pWj/oQq+0JZzCzfG0=;
 b=IVrjcxPvjHob5fbz9RexHV0jadYDLNLIarYmI5ofqQamjetqDXuR9xcxDNrNcrIAZlVuBTTcOg+M1IcEttANtQeTU7goQLV3ZoZ9ZlpJ2VtLf3c+G5AyDDegHQjaXJd/ZlAr49aAw8PFbLA3I/005MQrmCe4IEasgh9DJynJTB3u+pDzO6gMcC0nITZ7WzZ0lc2CDnYS7safuahI3DOnIdq2TNCoF18vqi2hRQ0JEFpNWvNYmugbB0Byn0fQdZlL8cgcnY4QoZdD/gT0tcciP5iq7fiPR54DyeHEWyUCJmXMdrqJNWHOecl3smVjNn0YqpYP6N6TEL3AOdCvFV7u7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOOgjRjVvWALzMEUCF6yHM2u41pWj/oQq+0JZzCzfG0=;
 b=C7bAu2KISMCuC0RxcBMnlw9YATFJ0roPNGfxsq+bhVAEeQ5TQka4X1eDyS6lAQU+5bWM+Vyjtv/3JdDibwEz/JxdpgnHtxRlAbduuG+HE0FZsF539nCAoFRgftfGr8jGl0fxRCD3k4noRs1bYaxm7Bjw7jPv9j2GhyaWMFh6CYA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] dom0less: Fix LLC coloring when mixing colored and non-colored domains
Date: Wed, 16 Jul 2025 17:35:03 +0200
Message-ID: <20250716153504.77542-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|BL4PR12MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1230bf-feef-4905-f7e7-08ddc47e5e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1elQeyMDL4rgG3hGGAI4WfFIvQrUO3hval7ESwdzO+q+oO1/G9KOTAJBx8YM?=
 =?us-ascii?Q?DHxrn8BK3SyAvl2kn/0mLsqxolX33atIz4Hg0X83EWI+OzxLP9lSgSCZeFhk?=
 =?us-ascii?Q?80CtVTofOjDDu168NKcCUlpyL+uMHSoqoZHUskI4Gl8pB33+P3hNMENZ3CyH?=
 =?us-ascii?Q?6BXksF8gstme2uYv2DH5dfnwfc/AEiwQ1+JcOa6OIFB0knRy9Gd3iXllPlam?=
 =?us-ascii?Q?oSxBt2UTGX6IQQJBQZc5k2Of+Ie2QgOuToPB2LWk/ttJg3bXQsvGIGip+WK/?=
 =?us-ascii?Q?+ajt6nr3yorOb4d7WMFF1BqeeRubEcm6d1m3hAvz3d9ZTQPQ9NXItXFGmlQD?=
 =?us-ascii?Q?LrqcqRY23VA06N4gRh9xjEbx+oevP86LQSOSOaO6LvOgpLu49q6x0WXa5/qE?=
 =?us-ascii?Q?VClYiZDp0KP0xBwbtz5iT49QWtk5F86HH0xf8kO4QgJTlpn1XCpltKMpUEQo?=
 =?us-ascii?Q?FtIjqTAKRP37qudbbg4SD5pEhIj8INJyM2Ju+CTlNOjT08z7ozIKr/2/dvks?=
 =?us-ascii?Q?yt1VpNEzEaTqQmK0JDcR3aGGcx6ecf3QNEM2nc8OXc3EOKONmv3UG1Wrkh1f?=
 =?us-ascii?Q?z01SLT+ntTAIH2MSILzz7AkjeWOehqEuVMYO1SNstthJfD72XeI++K9NOHOo?=
 =?us-ascii?Q?rHwWrnEFtU5nbvfCGpmY+uLvOej8ny7Qzgs9cwTAWkzi05Jx1yCyphTTSulX?=
 =?us-ascii?Q?Ks5rtBJaZ72QpDLOV37AWlz8x8CXWeh39kgLpufaMPsYw11Po1GeIhX/cZYg?=
 =?us-ascii?Q?JoZ+Q5kPFGXCgJno+CmZxWU+GBF3Awxc2I13MpP2oBptET43KkaYf6KxXvQm?=
 =?us-ascii?Q?P+tAWTdOFU+9EoguqxtFvvHqsQDzs0B3hlPKCtOCrsGYBzw11O6Ba2Hgm4m4?=
 =?us-ascii?Q?D9E7Ab22rDfI1yUhAcZW3MUWGFnGWonh/THCoYwT2txbPgv/Eh9Ti5cWcB3a?=
 =?us-ascii?Q?AIA3FUNi4QqwD9yaYXmHMtRBFGyAWgps6o09/vrKuW2onY79U+aGLo9VFLqT?=
 =?us-ascii?Q?fvf8KWmC44pWawSfesKSECXybjZuY2ov2X0Ts2aFqnTrTf09W8wplPsjeUzo?=
 =?us-ascii?Q?VBxonY5sGKZg4O+AYqNNwUYRJrm4jrv/ENjksNQOMuRoFPtLDI13vhyDCMDJ?=
 =?us-ascii?Q?zOVwJBqzjeLI/zX+GhaZeVfQItDcvDmuuDi7lRtSGTbL0+1fLulPZdAjWrSC?=
 =?us-ascii?Q?+Y+uPbmYpeMyD02CEnz21U6iPeGe08BXocg98AP7EdCbddYgMCKRX6n9YeaL?=
 =?us-ascii?Q?oTfF+9urSDOWwKuOqNz3Je9kXIJbSe+QE8yWtsSh+jrY/ntMDeNZpu7LwMge?=
 =?us-ascii?Q?pef16TYWqhtd6131WB3uom3VrgxKWkZQJewFK0LCPo4jO62VgBa0acpetgD/?=
 =?us-ascii?Q?wwyH7pqrto9FZ783mMranZvVvxveY9JemRR/B/SmYYonfT5s3akoPp4agJnd?=
 =?us-ascii?Q?+3QaZy6vqskd0TnhZnnwKGTBM2y+sG+oS8ChOIgbqkFTvU+0ta3ZPi0b1voK?=
 =?us-ascii?Q?su0I1GyE/rsx2I82d4pIYd9rhjgrhSUZCOvy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 15:35:18.1613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1230bf-feef-4905-f7e7-08ddc47e5e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9483

llc_colors_str being outside the main loop makes domains without
explicit coloring inherit the colors of the last colored domain parsed.

Move it inside so that's no longer the case.

Fixes: 5948dc16759c("xen/arm: add support for cache coloring...")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1930276681
---
 xen/common/device-tree/dom0less-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 221b875a2f..87828d4d9d 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -829,11 +829,11 @@ void __init create_domUs(void)
     bool iommu = false;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
-    const char *llc_colors_str = NULL;
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
     {
+        const char *llc_colors_str = NULL;
         struct domain *d;
         struct xen_domctl_createdomain d_cfg = {0};
         unsigned int flags = 0U;

base-commit: dff462313fe0bfa273c54ffc9bff71f054c365af
-- 
2.43.0


