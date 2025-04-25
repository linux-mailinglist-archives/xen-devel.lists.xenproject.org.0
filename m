Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA505A9D659
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 01:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968816.1358270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-00030H-Cy; Fri, 25 Apr 2025 23:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968816.1358270; Fri, 25 Apr 2025 23:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-0002xv-9B; Fri, 25 Apr 2025 23:43:37 +0000
Received: by outflank-mailman (input) for mailman id 968816;
 Fri, 25 Apr 2025 23:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/n1b=XL=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u8Shj-0002xO-EK
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 23:43:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2413::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 180f914f-222f-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 01:43:32 +0200 (CEST)
Received: from MW4PR02CA0021.namprd02.prod.outlook.com (2603:10b6:303:16d::31)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 25 Apr
 2025 23:43:27 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::45) by MW4PR02CA0021.outlook.office365.com
 (2603:10b6:303:16d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Fri,
 25 Apr 2025 23:43:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 23:43:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:25 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 18:43:24 -0500
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
X-Inumbo-ID: 180f914f-222f-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlOIj9rznXBaAV6/STA8DdCZy96od1IYBHYtotRxc/RyF1GQb602oHc90vh44fTZexmPYmMR4Ene+nv19Fj7ZJH1Jj3BLWuXjCpaaqdU8dJWRIH4m6qnh82jzeSOu1fj00MtGqMI3GF+iuNtWHqMl56gEBG5k+Hy0Xy5YL9lWkU0w708YZhNwXORK3y7xMs4RfLOhkEeA4DRhigII5LlNL8raTUMx3suWXJ0v5hFqcFdyZVPbu7OVH7FdDU9kLHAYW5CLnwolSY6Nw9PwXNIoloU9/xbW9UPLFYK3xkfh7DAMhbZQ02yigieAMFiEQ4XOgSVYqY49HN+dOXdjfli6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7c+2iaVkAQtkWehQ13fcy/pOtZ7NzflbIurrJtmhsw=;
 b=ton7HMwRj3/sggU1/lzrgsD2JGC+6w6kZ0Rszu4sT+BxiuioO3MS37xG6dkE+lqqp39XfVvdZiM6+F48WE3AOoWqjp7xy3Qu+UnTNmUsxB3DkviWZ/QpbAX0gXRCqmoZyMTuJj0kCKQW3MuFToGxm13UMxQUZdz9LH1mGvxVWY6y9z5r09mAG3L1O+hf47RoukVBSZN2QQ/B0DEBa0gphHboJDVSCBX0eZZFYCIpyfhVcmDwAfD3O8EyPl6GiC4AKqG5awG15BIeQVsMnhASnpZeMvUDhV4R74aGrmMQFTOBKKPuXol8Wo89elg4titVuDVc2opgpeXKN3v7oBRdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7c+2iaVkAQtkWehQ13fcy/pOtZ7NzflbIurrJtmhsw=;
 b=ounw14a1n8lhHrC7tV5HsGQmfMFOzBIiM/2FQ61KawAhDm6cAZgPl0NbgVIyd0ygXThReoCfzxKLYhA2tS2dc6d6K4VKOZfG3X9HodRoTmKWoua4gYGRlx9KnRmJiJyg3fqJQfRrfqvpAq6twRV/2EgPFZKQcVZ60aceYADxTc0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Victor Lira <victorm.lira@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v1 1/3] x86: x86_emulate: address violations of MISRA C Rule 19.1
Date: Fri, 25 Apr 2025 16:42:36 -0700
Message-ID: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 389ac9c0-8c85-4d12-389b-08dd8452f97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2gzK3Bvajk5TFVDdUpJTnNGakxtUTFZMVRlcEFHM3BNV1JoWFR5dFdELzRH?=
 =?utf-8?B?cndHZDN3a3oyeFNUNVErT05xaDNoNm1FdzhBdU90bE41L1p5R09jT1JzNU91?=
 =?utf-8?B?dUVGa3hTcjlWUmFKUGVqdXYzakQ5NXJKRnBVbElXL24yTGlLZUx1ODJwNmZu?=
 =?utf-8?B?MzZTdEpHZFVIaTR5RW5nUXZHS2FieGszdjkzdnY0SHRGNXl5OWhhZmRYTXEy?=
 =?utf-8?B?STFVT091Vm8rTWNGMmVEWWpsbFFMbHBPOFRhaHFRNzFWdm9jdXZkRnlDWW54?=
 =?utf-8?B?WlY2TTY3VFVtRFBsOWQvV2pYSzdXRHZGK3V0S3pRdlFGN1RwdUlWcjJYUHlW?=
 =?utf-8?B?MkNqSGNZSUxPd0dZNkVoU2xLR0g3OXRsR1hPZU5TcWtzR2RsbGFzMWN5TUZv?=
 =?utf-8?B?RjdESktFTFVVeEtwNk5aOXMzbWwxM2x0WlNFV25XaFhWTFlmSVdTQnNkMzlz?=
 =?utf-8?B?Vy82SkdkNzZRNXdIS1RpVTNjUU9FRlNFV3MxRSthY094VUdKK3A3cGdlOXJx?=
 =?utf-8?B?NGRUUjB3TldEM0ZrKzZzcGt1SXRrYzlMOXBqZ2ZjZVdyeWl3RzhCSGY2SGdW?=
 =?utf-8?B?aHl2TERMb0JMdkkvTHNSejV3TW1sZXRIcDVOR1FpV1RjRzdwVDNqZG9XMXQw?=
 =?utf-8?B?QkNzSmtUdHJjZTdjQ1JocTBRZ3hMRXdITTRGNGlmeUwreDFIUXJJVzVWa2Jm?=
 =?utf-8?B?MGZrVjNuZlNwMUkrbXpYcndmR1l2cll0RDI5bDA3TVdCU1M0UXAycFpGRVFK?=
 =?utf-8?B?emZxbzh1UFlEVk9aTWV2WEtEZ1RoZDlSZkJtOUQxNEszSWFZcm9HMVBPUU5C?=
 =?utf-8?B?RmV2aXJnZjJOSStBZlVqTFN5NGo2blNEckNvZWtnMGo4MDBTUytnOGJicVdE?=
 =?utf-8?B?SXI2UDhpM2N6R25jRktsQUlWOFJsU0l3MEt2OFlyV0Z2UjhVbGc3cEZtUXJ1?=
 =?utf-8?B?YUJ1NGZvQ0VCZXpTM2lhRlJheHNUN0lyZlZRc3VZS2s0KzFEelFUTkhJemZV?=
 =?utf-8?B?cnExNHJucjZ6SzBkeEdFWC8xRDdRWDFuTmhHUGxtZmtLMllmLzZnQUhZVExk?=
 =?utf-8?B?UHo3aHloeTVHS3NWVTJWalRhWFhPeFJlcjA0YkJtc21UblZTeVhLOEhjWnlL?=
 =?utf-8?B?aVNvU3FuWExYeXFHV0x1M3p0NW1FdENhNjhSMThWRkhpM21MUEtMcmF4QVN6?=
 =?utf-8?B?Vjh1SkRqNGQ0eW9oT2RCWUhGM2ZRZU1lTk0zdHh4ZUdZMko3TGZKcThqQTlp?=
 =?utf-8?B?L1hESm1LcG5aUnBuSGl4M0NJamZlTkFoSzFjcnZkSDllT04vYzl1TkpaMCtL?=
 =?utf-8?B?bzRBTzZ2dUNLaWxNb3FKZkxuMTgyZ3cveFN6SzE4aVo1MTdobDZiY3NKUWJH?=
 =?utf-8?B?aDBXZ3RCYnBGc2NKWkRwRnEyS2NHbk80UExxeXBpNklnaWIxaU1VbklKc212?=
 =?utf-8?B?U2V0c0UzTGNJNmE4QmZGL2ZneVE5VTByODY3RlorS2JpejVIcEF3SUZUMkpL?=
 =?utf-8?B?M2cvSkFLU0RyUVJPU2JwNHJhc1hyYk1sY1VHMldPQURCOEp5SHcraXF5eFhV?=
 =?utf-8?B?a2xhN3lJbVRZbnM3MDE2NHVOR2l0cUg3WkxWUmtCUms3VVNnRWlJdWNPSFBD?=
 =?utf-8?B?b3Fvaks2UzVnVExoVkxYZ1dpWGtyQzc2aS95QkJxRXpNa0wwRy9UTW9yTFJX?=
 =?utf-8?B?WE5IZXRhT29OakcxTXZVQTFBZXZGZ0FVY1pqQTc3dVRYaWpUd0E1NXZ1U3k5?=
 =?utf-8?B?THB5RU42MjdKR25Ba2J3QVlhZlJmbXg2QmtxSkNYUVNtWUZRaHBHLzk1U0Uz?=
 =?utf-8?B?bWlwbHJLRkdkT0Vza2l5ZUIyVXpTS2k4UlpEcHRCM3FaM01EOHpFOFVsemVo?=
 =?utf-8?B?d0pUbVJxYlZlM2xOVDFPV2U5NnJjaEdMd3cxODRpUzBmdjFsdy93MDg1MGJG?=
 =?utf-8?B?akh4NTdONXJ2U3JDRFdJcDZEOHhkd1pTWmMyckdtUUlxUU9pMjBxRm9WTDZO?=
 =?utf-8?B?UUsxUUR3QVdkS29EVEMyRCs4NW1qNEl4OGpZQm91aFdHNzlMajArWWo4bWhC?=
 =?utf-8?Q?JDy6Vg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 23:43:26.2702
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 389ac9c0-8c85-4d12-389b-08dd8452f97b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Rule 19.1 states: "An object shall not be assigned or copied
to an overlapping object". Since the "call" and "compat_call" are
fields of the same union, reading from one member and writing to
the other violates the rule, while not causing Undefined Behavior
due to their relative sizes. However, a dummy variables are used to
address the violations and prevent the future possibility of
incurring in UB.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 8e14ebb35b..44dc3039f3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -526,9 +526,19 @@ static inline void put_loop_count(
          */                                                             \
         if ( !amd_like(ctxt) && mode_64bit() && ad_bytes == 4 )         \
         {                                                               \
+            uint64_t tmp;                                               \
+                                                                        \
             _regs.r(cx) = 0;                                            \
-            if ( extend_si ) _regs.r(si) = _regs.esi;                   \
-            if ( extend_di ) _regs.r(di) = _regs.edi;                   \
+            if ( extend_si )                                            \
+            {                                                           \
+                tmp = _regs.esi;                                        \
+                _regs.r(si) = tmp;                                      \
+            }                                                           \
+            if ( extend_di )                                            \
+            {                                                           \
+                tmp = _regs.edi;                                        \
+                _regs.r(di) = tmp;                                      \
+            }                                                           \
         }                                                               \
         goto complete_insn;                                             \
     }                                                                   \
@@ -2029,7 +2039,12 @@ x86_emulate(
         switch ( op_bytes )
         {
         case 2: _regs.ax = (int8_t)_regs.ax; break; /* cbw */
-        case 4: _regs.r(ax) = (uint32_t)(int16_t)_regs.ax; break; /* cwde */
+        case 4:
+            {
+                uint32_t tmp = (uint32_t)(int16_t)_regs.ax;
+                _regs.r(ax) = tmp;
+                break; /* cwde */
+            }
         case 8: _regs.r(ax) = (int32_t)_regs.r(ax); break; /* cdqe */
         }
         break;
--
2.47.0

