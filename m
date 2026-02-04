Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDJ5JuM+g2kPkQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:43:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C09E5F19
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 13:43:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220468.1529151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncDe-0005lz-5g; Wed, 04 Feb 2026 12:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220468.1529151; Wed, 04 Feb 2026 12:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vncDe-0005k1-34; Wed, 04 Feb 2026 12:42:54 +0000
Received: by outflank-mailman (input) for mailman id 1220468;
 Wed, 04 Feb 2026 12:42:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vncDc-0005ju-Bd
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 12:42:52 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0322cd78-01c7-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 13:42:49 +0100 (CET)
Received: from BL1PR13CA0354.namprd13.prod.outlook.com (2603:10b6:208:2c6::29)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 12:42:44 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::5e) by BL1PR13CA0354.outlook.office365.com
 (2603:10b6:208:2c6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 12:42:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 12:42:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 06:42:43 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Feb
 2026 04:42:42 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 4 Feb 2026 06:42:42 -0600
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
X-Inumbo-ID: 0322cd78-01c7-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gExFv5VhnboIcUN2YJVIyb7C6H4NkjsT5wCUmKZuB5vwy9Q1nkv0rLkaa1dR5sRewiZIHR1qNfy+jpf/vyn24qdRVdObkXuyG/R1KyL9H37UIReqFuCsIsHjTFtqjGW5Il+aqSewpdzw4UF9RLKOtbCAWApgDgnQAzCcyhtNBa1WHSS5x+ENZ1jCQUiqDXOgurDhJmTB1DCVz0N76YSIxUb0pVnplSF777CO/xgJ9WOOEnbtBiu7chUzWo4aMVzaFY6wAhMDBxpzE0hopVHvc2BcxgGory2SIPoS8de2tZON5yR+2zJmvkStckZXifbuk0hxHt+fa28VZ/oCE3N8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VWMO57uU2Fq3Clg6mGQDBBnMxZ+u25eXCEE6rCrPYcY=;
 b=iFRwvL40LOjGq+gvQBSf4w06OzVmSwmc+XPFEeAgG02/Pvq+xTThTvpK9EHCjEC+ALy7DYSOm4xt/x83ayeOmqcHL1EYb0Il5uJ6Glx9wLzuWAZ1/GpVn4n0En/Wk8gSelHri15JcUuwwKE+wfNx2FX57/HsIGwts3VdlKHlSLhnfJcrWVcww/VpIboaGvuFyRcLMbkxJrpluq8+XUF5FVZjBjAWj70WBH4sZ/ddnqKgLkIKS4NkYVRTZeXOg6LzrZCyjtdscoe4S0B186/tOTOqCOhoAFq1BaziXeiEP8whHL2KYCDJiLjWFxjTCKBraNsgnOlf7gkoIC1q2TuPtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VWMO57uU2Fq3Clg6mGQDBBnMxZ+u25eXCEE6rCrPYcY=;
 b=e2Ylk0ENntYd3zlEtVl9+xK7f3wVPGBn7TQrxv+SN2wYsXgJz7fS/j6K9bPueIQtOGlTd+X1yVzvvahnpC6aQu0c1SLyOCHkDqKnU72ZZubtcNJmG2VMdXWEtIEERY1pWXQvuyL3zfe/VsWJqAsklCCYzCa8ltJJ4VHt+kmXn4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] static-memory: Fix incorrect tot_size calculation
Date: Wed, 4 Feb 2026 13:42:35 +0100
Message-ID: <20260204124235.134773-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|BY5PR12MB4052:EE_
X-MS-Office365-Filtering-Correlation-Id: 37be08c1-30ac-4ba0-c3fa-08de63eae46b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mq7IpQe6zmR1LCDr238RzRmfgSoGBbg92S83IppWLjNDzqmsM9sLWs30Dqpb?=
 =?us-ascii?Q?UNUPbQllWx6jr8IbUkUydRkIkWEbPdcEo4yYHmN64rdCrYCEefEtm654iXgT?=
 =?us-ascii?Q?Bq1bD1XWGcV28ZtxdqvMfvpNE5hPyn0srMaRFO4SmKtUztYaiBm66W1dfIsk?=
 =?us-ascii?Q?XVbTZfMbVnMUE47UFxZZ0OstCbnKdku2dU4aLAZMiwQ9HI2Pf0S3nkwV3RcF?=
 =?us-ascii?Q?DKua5kG74W9SHJ8wBeySgmMonnVmZnSB8zqwUJFluV5HMC7gIrsaeKag33sw?=
 =?us-ascii?Q?mHCCjNCqN9Ty7LkNd+hw8DZMW2YYFd/7J4WA74bRl0l27IhPdO3htYrXkXEC?=
 =?us-ascii?Q?CEbcu/ipJ6McDh5DV62i/Pm0LAtccud1/OnRbt+txOMFTAVo18d1JWQ9wapX?=
 =?us-ascii?Q?yreTDofG+QfkhEy6hHFx7BUjvjaLO7bZ+GWu9VgI3CjpY2yphoEfSnPWpoZ5?=
 =?us-ascii?Q?k7qXjbQ3YixEzgQzMWI3LtIm0a81Hnh1csbefnYtccX7FOLqXrsCFLZPxRtS?=
 =?us-ascii?Q?faGONsUooHtH3lPNI4aHpF7Wu1vsJHecVLNCfedrJuTD+gcE5rI/B1eJvwdd?=
 =?us-ascii?Q?M7xULAyasxuAhB6jWWLOSy4uD9v8m3JOd/hV1UONqFrznoplmbDi6Qj/h8jP?=
 =?us-ascii?Q?Thj8SX7Qpp7/qrtCfQ555zs3xwnZMiy2Qwxz2W2rPsg4PrCagGFDTbAPS0Gg?=
 =?us-ascii?Q?7EbhMaFXXy3anXcgHKPuzImLj7EUw7f8wjo1XC48p8mjfZpwu2cx1uq5QiWC?=
 =?us-ascii?Q?BERNZgQVHPQSvcrFV3JBUKQ3wkHkdyhWRSB84lYYoe/9I2gO07+9NfzVHiAk?=
 =?us-ascii?Q?xgbI9YWPn7iAdVZBoqPJ4PIJKpAgL0fPpy7o6iSwjFkzzVxNyb8rizLFChWA?=
 =?us-ascii?Q?GtWs+eqRvhlQZh6Gy2k3UWEhhrgGImXHGzyaPwKBvHDloYBBZsX2bIJs5J4l?=
 =?us-ascii?Q?4z8FfzVrkU3iAF2DIwqDm018GlkUe//a5gisNai/zI/M4pFvneFGn/imbjLo?=
 =?us-ascii?Q?Zzz6WMqFkzFiXltahZDuyAizAdU1kqQWPygr3BHo+MhYfmvaMxpwpIK+YDqG?=
 =?us-ascii?Q?+voqDsst/fmAx7USl844LBIm6Yru7iLeXUBMrCFUgkNxzn/r1BSnwMR4gnn0?=
 =?us-ascii?Q?Si/KXUW8Duiog4687efZ8gSLbRgC3Uy+/OAwRm/7ad6tTVloiuxWpg3M4RQI?=
 =?us-ascii?Q?ZWJ4LAKVvSzLXtxYNu5LrEQ0IjpKyq9xmsfyxniodPngj66wz3m52F9N7jbc?=
 =?us-ascii?Q?OxarHnHMcW83EnalrC2dgjBgx+pBJUlz1s4BsnGt6TnekjPQ8yVhGfkfHuj4?=
 =?us-ascii?Q?K5wGLZsJxW/zJiis/bsw9RoDxl7LJR3C7en61ACLAbOcAdLW8z0FY7ZjxTjP?=
 =?us-ascii?Q?iP2kgQWjQ0Cg1OiOngEGnLW0kc92tSqMzSthlSfJHFXYLgdSxXej3ykg+1B5?=
 =?us-ascii?Q?+T/GELKk2hl9KnIvlTaUHMcN2YArFoVIwck3YYnvcDzCu2THz1Dmp2ajvJ8O?=
 =?us-ascii?Q?287tIJaphjSxzuZqXJiumnxLr06nK9Qt0QrATo619TUTp2EHdT7p46IH3gpj?=
 =?us-ascii?Q?lYdBaNq7XBapcxfl2qKYq/pBFwspYCZVCIT6E4NyhV1jqvYriZL6gTUKnuu2?=
 =?us-ascii?Q?VIEXuCh9sIGZEN7DryDJVK/xUOkOouLpNdSz9JyKWbc3FdBGcPV6o8k6qZWy?=
 =?us-ascii?Q?iGzm7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	M/Zpw0dMmdue9CEsICKlfCKBpnEyB5jzIiWKUYv0H4DdruouzaoSP6a1JZ+YA1JNCugSHV096yH0ROZdlhEXXix1v7eXlvCSOhAOuSBp7Uaq40dmNrjcaVNuMuMciG+XCNz+74XkAqcygIJW1JVCfIG+n2my7rucBZTySmAEJZOP+90PxSG52p5wefOj7p8jC1SGxLSdAF80pjJwbDvHsOdwGxFR5W98rqtqvMa5hOGEnI3chYu/im8/zwv8aQCmTqqVD6lQbzI7MdpGKpnq03oORsud0EgEEX6quKzREgwyR1sZk287H8+kcwlHGa5Kp1C6SfFBumEx7L7b+ld6IBhcnEbt+LfRxwnL4l2Ycmd7ucx/IUpWhxc4M3rrJiV483rGMPF1FZPboEC3HGLiO8JLArVj35u5E+fVsUcIagW5ADaHxtcALAlAIsa/eu41
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:42:43.8577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37be08c1-30ac-4ba0-c3fa-08de63eae46b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 09C09E5F19
X-Rspamd-Action: no action

When a physical memory bank spans multiple guest RAM banks, the variable
psize is modified inside the allocation loop, but the modified value
(instead of the original bank size) is added to tot_size. This causes an
incorrect total size calculation leading to false panic. Move the
tot_size calculation right after acquire_static_memory_bank().

Fixes: 487975df53b5 ("xen/arm: introduce allocate_static_memory")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/static-memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/static-memory.c b/xen/common/device-tree/static-memory.c
index 0774d0680604..ffbc12aa24df 100644
--- a/xen/common/device-tree/static-memory.c
+++ b/xen/common/device-tree/static-memory.c
@@ -118,6 +118,8 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
         if ( mfn_eq(smfn, INVALID_MFN) )
             goto fail;
 
+        tot_size += psize;
+
         printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
                d, bank, pbase, pbase + psize);
 
@@ -158,8 +160,6 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
                 mem->bank[gbank].start = rambase[gbank];
             }
         }
-
-        tot_size += psize;
     }
 
     mem->nr_banks = ++gbank;
-- 
2.43.0


