Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F6AFD61F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037050.1409768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjp-0000P5-DB; Tue, 08 Jul 2025 18:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037050.1409768; Tue, 08 Jul 2025 18:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjp-0000N2-8v; Tue, 08 Jul 2025 18:08:17 +0000
Received: by outflank-mailman (input) for mailman id 1037050;
 Tue, 08 Jul 2025 18:08:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjo-0006FB-0w
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2414::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84aa4649-5c26-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 20:08:15 +0200 (CEST)
Received: from DS7P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::17) by
 PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 8 Jul 2025 18:08:12 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:8:223:cafe::ac) by DS7P220CA0028.outlook.office365.com
 (2603:10b6:8:223::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Tue,
 8 Jul 2025 18:08:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:08:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:08:04 -0500
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
X-Inumbo-ID: 84aa4649-5c26-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJsVm11Fk2Yyg5fHIlOH8bLZVl/mx5/qKOBXkWw6n3mTJmbq3uGfoCVa5Xt3MU93ndTq8Y8Z9T40238ur+WlgD2U7U6n/yXXx+DUP8Etbl5LQROBLfW3+S6MxKqxPeXvN5sAj6yEY2kBEPNy/oVbTMgZhrUe7HRJILLMTJg6EgNYCdZk8zf5FmmkK2JWXVOcEF5yCfRgYTqLUp0njtWbBk19sppHYbh92NgIQStPwPAxGm3ARxl8v7jRQ5G8vViDjUQNc7AobXitZ+4sZbAV21r60wceXfxJgr306vok8x3/F+XN7GQup3ISxkKfRK21ogdF3yDshkUb6qaC4Z0gqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aawmRkDQfgpKUld2wU0InG12ut22yRhJeR9B5PxPCGA=;
 b=R2CwykSJlR2sthzmVZveKl+r5m0G2d8WCTqgKtINPD5jBc0SrBZVtr9gVvN1WB7ZP4SEFojMLNBOjfiq0xWU1+egiKRtxj4Ihr59aPjtIPrCfffG50lDLiB5rQcRfeHkUi53Be9otMYutz999WZhW75tF4qNI4yJjbusWH+QBhubx1c5KvSHVINDn8e0Z1XGlR/DRbtvsoNKmHVj7VJlIaJAc+phH9MEWAMx1yY+F+8B800vOdZMl46hkocTSk43lVrFwLfBeMH35B8JizNrpcfslvyz2cHi58ko0m5WhnA8GF4ozAvMrw5vIQ1jRUmINmePX7+fxHN+nkk8id2r/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aawmRkDQfgpKUld2wU0InG12ut22yRhJeR9B5PxPCGA=;
 b=uAuhq01dhF+doH28VlQ182pV/NTXLhdkFtC/JIX35O10B14pYfWmbrxhUZLm+KbMYSZuYNe2dX0B53VxzXOtiMvl4D0R4qahHBmVKkPekXENc5Lanvz3O5HIMS5xKvz9KDF1Xq3EwFxH0v2Vw+GxqKGrXzQ17JXx/bpEEJMxsLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 10/11] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Tue, 8 Jul 2025 20:07:19 +0200
Message-ID: <20250708180721.2338036-11-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: e3deb64f-f6c8-4c28-9894-08ddbe4a6663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?whSQ554B2rPxItYBYiU5g0DwO3AP8OhcdrZ3IPHVbrOkmG5Gq3NO8Nsgi9IY?=
 =?us-ascii?Q?EBUM0EmZ/d2eAugFj//ZzU2LmWuiQNi6Dt1riuisC3DcYB+3teNUDH89rg9U?=
 =?us-ascii?Q?ArBgiskatEL0XVdRqNJPdWdiuXLdIigBPxEnslZMovZEwCfZ4yWQF0DNIWur?=
 =?us-ascii?Q?Eus4HWiPxzeUuvWO+M6I7yK/iyDZFr0h6/8rKy9sgAjqdCuZVniRAxRWChtE?=
 =?us-ascii?Q?J/GG5JDwcsMfZMXVHoRN/3ie5ZFUUQKPiT6JYvbviqcrU0W5mIXcwrbsRGaD?=
 =?us-ascii?Q?b6Y0JtcQ51vugHJMspMvn2mlRQKLzWYBgfeETwjOE7evlnsuqk53YL+T0CJF?=
 =?us-ascii?Q?fK3unvCjL1AYKcgv2403PQOLviYzLwlH15nS4UGY3/MPjvXzL0EVtmI/rQmY?=
 =?us-ascii?Q?zUwi8steRfNl9jbQwlnjOyTcZeZozl6yd1Jt3qDCxPfQuX1L3GN9k8XbwGcK?=
 =?us-ascii?Q?6yJYz+pMi6knLwTU0OhnyL0DNZHGpWAlAjeQ04Af/j6Z2spucdco8ljIRCXr?=
 =?us-ascii?Q?hNU6NkHdhRRxtTNQPmucN1vhMrBgPC3fUSxmYjAJudn4aCCjgsPdBrmwFVmM?=
 =?us-ascii?Q?JIMDwtCnBsgDvKplicDWs6h28hWutSpW2F/DfYajNfL8bwBoy7X2nz2wMDvW?=
 =?us-ascii?Q?4p4HRE9J9TT9t+d4ftjrdaClaxDYKgf2Kdk7HZZ77Bf45wNsXk+48D/uqYRr?=
 =?us-ascii?Q?RkgZ+1t/nu9QMMwkIVHd2DxsUd5r+Io2UnfZp270UQcyupxXVrXCO+/2HY8E?=
 =?us-ascii?Q?tddPMBSSxaboqBIbWjvmXaPHpbS0s4pPzcB3pF/ePG58yMVic2tDQRn4BkQU?=
 =?us-ascii?Q?zxBB1VZxi0DFHd4mCWdpT0qZUzQRi12EqVb/9RhowkEXuPkUFL4HZqnBEeO3?=
 =?us-ascii?Q?G7KaFBY0dd8HxK+ngpaqPkeQQ25GP6tmFh2gCZOwT4LYbMRnSGjCOzBGW2rM?=
 =?us-ascii?Q?VAYXuFNaOd/CmmR8ZGP+EXRqDN1ScIKx17PpK+Oc6rICTZoFvfpfyvvz0yfv?=
 =?us-ascii?Q?TtuzS77LNvWVNNxT0swEujTbohZUXnMM38PWYi6PR3AT2eZvV2RTQCjet6uL?=
 =?us-ascii?Q?Y0F/pCk91xzzJWKbx1vWfDWZo0FVM3VYMWfO4ktchza/5k9QbkufmRjSPC1g?=
 =?us-ascii?Q?p/2L7qzX/Q85H1UU/T8ndLA3xo/t5EDciqHpKiXBBh8n1PWvgUbDGB+OUiWf?=
 =?us-ascii?Q?CK8typs6x3Yqpz0LViB3YdAUt+CPr8PZIZ2jPOL88PIr6bnqtHuXaf28Kgtf?=
 =?us-ascii?Q?dVMy8NYQ7DB4wcN+muNUQMq8d+t+CceCPbm979GNnguAMrBH0bXpZ2ojCy5j?=
 =?us-ascii?Q?90/Y1V35lnPWlCgxJz6jSEck6hbp3p2e83qnrBqBB6QjkBKhBtWjZIc3hmUA?=
 =?us-ascii?Q?D3WaaQ85spggVzKd9uZ6ZVmY6E2i9dejQ2cPH+GeJV2zAeSsQj4liRaIDxXf?=
 =?us-ascii?Q?U+eqDy9alQ4qi1Pq+DXmuEjFK7I2MIKojp7vVkC+lTfbA4dTtMH0qpVnJGwF?=
 =?us-ascii?Q?gV1thwcCSCXpBWYdUN2+fC9nKWNsa8EKH5ml?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:08:11.0262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3deb64f-f6c8-4c28-9894-08ddbe4a6663
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867

From: Alejandro Vallejo <agarciav@amd.com>

Architectures that don't discover devices via DT may skip anything to
do with device_t during the DT unflattening phase. Make device-tree.c
stop requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY so it may function with
CONFIG_DEVICE_TREE_PARSE alone.

This allows CONFIG_DEVICE_TREE_PARSE to unflatten a DT ignoring its
devices if CONFIG_HAS_DEVICE_TREE_DISCOVERY is not selected.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 4ebdb2e52e..84daa3f0ed 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2030,9 +2030,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 8a39a60c54..06d7643622 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -108,9 +108,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -119,6 +122,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


