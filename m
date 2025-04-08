Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EABA81184
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942759.1341865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVf-0003Be-Mf; Tue, 08 Apr 2025 16:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942759.1341865; Tue, 08 Apr 2025 16:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BVf-00038x-J9; Tue, 08 Apr 2025 16:09:11 +0000
Received: by outflank-mailman (input) for mailman id 942759;
 Tue, 08 Apr 2025 16:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVe-0002e3-4R
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:10 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2415::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc8054cc-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:08 +0200 (CEST)
Received: from MN2PR22CA0003.namprd22.prod.outlook.com (2603:10b6:208:238::8)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 16:09:04 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::78) by MN2PR22CA0003.outlook.office365.com
 (2603:10b6:208:238::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.19 via Frontend Transport; Tue,
 8 Apr 2025 16:09:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:03 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:02 -0500
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
X-Inumbo-ID: cc8054cc-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iku/gousZ21/CoWtL7lDRJ2yxYjsJmDEo6Nji6wFn4aNP/7BW4pts9DoxmVkjaMw7EawiRofc3Chkt8owRbWqhiPe5jZ3QRjiYFCZWxWXPM5xjqK3BnTQd+uMth9Mk/A0QnsG1zjTsB/oM2gNOdMac8H7f67uKiBUL24enDT+mG+yKK2i874owUwQwmZUE35uUb3q54qbU4r+7OHNcoIAdZNK3zF2p7j9vWF/nJSGgXPWe4jXfWAanOHxLJ0WfHeFEHCBPmVzLLo2Bth+4EQpX6OzuTJLYectXad0OkfvoEBHnXU/on8Rd93H2CqXh+ka+kcM5lZQYv9wO1fYKU/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCvGl5qSWPYcGWEgjrtQ/PCpkzIvwhogP31QetCQZRo=;
 b=AAz08EdfsOsDqAM5n9sr1f7qlqM1XjUcZVrqqCv1Nj6XpXH9ue9mWvSsHwYW0qlycTf75JCJv+Z6kXLFSm3cYZ4aFB68PFFM16+4tPO410g69Uj8vuNKcU/jFqdwfYcFmDztWfhD06ROalbdUB5OfLddPCrKLZ5PkxRPQkuMzWomaSbPFzySULMs4rxtU1MnG+Wd0j5yv+L77DWjXywNYaAZdVoYzBgbsYy2EhZcXThyP7Xzqztd40plxpV0E8Js1gvpjWeUYqjebrQyfnoG7N4F2iy5YnNhSFnb6HkzvXzSTubaC/guAR+Wc34wJbIw9dZeHuC+//pgroc8LJVLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCvGl5qSWPYcGWEgjrtQ/PCpkzIvwhogP31QetCQZRo=;
 b=lGbrErOSaF+06/NWLGw6hf27+tbSIKW/vhkjPRLkfXDoqqjGOEKnP1zV26RDQsYZKHSmUcxVUiNpKt3uA49Q+6EnneSptOoxnDNDv/qDouOFES3ltLbx0ssPflYVnVzFK1p4z325RYqxfXmURT4BZPx3qRG4HVDnqDmAgRBKEL0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 04/16] kconfig: introduce option to independently enable libfdt
Date: Tue, 8 Apr 2025 17:07:26 +0100
Message-ID: <20250408160802.49870-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: eb043a52-d5fc-42c7-9be7-08dd76b7aea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dVjgg1Wek5nh/RpX9n3dW4BeXfcxPzsrooILqrwAZp2qRIVVwZ11ghX4Pfqv?=
 =?us-ascii?Q?5c14qo4i96f+GmbUShJEqkJHndJqzlGvFDMMd+3bHDIET8fURTfigTmIx+3Q?=
 =?us-ascii?Q?DrnmQP2o1rfXHa5/6qZ4NHW6HINFVz496skXY62+5yUzL/9c8J6eNGFcqeR5?=
 =?us-ascii?Q?hrvSj0p0s+G6xsABWB1UKQdy8mlAyOepBaViK3oIyDlBC45tmOMlOxkjxyTO?=
 =?us-ascii?Q?uu9gQVBCceNBerPiigGSc/1sRHSitLqvnjBVkqltr1u4Ht4bUodBc0dEf5jU?=
 =?us-ascii?Q?4LAOVoLakCLZ7JcDtZyWA0p9ptfrypONBdML1aCsYK7Ui/yyVkA4dcD7HHDP?=
 =?us-ascii?Q?VKsb3XGzCCV68Ba72fNlPUR9dqvn9vUrjE83CFtAYhwGfjBlBd9MjfRJcvjs?=
 =?us-ascii?Q?kIzPrYZny6Qcgo35ZjYDrNBOsTSetrj5iag92DiYnNbEATEemZ35B9dEsi2z?=
 =?us-ascii?Q?Vk1YAu1AENhT6uPzw4LZMgh80kKe0eAl8ptXEFnlkiqUbFDxdmg6Z/rrnqFu?=
 =?us-ascii?Q?AtdkpU+61fkCteOOZOkRtacbz+otEz4njdkzhcMRBBUa1CmWumD3GSZasEbb?=
 =?us-ascii?Q?zXHMqu2s6oqIqVf6m/5szApzKC4RPS9wzfj9aXDnk0fGdwwmmwPblx39WnZN?=
 =?us-ascii?Q?9XqqDEXDla9Red6VRAwAMcEBDlmBX8GIBJfWp0PEDWhxhKnWQ+mSN5BVkYeV?=
 =?us-ascii?Q?v8iY8TV++NzexciDMIDjI/YKOSe+rPOLVxYkld78tDoKwBmmJGpfcOSwLvNk?=
 =?us-ascii?Q?8NddMSWtCcZDcdf/H/0GzAyj85tMEwENlo0dZBOnvDQJBWE6D3O2+MRQVn1I?=
 =?us-ascii?Q?8Zs6vRcSw7kJKDm0Jv2W5ky09QuUNWaarGVx05rg+yHI0yNvLX4SG5IMo0RM?=
 =?us-ascii?Q?/jXAML06n0z8d8c3F+LPH9D/ECrCBMWJZZyUj7LqVNgZ9F1Jv44MQPqyUsN/?=
 =?us-ascii?Q?GDMIXFy2emuZxBA0tByf5LYHtV1ObIgvxXlz1U08vfya1ELQLplvqSTQVoZA?=
 =?us-ascii?Q?+i4WTW+3oXucBsJkhq2z1xK/WnE5DAFfdVy/VqoVVsOPG02NC7btmKuU0bcY?=
 =?us-ascii?Q?dDhHpIjvs6FINhh0XPWCsPT+j6Zue2Jef/JcS5WtVuowjyMdfHQEIy6z+ZqW?=
 =?us-ascii?Q?ZV1B8wNp9dFdlERA7AGEqOmdDJwJODXVlJhfllNsga/DWs+/Kz1f3XE5RE3g?=
 =?us-ascii?Q?aBc9qZN6q0Hx2N4FdPBvCU3EGsQKLWe4WaCTXD2DeqqZfJ9mbuLHxLO3yzLv?=
 =?us-ascii?Q?mBwZiYGYpX0zcYEgNnpICUT0RLy+lzTXSHtupF/XfIm14T5r/y6kltOKnM30?=
 =?us-ascii?Q?xWhPAN1z2ODmjYgXvFcu51Yj1/akOWyTxvKyh7Q7UPoYIl9Uy3kuKJvYGQHZ?=
 =?us-ascii?Q?Zx8LQ7gd64s3UQOsi5nS/eseUiiX6+5FPrOJgJpThGtrD+teJxKajI4fS9j9?=
 =?us-ascii?Q?jPYbOF4XAzk3IcgKyb0XXS4TwlRm6O08kPeew6R2wZhda5l+QuJZPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:03.6994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb043a52-d5fc-42c7-9be7-08dd76b7aea2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Currently, the inclusion of libfdt is controlled by the CONFIG_HAS_DEVICE_TREE
kconfig flag. This flag also changes behavior in a few places, such as boot
module processing for XSM. To support the ability to include libfdt without
changing these behaviors, introduce CONFIG_LIBFDT. The inclusion of
libfdt is then moved under CONFIG_LIBFDT.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
    * Use CONFIG_LIBFDT instead of CONFIG_HAS_DEVICET_TREE
---
 xen/common/Kconfig  | 4 ++++
 xen/common/Makefile | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 06ae9751aa..00f74b1e32 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -72,6 +72,7 @@ config HAS_COMPAT
 
 config HAS_DEVICE_TREE
 	bool
+	select LIBFDT
 
 config HAS_DIT # Data Independent Timing
 	bool
@@ -106,6 +107,9 @@ config HAS_UBSAN
 config HAS_VMAP
 	bool
 
+config LIBFDT
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
 
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 9da8a7244d..5a9041b0ee 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -79,7 +79,7 @@ obj-y += sched/
 obj-$(CONFIG_UBSAN) += ubsan/
 
 obj-$(CONFIG_NEEDS_LIBELF) += libelf/
-obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
+obj-$(CONFIG_LIBFDT) += libfdt/
 
 CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(objtree)/)$(KCONFIG_CONFIG)
 $(obj)/config.gz: $(CONF_FILE)
-- 
2.43.0


