Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODj7KhC5j2kYTAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:51:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F259013A10F
	for <lists+xen-devel@lfdr.de>; Sat, 14 Feb 2026 00:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232148.1536991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2wO-0003Z6-Tg; Fri, 13 Feb 2026 23:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232148.1536991; Fri, 13 Feb 2026 23:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr2wO-0003Ws-Qi; Fri, 13 Feb 2026 23:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1232148;
 Fri, 13 Feb 2026 23:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4o5=AR=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vr2wN-0003Wm-Du
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 23:51:15 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0140c52-0936-11f1-b163-2bf370ae4941;
 Sat, 14 Feb 2026 00:51:12 +0100 (CET)
Received: from BN0PR04CA0038.namprd04.prod.outlook.com (2603:10b6:408:e8::13)
 by LV9PR12MB9783.namprd12.prod.outlook.com (2603:10b6:408:2e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 23:51:05 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::6e) by BN0PR04CA0038.outlook.office365.com
 (2603:10b6:408:e8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.14 via Frontend Transport; Fri,
 13 Feb 2026 23:50:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Fri, 13 Feb 2026 23:51:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 17:51:04 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 15:51:04 -0800
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 17:51:03 -0600
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
X-Inumbo-ID: e0140c52-0936-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzj5scfRTe7EVXQLxCgzEocsw140yLyg0uv9fi5jNVeS4vPg9k2s46V9KduOhoefLeNUx6fwO5PDkr6/PvW+rSiY59LFehKn7fShYuoVsxryHJZZqj7AhU9sNz9edZZFXsjXgoqFSfUSi9BE0Z666E2ZANKwoT/T1SEZGOcKTVz7a1bmNEvMjzli5+yM8aJ3LSUAgSMXts+aPTNL4J8DouEA+cMoqkwmg8iY5u9XGUZ5tShOvQkIA8cyYlGbTfUd2jioq5G63lMD6nbq3Ceex9vONAQAVX18sDnOEDi6F11ofzua2h6kPXyAtZ/MS1AoIELvMDGqj4D1V6nWIZPsGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugPPHSkZ0mLLD5nZZGb2BUPrQBP72gpFa1fq4j5Ssr8=;
 b=dDEKSYnXasrig69pGGv0XsSg99iAvvg84YXOTzXHqSyjYvOlpObuZtbz8nsEKda8AMR96tDU8peDL4t673AYUq723c0WC/oMOHitIaB/03l7bnL9X+BV6XzzG9/afx08oZ6/CgvXXX/5NBqzG2lcoDP5ccRI/Jo2rC7Y5Bp+BZQVIKxaIjNEhwadxhHnb2cuRQFwR1q/yfChyfM59lnU+NqVAPOZiyWGhvyk+SkajfmNL41RI7QrU6HACpeXBMeNYxkq95wXFXgpop17WK2i/b3d0/5s0NP59UaWHkb33ewKMrCjCZzRlyCAM96Psz9jF2KhvS6Oox4kMQ+a9eyfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugPPHSkZ0mLLD5nZZGb2BUPrQBP72gpFa1fq4j5Ssr8=;
 b=yfjYWb77APHceWu4563dCFKWpWD73guKcMdv/+x9d39oQAn7/QPQK+Dt1QqzDfXv0iaoRTWih4ZaX3/Fyj/Y8xnyilEdVY40dmfSLWQ7RwiEu4Sum7XA5kNp63Z66VYrUWukTY/PjzFPSEaJ6xPP5s/aXYelXGXqJpzXF5FEnro=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <stefano.stabellini@amd.com>,
	<alejandro.garciavallejo@amd.com>
Subject: [PATCH v4] x86/cpufreq: Add Kconfig option for CPU frequency scaling
Date: Fri, 13 Feb 2026 15:51:02 -0800
Message-ID: <20260213235102.359472-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|LV9PR12MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e4ee0f-d8b6-4ee0-8df2-08de6b5ac00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xpff5FWJEiNqRBykh3t+pIfecbTEd8S6I3PLvxc1EAJFODPU8vyk+djt17pl?=
 =?us-ascii?Q?9X6dutAXZPB5h3+zwUzyLNZeNxL4k2dNHQ6XW4xU8XvahXpweUOsStGVVjgL?=
 =?us-ascii?Q?KdxRsjEMUk1D7/pf6lP3Rwhn7jQ3ZTWyx/gMdwYtKlOa0kNdMy9iceboNRji?=
 =?us-ascii?Q?wFS/Bj3fQtFfmlio1uhL6Q+kitOgz1r/N5elc80lIiLeoQEqNaA1Cc1K4myY?=
 =?us-ascii?Q?9ut8iIq/56SIE/pDRBQWjV1ZZPWxSP6eD4JGM5FYO0tXGjxB76OQhtU/oAMu?=
 =?us-ascii?Q?euBc23ooFFZU3fD/V0XeGFiZcbydTed38fzpMeARhJZBUSf8poj4np9sNMAv?=
 =?us-ascii?Q?8LdDqHpd2UNsgPnSLCg9+iczKfB4xTjam3FB0TtGHmhYtijQnSFwgyDLUqrn?=
 =?us-ascii?Q?eZKW1l4l5EkT99r+YtrEFW5GS6CEXjkFC+QRxPvSgAXS6ZvwX2Yg+cF5zMUI?=
 =?us-ascii?Q?Z9J469MTt5ju9Q2KSXw+GCJj38VROSWbJnk3ZmVR4sNXthDfKEs+33ACFslf?=
 =?us-ascii?Q?LIOIMfxF3j19nzxs0fXaLGXQt904ljtgKWvCSpGVgyma/19R8+kHz2Et6iSn?=
 =?us-ascii?Q?QfaxEROh6zhA9okn1n0bwqRRBVrWI3uVW9lrVjP40oDoJpxesT4AeGqmQD3a?=
 =?us-ascii?Q?XTXM8XM5XE68Hu/Cs0d2DXjoW8Zns/cbE00J19oUdgBNtLV+B8LeOPbWmEch?=
 =?us-ascii?Q?w9kftZEdM6apTs6HgAC4SqEhkiYA9wj0IIvsOe0s1SNVQa/YxXceu06YNaH0?=
 =?us-ascii?Q?4fapehNae6Lh0R7MOJY7ukq/YvRMCyuPHQ20ux03F56cnHu6SMgjIs3qtFQC?=
 =?us-ascii?Q?GQ74gMWRRpkx5GzpkYTib9Z1kcHGsf/MDUwcFFMdkz6oFXSN/4MQSVhOBkgS?=
 =?us-ascii?Q?JguDCqWuQUbEQ5JoAkPMPrJO9DuC9tkoza8VnDYXFmIgJpbALmjiK7uJb2Tp?=
 =?us-ascii?Q?YAs8ndj3G/xm7LzZQvkKrRsoHdCRAsSrXB9yw2PgvJ8T4paxUOmSjQj6K+2y?=
 =?us-ascii?Q?CdVjxVVvqOqs9k1NHsAOmsegIAENriWhPk0ZNvSr1DOuhwVExPtZFhkxaCb8?=
 =?us-ascii?Q?TtnNmd7STwurnA9zPkujscsQLhJbjaHfr18XeYVuUJCxVn6q7X6D6c1HL2NJ?=
 =?us-ascii?Q?+3i5H/xGxa9tsIHlzsWLJI1nw56yEY73vbC2NcIJVUW/Rz+NoG8B6zVHB/A2?=
 =?us-ascii?Q?p7oAGMpaMGzwve4a4z/3XjxjqEanLHfTOR6utp376NcgRLmj79ZAYh0cLbxn?=
 =?us-ascii?Q?6jvOWrhICgxEjvhLYKIBm2G6QC6X/utIA1YAbSDlIsV8MZ9QGyEnD97S4T7o?=
 =?us-ascii?Q?nyWbaQbYCdWIOWK7GkTuTVeKEtFRr3qixYu8AQB83ORFV1TTpapVzVVOeacL?=
 =?us-ascii?Q?t7xF7cki8YxC70NckXVH8ytuUSPjhqQEtRBH7i8/iU3Vxatt0GRdiy6ETnqS?=
 =?us-ascii?Q?QVw2j+y8qxs3vS09ZM+jVjwRAoIE8vy0vgL8u7shN+rLIX1grOyX7QD5oPO1?=
 =?us-ascii?Q?RXwuR5ZmpfmSzWC0QYt3lsqUQpBvLs7GE6CePglZ+dWihvmg6VUAl2aO6y6J?=
 =?us-ascii?Q?oHEagBE5IXt+lhhcDu00WrM62te/m2Y57NowC65wjWsIcE2DAA8wmNuOgv0U?=
 =?us-ascii?Q?9OHvAbUFzYQOyDl8+LdL0mhaJSMOESV6jM/bcS3aLxReX8kqNp1CNnSfjpnS?=
 =?us-ascii?Q?pmwbMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mG9L4ngzLzr2lR6PjLSkUS1ZTkvBCXGCab2Msn4hVJAtoGQ49CVgPJ25RgDrvpWvq+KdUvtpiVUJQBpBmI+UtxsDvSSdGJKNLwKITt7fSOvSYGyxPeDj2sDPAo01j3hfyErh6/cm2IpgXJvKfdayLlidUxsnD+uAWqQWoooP5dLdXOaaqF2arldOx07oAn/kigRnUcrDqvLdgBUZzTAKBrSD0bjpsVnI51r01mtq36/c4gtISlsO7YhBs5Pq8f1ZX5UwVfLH3CwcYUHwCA7C/c9UurgLTkGOMRku+yKAy3488E+HIT5m5U1eqCm6ZF2IVq8vApFWOAfOTPCLtv0f7HTVA9zyD3ShpEBp/j5vsp1bBbjmHFFPBZCXlx9TlYW0tXzJLDJaNkewWqe6HyJGD3BPiTVsoyGilSAxEZMpbNG52p2RedsGhZEFsbHeTVdR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:51:04.6068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e4ee0f-d8b6-4ee0-8df2-08de6b5ac00c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9783
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: F259013A10F
X-Rspamd-Action: no action

Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
disabled at build time. When disabled, this removes cpufreq code
from the build.

Introduce IS_ENABLED(CONFIG_CPUFREQ) checks for relevant do_pm_op and
do_platform_op subops and other functions that require CONFIG_CPUFREQ to
work.

Add stubs where necessary.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v4:
- fix IS_ENABLED(CPUFREQ)
- remove #ifdef in platform_hypercall.c and use DCE
- move cpufreq_controller enum out of #ifdef
---
 xen/arch/x86/acpi/Makefile                |  2 +-
 xen/arch/x86/platform_hypercall.c         |  6 ++++--
 xen/drivers/Makefile                      |  2 +-
 xen/drivers/acpi/pm-op.c                  |  3 ++-
 xen/drivers/acpi/pmstat.c                 |  8 ++++++--
 xen/drivers/cpufreq/Kconfig               | 14 +++++++++++++-
 xen/include/acpi/cpufreq/cpufreq.h        | 13 ++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |  3 ---
 xen/include/xen/acpi.h                    |  8 ++++++++
 xen/include/xen/pmstat.h                  | 15 ++++++++++++++-
 xen/include/xen/sched.h                   |  7 +++++++
 11 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/acpi/Makefile b/xen/arch/x86/acpi/Makefile
index 041377e2bb..aa476f65d5 100644
--- a/xen/arch/x86/acpi/Makefile
+++ b/xen/arch/x86/acpi/Makefile
@@ -1,4 +1,4 @@
-obj-y += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 
 obj-y += lib.o power.o cpu_idle.o cpuidle_menu.o
 obj-bin-y += boot.init.o wakeup_prot.o
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index c6c5135806..1dc7dae919 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -487,7 +487,8 @@ ret_t do_platform_op(
 
     case XENPF_change_freq:
         ret = -ENOSYS;
-        if ( cpufreq_controller != FREQCTL_dom0_kernel )
+        if ( !IS_ENABLED(CONFIG_CPUFREQ) ||
+             cpufreq_controller != FREQCTL_dom0_kernel )
             break;
         ret = -EINVAL;
         if ( op->u.change_freq.flags || !cpu_online(op->u.change_freq.cpu) )
@@ -507,7 +508,8 @@ ret_t do_platform_op(
         XEN_GUEST_HANDLE(uint64) idletimes;
 
         ret = -ENOSYS;
-        if ( cpufreq_controller != FREQCTL_dom0_kernel )
+        if ( !IS_ENABLED(CONFIG_CPUFREQ) ||
+             cpufreq_controller != FREQCTL_dom0_kernel )
             break;
 
         ctlmap.nr_bits  = op->u.getidletime.cpumap_nr_cpus;
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad13..3d81b8dde4 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -1,5 +1,5 @@
 obj-y += char/
-obj-$(CONFIG_HAS_CPUFREQ) += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 obj-$(CONFIG_HAS_PCI) += pci/
 obj-$(CONFIG_HAS_VPCI) += vpci/
 obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 07bddc58d9..72f1eea62f 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -367,7 +367,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         return ret;
     }
 
-    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
+    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) ||
+         !IS_ENABLED(CONFIG_CPUFREQ) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];
 
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 0f31736df2..d640d3a92c 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -76,6 +76,9 @@ void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
     spinlock_t *cpufreq_statistic_lock =
                &per_cpu(cpufreq_statistic_lock, cpu);
 
+    if ( !IS_ENABLED(CONFIG_CPUFREQ) )
+        return;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
@@ -105,7 +108,7 @@ int cpufreq_statistic_init(unsigned int cpu)
 
     spin_lock_init(cpufreq_statistic_lock);
 
-    if ( !pmpt )
+    if ( !pmpt || !IS_ENABLED(CONFIG_CPUFREQ) )
         return -EINVAL;
 
     /* Only need to initialize in Px mode */
@@ -225,7 +228,8 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
     int ret = 0;
     const struct processor_pminfo *pmpt;
 
-    if ( !op || (op->cpuid >= nr_cpu_ids) || !cpu_online(op->cpuid) )
+    if ( !IS_ENABLED(CONFIG_CPUFREQ) || !op || (op->cpuid >= nr_cpu_ids) ||
+         !cpu_online(op->cpuid) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];
 
diff --git a/xen/drivers/cpufreq/Kconfig b/xen/drivers/cpufreq/Kconfig
index cce80f4aec..b9b93c1a26 100644
--- a/xen/drivers/cpufreq/Kconfig
+++ b/xen/drivers/cpufreq/Kconfig
@@ -1,3 +1,15 @@
-
 config HAS_CPUFREQ
 	bool
+
+config CPUFREQ
+	bool "CPU Frequency scaling"
+	default y
+	depends on HAS_CPUFREQ
+	help
+	  Enable CPU frequency scaling and power management governors.
+	  This allows Xen to dynamically adjust CPU P-states (performance
+	  states) based on system load.
+
+	  Disabling this option removes all cpufreq governors and power
+	  management interfaces. This is useful for real-time systems or
+	  minimal hypervisor builds.
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0171ccf0ba..828d23961c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
 
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 
+#ifdef CONFIG_CPUFREQ
+int cpufreq_add_cpu(unsigned int cpu);
+int cpufreq_del_cpu(unsigned int cpu);
+
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
+#else
+static inline int cpufreq_add_cpu(unsigned int cpu) { return -EOPNOTSUPP; }
+static inline int cpufreq_del_cpu(unsigned int cpu) { return -EOPNOTSUPP; }
+
+static inline void cpufreq_dbs_timer_suspend(void) {}
+static inline void cpufreq_dbs_timer_resume(void) {}
+#endif
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
@@ -398,7 +409,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
-#ifdef CONFIG_INTEL
+#if defined(CONFIG_INTEL) && defined(CONFIG_CPUFREQ)
 bool hwp_active(void);
 #else
 static inline bool hwp_active(void) { return false; }
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 0a87bc0384..bad9d94865 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -36,9 +36,6 @@ static inline void cpufreq_statistic_exit(unsigned int cpu) {}
 
 int  cpufreq_limit_change(unsigned int cpu);
 
-int  cpufreq_add_cpu(unsigned int cpu);
-int  cpufreq_del_cpu(unsigned int cpu);
-
 struct processor_performance {
     uint32_t state;
     uint32_t platform_limit;
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 90635ba0f3..ae6dba481c 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -186,7 +186,15 @@ static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
 #endif
 
 #ifdef XEN_GUEST_HANDLE
+#ifdef CONFIG_CPUFREQ
 int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
+#else
+static inline int acpi_set_pdc_bits(unsigned int acpi_id,
+                                    XEN_GUEST_HANDLE(uint32) pdc)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 6096560d3c..51d3ee404f 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,10 +5,23 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+#ifdef CONFIG_CPUFREQ
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
-long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 int set_cppc_pminfo(unsigned int acpi_id,
                     const struct xen_processor_cppc *cppc_data);
+#else
+static inline int set_px_pminfo(uint32_t acpi_id,
+                                struct xen_processor_performance *perf)
+{
+    return -EOPNOTSUPP;
+}
+static inline int set_cppc_pminfo(unsigned int acpi_id,
+                                  const struct xen_processor_cppc *cppc_data)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..084f3835dc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1259,6 +1259,7 @@ extern enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
 } cpufreq_controller;
 
+#ifdef CONFIG_CPUFREQ
 static always_inline bool is_cpufreq_controller(const struct domain *d)
 {
     /*
@@ -1274,6 +1275,12 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
     return (is_pv_domain(d) && is_hardware_domain(d) &&
             cpufreq_controller == FREQCTL_dom0_kernel);
 }
+#else
+static always_inline bool is_cpufreq_controller(const struct domain *d)
+{
+    return false;
+}
+#endif
 
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
-- 
2.25.1


