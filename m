Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9BADA86F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 08:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016511.1393416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xm-0000Et-B6; Mon, 16 Jun 2025 06:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016511.1393416; Mon, 16 Jun 2025 06:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3Xm-0000C1-7a; Mon, 16 Jun 2025 06:42:10 +0000
Received: by outflank-mailman (input) for mailman id 1016511;
 Mon, 16 Jun 2025 06:42:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn5w=Y7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uR3Xk-0008OL-Bg
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 06:42:08 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0453eb7c-4a7d-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 08:42:06 +0200 (CEST)
Received: from DS7PR03CA0089.namprd03.prod.outlook.com (2603:10b6:5:3bb::34)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 06:42:02 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::e9) by DS7PR03CA0089.outlook.office365.com
 (2603:10b6:5:3bb::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 16 Jun 2025 06:42:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 06:42:01 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Jun 2025 01:41:58 -0500
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
X-Inumbo-ID: 0453eb7c-4a7d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRDOxHFkZvT5c2/jo0F/DgLyo67EZH+4LCjjZktAggVWBLbWATRkAYbxuJq/ml36utiFW1QDGS6DBAhgRWnbg7FMB24lRO8kwF39Q53NripbkFzRZMKO5abXTnGqUzhzjJ7KbxyveaPYCLn3wrgSImJcy95guxXNOvzrhpa+zZgGDfs3mcO267HIm97lbeXTo9rldVjB6FyTclXjtRigLNVq0ux6HguuTQmJPBCDGxEXTdkbtGGT/VYj17gsFJli5Wb1fx38y93uBcPBNsR5QvqWJ0gXJCJ8Gd3g1GxpzepAOGMA/u5XgflRhSyO3T1y6pKNq1R1dEwpO4aQPlwvPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdBaE2ZAn0zVs7zMkv6iVvtUYk0VsH6uGpj56SXk+SQ=;
 b=xyCs0IFzH6i9OORJ09ZJC9pqP0Xg9P/kjaFWraqXLMVbP4TWzICs4yjvjNhtoMrswBxzEqonF8xoItxorH3Y2DEvJnrAxqIy34040XVnqwE+07ErbqIcn2ik1T89FwbaDN9/tgiZ4eXBvoZCAX26nomDC9PQW07STH3876KLj8OrDLxs+HTtK8Y/HMwyF23aF7yKTGjnPkhClF+X9tPqeDtg+1Ovfx8pVzNdfkRsA9g7gz56dFvM/g5LHJxt73rItfeuT6KK1SXqKWN2CZZU64I2JAwyWtTc8acm9VlE9cujPSHVOLpZwC4xtxwUCqYor+VrcM678Uo9obt426fibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdBaE2ZAn0zVs7zMkv6iVvtUYk0VsH6uGpj56SXk+SQ=;
 b=PUv4hF1JsRtBOoczgzd3zmVMlrjvbOjcTusHGCgB+5kjjGl5dkQkNttgVwYNhi3XSrIdn0NugCkAtoTyQHh3JLNKrW6p7rfgAQUNyQuN1Mx/rLBf9zlN62ucgOIJRDFB/X6kbRXqiAi68azlKSVHUtQ+VKthJU5sLeGisEgZU9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v5 02/18] xen: introduce CONFIG_SYSCTL
Date: Mon, 16 Jun 2025 14:41:12 +0800
Message-ID: <20250616064128.581164-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064128.581164-1-Penny.Zheng@amd.com>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 693c03f2-14ae-4213-4645-08ddaca0e664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yWOJh3NYI3SK0pXsl8XIkZRXQLbKaESDSpf4hQJVDagnSACtz8ayfRxuczyt?=
 =?us-ascii?Q?F6idTudMRT5L8i2XRQFH9NPVn/tt432DZBwNCQWDcgXKymisISiti7i2gjci?=
 =?us-ascii?Q?gGPgykVENrxtsTgjVH9UdtYr8jtMzvUTQs0/sT6hEutG55EETQZ/8JuBeuZl?=
 =?us-ascii?Q?Jl9x6a/f3UaABtFPU1AutSJnUVN+smzS9t23GmysduXZyiiMH20IqYWPubO3?=
 =?us-ascii?Q?csb5rnegXfEWEJsw4JMiXekiPcGB4NGNk+lQJwUcPR0scU8+UYiPXgoHLIyt?=
 =?us-ascii?Q?pMeAvT+y5FVxKNskGtwee+nlnbGTinFykLVw2An9eN7wqiUzDDmZ8U+h5IcU?=
 =?us-ascii?Q?7aC7JS8pX1tlNXZ9+CxkE2BHtHjV8Vqi71PhCGJIrrlyscf1p2/VkqTCD+Ba?=
 =?us-ascii?Q?yd8cgxcdcLiGhxJHRTaLC0NiC+CarB740qrNUFp3pxgFKp8SGnp3j62e46YX?=
 =?us-ascii?Q?ObCOKB59IFgMYra0klpQK/ojXntgONMz/aUg4wJx24SUyoQHmnnVMR6Pifvy?=
 =?us-ascii?Q?foyS+CbdhiYin5mC5TI+e3mU23uHH5VJduSwVzimODEH0y3lvR0aGnieyNH+?=
 =?us-ascii?Q?0QjBesa8cwesrWRR2o3trMWNpNOmFYHDsh2W6YCsXug2CpDWydCPGhdeZDLq?=
 =?us-ascii?Q?N0DOdashB3ixzfU7jWtYtCbpFmY6kpHn8SKG5XndGfYW5tO7FnkTSSkfzTFN?=
 =?us-ascii?Q?EkZ8Q6IyFedVtBtPQMQc3RIvd3VEN1n+scTwonxVG/SzEhuKo+/UIbTiKlWq?=
 =?us-ascii?Q?FQ8GfNXcDJF18G2piPX5bKY0DfsWMC+rJyllYU83eHAdP+BhigHnC1d6MAJV?=
 =?us-ascii?Q?8wCJVBHoPJ70/2yYKq8tE+rOCYTa8Prcx5IwWDm6+sUM6eAOKSawYX9L4NgE?=
 =?us-ascii?Q?mqIvGe+4hjbqEHLVxabIewbXgBbSxmG++eV01wyLse2iDcfDs7h02DcWtgnd?=
 =?us-ascii?Q?S+GjAp0foE9XvI+nPvRZAO5Xox3ODJ6U/Z7ckGkkZz3BNvZNptSXdU6Q7SgB?=
 =?us-ascii?Q?tr9B0jVxa3+anYMBwJsRV7ivs/3kEhY+0pQrdaD5r+25RlqpOVaKQutGOXoF?=
 =?us-ascii?Q?AcfybeIVoh8NtgNzFSfdkSpcQmI656UvGhHx2cqfn44W+KknmKxYRrYPAsE+?=
 =?us-ascii?Q?OSiw8nOagyvnlfoacyAyW4B9r5woWy+G12bkW5nNWL7yTMNQlkTI2woRl1C0?=
 =?us-ascii?Q?SDfxNqcQeuguMZfc5GWiqFQf0e6aTZDoeyC752XEQW4V8N4LEd1FKQIm9/7a?=
 =?us-ascii?Q?zGvy7u5hlD7L38QWP5sdXrW07BHuSt8XvDoGbNv/ctSvxGNRA0vUrPup4nH4?=
 =?us-ascii?Q?I+/nm5HeuKNz1G4I0IJ2vTxGjBwiStLlnqaq9h8QPsPdAglwIaO3g8E5RIiy?=
 =?us-ascii?Q?zg2TXIVbih6VoXvJuVWrvX29Wlrox8JgCQ5DIeGktMgjc7obDWeQdKLz3J25?=
 =?us-ascii?Q?3qvE5iTwcx7Uabm3FLtLlLx2Mu1pKad/lczRTJop2JjFyRnBIC42eXdINU4X?=
 =?us-ascii?Q?wB+QbQXspBiFNJNtPCm0E6ZXqUGR44jXQl7y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:42:01.5558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 693c03f2-14ae-4213-4645-08ddaca0e664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785

From: Stefano Stabellini <stefano.stabellini@amd.com>

We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
on some dom0less systems or PV shim on x86, to reduce Xen footprint.

Making SYSCTL without prompt is transient and it will be adjusted in the final
patch. And the consequence of introducing "CONFIG_SYSCTL=y" in .config file
generated from pvshim_defconfig is transient too, which will also be adjusted
in the final patch.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 -> v3:
- remove "intend to" in commit message
---
v3 -> v4:
- introduce the option without prompt (simply "defbool y") to eliminate the
need for transient "#ifdef CONFIG_SYSCTL"
- calling out the transient scenario in commit message
---
v4 -> v5:
- a simple definition "def_bool y" for CONFIG_SYSCTL is enough here
- refactor commit message
- blank line ahead of endmenu
---
 xen/common/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 867710134a..fb5c60517a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -611,4 +611,12 @@ config SYSTEM_SUSPEND
 
 	  If unsure, say N.
 
+menu "Supported hypercall interfaces"
+	visible if EXPERT
+
+config SYSCTL
+	def_bool y
+
+endmenu
+
 endmenu
-- 
2.34.1


