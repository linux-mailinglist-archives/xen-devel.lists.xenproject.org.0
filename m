Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61422D3C3CD
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 10:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208501.1520669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DA-0001Pt-3q; Tue, 20 Jan 2026 09:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208501.1520669; Tue, 20 Jan 2026 09:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8DA-0001NI-19; Tue, 20 Jan 2026 09:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1208501;
 Tue, 20 Jan 2026 09:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fwra=7Z=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vi8D8-00018d-13
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 09:39:42 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1a88de7-f5e3-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 10:39:41 +0100 (CET)
Received: from SN6PR05CA0002.namprd05.prod.outlook.com (2603:10b6:805:de::15)
 by PH0PR12MB999113.namprd12.prod.outlook.com (2603:10b6:510:38f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Tue, 20 Jan
 2026 09:39:37 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:805:de:cafe::d4) by SN6PR05CA0002.outlook.office365.com
 (2603:10b6:805:de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 09:39:38 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 09:39:36 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 20 Jan
 2026 03:39:33 -0600
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
X-Inumbo-ID: f1a88de7-f5e3-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVMs8HfaZ99SakjTfkmAlts9+k93IpFM+h6bV07kMMGcqHoTK5p0T348/2Q4xjF+FzjtaCNm1z7oLUboua4lovxnONm+Vwsc/f/dZ1bJm4eQh2EjDwaEYW6PX1U1ifBWWQXXBxdEkqisxM6h0z//CIN2mGYluCS5NPyA+Od6cuuoGNYDrRZeNFa3DEhX9i8AAsDgXtpHJM6hnHLdIoUiRxzq79HgncrU7JD+p4pCZxd5N4XzD96sN3L4ZVgh/pUK2FfWqVRpxIKavlvQqUDsLyKmEPUbD/BNn5nD0mpGcnIbUZaeTubPqZ0Hn8ZKjmYSorxz6joqTqPCZzJtzDFaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrP7eMzlU98UJI3/6mC+q5/l7owwMFeEcveAnyG5A9g=;
 b=lZd/WlmmsF5pZff4PJ5BIqGqnTCKLth5S12og3oMn5H6w43W6OU86p7twMZDspkLayVLoKscIKIj4/V7AVJvsgatao34WfDLy0GCNkAzXqe0RbIaJthkB6hyMNy2Acf0YL1H8zrclEcirWw4oMGMRY08adGPM9H8LJ0sgQd0WdU175mYyWNHWkhriVlMXkNK81P0I23IP8Qwoyb15fNgll5HmMFzMxxDeSmWJfaozioLkpQ0fLnMiwz71KsClQLiIK22zhEGcmgcs80k4VeiK6Ugi4jIcmEi7Pc+lQZGrs3LjhJlwdvB7Im3LgCn9jSBudsN66PplbrJMqWVmICwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrP7eMzlU98UJI3/6mC+q5/l7owwMFeEcveAnyG5A9g=;
 b=AC3aTi4863sG+p+8GmmJn3s4LFX/+s/sULqEmuksxzdHYw8dqo9A2W+WqgTHBszno71bw3uS1gt/05sZ5fDRkYQ+Jc7odnfWb64GJohZuiXMj3RlMjEtPprNiAQs7j6Aav8WNM+pWb8Pvh0i/KbUdY1WCvJNUGTBtE0GJk/Js+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/5] earlycpio: lib-ify earlycpio.c
Date: Tue, 20 Jan 2026 10:38:48 +0100
Message-ID: <20260120093852.2380-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|PH0PR12MB999113:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9521fa-ebb4-4401-2eb2-08de5807d32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yym73SRnm92MLJz9FTQra9nmDvySZ+dOtOMrm5fQsK++sUCpqLvHdg3QhKF+?=
 =?us-ascii?Q?oNy/W+VQsRlYbLB1mcGUTtAQCGUuvmJfqcQVLuKChOyd77dEq36Ux6Ui8QMY?=
 =?us-ascii?Q?X5KGWpI2mpmENdL4XeTOzUuQ+dH0DifboLVAyNTLl/iL209ePpyMljm1/0Lo?=
 =?us-ascii?Q?W+/o/WvqF1Rv3A2b4Mv6RuyarhbCxC3fH0hvCrKkSOBAdN8AE0ztzbkwGc8J?=
 =?us-ascii?Q?SnS+bGpOEvnCPp9pZ3wny47tpNgJR91YlfR/UZk5vKLGZUWww4CIeNElNbL8?=
 =?us-ascii?Q?TObix94ekKS7h73HVsfEYpqhRwTJP42Hnc4kNLC9s6/3JDRVk5IrRZzD65+j?=
 =?us-ascii?Q?iFEAS2uKvkV3V1JiNBjXavQ6QUV+8IbNJKmj0TIk2XpkRZt0gw9ZwR+3a9yx?=
 =?us-ascii?Q?HsGRXhvEgIXwQyUhhksjZVTGOvr+pvVQsixrDVeMkdQTZr/NjtHRv8WVj8wq?=
 =?us-ascii?Q?Rldjy+BRj7I3LBDvFVBSTLG9jbqfWgVlZv5RKJFAk5AQ9Vu6QLyl1qsypuJy?=
 =?us-ascii?Q?LvaqEVSsXIXJ8OitGFsV++xQvPDsWag8CJZzC9zovZ8+99gI13IX+JnDUjtv?=
 =?us-ascii?Q?HpNqKLoN3TJI/FVHLxIHOel/GzIyPAzOTucfvkJzZMr2yMwMyMxLBoV1Hl7T?=
 =?us-ascii?Q?lIpHBtNpGig+SugIXRxyHJSp4LLOedt7esbzLpsRO8qseHYwra0sXevRvCBh?=
 =?us-ascii?Q?S9W3I2lCIRyJCA/AnPd+pPIxpUB2G0+0I7B3QX4rX0RibfEdG20sZJvu7hpR?=
 =?us-ascii?Q?CslWczaCUzAJiANbN6pctmLPUMsm5muPcb8uGToGFL7xcSWKXFupgQ5rap1A?=
 =?us-ascii?Q?AfqFsogNLJoYOVokxI3Ugb6wEAxxz04UYD81AROKrihpPcH7LDwvXH2XZ32m?=
 =?us-ascii?Q?kuvDQfyqgGfQc7bsEMYm5lOOCtH1CkUWOB8CF4xRoh2Q8r26BmQwqo4VcDkP?=
 =?us-ascii?Q?u+PYHol+q+2p8IMi+6dPF6sGAjG5D51f1XRUp909qzilwwRVkBCZjGWCK6Kq?=
 =?us-ascii?Q?yi7eVZ8UTzSt57fsTkbOWabAGLTikuQzRoHqYCfXhLuEYduDSctZ1/7kJ1Nc?=
 =?us-ascii?Q?eREo20h2bAoUnSUfuwCMrNk5f2PjT0xGOlETm6+/N6mZNUu0TWGePjdCyq8K?=
 =?us-ascii?Q?/NX+rumOX6gIvWkc7x/fHhMw5sTJTxDYiggG8DM3vll/twN1b+Y3HyWXdHNX?=
 =?us-ascii?Q?Kwf7txEh/8LIHkKkbIS+jNR7MJ29ynMXrbGvFDGbYvYSZrT4nYoPswm2qqiE?=
 =?us-ascii?Q?6cO5P3t7FSeArg9NQ2JWRI6pgZqU6E0iBn23B6MGsf17XYi9GnuIG13PdWNW?=
 =?us-ascii?Q?7rZbjeiYyIpZ8ebhCYeafTdhEXq72nTkcXc/lElpz9yvnzx3rbPpeLmPqCwQ?=
 =?us-ascii?Q?NTY7YVm4MJdgvTbkWagb/nW0VW4c6vlojrT/PY6bhakYuPLJTZG8N8t1Y7/3?=
 =?us-ascii?Q?HcLAS+m4QdRd4xlHGyTu1VnLTgncI4KZ3p4j5j9c8GjezhrHMWwjUMxf/i/D?=
 =?us-ascii?Q?1AvI/fC4ewo1U/tRTK0jb3apUXE/U/B04reWMIzniygtaqvC/nLGFuXB/S72?=
 =?us-ascii?Q?ucEftGY1RTHmWtlRuUjd8iiz0pzNTN6mAqVYMqAUV1QtFkVJKjS2RgqW7o5q?=
 =?us-ascii?Q?g2scKDSsMbXHbdnc/QEzuOBnUTqfTOS+K/1Jtg5b+ljAImvcJnbD2IbyUCAw?=
 =?us-ascii?Q?p/GG+Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:39:36.3395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9521fa-ebb4-4401-2eb2-08de5807d32b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999113

It's only used for microcode loading on x86. By lib-ifying it we can make
it go away automatically when microcode loading becomes an optional
feature in follow-up patches.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v4:
  * Makes the lib-y target init-only
---
 xen/common/Makefile             | 2 +-
 xen/lib/Makefile                | 1 +
 xen/{common => lib}/earlycpio.c | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename xen/{common => lib}/earlycpio.c (100%)

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 92c97d641e..4fc0c15088 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -65,7 +65,7 @@ obj-y += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
-obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
+obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd,$(n).init.o)
 
 obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o)
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index efca830d92..3b0137902c 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
+lib-y += earlycpio.init.o
 lib-y += find-next-bit.o
 lib-y += generic-ffsl.o
 lib-y += generic-flsl.o
diff --git a/xen/common/earlycpio.c b/xen/lib/earlycpio.c
similarity index 100%
rename from xen/common/earlycpio.c
rename to xen/lib/earlycpio.c
-- 
2.43.0


