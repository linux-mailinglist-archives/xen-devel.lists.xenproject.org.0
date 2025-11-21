Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32133C789AA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 12:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168657.1494675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtO-00066o-OH; Fri, 21 Nov 2025 11:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168657.1494675; Fri, 21 Nov 2025 11:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMOtO-0005zX-IP; Fri, 21 Nov 2025 11:01:30 +0000
Received: by outflank-mailman (input) for mailman id 1168657;
 Fri, 21 Nov 2025 11:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMOrV-0007TB-KM
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 10:59:33 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27952b1b-c6c9-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 11:59:31 +0100 (CET)
Received: from CH2PR05CA0052.namprd05.prod.outlook.com (2603:10b6:610:38::29)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:59:25 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:610:38:cafe::f4) by CH2PR05CA0052.outlook.office365.com
 (2603:10b6:610:38::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.5 via Frontend Transport; Fri,
 21 Nov 2025 10:59:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:59:25 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:59:22 -0800
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
X-Inumbo-ID: 27952b1b-c6c9-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7GrE8FJe99xLbm+R71hcFOTciEGLT/wRsXTXslT39Xx3BwionQhvOWPK5f+Q1J+ZMjAXBoIUtmbfS4ZywGJB1oC1FQ3lY1jNL7HD2n2sAUE0Qkkzg+borfmRsv5f8hy+j7EEHvCoUElbPnQj71RzISY8Doos4BVbaSkzlZM5lx5l3+tVCz9qsx+oBUm1WJ5B79KTSJq+AvtB7KvWgrIRBKHMJ2KGQjT0+XKlJOtCOlBZWaAYyjrsvXwdYJmgqN92pabH9p6DT3+lBAaX/9QHIeH6Jt5u8uTqWjgVgMp7SgMscTlzbIVMesyBJGh0BjZCFlNt9kOKuqMaTuTwJnBZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3CdRgNX28aRLgpd7ra/As+vBGn4QaDTgU87mycvl5g=;
 b=tOEZvQg2YoE/LXN4F8i5P6POz03ctMbMxwiOym74gZnXMK9RQDPCs4It+loljZWX8BULkJUcBrXRAj0hl6EEw+ihGFBNFHpKja66VurL6TCNhhg6wCW6XF3hMJGlRv7VHv3HDcx+S9529V7l+2bh2uVNcxtMtAoOIVK6MR5ENCI93Ph/uWai2Ri4tWDk5cq2zp3S5+qHbClw7Ik/d9biIpTa3uWjvuV2l6+TK4Qjx5wJtOnaMRyzGWjMTjRP23hiyUw2b53C8utHE+46lWVeTbxj2SSCpE8gPhfuAPVet6rQIMyHK+F1rnlVZtsMuUItPhuQfLUBWlcksP/ngStHCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3CdRgNX28aRLgpd7ra/As+vBGn4QaDTgU87mycvl5g=;
 b=0oMpPadpLGyBjXzhIf0id+aWBwVgaH/bCtt4jQMNd3AseoeYv+G7dwYp3hO2XGYeKOnFju1shZFc63PZHELNA/isT5ZVidtcRW16Kk/Nq2FR80O7j/a8yT+jr99c/JOryHEeFBDifmTKt45qufnQUnGH7BEZKtNehpt2slCV2po=
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
Subject: [PATCH v4 21/24] xen/arm: wrap arm-specific domctl-op with CONFIG_MGMT_HYPERCALLS
Date: Fri, 21 Nov 2025 18:57:58 +0800
Message-ID: <20251121105801.1251262-22-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: 91530662-0d94-4da3-69a4-08de28ed08e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wQDsyskaD56dipD8ZswasXFyTR+fJp9DnigAiHQMatypDySz1vja4iXhELiO?=
 =?us-ascii?Q?jex5CyEwb0UE1hw8YweIuh/NgxA7SXBCRdsnB3uNhIXaejnI8kyuPPGPs3BS?=
 =?us-ascii?Q?9mVvu8WXeiGFG60ZJriMiNGkocoQgmJCpHOU1YPnzk7wAbuNy1QSbUjP8sui?=
 =?us-ascii?Q?GE64xGroIytSBhvCV+S4ZboEzmzpbwcjUGoov5dtMtIsDeWiR91xKGOX/vOu?=
 =?us-ascii?Q?zkGcuV/PyGyzVXbJl0BxNhucAfkijgya/HCtiyD05Pq0xsJExEpkZnuku1fP?=
 =?us-ascii?Q?su4B9+4TdFby8gnd2ub78FucC9WAcYu0s+9+Bn3JEQ0gSF/0oGZgu7nSF+1u?=
 =?us-ascii?Q?3q3cnFKtcW6OfdXNAR25NwV+wQTxQyvLu+BStUi8VVthQ1+lMoNvzRA2DyYa?=
 =?us-ascii?Q?tO8suyfIHGusXV37AOyJh89rzcFCfyHamC8CQ8yA4C1m44p/LEL0i4IKgRsg?=
 =?us-ascii?Q?vplOhPTsI0hw9G8JRrH+/ZFy5mJCGwH8W4H+Q+ck+1IOz47zL8LhzIETVSCz?=
 =?us-ascii?Q?tUMhMU7ugmIRCCtxc7MAfjgp7b6Vno/EKx+x7lMQAp81TCJergimMmvd0Quk?=
 =?us-ascii?Q?q0PBE0ieHmZwZ7stUITKSMhTmLLFr856G+bVEBMySrhx1R3WbmasFCXUCdlL?=
 =?us-ascii?Q?lbFsYeXCkqXdev7ZZSAJGN6YI1bqo7RPEcfMDAPKP5ZcRlS6OlOHn7JUKTFU?=
 =?us-ascii?Q?S/nyITc5JZJcHGPNYwl7wmk9YDU9EG6OinkyzABQTOJ7zala5KLBl9TkvZ1F?=
 =?us-ascii?Q?u1rgIaIHCNYghc0AsUy/cWTtij46m5XiNhrvI0I8SyBnNChnABvuwvRb30XV?=
 =?us-ascii?Q?qfeuwipGvq3pVZXo++4AMUNjrMhcME8blPO4SNXUaT2n9MGzMOfhCiPlAGvJ?=
 =?us-ascii?Q?SgxJY8QvA7EQVA/j6WcIMWwuqSgnRDgJf9jcmf2DWPn1DuHNgyUIZjqxrLKm?=
 =?us-ascii?Q?CWAenJMXYYdF4EfGbFPyoDRT4mw2/OSMJ+YqeEUBSINgJtu3zb/NcnRwiQb8?=
 =?us-ascii?Q?9BJFLkhNzykmfETr/fntRT26ipLDxRJyUajf9DzY6dao6yx2KXYRwa11QLRc?=
 =?us-ascii?Q?EeYlYaopjbraqzuzhfXRyTFqG1zoRCJSosg/lz6KoNjYjyqbUTIXbN1Ducc4?=
 =?us-ascii?Q?j4XHoFrUWjUg+FxEqjWbN0TzWFdUoEUzjMC1ZntRCZr4KkDtWkinWbvlns/u?=
 =?us-ascii?Q?NqyIg2paoxUheKsj7cUhI8JE604pNdnrCmiQlxSJIvisVze15NhQHq7K7YKM?=
 =?us-ascii?Q?CMb96rPJcddv+Op2+iJ7rnt8o1w+tAgeRGRkdEjPFf2Sn+1YezBcasLEQhKH?=
 =?us-ascii?Q?9NEaB4qwfZbx4klVKxka1QOwafINy4DwKN5m1X94UijeY+QFLVidmmRpPrcJ?=
 =?us-ascii?Q?JgURl9CSw8ytZnoPllLZ8ct9F1U5Sr00DQ+K+GLxQxCMhCiAjOX0UKm5etNS?=
 =?us-ascii?Q?qieYFZyflnGh8zpJU2h9pcjDCuCQ6CJ7+3Jj1pZw2l8rynsbzPyvfhMph9Py?=
 =?us-ascii?Q?9Zt6LFogHHMKNkaEIj/rxg8frgZ5araPjNATNGSFLjHTfoBbxEa0qDpPFHRZ?=
 =?us-ascii?Q?SP9D8AaiVWWRYk48ccU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:59:25.4193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91530662-0d94-4da3-69a4-08de28ed08e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039

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
index 2aff1a1630..2f4593f5eb 100644
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


