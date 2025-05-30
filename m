Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09AAC8D5F
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000816.1381039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKya6-0007SC-5J; Fri, 30 May 2025 12:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000816.1381039; Fri, 30 May 2025 12:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKya6-0007QS-1c; Fri, 30 May 2025 12:11:26 +0000
Received: by outflank-mailman (input) for mailman id 1000816;
 Fri, 30 May 2025 12:11:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySh-0007de-Pa
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2009::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22f8a985-3d4e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:03:46 +0200 (CEST)
Received: from CH2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:610:51::12)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 30 May
 2025 12:03:39 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::93) by CH2PR15CA0002.outlook.office365.com
 (2603:10b6:610:51::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:39 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:37 -0500
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
X-Inumbo-ID: 22f8a985-3d4e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FApZYcNUFDbA8t5TTmmWAev4Z5M7nfjSK4QuSVIuvuG4V4aq9CF484LV6SH8tPTuaExtGKXgmu/1UcsdZMAUJsT49x2uKsclR6F0wPpUubzDMLPI6nrzy120N2pi8POam8tOlL3KoeSl5dYFxDgWvy2piaRUkmo1AFyuyFLtvsSxjC+DitH6Chmyq2MPHwqNhBKVDvIpzqnqFPx3ofD4IzoexHnebCnZeov5Jk1uq2GPuvcxl3IooBUIeK6tOSMsyTABFsIoC12oOJqqilyLHDO6EJnJmGbReQ+DEo3v2ITf7tGn43FUndO/ZbVoLm5+5OTOSlOCP98Gu4U3shcsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=whoI4/Yktv7McRxiKSJWf7JOBZrcYRZefilaG2gVRQI41iz/DfG493r+cB0T7a+NCgn5nRxmC6xw+tFp8qBoGj1obcwk5ljW0XCEirEc6TRyI1lkhdXITElhvbAF6S9DNQWxORbPWJjJ2HDhxW47NDkdEuvbFnCfeM2tWfQWnAAWiCp3fdC8iEBNg9SQldBYTuvu/6XdbH2fQv4ismcgWGmxh8lFcNv2q+RpvggceKTwo7KpJdf1dUUwpjodFTF1qvTHcQCV1gjTgzyYuDbMKSD3Py2ZQivVYoEsXUJ7IRhaTRvg3ZM3Sx429RFH/kIUIoNecix/ZkChsk/kYmGt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=DzZzlL7zUnuVTqSHzmw4DRKEzovfI8CEc7TbmadFxSpWDgItOKBpfiT0F22VQAYYGLVzTBAJrS07Ik9CpuK7y+ZUAVwU1n66FUOV0QBytnFpNSIe80LZfCLx61Ob6BfD8NWWHm/j4wf8w5KYjhMwsr6j/kGjwY2WnhORL1339OQ=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 17/19] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Fri, 30 May 2025 14:02:25 +0200
Message-ID: <20250530120242.39398-18-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2118cca4-a710-451e-0921-08dd9f7203ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sQVYap2R5s5FGKz4VYuN3+3p695tfy2wSxQ9jyCL/2G3YJQ0iWCdSMlC8UA5?=
 =?us-ascii?Q?4wI+bgKhcNZgiV3ZsqQ9hMdppi0FXoEetRY/8CvJJXze55ALraeNOibHn9wU?=
 =?us-ascii?Q?BLznXIdaMdYYjnQMbde9I3UC/WBFv5b9I2jXGksk0PTSKSZ+iWXf1nEy/0M8?=
 =?us-ascii?Q?YG4UlAWitYofLompjcX9POBEcI2gBETuwmHIerOWmx7XSZ3J6LxKNggdAz7H?=
 =?us-ascii?Q?2sGwNjkOncUbTXUN6T8QIyvyHoPV4HA+8H3nv0trA/MKTxOH3JnzTe8bY2iB?=
 =?us-ascii?Q?SXrXzMIu4X8de4Gx/0Te4QS3gAWQQu+RzMbIf3uQKbbqwHcW6jlDRfxElPZe?=
 =?us-ascii?Q?LApAPuJexW0RQRNZk776Ye1dtNBU98Yqln3Si6W2Yr7Oje/bDHnXiEXr+y1c?=
 =?us-ascii?Q?fPsafBqVRU6+nrMU/zOKezODI7jASA293435CRxKX0q/SlpoGjEF6TJ4zQ1b?=
 =?us-ascii?Q?I7/JR5N0YEB3rdojPT8YAu0eFonvW9OPo4vxHGT5AZmcU9IeT6QXWXNP+/rE?=
 =?us-ascii?Q?cFV3TSyBf0+HA+Bq7TK9HpKujjC3JrHTNgjArbOUCcnfhNLCbedWsK9sbv3h?=
 =?us-ascii?Q?FvHU23L1JNPFFQNLxG3w8kbi6tJULjXCW7F+vVqwXFelUR9Y4oVM+t8+upJW?=
 =?us-ascii?Q?WwL4eBJs88UAMbU6wO5acuu1s9VKtva5z+djbAap0jetIAECLWLRSXlxqNJs?=
 =?us-ascii?Q?QK52hwgQ6EZVTf+W94mMuWlofYMixj3BGF3HjtOBXu2WNPARxvoyBhxgM1XB?=
 =?us-ascii?Q?65t5GxtjkzqkPBrRZ6fEBKU4tSUMFWpPbyNaf1O3dRQUPLg3LQREg4z0/nsF?=
 =?us-ascii?Q?OvSkaS+5C84FaILBlI/bAoJVfYd9/mf/3GLyJ3aqIpAKnPqX1aTEEv4uNFUR?=
 =?us-ascii?Q?gggEJB0HTuAZBjP7nrB66nfSzrqJ1rJS26XA6TM+1KodJdknmd4cLp+LwpHf?=
 =?us-ascii?Q?G6VO4wJ5xf+hgOwxik56V7lzM1k0iW+AUFX1rqolTvYSXoPvWnKFCI4a1wuK?=
 =?us-ascii?Q?g+4++okKfucZxDjZT51rpnQpJEnOVGNM4QNYGUBFCYDm+Kdae/dsh5WFV5nx?=
 =?us-ascii?Q?KYqPLr11sNXtMZ1EwbDNjSKRgPyXLxOipIthxwSncYvx94+1OFrUN9I8gkLO?=
 =?us-ascii?Q?Rdih1Q2IVsKW6XGhvHitir63gWQ5hQvor41REb8rMF5oGJiu9ugyjhqd8Fck?=
 =?us-ascii?Q?zHPc8daXr60eacGmyDwhXN0vSNlGmMYilUDWTO9z6Apq+fyrxStlP50PEPnr?=
 =?us-ascii?Q?Pm6e9LN7hSw1XbdN8p9kXPWFPSD7YAtcvMKaI9KbwvpPPZAJJQkKP79N0TvV?=
 =?us-ascii?Q?VXkguQSlxfGPgRkLGqvnbcFbUOqyCFxLsgSXZJ+WIJfeEGD0HztVztWm92vc?=
 =?us-ascii?Q?6K9yZSBmlyqxiZcqh2hfddhc2V/bDVw6A24V1Z91wU2AnJWAwqF/BlU1Wdlr?=
 =?us-ascii?Q?AeU1FHgMntMUdnfUKQEk/jKAUqbJQWOXRfAE5zbUyDG7u/hSxXdnP0fJsrVK?=
 =?us-ascii?Q?xpfOj0N2pmYGBAQqrj6efpn+/70czmTk4sHm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:39.6891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2118cca4-a710-451e-0921-08dd9f7203ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885

... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
and may function without it.

Not a functional change on architectures that currently use these files,
as they already select CONFIG_HAS_DEVICE_TREE.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 886e6c7712..c8a9c0e46a 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2028,9 +2028,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 7d1c8bc305..641f24518d 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -109,9 +109,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -120,6 +123,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


