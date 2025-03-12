Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6ADA5D503
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909783.1316719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQf-0006tX-Oz; Wed, 12 Mar 2025 04:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909783.1316719; Wed, 12 Mar 2025 04:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQf-0006mn-Eh; Wed, 12 Mar 2025 04:10:49 +0000
Received: by outflank-mailman (input) for mailman id 909783;
 Wed, 12 Mar 2025 04:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNS-0007Fd-JK
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2417::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 825a1573-fef7-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 05:07:28 +0100 (CET)
Received: from BN9PR03CA0663.namprd03.prod.outlook.com (2603:10b6:408:10e::8)
 by PH7PR12MB5784.namprd12.prod.outlook.com (2603:10b6:510:1d3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:20 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::74) by BN9PR03CA0663.outlook.office365.com
 (2603:10b6:408:10e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:17 -0500
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
X-Inumbo-ID: 825a1573-fef7-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+n53j4bARuUSWHHQgVc1V3AaS6LoxRAU3r23v/IbGMGdNtzjVhVtMCRAd6DmzB5FJ0QQyB6pgMl1Yey1BcGsyZBAtUswORElELuucKI/5nHu9vCT7up2g8By2VlRqf8GjDCQ6BDc2m/5/ASpWaM+Vr+4ks1znoNYdgEFaEAc9zweRGz0TadYsQOP0HSSK0ouSuJbW56S1D2ZRH1rq2TSFFvYmqR59xTcTw8HQdpfl+i+bJISa60VmKgV2fLjexYOVmmtU2/RY48cjc3AVNVd83a7DcGYHMm6XhXbvfE5RU37pRX4K2pmW7b63aPBC0fUhKcav0zhatTTzjjzF56MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLEI3G0mdFjl3RZdhIhDB4K+LruSLZL23++Ti9uAVpY=;
 b=nosc/o+i+GfMnwj2CM2Ag73OQ/73nUfQJASvHcaKq40BcNfe1ubufJphDuwdzqmBhlt78/lTC9SY70qUkaQMPxGHKYVuZoDvtfmzleZzhzEXldnHUPfr+X7HokK46YylyLX9l54HYymKAvG3ygHJu41UeTdciXYi+gure7afo2LLdpp9vLIjp26WNtULK5S5Tu8pgesTP0juz6xYKGoFgF5Emkm2E5vdQcfmbZmYbdArSGLEjwhoR8K9jKf5Gq8OxTUCUlqz/qP2jY3ydbdwukUQ9Z7c4KHKslJW1S8OBfHaeW1WTniEgDmks7qTymDBgGkseoWRcvM+mvAvK9lc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLEI3G0mdFjl3RZdhIhDB4K+LruSLZL23++Ti9uAVpY=;
 b=nYmBK9zV0MKZ5ZOIiUSt+FrxZ/8Dysn6kkRAzILnk84UuqbASdj4tZ71vWKqNlGc3R0Fdqw5/rARf2GF6o2DyopnMwMkZQeCwgrmvaD00iI1UK1RFBTkbgjkMb8x9Vz2qvfiKB1fLGG2fQD2uBO7lMV40T5UyVzURxuSrjZWntA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 09/19] xen/sysctl: make CONFIG_PM_STATISTIC depend on CONFIG_SYSCTL
Date: Wed, 12 Mar 2025 12:06:22 +0800
Message-ID: <20250312040632.2853485-10-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|PH7PR12MB5784:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a89c8d5-8616-4d1b-7ba0-08dd611b62de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GaoW1+qMbFaTXNg3rqSIx9cDvVI7CmlB6GRK2RjWu5mdKeqaZlmgAr1VAiHN?=
 =?us-ascii?Q?d6Lg7/CMOU8wE8MgyYCH8Zplnkt0462NlEOt7XPIH6+zVuN9MFDzfvL/ylCM?=
 =?us-ascii?Q?2ietKOrMouXrIu68q79+/tFJWds95oRlnQX2US1DmVKsG1Fn3wq2431hMfMo?=
 =?us-ascii?Q?xTc0siQUh2WxmNgiCkZian2S9k4n4PgmF2Bp+y9SG6CtZQ7PHW7qPD0gFu4z?=
 =?us-ascii?Q?NzBSlcna7NCE7IIljkhEs6vti21MC8kKKciRvuBWTo40PPz6utVR+j3wndwK?=
 =?us-ascii?Q?tc5yw6NtCrwl0XYjqkKU8jk/jZLWU+/Itxm9Nh2w4eWo6A5MVkGInK2/AVgB?=
 =?us-ascii?Q?QRe2w7J8mA2OGrym6vZyGhW3JZAcBuKJG6h+8qiZvBpUbtyTcrOxFITVFGkY?=
 =?us-ascii?Q?BQlYHwFn6MPvSMvYXR+zQ9xC0bCGmGomwvQ3p10ATujxoCTu3KN72hXywz+c?=
 =?us-ascii?Q?YfHmLmp1ulLQc5wAFGbeX7hdgQRiXrfx5u2xV0HxxqkcgbM+KbOeFqW1EMt+?=
 =?us-ascii?Q?yQ8VaVUhBB3T+0ltPIWvVDmARFQ3zHmwl0tHEZvWvkvydv58kX67UJ+gBa/n?=
 =?us-ascii?Q?FbBNYohngEnTj90ADIg45+qO87a8F2M5hEk10KwaAmrOZko1NHfps6soF7IB?=
 =?us-ascii?Q?Mo5gxXz2hreHcDQiCvTrhZFddu304bljAx5hS++lzxR/8+w/1rjVebW5M7Yq?=
 =?us-ascii?Q?q7jI0lJmf9DOx/ZCGONhoR34GpFdyX20e0CsTW3rI2iyZxsHp9G5ltVqEL3w?=
 =?us-ascii?Q?CNueOH6+nVV4HHRELcG4RbbdbAq1lnbqOvNrpTK+XlnTkrJ5ejTj7kxIL90A?=
 =?us-ascii?Q?ByIxQKgfZ1J5/QH7XnLWEz4F5cC9/XQE4R/qpjxGUfHeEAThqDmAvxXZY46d?=
 =?us-ascii?Q?uSszQA4elf4mq0NBrMYmT2PHJ16fJlZEGV9ww/GSOtmDG5fjv5JlnhGhVo37?=
 =?us-ascii?Q?UiSoULc2TT1hqLCKDof7MJGwPxnbAe1D4tX6b7WQ6wUBmNDxBxfIyRyTBvNs?=
 =?us-ascii?Q?e6C+jvuzHpMub6KB/KGwd0E8bJ8rSJTk5fFd1AHcQBAMO7WNWfvS1qc7DXZO?=
 =?us-ascii?Q?pt5mOmA58SgY9GrBBI9EaAeIOXjmqwPOSWaX7oME+WpPItpt1KO9QkDc+28o?=
 =?us-ascii?Q?G4n4GgMmWs1Rb8MkUbFVXlMGbMdbFYiZJp1ELql0wyOB1N820qleJsYMAPT9?=
 =?us-ascii?Q?HRTqzmx7zQc7iTrvs2231GA8bKvBlFxSdwHKAXy9Hxjvfv15JZm/52YpEliY?=
 =?us-ascii?Q?A4gqap7fAKXpbTxFJFgDrWOo8JkRyr4BBe+ONCZg3Q8vMQDDI1Ja9c+ubS9j?=
 =?us-ascii?Q?XqCgPVfWkfcYzb8h9z04ClmgjMB/PqhoJFcLGLkmhhpN42fAvOb+Jg0st+9d?=
 =?us-ascii?Q?83mk/UPPAoz6eYlGTK9wetf0SSnmgS9BaFZLfGnCKjExyRgJeSchvANLlBdG?=
 =?us-ascii?Q?fPnWS+HwUQ0fUWC5rS+RhuKQSegZIDVxBHEGf0lYwNUn8tjJx8hyp/70l8R2?=
 =?us-ascii?Q?obZzlOY0B1uHKyY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:20.6612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a89c8d5-8616-4d1b-7ba0-08dd611b62de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5784

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ffc6b9d4df..fbaca097ff 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -109,7 +109,7 @@ config NUMA
 
 config PM_STATISTIC
         bool "Enable Performance Management Statistic Operations"
-        depends on ACPI && HAS_CPUFREQ
+        depends on ACPI && HAS_CPUFREQ && SYSCTL
         default y
 
 config STATIC_MEMORY
-- 
2.34.1


