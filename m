Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D359E7FA5
	for <lists+xen-devel@lfdr.de>; Sat,  7 Dec 2024 11:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850661.1265054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsUx-0001zP-Fk; Sat, 07 Dec 2024 10:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850661.1265054; Sat, 07 Dec 2024 10:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJsUx-0001wM-Be; Sat, 07 Dec 2024 10:57:19 +0000
Received: by outflank-mailman (input) for mailman id 850661;
 Sat, 07 Dec 2024 10:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hlXb=TA=amd.com=Julia.Zhang@srs-se1.protection.inumbo.net>)
 id 1tJsUw-0001tQ-Ll
 for xen-devel@lists.xenproject.org; Sat, 07 Dec 2024 10:57:18 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:240a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c6c1eb-b48a-11ef-a0d5-8be0dac302b0;
 Sat, 07 Dec 2024 11:57:18 +0100 (CET)
Received: from BN8PR12CA0026.namprd12.prod.outlook.com (2603:10b6:408:60::39)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Sat, 7 Dec 2024 10:57:10 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:60:cafe::18) by BN8PR12CA0026.outlook.office365.com
 (2603:10b6:408:60::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Sat,
 7 Dec 2024 10:57:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Sat, 7 Dec 2024 10:57:10 +0000
Received: from jenkins-julia.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Dec
 2024 04:57:06 -0600
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
X-Inumbo-ID: 05c6c1eb-b48a-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDSTIwzP2hCfkSDlD3jasev3OQMVtkVjWW9QvByL0AmhQjlT0EEfCPACwktnvZGYbST34jlXYK+o5SSIrmMOOpokXF1u6+IPZlwp1A2XFw3z8B4HzuMggj1kaOTH69DbTEV1kgghlxgqSmsU5dzEww3xof1xefhDX0GFz91tibC7ENLeqElrRtKsFed/VF9di6Tnean6b2M4o9PWyFay/uEkHXhti/TCp8O/mrtoU4LtaQf3zzeeDG5+8KDrgJVZP93E1ESRsJY9g6WWGWJjERmHb3hlysEEbZkkomFRM/xFxZnCPnDe3oN9H+Ugl9gh6cNYIgZqkGNMKLWi86YPoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaHGUZgM04HQD0VdrKLIvWNrpeh66J4OqCg0Rby1C6g=;
 b=md9oZJFpqB0rYp5yKsqmkRnaXGuEwySykTGCesIzeQBVQ8BiZaukS3N56vzpV2Zq+9+Blq7ENHw0zLy+/NwqeHtEbOr8TmQY+0HMtAPU39Krs2uA9iPIbuuXbNNHKKN9Gvi8gIukKF2BnYrihZ2WJqxBVWV2zUAz0jLqD8J4zTvaJFJL9VW1YuOtNs//DIs5Hh1gVgg28jByfxfoWq5F2daxOHfs2bitzGkYVFx94rkuNyXA7uXaOfYa2nB4kY0rm3Xude90E8h5xRFBZ16/VztsVj4s7UFu2Qs5XZw36OcGUuKQsslRaqUVfJvo7Dvgf0vfZMKu3DjatNfhwoXXDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaHGUZgM04HQD0VdrKLIvWNrpeh66J4OqCg0Rby1C6g=;
 b=KjWOBi2l/1Dc2KfPgZ+2nAqRejIp4pj7FgRzi3vmA1Lrf4iU8y+6htA0df0cxx/7P4zhJiGxkbDR8XsVZ7ssH7K5CJ7KxqTKjmGdQhz9q0ho3Zh1Dm5KexDPoBpa0uN8324Vxr13kJW1fJf2eBK2W/z/78AsfxQsZqWtwJSrjF8=
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
Subject: [PATCH 2/3] pci: introduce a function to get PCIDevice
Date: Sat, 7 Dec 2024 18:55:38 +0800
Message-ID: <20241207105537.542441-3-julia.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241207105537.542441-1-julia.zhang@amd.com>
References: <20241207105537.542441-1-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 9529aba0-a848-47bc-c579-08dd16ade65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FalTgiIumSNSHIdOdM/HxAXB5s+CVh6ArP5TPCQfpVyXJJ9aAAfsuu8sF/ud?=
 =?us-ascii?Q?fg2PxYXXt6GPlLeQFhPIogNG4UMPeS/EhttpPqKPNANjqX3iaNinkGkwDgJE?=
 =?us-ascii?Q?K87cfsftxxklJdaBTHs26Y8I9hY4Bds/ZcUdw+FSakX9SinO2qGQ6stk7keT?=
 =?us-ascii?Q?fp8jpJG62wrpeVTBqNNOP//oTIHo02EX8VI9A46700Bdx6/ZNubtp8/8wdsF?=
 =?us-ascii?Q?VNujdJhO1wyQ1XQH4tpSZYDNxKISQhOjX+jGL8bTYDX/9vtEH3BxKzlKg5U0?=
 =?us-ascii?Q?+sv73XTdiO5JYFrRxLo0ECBKThUo86y01UyCDH9mif1lhAH2T+KPGvEXe8aa?=
 =?us-ascii?Q?MszjxaA9rJciTtiNhAFdDjigmNptdIT8A+QouRQO0sfiXvMqz129KBUxyai2?=
 =?us-ascii?Q?9XqDB7guzw1+AGQ36N/QN1tGrTYekwcg9av+eCosKy3ngkGEdDSLCsTjDIZm?=
 =?us-ascii?Q?+EpDMrzkc4q6djXNLX9WNjBFVXXWKajwP0qa6PKVW2a6zfjmb5aObJKnyzNV?=
 =?us-ascii?Q?JXyADrglmLAIdRrZpg6mt+PbTFN4jce/czUx6qq2UoRTj0r4B3lI6cIwf0s6?=
 =?us-ascii?Q?8zortQ8+kIsViJvil/I1nmBOnJzUELKe9lKFt61wPI6iN3Xibh/VPQt8KVLS?=
 =?us-ascii?Q?3HBO9h/eFeWGqwbynBWEp6Jcbhp5RgmgUO9AUjaxBP/QqCAi/unsveDfZPxw?=
 =?us-ascii?Q?vBevqhvbmEhqkcciNvuLDv0cobIo49Iwmd9/0Jim7elBdZN7RkIf1L9whf2C?=
 =?us-ascii?Q?R3BPrH40wSz79U/olhEC14I32UyD7NdRY3iFIN5vTMCqhx19wv8XQNXQHfEU?=
 =?us-ascii?Q?YPuEdKQBOaSPZQlQN1JEswYIFtKySzjzQ65koMSXL56WE5C1KomODV0AgL6u?=
 =?us-ascii?Q?IAP1nSQ4fxmh2qrKJff7RihtA8IZfJgqsifJazg4UYsKecz5YSGIVYUu2XCE?=
 =?us-ascii?Q?zdvy33ePc8ajMw8CThZH3g8YQBHGiDkYYuiE7oE7yg6HbaFW85cUyGpr9o0F?=
 =?us-ascii?Q?TRaIsQs/HjHCD78zVV2z6Vj5rUEn2CIfT8jUAg6/64Txz2mW3j75vJlSBab1?=
 =?us-ascii?Q?YI0uR5FEx3vpDWZqNIfDtqZH7uJIFsS/uO5uDWcxB8SYZWRwSl6L5aPQHxWI?=
 =?us-ascii?Q?4/6NllGRgAWuMkpRB8bMr6cABAxfYk63n9Ii/S+cvduAavBw8AVmWGYLmW+I?=
 =?us-ascii?Q?w6px845Q9FNBU2hPrmwJzyCZiv0m/bdkP58MUwrZcOTDebTH9vIhwaziNONC?=
 =?us-ascii?Q?1VIRUq5YusrkyptmHt2teTkp6TNydDVApSTkcmRh+vYAlgbLL+zDNG7HpQh8?=
 =?us-ascii?Q?HOODUIvQudGuiiCPzJrz+2VT+Z47oplaiV7zaNYPijfpVw0XQ0JkQ8ZhjMcb?=
 =?us-ascii?Q?LYHPefd6U/3lBl0A6Q7pEN06AoaZkJOaaYMgilv/jJKeSseJKBtjqxBJg4BC?=
 =?us-ascii?Q?XfWnto17SL2UL8uTCT8hiEEO9V8XwBz8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2024 10:57:10.5911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9529aba0-a848-47bc-c579-08dd16ade65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343

Introduce a helper function to get PCIDevice from qdev pci notation.

Signed-off-by: Julia Zhang <julia.zhang@amd.com>
---
 hw/pci/pci.c         | 22 ++++++++++++++++++++++
 include/hw/pci/pci.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1416ae202c..95806ead4f 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2617,6 +2617,28 @@ static int pci_qdev_find_recursive(PCIBus *bus,
     return -EINVAL;
 }
 
+int pci_qdev_get_device(uint32_t virt_bus, uint32_t virt_slot, uint32_t virt_func,
+			PCIDevice **pci_dev)
+{
+    PCIHostState *host_bridge;
+    PCIDevice *d;
+    int devfn;
+    int rc = -ENODEV;
+
+    QLIST_FOREACH(host_bridge, &pci_host_bridges, next) {
+        for(devfn = 0; devfn < ARRAY_SIZE(host_bridge->bus->devices); devfn++) {
+	    d = host_bridge->bus->devices[devfn];
+	    if (d && d->devfn == PCI_DEVFN(virt_slot, virt_func) &&
+		pci_bus_num(pci_get_bus(d)) == virt_bus) {
+		*pci_dev = d;
+		rc = 0;
+		break;
+	    }
+	}
+    }
+    return rc;
+}
+
 int pci_qdev_find_device(const char *id, PCIDevice **pdev)
 {
     PCIHostState *host_bridge;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 463d9984b3..1b493ab95e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -366,6 +366,8 @@ const char *pci_root_bus_path(PCIDevice *dev);
 bool pci_bus_bypass_iommu(PCIBus *bus);
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
 int pci_qdev_find_device(const char *id, PCIDevice **pdev);
+int pci_qdev_get_device(uint32_t virt_bus, uint32_t virt_slot,
+			uint32_t virt_func, PCIDevice **pci_dev);
 void pci_bus_get_w64_range(PCIBus *bus, Range *range);
 
 void pci_device_deassert_intx(PCIDevice *dev);
-- 
2.34.1


