Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63241B53916
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 18:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120606.1465464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5p-0001Lr-Pb; Thu, 11 Sep 2025 16:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120606.1465464; Thu, 11 Sep 2025 16:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5p-0001JU-Ke; Thu, 11 Sep 2025 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1120606;
 Thu, 11 Sep 2025 16:24:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwk5n-0001Iy-Sk
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 16:24:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d96387-8f2b-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 18:24:14 +0200 (CEST)
Received: from DS7PR06CA0041.namprd06.prod.outlook.com (2603:10b6:8:54::10) by
 BN5PR12MB9461.namprd12.prod.outlook.com (2603:10b6:408:2a8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 16:24:08 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::1e) by DS7PR06CA0041.outlook.office365.com
 (2603:10b6:8:54::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Thu,
 11 Sep 2025 16:24:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 16:24:08 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 09:24:05 -0700
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
X-Inumbo-ID: c0d96387-8f2b-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi3lsTTGtnRl3WZU5i/qVCnP7FSiKmRgkgRbZSCOBNk+yofcI9h1seiq+SNlq6YDrqlUaHP5c+GAk5RiTbkiwqD8rVD0s7lWQeO19jSAXO+wtA8TDTIfheY0lL7GAHXdBdQTBGt2LIVHIRuSeHUWJ1dxWy+ycsP4UZ7ccs7AIr/BRDPWInywu3ZeLX4kOXSfgyX85WEntAG+QWksXp3bz+IJXD1AyyADVUuC1xW6Muo7WB0HT5JaFp1w5iva27GxHUvO3vKKYgu+L6yEUl44ZnUZFyCA0QFoQV4kWTCjsp/RiLlNOzwDVJBqbGck66zvOP59fARDhAI07R84x/ZyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC0zV2Rn5tEKRCNSHpot5uWzS9t8S0EwSLusR4mEgMI=;
 b=I7D1LZrIW/BvXhJ9Gv8LApfnVpNbwbTS9TmNWCj5SmzWHKBZUTQdZi4NytMtK5YUEc52ozJWI6M2SnPlar5IHl7NDtjc89vXo0ddagu5srDDI1hUfzwCyMZ1BCvwq3ECd77StKXvfD3e7sopCi4ej7vz55qQkRL7IIYe7x/aEEtOA1PCTnKJcjjGCIihnyrU2DxHkeFKaP8KsC57UVL58eHhQ3Lx6B7GMl5c34q1q7lHD1j4+Z8Oha1LfpgLiWayScZ91/sBkwLeF/Aq9+cUnRS4aCjsa/ch6G6zLYLvIV8pSgl7bpjJRnUF6lgbOgbtK9iJHkfjRmHFcZO8aXFgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC0zV2Rn5tEKRCNSHpot5uWzS9t8S0EwSLusR4mEgMI=;
 b=E+oU4Ix4Cx+u6gYRc2f9Iza0HKfDCpfpWeZ7/Ph32Tor03MVRbSyDBe9oJIU6m+KUzKugdFIV2f+YZxbYo6aN0X1YZKY69r5mjaCzdpFqx+27JVYQnmcMfkuxuVqHNs3wai1NnXjzxx3W8VnCM+kL8nKC+k384WXMrpxCCjUT50=
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
Date: Thu, 11 Sep 2025 18:23:32 +0200
Message-ID: <20250911162336.23887-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
References: <20250911162336.23887-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|BN5PR12MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ed1138-6a2c-44fe-cc9e-08ddf14fa235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzc3tZPFzuIV7/5G2cOi6jxg+ndRHsUx+ij3LA+6IkYxlww/Aay/b9h0MzM6?=
 =?us-ascii?Q?EtbdeBi9jQzRmo+QNh6lQFK/SC8jaLWpU8FBLmaF19IonFaCGqTA3BeIGpaj?=
 =?us-ascii?Q?hQ6sCO1iL5ADKljPWVar7x32LTxEDLJJMH9LzD+sUWGn3IKREUZ/RfR6H2W/?=
 =?us-ascii?Q?eS2J9txnhXM4QHEE7dTVjSfMDWde/DmlY6nwjOyMEwSP6qZwU+k4oLdummkn?=
 =?us-ascii?Q?ODHCKPKWoC6NzW4koWc6F2YCoqwtlBNlRSYif/YCqZwGep1th+3tXTjIH6Ed?=
 =?us-ascii?Q?AQbmKS/sc2fpbTpIk1sowZcjPQbKpKizndBnSpfEJIpXEZRcWQTbcaNh3mzv?=
 =?us-ascii?Q?6QzmDRbFqxYI0n3CD4XS8iSTDl9oIEGrZ6ubXeucdwaf42pS5QaZspuHMABP?=
 =?us-ascii?Q?rqdqiEMBtDEZfOP30b6ZMqPRrAugSsu06157mEJJc41SnJeV5mPq0oz9LBB1?=
 =?us-ascii?Q?Yhw78U+8uzmH8FKBID0DB6v+cTF1LwXc0d6DU5fJYfD2ZqGdrz276K/pR91W?=
 =?us-ascii?Q?jtYqun+4g7QQgoDa5gHNsqWU04JUDHNUpotlmKORkHhcX9N8zm4GsfJ1tau1?=
 =?us-ascii?Q?ErQO2Wf029/EtwfI8/1nUFKIBoPDrRCbJmx3GYOn32UfPRvlY+5663KjzVlI?=
 =?us-ascii?Q?4khQ3C7t4WqiAWPWSXH6NOHTLEXnc12tw1wic41TpW1NlV2Z67h1odC5XH1V?=
 =?us-ascii?Q?+bA7c4aw7nZNxTDhm5rrJ9cAnr64ICuUYCyLk38FwVWwvwxE8P1S1eX+S7+r?=
 =?us-ascii?Q?2m7jTWlMG6Zw2v/Sc5RgDotCqL0/nKqxxVMPJ8or4qbSnkFYxEj1iQKG/R81?=
 =?us-ascii?Q?xyG0Hj+zUcTvzNSRlnNNDL4sB6zifsdiX9VzJbcDADvJJeZE/jcj/UyPkexa?=
 =?us-ascii?Q?Y92CMdVD7anMgaZCsn8qrv9A5Q1ys4oBKevpruFEntmZ2YbQCfcLHKU6OIey?=
 =?us-ascii?Q?VvZPhIcHq6DGhqgrHTYXBe2ucMcOgG8cMjElyGVv+WnodDIc3Hx5SEBZqMY6?=
 =?us-ascii?Q?6ejhEYtOlJ9ZLNx4ezf+ktVMPQm6Wa0DD5GQ+KAhZLQpWxR886Dc81tQ0tJu?=
 =?us-ascii?Q?nG/pWcoXR88uKJ/hCgnabkZUMiy/CXO+enJtH805GW547VgrHQ2+QPLF8mvP?=
 =?us-ascii?Q?UodU/DmGzaE+VeM4G/e+B1E6cnTpVV2xLZ++Ru6vMVl933CbvE9bzzXkapVF?=
 =?us-ascii?Q?lhQ7vzuFeWvi1Hr22HSfTQLSHSAdgW9SfjQA9Mk4F7kDO8qT+gy/0M9qdZ5f?=
 =?us-ascii?Q?Q+TWZ+LC47esJaqb74kcLcyrsW/M9v5z7R1HkRoA5ygbmFAqD/EpQZRRUhVU?=
 =?us-ascii?Q?5QHRGlTT3a1xXhANcf9MZAsbxhBV/eejffF/StTq++yKpi1mgUcnZmgnJ0o7?=
 =?us-ascii?Q?Uot3pxDg1Kzqv1ZByqEYoAFluULAPNoDIODUEBszMOkvpSgwGMvQT+imBFik?=
 =?us-ascii?Q?ZqFe7/4NYuFDZIhs/purWWUT1MNb4hIIOJZWD0Rfv1KQwEhkTq+L1Zf/URDw?=
 =?us-ascii?Q?VbTuiaGq4ZCPQ01yC3fhxo0RfPJVAJg0upWj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:24:08.1746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ed1138-6a2c-44fe-cc9e-08ddf14fa235
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9461

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

Fixes: 087543338924("hvmloader: limit CPUs exposed to guests")
Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
  * Added early returns in AML rather than dubious And() statements
---
 tools/libacpi/mk_dsdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 8ac4f9d0b4..aeeb71dfe6 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -231,6 +231,20 @@ int main(int argc, char **argv)
     stmt("Store", "ToBuffer(PRS), Local0");
     for ( cpu = 0; cpu < max_cpus; cpu++ )
     {
+        if ( cpu )
+        {
+            /*
+             * Check if we're still within the MADT bounds
+             *
+             * LLess() takes one byte, but LLessEqual() takes two. Increase
+             * `cpu` by 1, so we can avoid it. It does add up once you do it
+             * 127 times!
+             */
+            push_block("If", "LLess(\\_SB.NCPU, %d)", 1 + cpu);
+            stmt("Return", "One");
+            pop_block();
+        }
+
         /* Read a byte at a time from the PRST online-CPU bitmask. */
         if ( (cpu & 7) == 0 )
             stmt("Store", "DerefOf(Index(Local0, %u)), Local1", cpu/8);
-- 
2.43.0


