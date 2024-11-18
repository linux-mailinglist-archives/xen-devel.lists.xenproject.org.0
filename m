Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA419D106E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 13:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839315.1255119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0cz-0006Yn-6T; Mon, 18 Nov 2024 12:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839315.1255119; Mon, 18 Nov 2024 12:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD0cz-0006Wa-3W; Mon, 18 Nov 2024 12:13:13 +0000
Received: by outflank-mailman (input) for mailman id 839315;
 Mon, 18 Nov 2024 12:13:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tD0cx-0006WE-Dj
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 12:13:11 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2409::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75e13fc3-a5a6-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 13:13:04 +0100 (CET)
Received: from BN1PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:e0::31)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 12:13:00 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::26) by BN1PR10CA0026.outlook.office365.com
 (2603:10b6:408:e0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 12:13:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 12:12:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 06:12:58 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 18 Nov 2024 06:12:57 -0600
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
X-Inumbo-ID: 75e13fc3-a5a6-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwOTo6NjJlIiwiaGVsbyI6Ik5BTTA0LURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6Ijc1ZTEzZmMzLWE1YTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTMxOTg0LjcwNTU4MSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JU5hXxhAqXzwRAL9pgnLAOsoRmKsZqPaMzCIj6qoCO56mksIFslh2/55kneVnZMpkrQYwkg1oum6ElhiA5X8hnLc4u96WQhEf9i+1XHfQ8pLk6ck61doqGLBe2UCzgsYnRcvZPKNogJp0HL498PN6fvxrxkRf+XLyhBG5GI4CHL9z2JEBOOX8vD3UsI4el3rxWZmRy9p8vTfLlnlXvJF2b2VX+CI/oLlHletd9rT4Zt7GZax+6vzD17Vq+/ioqTAJz0p8Fru+h2e51bEWsXtS4dwOECDAzwz8zE7VxMXgB/6BpfIkvvGOS4ugvtH3WEJ1q5gX5AF3OxEqMh40Nr/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxZ8kmXZXDzk5Pkc13K8IChxvdLyLLw0YfRPVdrOXYA=;
 b=ieE/wH45mwYzg8cPNtbQb02BqZN9torMekpIKd4/JRaHo8UAHwBRQD7GMb85BUIZZBXSPk1KFAdR7ohsdYbvbTGJuLQ+PkLOiBjglTmRpBiTQNnVd1UV6vRubH+3kZSm8oc1IcS9IMWxN/Ya4eBl1mqZW6zC36l1vCs5ZVc5fGLihVwa86axbmbau0fs5QcQDj4ONqGdKrajtxL6EZ7Nj35peZ8SMCH9vtHgwCZrFakrPRVOwAHecP5X/vujIqduId3cpBVx1xyBBOrhCLDRTfzR/GmervmDpjV95+ao5Khl1PevuFSYqEpVNXumSmPrImPXhuVA910+UsKgvS+8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxZ8kmXZXDzk5Pkc13K8IChxvdLyLLw0YfRPVdrOXYA=;
 b=HoYQB0ZtDqwTm+KoW3GuSG9+2kZ8ZaH389SGQf76dM//1XkAiwO85THTStVEfQ4A/wJwucOGTxKkjQ7VDpW89iBkyEHpihKk6S7Bh4tM+mscgKvxvt/vtfVZ6IsTqkErcV9d9J7gwPbv2PPuenaLZxLQMnlljBBOr3x/QURUG90=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.12) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.12 as permitted sender)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 0/3] Enable early bootup of AArch64 MPU systems
Date: Mon, 18 Nov 2024 12:12:47 +0000
Message-ID: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 8031378c-e999-4d1d-13bf-08dd07ca57f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0ftu/GaIT+lBqHNZl8q6S8PpfhlL8V29sGVs5Fro+wMAe14UWqZSTAj/SK2y?=
 =?us-ascii?Q?7ND+rcrznbuLMeWNAtkQeJ93E6uN+9UYw9Esrzlqugxo2aw0Khkhiq3R66Qp?=
 =?us-ascii?Q?xTse4Xld8OHk2SjJQQniFMKGNwa2ZxGheT3LQ56p+KRBi+JI6latEdTSkR0p?=
 =?us-ascii?Q?FLtj9NBnPltPyUOpm3gDy9Z8F+c701wly8u0hGMgX1wh34u2Oma694704Sh5?=
 =?us-ascii?Q?CcrHHC9vtz/zeiJfbEexc30vQlRqs5q/3B8FBlfoppjbLgEot8HSyQSOGM4r?=
 =?us-ascii?Q?sySiOx8GxwCBcEf4zyMtPc4HGPLj0yUaGLklQ9kmIoToIHnWS7ArF8donQYO?=
 =?us-ascii?Q?iDQ+JT52Qjl55KUCV5QkjBa0ucu6PvkYPMMkfE1JfHFDuzV8SZRVdAhjSkpk?=
 =?us-ascii?Q?TVWnhsEogLxOiwBGfW5RMdg387TjgdusBR3jgedQfZGC7F2MxKiKw6O3Ieag?=
 =?us-ascii?Q?p78d4fJlqx0ofN3Mbx8/dFX67aB+BWQJz17G3U7eOnj7ZoyJjnVCiNkv54l1?=
 =?us-ascii?Q?MldtK8/YJq2wx79oP0wz4bdc/VW7fPl93d/OcxPhM611FXVQ4mGdsI2YBgTg?=
 =?us-ascii?Q?dgdnnFFcA7ImCDris0X6ZC6biN+5dlufgfanRzKSpnIStdujk5c3MFebLKLu?=
 =?us-ascii?Q?TGiXuQqftyCVSZxXAu6pKtEpQDsNVRmFJDhpv0U2D8hebJ2EDYH5gg4aR/TF?=
 =?us-ascii?Q?obx4Fg3/sMqx3wvhMsJm+u0Smh4SdHSe2t2rEsPWue1+dlSooVEFfhAQKZVR?=
 =?us-ascii?Q?cQse8CjLdmfdJGFERmKHtAkXojue3vKP4o3Wp+g9aZAbUXqNrXnmoynwJqvy?=
 =?us-ascii?Q?SgKAb1l6SvHiLm2V86X8oaUWWNacUwuoGD9+AGZFt1Qj72gp77M+ZhwWIR34?=
 =?us-ascii?Q?eMFouf2agy2LSMaV+/AHGw/rP8ugdWTLzk7dsL3kP8L9ZIpbFoIXgREgoI7o?=
 =?us-ascii?Q?QUCDRBLS7bUdV3YMhYonp4czw8vIMfCJCgJMHFiqbjOHygRF6jHS6JoQfuAC?=
 =?us-ascii?Q?j7N625fAVmyQy4aTkK333ITIBF8uz5IqK83sH534Rji4D1XlLjng5PxNxR74?=
 =?us-ascii?Q?ZH6r4EI1MqWiX6QgLNJ/FGC9KyUcvUdFQR3C9FqsYtiHg9oK5EzECrndK2ah?=
 =?us-ascii?Q?pLKdrDUl4Mb84ONLGxqjE6dRNmXPxeneZ7QLeOX4HF8jb3MtgjqjqH4bhYaJ?=
 =?us-ascii?Q?TtCLgpC9TkfGSXm+iVup0cd7nH5Iom+l3Yq61eOZKbZT4YTJ7pQ5jfV+Z3Vx?=
 =?us-ascii?Q?w/lROotJ98eOKocHI1xHsqlZU5jTs2oHiTk/9fMV+Wxyx63UGWl/txIze65E?=
 =?us-ascii?Q?O//q/x6tqcRwbHIH0GAj/lBuZQs4Xc6FF+KqeMacEvAH0rvzhyhGrcgoESt9?=
 =?us-ascii?Q?bDcdwANF0qr/JLtfVu3QeGWbSHF+xCS19SXe7jh735Uteh8iwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 12:12:59.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8031378c-e999-4d1d-13bf-08dd07ca57f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429

We have enabled early booting of R82.

Changes from v2 :-
1. Added a new patch "xen/arm: Skip initializing the BSS section when it is empty".
2. Split "xen/arm: mpu: Create boot-time MPU protection regions" into 2 patches.

Changes from v3 :-
1. Removed some of the R-b as the patches have been modified. 

Changes from v4 :-
1. First 3 patches have been committed. Last 3 patches have been rebased.

Changes from v5 :-
1. Changes mentioned in individual patches.

Ayan Kumar Halder (3):
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Enable MPU
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

 xen/arch/Kconfig                     |   2 +
 xen/arch/arm/arch.mk                 |   4 +
 xen/arch/arm/arm64/mpu/Makefile      |   1 +
 xen/arch/arm/arm64/mpu/head.S        | 160 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu.h |  25 +++++
 xen/arch/arm/include/asm/mm.h        |   2 +-
 xen/arch/arm/smp.c                   |  11 ++
 xen/arch/arm/xen.lds.S               |   1 +
 8 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h

-- 
2.25.1


