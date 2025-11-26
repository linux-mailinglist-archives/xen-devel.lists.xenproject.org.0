Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77EC8B067
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173110.1498219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdt-0000MJ-EN; Wed, 26 Nov 2025 16:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173110.1498219; Wed, 26 Nov 2025 16:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIdt-0000GE-9s; Wed, 26 Nov 2025 16:45:21 +0000
Received: by outflank-mailman (input) for mailman id 1173110;
 Wed, 26 Nov 2025 16:45:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Gki=6C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOIdr-0008EF-P1
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:45:19 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 472dfcd6-cae7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:45:14 +0100 (CET)
Received: from CH2PR16CA0020.namprd16.prod.outlook.com (2603:10b6:610:50::30)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Wed, 26 Nov 2025 16:45:08 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::67) by CH2PR16CA0020.outlook.office365.com
 (2603:10b6:610:50::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 16:45:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 16:45:06 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 26 Nov
 2025 10:45:04 -0600
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
X-Inumbo-ID: 472dfcd6-cae7-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7bLo7oo8FUPWMYvgVHDHYuUDGFcnpCGiaTWsZBg2zV1IiH9S6lY0FQsldWS8bDCUNlPHecrkiglWKziSMoVgIBGEdxL+6LrQQybPqM8K4iyPoAeevJ6f2qZTrDcvoZduN5iQMFOWhirVzn53HXBZXlJi/rZ3v4SeJzhNjGLRwVjNu6Js+8Vwj3hhk6772xEx/RYKa6/EzNRpSw6xIWoj1qr19+/CfEhm1y1Rb5K8m9q7VIvTrNDb4jtm52l/LTsexyN57Cdemu3PahOc/wSzb3Zs9AF0fi0Yha9xZTf7hx/ij2BDd4l4Wvg44Lr2Nb3SxBKhCe0wPab0JX+MWK65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AG5qf8fjfZnqrZGtIec0mAOfLvxnAIAvkXF8a3VTY3Y=;
 b=mOY4VHOloWM8SsQYadPRrbObs5Q4DU5vVcXmkIamkvqZsy0hf2To3Unropv1ZDrHAaKtdGTRQUlUHdzPEwySsYXtar2S4NcNRxnWouees36s1act71UPIJjqe8Ai/toE2JCCkKvMwISu+xJ1/DH2v1BWQ0SzYDpMXkZJ1lmYX4IpIUM/eMNNVLBJ5Nxb/hH438hL6biA7XFgM4t5BL7/M/GfRP1ljLggKQNUuElpjFAybKPtLRM3Z9iFnoyH3iRo8RMpgGiFVYUZNpkqjouI6Ia5C/DYa63JPnLHg3a9IkVOb1hdu+cbBb7ej306a9aSlta8cxDthRHMTx+p+awY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AG5qf8fjfZnqrZGtIec0mAOfLvxnAIAvkXF8a3VTY3Y=;
 b=gan758Hhq+TE35c6DO55nLm1Zdw5NnGSftHbuH0uSyv7WDN4zUpa4EAv2EDHg37348em688auYR0+nUAOmeG2qBGUBRomITO/Q9+esdQ007vktH018ArkMK5Onv0dVwaeNyKJOw9oaB/rDnIw9UMG28cXwUstXNBLGd5VE+xmJM=
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
Subject: [RFC PATCH 02/11] x86: Reject CPU policies with vendors other than the host's
Date: Wed, 26 Nov 2025 17:44:04 +0100
Message-ID: <20251126164419.174487-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: bca6ee40-6ea4-4fa8-feba-08de2d0b27cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zhzLqvmQfXPb9K3PdlIfMR/SxfL7A1ttJ274goXMTXqHzwYI6PDBCi3Jz5xk?=
 =?us-ascii?Q?13TI/pmIfpaxI7S34Ai/3EZyg2LdEwy088WaN4qnyturLhf9HV27CITWP4Db?=
 =?us-ascii?Q?SVvdBCQM3nLll4pEexA+Oip/6dLtLmpMKfvyVZv/YcwGNfuuaux5e4RrxyJS?=
 =?us-ascii?Q?89Z/eyLLb7W6wF7jv4h8ozgOKrXxXqqoY8ruRtnnisAq/0RPVDQCmXjae+zz?=
 =?us-ascii?Q?5x4f8VfQEOg88iMQEhvxQM/vHSXeASDvSESu2Y+Cj/wcDEVypFmubLhVytJS?=
 =?us-ascii?Q?9EOgCx67PC6sfU7GDytq5/afi3ODnX8Xhb80Jik8sNXyOX7ivgGEivgCPUT5?=
 =?us-ascii?Q?id8W6shZd+5RQatyJXWdxmSKFk40FaQYCKmj7uMogR6CJBvk8mTWQDOa6nNY?=
 =?us-ascii?Q?ZTAgGBw9rxqr/Zv5qaS+WHG7Sv9p8W4xOXlGi5y0ZOYvQHZCHix64q8zgqa6?=
 =?us-ascii?Q?N551hSg2hd9gJ6synCwRbjQzcwQyMlWT50n/swfuACFerwnB60JTmBm6GrBg?=
 =?us-ascii?Q?E/2i96ovWm5/VwmqoyhLgvS6XxsiEJx7cZ23u8Q/cR36hnlZjt1dlLMzKEs1?=
 =?us-ascii?Q?7qt43cSQYD+d+bTNYSD7ReMjz3zAlviHsRA/Bwz145jJ79fy0bYOr5aLywaF?=
 =?us-ascii?Q?Tlax/xA7mi1GoffJ102v9iwp9HsgeT/YBDkVmuglQQUq29ZQ+5vKcxcnT80w?=
 =?us-ascii?Q?6VnnJb015dTiS56FU0tUbtCdqGUJRE5cKYPtIDc8DcndN1C29HOpuDvC/ChH?=
 =?us-ascii?Q?5Ee325ek+qnefMbhtZ3b+FW87zDz0SEClJMx64+wYUHDSuOjExgROIgzAVou?=
 =?us-ascii?Q?RuWqTCqxPQa3SIJItXsjtrDlcEC3lHnrBII3ggnoENopGM1qhIcwUIovP9VR?=
 =?us-ascii?Q?L2QBwuXR2m5mue2HgjUAfH3waNEaHwZ27iXcR20Yf3NjI+6csTCbPTBIcNJp?=
 =?us-ascii?Q?1yBxsXQPQFBlWQIiu1o7VWVqcmwG0Ck0I4sNZtskJyfEzfDvzQXFRipTPkpb?=
 =?us-ascii?Q?y9oNArCvhqTb4mdnc55he9ZVUsnnD3KKM4HPW2d0w5j4B9Oh6GU9RJ57dlaA?=
 =?us-ascii?Q?oTnbvwi6TzQoU//p1w+XusxKAubXPg/oQrWpec3gfH4hU+Tc2v3o4mQMNJcZ?=
 =?us-ascii?Q?OPBzEOKRKXK1BueSh4/5978tdIVxkYFp9WYwGGmlXz0pEfGDzmS/Sfn3rUwi?=
 =?us-ascii?Q?NKe4sixrFlvsm5kuVPWy5fuJ3BHUcsDq7vbolKVUJKvRiwROcXPtCSvMV+4w?=
 =?us-ascii?Q?D0hV4Jh0edRbJEWKaOJWIIJMsALRAzGZhSthot4mJ/KHZ7ldQHOIAVDc0xug?=
 =?us-ascii?Q?8Xy7Lb79cYw9+shBTgfyfIrb7rfJkUsYJsT4WDoyx5k0LF18y3r2yLEhV6Y5?=
 =?us-ascii?Q?xRFNGMvSZ/DtBiIh0RFEZaPCu3T9Q4T5Rdf4EHPoKA1wo6cZn6C/b4XAbOQJ?=
 =?us-ascii?Q?Kg/e1pMi/ItwuKFGAwhAYo77eVazUk2JMf78hTqjPAQbJYQDRDNqQhMHjaDb?=
 =?us-ascii?Q?Qfn3By34e3TbwjlEc548fzEebf+c//4Mfco7UEjc7jUQBF+E1Nt8BhXbMN7u?=
 =?us-ascii?Q?enx3FxH2bUwNrL7PvWA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:45:06.8596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca6ee40-6ea4-4fa8-feba-08de2d0b27cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110

While in principle it's possible to have a vendor virtualising another,
this is fairly tricky in practice. Not doing so enables certain
optimisations with regards to vendor checks in later patches.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I originally had a Kconfig option to allow cross-vendor virt and
conditionally disable the check on policy compatibility. In practice,
I suspect there's 0% of people that would want that, so I decided to
simply remove it altogether. Happy to put it back if there's anyone
interested.
---
 xen/lib/x86/policy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
index f033d22785..4c0c5386ea 100644
--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -15,7 +15,8 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
 #define FAIL_MSR(m) \
     do { e.msr = (m); goto out; } while ( 0 )
 
-    if ( guest->basic.max_leaf > host->basic.max_leaf )
+    if ( (guest->basic.max_leaf >  host->basic.max_leaf) ||
+         (guest->x86_vendor     != host->x86_vendor) )
         FAIL_CPUID(0, NA);
 
     if ( guest->feat.max_subleaf > host->feat.max_subleaf )
-- 
2.43.0


