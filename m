Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163E6C8B076
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173108.1498205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIds-00005C-Iz; Wed, 26 Nov 2025 16:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173108.1498205; Wed, 26 Nov 2025 16:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIds-0008Tx-C9; Wed, 26 Nov 2025 16:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1173108;
 Wed, 26 Nov 2025 16:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdq-0008SW-JM
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:18 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 485cf5c3-cae7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:45:15 +0100 (CET)
Received: from BL0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:207:3c::40)
 by DS0PR12MB999082.namprd12.prod.outlook.com (2603:10b6:8:302::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 16:45:12 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:207:3c:cafe::42) by BL0PR02CA0027.outlook.office365.com
 (2603:10b6:207:3c::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:09 -0600
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
X-Inumbo-ID: 485cf5c3-cae7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJLZ1rFwC04U+OMcjHWqgts49r92kgEjOd16llfWBCrC42nrt5PqTHHrFGAQsgajiKc2lwTx71N8BK9B8BI9oJpOS/YCk35V+stWHD1APXA3ZwYi2pnMSSUXrsqwGZaIxQWaToTYUqaTbbUn/VlWH5yJ+ZPKTVo56Uhg8DWzO6olSU/CH4Lxh2PH5mlXTIuuafL/UEHXNsUmUDs2Huj5aVCv8cb8E1x/OZVnQcNrg+CKjCLweKywmQBAE4AgmHqdTvvlHwoiwodI2M1ouie4cBhPxP4sBxuUWgFKLT1ZiMD4rwRktu0w5I+OZIXYoTdGxp3y+FghXuT6YKSOFbtc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psHLu3+Kdil+NvAYCckUpgX64WyO4v7EIof+M6uimCI=;
 b=OXTjSRyxy8wyRE2Zdrh7lWduW7OcMsaijvqQj/4fnzZVNEpr4E1Jljyt2aM0hQgeZzHI9HaP+Nvpnrxp9o/eUNfhRAhZWJBjZ6p2c+KIOOVxmJPWCQeddIiqrI/Z0pzrGK08AeqaTKCfpB8mfdAqRxxW8xhnCj3Eo0KnpbiaMHXvtvzoq+lBxFL9Q7U8aFPbYlYDGS3Itaqi8SThvQtL72fUaqvKSCurWwyE6YLDCjs0syUAlxicVAExc//ec3j5lO6692lzlbFKD7psodjWrdHAZgIuRfaQzFlEE2abALgNbEpSRTDbpi9iHQu8Zp5ds0CYiAHEDEGo70R86CaX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psHLu3+Kdil+NvAYCckUpgX64WyO4v7EIof+M6uimCI=;
 b=ys6M1+Yo3wq8eJUnSrkHS59l5UjD4t+quXAS9bakkNxMzFDAwaxJG8SOwVEdRxCtkU/jWEgRQkG62S6ZENhCb1dIUpzsWxV6vS0sEiY5hILnaToNctS9/Q4a2slvbwK+zukDAbvTJlBdBBSREbAJLys2X0e8BLmHHZeYwZWvsec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>
Subject: [RFC PATCH 05/11] x86: Conditionalise the inclusion of Hygon/Centaur/Shanghai cpu/ files
Date: Wed, 26 Nov 2025 17:44:07 +0100
Message-ID: <20251126164419.174487-6-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DS0PR12MB999082:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b68aee9-3962-46d3-9134-08de2d0b2aa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rWaLJkCa81zmy2Q5Rh4uYFj2xhzj5X3VIzTV88YN9Lxg1jYd9VCuYK0Goaba?=
 =?us-ascii?Q?dVGbO4bhjZ3j5L0SpUIZkxl7TUYHW5I2fQUTDsje7wbSJPoOT5l1/zWUrwxo?=
 =?us-ascii?Q?6ZigVk8KZHCg9DmfZImXzJ9rwrENrx8mxFNo+zzF69u0NrSf1kjWr9mWo00y?=
 =?us-ascii?Q?5jm13yM8ZTtI+/7GIlW6/oP1ku8YggvoWK5VzBV5HPP1m/KO85YgiyQohX8i?=
 =?us-ascii?Q?NQ6AY+y8ZAzTVK49UZCSkX7ks4znvZoVWOK8HGcYUuzAUwXce+F9LealW8pg?=
 =?us-ascii?Q?mWnqx4uCOAptQjIj/rei7EVMdHnfIpDvyglejLvWEZz7ls2Ew2LEHu7HHNKS?=
 =?us-ascii?Q?p4ZvaW7avNcvuxo81eqttU9q4LyFxReWbVKe8cyM0gtftWn97DDdTVEsxVVo?=
 =?us-ascii?Q?UjLhlYaaSYU5u/3lTsN3s0NO4wgO+ICHhjwQMY2z6TCGfv/39cJyXLiB/yCz?=
 =?us-ascii?Q?XWbp1Y4uU1kIvDXPsx+6HvN00NeTXNko/Oxr1VjK+4cBtnoQd2F/KZt7nUoM?=
 =?us-ascii?Q?uBxqEWE3QKfjNMVrBkK/PUcIlaABewqncbat6vVWnd/LCjHOurKMSCFFDK4o?=
 =?us-ascii?Q?gs4YyR1sVyvvqyZ5YjQwV/CB3oMsS9MTR28946alNJ2rk68pAUgdY62zsrLe?=
 =?us-ascii?Q?v8vf6pVvjUMHHcdr+ycfDcvyB4A+sdUQTQXOwF2ZWMr/5Jk0h8f3Mt6uU82P?=
 =?us-ascii?Q?vh1efbC16lB8VGN20zcTDBF9TTcbe1PScs77Vju7DLcPYNzfFdqp27Rf0No0?=
 =?us-ascii?Q?QAtZhwEJLgMkHsuvAUad0PD1BM83gMsaOpYMrjT/z9oh7eAmYAYnQ5MbGWE6?=
 =?us-ascii?Q?tnZ3m8Q0gd1/7QpQPEirsUixfxERJu/16Fdruyd6XhGtJSz97xShbwmdlect?=
 =?us-ascii?Q?EAMVokxv3yU7UERAeJO+HBfvTPEbKpkSMo17RWCF3QwsWwkws7jPyJ0WszSH?=
 =?us-ascii?Q?LkeKYyciwt0xAh34DdYwW++OQAsHdFfzroTAPOCV2cYNTKiEvyyziQv0jw7p?=
 =?us-ascii?Q?R7pJtw/Zw3HV+qA0EAR2q2Dp06yWYCMhUGGhXHPwjHGv8VW3oGrYRRd665Iw?=
 =?us-ascii?Q?42az+p5QA2a5B9tI242Jg5i6TkTnnSFTfV8JrvCLuLTk/hBxJ+8F0EkPphnu?=
 =?us-ascii?Q?f1+TcBIAefYUMMC4z1IvSLz9G5bD4WXzp1764TW2nxXaU/2e0OwwhD9asKej?=
 =?us-ascii?Q?SnORdbZzuCQU8vQOUvXdnGg2yLI5rVSRcQGewhmgvfStXtflSEdpW2FnTi2g?=
 =?us-ascii?Q?3xDWFY8Xj878N+P4VKYjM6a4PhYW3ZFv3LjG4/Gmaxqw+eRRMdacGLWBdXTm?=
 =?us-ascii?Q?nT+PTxN0ClXS31Wrb0aRn/NiLMHiqssfjwB0DP7/ZWDNp+dQ13T8E5zJiG08?=
 =?us-ascii?Q?qt95iv+KvPZfOmCHugx1FgNAJW4tjRx+qk+o9BrnX3yXEuvaZg87/hSL8fso?=
 =?us-ascii?Q?phXfSKf3N7MS0/TEIEmrNIckwYymz5B9zsYLsVa4pPRGceLax5dTDn3mURjv?=
 =?us-ascii?Q?jMaa17Uj5E6IlXss3obf2fijjPgiWXgHx7mRK/Eu8HenTWAtyVmh+Ro05Q9+?=
 =?us-ascii?Q?yUohFEXdxaZQk5F51G4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:11.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b68aee9-3962-46d3-9134-08de2d0b2aa2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999082

x86_vendor_is() is doing the elimination now, so we can just drop them
when the Kconfig options aren't set.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
index 7cfe28b7ec..84b060aa41 100644
--- a/xen/arch/x86/cpu/Makefile
+++ b/xen/arch/x86/cpu/Makefile
@@ -3,13 +3,13 @@ obj-y += microcode/
 obj-y += mtrr/
 
 obj-y += amd.o
-obj-y += centaur.o
+obj-$(CONFIG_CENTAUR) += centaur.o
 obj-y += common.o
-obj-y += hygon.o
 obj-y += intel.o
+obj-$(CONFIG_HYGON) += hygon.o
 obj-y += intel_cacheinfo.o
 obj-$(CONFIG_INTEL) += mwait-idle.o
-obj-y += shanghai.o
+obj-$(CONFIG_SHANGHAI) += shanghai.o
 obj-y += vpmu.o
 obj-$(CONFIG_AMD) += vpmu_amd.o
 obj-$(CONFIG_INTEL) += vpmu_intel.o
-- 
2.43.0


