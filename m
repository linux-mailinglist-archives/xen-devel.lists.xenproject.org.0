Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0398B53176
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120055.1465164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrq-0001dn-9u; Thu, 11 Sep 2025 11:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120055.1465164; Thu, 11 Sep 2025 11:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfrq-0001aY-43; Thu, 11 Sep 2025 11:53:34 +0000
Received: by outflank-mailman (input) for mailman id 1120055;
 Thu, 11 Sep 2025 11:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwfro-0001L2-OK
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:53:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2009::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef42a230-8f05-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:53:31 +0200 (CEST)
Received: from DS7PR03CA0184.namprd03.prod.outlook.com (2603:10b6:5:3b6::9) by
 SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:53:25 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::ea) by DS7PR03CA0184.outlook.office365.com
 (2603:10b6:5:3b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Thu,
 11 Sep 2025 11:53:25 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 11:53:25 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 04:53:23 -0700
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
X-Inumbo-ID: ef42a230-8f05-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8jXL90Mj1dKfsAu1tQhYtMmhJhK0bnMWtZW0/pldbw/+j9jvsHWzH4lOO9MiskOD0pGZt97JLhY6xOrhMt1ohEdB3X4mck8ofsn+TsqxOwECs8bRfrtNj1nUjgaFBCTi9GRbs2pTz1NS++J5unk2vA1VPhqCRTys0U74tkepjk2DIEIKwxblfQ8Uf/EADLEwd37VzZzlOmKXFErfi7Iz4iJZKDPqLv5+pqVRGOoDFWJD63V3ESM1N17/+W9RuyUL6G+tdY7TfBrqrJwCQZ2Wjcw2PColzBGUsfJRYfMfdTaovtaPFtOQAwAkkqyRHm0HZqkTbEZFrAwu3B/0k0Jrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwmMyqpJdahiFQT+aq+YWQtIG3NlD4esX8arqlLAnZU=;
 b=xZZ5rti0GlYmofwyZAGsR1tRRdBK6P7UykS6KUDRAnsFvCJDOe7hSIehVgikypD+rzWP7ZxgsL+Qk6WYpHql2fpxTJU4jSW3Ng7oxT/4UhLUMD4b6CxqOJwgwXJnDY+CpS3wcokZtThEl9rIFjUJGquxiYDy0DpujfyvGE+XjU4QxBr3j4SoHHpbuAeJ5a+FLyb2NYYuU9vVnxeyQu0dQ1nCEEm83hcV1RBioA/B0f24yDMFMX1jGqFUX3VsQgN6YeM98CHB2XH5bA3Ay0v/l243C4hUZD0Nc6nYBJCfex1Lng7pxg+P/4QUgb0lR4PTXqpKWegfQGilR1S5j5lFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwmMyqpJdahiFQT+aq+YWQtIG3NlD4esX8arqlLAnZU=;
 b=qkzwdikVYvUa6KzHwNHkQcMI7vVz5EY2vTik81VYFzJmzwEX/FVTi8TtgTYYggNk5VHRuYcbWBVwoyhNISDQl29sDPQiDOD67lj44wl6EyYa201PYyrjlYPk74xQ0Lvc15QYob9HiStLUCDRaCCRUhULWDkrJr51di/ay0T49+g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/2] libacpi: Remove CPU hotplug and GPE handling from PVH DSDTs
Date: Thu, 11 Sep 2025 13:53:03 +0200
Message-ID: <20250911115308.16580-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: aa27fa81-f89c-45bd-296b-08ddf129d0ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K7i+cOfacqlXJDM8MmdSaxOUQcXqCAIjB4SJXVOshgWwcx7IBme7C/p2yIcF?=
 =?us-ascii?Q?sA0/arwjTxa25GiGhuQO8xXgBS9QjaW862ty+AHtWuSS+6WOdLoAidmRhpKk?=
 =?us-ascii?Q?bVyC+x/nWvfztcZRnMPUHhXYO9GqNUoe1JwOAaoj9JWI1nf3sj0cd0CQ7gYo?=
 =?us-ascii?Q?HcyUGDutlX+ZM+UtbgOJ5LbSWXYyJW45Fd2QUK7RI3nllfM9NKF6LA7KAc9V?=
 =?us-ascii?Q?aL6KV3YJRYvwea6K3eFEMgqD+YpRoBLoJNvup/8giz5JP3ZVeEq4rxswq5TH?=
 =?us-ascii?Q?Z+uJLaadstWKgqbxQFfg0Y7tGClDTvgdIJ3HdVeQEbJyzL2AxfgiRyyymSej?=
 =?us-ascii?Q?hxfVvpsZj9rJ10nktfcx4m0zwEsB6iS7f0upFrVjbgkacW2ecxFTG1z8j/Xk?=
 =?us-ascii?Q?5SZEwvka5Ggbm9nSZQvyDn8rP7zyiT2203yCDwKx8NG/xifpWEilHxt53fi2?=
 =?us-ascii?Q?KaEPCU01GY+Rsb/w29lh4+sTJOfQxKM6TIYhhVahKmMlw4Zw/HRnr9vw6FK3?=
 =?us-ascii?Q?Ggm02RTIU8xhEcNTL2ia5eCYh8k/Uqxeq00ibwrgJfhG1ahpHoHh8CKe9RIY?=
 =?us-ascii?Q?dem4qqoKH7bE+ZnrmdolsgiaBfoZ2oCELGB212H8m3nsAUmqWTxKz9tZJ9Ik?=
 =?us-ascii?Q?JZawWQ4GyLcPsOfXBycHDmcydrSSusGhPT8fMAl+uRqPgGpu4J6oFvU4s7U6?=
 =?us-ascii?Q?wLEuStcTMlH8hUS3A2Anxb+0DX3gTBL07zvI6JFR0WQALys66eSjBTSk5rD6?=
 =?us-ascii?Q?3WNwhIB+x1cSrHEDofh7qIYkB3yT1xaDch9BKcQ18BfYpwkigh2XfmJHAQnk?=
 =?us-ascii?Q?EXoZvKYXoXSDIKX8lUrMjo61W+uDYTQb+1IBZdS/m8ujva82Tm6Xs5EtUYtg?=
 =?us-ascii?Q?uIfy6kSZvWxxFOnB26wv3EU/0hke/tjT1uMs0PUY8M/tq4h26dZFvKpJ9AFo?=
 =?us-ascii?Q?xtteOXHat5WIyrhvzmePSHIrO75b+jtmb2q6oTCXLORPQ7Z8g4ZtK7g+dsVn?=
 =?us-ascii?Q?6EthjpJplDl9fC66MTUcp9TIA6lc4ehRW2Uyv5pZTav+0kPW/OKTWeCkK03c?=
 =?us-ascii?Q?/ckJas9Ig/WpNFj52mShCy8EIsQ87SQnGqdudQsvMn+JKotx2+3mRQADecra?=
 =?us-ascii?Q?WudMZz/xDFDRSBBFZuWzv+yUU2o2pqlfzUN4knJ5K0RTJmeVp4zjDiXljOop?=
 =?us-ascii?Q?TArH6OPpF/Z9O8hbQYBLbqepudV94UUV97QJTLdNfN7dTYf/gpOKNJQrPeiw?=
 =?us-ascii?Q?hYNNzEeSm7Epy3GwTClc+GBIvazue5FHctdXoQJFvqECT1n1VWeE9SZyDYzc?=
 =?us-ascii?Q?YaFvrUlcytFSVHKEO5c6h4D6i587JzJdgV8uoVW7AlknzI0EPFeFLlz71+Wo?=
 =?us-ascii?Q?p0hMjAhJu5Z5wxIY3j5CkMdA7CZ1f1nWeWU6J/KwgV0moEvFlTfffDWQbhpy?=
 =?us-ascii?Q?Fl8K0mPv5MdNVGtc+7mK7peqWpDi5yjgCdf2+3O/kfhD4RuMF5tDlr+CdGJo?=
 =?us-ascii?Q?AkEP+tXvZpcG5gIHoIxSPi9xgFug2LO9HPoN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:53:25.2576
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa27fa81-f89c-45bd-296b-08ddf129d0ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834

PVH guests have no DM, so this causes the guest to fetch the online CPU
bitmap from an unbacked 0xaf00 PIO port when executing the GPE handler.

Seeing how ACPI CPU hotplug is the only event delivered via GPE, remove
the GPE handler in addition to anything ACPI CPU hotplug related.

This shrinks PVH's DSDT substantially and prevents spuriously executing
a large amount of AML with no purpose at all.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
  * Adjusted commit message
  * All other tags except S-by moved to patch 1.
---
 tools/libacpi/mk_dsdt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
index 06a229e2e9..cc4ed3961c 100644
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
@@ -265,10 +270,6 @@ int main(int argc, char **argv)
     pop_block();
     pop_block();
 
-    if (dm_version == QEMU_NONE) {
-        pop_block();
-        return 0;
-    }
     /**** Processor end ****/
 
 
-- 
2.43.0


