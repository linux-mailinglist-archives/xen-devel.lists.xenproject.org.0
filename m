Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D811B51A2A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 16:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118380.1464184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwM91-00023l-CN; Wed, 10 Sep 2025 14:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118380.1464184; Wed, 10 Sep 2025 14:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwM91-00020S-9V; Wed, 10 Sep 2025 14:49:59 +0000
Received: by outflank-mailman (input) for mailman id 1118380;
 Wed, 10 Sep 2025 14:49:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ly7=3V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwM8z-0001xf-Kb
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 14:49:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [2a01:111:f403:2405::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a3facdb-8e55-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 16:49:56 +0200 (CEST)
Received: from SA1P222CA0104.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::14)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:49:52 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:3c5:cafe::d2) by SA1P222CA0104.outlook.office365.com
 (2603:10b6:806:3c5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 14:49:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 14:49:51 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 07:49:49 -0700
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
X-Inumbo-ID: 6a3facdb-8e55-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elqao55GizjVRhD6LwPwXOYeTnrIId4m11jM+lqnf64IRXB/19ot8mnZ7Mgm6A6Il8eKKEdInJqrCk1AqGI5z8MEVc6HRmk/iKqfP7TO4CZauL95JviXAQU5Su8ETM22KcBmt7m4igqYFSObiD076HyhTKKzpjV5mf6HbtFggQcRQps00zrxeByZ1OADtP1ZpPWHZni2d/SrluvscrQBwJwdI98wbKxhvzJ98R/4SwVcB7GolKn9JQmKbpK0mH5bdFiYqd+vgqKaZ6U34uaIAAF2RX7OjPkOfb0FRxnNJhT2LQYsgS0OI2iADL0bCzzYOAZ+of/wCtggwwiRLFygHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRHcQao7ZcT1dOkugFqWSPo4ks4CXn7x1yCILxjr+R4=;
 b=HYTuGEhO51RUOxmfCHHlYBXEvbezKTBn7FvM3U6aZM1ihRve5/3/i4VC0IRJNM/sdJnaunEgPe+Lew/4POoqPd+Y26w7HA5VP0Wp3ZtBE9s/zDhBjpNTaHeI604Udp8dhy+feAtiiOvu/A52bGBgi3N8FBNVEU2kEBH5whDR7Ew1byZoc+mgHvHFi/A18wvo1QcSosqJngx5clC0hk0vdwGklCz+vYbIoV0SyWWzgGerbmg/7YUtkK36sT/1/dvkpLN+y0eG05wbyBJso9ckSvuKyfbjGqnKxBDK787olN/9EMHGobKFGcUpVTCYAgQwyOkMSq6XliiMztELHaqHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRHcQao7ZcT1dOkugFqWSPo4ks4CXn7x1yCILxjr+R4=;
 b=dO+DnS+XnZR93WpXppeXP8vTfHjO7x9BOEnoVGCuqLDD4zC1z3wUqerXqqol6ERYEIhbZMUqBIUiIj3toCsm+OXwQUwuBWmTp6REpdaQQd1WRvMHlc5M8SAruHl5qDbQsHCgi11RCAjR5Di+XGb8cqkkwq6xg5Ncl7LmN6FqQuU=
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
 Strashko" <grygorii_strashko@epam.com>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH DSDTs
Date: Wed, 10 Sep 2025 16:49:19 +0200
Message-ID: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ab215c-3840-4880-2aac-08ddf0794c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKEqfgAvE+vJPo4l+VFsorJBEbEFsO4Y2OiNGSrm+MMabL7xhmuNNaPfrkUN?=
 =?us-ascii?Q?uceX3h5uIFSi8z99DSGUQEH4hhj9B9+fV28/fhGkBuDPbNt9ejbTZuqftDrj?=
 =?us-ascii?Q?Z3oLHEYLCb6j8duuLRSmQHn9MSC3e8uyYHcKhlLVetPQRpzT00vl1bLSAyC2?=
 =?us-ascii?Q?KnPYIeEcHnjXQalJ3h2yWRYpW51Q31xcq+Q0hE9YyFNcVyI+ZNNbeuTGq7mS?=
 =?us-ascii?Q?jicZhJLGpBE2P8cE33OAlDdenDflDOi8nutJctZwx1po+7Fy5XpFnc0fvoWt?=
 =?us-ascii?Q?U1od/T4jOKCZQoJ/lIsn5vzcWMbAK/Gj92reORFg2QZEy9cR8WO1kbydjens?=
 =?us-ascii?Q?FqNWoccdhNO+s2I3rUscTatCqHDV322cXTttUhRT+aMmxl/dB9wesamy4b+H?=
 =?us-ascii?Q?lR2EUN0gs5Y5XrNkrWjRMODGIIy88JitXWvZT/kOLqi9OzerhFsQkPswCZy0?=
 =?us-ascii?Q?JhGAOLWR0rD0tMEzrF7Uc64sGv3I6aXmVq/+19Mg+rGD6JTZdyq4QlOgCrNE?=
 =?us-ascii?Q?s++lHzioYuG9scuSkDWAHaiPsWXZecYOQ1o21+MHxbJsfzArf9gVfarrgM96?=
 =?us-ascii?Q?6FiByOX2HzA55r89jDR67oybvtnxaRw9sPVYL5vorgTdQGA6yUFDRlO1bosg?=
 =?us-ascii?Q?lRm5dQ8X3TNXjSdXko17reYiumS+n7rpuCHYTtsyIbnsShLmg5874zzd4tnA?=
 =?us-ascii?Q?ypaW4HIk+ccVHih4eY6eNDRj4/EzlTIJGFqGwSSkXCzIqPaiHb2BNyyAtRCT?=
 =?us-ascii?Q?8K4vCToUYi924rV4FjeQqqzwT3CgepbPKCwSXLhjUkCbO44wXmlTo3394CO9?=
 =?us-ascii?Q?TWTBvEr1bpVaQMotuBa0eRIhsyhTt12fY9oYvt91YKP14J9MWWM0ryk0qz49?=
 =?us-ascii?Q?G8k822rVPNGvC8jrmahzJRLYA9Y09RAQQ66aIvgGa2BzKcpXo84X4JQd7u29?=
 =?us-ascii?Q?qUIQkuyeeeLSEkxTssamPqZiCvN4KGqy1mGQqmbnQWNkZPXUiKKcQuZDDttn?=
 =?us-ascii?Q?lZVyC8EW3ef/3fG6Unp/1PexX5iXYgN2s0iflesporg6jSS7FwDrsH0zizEI?=
 =?us-ascii?Q?8VUviPZtlrQdGkj8CZo5nZVuR7slFQKRgJ+hVsJ2ggvaKau00trr1rFNQjxV?=
 =?us-ascii?Q?0uSExdO+gNMUuVMvhu3q8HSzE/xnIsvNfzXFIVKcAS/t8gfy6U1w9fyxDL/O?=
 =?us-ascii?Q?r45+xO9eaYDbMSnnf28BFw3igDeE/SC3tEmKPfAAPhvNsfaRD1+EsolI5rJS?=
 =?us-ascii?Q?Orjy3sEFg1WZapBOmd99NTGH0eEJW72Bfa43VjQJJ44p/J8Uq0pIEC1xg3BR?=
 =?us-ascii?Q?7ZKo4FpbYXHlRthF2dleYa26F0SZhNrfPUrS5BH5rMN316Pb0UKDF1hfr0CL?=
 =?us-ascii?Q?SliazDn5nvrf+04oH376lniH3lqbSaGe7J1yQYvddj/cSRm1sxuz9lS8Y9lK?=
 =?us-ascii?Q?5pI352DgSuVXzkXcSWhtJ5KHXzjnF0fezvMwOJvxUdz5fsh/Dfvc6U16t7Nb?=
 =?us-ascii?Q?BLMvOBWQGOG6QBN/wVNzqxxvDrsXnYoUXHS/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:49:51.4716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ab215c-3840-4880-2aac-08ddf0794c20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443

CPU hotplug relies on the guest having access to the legacy online CPU
bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
this causes the MADT to get corrupted due to spurious modifications of
the "online" flag in MADT entries and the table checksum during the
initial acpica passes.

Seeing how ACPI CPU hotplug is the only event delivered via GPE, remove
the GPE handler too.

This shrinks PVH's DSDT substantially and fixes the MADT corruption
problem.

Fixes: e9a8dc050f9a("libacpi: Build DSDT for PVH guests")
Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 tools/libacpi/mk_dsdt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 8ac4f9d0b4..f71de6c8c6 100644
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
@@ -264,10 +269,6 @@ int main(int argc, char **argv)
     pop_block();
     pop_block();
 
-    if (dm_version == QEMU_NONE) {
-        pop_block();
-        return 0;
-    }
     /**** Processor end ****/
 
 

base-commit: 53c599cc33b61ae70d59572f3c1d843a3def84e2
-- 
2.43.0


