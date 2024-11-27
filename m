Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938289DAD41
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 19:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845059.1260555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwj-0003gi-UM; Wed, 27 Nov 2024 18:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845059.1260555; Wed, 27 Nov 2024 18:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwj-0003fF-RT; Wed, 27 Nov 2024 18:39:29 +0000
Received: by outflank-mailman (input) for mailman id 845059;
 Wed, 27 Nov 2024 18:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPyn=SW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tGMwh-0003ey-Vk
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 18:39:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8dcdf96-acee-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 19:39:19 +0100 (CET)
Received: from BY5PR20CA0017.namprd20.prod.outlook.com (2603:10b6:a03:1f4::30)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 18:39:13 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::bb) by BY5PR20CA0017.outlook.office365.com
 (2603:10b6:a03:1f4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 18:39:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 18:39:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 12:39:11 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 27 Nov 2024 12:39:10 -0600
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
X-Inumbo-ID: e8dcdf96-acee-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjEyIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU4ZGNkZjk2LWFjZWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzMyNzU5Ljg2NTAxMywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSF+IqXcbVUw6nK9/g9b30BuVDq8uBmfqakTP9rwi1sNQbWzebmRETvjWA+nbR4ZDftX/6k3od7GDMnL9BB7uLYm05IIuANcPCHbnWidE9BguP0AjsmVSBFXeCOpQcT0nbR6pEtmiGEiZ4zzfEKKJT8BUUzIFxNQPq3RuYTHylJ8Jx/drncRN/P2N9NAp/IS0BcbPoApGhuckiTM07fuLMZlPZwhrPOtGISAOJqc35VAWVnr94ZQcjuoQG+2ZbKr0i/UT2XfWzKnrNNemTKlY6A8Jj3S+b3bD/IR8rOIMkJ4WnfEGyV1tDubUaCmrRXaQl8CWI6i0W4USIaj7cwdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yxzhZAhRbX3t641mXMQ9ylAN1Wld0qdxw4trJkAYKI=;
 b=eGT6X20NGNCV/m3nW4V5e/Zwoul2wBo+S0t6PhJWNvbbHITVoxv9JuJq3fXNtu3ddZlkCi0780dBYo1HFMXqznBJLMQKxqGsW2XFM7Tc43eqlrKsX0D23vmPCBZhAR12GfKKiAEJaDnCc5O/2Vfb2mFzkjRwC2zFz1tMctaYW2BYvETaSx4NIzkHHV/hfI7CY/oxfgtz815rCN0AXbfavdLaYHCt4Hrl0pb+tbZl+P6UgCB4oSaF2QW2F/tOnZJ5DpFrNxf30btyV7iExo+RQuu9Ep9b3lzh3w/h5gYvJsJHWzBE7iliKBd8Zh5QebO1474hQbHHPifT31RqdDXrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yxzhZAhRbX3t641mXMQ9ylAN1Wld0qdxw4trJkAYKI=;
 b=yPemZlnfgKdpG4VE7icsw3v+o4YNrNtGSGRrT+lQIMKjVH/YMTNtMj+L9D77L5vx394uBqh6TTlQ+Lx3SJEVgCuuypdn62Mn/7bJ8+pYKGJtVg6OkvyWyRpSd4Jp3Egyi9Vv+byZDDBnEMKdbfplHGuoTAjJ/5JlzqVZSzNTPlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/2] Enable early bootup of AArch64 MPU systems (Part 2)
Date: Wed, 27 Nov 2024 18:39:04 +0000
Message-ID: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d747163-fce7-40a4-f266-08dd0f12c9fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xWmQBoTwt6HO6NVMNBhEIPTbHSRGYCuFSWRuAYnSBwp4aT4g5sX3wEAxWRQ1?=
 =?us-ascii?Q?cf8TojrwPDhF2fsB1aWBB9gi2oivBgMPB7lpfHjT3BG/jYyIGcdjfGz00DIG?=
 =?us-ascii?Q?vIZpyBRYe7DJZTZcQoCK8zj9IR3jRG2kHd89Prawfrx5UZxjQI/Ol1a3eaVv?=
 =?us-ascii?Q?uzgR/3rftaksiD3ByWFIxPQ+2hNlfnzrcetD8pwsc2LMelVHd37pQAIk+FYL?=
 =?us-ascii?Q?nLEMmU8wQ13ZDy9zd7IbUDTczrnvucLLvFsk1efKegS3fh73F+r7Cs8drtIL?=
 =?us-ascii?Q?HJNbGBlrWoJq1Xmpk3jY3lQHrLNyF9pPRQnaJynMgk+irdwAEZ25hP3ZvY2e?=
 =?us-ascii?Q?2gFEPPRgI9/8TSDcVen/q88PEqksFOKiPxSOTdajthVFA7p3KByOtp/2p7sm?=
 =?us-ascii?Q?ILaB6HzNg2ZmUkvq+XXlg8UlZtiXys8KPjmCBm9ko1G9u3GHE/n1+pNx+TTK?=
 =?us-ascii?Q?DsIpVQ06B+8y+Ts5/zYyJEVUA/GDVg7qJMFWpfhcvjPy0d8EigzZxdE4EghT?=
 =?us-ascii?Q?st9kxOGkUHDef4vXLlY5vooWLpFMvsAzT1g2Q4fWWaGGrUP8cTf+rkVD9aFv?=
 =?us-ascii?Q?hDufKD/sisjOBwlgDn9VNBZPPeYHGlNJk2OQW5nHh9+mOWPW9p4CrVcxWGIh?=
 =?us-ascii?Q?uOQuKqgKkKNPBqVayEwywqA/ytgucJDIbLLr0UZgS6VkWBOOsA7f0rlk9Pvy?=
 =?us-ascii?Q?L9werOVK6pL3ErblmDVJKke8xlx5SBnhX7TNzT5pUrzN0/+AIkcGsMYy8I1A?=
 =?us-ascii?Q?KS1ZB1LkSq5huemdrWUwTYf2Iv4coY9UCgocnsSvG8cmbwXzFdILwDHN+FMW?=
 =?us-ascii?Q?/ecRMNjTREcodjELWgo7ry0xAfcZdO1J/3F0+ZEdDSlVsRsiGTFZq728lpYg?=
 =?us-ascii?Q?0jLMVj9cn/4Fk5iS34PxhvGm5lHClAaA6Y/wJI5XdiEwNcpW32a5107e+ZMe?=
 =?us-ascii?Q?bDpSloCKC33xb9587/ogjkKPbBo6O/OevYNSQD/8rEOv+AG24qIh0XKnlihT?=
 =?us-ascii?Q?bT7AQHqf1iasXwqvvVQkjUNudq+zGyw+rs4yos+jeS0tKtazPRFtgNMFP8nX?=
 =?us-ascii?Q?ZYlf4u8Dos5P4J/MBEmQt80RpD0uZXGFrHtE9bVsrRQLLR//fu1G5puRX7H5?=
 =?us-ascii?Q?IHnbWAFsc5wQGlDFS4GNrRhMGrBQThdGSX0q2ylWljdJ0docEXYRGk8VbSkF?=
 =?us-ascii?Q?V3H6/t0WSxH62eo60pWQhuO+sXid9IFnR4RT01HgGurFBTEN+rWOBWqs3Zi/?=
 =?us-ascii?Q?oJxA2fyL8f6sHWi/G26Fxsb2HuKbwhNR4IlXeBlXx+Y+sX5ueNtkkwmyC55O?=
 =?us-ascii?Q?cjdW/h+XzHdnPxA1IP2vkv+Ia1oIp34YG76RYSMQRrqt/omcJXSX96/YoDWx?=
 =?us-ascii?Q?4JloGOC5TjZ65fcrCqB0mwqdIUi6kJEyzhWrw622HcSOv4EdLqb6rUtVlpi5?=
 =?us-ascii?Q?2zRS49+1AYg939YBKSthxNWmVTr5bIu0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 18:39:12.7254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d747163-fce7-40a4-f266-08dd0f12c9fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

This patch serie concludes earlyboot support for Arm-v8R AArch64 MPU systems.

Depends on "[PATCH v6 0/3] Enable early bootup of AArch64 MPU systems".

Ayan Kumar Halder (1):
  xen/mpu: Map early uart when earlyprintk on

Penny Zheng (1):
  xen/mmu: enable SMMU subsystem only in MMU

 xen/arch/arm/Kconfig                    |  4 ++--
 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           |  9 ++++++++
 xen/arch/arm/include/asm/early_printk.h | 28 ++++++++++++++++++++++++-
 4 files changed, 45 insertions(+), 3 deletions(-)

-- 
2.25.1


