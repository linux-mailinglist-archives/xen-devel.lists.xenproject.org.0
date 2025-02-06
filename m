Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1BA2A339
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882565.1292742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKR-0002zf-Ka; Thu, 06 Feb 2025 08:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882565.1292742; Thu, 06 Feb 2025 08:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKR-0002ti-D4; Thu, 06 Feb 2025 08:33:43 +0000
Received: by outflank-mailman (input) for mailman id 882565;
 Thu, 06 Feb 2025 08:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKP-0000gq-VM
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:41 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 108875f5-e465-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 09:33:40 +0100 (CET)
Received: from BN8PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:d4::14)
 by IA1PR12MB6188.namprd12.prod.outlook.com (2603:10b6:208:3e4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 6 Feb
 2025 08:33:37 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::ad) by BN8PR04CA0040.outlook.office365.com
 (2603:10b6:408:d4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Thu,
 6 Feb 2025 08:33:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:32 -0600
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
X-Inumbo-ID: 108875f5-e465-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B45LA+5wao4HpZlDtbHQM815XLh68NXlB3I2dbJKeRg64SlHFvAsu2/kES0nB3XpqcffRQLVpGwy3c1+Vytni5og+tfQGjiJ3N3DZ4Tz9XJYoduRFXSeUX7aCTi2v0VHFAMvntI1hstSQgTrl0NyIC8lsTK3J16cUD8VJPjdgt1j7/pv4pjPtwlpjcH/zwT64QwEEcqLxN50htTtXgSaMHIlfnWkxDF3Q74sj7sbGsRwXkdUtqEkqgQEvqo0UiKON4jMz7vbQxMmZ3KCkQ/po+9nwgDls9BQYWY5ohs/AI5cdtS7l9gOs2XsVjlMKkntLUbD8l9d1YYkYEXt33R3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Rt9esRODwdhmRPre4CEkWV3Z2Y80I1RmtW4o743N6Y=;
 b=wWJ/KA1WKh7ymYZOtvIv3R2KtEzMvqf2X9hn5nqCP3S+iGGuBXVdNtZ7Ir0rA9DZH+XiYwiAdf9Ova/wiRFEcF8f3tN6DpiZ+JjXzC5Z7fH7jtTXImeLwaGT1o0jb6hhoWNg4C0+8pqD7mwH8QIRJFaVSzAam8Gz6EVOLfkNblP0i8QN7OgkrXBObgImXS7cPGUyEMYwCNu1mBLEm5ktA/Tle0yUZdFbc1nG08e0gcKpjPTaqx0EYKDuv9dxfPIeAOIj2dsAUe1oSH5Rg0FzfjOyzKBE1BZ9oCXAeJwPkFDvF1ieNdM9hVmsy5YGfU9GLmqcav9cS+KK6TnkM1cHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rt9esRODwdhmRPre4CEkWV3Z2Y80I1RmtW4o743N6Y=;
 b=x5OHYmNobbJLOFpbnQaVriFfB8qQmhWjqt+mCWcyfKV/yXah5jUuOCyBWezVXMOuGNmXK/QOy/6Ys8zd2Agfrj4j0W71NsKLHdd9mvimxq+lsDOk6tkj6W7pln7kz2qylcLvUx90MZlV+g3ibsmmfFyF7uagQKo8J7hGLEmCLPg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<penny.zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v2 07/11] x86/cpufreq: add "cpufreq=amd-cppc,active" para
Date: Thu, 6 Feb 2025 16:32:51 +0800
Message-ID: <20250206083255.1296363-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA1PR12MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d834f5c-fa6c-400f-75fd-08dd4688f345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FIVYwRWBi/7qc5hc1fGNfW7myA2Jrcf3T/qf8ejdeZQBVidR5h3lfgUDXEGv?=
 =?us-ascii?Q?d2hRGjHV/wl/45y5WCWxiGWDpyXjmq/mfpJ1NWE0ifo/uP/wFK+/Oyi6bbAj?=
 =?us-ascii?Q?CzWgIl2byMtXKjGmraugCGG7jXIULndH76UEGsmEzUcL7EYTH3/WgOHcDP1Y?=
 =?us-ascii?Q?YikQqFbARo4VuCnvh2u39z+jzIiDTdvNFyuHu3ybX+UZj1HOEWKAzxS5e2c6?=
 =?us-ascii?Q?zJWOCIuNRVMGUgcGLqV9cKrGUKe2STLL+b0itO1FBeJ5D/4YqWIjG6Q6mFMv?=
 =?us-ascii?Q?NQ8aUg6yEcUe+iKPKA22mznI+IcTqteu8Oj+jnDW3N7uvR5FAvqncVl5nsBH?=
 =?us-ascii?Q?0mk2jxkB/K2UkRD2clb/+bSM3po/Ryqqtl4bFDwqAIxw7Aepq61a7j6h5vut?=
 =?us-ascii?Q?lXmiw1bcncGrONGQ3kGFRu5/tzMIY5DcDdsBq32vMcdi6xfW9JCuO5uxIiXj?=
 =?us-ascii?Q?3tVax8qOFwnQhzK183jQ6iJjP0soaheaqWnhfk9kAuAEgcy1yyKrxXr0CTqF?=
 =?us-ascii?Q?69rIxUmwx9dB1ULq8WeQsI0faZSlRQiSDBGuB0ErWCCXHWx438Cis7Syf61s?=
 =?us-ascii?Q?pT2mtifieokw2b/TYy34nwuwPrEQkpCgbnnE3sCJ5xR1ad+7Sn1VmIZ+bgTu?=
 =?us-ascii?Q?L6xKUid/UndNXgRlFN0am5CcZo92tls+NlsOZ++tus2uKvlpWv9hw4NVp8fq?=
 =?us-ascii?Q?tFUQKYSb18nfX/aaTb6zRhN+UZ7tyJqFxDilGbcRxszeBbfwNMsPn2kfLA0F?=
 =?us-ascii?Q?k4sSyJrJXglk2BBhqwtY0/Avt0d1cFglErMGk8j2EFnxXN+oodCd+8eS2kO0?=
 =?us-ascii?Q?/XEPKegYqse8yNVB05xys+C3/3g8Zj90/OL83D2LRd2gmc+R/jn9G/wui17N?=
 =?us-ascii?Q?RlZtoQaKnI1Y9Oe3FWXsIWGdb+QWn1eJszqKAekqK0Wxxlrm5vGh5JA3l9fI?=
 =?us-ascii?Q?IQCzQ/r6KuMOwbZbg7nWEwCPJsoOLwmKAt0q8wAafzHawE58sRQdSM3Eak31?=
 =?us-ascii?Q?jdqgDwKUaLcAhge1lteD1XetmtmkHhGZunLt3xl999BaO/NG0MDnV5tNd2k7?=
 =?us-ascii?Q?mVAni42uYSdL+bm08LIp+G9IFkmd09QC3f+YcNRRk8nWJf9BvjS+WCpsI+Hs?=
 =?us-ascii?Q?WufC/zDnfkuEBfXeNawCmJuDQt+wcBl4F65ZAXPI+EF6WDZ2JibN1aQC5fhL?=
 =?us-ascii?Q?vyO30tw0Rc+JDoqUULX3kJDeI2raTvJmRs60Qcgi71nf9WAbVYrlbL0RP3T1?=
 =?us-ascii?Q?F/MF4K5lqCIjKtxOzc6xxbLI0adz9BDzj2B1sljmc6/48POlh9uZhhKYgIX4?=
 =?us-ascii?Q?9EQkLp/Jlru4H6aZKBjS9CPBKr/j5yXhign3cgzv+QY+/Wdl/KvTSh/ffGiO?=
 =?us-ascii?Q?jVb0F/wMAjKPix2kMg77MuUYaVoBleRVbNL1VZVSvXfzB6SzXg0bmjQthnAu?=
 =?us-ascii?Q?j5u/tiLXYce+4wp41AcGD0NrDUEe75FKkMnOfndYv8m9wenwQ+TBfEvOe9/v?=
 =?us-ascii?Q?PiTvAuV9KoH2AK4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:36.6765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d834f5c-fa6c-400f-75fd-08dd4688f345
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6188

From: Penny Zheng <penny.zheng@amd.com>

The amd-cppc driver may support multiple working modes, passive and active.

Introduce `active` tag for users to explicitly select active mode and a new
variable `opt_cpufreq_active` to keep track of which mode is currently enabled.
Specific implementation will be introduced in the following commits.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Remove pointless initializer
- Move driver registration change to the next commit
---
 docs/misc/xen-command-line.pandoc    | 8 +++++++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 9 +++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 78cfb8a02e..13f650270d 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[active][,verbose]]`
 
 > Default: `xen`
 
@@ -538,6 +538,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
   on supported AMD hardware to provide finer grained frequency control mechanism.
   The default is disabled. If `amd-cppc` is selected, but hardware support
   is not available, Xen will fallback to cpufreq=xen.
+* `active` is a boolean to enable amd-cppc driver in active(autonomous) mode.
+  In this mode, users could provide a hint with energy performance preference
+  register to the hardware if they want to bias toward performance(0x0) or
+  energy efficiency(0xff), then CPPC power algorithm will calculate the runtime
+  workload and adjust the realtime cores frequency according to the power supply
+  and thermal, core voltage and some other hardware conditions.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index f14e7a6638..1742c57170 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -33,6 +33,8 @@
 #define amd_cppc_warn(fmt, args...)                         \
     printk(XENLOG_WARNING "AMD_CPPC: CPU%u warning: " fmt, cpu, ## args)
 
+static bool __ro_after_init opt_cpufreq_active;
+
 struct amd_cppc_drv_data
 {
     struct xen_processor_cppc *cppc_data;
@@ -80,6 +82,13 @@ static bool __init amd_cppc_handle_option(const char *s, const char *end)
         return true;
     }
 
+    ret = parse_boolean("active", s, end);
+    if ( ret >= 0 )
+    {
+        opt_cpufreq_active = ret;
+        return true;
+    }
+
     return false;
 }
 
-- 
2.34.1


