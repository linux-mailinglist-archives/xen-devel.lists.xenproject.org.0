Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF7FB0CE94
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051798.1420291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WT-0000l6-MD; Tue, 22 Jul 2025 00:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051798.1420291; Tue, 22 Jul 2025 00:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WT-0000hP-H0; Tue, 22 Jul 2025 00:06:21 +0000
Received: by outflank-mailman (input) for mailman id 1051798;
 Tue, 22 Jul 2025 00:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0WR-0005Mp-MP
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:19 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2413::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2a8233-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:06:13 +0200 (CEST)
Received: from SA1PR03CA0020.namprd03.prod.outlook.com (2603:10b6:806:2d3::17)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:06:08 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::df) by SA1PR03CA0020.outlook.office365.com
 (2603:10b6:806:2d3::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:06:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:06:07 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:06:02 -0500
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
X-Inumbo-ID: ad2a8233-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3cc3dYIbB0N1D+04HUf0GjCea9WeOmO1DdST52kEjb9/tnhIOYUdd44mMjTaPIxKBcLX07oW/gVJQY1gE4E3d9W3h3g5K/okpZc0Txfa8IE9hiUl02RIYZkWliy9TzDZDhQ/8qErqbOKHzIBStqqZ4wcG7ldWd3PlBmP3wD1Y7VXxADXSt65By7hRyNAZ6HC3iexdnOxbVjnOsQJLV/YQSsM6eWOxJTYsgi8jbtIbsjGpSnSD9i1mJFm3J8tWF7B2TXEduz5vDpI3SEbdFUSYZUvMwykbYIhIxzlhj3h/5rNmOliNyTCYV6Fbodq2GCILeCmb2FObwcKcTzgpoGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olMgXBZZBVPXG3tpGWy4AbjtlnK0U3v7Xn2F33nMav0=;
 b=PIISeavlvTR4ARzaEzi6VBnezrJ+Y8W3pOC3nNRqQkFileCqpNf71S+XUAXtm2peP0o86O2DBDLD3P7Yt8iaNcsT9QaT16kg8G0Y5OD9rtrIBfxQqrWeVrMLsdH/H7hh/J1HOGkDQaCOl/lGVvACLEqpb+01OLyO39u472boUIMJRSBMNcZpYbgv83XV9mda6+Sy395obKrHeWtx2BCYWcG2/96ZJeXE3Ydidmh5w4e4GvSxXynOSGmoTShW7l4PgmBu8UB4w+PRr6TxcdXRY5CbytAza6rhrUgI2K8UFNavwdk7SZlJ6m5GJD4HBWyP1rjXGrsCaqblloalY7ZqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olMgXBZZBVPXG3tpGWy4AbjtlnK0U3v7Xn2F33nMav0=;
 b=EsePPzUjUMBSHXEjwwQ/qSJYdAE8mJDzeWUU0A7mXxYjacVkWk9v3scVxgLb0kwlWX6g7daFWE691dTthuwukP5ZClPYNyNFzffn1UIu70qEbtNw7wIjInZBW/kHwPEcFD95ZkH1NHojXtjR98GYUoPpiyMfefmsbA7rxu7GdOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 10/11] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Tue, 22 Jul 2025 02:05:22 +0200
Message-ID: <20250722000525.7247-11-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae5cd52-830d-435d-8a1b-08ddc8b38ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UqJWbycPSdNdoI5nSfrCTYOO0J6GHYU1J2xK/GX6Yj8N/g+5o5hCMm0GOJyX?=
 =?us-ascii?Q?neVTmWp3mIc7vfk3Kv2l47o8oN6OFYoidAIM6GXHaZWVYZMBjBQeRozSgBjB?=
 =?us-ascii?Q?JP4a4+6g+1uxCMA/+1fByK2LNlN7HCMNvuAZnY9LOWFOBgP5qPKmWgGDLZyr?=
 =?us-ascii?Q?k8aD2V9yyzSgHaDF9WXtw0q0DhtHUkXFdWjdi8cgrJ4VcoD333D5feHeBFVq?=
 =?us-ascii?Q?T5zPGXmQ7WcCExXJ+lWgS2KfNJdkXPBE0YhQY+AOI/NHdZ2Hgq83FqQq/IJ0?=
 =?us-ascii?Q?dai4meSEP08gIzbbB8vD9gzgrS8FA8/bpUpIP9w+ECUwPSa5fJ4XMp6Ctj5/?=
 =?us-ascii?Q?/fx6Hu9qUwasj5Gj5LNd6uHm7hWxQZx95yTDSlnSsZTGgLA+wM6qT2XqhkTn?=
 =?us-ascii?Q?dJmfnP0/u+mVOQsL1iHG2g5SgSJjkluyIM5IXIzlxQb/Yl+jvoAn2W4sa2nt?=
 =?us-ascii?Q?jLALiK2EPe32MoVDl9yGUKZ3TF6LVT32kGjWA+T1iwvibC06J/uBaKDichyW?=
 =?us-ascii?Q?BjTGebva+DCk3a/RVP9JJOrk17QS1FRTmc9da0fVGZLoMxx6Q3fNxFJqOMni?=
 =?us-ascii?Q?gU7t5BBIR3O5XWEMtqB0EtO9HUUy3AtTuNdj7bQRMBX9DV9w+gUIQlDCJ0F8?=
 =?us-ascii?Q?pu9FpEd1IHchvbPYb4mT9LPLomX+1ZUl4CHKy0YhX+XVTbkbx8Z094y6opoa?=
 =?us-ascii?Q?0TwSN/5KKOlAPydKOQtn+nDWwKYxDeXCCX0VWVHB81yCUNFPe0MipRlW1ibs?=
 =?us-ascii?Q?JktXnYqXrRUQYz3bL8Ly+wHXV8gF7WzliK+yMFrcYTc1mbYuww0kM7ao9It2?=
 =?us-ascii?Q?6AepEtIzkYNdUcVV01uw6WoH9DUXs6pb7pbptl/ot8sXukautjNz1H4Qbi5u?=
 =?us-ascii?Q?cI2WxVfhsuIFuZ2pcAD34fNX0gX+DLaPkUgo/cgwltjGY7uebwo4Cor+LKdY?=
 =?us-ascii?Q?HCfiFYRGYQncKmmf55XSTRAbrWVZL7oRvcHCtmg4VRbDdyU65QP4/yjcpESu?=
 =?us-ascii?Q?XaZAIhX/JCX52TdT2yXEceHkKnU8jvvgc3VlmhSKJWI1+zXNuB6MtDoZFwPZ?=
 =?us-ascii?Q?KL0LhKHfW2oGZ/I9cKoeaNwb1KbYQXAGGOmt2DMgvV/Y0ZYoGK32wkV/412D?=
 =?us-ascii?Q?hXTYYOiijWPiBlZyRlajPAsWnwiPdH9fA+v4gKqL490xVPTHg5FtYzzwd4mp?=
 =?us-ascii?Q?loZmGafZ6rPwQdQLdZg0fyd4n0FCY3TYLX0zKS37eE126Eu9jioXvpGLHPBx?=
 =?us-ascii?Q?1ahPSObciMtnGwHOkqxNCYgRSupOWkfxrYtHU0DsiISOI8AfTg3tAZoZ0JU6?=
 =?us-ascii?Q?38CmnGg0pwzk5YSUJcaw1jb+m0ug1+fUZmAdBJoPsdoKlSw9HO990bRsxocm?=
 =?us-ascii?Q?s4LlDJapUnWSqpvewe/LZ7BRbvhVEt2HlVcTyEuuXfmZN0+Uecdq67Gq3eIg?=
 =?us-ascii?Q?e7tMZP9DSQh1cCNK72LpU7XHSfdIIS2sPB4jweDQ8yfu94Y1xwY9zof1jO67?=
 =?us-ascii?Q?lZ2+3fKGCYd9iEBRAQkQPvmkeD3Rng4lO8D0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:06:07.6887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae5cd52-830d-435d-8a1b-08ddc8b38ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273

Architectures that don't discover devices via DT may skip anything to
do with device_t during the DT unflattening phase. Make device-tree.c
stop requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY so it may function with
CONFIG_DEVICE_TREE_PARSE alone.

This allows CONFIG_DEVICE_TREE_PARSE to unflatten a DT ignoring its
devices if CONFIG_HAS_DEVICE_TREE_DISCOVERY is not selected.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
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


