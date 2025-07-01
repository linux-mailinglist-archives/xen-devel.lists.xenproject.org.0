Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61354AEF5C4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 12:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029532.1403349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgT-00055h-Bf; Tue, 01 Jul 2025 10:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029532.1403349; Tue, 01 Jul 2025 10:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWYgT-00051f-6s; Tue, 01 Jul 2025 10:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1029532;
 Tue, 01 Jul 2025 10:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lih=ZO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWYgS-0002hE-A7
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 10:57:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b98cfea-566a-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 12:57:51 +0200 (CEST)
Received: from BLAPR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:335::8)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 10:57:47 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::78) by BLAPR05CA0026.outlook.office365.com
 (2603:10b6:208:335::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Tue,
 1 Jul 2025 10:57:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 10:57:46 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 05:57:44 -0500
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
X-Inumbo-ID: 3b98cfea-566a-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJTKSQMSRHRhDBTjyN9oEOVanmrCBtBsni9eKdODEW3xNK+EM2tC6brRzQYzoJy36zvKrdhiIeHCmNlqllaZ4Tsb2gn6TowrIWvz62UmJguPUOH4J9xnsqAIvjYDmILyRZCJwWW2rO4h2PzvTklXPst6fYrpDiTushRNKngQImpvnuWl6eqS9m35OPoe6k/rU6Gu15pVE6hBnUFDYgJBn3K32PJIyY9/u/aIx/d7nqfwZjvB96NSBtTZcXth1n5d5YghfMXmSoQzdfbGThbADy1taNNxviHQMtIDCaC/PsFwrKRG5kFK0DEX2UfwxtseIDsoIip6aZAHUO2lyWOh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdbXRG3gJ+6nR7yDyC6zWhnGw42chIOCn8pFzN7c4+0=;
 b=RLQvFoXxJpLb0U5TJpcYH+oJIKdfGg4uEaIBvWkHmBfZVT+/3i6JvnQ0qw2CHtPDQ550kOdrhcjqpKrmFAReUsiLGh9nz3PZ2g0slgS5PjGZzADXRx1vKrZxZbC356diecg1Pf6WYob7rjE3IJ5ftkKZ7wlbtGzbIWcJ/l8aCWJPmeN+h+pZS0BdqRnrcW3aZ9GsLViQGisdlsazmH5lNWFfaljNKO8cGQemFQQI2vjMvlX144pwptdjhH9x0Q/HzBVKyxH8HyAyjs2aNt5LC+tPW/JtPdVajkoxYnOaUmQS1ikgJDnJrprf59hEKoOKTS1nLobXUw/o15mFJV3Q3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdbXRG3gJ+6nR7yDyC6zWhnGw42chIOCn8pFzN7c4+0=;
 b=10tzgWr4W5OLbop2fLDcvSc7tN2nBQDGtkGfkvXUI1MlXXc6wOAin3gCygB2nQiZypCigi3i3BkCbWeQhOVWgobr2UAsbtpy9ZGYnhVg8f9RJiOv3/k1W8VP8rkbTHMUT93HkR9CWKhyTqRT5O8VesQWb22CJR+myVHg/4+G/1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 09/10] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Tue, 1 Jul 2025 12:57:03 +0200
Message-ID: <20250701105706.86133-10-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701105706.86133-1-agarciav@amd.com>
References: <20250701105706.86133-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 77276ea8-546c-410d-4e82-08ddb88e1cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sb85+aQJPTVz6ofWyKmrWKdKwD1lmeWUnzA0hAjNYcgYyQaBr8Q9BaGuZwt8?=
 =?us-ascii?Q?fXixx/GKSKzPuTYKhp6gn3A5FboYrXYDzPkOT8cuVBD3E9oCRq9OnKAQrKdx?=
 =?us-ascii?Q?hD6ECdgy8BMj58al8DYOw4//v9bzwRfDg38ZIqME8uElpI8Vs++GL9rwMUGv?=
 =?us-ascii?Q?ygTp3DzHiV4ldWBHI2FIjJCgypdyRBMd2hYkO46t+InLpLCoPysTS+wjmzyC?=
 =?us-ascii?Q?qcOKboTKSXAy22h5ixCHukP5Q291RGHCoskuDhEPUqv3bG6lsJ0i97661eZg?=
 =?us-ascii?Q?ofOaohtx3jPf1wZKkpwSWNmj40+eAy0W4TeFEy2QqiN5NH6Hca+TGlMzIRnq?=
 =?us-ascii?Q?Jv0eeJRREiUdy8SXg7rpdArVukT0D91HurJMj3I6jWUyjTD96+FvXqSiX+hR?=
 =?us-ascii?Q?lY9Ie/JNAgnbUcFmnRpib6IEC4+5rlh1LPIaSqZ+kp9lhlVMQnu7SAAkZG4f?=
 =?us-ascii?Q?S933rXQD/eEKGU+lss1j4E2POrvZOtnaEplX0TF4UKGi87vHvmgDXYL29I12?=
 =?us-ascii?Q?Efbog/cf/4WN0WBYdBPCXoSJEW3j+MoxDSlAKqCkfHWN4zrdyOs9bg3ghk+n?=
 =?us-ascii?Q?sqmCnardgX6U/Xe/8DiuWE1NiN9lfVEDHcAKxIOUULkIrBQWlcJxTobT8mLe?=
 =?us-ascii?Q?tlJsTg3a85i/Mx4saqpzO9Q8EE3JuVEefsdK3WA4kzldAUjl9G2MsjAvECPW?=
 =?us-ascii?Q?oE2KhEmAxcK6kMNlFZNKW9CpR4AsdfwIi0sgoIskPAME4g23iYeCa4ezt517?=
 =?us-ascii?Q?Rxt1gibufASZQLPDSYOrUzHp3ZX2WhqPWcZCwXad4EBS3LE1skjKNt8uxm0X?=
 =?us-ascii?Q?uK59lQJpAcCkAIA371kqQCYeOQNeOeMgUi8S8ZXqDI+Al7+zuj8OGTRg7TIA?=
 =?us-ascii?Q?6h1IXKNoOWegbSgQIBjLG72SmQ90liIvG9ZjWoUAg9ATVzV5J/4ikvFzuuh8?=
 =?us-ascii?Q?Z7oDRSPSP05vvaSmSPHK2PGMbbfLQxX6wQdp+zuNPMhWdRuHryr3bZeXnow8?=
 =?us-ascii?Q?z6VXxDCgp8PaUBfoa1yTVlpOgyAAyvt1gI5buDL7gAVwh+tbdtBBSYUmnY/f?=
 =?us-ascii?Q?EpcyZXvn+C4gXLpwSajyodza2qOXBFrqxaCZOaF9PHD+sm9nXe8P+csN0qUQ?=
 =?us-ascii?Q?lYBZNx33QMZAGS08+kH4ayLV58SM99k8aYKkgi3mILY8HmLqe25q9K11SdnN?=
 =?us-ascii?Q?8x6LNSU2EcnOIsYH/ac2SWf+4UWy4Nhb3JKmI0BkehHJtt9c5thGwoglJ81c?=
 =?us-ascii?Q?lqYhTOMlduvgUf/m7fIjtJjtsBwoOw0kQdzaGrpYW0IeJsArSZriKCZcPL6N?=
 =?us-ascii?Q?Y+dtdiSrJfg+n+g4aaC3nDA8ZUJ0fjvbcLo4H2RqO0nCFcOHvUisykxSWD7q?=
 =?us-ascii?Q?DsCxBWxZ8BLkBrOTn1Jitr47ryVZlGYAhL770F7PGkM3EtTQ5raMwK8los4E?=
 =?us-ascii?Q?MdLEaICbrUt6mIc9IlU4yE0judIHyuOYCwEdl5aiPkltoQ7UREA6Vtk/6ccJ?=
 =?us-ascii?Q?sDGuBGY3LydI43UHiHb6RReiD4Ahc7qjVErs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 10:57:46.7022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77276ea8-546c-410d-4e82-08ddb88e1cf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780

Architectures that don't discover devices via DT may skip anything to
do with device_t during the DT unflattening phase. Make device-tree.c
stop requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY so it may function with
CONFIG_DEVICE_TREE_PARSE alone.

This allows CONFIG_DEVICE_TREE_PARSE to unflatten a DT ignoring its
devices if CONFIG_HAS_DEVICE_TREE_DISCOVERY is not selected.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5:
  * New commit message to make it more general
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 725ff71646..741e2ce585 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2029,9 +2029,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
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
index b6d16756fc..ace7fc3274 100644
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


