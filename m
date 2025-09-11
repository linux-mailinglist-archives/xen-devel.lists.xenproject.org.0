Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F47DB53174
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:54:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120054.1465158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrq-0001aQ-1Z; Thu, 11 Sep 2025 11:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120054.1465158; Thu, 11 Sep 2025 11:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrp-0001Ys-Tr; Thu, 11 Sep 2025 11:53:33 +0000
Received: by outflank-mailman (input) for mailman id 1120054;
 Thu, 11 Sep 2025 11:53:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwfrn-0001L8-RG
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:53:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eecf0432-8f05-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 13:53:30 +0200 (CEST)
Received: from DS7PR03CA0192.namprd03.prod.outlook.com (2603:10b6:5:3b6::17)
 by BL1PR12MB5828.namprd12.prod.outlook.com (2603:10b6:208:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:53:24 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::3d) by DS7PR03CA0192.outlook.office365.com
 (2603:10b6:5:3b6::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 11:53:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 11:53:24 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 04:53:22 -0700
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
X-Inumbo-ID: eecf0432-8f05-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xp7qzRQlLvcftuLGSkY3eT37iOoRkWkWm7K08Ocuu6QZYcY1CaaI0Ic4xKPNlu5GI0B9I1VtvSpj39SnAtz2Dk/NGHDR1zyheES2WeHPA2SguVYeMIGJ9h9Z2jIIKWKHtgzfy3zP9dHIQqu01v5nAmkUEasGmmrq6DBqOSsW+n0LZ8Xsa07z6ak1yfxXlwhgYkuITuRUOPN8yKzfUvdx32cumdOJRBBAfsHedaXMEFiUDDFQsGGPJAragjCI0ESYLiWK+WWsMT/hE4qJu2uSkTaq9TBICDM9TRyGRQ9/amOBQ+UYZnnMsr6M0t/IgJGI6/G4b7VYNm+OKkqUpElZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkDMZW5IAo1eBCGEcen5eEzeBVV+iCXu9QaTMqlJeYQ=;
 b=GbVoN3eWlH5RMTmVxxyk8zCFxVSDvEC0iuBVJ0pNJiJGXUDcYlVjS0kInnhkDiz+rhnCgGD6FJDQ8Jli3lFJjmV8pEz5yroRAeVQmKahIhfAK67nHd3SaBIQIVS/3T6fJ5eUBTO6ZCxap29baaU8ULx/qgR6ftaMNxVTOpQ5Phv6Fx+qP/HJm865+nruZA+DEzj2PIag2oFgebUBdUdGBtGWj2c2BEKvCHy0ZblciUQv98iA2EVVOoD7Pkr8VJYjbLjRrsnk3Zu9QYMtHdccAgx2maWQhvkeHup8I9OTHfGIEK7HLKG70tkI28VRsB8bbnNz1mXHwL5lIar8zjjTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkDMZW5IAo1eBCGEcen5eEzeBVV+iCXu9QaTMqlJeYQ=;
 b=h88Vlp/b9AqrdvljtiNUifMRsKYUNu/9aEU8MTc4ZpbyCZ0QRASaYoDKUyYEwZCzmo9l3BkpC2tf9wxrQ57FNf7XFvQUVMxV5xsG03x3uqZuEnYMMfcFwnSHpE2D2dygmLdDlRm2j1oLPedpq39Lli0X7Q7WsTiare+k43lwamE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>, "Grygorii
 Strashko" <grygorii_strashko@epam.com>
Subject: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting memory
Date: Thu, 11 Sep 2025 13:53:02 +0200
Message-ID: <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|BL1PR12MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a345029-02ba-45fe-be20-08ddf129d049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7i+FXEWLKV/oQn9sb+cV4wh4zsbuVkrYSabzXjjuDQXYF6f+1yFJqNnShgrP?=
 =?us-ascii?Q?lXw5RzPF7iw/W3PghY49cIHVICGKoCk/LWF2ERspt1mtcnClUZvYoLnu+K1Y?=
 =?us-ascii?Q?Gg2Xar3MyJX9+QQURGWO3n+MrGEjTJrT3fSe1WEREfLqVroHJ8fHYntdQu/q?=
 =?us-ascii?Q?uPJPXXi1VgCH2eUW4uXwnKW4K4+N5rEybowOxI//t80cecU6gD0zwE7Y7ruH?=
 =?us-ascii?Q?ffsMD7uVHXjoSPqyPtHIVV3gNqi+U4qaZ0jE3iU5Js9crynUOS5VQrDzGN0D?=
 =?us-ascii?Q?aiSb3C90gxQ0k//3ioieywT67aKv5sXG8mJogbY8nwhbcp5luHOAEaeV2BnN?=
 =?us-ascii?Q?uWVTX+eH/evn+03JouQ+fhJMThcD0bS/Tmb9vxy7g+6sK07o7WmwuoPlmcpX?=
 =?us-ascii?Q?pPDYKPOhlQz8VCyFiwqeSC/SgSkmzIE66pHNSXOkasK1v4R75F3RwiS9EApU?=
 =?us-ascii?Q?0VFf+ls6wWhcc7Nnq+jsQshHFaoq/sag7p8q5SmO6d/HYggAaoQ9MCKielNZ?=
 =?us-ascii?Q?DK3h9YmlS6d7RHkhSGn+u3NhhT0O8aiK+uLVqG8yflN3oXhA7rjB2GTbcNab?=
 =?us-ascii?Q?FHRNxnXobel+SDXgnqxfQ0WKhq5MB+0pklNs1W10hl/o20oOjn2LZ7yb2z9H?=
 =?us-ascii?Q?aMChC2M3Ai2qnevg1a+nzNgRMKbXOnpa2B/Dz67BlEKJ4AY7a0YYs+Vuwtjg?=
 =?us-ascii?Q?pYGQ5HfcDnAlIt4hZSFvYMPmW8ig40hIKEBqHWL894//DrqWNQlOS+EMa9dC?=
 =?us-ascii?Q?jj8NSMbEQ2eRMt1IHMtkq2FUjdqynD0foI0mJ03UUv8koBgiTCHT/msZ8quP?=
 =?us-ascii?Q?BXwFdwEIKrFeDOwEAiXR1hawRy5U+OjfnaYEijjMuIX+51bb4pSkyGSQB3Oz?=
 =?us-ascii?Q?IemKXASoRZpUtWc9jit1RCUrf6o9m17VA95XCKfII6pHb6P8UkLrQ514H4fu?=
 =?us-ascii?Q?lt5YNeuaKKPV6kGiwU8Km5BevtI01yIZrYiNPYGrurtmQTx0nyfJrnvYp/QK?=
 =?us-ascii?Q?zSU3v15Re1rrihXLBXspE1CZRnPc5bUysXcpx+VHdkYHrlP4s2Rz/9eCwRhX?=
 =?us-ascii?Q?nDGZc1IliFRnQCLqYBh3IBO0GQby7fJ/kngksEa3Smf7XFojCrG15xKVZ2Iy?=
 =?us-ascii?Q?vh+teu7VWgYtXQmF3dQOXKf7RS/AHqPNct21dljfqftVadm3Op6qm3oKv/zI?=
 =?us-ascii?Q?RMtKYbltt80mKHwxvuu0QMmYzSu1G1y0shpRLZ37QEvrtUEyo3NaZWh5wMZi?=
 =?us-ascii?Q?DA0gS7SdytzPisiSR+Lyv94yUNFqr6WNHm4f9KBQ350ecc9nUeSsVLtRnueb?=
 =?us-ascii?Q?OXDyufH0blRh8pQfr5olFpatz9vq9l2ymEoL2nJeBsvSTGPsHUWrZp28+DQK?=
 =?us-ascii?Q?lOiTU241Oj3XInoPql+slqcch1ECye0zlZHpSsATMxf1OghVgsxHr2FmiKnA?=
 =?us-ascii?Q?+Bjivn7VGRNDEANYfHugVQm86oDBCemTZYYh74ecrZfsxVL5O1h4kIAUmjpT?=
 =?us-ascii?Q?Gub95bC9/pdRt5mMTYV5tsP9RTKBPAaGp5mr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:53:24.6123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a345029-02ba-45fe-be20-08ddf129d049
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5828

CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf00
by the device model. The GPE handler checks this and compares it against
the "online" flag on each MADT LAPIC entry, setting the flag to its
related bit in the bitmap and adjusting the table's checksum.

The bytecode doesn't, however, stop at NCPUS. It keeps comparing until it
reaches 128, even if that overflows the MADT into some other (hopefully
mapped) memory. The reading isn't as problematic as the writing though.

If an "entry" outside the MADT is deemed to disagree with the CPU bitmap
then the bit where the "online" flag would be is flipped, thus
corrupting that memory. And the MADT checksum gets adjusted for a flip
that happened outside its range. It's all terrible.

Note that this corruption happens regardless of the device-model being
present or not, because even if the bitmap holds 0s, the overflowed
memory might not at the bits corresponding to the "online" flag.

This patch adjusts the DSDT so entries >=NCPUS are skipped.

Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure...")
Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
Half RFC. Not thoroughly untested. Pipeline is green, but none of this is tested
there.

v2:
  * New patch with the general fix for HVM too. Turns out the correction
    logic was buggy after all.
---
 tools/libacpi/mk_dsdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 8ac4f9d0b4..06a229e2e9 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -239,7 +239,8 @@ int main(int argc, char **argv)
         /* Extract current CPU's status: 0=offline; 1=online. */
         stmt("And", "Local1, 1, Local2");
         /* Check if status is up-to-date in the relevant MADT LAPIC entry... */
-        push_block("If", "LNotEqual(Local2, \\_SB.PR%02X.FLG)", cpu);
+        push_block("If", "And(LLess(%d, NCPU), LNotEqual(Local2, \\_SB.PR%02X.FLG))",
+                   cpu, cpu);
         /* ...If not, update it and the MADT checksum, and notify OSPM. */
         stmt("Store", "Local2, \\_SB.PR%02X.FLG", cpu);
         push_block("If", "LEqual(Local2, 1)");
-- 
2.43.0


