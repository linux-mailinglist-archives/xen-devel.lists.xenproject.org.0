Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0817C78965
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 11:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168576.1494571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqm-0008GG-Bv; Fri, 21 Nov 2025 10:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168576.1494571; Fri, 21 Nov 2025 10:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOqm-0008EZ-5N; Fri, 21 Nov 2025 10:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1168576;
 Fri, 21 Nov 2025 10:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOqj-0007TB-Qo
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:58:45 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b8ffc12-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:58:44 +0100 (CET)
Received: from SN7PR04CA0228.namprd04.prod.outlook.com (2603:10b6:806:127::23)
 by DS4PR12MB9636.namprd12.prod.outlook.com (2603:10b6:8:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:58:39 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:127:cafe::d4) by SN7PR04CA0228.outlook.office365.com
 (2603:10b6:806:127::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 10:58:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:58:39 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:58:36 -0800
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
X-Inumbo-ID: 0b8ffc12-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQWVm40qOSqP04seDr8qD7v74i4qpSI7Xuh/2LYMN5LAu4j1gwrcdhwpQ6yXW/ih6hddWGARJWDj3mHZio50NDbBnMJMvGhQINjGuIMet8wt5U+8zND6zVcMaMqV0GzHoc01LDTKwMiVkwwaCUDB98Sk+rowKsETR4rs+ZVJWKS+IGUBOYycNJ/B4viG2aqF2VsgITPTH5MnbvfYBCksAq50p6Fowh1eF3oDnb6sUX8POaSZJfU6o9ehL2ylKvnZG4Eo79QgmtD7pMD5Ew5lDcnvfNpg+5h2G111KNTRsR/AHZtEz/1e+3sd/KDnBPBtXyYcaW644yjk+R/iHM9T1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUWB4zPTieGXMsEwDqzbhQ3g9us99jKBTg1eSov6L+s=;
 b=bCWE0SmlejQMc5FyQvFvYxngru+c42JvEDi7x5iySUqTurlZY96JBkn3pjsTCAHRCp6jxX/6NTerVK/CQJagRyeVfrL0gU8DDHbQVTRx/pGs3J+Rid+ERDy3oNm50VzGEa/N5i+N65d8/G9UClO7KJ725OKB0yrC07DFvppjiNymtsM8vDXx8/eLKUEWv0lL3GHpx8J+DsPFjCX1RStJ25wJdtqYrGxfaMppZdZJJuoP4xmtO5kUw8TebO2erK+CTNUrnYwVQCiLCWYETWUMnIa+wZjzFaMl7xtJfDo6czmXcrpYyxdNxkaEJWd21d0w3WQUML7BaUAYWm/6OLED8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUWB4zPTieGXMsEwDqzbhQ3g9us99jKBTg1eSov6L+s=;
 b=woHAR3NBeU7tqJ77Q7xUSwkm9EZUkUUkTHtLdAXGV930Zv5xbZYAenupvjz+JQ5ZEHcvAv1H1HMbKSR2uVyhvVueMicCiOpFmBeanNzhaQi+SSH5kZvY3KZztH/5jNnHxx7oXonU419DPBBc5nJu6gnC7F0xTTuBAzyxZ4gYqJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v4 04/24] xen/domctl: make MGMT_HYPERCALLS transiently def_bool
Date: Fri, 21 Nov 2025 18:57:41 +0800
Message-ID: <20251121105801.1251262-5-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|DS4PR12MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fdd5d0-8106-43be-8602-08de28eced93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZ0czf+WaEJi/nhfjGX16L9r+ij3DufI92QDU7psfxXyoklq6ko7L3MwSedF?=
 =?us-ascii?Q?9/N6Zvn9asbCBPHl8K6UL2ISCQMW8vaphcbqfC6CURdH047wdA262VFol7pU?=
 =?us-ascii?Q?pzboxjQTZHJMMD+cOpNEkmgjJwk5yoZDaqUM+cPNcCTAxZwPECpKCmJg8zE1?=
 =?us-ascii?Q?ivb+Id6h4PUHGrhJINGb79xNeb8HFuL6Tx5n3sYqY4zz1cybIMxRDIiEV8/B?=
 =?us-ascii?Q?jju+5yk/IBlrMdoP0wUd6elhLIKOp/Gbpbijn3rMvYE3X0AHAhPqZl83hAu0?=
 =?us-ascii?Q?/t6NCsbP4piMJUtq0yJiiF6uJpJTUbH+CNgWZR8hdL/yOgSF4l4hPIXoAcI8?=
 =?us-ascii?Q?+0Ad4+fTH2QiTvwBxJM3CLUaij7PQb3AXOMPGdEh8A5Zu6s+TdOXe33sf73O?=
 =?us-ascii?Q?3td/wS6Y8c+pSpo/zRIyLtjJ6iz83ePPTxtJplQNnLMl9xHfkWoZYbEGpFr+?=
 =?us-ascii?Q?ae8S+9Ix2Q8tRVRsuUb3gl6a4+1EQ8SDJBCe6sQaKXShBLnu+6iooTDblDRl?=
 =?us-ascii?Q?q5u5cO7c6+SE4noXHsyoEDn4CXkd7i6Hn+kPzspgY0AOWMsZZAZewA4Vak6R?=
 =?us-ascii?Q?5c7RKf9pW9eRgUrccuzQK3H/zELWFLWZg6YMq8WcPDRtjkWluBlzr9b3IfKV?=
 =?us-ascii?Q?HY3d2k32lfDePhiNAiNLVlLbIemAi9YTrD6hKMmKWC1jaqKudsJY2t/W6Tev?=
 =?us-ascii?Q?Elgam03wmxDnfZY0e8dfx/+UHGDVu25oymxBJYmQG+hRDOf9C6O/NE73PxPY?=
 =?us-ascii?Q?rG5IpDRg99kJMLQs5Ispq1vTSDlpElNCmw0TYSCTJ0CMnZ6+EH3bu5/amDuy?=
 =?us-ascii?Q?lDwqzrP5ZA/V1Woi+qdKjlTA0kqetYHhR0Iicbz0wayeIm6Tw6ZeqfT7KxFL?=
 =?us-ascii?Q?gQhO1pryxrHTq49MrA8e0CcAEuBGsYuT2vtFtBLygU3HFQiQjVqklnWhMNyx?=
 =?us-ascii?Q?E4iPAm4xqxVuAZRsX5gV70DcBHnJFJ5UbpHsCKDCrypyyrNXgGU4OVUDeHh3?=
 =?us-ascii?Q?wzhyoZZ+q8odfSz+RAipMTI57LdYssfz5vUe0XZDuViP3EC2yavzw1nTd4ZF?=
 =?us-ascii?Q?CLIBbrkLhdzMOACIQ2N/YNzW56xh5zJpBaKKowSDUc9J0PbmCEuI4d4SuwK8?=
 =?us-ascii?Q?vXsqWT0LKGwwBWR02BBrAN7nC8umPWtN6TcSyc4OVZj+9GLsl/PrDbDoCZak?=
 =?us-ascii?Q?znsZ+6cz2Aapd0ogsDjkCFkKmaLAI+3xZDZFVo78SNrvEK9gFGpo72H0HPr6?=
 =?us-ascii?Q?+54bNGqTI4oRIP8kF1c0RDQ8McoAeAs9x5W53FhG+oooLeiAXyG+DGqpr4gl?=
 =?us-ascii?Q?pLAfYAM02uW9fWtTXMlv2VAB3feWxjkIhd3AhJYS2O45JfhBlAnnnc9UhUYj?=
 =?us-ascii?Q?R2yVs+aAoR9TipjNgQrRvCoGThwXWHoSpNgqh7mg194alDBC6AqNSTaK6LK2?=
 =?us-ascii?Q?VE22fOhqT+z6Q3jRpGDAAoP4WYRCuCFMNv8F5bJlfNK8kp7zUDxcRJfyT9En?=
 =?us-ascii?Q?zqzq8vNPMmr6eeUomenvESkpnoNUkkWCTpIsdduqZ1Yq9brk5PZZrY0VOvNr?=
 =?us-ascii?Q?twPPT2ePuKt8w/zNXaA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:58:39.5737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fdd5d0-8106-43be-8602-08de28eced93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9636

In order to asist in reviewing/developing disabling domctl-op patch serie,
we will transiently make MGMT_HYPERCALLS def_bool. And it will become
optional at the last of domctl-op patch serie, where common/domctl.o's
building as a whole becomes dependent upon that setting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6709c3c95c..aef29e0174 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -654,7 +654,7 @@ menu "Supported hypercall interfaces"
 config MGMT_HYPERCALLS
 	bool "Enable privileged hypercalls for system management"
 	depends on !PV_SHIM_EXCLUSIVE
-	default y
+	def_bool y
 	help
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint via managing unnessary
-- 
2.34.1


