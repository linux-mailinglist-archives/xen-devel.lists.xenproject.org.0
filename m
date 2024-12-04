Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E78C9E352F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 09:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848355.1263263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkgs-0003el-H0; Wed, 04 Dec 2024 08:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848355.1263263; Wed, 04 Dec 2024 08:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkgs-0003cv-EB; Wed, 04 Dec 2024 08:24:58 +0000
Received: by outflank-mailman (input) for mailman id 848355;
 Wed, 04 Dec 2024 08:24:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5h6=S5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIkgq-0003co-EQ
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 08:24:56 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20604.outbound.protection.outlook.com
 [2a01:111:f403:2405::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c6d7a96-b219-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 09:24:54 +0100 (CET)
Received: from MN2PR06CA0004.namprd06.prod.outlook.com (2603:10b6:208:23d::9)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 08:24:49 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::20) by MN2PR06CA0004.outlook.office365.com
 (2603:10b6:208:23d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 4 Dec 2024 08:24:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 08:24:49 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 02:24:46 -0600
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
X-Inumbo-ID: 3c6d7a96-b219-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qsja8VcdRQVNsKZAvfZ6m0ey5grOR/c0NxbpCOGeHQGEr8+3MTgc7Rsru9SRhKfqnataUd2efcSOFeGIKM65f7etBe+Fe41JAyvXCoiBZI5khKz7xxvDoAC76NueqptEf/ww80wvyZfhsEHOmQu+YR+hTLlm3qRFP4AEuUnNrR0SX33MsUeN/mhkxvSwyiw4gTEyKYZCdonUVQdRrTyULTPtDX+CY4fGa5ub30OaN4LxurjLvnwDxkGOfYznp8OrwaR6nceOLMewuWW+PrFia/7y663YwBtsO9JrEmNPCsU7wfcl7S85UmXymoqHogngwkb00NVdEaaFgLLgSldrzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq011CqfPYWDc9yuGWnE6O3tXd54B0zHXUEi+oQM+2I=;
 b=NETLOXHn4+uajEe0jXm2eanka8QGrL/bBOcpif9QV5Ce1E7KAgCK3ucvQhBdtoO3/J/41DPTfMZ4DmcH+Mhl6uqYWMUHCuOefmKIV4t+uRtp+AiR3ruYro3f8MXWVXWRi4UErMFkmPQLInECwKuBAyOCgAcJCm+h4T3R1aAqJ2t9RJUFs3syJCsKp6R2NfvsRNYcNpkDAf1/kOoRpvBAaaooHtNru7R+EJLbOEIPQKi8ZbX90U7jjqAiayJUBdb91qErMLg9quWzeb7mpHq/VyPB0VdS4LUtNa0TZfUfebYDJRjUykYwz0AUBhMJP0sXiRjqELeK/4jHc7Olhd41Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nq011CqfPYWDc9yuGWnE6O3tXd54B0zHXUEi+oQM+2I=;
 b=Ynwb6YPCJGy0siJpkD4Xf9x3qwEXs4H9g1CwzO9DKNIzGykr+iE3i2EbTHZLcqg58/i3EqMO4mL5Rg5YEDzicjf7f+dEzeQ/FalbsWF0FDO+PNofzrcHosRvridKOAZSGOvLtKyfkbiDCjB38j10H2BEF69UrsqEV0Aq7d5eHI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, "Penny
 Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/4] xen/acpi: introduce cppc performance hypercall
Date: Wed, 4 Dec 2024 16:24:26 +0800
Message-ID: <20241204082430.469092-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 247b0757-60c5-4b65-9706-08dd143d1e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVdNWUtFdkRnMG9pT2l3NTdaTU14VUNSU3hzVDNzenYyZ3ZuaWJsYmNqTFV6?=
 =?utf-8?B?Qm8zWEtXQWV1KzFwSzJFY2hzbFFSRnhmNG4wVk42dG1WVDZpVWwyd1JrUnNE?=
 =?utf-8?B?YWtGQ3ZtaCtvOXlMSlN0dGRJUTRSbHZXcmZzT0xidWk4NUdIKzdhWnNiYUo5?=
 =?utf-8?B?VjlEdnpuNCtVUjFtMVY4NGFQTnJHSm04TWZWeG8yckxsY2laS01SY2tULy9a?=
 =?utf-8?B?R081SnNjVHRlWElxVHd0MHk2b1pTZDFZZkZtSU9OelBkbUJ4UXAwVGJhZ0do?=
 =?utf-8?B?dGtMU3BsL0k5aVozNTFoNkNOMjhTd0pyNWJHcTI3eFFXd3g4UXNid0NlMDBX?=
 =?utf-8?B?U2lXYnVUSzRkdkxFU1d3TGJaZXpIV1ZHM1Q1dW54WXBiRTlGTG1jcmdUUWtM?=
 =?utf-8?B?RUVZR3BHMlVwWHpoK1dod0dGMzdIM05uRS81WGRQdHNqK0FQK2xMMmh3eGlm?=
 =?utf-8?B?N2lwMkkycVV3b0syeW1zakNQM2lFVUJPaHFmQWU5TFVNVDY4bUJxL2hZQnV5?=
 =?utf-8?B?d1dXSW0xSXVjZ29QQ2hGdVZLOTBSR1B0UTJBbCtRU2Q0S3hPbFNXakRUL3dP?=
 =?utf-8?B?YTgwMmswTXFWUnA1S1hJV3lZd0JDb0pCdVBFMHVWbHVoemV3WFdLcmlyT0RH?=
 =?utf-8?B?SURjMXJJOVV4MGU3cC9iK00raU1LcUZta1ZCQk00eVBqZ3ppcmRiSkFFUytW?=
 =?utf-8?B?VmppdkNXYWpqVGs3M2lpUzFYWFN6aXViRit3emEvTGxrOGl5c1dPZTIzNHJ5?=
 =?utf-8?B?MDRqeGhlVHhrRUgrT3NqUmp5czNSZ1dSYmlNaGorNC9uakpGVHpUWG5nbGJv?=
 =?utf-8?B?SzdveEh3b00zLys1S00zTko0MFBhalVlSEdLMnkzU2ZHcjFDaU5zemw3UEZw?=
 =?utf-8?B?OXM0ZEUyNUNENVo2MWJ3YXlUaGdISlFCWUJ4SE1WdUdCYldTSER4VWNheHBa?=
 =?utf-8?B?SERhTHZVYWd0dDdSRDF6em1rV1JZRzhuM1lHRHNuZjJnMzk2ZWxhV0s2RGdy?=
 =?utf-8?B?T0NjOTFJVWh2ZFhVM3RrNmx5S2RrWVZGTktEVTNiaG1UOWV1SVljRUp3Rkhw?=
 =?utf-8?B?UFhUUExZR2lCSHM4UGs1ZnlJVGpNS2t5REZWVGU4SWVweW1LeFZuSjdVQ1Zr?=
 =?utf-8?B?RFg5bHR4R0FrbTNYcWJHbTc1MG95cDlXRzNjNno0ZFVheDdiN0QrNDlnTWlL?=
 =?utf-8?B?T1p6UlJSeFNiTVM0Q3o1MFBBY1lZbjBnQmk4UklacTExOTZ0bGxySExBaTdN?=
 =?utf-8?B?U0I2bzFYcnBockpaQityUE9CVTJxd3FEd1Z3OXpkaVlnMzUyaXNHcFc4M1h3?=
 =?utf-8?B?M3p3dWFHZlB0VGNNQWova1h5MWRZTE5US1JJN1JQVnRJc0tVcXpCeVBsY0pz?=
 =?utf-8?B?aGptUEp3WEN0OGlNUTVGKzFmTnZ5UW9Mc0YxMFI3MnZETUVDZnc3dXVLemVD?=
 =?utf-8?B?RDRtZjBHTUc3bG1NR242ZnZMcWFOcGtBaEVvVnBHQ2x2ZE1qRzUvU3diVlRi?=
 =?utf-8?B?ZGcvNTZBMklSNWx0aVB3MTBkN3BTR0ptWjNuY0k0d0tjbkJEcENNYXVaeWx3?=
 =?utf-8?B?K0tLcExyTnlGOWpkVFg5MVVVVTVkZXpFSTU5bXQ2TzJBR2J0M3liVGkzUW1K?=
 =?utf-8?B?MWtQRkNMZkhESm5iQTM5cXc3TG1XeWdxanNtYzJ4V3BtNktjZmdndGtIUWls?=
 =?utf-8?B?Y0sxa08zYWdkRGYxTHQxREhtQk40ZDdzblNMSkdWUmJSYnZnSkxOMldJejNW?=
 =?utf-8?B?RkhsSHZqelVtLzErQWxJNmVEK2IxTmVoSnFFSUlZZmZxbU1wMFVMMGgyOTVJ?=
 =?utf-8?B?M0xlcFVRdWNHNUxWN2NBRDdiNVAwM2wrN0lGVDlIWTZkUzkxaFNMM0ZiNlZV?=
 =?utf-8?B?SzBZWnF4clhDeVJYY21IWGVxRjBnTHk0RzdydE9jOVJ5YTZWYW9RaGV6K1dM?=
 =?utf-8?B?SWZnRFBDbjFSa3lFMC9BTExvTTc1NGIwbXduWXo0T0h3alE1eUFTdFB0a3dr?=
 =?utf-8?B?Z1NneHBiTXB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 08:24:49.5058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 247b0757-60c5-4b65-9706-08dd143d1e9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647

When running as Xen dom0 PVH guest, MADT table is customized
and may have the "wrong" UID processor number, which is
inconsistent with the UID in Processor entry in native DSDT.

As a result, during ACPI boot-up for dom0, linux fails to set
up proper processor logical id <-> physical id map(acpi_map_cpuid).
Furthermore, It leads to that some ACPI processor feature capibility,
like per-cpu cpc_desc structure, failed to be correctly stored
and processed.

With upstreaming "amd-pstate CPU Performance Scaling Driver"(
https://lore.kernel.org/all/20241203081111.463400-1-Penny.Zheng@amd.com/)
to Xen community, amd-pstate driver is supported on Xen platform.
And as Xen is uncapable of parsing the ACPI dynamic table, like _CPC
entry, this patch serie introduces a new sub-hypercall XEN_PM_CPPC
to deliver CPPC performance capability data.

This patch serie is based on commit "xen/acpi: upload power and performance
related data from a PVH dom0"(
https://patchwork.kernel.org/project/xen-devel/patch/20241203225338.1336-1-jason.andryuk@amd.com/),
which is still under review.

Penny Zheng (3):
  acpi/cppc: extract _cpc entry parsing logic
  xen/cppc: get xen-required cppc perf caps data
  xen/cppc: introduce cppc data upload sub-hypercall

Roger Pau Monné (1):
  xen/acpi: upload power and performance related data from a PVH dom0

 drivers/acpi/cppc_acpi.c         | 206 +++++++++++++++-----
 drivers/xen/pcpu.c               |   3 +-
 drivers/xen/xen-acpi-processor.c | 320 +++++++++++++++++++++++++++++--
 include/acpi/cppc_acpi.h         |   5 +
 include/acpi/processor.h         |   2 +
 include/xen/interface/platform.h |  11 ++
 include/xen/xen.h                |   2 +-
 7 files changed, 477 insertions(+), 72 deletions(-)

-- 
2.34.1


