Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8A888F7AE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698777.1090887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpivv-000850-KO; Thu, 28 Mar 2024 06:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698777.1090887; Thu, 28 Mar 2024 06:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpivv-00082h-HI; Thu, 28 Mar 2024 06:08:15 +0000
Received: by outflank-mailman (input) for mailman id 698777;
 Thu, 28 Mar 2024 06:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpivt-0007nZ-S2
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:08:13 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eca7663-ecc9-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:08:13 +0100 (CET)
Received: from BN9PR03CA0090.namprd03.prod.outlook.com (2603:10b6:408:fc::35)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 06:08:09 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::14) by BN9PR03CA0090.outlook.office365.com
 (2603:10b6:408:fc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 06:08:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.0 via Frontend Transport; Thu, 28 Mar 2024 06:08:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:08:06 -0500
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
X-Inumbo-ID: 8eca7663-ecc9-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfFpvhBbYSSsw8jSb/rUy8/oVJBqbkA6EcvIVvG9hORSHDE2xVRNS2+PyEDzuOU4oEor1/S+tclOyqldd9hszwzU5k+cYTRm7T3tUziIycDemDj0GlctaG7i78oEby185/spwG2tGu1jgu6zI4qfq9ut5YjDK/7RC7n724hRy7plMTRGLf8xROSBa3NE2p92jY5rVshxWP0eBZMvV+WnMsOEb5jMr16Zoe4YQWn8sRC7C3Lo9TELUpYvv/bn7p7gUwK6/5EiJgrv0ueZYtBoNAYHhjA301TEKFIcEiBvKUMaexpPvQa3Hu0R+yJSpUpb2ivZETkkOSJ9siVi/yJKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iktjCp5GS/8M8W4VEJkInG7sWcP8HxuGqTncJkiWFM=;
 b=Vy5KyVRuMpQ7mZ+B/ZUm4or406eeIwh41yqLNgPKqsjOcAUJNkobRCZiSvwcnAhsROQRHX2jVZnSLJUDU0gs8LoTzUylMS12bZcEBF/kubzzHaOoSEQkSDvBqhvc4Ij/GOJlaJvhm1kgIvoQySVrFoR/4RxW0Q4ZypNtlHqWwfdZC54PwyZpFiEMOteVgrxojH+FJJrReV4Pmawvsmpk82KtQ1UTLqQaRIogEAkFSBs64P2gRMEofDNagH/JyHa2XbExPRVMFiVKzov0LCCqbVW22Ur8CTVhGbFe2jJNMIlAyfCfryO0aAapEooBWiYdgse0YdT50CP+DUgQLRzuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iktjCp5GS/8M8W4VEJkInG7sWcP8HxuGqTncJkiWFM=;
 b=4r3TqM+FOytsD4MHl0NCx/DAukhZdRYXPl8XAPO7GWKm4JmLqDNqW9E9r0ZxtXjp3lDq2eGc7AcsW3mu9ciSS/QwrR6nAMHBoeVCJVL8TTx0JirELM8fT/7wczAX7kEzWiaNfWsaBhVE6OiL2JvgsPS4ZDavba0oBBddtbo7aAg=
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
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC QEMU PATCH v5 1/1] xen: Use gsi instead of irq for mapping pirq
Date: Thu, 28 Mar 2024 14:07:31 +0800
Message-ID: <20240328060731.354356-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328060731.354356-1-Jiqian.Chen@amd.com>
References: <20240328060731.354356-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e18142-2616-4616-208e-08dc4eed7133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TFpXLZGHAOE+mjzrmlmfj1lN9OUY3e/hZZZfpRHim6s6Zfmbeo3B4CRE5GtGe0TV0j4TwcGRNIMXXPtWNXEvf0QCcqwGRg7acB0iyBxN1KrR/sfqNUzjjksp8Ov1/huq7dKW4IJLwuiZvq7NpbK2Y4KzIE85mnmgbsaz1KQzpg1cJj2QDACdWGSQsyv8yFdBu9ziL94v1tuK1rc5JG5Vnu+dE4WR8JKcvFAMC2jgGQvz8ybnyfVV3TIxcFdn5ha8CsqWMLohFufOcU55Qi4JXH0BBoVUaKp8TRNcDnbfr3AVywmx8v7i5zib4ffKOoymoYWlnsYdBqqNydNMU4wNKfU1x4xHIIYll5RfRI9Irw9PLDCFA9MJDU/St6Q1twhFBax4bKUHnthTFwRopkCJA2OZicaFzK9GaQRUmVRO33VRyLBJe/D+X0iW1qCTzZagG8ZuTp9cpERUbQRmwcLsEWoj8/LAyxtHIYx7W0OHfJKSBrML11JxzzWVYIrsTBlTWupy3oy+Jp23B9rC8JV+7F0CXlXDXIuxQYhkzTo3oZIjw2Qul/2kft1QzyQKeDO5TkOZarOz9FlYBdyEhrPM77TjL4GkRioK9ANOSfhhz76h8LBcuzUOr2ELQ7CDg6J4aKeue9WnnrQ7mDDp6M7uSKfFksYwlU24QAthE0kML8dLHnHIwbIUnjHoPVW1D8o8htirNQrEtaHNJbVZtbam8BxfUwQLpzN9vJf/4bBBd0oWbz+KcQoalHN79fYE2m4m
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:08:09.2690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e18142-2616-4616-208e-08dc4eed7133
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647

In PVH dom0, it uses the linux local interrupt mechanism,
when it allocs irq for a gsi, it is dynamic, and follow
the principle of applying first, distributing first. And
the irq number is alloced from small to large, but the
applying gsi number is not, may gsi 38 comes before gsi
28, that causes the irq number is not equal with the gsi
number. And when passthrough a device, qemu wants to use
gsi to map pirq, xen_pt_realize->xc_physdev_map_pirq, but
the gsi number is got from file
/sys/bus/pci/devices/<sbdf>/irq in current code, so it
will fail when mapping.

Add gsi into XenHostPCIDevice and use gsi number that
read from gsi sysfs if it exists.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

---
RFC: discussions ongoing on the Linux side where/how to expose the gsi

---
 hw/xen/xen-host-pci-device.c | 7 +++++++
 hw/xen/xen-host-pci-device.h | 1 +
 hw/xen/xen_pt.c              | 6 +++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716a2..5be3279aa25b 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -370,6 +370,13 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     }
     d->irq = v;
 
+    xen_host_pci_get_dec_value(d, "gsi", &v, errp);
+    if (*errp) {
+        d->gsi = -1;
+    } else {
+        d->gsi = v;
+    }
+
     xen_host_pci_get_hex_value(d, "class", &v, errp);
     if (*errp) {
         goto error;
diff --git a/hw/xen/xen-host-pci-device.h b/hw/xen/xen-host-pci-device.h
index 4d8d34ecb024..74c552bb5548 100644
--- a/hw/xen/xen-host-pci-device.h
+++ b/hw/xen/xen-host-pci-device.h
@@ -27,6 +27,7 @@ typedef struct XenHostPCIDevice {
     uint16_t device_id;
     uint32_t class_code;
     int irq;
+    int gsi;
 
     XenHostPCIIORegion io_regions[PCI_NUM_REGIONS - 1];
     XenHostPCIIORegion rom;
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 3635d1b39f79..d34a7a8764ab 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -840,7 +840,11 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
         goto out;
     }
 
-    machine_irq = s->real_device.irq;
+    if (s->real_device.gsi < 0) {
+        machine_irq = s->real_device.irq;
+    } else {
+        machine_irq = s->real_device.gsi;
+    }
     if (machine_irq == 0) {
         XEN_PT_LOG(d, "machine irq is 0\n");
         cmd |= PCI_COMMAND_INTX_DISABLE;
-- 
2.34.1


