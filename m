Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 689CBD18A43
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 13:11:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201564.1517161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdED-0002lM-QF; Tue, 13 Jan 2026 12:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201564.1517161; Tue, 13 Jan 2026 12:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfdED-0002j1-Nb; Tue, 13 Jan 2026 12:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1201564;
 Tue, 13 Jan 2026 12:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfdEC-0001lv-F5
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 12:10:28 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d79e5570-f078-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 13:10:26 +0100 (CET)
Received: from BL1PR13CA0210.namprd13.prod.outlook.com (2603:10b6:208:2be::35)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 12:10:19 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::af) by BL1PR13CA0210.outlook.office365.com
 (2603:10b6:208:2be::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 12:10:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 12:10:19 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 06:10:18 -0600
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
X-Inumbo-ID: d79e5570-f078-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/ChUGSV9ysFJ1ovKnGrhf3STPsmSrsyOZLJYxTPlHkTqDScLszvVtSlSUCa43Q+ByAM43zUZCpRi+r5Z9jCeJYGv3/57D5h2IyIAetHb1Hyd/2GdYr4MfCMK2fVXdXYj9pX0WF9Xyt6pblldgTsdMBNehB6CDf040K2iSu5f65CfDFgBk900CVzjNTsBTnCQdlwsDQ4GSHLUAbFNUiXezXC77yP5XDS70lQHKP+vEG6SGo0nHZ5++xeRjsDombO+PJr9FQsW605WQwpysy5P8hwYriWeX1ww+QAOBBFg5Epeh39xGRov+OiIU8K/f5NU6cSx7qRrp16A9RMn6YYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjNoEE2GthoCnN8zbgJAlOqjqa6jb2XEHOuLDiKN3Jg=;
 b=d1Op28cd8AmL7ONOMsQUmpxFqPXVIgxmnN+Ev3793EUBg2sT3WHRrsL9SsWClnfpY1ajYb+yIBssuneJyeoTbYXt3+dPmnQTPlE/b0cHWFesjoAP4Esrw1kKsGmhKlB3A05NRKB4WeZtdcpfU0++NQ0/UMmNKMLJMo0TNCzZsGRRdC5zZB8XIZ4SnvvPhQMYcjT/aOVUiXWVdFM0uLT7Mlo+KYAdG5f2FExI3XadQZVnCL5utARFZgEUoXQdb3VY+NxKAki24FUdLLPwojudb2SbuuPuiZ2hWx+tb97j1My8gFD+ntMLjNzjjcVsKlyoIHNKNkRSN3lpVz/xLBAw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjNoEE2GthoCnN8zbgJAlOqjqa6jb2XEHOuLDiKN3Jg=;
 b=eKUCt0/qUM1ZnKVNjbpeOCdvDKAMJrIELy6IcOHlcMJW43QuKy2A7kfCmny2slWQDANTTObZKIDo3ciqxbhZuPgNWAyRvT9Pq598LM7fD8grV8iOL8s0w4ePhFZ/NXqE7zhSJqyEVFQrfmaQiVnpmikxkM6o8wYaPEh3g0HaDDE=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86: Use 32-bit counter for TLB clock on debug builds
Date: Tue, 13 Jan 2026 13:09:58 +0100
Message-ID: <20260113120959.55156-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|LV2PR12MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 2abb9a0b-7d02-4e75-9347-08de529cb878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RVgyaSzUUaZgwNR2Urra/zXWDCWYqEKRVq4BAA8raPpkbdgkgQyYwcXX8NXQ?=
 =?us-ascii?Q?5zyT8zmE5Pq6+wFaFquJDazWYHBSGj6KDXn404xN0rIqNFR7k+PaosUgk1XI?=
 =?us-ascii?Q?RPTPWqh8nuKROf3EAFDC6DqUkXrhCa4FPDLBJpertXqi/Yu5RCNZoNl6A0VM?=
 =?us-ascii?Q?KSXxqKSBU0iOGwrW7c1xbQPid/ZhxuUKHFGzLDYk83PQUxk8HhqvgShEgfcd?=
 =?us-ascii?Q?U3O1UTyaQzBuUY26HUYkYS1wujsJPux0ryqMOStRq7gnznK0pKXJZKIl+vkn?=
 =?us-ascii?Q?ZdeWpoGutlKL8fP3D4wJiV9dq/cEye/v0b7k8+n93oGaUFL8lLj7yCYr7u0v?=
 =?us-ascii?Q?QT60vCt6s6j1pcgVp3tokQGJB0n0O5Qb1fq5YmRJ0whLU7JrPB3Io7DxHo1k?=
 =?us-ascii?Q?6+49bW7hXpjtLNo8f/2JfmT7iUnZG3MOQIDfU3H6xDa1q5bdcfx3kuEpRz/x?=
 =?us-ascii?Q?/6qfh42seIB7Bd4zhDiHYFcLaTPmGx4qPoOGZ/Q5fEnKxvA2vtYXrtdUvpTl?=
 =?us-ascii?Q?aEPWtcfY/c5mD17SxY2ykZF8qqukIqspS69Z6usXnLDmAJWDXPx+DBfddHOe?=
 =?us-ascii?Q?S6nFLB/rX+dACGxLT1ewToh5KnloDtX8tWmZfWcRw0j+oNA3a84ITssIcJxc?=
 =?us-ascii?Q?Y9VqDt4vGNhMGOjydlDb7xFVwFzpvlJ12vgUTiaiyK7ev91Ln5SYvHdIOmmR?=
 =?us-ascii?Q?3Gmcnb0iSfizvApySQ+wKjThuWLmaoOE7L2aDiLGfixy6opVQW582/eaq7yV?=
 =?us-ascii?Q?fdkvikfCJr95H0bdDrUNtc6WxQ5ywefBEI/eixTJr2U/hqa1Iz17BTASaTmU?=
 =?us-ascii?Q?WS9VIO4f/0TBecZSf+/J7RuejqMwLZLQSIlmBbvN2nukrPEweRsyI86JBs14?=
 =?us-ascii?Q?faN6vQyVm4LvF3lUKb9nbppBQno2+ktMz3o/V+5Baz+/NgPqu9TXWMNalcxf?=
 =?us-ascii?Q?dHKFLIkua7nhMG/787I4XJV+B++H83RQUHGTbxD97zGtQZUVfCMCN8ME0crf?=
 =?us-ascii?Q?ecehWnNdnM3MDAV4gUJgpluLlaFuIkKS2kqmGQyUmdKzCo82ONmv9p4ftWqw?=
 =?us-ascii?Q?wzot4+rwpVIFJX1MzyAKl/Srb8xDHWxBBN69T63k2AwlJHfFmYwVwdOVlYdl?=
 =?us-ascii?Q?cJtOYq6q+YnO11i5K/LeyLIbU/UwnHzKifZi0+AnTJ56EvS6YaJGkq8f2R3r?=
 =?us-ascii?Q?F17K9YozLokokJjqlCVEwqJFZjIoUhJh6maqJ3Yf+dUGHiL9NTjvTPBZxtoV?=
 =?us-ascii?Q?uu9uPSapWYBeSjXxdrk1IxnjLK84JqL8QSaDenMLm38/ceqTiD7qh44uMkj6?=
 =?us-ascii?Q?gysUiCrDmZ86PUvXZ/G/h4SlMcrXheIuZgSzWX0ym8K2ej/o5lx60YvqPPyf?=
 =?us-ascii?Q?ufpTtCELIwWmzfaaIb3BPuovYQ4P1mAk5FvqiL7fJSb83lL1gPlKOiX1d/xu?=
 =?us-ascii?Q?nlQ+pUc2zOp390nLIBa8PXUR4eTgIeGlzlqxcRxteJV3CKQ7MA4xY4j1eRgC?=
 =?us-ascii?Q?SJfGfE9FYQQI4dhn21jF65vUgKK0y5YA6Y/+oBGZwfkYztoexHSU+HfODL0F?=
 =?us-ascii?Q?wg3W2e9lO8lTJhR4Pec=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 12:10:19.6118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2abb9a0b-7d02-4e75-9347-08de529cb878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991

Debug builds traditionally ship with a 10-bit counter for the TLB
clock. This forces global TLB shootdowns with high frequency, making
debug builds unsuitable for any form of real time testing.

Remove this quirk, unifying release and debug under a wide counter.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v1: https://lore.kernel.org/xen-devel/20260112140851.55590-1-alejandro.garciavallejo@amd.com/
v2:
  * Remove WRAP_MASK instead.
  * Commit message/title rewrites.
---
 xen/arch/x86/flushtlb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 09e676c151..23721bb52c 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -19,13 +19,6 @@
 #include <asm/pv/domain.h>
 #include <asm/spec_ctrl.h>
 
-/* Debug builds: Wrap frequently to stress-test the wrap logic. */
-#ifdef NDEBUG
-#define WRAP_MASK (0xFFFFFFFFU)
-#else
-#define WRAP_MASK (0x000003FFU)
-#endif
-
 #ifndef CONFIG_PV
 # undef X86_CR4_PCIDE
 # define X86_CR4_PCIDE 0
@@ -55,7 +48,7 @@ static u32 pre_flush(void)
         /* Clock wrapped: someone else is leading a global TLB shootdown. */
         if ( unlikely(t1 == 0) )
             goto skip_clocktick;
-        t2 = (t + 1) & WRAP_MASK;
+        t2 = t + 1;
     }
     while ( unlikely((t = cmpxchg(&tlbflush_clock, t1, t2)) != t1) );
 

base-commit: a2a34d76643e49ccc949296c9a45888034e50b55
-- 
2.43.0


