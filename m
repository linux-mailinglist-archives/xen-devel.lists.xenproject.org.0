Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB5824F1F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:20:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662011.1031912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeUg-000611-3I; Fri, 05 Jan 2024 07:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662011.1031912; Fri, 05 Jan 2024 07:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeUf-0005vT-Uz; Fri, 05 Jan 2024 07:19:49 +0000
Received: by outflank-mailman (input) for mailman id 662011;
 Fri, 05 Jan 2024 07:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeUe-0005s3-Jf
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:19:48 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd54d8e7-ab9a-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:19:46 +0100 (CET)
Received: from MN2PR14CA0005.namprd14.prod.outlook.com (2603:10b6:208:23e::10)
 by DS0PR12MB8454.namprd12.prod.outlook.com (2603:10b6:8:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 07:19:39 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::ba) by MN2PR14CA0005.outlook.office365.com
 (2603:10b6:208:23e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:19:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:19:39 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:19:36 -0600
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
X-Inumbo-ID: cd54d8e7-ab9a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCMubhsKVTGWjk7XzJD7vuG4lnQHNzd+yQK4N2VDpvHkw1K41CeYmaXE8o+4cfZGxytkLDCmq011/wgj8GYdraTfgWUXAihXwQRiL7fIsCgj6eDf5XVi9mifjXHjL64sFPtIVL7uJ0b0OKkAb7FQaq/SanAo0ZkSYKQ4AXb4NXMJE1g4CuotpDwKj3vXeZh0aV5gy9epgz2T2ManZU2vm79xVOrc1Th41LEI3QDB1Rm7IoVfDDJvZy8f0j881TrjYuai1Imq3tao2Hwuvmrc6eTgtJM4KSRFllFsd0UoqfR77cJnM/IIdGP8KnSZ6ddXPsGC00WIpNyay6gQut4HQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0roh1gGW/4i+nfz8YP4YEt9OMHF9n0XqY0kXBc4kSA=;
 b=ZqDyeAfqpOKIg7/yfcHypvLl/tr78HISnODcYZ/telHtPoGPs2GgnQBSBNXlXPs+8+BJw1EuI7ejOn/kIU5nEEn5DeEND5E0w4maxYegQlYrkHjwWmCp9QAnAu2T329Y6IEuAdVRHx2S3jpOJzmqM9MgHK833LmHKKm84xQNXiMAOU743K+flRY1J8QzG/cvXg4SXpiKAzHxpX2VqqefOjCL6BhRv+KRsGAsTbgOxYRX+BHMzSJmXLPExl1U68oFb2/byfOEJQ45f9BhUYaQlyh5m9kujV7tM2YWki2nEIMaDhZQ4c897fer90EGdAWQOdRl3J3g3nkj/CpYF/ObGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0roh1gGW/4i+nfz8YP4YEt9OMHF9n0XqY0kXBc4kSA=;
 b=ZuLR7ZNOOqGHUgQlpt9s9ekdI521mJxg7m43R5qApXPXgCW5DtxSX9Qqg2pzJbny7asri5oDJD1H15xEVNJNdocdgYmbBE08MpXhs1DcMG4nZlkgN1tEZx3jG9zh4J8sFvRtndNxdRZjVDjulS6NgWi4QBdcrwyvg4PefrY+Zeg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <qemu-devel@nongnu.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	<xen-devel@lists.xenproject.org>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>
Subject: [RFC QEMU PATCH v4 0/1] Support device passthrough when dom0 is PVH on Xen
Date: Fri, 5 Jan 2024 15:19:18 +0800
Message-ID: <20240105071919.350397-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DS0PR12MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f4f821-16eb-4066-fe90-08dc0dbeade0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4pu6y3uRf6JmFpwgnHSbcGaZoY3IQb55qfu49/0cso6ugDlpVj8rkmS9WwgUzDbbEduqCK44KsvtIGdBQIE+sODZrGHEv2fGxbM3TG2RDpicbZ6eajvOjLHO/XI1vk0hcnG0Ojr9LS9vURu0+0MhAic3G/bPDmSnA/6m3jqjHFbqFOzB/D/gTyUSGIwcaWCuDlGzgpvICV8l+AfaEGXpMJTIuA5LrHvffNd5hkTGYnpKpNYQdpwYZTOnM4Xn9jg0hCIyUpkuO4YZqCzKRY6LSfaD3ZVAXEUfcwRI/0MaydQOxRzvC8rapBTrHalrME6/8UXasVm4FsW0Y9S+oQvCX8TdLkaji/iFr6d36JifUsygW+mrYgaJKEWGfD+oR8wJLaPhBjgkvYZsysuCAbDtoQ23XvHrc+2+F/x9djLr1HriJZubH+hrvxOUj3nl4RFyrE1bK+Ato5sg38x9lyIp+fTOF1IWHi/46gQd/kKT3lAGlxbR8I9gK4/R3n7uyWKTXGkJrTGEn37xQXI3OZtEtrOt6igQQu4WKPMkc8sD7tZQyqp4a3XUC3qXvhs6vtd/kdfTSRG02NjWUXZJCBLz2xXlxIDGcWebuEOQaAW+F2KnH0CkIsVyjlLAXj+alFzujKwl1p3PBWH3leNzKdNZlWkfpjGX7R0DLIPgkeV1uhwyqUdrFCcMg9pD6TfYmseipu16C+G/nXdNSfXxiakd5Ju8FGopo424J0jAsqngdN7uRf7sRD1ZZnotGbhwI31h
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(40470700004)(46966006)(36840700001)(83380400001)(16526019)(1076003)(336012)(426003)(26005)(2616005)(82740400003)(47076005)(36860700001)(8676002)(8936002)(4326008)(5660300002)(2906002)(966005)(6666004)(7696005)(478600001)(6916009)(54906003)(316002)(70206006)(70586007)(41300700001)(36756003)(356005)(81166007)(86362001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:19:39.1449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f4f821-16eb-4066-fe90-08dc0dbeade0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8454

Hi All,
This is v4 series to support passthrough on Xen when dom0 is PVH.
v3->v4 changes:
* Add gsi into struct XenHostPCIDevice and use gsi number that read from gsi sysfs if it exists, if there is no gsi sysfs, still use irq.

v2->v3 changes:
* du to changes in the implementation of the second patch on kernel side(that adds a new sysfs for gsi instead of a new syscall), so read gsi number from the sysfs of gsi.

Below is the description of v2 cover letter:
This patch is the v2 of the implementation of passthrough when dom0 is PVH on Xen.
Issues we encountered:
1. failed to map pirq for gsi
Problem: qemu will call xc_physdev_map_pirq() to map a passthrough device’s gsi to pirq in function xen_pt_realize(). But failed.

Reason: According to the implement of xc_physdev_map_pirq(), it needs gsi instead of irq, but qemu pass irq to it and treat irq as gsi, it is got from file /sys/bus/pci/devices/xxxx:xx:xx.x/irq in function xen_host_pci_device_get(). But actually the gsi number is not equal with irq. On PVH dom0, when it allocates irq for a gsi in function acpi_register_gsi_ioapic(), allocation is dynamic, and follow the principle of applying first, distributing first. And if you debug the kernel codes(see function __irq_alloc_descs), you will find the irq number is allocated from small to large by order, but the applying gsi number is not, gsi 38 may come before gsi 28, that causes gsi 38 get a smaller irq number than gsi 28, and then gsi != irq.

Solution: we can record the relation between gsi and irq, then when userspace(qemu) want to use gsi, we can do a translation. The third patch of kernel(xen/privcmd: Add new syscall to get gsi from irq) records all the relations in acpi_register_gsi_xen_pvh() when dom0 initialize pci devices, and provide a syscall for userspace to get the gsi from irq. The third patch of xen(tools: Add new function to get gsi from irq) add a new function xc_physdev_gsi_from_irq() to call the new syscall added on kernel side.
And then userspace can use that function to get gsi. Then xc_physdev_map_pirq() will success.

This v2 on qemu side is the same as the v1 ( qemu https://lore.kernel.org/xen-devel/20230312092244.451465-19-ray.huang@amd.com/), just call
xc_physdev_gsi_from_irq() to get gsi from irq.

Jiqian Chen (1):
  xen: Use gsi instead of irq for mapping pirq

 hw/xen/xen-host-pci-device.c | 7 +++++++
 hw/xen/xen-host-pci-device.h | 1 +
 hw/xen/xen_pt.c              | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1


