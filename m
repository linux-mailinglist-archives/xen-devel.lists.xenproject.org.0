Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLiXIMd5hmmVNwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 07 Feb 2026 00:31:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F110425C
	for <lists+xen-devel@lfdr.de>; Sat, 07 Feb 2026 00:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1224014.1531331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voVHM-00079c-36; Fri, 06 Feb 2026 23:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1224014.1531331; Fri, 06 Feb 2026 23:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voVHL-00078A-VN; Fri, 06 Feb 2026 23:30:23 +0000
Received: by outflank-mailman (input) for mailman id 1224014;
 Fri, 06 Feb 2026 23:30:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tkN=AK=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1voVHK-000784-LP
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 23:30:22 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9feb7a6-03b3-11f1-9ccf-f158ae23cfc8;
 Sat, 07 Feb 2026 00:30:16 +0100 (CET)
Received: from SA1PR04CA0008.namprd04.prod.outlook.com (2603:10b6:806:2ce::13)
 by SJ1PR12MB6337.namprd12.prod.outlook.com (2603:10b6:a03:456::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Fri, 6 Feb
 2026 23:30:11 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::68) by SA1PR04CA0008.outlook.office365.com
 (2603:10b6:806:2ce::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Fri,
 6 Feb 2026 23:30:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:30:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 17:30:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 15:30:07 -0800
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Feb 2026 17:30:07 -0600
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
X-Inumbo-ID: c9feb7a6-03b3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdAZsrjptcoaV9g61fEmjozNwviYhCE2HOZymQm1IZnyqgtni8sSiaXiCo9c2svWR9OgIoYRI7/OpmOEPm2jrmtzBu3CnsiIR01btz21oQiEU1hpF/eyplGT2PyqoIQJFZfva9qzR4m2gG30qo2S+QnJ2wsWEBrM0PShUH3fUyk3DStXa4LKHfLMy2icizcSlD8hyRRe/N/Iu9J02Bj3UyU9H1Q05KrZmELoyQx1lsNVj5y9G9Y9rdmwaKpeisjEgS59QU8L3zscykuAjUG70wMW+rAQ1qdld8FYEHswe1XeVq6iNqjILHxfIJ+fYyHvXUq7YnwGyb+0ZOEiWO9xdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZmR/VYUbsIrA583I6+recTTPOLRPVLSgfhbcINoDhs=;
 b=sOaoIKvKqzctSq2bwHvBz3I6YEjiBoSBnrSdvQHk0eM15hAlnXnRE5KljjmNgdFRLlSkXaI5LL7wjKSb9bFWE3q3+IB7As7Kck7bbwcvWq65gutAN3RFZ3nWk7WwM722B8ma+Ge6nBfg64Cdv+BR/27Kxmu8pAREXuUOcZ6K7UrJLYAPhs0SOh/S2HE11JJQnI7VVb3i78iiQCtVOZUfapSzyxeTTN6D0bnx5a8FNNUa0GgsNZXY6j1ag/V7jLdTaUA4g7zA3klJ/n7fEXBb7Jt8YQQNmfXayn32JulTO97mDeRXG5UDfj0OABlAWOD11bM5aWJlM57JdHkOaTeJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZmR/VYUbsIrA583I6+recTTPOLRPVLSgfhbcINoDhs=;
 b=oVeh7jX3F57LC0hjoqWdHYuPuKIUXqxzX02tQIHjBT1JOETpsD1n1jBVPbbDHbumQnuv8Lt8jH8FqWb9xKViKTlYvvKTCRMRSuh/+RBu3ItRzYwQxkscTRrSuMLdDq42zA+y2Cy10MMi+Z0+XABx3qHFuWdqfMYrcEsrkE4gEoQ=
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
Subject: [PATCH v2] x86/cpufreq: Add Kconfig option for CPU frequency scaling
Date: Fri, 6 Feb 2026 15:30:05 -0800
Message-ID: <20260206233005.417233-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|SJ1PR12MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de52961-f10e-4a7e-ad93-08de65d7ab66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5DXQoXg4WKg32+JHax/7HZix5LnPCZq4KkgEeAp/tsyQZYWVIHfG+xpwwd20?=
 =?us-ascii?Q?fQsC5DHMKs4ASLJDsppaZTFJcUVFo6nekgnnf2qWKwKC3Gm4/beM5q7ErRQg?=
 =?us-ascii?Q?uwBo0m1dwP9YXbn9LYlNp8gx3TXpXGR5CI29Ltxaa04GuAccAZ3NQHdWa8KL?=
 =?us-ascii?Q?LlyXNp9aWkDqXIitJf3lwzO5LJ5ZXG+og9WDHGOQEuqQ+f1MWqjTOkHdIHB5?=
 =?us-ascii?Q?ZgX3EdUO2zLFdV9Mdzl9+tfHzzvhMr4KmVAUrNLzrZ7WCXMslsjiidGIMIH1?=
 =?us-ascii?Q?9/vD4P9alG8qFhNfamXW+QquyRBRdW7QHAdn+HHX1yuxccZSWRINVduX7GGx?=
 =?us-ascii?Q?hh188s21MQqRZyLiHkix72a+bmc3KEZsI6x4+0Bf9xsxOKXWgH41WNGH9YFF?=
 =?us-ascii?Q?1l/rGC9CwWS5IPf8AmciXH69lKSlH8a1vBCr8vAUMKZQv5K1vXLH843d6lXI?=
 =?us-ascii?Q?yQjHE5YMibebsfp/PQPU5jgtzyPh8c/9r0cAHd1tzn+jFjp8/PB01sx/BXQd?=
 =?us-ascii?Q?guw77zLhMVBFsmb2OvkSZ3yi2hmw5iFM1YoABAya1JW6d0TOevXLL2eBaen8?=
 =?us-ascii?Q?N5dWvqoxKcvtbWgWD6OqOXNsxNb5HWQ/H76GZwkZ5R69oAQeGvgjiMVL6h9N?=
 =?us-ascii?Q?NtlzeK70WM/TP6OnuUL1Oeqh2P/HSrDteBrVmCp0pyclbajbF84hZ3nJOgNs?=
 =?us-ascii?Q?MagrshhcFNQ5M9E6/PdbuxgzVzFJIRsTJMiFmiKAC6FsDEHWYCokYnU8iS8D?=
 =?us-ascii?Q?e8hPAPIdZ3yQ9EnzvEy7hT6yO7IBUKHFb1YsXKf2O058GuLtPVJGyhk7t5Sa?=
 =?us-ascii?Q?Q3myENNaYtiofsdauBMD//a2CC+Ipq4L2I7OWG7gqStOk2F9vGkNTIFXfn58?=
 =?us-ascii?Q?VTt+BvNyfS3jXjd0uvzm+yjSvYhxxRM28WjqBJnd/OL6ykPYxJ32YhCAx7AT?=
 =?us-ascii?Q?1d2ibFhfTHrY2hd1cwvjQTrqg7oGFFkC8wPekdAIPxFIB13R21lZq9JD6Oe/?=
 =?us-ascii?Q?vBH+LxwpAiunDJ4ipOkRJDEVgHazKfZWbVY4teT4+KOsss0143pyQ3z7RUse?=
 =?us-ascii?Q?ZP7ScJ/gcrjxQqBAy2dNMDFRDWPi3ap8rWq1BgCBlI4i6wjeL/3qLVO0CFLq?=
 =?us-ascii?Q?ZVbHMkQfyunvbsHcEzoUAm07PxZqqUqU60V/JxbJbIOTP7HSfo6BwU4S7Vdh?=
 =?us-ascii?Q?zUuZrK+3bp0SxKHHdoCFB5ndvA4j6C08LqQ5sulbYTgUg/dcQGTKXdBarL2u?=
 =?us-ascii?Q?4Vuie3G7YmNU27WkPXeJyS3/fB+9upKx37I7raI9t9lxzCYtV+9FKnDaC+sH?=
 =?us-ascii?Q?aXWigA+kvDSkbiHzkQLw3a2P0RlpvgxrAFElsnj4EdCk324ZfGkwSbPLtAbd?=
 =?us-ascii?Q?5p493ARRkMsCzbT5BPadxU6se4VaOnkkW953MEaUi8nzsRs6pX7o6TS6nmg1?=
 =?us-ascii?Q?GMpgGqp9q7Xbk9qGcs8/mNji/fcJ09CsvjFxDvIOl4m5d9/pnBW84TgNiQjC?=
 =?us-ascii?Q?QoQLrbDoPqUyXJ6K9tQeJ5TtGXrCssejE5ys1lFfYZmWZYecw93O5+HnaCSn?=
 =?us-ascii?Q?yZF28eDfRRZFmxz0ZWIWNTPda0Zi5alWPlC76nrrd06SXiZ9SQXWcC/e5k4V?=
 =?us-ascii?Q?TefXbFY78fhLJSr9MqmL28r2BLC6YMx08hK6d6HVWLAegGdTmtH/qSmOPK2u?=
 =?us-ascii?Q?RqOtVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tRTr2GPFaDm1eDPQn++e/opp5JtEBnCjApJz+Gs2l5SPytPK2nnDcmC8ccBI5Nevdbq7ZBSqzobp3SoOBN+2whe1da4lyoEd7BA8c7VdkTezntR4Vm606YN4JdyvbaaWN71vTY9jV2H+EN4QPEXhdfcvk32LpGutO/bhYAdTAxaO17KIS+54Lba1JV1VlMOMklq/bUy4/1i8Uq7dF8F07drrNjlEFunrRo6RaR23tcWlTw6pYFt5nZVIVI8uWuFeqd8iPXK+fBqkEHWvVMlKpW3WF8tZv28XLj3yFqLfchtQg0GBW4KQd3j6KWrjfFVNM5AlGxF8jzEAEXUpE+wLWtVlTLK07N51eYqw7dLp5wZ/VXRxZW9U7YQFdZGtd+IAMZEuAPCkS8EDo9CRcgpicpMY5WRITEnKaoNOBa+tIupOP8iZNs+tCX1wyLeHcNps
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:30:10.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de52961-f10e-4a7e-ad93-08de65d7ab66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6337
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: B54F110425C
X-Rspamd-Action: no action

Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
disabled at build time. When disabled, this removes cpufreq code
from the build.

Add stubs where necessary.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add stubs for cpufreq_add/del_cpu
- also gate hwp_active
---
 xen/arch/x86/acpi/Makefile                |  2 +-
 xen/common/Kconfig                        |  4 ++--
 xen/drivers/Makefile                      |  2 +-
 xen/drivers/cpufreq/Kconfig               | 16 +++++++++++++++-
 xen/include/acpi/cpufreq/cpufreq.h        | 13 ++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |  3 ---
 xen/include/xen/acpi.h                    |  8 +++++++-
 xen/include/xen/pmstat.h                  | 15 ++++++++++++++-
 xen/include/xen/sched.h                   |  9 +++++++--
 9 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/acpi/Makefile b/xen/arch/x86/acpi/Makefile
index 041377e2bb..aa476f65d5 100644
--- a/xen/arch/x86/acpi/Makefile
+++ b/xen/arch/x86/acpi/Makefile
@@ -1,4 +1,4 @@
-obj-y += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 
 obj-y += lib.o power.o cpu_idle.o cpuidle_menu.o
 obj-bin-y += boot.init.o wakeup_prot.o
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..cddd7337bb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -652,7 +652,7 @@ endmenu
 
 config PM_OP
 	bool "Enable Performance Management Operation"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && CPUFREQ && SYSCTL
 	default y
 	help
 	  This option shall enable userspace performance management control
@@ -660,7 +660,7 @@ config PM_OP
 
 config PM_STATS
 	bool "Enable Performance Management Statistics"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && CPUFREQ && SYSCTL
 	default y
 	help
 	  Enable collection of performance management statistics to aid in
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
diff --git a/xen/drivers/cpufreq/Kconfig b/xen/drivers/cpufreq/Kconfig
index cce80f4aec..49631f92de 100644
--- a/xen/drivers/cpufreq/Kconfig
+++ b/xen/drivers/cpufreq/Kconfig
@@ -1,3 +1,17 @@
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
+
+	  If unsure, say Y.
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0171ccf0ba..9529730d9c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
 
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 
+#ifdef CONFIG_CPUFREQ
+int  cpufreq_add_cpu(unsigned int cpu);
+int  cpufreq_del_cpu(unsigned int cpu);
+
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
+#else
+static inline int  cpufreq_add_cpu(unsigned int cpu) { return -ENOSYS; }
+static inline int  cpufreq_del_cpu(unsigned int cpu) { return -ENOSYS; }
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
index 90635ba0f3..7077c27150 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -185,8 +185,14 @@ static inline unsigned int acpi_get_csubstate_limit(void) { return 0; }
 static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
 #endif
 
-#ifdef XEN_GUEST_HANDLE
+#if defined(XEN_GUEST_HANDLE) && defined(CONFIG_CPUFREQ)
 int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
+#elif defined(XEN_GUEST_HANDLE)
+static inline int acpi_set_pdc_bits(unsigned int acpi_id,
+                                    XEN_GUEST_HANDLE(uint32) pdc)
+{
+    return -ENOSYS;
+}
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 6096560d3c..4efddad438 100644
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
+    return -ENOSYS;
+}
+static inline int set_cppc_pminfo(unsigned int acpi_id,
+                                  const struct xen_processor_cppc *cppc_data)
+{
+    return -ENOSYS;
+}
+#endif
+long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..1b431fc726 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1255,9 +1255,14 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 
-extern enum cpufreq_controller {
+enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
-} cpufreq_controller;
+};
+#ifdef CONFIG_CPUFREQ
+extern enum cpufreq_controller cpufreq_controller;
+#else
+#define cpufreq_controller FREQCTL_none
+#endif
 
 static always_inline bool is_cpufreq_controller(const struct domain *d)
 {
-- 
2.25.1


