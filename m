Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B4B0D8BF
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052389.1421071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfb-0004UP-Sm; Tue, 22 Jul 2025 12:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052389.1421071; Tue, 22 Jul 2025 12:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfb-0004SG-Mu; Tue, 22 Jul 2025 12:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1052389;
 Tue, 22 Jul 2025 12:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfZ-0003BS-WE
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:30 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [2a01:111:f403:2409::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74697e42-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:00:28 +0200 (CEST)
Received: from BYAPR06CA0030.namprd06.prod.outlook.com (2603:10b6:a03:d4::43)
 by CH3PR12MB9077.namprd12.prod.outlook.com (2603:10b6:610:1a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 12:00:19 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::39) by BYAPR06CA0030.outlook.office365.com
 (2603:10b6:a03:d4::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 12:00:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:15 -0500
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
X-Inumbo-ID: 74697e42-66f3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3vvPNGvbw9yAHN+/qzjVC4YEBlAsI1EdA3vILHb1OupjL2tEkvBtifbm+bBcjqYj1MOUX3TkFH41V5hXemJo4sIr9GCDfCQE+KDNQZMNs8tu2UfqWgm7DChVacQQ991L1K6mL9WzRlh45lNrehRh7BqSkp4vZOfn7WnItsPHM2b8dAqHCfYTAkSSgHclA1vYTHptthSfYpI9PkRLR5ntk3g7PAmCWe2zS/bfh0+PtegYIjdw8B6mElxgHuncCZ4fsezHoMR/W3fSGkXHJSoUf3ZjiX0KfNg1kWos/RcgCo/YtrE4glr1wzko6Y9BUw673J8zEdo/tcHPiGixvizug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6w13qZswxvWC3XT6T04XsVAsWCCZ8WBsx0mv9Xje/E=;
 b=CYzAOC9H2wSTw0WZZSu0DxCDUNlB9iFuyA6QrfMzj7io7fv1OXWufgVFsVLuTpgX0Oz6FeeF2qC4R7zrjhTsRMQpK5Al26s67/+hTPsAK5GlYa1aApk8/8qts+BUrGmVcgoz99hPjoAub3zpnFTcXwBsIb2Pe5mB+aF3SANYPpdaT8OWxHOUDFmNc4xbVyO2gLwB8oSVMOvMkoiBNByyQ/+q+Spri57T2Sr+Jmyv6qfigG23LQX/s7LorGMmQHDate0CNDC/zwCWrHUtFHR8PcX3/J6lVm7AN3GvCQSnxa+4U1p600d5C2hth+bxp3nbnimLF0r23+65pGMX6FScyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6w13qZswxvWC3XT6T04XsVAsWCCZ8WBsx0mv9Xje/E=;
 b=5mUpLcJedOLKUml1xLHvmQOWo3ATokWshAdXFBj+wkvnQMnhRGAkzaRahHgOAea241AROxHQRWrMhx+5grZJ61EleqWZTjDH1N39EBQh+5WO/RultHShzGc3S2maw2MGlc4mLSA9+ByTPJXoPivHvcuuXXwpsuNYXqLjeR2tV8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, "Edgar E
 . Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH 04/10] bootfdt: Add createdomain arguments to boot_domain
Date: Tue, 22 Jul 2025 13:59:44 +0200
Message-ID: <20250722115955.57167-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|CH3PR12MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 793fa0e7-ed83-45d5-d635-08ddc917544c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5SwLF2WkHZNJMJHRze+KgxN3pS/z/Fl/JfCZoqM8Paaxbc5OeMhhbtByPyr?=
 =?us-ascii?Q?aeXHKtNTUJDey/sE3Wy6yUuQclLPSIqlPVY4X80oZCTCvSDQj5qlRHcMRcJZ?=
 =?us-ascii?Q?t0PdMVZx1b1iQmyoUqiq1nWXl/J1RRiSfJF83gv+cOnhWA/P/E0KEdV3LU4r?=
 =?us-ascii?Q?QQKRgkjAvJJoewSHLbzEicbMV699a4Gv/wn9NhzL1p2+oE/zmO7xWID/155x?=
 =?us-ascii?Q?Iuc+I9YDbmUfUCq3Ce9UJ9KBuxLC1situ3xzNeJkzCNdvOUmqAb0M5BKlsC8?=
 =?us-ascii?Q?Tx7kXXIC8UzvHD9r1ZdrJe3I/z76+1onjyJSa40ybo1Z2F1W8UlqSs8bGa+W?=
 =?us-ascii?Q?z9MSv9FAQvRzj+HD5NXVXb0g9JUaB9iQ/qzyNQM7ezUDF3la7tfMKw2bOZBn?=
 =?us-ascii?Q?Si8DMIPPc0pJd3NW61pmPDrcFpp/O/Odls5PCpq+5+A5wUXaphXLr1TiFi/7?=
 =?us-ascii?Q?RXU2VlEjlD6jxQcZ+R7HeQhj7XHPgXK/mhdgNJ85PA2aFSzkiiMA+4LmoSe7?=
 =?us-ascii?Q?922SsP+24Cfs4qycjKJ4WPr8NoZP2ad1/MSRqI6ijMKPibD1Jtv67I6CrKMS?=
 =?us-ascii?Q?ldvhZmflflOYnZekfqZ2ZCZHvG2ut9BkUMgWxeI1qQQfJZgOHLp/SCk4sPdb?=
 =?us-ascii?Q?H1T7DSmjITO1KBgS8oZwS7XXLz0GJUHk/NEcgWl6BFj9o8yX43JLis5wupHf?=
 =?us-ascii?Q?4qfiP+LY1j+0/bfW4VwkrC4Rxf3V2dKmMR+5smT8WRVCAgoIEng3Uf6YpiWK?=
 =?us-ascii?Q?MmPzF5cdrUK+XtZVvT9MlhRTd8blOtEUzMO/crodXq3LMgraImqLbjZBSlBj?=
 =?us-ascii?Q?8BUHdtMuO7A2OMKnjgR/BwD/WeQhHIAtKjefgmfydoYwkq1WyVyuTVkjsFtu?=
 =?us-ascii?Q?AdRt0va9zgqk7Hnvg9gnD6qdZZFfMVQ8AhHpa+O/tSAk9lcy761jO2Z6wMcS?=
 =?us-ascii?Q?IR65eMz1PKuzAsoBqNAY522LdO6r1PGucIhkS8+k2iePSsG6i1z0fLtyjm8o?=
 =?us-ascii?Q?AFvMrFrHiM4fifIYT2QqfWLrtApSe+eas8EBNtOF/sMZ1YUEiGcr8zLqK+4b?=
 =?us-ascii?Q?+2U5owtohhK00++uXe6NrQNSnmx2yFmlF3KZRcNLrF4DyF2mkEGAt7C8+bcg?=
 =?us-ascii?Q?tcNeVfp7YqMY2WiNlqCZHiZ1ePqtqEgJ8w8qwq02fxT0ePDZTKWCII55aVXq?=
 =?us-ascii?Q?1KnwC6deKmOd5/wIcnatzXpybq06Pc6tsVWucY8V/rFU7SKEq1Agc6OybGRb?=
 =?us-ascii?Q?eYzBB0WPg2HrEvbiWOKbhKkivyXHa6rvRPBq0ZukfayuIdYs4kk09zTNz+FM?=
 =?us-ascii?Q?erIGwkwx4msPE2YBAntkKcqP3WRnL3BOk3+KFKRKU2I/SJB1St7UsxNkzc+c?=
 =?us-ascii?Q?m81873Ohy84r2foYyFVwglBf8fB8HFVSZD3dkWGKHCBTa8PicxeBhnB5Pagu?=
 =?us-ascii?Q?3xPdHy4DNY7QL4bomf6BvaiuKsZ95URzi0KLNVdwj8FArtd30d7WY/33amwq?=
 =?us-ascii?Q?biIwMLcpy9j6EumUYlUxgVrDf+cJutbVJeOV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:19.0885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 793fa0e7-ed83-45d5-d635-08ddc917544c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9077

Add the arguments that create_domain() takes to boot_domain. This creates
a consistent place to drop the outputs of the dom0less bindings.

Not a functional change. Later patches use these fields as the outputs of
the dom0less parsing functions.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/include/xen/bootfdt.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 6cf05b5cdd..f107099263 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -11,6 +11,8 @@
 #include <asm/bootfdt.h>
 #endif
 
+#include <public/domctl.h>
+
 #define MIN_FDT_ALIGN 8
 
 /* Default #address and #size cells */
@@ -119,6 +121,10 @@ struct boot_domain {
     struct boot_module *initrd;
 
     const char *cmdline;
+
+    /* Input arguments to create_domain() */
+    struct xen_domctl_createdomain create_cfg;
+    unsigned int create_flags;
 };
 
 #define BOOTMOD_MAX_CMDLINE 1024
-- 
2.43.0


