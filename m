Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A890B077C7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 16:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045277.1415365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2xr-0002eG-Nr; Wed, 16 Jul 2025 14:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045277.1415365; Wed, 16 Jul 2025 14:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc2xr-0002cG-Kp; Wed, 16 Jul 2025 14:18:31 +0000
Received: by outflank-mailman (input) for mailman id 1045277;
 Wed, 16 Jul 2025 14:18:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPeD=Z5=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uc2xq-0002cA-Ai
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 14:18:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2413::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc7c3d4b-624f-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 16:18:27 +0200 (CEST)
Received: from PH7P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::16)
 by PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 14:18:21 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:510:33c:cafe::3b) by PH7P221CA0060.outlook.office365.com
 (2603:10b6:510:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 14:18:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Wed, 16 Jul 2025 14:18:20 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 09:18:18 -0500
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
X-Inumbo-ID: bc7c3d4b-624f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKDiZ+WRHQqnuPVhVXelNqnTcaZKQPChi2HDTBQ0XZkD/NGsNlupHNjrxvxPouZFV0q0D3N4+GxnXIabLOXeMx3MoqxWunlGI10QBTykus9FMdtLOX5oSpzIG8eoIAjX+2NTw0ZP8q4yjtCLtNCaUEtaZOqtFJaSjHqATea7yCfwzbnLimG7ljQo1fFbv+oSRDcjVQXcFRFeIIpx3Nbp4/BGFvDFZeFGcJlYMbOJA10o5kuRxfkRiQp0HmObdB7wKGNJE31CqFsl/fBzLWIPJPgSal0aQ8Cscz4hGAFsuHGpt+BZPegD6FEohwBhkXB8zxghImXQHSmGicw3Bgfxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+dS+gGFYh+0y0l5HzA5QO+FaghGWW+JGVVzEqQoMVE=;
 b=hPTlSadmNiu/RjgcgeSgRyUTnlivdPwKn+aPoBn2jl7/SUhXt6qJseIakOTihaeNaWthyInYct8OM3Ae4g0yTTnP4WauSPA7Oa19QXXdF7PYfdhWxfe8htUQG3tW+kOlhytUFH62I4qToctLjCzvg4dA33VFLDej7bTXFZWRkCZGn+/pKTeMG5O71+C8r7x/FOWpKPCAhQ7H97TSPaJT/iJcuoOxpqriF04wB6JKDJ1+oaTCh/5EvRGammOxiOq0jnLCE/cZWNgBP8sVUIIUphOfZGgvdq+B6xUgy2MHGKCxe0Cs+c1TFpwRP50kNXRyx3uEWqIagwjYFQ/nSIpiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+dS+gGFYh+0y0l5HzA5QO+FaghGWW+JGVVzEqQoMVE=;
 b=AA6KOIBzxWwtV4GziNpgQQ4lVv5Zohn738cbNmUCnYjQ/cfIcHC/QwBYJ9eS6op6N4zJjPdH1p5lmVzUfCEpnxTLwpUGAaEfNGF53Ex9kcxenMlEKNRCazqc/3qfunoLMD92MSysk2pB56vULo8sMug5XX7gTDtjvgh78XTQGQo=
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
Subject: [PATCH] x86: Prefer d->max_vcpus to dom0_max_vcpus()
Date: Wed, 16 Jul 2025 16:18:03 +0200
Message-ID: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|PH8PR12MB6746:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f4af9a-97ce-47a5-f2a5-08ddc4739dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SioekIWVqt4mz2suwB+/IY47RPLPQJVtO+iGWt3Ahs6xJNNmFFkq6kuID5ku?=
 =?us-ascii?Q?w3Ef0ygfZ0dPVr5i0yol3qnE6hej9iSOwie3WpIkIyy8/GICqJF8y4xOqH1V?=
 =?us-ascii?Q?BWEpYLMMpr5k84w3gVhA4wIyPXnZPQNr29wzwgJD74Rzy5aKROD16fgfLgqS?=
 =?us-ascii?Q?9NFRjQR4W06eS5kCVoEg1FVCOe0nI9UBcMuDHHbWkYd6CkU7GvfEp7FIgPgd?=
 =?us-ascii?Q?j53XcCx7fIWSzBPomwzlaG3kQO/hb9/UaE5rYjppgiuQ7QVpDIB2Jf4XOkA1?=
 =?us-ascii?Q?n8E3sO+lD87hxs2Lajs8Hr3neET4NsUUWLcCGO/G6tqbg2UU+qR4rjiP/vNZ?=
 =?us-ascii?Q?QJ0uFBLkQg/TCRJvbXNuX/9w9bdJSKmDK1JeziLpfdEhfYhMdx7yW/gRAz33?=
 =?us-ascii?Q?5S7MLZcMTFjwH11G81J04ixx1ORXLn0A3r5Izxz0jiE0eBGdQh6Uaj/knuU/?=
 =?us-ascii?Q?GUQ7IKiGR/hRTMmrCybU9pflUHeOLXUWNmLTrpaA90YGLB5gNQLihj4dVmcd?=
 =?us-ascii?Q?gy34XcGEmqvDCwwvUGYFFWjlqwQ36UMSSwl1mT26lQf5horNbKeioBxIwknc?=
 =?us-ascii?Q?vzcxznfVI5cB/riL0zA0Enb2yioeABneTOZQ7b0ip9JIT8e7id910bM9a+h9?=
 =?us-ascii?Q?WSVMYciZRK51WVWyNUNmqKrz/ieP63tOagdTLj2GUnxV1SPs7i+lU1y+LNlV?=
 =?us-ascii?Q?QXwuLjDXFalH6aVJZlZK6DzZ3EowIrJVeJAaYZb+3cUUBAy0jSQfcNoUD2SA?=
 =?us-ascii?Q?WDfq4hrzSYgxsEvtxw3qVscP8C3r22B37IzPyVEEvNhmJmhXwbdYd+eK7+fI?=
 =?us-ascii?Q?VRXRw5we9zaFfCj3gfT7AEc6/2tPaHHGwblAkD+fgw+4cZFLdhZEbgTN2Kvh?=
 =?us-ascii?Q?AhRkht3dkVXZkhvVvQB//ulKSuBqn+HAf7OdQB0KHhsCr4XZligIYvprT7xL?=
 =?us-ascii?Q?gVUqQRXU/m8P/ErDX6jfOeu8atqy6e8P63ZiLEI9HOhCRXHfV0XKEiqecNrG?=
 =?us-ascii?Q?YDSnIoonZonzyo0HOfAL0wDCORgkC4Wb0MrQR0KfuxRqzkimyAKaWWWCxnEk?=
 =?us-ascii?Q?8id1B8UuGUlkLBdE7kIwaRLsRbLjLelvYObbokgzFs77Jk+WlgQK6GbOnvdo?=
 =?us-ascii?Q?fkpZhFYtDwIX0WkR6xAOmxn1HXFmR4ZSC/ia5uR1xJZz4y9E8pY6DiYayn/G?=
 =?us-ascii?Q?v0yA2uYheOsxGo5tJuNaU9icgTNqcIweoGt3obVEt5KYxTMJrmXEoM2+2kP3?=
 =?us-ascii?Q?mTEoruXlLpdzaDO+QkhkD2569PLDHWLn3YTuL9v0P2MRRWuw1NFFWxnR1W1G?=
 =?us-ascii?Q?StD05gyJXeSNpOWzQfki7MTF3N5PV07hUSXE3h1u7poXB+llkL8xwwTCUCpf?=
 =?us-ascii?Q?mEHnVIohJl2WaSZJ9JcCoacMAFCF7OQGBad4UiDQStuFlwxQORn+dWYSoURF?=
 =?us-ascii?Q?zns45N2IFjf6B6dnG3350dZ9IwIUDJH2mxDQFjLFCBKs7w22CBrXiCEwx+Tg?=
 =?us-ascii?Q?j5yKflNwVOMsyCSrFgaztUp/wV84MX7BC23m?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 14:18:20.3389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f4af9a-97ce-47a5-f2a5-08ddc4739dd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746

These days d->max_vcpus is populated on domain_create(), so use that instead and
avoid a function call.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/1930259234
---
 xen/arch/x86/hvm/dom0_build.c | 7 +++----
 xen/arch/x86/io_apic.c        | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index a038e58c11..9964068387 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -890,19 +890,18 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     struct acpi_madt_local_x2apic *x2apic;
     acpi_status status;
     unsigned long size;
-    unsigned int i, max_vcpus;
+    unsigned int i;
     int rc;
 
     /* Count number of interrupt overrides in the MADT. */
     acpi_table_parse_madt(ACPI_MADT_TYPE_INTERRUPT_OVERRIDE,
                           acpi_count_intr_ovr, UINT_MAX);
 
-    max_vcpus = dom0_max_vcpus();
     /* Calculate the size of the crafted MADT. */
     size = sizeof(*madt);
     size += sizeof(*io_apic) * nr_ioapics;
     size += sizeof(*intsrcovr) * acpi_intr_overrides;
-    size += sizeof(*x2apic) * max_vcpus;
+    size += sizeof(*x2apic) * d->max_vcpus;
 
     madt = xzalloc_bytes(size);
     if ( !madt )
@@ -942,7 +941,7 @@ static int __init pvh_setup_acpi_madt(struct domain *d, paddr_t *addr)
     }
 
     x2apic = (void *)io_apic;
-    for ( i = 0; i < max_vcpus; i++ )
+    for ( i = 0; i < d->max_vcpus; i++ )
     {
         x2apic->header.type = ACPI_MADT_TYPE_LOCAL_X2APIC;
         x2apic->header.length = sizeof(*x2apic);
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 84bd87a5e4..1816e1c0b9 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2758,7 +2758,7 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
     else
     {
         if ( !d->domain_id )
-            n = min(n, dom0_max_vcpus());
+            n = min(n, d->max_vcpus);
         n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
     }
 

base-commit: dff462313fe0bfa273c54ffc9bff71f054c365af
-- 
2.43.0


