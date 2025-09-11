Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B0B53917
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 18:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120607.1465469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5q-0001Qh-1M; Thu, 11 Sep 2025 16:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120607.1465469; Thu, 11 Sep 2025 16:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwk5p-0001MT-ST; Thu, 11 Sep 2025 16:24:17 +0000
Received: by outflank-mailman (input) for mailman id 1120607;
 Thu, 11 Sep 2025 16:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwk5o-0001Cf-8m
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 16:24:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c4921f-8f2b-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 18:24:14 +0200 (CEST)
Received: from DS7PR06CA0050.namprd06.prod.outlook.com (2603:10b6:8:54::32) by
 BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 16:24:10 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::1c) by DS7PR06CA0050.outlook.office365.com
 (2603:10b6:8:54::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 16:24:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 16:24:09 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 09:24:06 -0700
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
X-Inumbo-ID: c0c4921f-8f2b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owQsLgEBMOB4Jze6ao1TndqGxgM1Vq0Mh9ALelut3w1XenspII8NeNpdfTBE2V4ebSIF4ErkifS2l4yZhDk2PzM5BamexAebqmeTz6oixuQl5ILnGx0xaCDN9bf+vPMb7XuUvasTzCiIBycu57nvcrvTP8lyACFhjc/YJDjdPwHySHXsajFd2XSuvpOBXP6MDp43Awek0ikWmfaULWk4jeKhIjwBka8ViGagZe60hZVEZg0HpalaiZla6/v0Gxkg0C77jStuR3w0WrcZ0DpAEM/uy0EeGw/vrtiBGHxAF34zyLV3tDx5mFpAMZL/I9o+eNQcDA2boJIhKeHD2wPhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZp8fHLc0jXPIevCWfpyhP3DSXtF3QrqNtbiS4xuVfw=;
 b=vBiyf6+Mhi37JqpTXaze3qOY0g5INhB1k4nWjLa10cZgi2JaqZ6n6fARc1HD9rLsXKszNedi4xylLGVbgFY8M4k0OY0opnM2dcd5bQRwBjQDPSnVAzAs+zTSRSFM4xxPfoPf+E4YRXrg3do2N9AqM5G08VV54dhGe0VOZvgFvUbe83gaXwEL/EJN2GguoH9yANK1Nas+EhxonE8XsmFUQCBponqrmLk+kvmUbqmwPRyofxhoH1bqf0i4vSPBWq1J10lEhTZH5mAHJGLyria4KipfOVrstpAwyGCtOuoJIQepZjdzq6btY5EBwCEUioWO0R9uhLihXeMgQ35DOHuTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZp8fHLc0jXPIevCWfpyhP3DSXtF3QrqNtbiS4xuVfw=;
 b=dwDKIqCgLjxWsaM5muGIFkegyWffMtsDFXi3r6nqU9I5VpOHOpiRVxVNNeuPQGpJ7TevNW/SbOEU2iXo86byQ07I/JTFc9f4zFRmTK0ffJTYtHyJXm+Ga9XVQgTmNXX7a/ip8OQemQHBlkAleq76FI0eelrqBRWIwgcQ5xw6fsI=
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
Subject: [PATCH v2 2/2] libacpi: Remove CPU hotplug and GPE handling from PVH DSDTs
Date: Thu, 11 Sep 2025 18:23:33 +0200
Message-ID: <20250911162336.23887-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7da137-3aa5-4415-22d4-08ddf14fa32a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VBaRImzOJB/Awv2DQSyzwa6s6EXqs8UQ4euJVX8uKiEh3dGL72F9QE0cNoGg?=
 =?us-ascii?Q?Ekd2KJF49OvuZbawdK802b/uTA+s9DUgut+I5X6jgOG8eY8OMXPhiTK9IEwm?=
 =?us-ascii?Q?mIVohJLFyMk8LfE9pqrk9Fub0U+fHa+hfnGRaCywlzRqX3yBBqo4l9NKsifi?=
 =?us-ascii?Q?HN/q5Rnk6yQf2Kd11JkLazTfTOgXU+78/lfyn0iiKUjbs1nmymmHnm1PmeZH?=
 =?us-ascii?Q?OCtrnN27oze/dHe3J5n3acQm27B2w44ZHHmR1fZuxky3GJEpbHDiyka1SruN?=
 =?us-ascii?Q?C/MEmotfR+IlhIxpDQjj9FNrS/G1mzouiXpmiyZKA8s13TVig4eu+DVpApNO?=
 =?us-ascii?Q?uXMAAfYGufo9VvhVwPmC8IvPn44zwdlH2RxSYlL96Bj2UVMShKPBt8nD1z5J?=
 =?us-ascii?Q?Rjss78VIGU+XiLOSq/OqYHXN02y2JbSKuJP6g2MBk9JMmsnVmkqEQNJBcK+b?=
 =?us-ascii?Q?ZfH66NbuWHALcSGAzRFWaryV/Ivd3R2fQ1DsqzsnvHqXNCrS7YlryHvFubTb?=
 =?us-ascii?Q?LS2rV9hXQ5jOyznLA6ku7VvFowcD6O7G4srWsy2bcTwV4l2BGO2rOyJKPu7j?=
 =?us-ascii?Q?uydS8pp4A8RJ1oZ6dXZx3z3uKBBRG+8NBM4h2fH21O9uQTu05pr4vIwUV1YF?=
 =?us-ascii?Q?V3FnSSBzPyCSaCAJ/YCmW7ueqp8HXJ5KJ8ZvgeSpqN6+H0j1CyLki/r4Gb82?=
 =?us-ascii?Q?XK+BFyF+U/5MvDTiifWStOB3LihIV1ojQ/RzsAP6Dr5X4YxTmapyvBopVvAp?=
 =?us-ascii?Q?J5blB2UxMBb9/eZtQ2r8ig8UVSNqbUBykyL+cN2WEX7+m5lmDoWjPDsHF9HE?=
 =?us-ascii?Q?yjLQTqPiWf66mrPAgayUQzsKUlxvIqVs4JBq+CXcSnC5DjJzZQsC4/4k7Lim?=
 =?us-ascii?Q?dalVYEl9Rnkaxp5oeYym/PoC0qhKxUs1bymKLJ1iqNqEAGXycTeIRjh3LHtT?=
 =?us-ascii?Q?pFixfAC7b0dZdVJe6DIH3VCK/jNoL+xNZo3c0uUkRCjoAHasTtJNXmDkPWBa?=
 =?us-ascii?Q?UqTioAtT5ShmOApwc38QoVT7jHZsnlpXcva4rwKZZvIOTWZ6vKZvnbwo8bSW?=
 =?us-ascii?Q?pCdIpmZuy4GJxWGbRhzKyxTP1aLKhsLUMJildDrhICkVNcQrsvXr3pqY0jAZ?=
 =?us-ascii?Q?LIoZV+3NEvI2ZGvCXWp+r+ztBwG0yII+lCU+y2NJczdTEYgRlxNxatq4xgrN?=
 =?us-ascii?Q?+BVwxBjbX0z2VjqSmuJGyLhjopjujt9yCK+5Qw676qgSY2IfA+r0lYydnwlg?=
 =?us-ascii?Q?QbU/bKcuH8VXZN5TXG/FQzZcRiFSZrgt39b6u5QckuE2oa1M/+ijlVdEfzUN?=
 =?us-ascii?Q?O5iyFjgT+rzpoa4YTeCCRapkRWf2Sk7fyOk7jRGqQLrpJ/p8+WMz8u544KE+?=
 =?us-ascii?Q?KwFoScXYw8M8SchHvEKL/QFMN9S6UnupO3On952l1tUaAcH+tjt5lBrPuP42?=
 =?us-ascii?Q?c801THdeSNvQh6S7w2+buflXbsZnXpNdxI06lpw1tzodhpUrMahmcx38bSS3?=
 =?us-ascii?Q?RFQOq7btJ8oGI/KEoE62PPLjjR3W3ULBI/YQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 16:24:09.7769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7da137-3aa5-4415-22d4-08ddf14fa32a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275

PVH guests have no DM, so this causes the guest to fetch the online CPU
bitmap from an unbacked 0xaf00 PIO port when executing the GPE handler.

Seeing how ACPI CPU hotplug is the only event delivered via GPE, remove
the GPE handler in addition to anything ACPI CPU hotplug related.

This shrinks PVH's DSDT substantially and prevents spuriously executing
a large amount of AML with no purpose at all.

Fixes: 062975dc9441("acpi: PVH guests need _E02 method")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
  * Added Fixes and R-by tags
---
 tools/libacpi/mk_dsdt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index aeeb71dfe6..433eb4f8d9 100644
--- a/tools/libacpi/mk_dsdt.c
+++ b/tools/libacpi/mk_dsdt.c
@@ -218,6 +218,11 @@ int main(int argc, char **argv)
     pop_block();
     /**** Processor end ****/
 #else
+    if (dm_version == QEMU_NONE) {
+        pop_block();
+        pop_block();
+        return 0;
+    }
 
     /* Operation Region 'PRST': bitmask of online CPUs. */
     stmt("OperationRegion", "PRST, SystemIO, %#x, %d",
@@ -278,10 +283,6 @@ int main(int argc, char **argv)
     pop_block();
     pop_block();
 
-    if (dm_version == QEMU_NONE) {
-        pop_block();
-        return 0;
-    }
     /**** Processor end ****/
 
 
-- 
2.43.0


