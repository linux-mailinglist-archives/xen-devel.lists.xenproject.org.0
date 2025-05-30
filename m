Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A5AC8D4D
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000716.1380960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySP-0000UF-9P; Fri, 30 May 2025 12:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000716.1380960; Fri, 30 May 2025 12:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySP-0000QZ-34; Fri, 30 May 2025 12:03:29 +0000
Received: by outflank-mailman (input) for mailman id 1000716;
 Fri, 30 May 2025 12:03:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySN-0007de-OM
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:27 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2414::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b3cc15-3d4e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:03:26 +0200 (CEST)
Received: from CH0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:610:b1::29)
 by CH0PR12MB8577.namprd12.prod.outlook.com (2603:10b6:610:18b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 12:03:21 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::31) by CH0PR13CA0024.outlook.office365.com
 (2603:10b6:610:b1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.16 via Frontend Transport; Fri,
 30 May 2025 12:03:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:21 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:18 -0500
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
X-Inumbo-ID: 16b3cc15-3d4e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spQ+SFUEjc/XLWnGN7A/NOVBa+tWMrXV56fdBhrRmN2Nb7mfPEUieYyz8mqUJwefoT0Gq8eegDRWZToVAa27krpMdphCFj1+jAboefYgqYhh4ViGLR9XWRbebPOoI3C2X41rwPmP0XiQsjH/LN4ghmi2zaHtvicC9DFP1VeZYWg7MrYHt6ru2nHwYTAqBbmZ2uPejr8d0JvSenGwsw7y8OLjx5VG3kSrut5RSvO3O8ExNicQhZg94Yi0Ft/q3VJ7f/vpKrzC4Ll+OyDzaJk+0HLuqlL65qmwc1KYEOZnhdzwfRh7Xf1G+9ylBVGUuksy4ZgxTyhVun+7MhBe3XBytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1Gy7METHvl4e1uTjxJqux8z1qxe5mj2zTQSv1Qz68k=;
 b=N1Ri+yY7/uYypJYSLJ0aD76q0Z8Ri/QsFa0oEFEzf3JMaasncxZy1gLes86Fo+awHr2OefwuRmyELcvDxS5WVelMMFp93Uho3TdYLbvGkWerNn11QF2CooEGoBuoPyaDfkjPEphbU4hQhGsqEhNH7vmWofAvLllpPI0Q+BsreaCJi9qOjGvFRRR3ZZenKjGNk+qBzaaLXrkIXy9wv9bucF3Y+JpkodroI5Nfvluq4M/XRWcypG3V2nbMso136vzFAY9krj//SyC0ltA9FBKd25Zuj+dbmgD9HI2CVVxAY6v+c2lcvjDJ6fqNyXuNDQmCWYyUChavrypsgAd0BRQ+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1Gy7METHvl4e1uTjxJqux8z1qxe5mj2zTQSv1Qz68k=;
 b=rAQSh6/hGyJznONHSs1J8GhpnXdVBV+7k/86IARJoXm4D1xuO3RFVk5R/VLD38s4hXCSv6iyMnYeAlNNWj9lHp9e55NpvXJeyVCtU4x679mw2HXxLRjhfAUZXvE8ON9Qfpj2cki9lZMHiIaNXWwzO5uyqWSZ8BOHmSfdn4fa/n8=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h and xen/grant_table.h
Date: Fri, 30 May 2025 14:02:15 +0200
Message-ID: <20250530120242.39398-8-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CH0PR12MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 8489f693-9131-425a-b1ac-08dd9f71f8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o2JsOOhez/oKkVMoS9RmaG1Hk/El9ditQkPukm914PQjj/gxTnGOTMQOq2Hl?=
 =?us-ascii?Q?aL1CrL9ojTOV67rD/0MXXdzp6BPjaV53yNnJ3vOEbZ4WKYa6V180Xm063mzl?=
 =?us-ascii?Q?G6T/O+wfNMmIKJDI3QOw6kF2iLS1IlkN/7JvK8W3ygkGrWtu8t9Ggo9n+GeM?=
 =?us-ascii?Q?OQRqEyDB3WYl+qtEuYSzi05qciDrJVR2OPIjLSaYtMDW2Ok/GpTotxk3L78t?=
 =?us-ascii?Q?Zdw5hfoYp/Gb38M98v2XHu4iGs4uXES44uE+4Avrxtq8ldStrSaoUt7MCDO9?=
 =?us-ascii?Q?iIT97ofrDrwLIG7vgh2bzPHQ65etMRRt2GIJH4CkW3MGUO7DMun7VGmSrCh6?=
 =?us-ascii?Q?Sh1zTO++U1TToKimqkqmV6rjdpXv74a2McBBSVKDKlyh+mHOEsd5G5Esoong?=
 =?us-ascii?Q?ZZSljjLfwUvM7RTrcgnwUaEE8NEKaV2S4y/Uo9n+q30930LjWFJ36x28t3ug?=
 =?us-ascii?Q?z9r2XkVJw9Zil6mv01MKlz+vzLPCjEL1y+6nxww182yjWJd7rEUuW0+7AqY8?=
 =?us-ascii?Q?6F9SVVwvYfJIKi9c45/0csbT7ib7Vlc+rfKkqKD8N25+/CmYvvK3hRpBBE4t?=
 =?us-ascii?Q?/Oc421fc1IZPpaVubfoROSMHsEKWnuiSKHcl+8AiQqFCEVXNMnk0nXH2p0oY?=
 =?us-ascii?Q?XQoRQ900atIyzYpVxUih2fRjYadTMcqy42Ru4YuSpq5O+AVGCaKNJ04oqdyf?=
 =?us-ascii?Q?qgfzGs5ywZdmFjC6ZyG2nOlv0Mrtyw40vtjzvCGsXAo8NtJa+NF3LtSgvdG4?=
 =?us-ascii?Q?eGJc3OokcgMOQ5OjyISOdktTTXMQlYPwYuXUA1DZIED+YkNm6p980mTbEU/+?=
 =?us-ascii?Q?IHBOLUXhX1FzvUUy5tOkZFYYQXOxwiG78XlfkoI69CkQNF6vYTEKTy2i6ZXq?=
 =?us-ascii?Q?OTlySkx8zB+CHah6qoVca49L8B6uPc9hqLWuTIYAUgbNPyhFndX5u32VHpB3?=
 =?us-ascii?Q?aNe7XIJuGjStIVyOLwYR0nabF322J9KRyJ2b0Ryt7nDUt/CI7uRXsx+JIB9z?=
 =?us-ascii?Q?RbPdVWenFJfcBCvaVbvezQc13PPoBp4dF3pspjjoRRDF27eC5rFKAOst1I0P?=
 =?us-ascii?Q?fmoZ1yQa/9vRhEW/dUWg0e+lgUnifU9e0idUU36YogeaWAAiWuVg8btbkmli?=
 =?us-ascii?Q?SQ7bJXZjvFoojvOkfSI4dfWX2W9hxsqyQ8ipy5qfSQ1i0OzjvJ1aT24Q+EAd?=
 =?us-ascii?Q?Urt0xdgwPN87HOe94SNFZwvDJtV/7Q5+6PGbF3g1+rknASNYFaErT8pccLiF?=
 =?us-ascii?Q?xOo4JyfZUkSckD1Dnf9Bt30M8p9sAC89LeJ9gWnhZJNbi00+NBVDUSVrjCFm?=
 =?us-ascii?Q?wNvCPdRszAwzd+AY28G7cdaUMDmNt8OgF9/RiIal7K0AMuh/o/h9sH5q3stk?=
 =?us-ascii?Q?Q6fcC5KTZU9UWFLmaECO+3VZ7GClfGnnFNs63kIB3UchYGs8CD9jwJ6nrPP8?=
 =?us-ascii?Q?lWlA7s8fUuyAzFuM30h50Yut7BFkwxevB7d3pCR9Z4hhm2jlYYc+oHsX7hBQ?=
 =?us-ascii?Q?C5Ui2qqZKDvJMxVRJXRx3uIjWW/gUSnzrYzB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:21.3308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8489f693-9131-425a-b1ac-08dd9f71f8fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8577

xen/grant_table is meant to pull asm/grant_table, when it exists.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/domain_build.c            | 1 -
 xen/arch/arm/include/asm/grant_table.h | 1 -
 xen/include/xen/grant_table.h          | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..11cc03e5db 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -37,7 +37,6 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
-#include <asm/grant_table.h>
 #include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index c5d87b60c4..c47058a3a0 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -1,7 +1,6 @@
 #ifndef __ASM_GRANT_TABLE_H__
 #define __ASM_GRANT_TABLE_H__
 
-#include <xen/grant_table.h>
 #include <xen/kernel.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 297d7669e9..491cd6c539 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -27,7 +27,7 @@
 #include <xen/rwlock.h>
 #include <public/grant_table.h>
 
-#ifdef CONFIG_GRANT_TABLE
+#if __has_include("asm/grant_table.h")
 #include <asm/grant_table.h>
 #endif
 
-- 
2.43.0


