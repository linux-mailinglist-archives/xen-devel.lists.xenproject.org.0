Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A782DC8B082
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173118.1498286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe4-0002Ih-0g; Wed, 26 Nov 2025 16:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173118.1498286; Wed, 26 Nov 2025 16:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIe3-0002Bo-Pf; Wed, 26 Nov 2025 16:45:31 +0000
Received: by outflank-mailman (input) for mailman id 1173118;
 Wed, 26 Nov 2025 16:45:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIe2-0008SW-2W
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:30 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d3e4121-cae7-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:45:26 +0100 (CET)
Received: from CH2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:610:57::11)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:45:10 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::f1) by CH2PR12CA0001.outlook.office365.com
 (2603:10b6:610:57::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:10 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:08 -0600
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
X-Inumbo-ID: 4d3e4121-cae7-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NENgxrn8SeZHwfy5wXtGmHDt5l4pDJgtpPybHuafWpz4UTuXAMfrPy9MdtsLLExrFeXzEelG+JOIsqP/kSS+CLOmGjOVMWHnq7eDYKj7mYE9+g67RO9q14WGdptTPugvzxa9RYKw08E/UlH841sk9H5vU93QG7Tb+1LxjLwY2HD/p7Jr0Kq5Qh5Yez3tYaitoi9YmKYRTUZxVMs02BqhxSRCiMWAKP1ioAgEOuSc17ZOIY8ll+X8dLHt62Axk5lvhI4ScFdhuAKZr5mx2/coTXq6Q5dXxzKTUb/NJMbcen/HoAPwA40UXZLMRLxRom1lB/oaIsfh8eQ6lPlvRNKZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHPqWvJxK0uUNHK8HcO4zHOR5y6mLd6Htjzkis1gRm4=;
 b=yS7mPwl6mmrhzWkqWblpN5qYM+5gUUkjJbdPdf0ExYjoX4CJxA256AUfmLrMaryG9de5s74ucmxQXse0Ft3MjhY9pVLMnRLSi/9Yvi79jE1SIaoK38wvhAyMjHU6R2rE1m5oP3tYsfBdU2BRJ83MsKGoRrAm/urIQ+PuHTTGPnfEUmeXEHKUmM1iqhfvSTys556a+yQzo2hWxYORuhS751DjNW6fDlFzTCkeSkTUeFi/OzYGWa/Sw2u8ORp8BCfEqS2mTtNctYnKhKrRAaQ2N5zGdQu+/S1OB1DiOJ1/DiKkaIsZQvWWHwMatC54S/cQZh8SNN89ug4pcW+ijG2ryg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHPqWvJxK0uUNHK8HcO4zHOR5y6mLd6Htjzkis1gRm4=;
 b=EFfoPHSLtmRSpkAwy+v0r3bShgQcLUCvjc+A7SLgiad0m0JrqwQx8+h/ZObuZUwiyiQ9w0CLq3CpNVwtGFJrMqNMQiaFssMidXNm9uB2OWPfvKkZoNdhNaenBpA0IBh5oQeO0qyyKjHz0AZrqg59o8YLO11RDSo0R6qNfK6ulLQ=
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
Subject: [RFC PATCH 04/11] x86: Refactor early vendor lookup code to use x86_vendor_is()
Date: Wed, 26 Nov 2025 17:44:06 +0100
Message-ID: <20251126164419.174487-5-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: 165a61e5-9545-4f92-e127-08de2d0b29c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PE7LPS5qRlLc6wO0c4z+ZeXH67fq2BiIM5GBu95RoPFjVAK07XYIpQrsSwpz?=
 =?us-ascii?Q?cRAdy6+/utIUl1gog92iLhFk6ABSiJN2kL3CzNGQRu5mprU3BLTxOZvq8zaH?=
 =?us-ascii?Q?aCk9Umx2c+tx6FhpAL0QEmi9JAiAmCY/VDk3d8oxwix3HWNtBHtS7Hhpp2as?=
 =?us-ascii?Q?6wXuXp8HhRQtYOul8USM5mtwg0TGXHxVmmmoa5TsNICjA0ByYteXwOCy7Rez?=
 =?us-ascii?Q?rSbJHIrjQJf6L8ku9zxTiLTLbEsHJFUCAUCOY8jzzBD4ScOKGo5+FfSsCEOl?=
 =?us-ascii?Q?/uOkaDUdHrubppybJ8Q/f0VtgzFGtJA1vpf9eXa14wyfaIu4aRB55MpUnU2C?=
 =?us-ascii?Q?sv1T6VDBDEmx8Cr0HGL3K/BDhlasOwQvQibL9xJZ7OwxYmOmoy5jV/5Plr+q?=
 =?us-ascii?Q?nI1ueBiObUX/EsmdpuEQ3y+vviO3DigZTQmSIZT9FDAfemY5JzE3qc/HYbmm?=
 =?us-ascii?Q?R4/A4Ely1sZ6VUL+N+THZn/nzyYfBdPp7Rj8AMFb5wo12Ki39UkZEbXhiDeN?=
 =?us-ascii?Q?2DXsL0x4C9T+sjnIXZQpUXMkNHFdPo5kqXHwRm63r+tsm3FYksX/QYhHSUmt?=
 =?us-ascii?Q?h4IsQfixuOel9KXVrh8ga5wpuTuJ7wzlWvhLVxKdu0RpitJbcHPF0Ksu14mk?=
 =?us-ascii?Q?jxVCxyGXtSjZkilVGGzcXg12blj8rojEBiN9S65XJ5i7pl7wEj03XxJYD/lI?=
 =?us-ascii?Q?MCJYk6lzmcAu4KaNsIlB/s/vZJFxaaBhc3lY6OwwvESIbf8lMhJzi0wB/xYW?=
 =?us-ascii?Q?jwNmaHg1UQVBWVqdqz6o9Lqr2LkSiAATDpsFtjxVSWsyi8jczZkasiEtkPjT?=
 =?us-ascii?Q?sMktPYw1gsAgA24twtJ14dzy0LKlZq6fdnUt6cUy+C3WSnrYsVoUBTHNvMHD?=
 =?us-ascii?Q?rSAHN5GKQCLLE+05xD/qlPdUC1zhr2bE01hmU/M4B6Jd46iTLHS1/dBboC8h?=
 =?us-ascii?Q?GFaLEi0/ovdfjFmrhkYO2d6/fAKL92c60RTD1gRNjUYaoJczzZYni6vwn8oH?=
 =?us-ascii?Q?1CaMhD0IGxjV6kUDOr5TQmXM5WfilGWdL8tcEqKz9fvt9NErhkrgc0b2+tpp?=
 =?us-ascii?Q?nmmT6wZWr9/DyISC8rCNuGSlT3bVGRdtRPSZQQ0/pn27ovI+pyxjkYDYliOo?=
 =?us-ascii?Q?tvzYAkRSkyMRnwWp1f1vI53FQlailmIRx91qMmX7pAn+txbJGBmoiBl8pRno?=
 =?us-ascii?Q?yDJvCNgXdMR+tHiEum32JJopPVpp5hq7OcMhhf/iBEAb3hLBieVeffeoGtFQ?=
 =?us-ascii?Q?tUH32LI5M0BJeZ2610JVxFy0Qq5FOcM0mOPpniEHNBa9jy8OyjdXxr8SE3uS?=
 =?us-ascii?Q?fhzvZMSWLybYC9UYenZENWVIg2lpGbTL0Gx3aNg1oqUNwVBW0RCSy1QznDAb?=
 =?us-ascii?Q?95kBS1ODRQGZQNu3ExBwDwhRCbH9omHYc972z6fqr0MEEzy5FP6ByPvDtHMy?=
 =?us-ascii?Q?wtfaW9pUk/stN4DZEYHCR8gmfV2bAt1/IwIFFG9P7+yeyjMhbBFd1sRHDcgf?=
 =?us-ascii?Q?nxmBXlTT30t3i/vFVzY/E5iCPQsnJUzYcArODukrOxxIVgfYeFHp27UNVmzM?=
 =?us-ascii?Q?yM5g1dKqma2RcWlxDnk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:10.1570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 165a61e5-9545-4f92-e127-08de2d0b29c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

Move the "unknown" vendor ahead of all others and have it NOT rely
on x86_vendor_is(), as that would yield incorrect values for the
single-vendor+no-fallback case when running in incorrect hardware
(because x86_vendor_is() becomes a folded constant of the single
compiled-in vendor).

This is one of the two places where x86_vendor_is() cannot be used,
along with the compatibility check on loaded guest CPU policies.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/common.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 393c30227f..c0c3606dd2 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -342,23 +342,38 @@ void __init early_cpu_init(bool verbose)
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx) &
 	                X86_ENABLED_VENDORS;
-	switch (c->x86_vendor) {
-	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
-				  actual_cpu = intel_cpu_dev;    break;
-	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
-	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
-	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
-	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
-	default:
+
+	/*
+	 * We can't rely on x86_vendor_is() here due to the single-vendor
+	 * optimisation. It makes x86_vendor_is(x, y) rely on the constant `y`
+	 * matching the single vendor Xen was compiled for and ignore the
+	 * runtime variable `x`. In order to preserve sanity we must assert here
+	 * that we never boot such a build in a CPU from another vendor, or
+	 * major chaos would ensue.
+	 */
+	if (c->x86_vendor == X86_VENDOR_UNKNOWN)
+	{
 		if (verbose || !IS_ENABLED(CONFIG_UNKNOWN_CPU))
 			printk(XENLOG_ERR
 			       "Unrecognised or unsupported CPU vendor '%.12s'\n",
 			       c->x86_vendor_id);
+
 		if (!IS_ENABLED(CONFIG_UNKNOWN_CPU))
 			panic("Cannot run in unknown/compiled-out CPU vendor.\n");
 
 		actual_cpu = default_cpu;
 	}
+	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_INTEL)) {
+		intel_unlock_cpuid_leaves(c);
+		actual_cpu = intel_cpu_dev;
+	} else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD))
+		actual_cpu = amd_cpu_dev;
+	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_CENTAUR))
+		actual_cpu = centaur_cpu_dev;
+	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_SHANGHAI))
+		actual_cpu = shanghai_cpu_dev;
+	else if (x86_vendor_is(c->x86_vendor, X86_VENDOR_HYGON))
+		actual_cpu = hygon_cpu_dev;
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
 	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
-- 
2.43.0


