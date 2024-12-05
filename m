Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC739E4D53
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 06:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848856.1263636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4e7-00021P-Bt; Thu, 05 Dec 2024 05:43:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848856.1263636; Thu, 05 Dec 2024 05:43:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ4e7-0001zz-8H; Thu, 05 Dec 2024 05:43:27 +0000
Received: by outflank-mailman (input) for mailman id 848856;
 Thu, 05 Dec 2024 05:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=coHJ=S6=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tJ4e6-0001z8-HX
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 05:43:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:200a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d776746d-b2cb-11ef-a0d5-8be0dac302b0;
 Thu, 05 Dec 2024 06:43:25 +0100 (CET)
Received: from CYZPR20CA0009.namprd20.prod.outlook.com (2603:10b6:930:a2::20)
 by PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 05:43:18 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:a2:cafe::fe) by CYZPR20CA0009.outlook.office365.com
 (2603:10b6:930:a2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.10 via Frontend Transport; Thu,
 5 Dec 2024 05:43:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Thu, 5 Dec 2024 05:43:18 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 23:43:15 -0600
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
X-Inumbo-ID: d776746d-b2cb-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BV+VRHVXPtcui9yie5MgDp7fdnTwjlf9+arzMsN3Yu848zLqGHXLQieaqhLT9SoZScSN+HjLHZQAiA0Fr/J9TbyffUKZ024+wU0fDs9Tx92RKAVt0ysZ+3lO2XcWQWL2GLglqdAToMM2BjUSfeDZjtpcDqvEc4wMJyIHhVCBBvvKzekLQPH/+21Vzi+Nwge3msIabTBmSPkSIgBGU4j7lHD4N80x0jH+UjDRyUrdyfUAFeCG+dntXPz0zAPFXVfSKhOw62Oo3d6DUEKq76HC50mkHnQGBtReB18XFJyEhD4s1QcK4nnPSYCzkMw09FfzCKk5IbEzLg5Wxd0xplCuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJv3VOfPiqxlGpmdzLE83at11S7zrrzGSH5aVPpRpZo=;
 b=SpETUT0lHVhDULEaWxZDyz2o48sz4zLTGqbMEKe1DhjPymCjPrVn8SOr21MsJh45+c2iS4FC1+R8+9amT+q/xyblBd4kYFDNEmG0pbZf1GqkPHEG8SbcHV1lrE9LzKuD3yDgqj+J/67asDzxN2/A8Lbx7XUJ/876J1ubv65eTo2Ey8AvuT760UiRiNfOk1w4srdYwEPnl8W07k3uJNAy7cIz/qVoqnpqY5nUmRPdOcan3pPTD2kcmg5QoaEkPqm73Hix6lvStABrKohV47gPzJbiSvPcaN07mZw5mlp7FzkYeNO7meIA9nYsutqfLJzYAru5RI7ZTGDXhlSZrKU7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJv3VOfPiqxlGpmdzLE83at11S7zrrzGSH5aVPpRpZo=;
 b=puNwNLE4uDItAr5X/2lH5ZpVVO1hCvOHRcnKeH9A03CdYmosiL9jyyHtpb/diWIbrehszEjVtXVJiF25LGItKiXC4cxaIlh4OGNzZTjkpPaIgu2UbkXlJoYU9mZmnwbYa7b2Pahp4Jb2Q4bRmOBGpwVhW1FdoLt82GyezfzVsoA=
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
Subject: [PATCH v2 0/4] xen/acpi: introduce cppc performance hypercall
Date: Thu, 5 Dec 2024 13:42:48 +0800
Message-ID: <20241205054252.471761-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH7PR12MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 60210363-8d12-4846-727b-08dd14efb8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjNlZ2hGUHVxaVJCK3VSN05pK1RZUExuWGZDQWo2cG41aThWRGs2MWQ4bm5O?=
 =?utf-8?B?SDRxZEpXbm81RjF3UEEwWHk2aytaQklKaDZZaDJkRUs2MnRLdFZlZjNOWjRL?=
 =?utf-8?B?aXNyUUR3NGpMa1UyaExpWm9LS01QVVhhNzVwb29GbGt0ZkdTRm4wZG1LUWZK?=
 =?utf-8?B?c29udjVwZzlGTGdDS0YzTlhHOEdvcDNTa3F3Y21tdmlGbU9IcTNhVFlBdjd3?=
 =?utf-8?B?Vk1qOU05MlhFQks2Kzg3dTdCUG5tajlrNG50TlVLdVB1c05sdGVSc2wwd2lp?=
 =?utf-8?B?NXJMSWV2OWFHSmpqWnRxMkI3ZVlBendSOHRDL1g2NUlsRitWTGNSeE1ZZ0FG?=
 =?utf-8?B?akNpMUhuSHpKY3E5L3dKRS94dEZkeU5BNXhUcDhkak92MGRhVUZZOXl0M2xw?=
 =?utf-8?B?bHRCWkJZcElDcVV5RjFHQzZjcEloelpYdWsxMk9hMjRibmxwSjNZVGZOYUlD?=
 =?utf-8?B?LzIveFBaZXplbHpmOHo3dlBpZGdVSTlvVXMrSkdLUEZJTVh1ekY3NVVHakNJ?=
 =?utf-8?B?NWYwc2lPK0E2eHRwckpmRjhrdUw4eFU4cUN2NDhoeTVGdWlRakJZbDYwejAx?=
 =?utf-8?B?a0RNSElGSlpWMGgzZWpWaXgyU3dabHU4VnFNbWYxYzRYemRwWjRxbnVsdmFI?=
 =?utf-8?B?b3FjRldpRXpDakRIUG14cjdRN1lGTjZoL0ZLNjk0Q0tMVkhUalZNdEcrcjR1?=
 =?utf-8?B?WExXM05WVVFaWGxvTi9oSkd3aGRHOGNJQkRlRkdRWnVKR0tFQjhoa2NpMW4r?=
 =?utf-8?B?SHdwRml4ZnM3WVQrVEU2NmRiQWZuK2dTOXFMYkZuRStUcGk3UWJwcFNxVXNB?=
 =?utf-8?B?K09EMzRPSElYMGR0a1JBbnI0RTNQeHFjZjhhaG5JN2lSMjExbDJXOFl1bEpT?=
 =?utf-8?B?VVJudWljc1BZL3BvRnFPK3RoclF4TmY1RjNCWlN1U2Q5VXB6amJBTWpxOVdI?=
 =?utf-8?B?UkVEVWNIY3FIclJxVng1RkJuV2lJZFBSYnl0NWJ2WjlBcnNXdnpqMWNjNnAy?=
 =?utf-8?B?OTZQdmh3UDJibWFHaldPN0o1aFdNNkIwbkRkTFpvNDg3UXh3SVlCb3lYNTlm?=
 =?utf-8?B?R0pFb1Rta3l0R0Z2ZFlqQjUvQXh0ckNUVlpFb1RGOVRCdmE1SElXei9rWDZz?=
 =?utf-8?B?YU85bGFNTnVrL3dIQlg2VWlyR3FKcVVQZ1k1dk8vaXNITDFaZW9UWFdhVG9X?=
 =?utf-8?B?Qm5MTHFITFJQejlGS3JzRU9aLzQxOEY2a2VoMzB4cXprblA5UVkxQlE4Vyto?=
 =?utf-8?B?c1VxMWpZdGZESFpQWG5pRlNZWVpYN2VpdXBVZHlvZTc5djYyY1BlVXNmKzZo?=
 =?utf-8?B?TGZRcXhQUWFkQU5qcVFhK0RoTmxDRWVQTFlhazJIYnpDVlNLZzJzRUdUSlhw?=
 =?utf-8?B?ejR6NWNNc3lsSXh2UHhDNFZKYnpqd2JqY25FNHFEVVJlOEMxRkxFU1VwUjA3?=
 =?utf-8?B?UTBtZ3pQOU8zSVBUd2paYWxXL0JtczdId3lSY0RYUm1hVnpXRFB5YnQwVW9K?=
 =?utf-8?B?dDhKMjVyZEhKYkt3UE1nclVzbmtLY2lJL25keS9vc3R6TkZjMDNJL2o4WTF4?=
 =?utf-8?B?VHlFZ2U3cFF4bjZvdk1NSDdneThHajViUGFRS3JNVi9LSVVsRUtBWUxjeklG?=
 =?utf-8?B?aEdxSWtmTHBHMFVvNXJNZkNSOGo3S1NkcDdYcndiYmFuUnBkZlNUVUxyUVVr?=
 =?utf-8?B?TnkxR255TCtUNFUzcHZObUovM1RHTVpNcEkrajhieG04N3VuVHpSbWI4QjZS?=
 =?utf-8?B?VUlYdEsxUHVuai8wQi9YbVpEUnowaE13bzZBSnk2cllSSkZSZWRmUDc5UHRN?=
 =?utf-8?B?WHJOaktqenBFdWNsSHNDZDRKMkZFNkNrTEE1QTRKdmNFNmNkZzExdGNQajVr?=
 =?utf-8?B?ZnQvWElsWERMdUtkZWJlREk1TnZ5RDJ3TXNoNFZrNVpZN0pwMVNwRnF5WEFN?=
 =?utf-8?B?aEN5Rm5LSlRMaDNLVlZ4ak9Wb3h5UkpxQUlWRXFvRWREdkMwL2dScTg4bGpi?=
 =?utf-8?B?UFgxMnk3UVVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 05:43:18.2571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60210363-8d12-4846-727b-08dd14efb8a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128

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

v2 -> v1 :
- rebase to the latest v3 version of "xen/acpi: upload power and performance
related data from a PVH dom0"

Penny Zheng (3):
  acpi/cppc: extract _cpc entry parsing logic
  xen/cppc: get xen-required cppc perf caps data
  xen/cppc: introduce cppc data upload sub-hypercall

Roger Pau Monne (1):
  xen/acpi: upload power and performance related data from a PVH dom0

 drivers/acpi/cppc_acpi.c         | 204 +++++++++++++++-----
 drivers/xen/pcpu.c               |   3 +-
 drivers/xen/xen-acpi-processor.c | 321 +++++++++++++++++++++++++++++--
 include/acpi/cppc_acpi.h         |   5 +
 include/acpi/processor.h         |   2 +
 include/xen/interface/platform.h |  11 ++
 include/xen/xen.h                |   2 +-
 7 files changed, 475 insertions(+), 73 deletions(-)

-- 
2.34.1


