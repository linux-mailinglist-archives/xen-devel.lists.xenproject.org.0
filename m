Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4489E7FA3
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 11:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850645.1265035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsU3-00014j-VF; Sat, 07 Dec 2024 10:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850645.1265035; Sat, 07 Dec 2024 10:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsU3-00013B-Qx; Sat, 07 Dec 2024 10:56:23 +0000
Received: by outflank-mailman (input) for mailman id 850645;
 Sat, 07 Dec 2024 10:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlXb=TA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tJsU2-00012y-5x
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 10:56:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2412::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f031ed-b489-11ef-99a3-01e77a169b0f;
 Sat, 07 Dec 2024 11:56:19 +0100 (CET)
Received: from BN8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:60::22)
 by LV3PR12MB9185.namprd12.prod.outlook.com (2603:10b6:408:199::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Sat, 7 Dec
 2024 10:56:14 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:60:cafe::fd) by BN8PR12CA0009.outlook.office365.com
 (2603:10b6:408:60::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Sat,
 7 Dec 2024 10:56:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 7 Dec 2024 10:56:14 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:56:09 -0600
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
X-Inumbo-ID: e2f031ed-b489-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yHPHu6pXdfHs081Mw/7q2vDkwN8NRL4YlrTtsdH7R+sZO2tYhIDXhQ8cA3Ps5m7vVHxeJBZRIYi3Nx0OZzjS/fF5rScqtTSHo5o2/pHy1Amaych+CSvCwJhxzgk32dQSb3sPxymNrlds7DZ6qEQtOC4iT4w6LuCg+lD/vKunaxtRSB58etCz85fPEPxL/JkJo54oMhU+yVssfwqEIvaT/79bsZwbvqgS1oLf2c8Hy4S0UoVzEjOYW/BiBpwTAre/QFsK9HgWHgIzE0fbya+pOibpyD7tbDP4RYDk6zVBW6R5Mm72prr2ir5x4wsG+twpmptJJ4h2I4Tsdbqn/Lwi/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4261N78RZ6zefSdf6LbgNLoktvOrHLnF03ZMxWyzmQ=;
 b=iTc0nK5/Vlmi2q1nB52p4HFlFldv+Wxp90Rzwwe21O133oN+uQ75OJ5+EavYwZLvsHqF+/TYzrt95YSarBhY2MdGVenc//xXcfQ2B7hKGegTaKFqWdU2OfvDh4N4FTrO880RMzhc4I0C00f6g4zAhn+r0tBM0o3qUyY1VYnHIIC5jvUDTBLMoNp+x8fG8/Tf42LabBFglIwHGEVs78tBDt8CzUzb7XoXxpSEC0llWHCTcjhHN/zuUrCe7DZjjNb0Bbn5wspK+3Llb+iBn55MQSeIvUVrizBSGuNWhnsJvtzXd9As3DoI0KwEf9uZX2z9NWK34QlVh0SZ1pmNPE1JjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4261N78RZ6zefSdf6LbgNLoktvOrHLnF03ZMxWyzmQ=;
 b=1oKPlguMMTnxoJwHt8V38Ob4HHB+9mPSYSIdHZtR7pAa6h4U3asIPrYgWAMhxKHt5yCaHVUV/HAVxbwWKOTUzwPFODOqSotTO65HhZvAZwhEV3gGv6btRKLvNJmvGtJx4ppvNRR1BOP+siVTIGzVeZfcYGanmWOWM4/mmePAZPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Julia Zhang <julia.zhang@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "Edgar E .
 Iglesias" <edgar.iglesias@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Xenia
 Ragiadakou" <burzalodowa@gmail.com>, Julia Zhang <julia.zhang@amd.com>, "Chen
 Jiqian" <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, Penny Zheng
	<penny.zheng@amd.com>, Zhu Lingshan <Lingshan.Zhu@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] Support getting p2pdma_distance
Date: Sat, 7 Dec 2024 18:55:34 +0800
Message-ID: <20241207105537.542441-1-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|LV3PR12MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9c35be-606c-4060-c2c3-08dd16adc4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9EPrNKWyXB2jffhGJwu6FONbnhxmpPnqjMVjmAU+oEtNU+cSqk7+YZniU1oM?=
 =?us-ascii?Q?zev8Wsp/joaRMxiUYDWVRiW0c9Q9Shc7uDInq2mJc1Fx3en/vupaj8fQqh5T?=
 =?us-ascii?Q?u6ePcwQwGExdSRtxSO3jpyZxKryL4w4pvrNnr2AYhWdgUcVtuHQ6htAbo3Us?=
 =?us-ascii?Q?shmdgzpoTDs/GiW1UPkF0Ppg/KCU1NQnA02cqD8fedJbpNDzGJZ4vhOjBgU0?=
 =?us-ascii?Q?ppTtWbW7UAUIPaTMCdVQCNS3c94B2YDJeqNivn6exkQIVRMCluaup9RMpHHq?=
 =?us-ascii?Q?HGO2vh+DK7NNpL+rKpD+sftBJwB2qH8YH0nkcEG3pMBff5qnl4tG+S7mCNTc?=
 =?us-ascii?Q?44KJ3sAWmcSuD9GQlFOzPavmE2aBFuISVd6SYO3HcOuLbNuVDaLWJID2JQz3?=
 =?us-ascii?Q?+A37W8+cdAwGFJ3tGdKfgHaGQvO70WjUPrVNR+kYnsTeDdNkaTc8KHn5pf/E?=
 =?us-ascii?Q?hqElxP9Ray6KAf0nQbRhppRRu3R9jeTpbRootsevWe/TLihhmP2vae/wP/tL?=
 =?us-ascii?Q?YyoHHN0ckcXgEoTpJNeCq0dyExKLcWgVoYnBaf2WRbveeeW0J3/z4kUT7rMn?=
 =?us-ascii?Q?0qXbC4oDsPC5hYCUZxTW1RyKrWO4Btghc+ywQJSXp2glemYunu5IHmwoucH1?=
 =?us-ascii?Q?HaD/HcApTnrk0/0V0DuLZetbI42/f8S7gKX/840FdYOgE7aN9jji/y8UbAZk?=
 =?us-ascii?Q?QPpVaYGz8kgZoXo1bKUiZdSy2UyohrzccXq/pg8BAi2MVt+eZRSICVu5cBTI?=
 =?us-ascii?Q?M3KTZdcvqv9rhB7nwti5CS1U33Dk5ZPt+uYPlpjPqUQ3UClzT3gIHwi4ggF2?=
 =?us-ascii?Q?EE2sg3q2QH+YhjJP927UQlhiUrY8wBU/PET4BPp+6iVxey6Fwh6bPKlj64zR?=
 =?us-ascii?Q?QPAsq+0PBNgHNDg4s9euLbFS+EeS/isTGRT9iAkw9/DaDOTt/gstaS5mATFc?=
 =?us-ascii?Q?ICysk89vQFEVUNv+lJa8iPuKmFeORVtoDrAelNSOxEvKsFQX1FwXe73xLf1j?=
 =?us-ascii?Q?kcUs7UvBVMBj2P7huSAyWtyfHo/DKuBIxrN3bj/iZgubIoMplqTmA1oUz3v6?=
 =?us-ascii?Q?Ts39gcol9xmzbVdBQgNYBeAwbVSgve+Pi47l/3fjUDhTJOjMNXQziqKvOg/9?=
 =?us-ascii?Q?hpQ2Fx2pC/3QLxM2Cf75DtPIlF/1tbn1J1PgfreLN2kkqvpPErTyXa/PUAtN?=
 =?us-ascii?Q?MwpPSUEAUKIVmHe+YiRTWBImViE+Dmdlwmr/XLtw5HbBpw5TeQMknoVWf3oe?=
 =?us-ascii?Q?sFghtmVkF2Zw2vTLzmFfondRb7aEASgLh7o2ly6NQjjPNKndfUOY1DXyd7aK?=
 =?us-ascii?Q?cKaAW43AQMxXwXDGGq9wus2ktTb+YA+akoBVH4YDFQ66B1QdrtiklSevfCnv?=
 =?us-ascii?Q?XjsCvlaWXxDKA/6czVCQegzffPenLboDnbsJNeoLBSm3IDbP1S3NZSEXUdN8?=
 =?us-ascii?Q?sCLV8DnS0y9BCPB1mn+aaPwvWPK/omX3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:56:14.4504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9c35be-606c-4060-c2c3-08dd16adc4e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9185

To implement dGPU prime feature, virtgpu needs to import/export buffer
between virtio iGPU and passthrough dGPU. Before that, virtgpu has to
checkout p2pdma_distance. But calling function pci_p2pdma_distance in guest
VM will only get virtual p2pdma_distance instead of real physical
p2pdma_distance.

This series is to support handling the new virtgpu command from the guest
VM to get the physical p2pdma_distance of two PCI devices of guest VM.

Julia Zhang (3):
  virtio-gpu: set hostaddr for virtio iGPU
  pci: introduce a function to get PCIDevice
  virtio-gpu: add a new command to calculate p2pdma_distance

 hw/display/virtio-gpu-virgl.c               | 47 +++++++++++++++++++++
 hw/display/virtio-gpu.c                     |  6 +++
 hw/i386/xen/xen-hvm.c                       |  6 +++
 hw/pci/pci.c                                | 22 ++++++++++
 hw/xen/xen_pt.c                             | 10 ++---
 hw/xen/xen_pt.h                             |  1 -
 include/hw/pci/pci.h                        |  2 +
 include/hw/pci/pci_device.h                 |  1 +
 include/hw/virtio/virtio-gpu-bswap.h        | 12 ++++++
 include/hw/virtio/virtio-gpu.h              |  2 +
 include/hw/xen/xen.h                        |  3 ++
 include/standard-headers/linux/virtio_gpu.h | 19 +++++++++
 12 files changed, 125 insertions(+), 6 deletions(-)

-- 
2.34.1


