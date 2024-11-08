Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDED9C2639
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832868.1248198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VGT-0000fr-T0; Fri, 08 Nov 2024 20:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832868.1248198; Fri, 08 Nov 2024 20:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VGT-0000dc-QE; Fri, 08 Nov 2024 20:07:29 +0000
Received: by outflank-mailman (input) for mailman id 832868;
 Fri, 08 Nov 2024 20:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hbhu=SD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t9V9N-0008TY-8a
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 20:00:09 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f403:2407::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bfefc3a-9e0c-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 21:00:05 +0100 (CET)
Received: from BN1PR14CA0015.namprd14.prod.outlook.com (2603:10b6:408:e3::20)
 by IA1PR12MB8358.namprd12.prod.outlook.com (2603:10b6:208:3fa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 20:00:01 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::f4) by BN1PR14CA0015.outlook.office365.com
 (2603:10b6:408:e3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Fri, 8 Nov 2024 20:00:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 20:00:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 14:00:01 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 14:00:01 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 8 Nov 2024 14:00:00 -0600
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
X-Inumbo-ID: 0bfefc3a-9e0c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNzo6NjEwIiwiaGVsbyI6Ik5BTTAyLUJOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjBiZmVmYzNhLTllMGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk2MDA1Ljk1NDEyNSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCy8eOjKCl86YmlMtrxz1r8PMWCHYCAd02esWKfUoXk8WudPPsi54A+loeWro140yzTzY9vzeqJIquupLwBUiTDPIiWvLeiMlVPF6rnF4jun0suBW+k0FKEyA3CuJNQSH3XTNgr8Shmi+m8LHiyi/kIyHL3qZVkhDT8unvrv3rffKJbFrxcgLiHL7ixwfeiBtQv6FlLlj5Tzz0XbCAoNqx9LYIbQtJAkuNS6Mfp0mOS27zCbWrXnmNJicMq2wXHKAiMEVo7Al+kjoupirViPSpigyQ/XiQ9gdqsl87ULxGYiigXNDpzjdxiVuwZvGf4NWSx5RIqhUnjOUwJ+7XolOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArCNV0s2PkwS3OtHPkfHlUgeBEoSbhGKaQvQyNAhqcg=;
 b=MIluM3Yx8mgTCzWIHvyIT3kt7DRBOwF0D9R6iAmF795tYoQ49k2Zh1vjZ8uFLZo0XWp2Zb/2bS9+i9e6Qa2SXOJ4LCMfYqptcbzIW9gPkAyHDUtbRh1qLLVhnj9kNlmq/SB5Zh/txuSNdB9ikm/9xFRXZagBHw7Hl8LqI8oT9Vfl5Hbdq/cYd9QygJbbpJp0k9OYJJ7lr8g2SdJRLRa2S1qOZWMWi8KR1EtKqymGT+m0mFqETsjz1kHZHNKO2cc7GvPAA8eFbIs4w4+itIw5UFuTWF+qLlCGj8coWe3TBnFHLdpmBiCReymsrCXmAPgDsxHB9anv1cahsiBuMcIiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArCNV0s2PkwS3OtHPkfHlUgeBEoSbhGKaQvQyNAhqcg=;
 b=KLX+hDBPQfNU1jQs5l4WPwfd1w+rge5b8PlstdbyhyKBhbyoCPrZoAxyelQuTKFDF79daZe8rpfO/kKcVL6mf1Ni5ANpgLgUV5TllB0w3uwrGrU9L41skk4N4GxVM7Ptdsv6rZbMCw/7512wll4l9eK6/Jlo3m3v3LxnvGuAkXk=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 0/2] Enable early bootup of AArch64 MPU systems (Part 2)
Date: Fri, 8 Nov 2024 19:59:56 +0000
Message-ID: <20241108195956.857112-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|IA1PR12MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 9557ee4d-690a-4889-32ec-08dd002fee52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IKe4fQ8SlRT78o++vNF2J70w9nJZaMKRK6Mx0A+dhba86cohFXIHfwlAen9n?=
 =?us-ascii?Q?D36f4pMC/Cc1+HjGWtMgmBel1uXdiZm+0bzOo/xKirHJM4OYTZ/2JBiEVsW/?=
 =?us-ascii?Q?GTtwlByiH0q8eZyqo/PTB7v0KgiXnUtiuMKYvkP1VKdEB/kqyk43NIQkuFxO?=
 =?us-ascii?Q?PoAqyCMbh0AxvTGaIs7/hXtvrmcT+pdWbDUW0fe03zLAscD4+AVIGKtU9IH5?=
 =?us-ascii?Q?ru5wPOOfnRvMA9fhDNemuj9PxCiDbsE6+pQRuI3fCurmE7B5SNBML0zeYswz?=
 =?us-ascii?Q?XxISE/O3G2quPr8ykaThyU/hxmHMT8dDpuWmt/7FYurELGCgC3OWfCC8MBpg?=
 =?us-ascii?Q?diNqtEYpk/Gf4nLFqYMhW5fEFcN1Qjtn5cVRuDoYFuVEw2t+Lc/YQ8oq0rQl?=
 =?us-ascii?Q?j1qDTOcGs0RQI1HYFoOkDnWnzSZUyjS5Z/OWhDdXIuGP5HhcowfvwPSG0Sta?=
 =?us-ascii?Q?jNpj10T4sIIErNG6FjkReCJv36kWkFSUpsp+o4Gy6vsZ13ZN+1RyI2bjUKPA?=
 =?us-ascii?Q?vC0insGIofFSN1Q6MNDsQaoDIoexkgQqPNfsdmQZNwOGYilQ2vtqfP4PAbMA?=
 =?us-ascii?Q?hG6rV/e1gwp3PCcY3a4Pk8VWJkc29G9mL9eZ4yzSZNF4clxtb2rZU1mNtbzt?=
 =?us-ascii?Q?NJbfLD4XVbAQvF/rXKkx9yc9F6wgRhMwcGtqvKCRGKYRDflPbEDhwZOHBR+j?=
 =?us-ascii?Q?hq9ncVbcvG5XmJqxOTuZAb6DA9MKXeKSqSg3LyHc1bRZlb4XoQpnErInQtBo?=
 =?us-ascii?Q?00qmzYsU/xLRpcKySI7CsotX8xyo8WSEMzIqYsS2eek34ou4t4ZzbX8D1XnH?=
 =?us-ascii?Q?nLQWU6h4ly1itX/nXkb+nswDXaemUlkkZ0UFn4E1icut46nAtPcLGOQiG5mI?=
 =?us-ascii?Q?k2ogaNcCGJw8TzmUciUv1jPhOJcHMDX8VLwMcFRWAlOdY2XlBOpbcjvK94RO?=
 =?us-ascii?Q?zOiBJxvNQwFd9wULev8lNGA3kdugBwDmsX5iHVJeXhMDCJY1u6fM8sJYBGxW?=
 =?us-ascii?Q?70hjIQylqVx7o4yeNBFULOl1+UoMha2Q3pFFFpZ6LJVnd1S7nA03TwjJv7z4?=
 =?us-ascii?Q?VJA5XJ1dVu/uP1vP/2vBW7s8VAMMKKnberQdypBq6phRO+7m60oMr2XXeTvZ?=
 =?us-ascii?Q?E9IpIj0bd4eGOB3XdIsDznF1Sq6c46MBkxTXODpq/QF2ei/br/Axcuku+6OZ?=
 =?us-ascii?Q?73Le2do+PDssDldheNGFEM5vY9JNsLHj+EVS1VeN9dp499xKDZbxcj+IRT7J?=
 =?us-ascii?Q?77FG6PmvjMb0CC/kp5mtgsUoNrt6L56eHpH3mHbnX8KSLGWSPI9Odwn03ZL6?=
 =?us-ascii?Q?2DqL84E5s/mFH8+xNbZqVPBzHiDK65Y+32jqbps/vg7fPcDnN6FF4fSmzGDZ?=
 =?us-ascii?Q?7nRzwFdlNREFn3+OjVb+FgHjE/uj6IYBmf9YtTMRw2ASAMaMKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:00:01.7837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9557ee4d-690a-4889-32ec-08dd002fee52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8358

This patch serie concludes earlyboot support for Arm-v8R AArch64 MPU systems.

Depends on "[PATCH v5 0/3] Enable early bootup of AArch64 MPU systems"

Ayan Kumar Halder (1):
  xen/mpu: Map early uart when earlyprintk on

Penny Zheng (1):
  xen/mmu: enable SMMU subsystem only in MMU

 xen/arch/arm/Kconfig                    |  2 +-
 xen/arch/arm/Kconfig.debug              |  7 +++++++
 xen/arch/arm/arm64/mpu/head.S           |  9 +++++++++
 xen/arch/arm/include/asm/early_printk.h | 19 +++++++++++++++++++
 xen/drivers/passthrough/Kconfig         |  3 ++-
 5 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.25.1


