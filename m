Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD1B0A6E1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048910.1419097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmlJ-0001pI-VY; Fri, 18 Jul 2025 15:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048910.1419097; Fri, 18 Jul 2025 15:12:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmlJ-0001nb-Sm; Fri, 18 Jul 2025 15:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1048910;
 Fri, 18 Jul 2025 15:12:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us2c=Z7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ucmlI-0001nF-1r
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:12:36 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0d6758e-63e9-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 17:12:34 +0200 (CEST)
Received: from DS7PR06CA0029.namprd06.prod.outlook.com (2603:10b6:8:54::29) by
 PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.39; Fri, 18 Jul 2025 15:12:29 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::cf) by DS7PR06CA0029.outlook.office365.com
 (2603:10b6:8:54::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 15:12:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 15:12:29 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 10:12:27 -0500
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
X-Inumbo-ID: a0d6758e-63e9-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMxyMcZkmiqfyBXIVIzAbdWNtMFotBs8drQPtxyE4UOZSOF2JjHY8tpXNpceD1SphAljXjgR5FAfwyXqtXtHe69E5giRJjuci8iNr/v4oI54uz5sIIva9uQydvjxS8NdpSF7z2P3ARFl7Z2VfgqZbtx8NQ93lDK7xA2N8teWBNo8QYdgncerwv+EDSgKFOnzojWtDfRZMaiW/iLvma1Rc5nN3R++PmQoBB7nmgE7dAvg1T7VTGxEQU/Grm23QptqQioy6hcKeCtr1nAKCx+4Zx30u+dQn4uON83rRHpUElY+GJ6mp83RWwRTC6UKdcXy4RRtqNrFU7PLfkBFDxzDDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kdCd4YxBJ++W/702psHpiUtIgvGCP/G1r15z0NZIh0=;
 b=p03/2vH9VdIs/ET8qg/RrqMhdRqXRijvEL6yE9L5DVCF442mTYzv6YFJCu8K4vkJXJNNcQYWPjsNWnrZMTuJ7vOGvoTZVa/y2n/kxj7pYdlvKs6QBPZeSmf959H6jaa+13MsTa9ZQZK5z8h+qHKoz7ETy2s3FyWoGHp0CPLSCEB5gS/3y+OdCL4tN4OWkPIEzsuhYwdkNdWhnHCkXWW9Hf7txqdFM0AuJ/KoCby/idiYtvm14ABOlArp1CzlTSVzlUqyKvd6Y2lqJ4nMWsYfSuK4UQoQsOl4kkqMstF3xYMsPN37W3ORQtds4C65PSXVvIkq7ET8ANE0lrLKbbH2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kdCd4YxBJ++W/702psHpiUtIgvGCP/G1r15z0NZIh0=;
 b=jUSqM4DhuCCmfDKh+D1H6U0hqrmLPhQqMK1qJ/thtmyYPRN8+a3EPw0AXYLdCW78b6e0MG2NXxridM0rOtBOCjedLb0FJW51rii0jRM9beYV85zkUtYwgRq2jp4B3TB216LyMZZa2tnwVcMyiprFU8b+Ky00CZnSUYFHObi04GE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Don't allow HVM alongside PV_SHIM_EXCLUSIVE
Date: Fri, 18 Jul 2025 17:12:10 +0200
Message-ID: <20250718151214.24835-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: f19c603f-1fa2-44ab-7c44-08ddc60d8315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M/Z67SFfnnC0R4tJT7ggWwcAyv3HbSF7eEmEsJwGnuDjbXVsqjOqi7KXF/2T?=
 =?us-ascii?Q?IPGUGIPKGaEZY3pTt0uHfzGB8tE+o67noWY+qouUwIGzntr/s6NaVs/7FrKj?=
 =?us-ascii?Q?Jr7RUY4kxO+a4DKthvjl7om/18Sx7VC+QZTh0S8Vf1W0/QgBVNIA39oq0/3l?=
 =?us-ascii?Q?LBryYAyRBO49Kv7NQ2tBN6JO24/ovs4iHcOLNWOxNk8E5ZqKJoAho/Zf08Dd?=
 =?us-ascii?Q?umLhaNu3q8YNOyn9Nn1BEo1Ta0hY4KIzTVZN7cXInUFNHrwFz1yu004WTIgG?=
 =?us-ascii?Q?jQnXF1RvMKOD8Z/FMq8SDXvuirixsqifo+JNKMrNl1HesViuBRdDzNyqMDN8?=
 =?us-ascii?Q?k0/GoFMq4oEpAQZ7liPDU1JkARwO3yWpt7eQie34ZwVSHDfHeHHQiS5JQetn?=
 =?us-ascii?Q?7+csUNB/uiweBExYE01sN4Y+qENFkj8/0svtA1GUMGqr2lhv6cvalk2WR1HF?=
 =?us-ascii?Q?+CH3gUzJFC/oiYLurFx0ysJ3cLuZfNl04Di/ftiktEW3DscT8KXRhuO7pQBc?=
 =?us-ascii?Q?hINFw8vMZEyBVMfLn0Btvrl2jHXmz0moNaNcYLPMIWv5QL4yZAJXt9/csbcP?=
 =?us-ascii?Q?Pwbe9ymAq9mba80Dsjs7pU8GzTNvvzxlVo6ZmTfO06KZguPe//xq39jW6wva?=
 =?us-ascii?Q?Z/PYykFzMDpV3/U6MltNBhafE3KrkRXOq71/qwNkjXjCnyeeDBnQXHnQAhKc?=
 =?us-ascii?Q?RVQKmO++0OUTcu2X+fmXLxOgBRcOnlJ3ZzDZbGSbMtt9MRuGQnqWwh4GiOpS?=
 =?us-ascii?Q?gM620LCAbhjzr8sytW/Y+6Eb9T0Srjso04WW1IejYqQPfHZX46jOHdk00RTg?=
 =?us-ascii?Q?OgbFLgSCwZwT1ELGVnbPlQSUyrxvz8BgZLCyKT26XU2xs+vajKPcGhUfPMhK?=
 =?us-ascii?Q?NWn0j6JyT8qABTtL4oOGjKl2JkLVCvfu9o3rqD4rjOhjv3m1b9DznOTelMqS?=
 =?us-ascii?Q?SNMGmJ8qpbU0Iz0wUt7Gh+b8NBYTA8RriqBLAFQ0bwV8ONQarteL7lqxUpO/?=
 =?us-ascii?Q?UzMa2scwt6EEn3incBjfoAb1przEk+GW6q7iEsm+rBWIb7qfG7WHeOeCoa47?=
 =?us-ascii?Q?L96h5zzcrGAk+Ms3rA6cUlLnTyIKqswikALFvO6yoNjPUdw/QdtUdEEkQml2?=
 =?us-ascii?Q?GbBabgPzcw81KTMPl7vnv4ilXzgWJ3epWODUl0Xt5/tGPCScouOluZIr5lnl?=
 =?us-ascii?Q?vrZOhTKJUyYE7lTLbCGciPggg34LmQcJgClthVQX1NXzRZN+gN3Hn/2P2Kes?=
 =?us-ascii?Q?U11owQOhvXNFQS4bm2z8RgeXynNso8fK16NYV6SGRbh9RxFjrgVvdv8KUFY6?=
 =?us-ascii?Q?giqspyBP295SyrSy9H0bzRE/b2rWC7FdPonsHyGcI81n297cF+aB4aJhhjmx?=
 =?us-ascii?Q?xAQvb6n95zjNY4LFAYlm8LHQ8uGy4Ngx6NK5nXanZsvEo689wSwKdP5j4vAV?=
 =?us-ascii?Q?MlxeUgJBVDT2+NM/xmCGA4otzCq7zW+CQ2SfDNnTQkusZBCE7lLHNqn/R9vu?=
 =?us-ascii?Q?T3oRz3r21atTgrEOb2chojUfiBI6LAhDb+CG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 15:12:29.1785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19c603f-1fa2-44ab-7c44-08ddc60d8315
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832

Otherwise compile-time errors ensue. It's a nonsensical configuration,
but it's supriously triggered in randconfig jobs.

Fixes: 8b5b49ceb3d9("x86: don't include domctl and alike in shim-excl...")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index b903764bda..f57a87bca3 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -1,6 +1,7 @@
 menuconfig HVM
 	bool "HVM support"
 	default !PV_SHIM
+	depends on !PV_SHIM_EXCLUSIVE
 	select COMPAT
 	select IOREQ_SERVER
 	select MEM_ACCESS_ALWAYS_ON

base-commit: 6efafbf13351cd4ca0b01407a27570a43bc9f15f
-- 
2.43.0


