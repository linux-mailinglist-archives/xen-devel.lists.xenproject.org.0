Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKSSCGMDFmrNgwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 22:32:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E56E5DC53D
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 22:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320158.1587524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRyR2-0001l9-Js; Tue, 26 May 2026 20:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320158.1587524; Tue, 26 May 2026 20:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRyR2-0001ih-Ed; Tue, 26 May 2026 20:31:32 +0000
Received: by outflank-mailman (input) for mailman id 1320158;
 Tue, 26 May 2026 20:31:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wRyR0-0001ib-8B
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 20:31:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRyQz-008rIk-GI
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 22:31:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a1602e1-5cb7-0a2a0a5109dd-0a2a4505d964-38
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 22:31:28 +0200
Received: from [52.101.62.52]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a16031f-aaa8-0a2a45050019-34653e34cc53-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 22:31:28 +0200
Received: from BL1PR13CA0288.namprd13.prod.outlook.com (2603:10b6:208:2bc::23)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 20:31:22 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::f) by BL1PR13CA0288.outlook.office365.com
 (2603:10b6:208:2bc::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 20:31:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 20:31:22 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 15:31:22 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 15:31:21 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCKwe3YW0KMbb87VImuyxmsYO997gpNUeNwsKtnTH1ubV9MMtwNdpS0WpblvU5sePgqm8SoCtFQSh57PEaOuB5+vjNjXQbRy5q+pVwcL1yailJ+j22KneBln1uj7Lc/wJS9UpRHmoBUzFKzZCMHYm6aduuIuZ2MNV7wYpiZmdYCU99ZcdqBqmgdEmhSJ0uncZ/diFaRE6wJPn7LN+2SyGoUYNLOcPqorciKC9+sAy9UmjSyGL298Ctg8T3LR5iuaJ91pGf1jrSmHlZK1xSi23ILaIqSIYU68r6OY8SWS9G854IiEyafPDNbfAgCskx0eFmsSAQ0AqaEBkTM8IjXnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVKDGc3OoiFYqlfIOCBDgza3kBiPGFo+zo3nKOSO6iA=;
 b=lRuEe9Gi/YRoFZKayINHi7HnDCYB88mdlfyfCn2yI7IWRh1G97N2NxgIifj53hiMyJBOzhU12gXZ0pOBsnU7WlyH0ewjRvFZIzVUWZ3t7zWH0uW3r4AFVfD6rmRFa69QH6R/yl3vgwCzWeBCOcQrZ0/JPpmgxRZl16Iu9HZh8PnBJAnqw9RtB8MYZjf1xXQZMwLlYsYZ7Mv2yMieVSpUtiy6m26aejPf6OdMtVw9iO99eSIk1GRlvyrIA/+gSmsk/QECpNq4q5pbwiVvEsIWasHAA9yzzWqRRgXYT8eKbTCXLgZ/o3dRkqSUzbsZX21FZqVmqe0eLq039Xj334Qk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVKDGc3OoiFYqlfIOCBDgza3kBiPGFo+zo3nKOSO6iA=;
 b=yPen4+YeliwhHqhUT/JEQ0v6wGESKk9PknxR1rU/y25p69pE+eLiYQbBa9IOgh/+rmCNH5tefCQGsZk7Pd1MrqwpMHDPg5zF/ZBiImyK3yqu8Zp1Z8VG1AZYneyay7ZU1C9yhKtkiglAfMwMAUPx4D9pC1r+e2Kc8L5F8hpDxR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] xen/x86: Change stub page freeing to fix smt=0
Date: Tue, 26 May 2026 16:31:14 -0400
Message-ID: <20260526203114.40882-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CY8PR12MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: 51497a6c-f2ec-4655-937f-08debb65c03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qYH/98wrkrf8/kYNI6mZxbI4jELMdiFmcJysIeZmvPZQ+Ea8gI3BluhVZFVXBXRB4au4bzpphYk1VsEUZuGSc8qfHQgYFNn2pg2Sb9KG3dOdioTvl9tLfTpgLtpNaFisIaYafZMBAVY8zHF5GdogaCSgL24NHhir1i1VXa741sKTXL+jN9F1RWVKsLHcjmHG/oad+1OQsR9lraz3Q9iCgJWdsFnHoDEBOEJIU/kV4+G1K5j17yxu8cydAuHhdsUExdmYQAW1uwWRXtp2W5iJ12IQQyw63iVDaS3uKMCUUtvnM6+z/Hi9iMRZ4F3HINvbm/e1fkEdOJPVoDDExfEWQEOqeVLrxp1Ykx1mXTQJmh5d+V6AuwCER6yrQ3j+PwWkSgZKnS0LdLyy4v3I+y0eBpXecZGdMS6EatcFCBJdbWuyqvwOWUf4bTB3AgMDnOVotydOEvJvI7wbQyXA2hyPMExj+rF+Rq0haAppk+usbRHRfdzm+IJpcgvTKnDEQHd4o/xLfgUA6q/Aa4rh9F2C4AjT5RqmZLpuladiaQfQ8mTtLo7ogcz6gjgTJKL6Pnax9Xa5jiRXjoSL2RrWVLinFhve7Oom753e+cSRvJZ2IMhceATyRcQ6V0C2AJTibhTizF93/7FtMXHpYWN+MMSa8Hy/owh6KWgQXn63PVq83gVyjaNNXVVgF/Epy8fARGGGFEJeaiAZeX2bWpLwz3mL5aGvPtaDe6NcOC4rS0uih3U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bNfx9j04+ONhx2nFBjWAp5BhO8QDktS+MdVa/gsYENS2PvpuUuvqJdANHv0dQUs2NDO0Q4uMU4vfuZwoRElMQMWAfzCZTFORsHgQ5HuYVjm8J4kgTyOVUJF+yiomQCh4FvXZZbSAk5+fVYSyxKJvEvt1nMHLFnmrUl6jVNhRjzkxhw1reumfkWJY2yfSf45hbR7LabjEiMduDyQzOmRgH1mNtWtyizvSbvAQfRaFKRM9sATacqS2OBn5P5gjH3gyNcQBGyQoZF/5E+6x//19l0j0PMvoBLcNLM98Q3U7wM2Dmx4N/Fi4GbFdukYDyBUOTFhHjpDpgvsn1uBkiKareGTe+yXkCOwSDUvVoxq4SGnWPPJE68fhqp7IpnOEOQK91LsWiXg4/wE3Yg4f5e712zmcdhN5s7pym8GJDb3yoarKlCAzQitHKTgjRGdXOzfF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 20:31:22.4043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51497a6c-f2ec-4655-937f-08debb65c03c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193
X-purgate-ID: tlsNG-c201ff/1779827488-E0867443-4E77C3B1/0/0
X-purgate-type: clean
X-purgate-size: 4235
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6E56E5DC53D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A single stubs page is initialized with 0xcc and re-used, with multiple
CPUs each using a portion of the shared page.  In cpu_smpboot_free(),
each stubs area is checked against 0xcc.  When all are set to 0xcc, the
page is freed.

Booting a system with smt=0, CPU0 is initially setup, allocating the
stubs page and initializing to 0xcc.  When more CPUs are brought up,
CPU1 is initialized and then immediately brough offline as it is the
sibling of CPU0.  Since the page was initially memset with 0xcc,
cpu_smpboot_free() finds all stubs as 0xcc and frees the page.
However, the page is still assigned to CPU0 and continues to be assigned
to other CPUs.

Meanwhile the page can be reallocated, which can lead to misbehavior.
The particular instance was the stubs page re-used as a page table which
later faulted when the entry was all 0xcc.

Change to initializing the page as 0xd6/STUB_BUF_FREE, and initializing
individual stubs as 0xcc/STUB_BUF_USED.  0xd6 now indicates unused, and
0xcc indicates used/assigned.  When freeing a CPU, the stub is set to
0xd6, and the page is freed if all stubs are 0xd6.  Initializing with
STUB_BUF_FREE lets cpu_smpboot_free() a page that was only ever
partially used.

0xd6/UDB is a 1 byte invalid opcode, which is similar to the existing
use of 0xcc.  0xd6 is used to identify bug frames, but the stub addr
(e.g. 0xffff82d07fffe000) fails the is_active_kernel_text() check.  It
should be okay to use here.

Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
It would be nice to use get_page()/put_page() to let count_info handle
reference counting, but they require an owning domain.

The listed Fixes introduced the use of 0xcc, but the smt commit may have
made it more problematic.
Fixes: d8f974f1a646 ("x86: command line option to avoid use of secondary hyper-threads")
---
 xen/arch/x86/smpboot.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ff05955bae..a5d485b732 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -643,10 +643,16 @@ static int do_boot_cpu(int apicid, int cpu)
 
 #define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
 
+/* Fill values indicating state of stub. */
+#define STUB_BUF_USED 0xcc
+#define STUB_BUF_FREE 0xd6
+
 unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
 {
+    unsigned char *stub_page;
     unsigned long stub_va;
     struct page_info *pg;
+    bool initialize = false;
 
     BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
 
@@ -661,7 +667,7 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
         if ( !pg )
             return 0;
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+        initialize = true;
     }
 
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
@@ -675,6 +681,14 @@ unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
     else if ( !*mfn )
         *mfn = mfn_x(page_to_mfn(pg));
 
+    stub_page = __map_domain_page(pg);
+    /* Newly allocated page is marked entirely unused. */
+    if ( initialize )
+        memset(stub_page, STUB_BUF_FREE, PAGE_SIZE);
+    /* Specific CPU is marked used. */
+    memset(stub_page + STUB_BUF_CPU_OFFS(cpu), STUB_BUF_USED, STUB_BUF_SIZE);
+    unmap_domain_page(stub_page);
+
     return stub_va;
 }
 
@@ -992,9 +1006,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
         unsigned char *stub_page = map_domain_page(mfn);
         unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
+        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), STUB_BUF_FREE,
+               STUB_BUF_SIZE);
         for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
+            if ( stub_page[i * STUB_BUF_SIZE] != STUB_BUF_FREE )
                 break;
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
-- 
2.54.0


