Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2EB093A0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047197.1417647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmL-0002i5-DD; Thu, 17 Jul 2025 17:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047197.1417647; Thu, 17 Jul 2025 17:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSmL-0002g3-9s; Thu, 17 Jul 2025 17:52:21 +0000
Received: by outflank-mailman (input) for mailman id 1047197;
 Thu, 17 Jul 2025 17:52:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDmn=Z6=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucSmJ-0002fm-HG
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:52:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2418::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7e5e6cd-6336-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 19:52:18 +0200 (CEST)
Received: from BY5PR13CA0032.namprd13.prod.outlook.com (2603:10b6:a03:180::45)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 17 Jul
 2025 17:52:14 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::97) by BY5PR13CA0032.outlook.office365.com
 (2603:10b6:a03:180::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.15 via Frontend Transport; Thu,
 17 Jul 2025 17:52:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 17:52:13 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 12:52:08 -0500
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
X-Inumbo-ID: c7e5e6cd-6336-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMBxHLpqTIPnE55alqD/nbBxrwLpZfScqruP2MusqKrTyujUjm/3E0qG2M02zwebFIsP4iDsY1tb+1vOR1Tu2oSNX4MU2TOt/zVmupOFdmqTUk10qj7Vgfyy6oXFVK7GfaxfM2wYCb5PhGtTB/mArLUghmID2WTcBJjZzledUKZ4YQePKsm2MbgxrmlNqjuEVf29dPzUeuYL6TEqN8NJeskHwZvnTs4k3IE6wZaAr727W2LNQKD51eE+aTC1aPSq6cIZTHI7kIUb+Dokm3X+c8rIkdrsP1ivDmIAUybVT95ryAs3OwYLsoQYczk0Ts+00LtriMq0RvKxpb5TBhXcRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8/OPIrX+UdkTPqOqin1smrgo2nLg/GpIf1RWRU+BkY=;
 b=DfYM61ZcuD3E2mp41LS1GGaJvHT/xqRp/J2DvHZvrGJRS9I/9GZyexgmbajT+fXCT/XDBUXJUHVBomWxCrTuG8wyRB0E9r6rZ2gBjzl4WuXTtXQ8gQkjiaYrTUJoJnEZ3JnMsJ+D1pMpvg7h5bc8HP4dZAZf2myP0BDOuLExFBbPGa7YGLbe4zcHrHRD8pevdLhlRcmbEpWE+zZBohD4hZOCia1OYe0rEUydAX2+PznyU0OilPCmyuLtxRx6jqA7NpPsYpE+R6NwEIb2+ah+Aef2soJyI4hbI/nY+uazfI2XN54yKk9SIVFRczTDdIc4+bGM9WklyUyp6KgLAuF9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8/OPIrX+UdkTPqOqin1smrgo2nLg/GpIf1RWRU+BkY=;
 b=UKrqCDo3/LyHxK3ZCUkwaQ1Kbh9ALjwFiUWayslSnEzAQcalZZ7xl/HHZU3A8pXgTWipzeDVdEQ5XLAxORZCjuoP9KM5zOneZBaTI2jmLUOIj3GBxi7gdriyf9rThZQd2ZYgiumO8NyGP929fBSe+fWNBZ7r5ENIUZfOHJ9wl5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 1/2] arm: Remove alloc_dom0_vcpu0()
Date: Thu, 17 Jul 2025 19:51:26 +0200
Message-ID: <20250717175128.462996-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 34220603-278b-4cb8-8802-08ddc55aa96a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lbBqYPMOg9PZ83VLWkg4fZ+iD3LcQkHwba1CHGBwMWkbjNs8ksjPeSkyY6yc?=
 =?us-ascii?Q?Zy38P+Si4S7qb4NiEayt9rWobogPhp3IC4TLrrEJMhdDEWN5ojJYvuBnbMRC?=
 =?us-ascii?Q?bgffM3tOl9b//t0zT2nRUKSUUJAI1dChcAx/nIN54H92mr4irW/QvbrLlX/E?=
 =?us-ascii?Q?qOfTHmo3zyCcPlxyt9lXv02S74E0UelVk/PefWB7CzWwZd29krBnc7pBPoHG?=
 =?us-ascii?Q?y74zQ7qhd1ioQcpsrqLmxK0S8D7qLVU6OR+79h6Tcx5sk5ZcwzkUuEo4DorD?=
 =?us-ascii?Q?DbhH+ktllTCz5RXcexBbRd2b6AwvraGS3LcF7W23Gtpl0wbCJXfYj6sGmIAk?=
 =?us-ascii?Q?nW0HL4EFhuBcAYr/JWHjGIwYmw/jPKRINUiy8+xTShBuBiIXhcRE2AcD+AMI?=
 =?us-ascii?Q?Cot17DmwNi/ptL2WN7I1f0gwzoMoY6PVM3P1q/rSX36AOwABsPrrtfO/kpdH?=
 =?us-ascii?Q?EnP6l6LRKqYrCn0WY/1Am39o+tSLaOagufpi1z4wxxMazIOS6YsCJYBtP4rD?=
 =?us-ascii?Q?Y2xbixvBoi28SWl4va8R9Dlqog1e5RDkEqzlMs0qYcbTbUBO/OdBFvZJT/UN?=
 =?us-ascii?Q?jqXZrNXQpfvRD+SNJsqnFUnJ7wSkspwRFSNkj5BtDypHqwS2QWGQknZMLhF8?=
 =?us-ascii?Q?idQjH+eLXTcVCIkv71H7Qj4vsndTRJQTMIYXgyRriZlpRO4boA2LRtS2jYu+?=
 =?us-ascii?Q?XRvT3XEp8RQnqU5IzoNhvlTDwpDNSw1C9v2MUJzCv8pEZBWaif88quPSrKeN?=
 =?us-ascii?Q?MPqUxilqw8/LL44bw+/SeA6MuOYP2kWMaIVhpHoXaKmwaCUprakalWpDbdpp?=
 =?us-ascii?Q?R6waY6GEya8yvs3lGwZ8uURoB9fF9aXi1A6QOBG5xUgBns9xVspPZ0UYQRbl?=
 =?us-ascii?Q?mDBbUojfsC5qJ9WvPKFTzWfWZyonGKyU1My117bb1wdFaDSJxZFwadlUhX7D?=
 =?us-ascii?Q?5OAGhn0NII5eQJWh99cXGLyNSbTSyLl9jTJl34bpIHXcNZ76zeye4T3+r2eV?=
 =?us-ascii?Q?jORpkiPBXbhpF5heWRafJ6GxydIBOAvwgSbmkZ4fIcGo9UDiw74mVURwezTV?=
 =?us-ascii?Q?cSvllmOtEdnS+Q3Rh2O9bQaOl1MB2l7PwaZyBqVLogEycmjyqCZt3/iNLcZK?=
 =?us-ascii?Q?j3/EK21bPxR25JomxFYXEBQj4c2rYlzDZvA4EKd0fMoPoMlp2Ep/kPyK+ijv?=
 =?us-ascii?Q?ZHK4Vyn3JRd7RY2fiYigIM/3s5eBl1C1yaUXd34WAVhufAUowhktYzp5c6Pc?=
 =?us-ascii?Q?flt22nnpfAl1Ch6yEWgSuDA8ow+SyixoUixrkmcTGiF3+vZvNAICtTgpWoVc?=
 =?us-ascii?Q?Rck+8DPjsDHPdPdN6/Fe8iryvf6bim3vbeKrKyJCA67CdMK1sFpUfea85dap?=
 =?us-ascii?Q?Zr8LWffUziyB0bDA6HVtkT8NsNY71cs63r4sogFd4TprypOld0DhrrOKK44x?=
 =?us-ascii?Q?6mS2AZOOYB9mj54csqR/impqqVhKQyrsZxlzy3AO8osGG+tehl83RT7Ra6Zu?=
 =?us-ascii?Q?qrI3K3b0RiZgSq704U8fr5ME7iQNiCX6BLXI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 17:52:13.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34220603-278b-4cb8-8802-08ddc55aa96a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

It's a straight vcpu_create(), so the alloc_dom0_vcpu0() call is
irrelevant.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/domain_build.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 04d3dca38a..ed668bd61c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -115,11 +115,6 @@ unsigned int __init dom0_max_vcpus(void)
     return opt_dom0_max_vcpus;
 }
 
-struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
-{
-    return vcpu_create(dom0, 0);
-}
-
 /*
  * Insert the given pages into a memory bank, banks are ordered by address.
  *
@@ -2085,7 +2080,7 @@ void __init create_dom0(void)
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
 
-    if ( alloc_dom0_vcpu0(dom0) == NULL )
+    if ( vcpu_create(dom0, 0) == NULL )
         panic("Error creating domain 0 vcpu0\n");
 
     rc = construct_dom0(dom0);
-- 
2.43.0


