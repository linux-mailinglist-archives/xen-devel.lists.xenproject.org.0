Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22ACB7D95
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:19:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185062.1507375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuch-00030r-Ve; Fri, 12 Dec 2025 04:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185062.1507375; Fri, 12 Dec 2025 04:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuch-0002zP-SU; Fri, 12 Dec 2025 04:19:19 +0000
Received: by outflank-mailman (input) for mailman id 1185062;
 Fri, 12 Dec 2025 04:19:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuRE-0007SS-0U
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:07:28 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1066ae0a-d710-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 05:07:25 +0100 (CET)
Received: from MN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:208:52d::12)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 04:07:21 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::39) by MN0PR04CA0007.outlook.office365.com
 (2603:10b6:208:52d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 04:07:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:07:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:07:18 -0600
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
X-Inumbo-ID: 1066ae0a-d710-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F63U58GLzrSm2svauWHsgSCeWYaKea507E/O+sXglWb6LoH+6Pe8wOEuVOTTsP7pM9TQnVRU9yU128/KcNac0WIbX9W0lPJecD14lumlRkHTCG2A4SL6Co4grOl3z1cSI8mEOSQCNfs+wEoU6XrmwHUP4gRQtGB8Snyy4geaqDQOmKspVw0YnI+/mW8okyXWwqoQqYRfarkLCN9m7czPUGSK6mBjGPQPamw18oPtsxZLtxFd2gMnrY1VrVyUueGIu8DD6II29ArJ5CuP/Lr8ekbMqeCXArxaKwsXMEkF1pWmcS4mcUdtrUG3ugiQXxJViKkd7kOz8HbuqGxjD/JmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csNyOjSkFIvdqjgNPlKK9D9XWEr0x478Jq7b5iigMd0=;
 b=Dwsyj7xoy083IjYLAOKtf8GWarVQqFJoCRFlQ2U97pltRpVU242bvw4hFSUz+D5NsZ9NceazQd5y2zyDuSytKmc+yIc7jQOvu/ovVCsAHbybSrEnx2fI7Dga7JP0KolCb122v5tb/EW6NqNFdrUAGzr14mab3O87WtYdisb9akUwARuDNCL8SAcmpACFfT8z8JMzDq7gxjk8H9TgXgn70EgoT09QsNS++rX8y9sHW3p76lmWNvQbJldwJBEYOfbc+RCskWBaHG8Zh7Ok73II9Oz0uXTdkj07KQYHn9tdcXrH4ech113hUhPvq7+jiF3YJKT5dqj1cZgL2N/IioT/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csNyOjSkFIvdqjgNPlKK9D9XWEr0x478Jq7b5iigMd0=;
 b=jB3hcoMn3ErSlfRVBJtgJabk0WKG/ALH86Sc2OWJXqUYRN/hs4wbCsH1zElFGU9/95M7RlkhfZqY2faZmP2Z8sYow1SBMc+g5jwUHvYiqihxxXxoYWEBgdI91XCwcQwp6zUmFXGjIoQtc/a38XktLwEevXtVdX8UsOwBibvSoI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 21/24] xen/arm: wrap arm-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 12 Dec 2025 12:02:06 +0800
Message-ID: <20251212040209.1970553-22-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e453a-6b7b-4635-b539-08de3933f2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r/qOcL7v8Hm9P3PdLZFYd+gNEfgS7g9XS5PEtgCXOgbLqdziGlshv+4IZQPP?=
 =?us-ascii?Q?IY3jSJbEDsmGzLHQvYNcTx0WrXqtcY1qp2h/nwU/Db3loARoLI0cDrG6kkcB?=
 =?us-ascii?Q?PdtSPjtFv0lzxmkkGm510vAGHF3oJMpx/0ZlTpKzdXe3QDs8UjTEgCYq16Ya?=
 =?us-ascii?Q?pUx3ufN5i3IRcfyyVZvfvPsnYUdbPScRiCAgDrHoY3AlxxodP7uQiiF8jLJD?=
 =?us-ascii?Q?5OKoPk6CXeYcOqvTXqxEvLaDOyVecg1jt27iu0Koiw7chCP9D39v2uyrib/k?=
 =?us-ascii?Q?mhpKvLzFb2Icw5QpP1iEAxcSPBsAzQjI/ugEkPSzTKywCOODIVbgH+6ZfBhG?=
 =?us-ascii?Q?sPNDjf4XGkola4+yn/bQvPe0l4FqDdS7JKfGINYSZMucK1OpYAFjGVEQ+Oy1?=
 =?us-ascii?Q?tRWvY0pTSTz/5luK0KnV24kIdT95kGa/tEqtEsw0Gv7JORjSz3OigIVedkyx?=
 =?us-ascii?Q?qc3/egDGw0aDB4YC+iXfIrJZ8ithL1bfUXdVxnOW8xCAzkPeqI8+B63rseYQ?=
 =?us-ascii?Q?8hPmya2cFx2D7nV1S7+OIEzFZ+gLEdpyiYlY0ux3qoNbZ3rLkzwPKZCwsBS2?=
 =?us-ascii?Q?9naNOF6Kz95W0OLcCe2pWnBKqNpgyF/4xLqsK9NXsl6aFNHmfd3biRSyuXbN?=
 =?us-ascii?Q?6Rl0xKXRPfNXErDGa5x3UKswn3QmTLzhXEVjWKHe9T7m2H5+iXf0aZmDaABu?=
 =?us-ascii?Q?uh3H6BAW1XtNmblV70rBXUxPnr52l/ritZ9fiAixvIqnGR+3RZR3ss4XhsKM?=
 =?us-ascii?Q?24C974xPSHcnav21ItmuRo1LHlBYiJolUkQdsoDvdHZ4988iCJNPJXyfiqEQ?=
 =?us-ascii?Q?RfVJLa6zPGdBaZohN4THrNhkbdB3joFtPsZRGA8QEOiOiQeichENQ8c3+QLh?=
 =?us-ascii?Q?0oh6oiMN1vZzTTz/zdvNI1sRfB4OsGscbTaqT6nU5snAeZ4qdN0uRncfoq79?=
 =?us-ascii?Q?pELXHqpRqqu7VXj0qM/8wMxzTThL8ySW3drz55qsBTCbPm7iC9x9dScyiNDr?=
 =?us-ascii?Q?MYQ75luJuCiyE2/BMI6MNMJG5luPKfmmYnjHOOZCBMAPaGVXDnJhZiW3shIr?=
 =?us-ascii?Q?/sB9uYSDrAUFc9yQzqohOC/6osaPrxFi+0G7IA/3EepaFJ0b8tvQYqKMDEoH?=
 =?us-ascii?Q?s1MvOf8xvwzt43KIolS0SnJOFOYdV6bI06wUvyXRvT9i++UirrBcRMfbuVOe?=
 =?us-ascii?Q?XMKXtRwpiesk612+gK4Uy0MVdzgdS0oq3IQzQ3WxEVNwfu4LiXfS/zjgdsZ2?=
 =?us-ascii?Q?jxE7Px7sIFhIqP0iJbAU0I2BSOyBEj9UtjEc0KPSFjP42YGMNxmZxWSfUsPl?=
 =?us-ascii?Q?bNGdXwUKFUPt1Ox8o88vjtsumEaZDAFLB+802o7cBT/p/79znttHNhQX5v9J?=
 =?us-ascii?Q?6dlq3ywq2NAYLU4/lykVZXtnZhAYcaD/jYosrtccnExpv2K7R/H/jxS2mooN?=
 =?us-ascii?Q?WbUkW3oCzWMHD5aA1MV1OKgwYbElIDa3NuNa741xGOV8IpLy3JSuhs2w2Va+?=
 =?us-ascii?Q?7b1yqN8WvDLF5LFF5RtiIvhRDWHeKsPceFXQHpQmAd1l3Dw29JlGRTQkp10H?=
 =?us-ascii?Q?Z6yqXyW2q5T6d1wWYIw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:07:20.9563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e453a-6b7b-4635-b539-08de3933f2a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215

Function arch_do_domctl() is responsible for arch-specific domctl-op,
and shall be wrapped with CONFIG_MGMT_HYPERCALLS
Guard arm-specific domctl.o compilation with CONFIG_MGMT_HYPERCALLS. Otherwise
the whole file will become unreachable when MGMT_HYPERCALLS=n, and hence
violating Misra Rule 2.1.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- split arch-specific domctl-op into x86 and arm
---
 xen/arch/arm/Makefile       | 2 +-
 xen/arch/arm/arm32/Makefile | 2 +-
 xen/arch/arm/arm64/Makefile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 069e2c532e..91ac4d6e32 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -20,7 +20,7 @@ obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a..f8cbf14211 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -4,7 +4,7 @@ obj-$(CONFIG_MPU) += mpu/
 
 obj-y += cache.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..6b77a15abe 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -6,7 +6,7 @@ obj-y += cache.o
 obj-y += cpufeature.o
 obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) += bpi.o
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
-obj-y += domctl.o
+obj-$(CONFIG_MGMT_HYPERCALLS) += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
-- 
2.34.1


