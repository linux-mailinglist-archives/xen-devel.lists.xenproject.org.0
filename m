Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF1B0CE9E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051868.1420310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0aq-0004nq-Hk; Tue, 22 Jul 2025 00:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051868.1420310; Tue, 22 Jul 2025 00:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0aq-0004mO-Ei; Tue, 22 Jul 2025 00:10:52 +0000
Received: by outflank-mailman (input) for mailman id 1051868;
 Tue, 22 Jul 2025 00:10:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0WX-0005aW-3x
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f403:200a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad712e9f-668f-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 02:06:13 +0200 (CEST)
Received: from SA1PR03CA0003.namprd03.prod.outlook.com (2603:10b6:806:2d3::14)
 by SA1PR12MB7296.namprd12.prod.outlook.com (2603:10b6:806:2ba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:06:08 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:2d3:cafe::79) by SA1PR03CA0003.outlook.office365.com
 (2603:10b6:806:2d3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:06:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:06:08 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:06:04 -0500
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
X-Inumbo-ID: ad712e9f-668f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvj+j56XF2pfvR91B46uwcskoPYkjiBKs3i5MOpX7KvzyqtW7SSd6KbrsNetKhk/xP0kBm8YSN3Ltgt5frwmgaGG2aZwYOoVeaRkWCuexfCqEVjjOcTywKbGnrxrukeMxLBTaxhet5AV5CWEB5iM6JO9StrwroXetKR2UU8RrX8wsXNNkyjIWWr6Aava2OfVgLWkSsLUl/dBQLo5Hyu0HXyrnqtVJb6x8QL4tAAvUM7pF4ZBnQP2f27GHmcYynn/SvSMgv7OAePkrYy35srZLG5YS2AKd0tqDhgLOgjwLgtdwupDWHdlc4M/7w70XLDZsScbD6uhw4tQB237x3GLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuZAV/ZlkHtFzr30EhBJl223Vb8fALCS+9rIBB4xF/M=;
 b=AOT7g1z7Oeb1U7x7Oe/uzE8L9TFG2u9U3LHB/0/BYWXHs5P5lQuSQ9295v2JZLgtxUPfp6LcABEqn5kbOis8MRT+zcmqFlDcTCZtDWPCHj7YT+mEwS55DidCO3Gb+40epLdClc4FEwiG8h/ewUy6To1sDog6n4H0TNUSsZ84vicjbMT3HiUUTxbRTPpLrQJ1wr9BLb+VSvqCCKV2+Jfp0BeOtWNeE6p+NWKS5vv8JuQLRubjsLG9ItLGDJjFimjjsqNF6JnmhZBUVzXSqqPhkp8ObBWZfM4YmLBa7K9s0bQDvoAlrTgUN6ZpxjipTctFRwW+TOxz+UMdlhTDZubNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuZAV/ZlkHtFzr30EhBJl223Vb8fALCS+9rIBB4xF/M=;
 b=GnCam3886WUOESTwDvMdcp8TZtc1FgJbpQEka6wkp0lcLmoNdnxBvc2bQEehyxfsSE0LNi1x3t02dzUmMKzVFkaTOdSxVPgAOL7pUzyJ1XpYj0MqRPdKf6imqifp9MdOhrfJsbRrUJ0yh3Mi4dpkuhJMUS+xrF+DOXzVj1l4Wao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH v8 11/11] xen/dt: Allow CONFIG_DEVICE_TREE_PARSE to include device-tree/
Date: Tue, 22 Jul 2025 02:05:23 +0200
Message-ID: <20250722000525.7247-12-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|SA1PR12MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 842acead-0fb5-4f7c-f935-08ddc8b38f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eJFMqT6yFagVZSPrE3ORHC2zYIi/TO5e2i66NMXjCnCPsLD6zVb3mF0Co3in?=
 =?us-ascii?Q?y0DyRXtl9jDRfLIDYdXiJCvdPH+SKiXcwFJdTyDFVG9JYdmJnRbIREX9nq4q?=
 =?us-ascii?Q?c2NtETwo0bkjAVn2dqbC4mC7DlcLTIEIVR50i3zK3HKqmGCLRKd/ti6BWDFQ?=
 =?us-ascii?Q?apzoPsaqSVq8zXXro6Z8jBQbrO9ZW/Z5bSfN8RfMBkvzhQGuoNgUjhyBuhr7?=
 =?us-ascii?Q?nbnehjaqoahtHbiP4mSpwbioUzdayLTG5eKyO49G2efDK30VDLjq5zUYDeZE?=
 =?us-ascii?Q?yWwKuYS/zKyc2CmcDfdcIVhJHejhgOMyuJTfvtbNz+uTBmF0gqXOsOspk4qZ?=
 =?us-ascii?Q?DDVcIRbHTMyw2XL6ZwdKMRXgsHo8Uz5VfJh5DCw+4OlQNkg4GPZEk/o42+xX?=
 =?us-ascii?Q?TtLHItr3I2/87v24aQ1ldWpyzz3fOatocYeNLmOJrW3tzKD/ofQYYDDUleWb?=
 =?us-ascii?Q?2LMiQtjxV5zg4iI0k7Yc6gBJrC8XlaUOCahHkz2B9C+E5pnqvXKge806LPIM?=
 =?us-ascii?Q?H4/ULORwQhf6LJcrLthyYkkrFbodZefAUSqTvkuW1qneYXnl1xkbbnlbO+JY?=
 =?us-ascii?Q?zCsZze6ZwtUhOBgQfRtsWX+mhT3Q4M6LNBOnwAAw6o797iNbR/oJbh4YT61Y?=
 =?us-ascii?Q?0ABKV4E4YRuqEA8JDt1Qw1BtCposhxxL0//0StwGpHUxP7Wd6z35e7LI7p3A?=
 =?us-ascii?Q?5YVhNXKVixz0iA2cUTqlJ/taAnFb5zfyqxuKSx3Z482BAxUxxgBXyJwzIW8a?=
 =?us-ascii?Q?EcKrq2/uq4zQ/2KY+DREn/3fgnoC9yFoK0DiWDMUXtrWhvipc7OGxXicUhjN?=
 =?us-ascii?Q?FZIEjbdmXXl3Jkm+fQaT2/VzaYWvsiSvSgswjEec9QsLYIhC4SuzEPcV6GG8?=
 =?us-ascii?Q?dLAGvAJq4/zGdhT8QZBzjaUAjrVkJxg5DPU5ZkwxGuJZJX2JOe9U3ueZVBXG?=
 =?us-ascii?Q?LiLRriqzH9MB4Z1MMkhrhY5V3yi8ngAvQaYKfqH1jWNIJmzioRvnkPppXOfQ?=
 =?us-ascii?Q?gyf4OTNb6CpvoFSinA9obgO1QkbMsWvQL9JxVbq+yT/YLHgE0sXb8cVyppTJ?=
 =?us-ascii?Q?kS5GYV7dzEGuHVT5xbdy9N6fQJO4lx2qJvqM9excYW4sKRN20zn4etpGHb98?=
 =?us-ascii?Q?31Xe2IzBxXXkUJHbkTNqDoCvJEJ1vUxvckmwtWRSpV48oqM3ImAAXVwMTllx?=
 =?us-ascii?Q?QwHcTiUqss+ZppDOIs5zZYACcxsR6860UiZUvmPHWBWGpm01uMAIVJRzqqeB?=
 =?us-ascii?Q?HK45Dd7uDFTTdGbi2HiEpNeHkXomq99nJ4r9Hc73QACJDSOdHMsxQ9J8E60G?=
 =?us-ascii?Q?buTFe5q7YJCr7/uIq2JMum7JzPXF86yIP8OHLcundi+dmnXoy5R6YOQjQ6Mx?=
 =?us-ascii?Q?Yt+BnDvKgKhKEYf8+wJx5YCgMlB8qYgzc9p+W3MWz/ZumeV4dVKyA5m5IVqQ?=
 =?us-ascii?Q?VKGjVwyKh590lLD0dSwMc2rFgVAKpBSeeSo+4ZKWnBlEijEOwpoFSEHsbF3j?=
 =?us-ascii?Q?lbOOHWI8iahoh2HBheBAZpuCHdwmdpWWyGv2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:06:08.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842acead-0fb5-4f7c-f935-08ddc8b38f71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7296

This allows bootfdt.c and device-tree.c to be usable without
CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Gate everything else on CONFIG_HAS_DEVICE_TREE_DISCOVERY.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v8:
  * Remove duplicate obj-y introduced in v7
---
 xen/common/Makefile             | 2 +-
 xen/common/device-tree/Makefile | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index c6e8a36cd8..8dce771970 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -8,7 +8,7 @@ obj-y += cpu.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
-obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device-tree/
+obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += event_2l.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 8abc069c4b..e399242cdf 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,11 +1,11 @@
 obj-y += bootfdt.init.o
-obj-y += bootinfo-fdt.init.o
-obj-y += bootinfo.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
-obj-y += intc.o
+obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
-- 
2.43.0


