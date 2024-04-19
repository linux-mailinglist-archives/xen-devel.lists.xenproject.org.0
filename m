Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605F8AA793
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 06:14:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708713.1107784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfdj-0000cd-Fj; Fri, 19 Apr 2024 04:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708713.1107784; Fri, 19 Apr 2024 04:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxfdj-0000b4-C3; Fri, 19 Apr 2024 04:14:19 +0000
Received: by outflank-mailman (input) for mailman id 708713;
 Fri, 19 Apr 2024 04:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1xH=LY=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rxfdh-0000KV-Fr
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 04:14:17 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48f51fb7-fe03-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 06:14:16 +0200 (CEST)
Received: from CH0PR03CA0027.namprd03.prod.outlook.com (2603:10b6:610:b0::32)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 04:14:10 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::1d) by CH0PR03CA0027.outlook.office365.com
 (2603:10b6:610:b0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Fri, 19 Apr 2024 04:14:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 19 Apr 2024 04:14:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 18 Apr
 2024 23:14:07 -0500
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
X-Inumbo-ID: 48f51fb7-fe03-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=essMYa36UEEL2s0TK5CvDEm1HOTaNT7ZhnKAQHbXgkmE+M6KMaOjUb0GbPwbvPEnYkW9CwOAUkW87MbA4nZfnMjyo4tK/o92pgw7elbDcnHXy1wlfnQBu2CduY1WX0ItU8rkMLHym+Pq4j1pw4N3x/PQsWU8/FBUMihpVRPY3QrPNa2Eq6WoK1kazVtiASJXS13eegNXcEgX01qis6iS7rS6vmKl8OQtC3Kvz7Uq8gYXkVVKrmCIarvBKrjfBMhe4BmVCccn2Z2wFKaXInUMuDS7oOQfygoIggsO/YSR4duIU/NPn75kJn3v9vm0kt3UCeA5/ha1RWEC+Z3bn7zcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Iegew8C87PUBULbDOFADEVQbH+6F4VJbkJFD0Bu2N0=;
 b=g1Uo5KDfDTjDEX43xmAZ2MiuMnR11WaFZYTjKEyylvYvpfDHvTkNQpuZmKkQwA4ib9ZFgOUEOwhx8ypy/Yg7npIzvA3zxySRU65aq1YlZUeS/dACy8MqJpkRpIMqtPjftn69GfDAdMLbT2JizXJZa8Xn08N5A8AT6A7Q+HCiAzCObMMwtl1P+QRZr+MPXif4VMbSQHA/mDtPBTOY4VLjd+gT+LuKcNUG9js3THuKfARuRzbqHHrxd8kGy6JAvAaeW2wIauvK0ItW7aZzNDKvcMBs7d/jVKOZrcnReDNJvkGCrabp0jl0Mk1E9/MrTDJE48DTyL0cKM1djASPsAa3wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Iegew8C87PUBULbDOFADEVQbH+6F4VJbkJFD0Bu2N0=;
 b=Ybq8HvDbmkVcQnETVSdEgXLXNUVwm+CDxPc25D9oaFmErlWKrVtrfYsMTXypdxC6FtWiFDsZOXXhd+jaxyfYH7fHU0oVhQ8jrdu3AZgS6n7zhlTANXq/TR6AbDKq0ur2MapDSkIChzvmrQIUOGBSWxzwdJFgWfw7J+eA1xYNQb8=
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
Subject: [RFC QEMU PATCH v6 1/1] xen/pci: get gsi from irq for passthrough devices
Date: Fri, 19 Apr 2024 12:13:51 +0800
Message-ID: <20240419041351.633856-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419041351.633856-1-Jiqian.Chen@amd.com>
References: <20240419041351.633856-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DM4PR12MB8521:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b3a9bf-66db-4283-c73d-08dc602729c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SqfHkXKKKT+80xUZIy3be65NiO2nEviZHRqTJ3b2IToOeCcVyZo+ptNebVLJSDERdJSH6Dw2ipmSX3PNW7oRaICaMSDxBh8XQwORrFM9ickW3QHHc9Bkhum5fP8yp5hCGM7wtC6kOsq1SCdg4pbnToAUgE2Ia3HmOTsXvByd9RelpgEl0yim/pcA2zMzHvjE5xrCAHC6zh9FOUUINYv4rh4BPVCCI2BGqtmSHVcNUD8dSsXj8UYqNSS2lwDsFTrerNeZftio5nx1/r/SQUt3BFDM85O52IjZkDvcsR9EZRizq9NaBT5LSA9sylPjHQUUsny9w6xuBEvD4akHPO4Q/0zLtELDBJDMekUJviHYI/ZbYkb199YLTlfkEGYZ8QKhA6hY6NLGzVBYD/B/twkUc5LdrdjkfauCSE1B0JwiI8mZBxmnTwrt6Yz3Idq+U6IM1Yw5mLVc+gWmMvqBC74EPjaDh0aTCCGhwJfJtftmCrOJZHQgGYslvtaq2tswyvZWkEPZKdhpszQsQ2DwLTI8P5+dwH2+F9dV6QvbxN2UhFxmig+ANr1d5OxV0BhfLeTQJVMNGELTX4kME+yDdl+XuCTpAfTaDX+D3f9l+rc31sVIpWeOggRKOTKD6E6+HeB2kABs07fHhilahGNZG5KtgbAGBgTOwIModqkZtz5RIxZj2kjj6C0Pbc/hc9XYm78FJ1Dhv8VuxZInv920747rQaiTHOydIoyhgUCaLnXewaGGbx3z60+qIADXBICalJto
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 04:14:09.9764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b3a9bf-66db-4283-c73d-08dc602729c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521

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

Translate irq to gsi by using new function supported by
Xen tools.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 hw/xen/xen-host-pci-device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.c
index 8c6e9a1716a2..5e9aa9679e3e 100644
--- a/hw/xen/xen-host-pci-device.c
+++ b/hw/xen/xen-host-pci-device.c
@@ -10,6 +10,7 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "xen-host-pci-device.h"
+#include "hw/xen/xen_native.h"
 
 #define XEN_HOST_PCI_MAX_EXT_CAP \
     ((PCIE_CONFIG_SPACE_SIZE - PCI_CONFIG_SPACE_SIZE) / (PCI_CAP_SIZEOF + 4))
@@ -368,7 +369,11 @@ void xen_host_pci_device_get(XenHostPCIDevice *d, uint16_t domain,
     if (*errp) {
         goto error;
     }
-    d->irq = v;
+    d->irq = xc_physdev_gsi_from_irq(xen_xc, v);
+    /* if fail to get gsi, fallback to irq */
+    if (d->irq == -1) {
+        d->irq = v;
+    }
 
     xen_host_pci_get_hex_value(d, "class", &v, errp);
     if (*errp) {
-- 
2.34.1


