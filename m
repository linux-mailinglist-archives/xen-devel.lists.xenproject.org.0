Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C3CBA36B9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 13:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131454.1470541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26BK-0002Be-Ff; Fri, 26 Sep 2025 11:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131454.1470541; Fri, 26 Sep 2025 11:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v26BK-00029U-By; Fri, 26 Sep 2025 11:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1131454;
 Fri, 26 Sep 2025 11:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJil=4F=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v26BI-0001jZ-H4
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 11:00:04 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f210241b-9ac7-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 13:00:00 +0200 (CEST)
Received: from BL1P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::10)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Fri, 26 Sep
 2025 10:53:16 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:5b5:cafe::39) by BL1P221CA0031.outlook.office365.com
 (2603:10b6:208:5b5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.13 via Frontend Transport; Fri,
 26 Sep 2025 10:53:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 10:53:15 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 03:53:12 -0700
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
X-Inumbo-ID: f210241b-9ac7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhCn9FVLpf2jxWBeuQxGnKRJ17GT+O8pZYkure5pdSpAfamdD8xtjrWcgqnGvfBT1CtP/stf3KwYCQPHGsnWxKy1iHNqHKgFEWxqiGTR1yYEOXuge78jn1ZIasFlIxpHOeminQCMEzADQlXBUZQedFeWGQV42v/B5ymhp+TDt0AXl+tEZXKfEDFUnHb2MuGay2FOZOMttUJUKMpZEXQwv0Ll/9tzHwNNxQHxVuYBKMKGv6xmH5LCpfOkCLDQQZRwW/WVWAtm929VfcRx1Snu/8MsQITW/U0AUsL03G3shYs1H1Kk2tGiu32Tin+fCHoyipstVZu0oM43aZYi7wUznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgZS9xNU2xSXn43jLOOcaNzu2abWfRQdW1m6PvTLsPw=;
 b=f4/IPyHgR5YFfu3nwpYsJkHCCJfGZ5lOdJP3GDXbt6mGn3Cr1gapoF3RN8I70kBuIwxJAJW3FwZCR36YSu/6katyF0RrUsvCs7hb7T1ZEEHDjc3TJk00VD1WeSuDeTcLxAHeRxX82AmCRDMfgzhI27UCly5mVl9MCmp97L32lnZRuYMY0Fs4JVHHMiPkSZi1tuaOl0mHQ6cw1FVDW2L+5WY6cAdyIEFGrV090yQM9rOlBdl03D+EhNawfyQjJMgqqp3URyv0ToEBhIp9vc2G1CUROnTeK+IXdKpL/6nxVNZtMGN2x4TpcAJdOtKux1+n7EksvfxR+hc71Oa5uDDwSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgZS9xNU2xSXn43jLOOcaNzu2abWfRQdW1m6PvTLsPw=;
 b=lMv6GpGojnUS6Xc+rCqaP/s1GkL4xAhIyhalaCOwUrZrB4Dsz4NjfziS1eFcgq1QyeILM1A+GEzNozi5VAVVeN5eSeqzz49u8Ali5V73lAYbUFc60MLRu21Km9f6e2eEZR9k2udiEQQycwbUMfC9dORH5G03zaJH/42OVHSU8CU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Sep 2025 12:53:06 +0200
Message-ID: <DD2OC4H9KI4C.1F2MA94EVW435@amd.com>
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com> <8fd7c0f5d203aa0f13cd8efe5129b6f3@bugseng.com>
In-Reply-To: <8fd7c0f5d203aa0f13cd8efe5129b6f3@bugseng.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 9124e682-0ad3-46a2-0d0c-08ddfceae585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlpZSjY2SHJsZDdxOWF6OFNrNm1pSllDZmJjK2VPR2Y1ZzBaRlZ6ZDFMMUhv?=
 =?utf-8?B?T2QxZTN2UGN2a0s5djY3SjFBV3Z2Y2JUQnhPU1ZDVGtFcFFIQmE1M0V2YTlE?=
 =?utf-8?B?R0h3aS9xU2pPd2JWVzRUZWVPZVg3NE5UYTlTQm5uSmRYTC9hV012YXhLTTVl?=
 =?utf-8?B?TTArTEJsNXhMTnhZNlpzcGovZWI5T20vUWNOYmpic0pGa0pJdTZUK1lEMEY2?=
 =?utf-8?B?UzhaQzhsaGViNUJqME9OM21OQ3ZCQkJyY2JOVXkxV1lLZGx0cVRHYUtPd2x6?=
 =?utf-8?B?eHBBRElybjF3cmNiWFFCL1hOcG5NUDVIS3NLL1Z5TU1mNStyNHc5MTZSNVYr?=
 =?utf-8?B?MHlEMEJ5SXRzV25iKzNKSmUzRXp3Uk9OWkV5SGE3azRNZUVlR2NIM2x0UmVW?=
 =?utf-8?B?R0pyeXN2RXFzallqVU8zK2djOTJQcFJWaWpzNDM3N0U0dU1UV1l2R0daQVRv?=
 =?utf-8?B?dWMrWWtsYmJvZVBOVlZhcE85ZGFXNm40SkNCZVlMRGh5aElJUFlEeXQxRGdQ?=
 =?utf-8?B?OVlHODQ0ZWFJSWg3MGtkeU83T1p5V0hPV1BYNXlWeWdwdDVxNnVJK2U1cEpJ?=
 =?utf-8?B?T1JEakJVSUpJWTBURzI1Y2hoZERyWElrY3M2UmkrZWgwRmhpV2NOWks3MGRs?=
 =?utf-8?B?aFBCbFVjYldSL2JYd05rdXN3WFJGM2o2M2EwTlhVVitoc0RWNVZCUXc4eE1t?=
 =?utf-8?B?WnJwck1hYnJwakpwLzlOVDlhdXk5bTdCVCtqZE1zaGw5YjlGekQvT1N5Vjdo?=
 =?utf-8?B?OEhhT3l3OGM2bjhGVjNNYXhzekdiS1JMelJucUwyYlcxS2F2bkQ0azNCU29i?=
 =?utf-8?B?R3R0ZWlJY2pTNk93cWFNM1ZQeWxnV3ZNRVZmYkZQRFdSQWtHTURRY2pScVVy?=
 =?utf-8?B?bWdzeGdsRCt1c2NoK2h4SFRvWUlIMWFTMnFZSWtpY3hxK0E5bU1XU1NBS1Jz?=
 =?utf-8?B?YmhOS2JSTkRCTUFheGEwU0dyZWRYSHNMNnFQcFNraVZQVkRBQUZWSGNxbUJz?=
 =?utf-8?B?YzBIS2lKMkxKM05IR1N1bHMyWkt4WlRhVHZzRmtsbWRFSElLcVUrWktkNHV2?=
 =?utf-8?B?MG5RbUlZYnRnVk5RaG1Rbmh4bWxnK0xsYUg4VSsyUnNTTUR4K0hLRlNyRW1x?=
 =?utf-8?B?VENjWDFXNGhXeTZ0aERjQUo5RWd1MTFnMDBFSVpiY25oMmdNSG9kUlJmcmhP?=
 =?utf-8?B?anhhNjNBK1lhdk5Ud0ZMRUN4U1k0Z1dYQzJxRUd2aUYzTC95WitoL1YxT0tT?=
 =?utf-8?B?SHJTU0FsRFZiRFBFYmVQSzlNdi9mV1MzWmRvbkhFU245cU4yQ2pyRDVHelFm?=
 =?utf-8?B?cmRXenhHUzFtV2pHcmxmTGVQUDU2NnJ1dldHYjJIVGVqU1laZE1wRTcreDVY?=
 =?utf-8?B?OUo4bWh1TlNXd1o3MVFCWDZiRjRQVFB3dldPcXBKYVdTRlh4ZlZMK1FSWS9C?=
 =?utf-8?B?RnhSWnJ2dHpNczk5SHNDL0JHVk1XdUNrZlpIcUVpZG9FRE9rYkZYNTZibWtl?=
 =?utf-8?B?TVFhZFhaV2NTSm5wQ1BHUDg1ZFhhbGJoUnlDa0JkS3NubUxrN0JOOW9VV0gx?=
 =?utf-8?B?QnpXaEhkL21iNzVFK1BpU0lnR2VJL1dYcmdHSEFCWlZ3amRKN0lwVmhXcVg5?=
 =?utf-8?B?dEYzOWp1UUttcGxCYnltZGtValF5TWt0Rm9vWXlXa2gxL21EVkwvN0VyZWZq?=
 =?utf-8?B?UEtTU01MRFoydVN4TVFYUXpvTStBZWlsK05KSUdyV241YXozRlNxMkRPdFF1?=
 =?utf-8?B?SnlZR3cxdlBsTTZIc3dDNTdqemtZdy9ib090QWc3YW1rWjMxUGtYL1Z6OExU?=
 =?utf-8?B?Qk9DVWtLS0tSNGR3a05YL3RaU3BBRFJqOW12R0o2STJ1WnZmNnMxS0FPK1hm?=
 =?utf-8?B?eWloM1NjY2dRazBua2huZU9SZSs0Yzg3RmRwSHVXVWtlZEdjaWtWMjUyd2Ft?=
 =?utf-8?B?R2pvU3JuZVFreEpYeS91V0xWSitZSmJkV3VtZGhlZDYxOGNRU1FKcVI2aHE3?=
 =?utf-8?B?a3dHODIrQWJpTVVJRTdBcVQ1eXlGc052V3g4L1hGV3NENjJHQVp1c3RqN3Aw?=
 =?utf-8?B?S3VhNlphdkZhcUNnZ0RLTU02YWUzRUpKQVFBVUZ1SkxJWnh2T0R6V1BCRXh3?=
 =?utf-8?Q?7OiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:53:15.9299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9124e682-0ad3-46a2-0d0c-08ddfceae585
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483

On Wed Sep 24, 2025 at 6:06 PM CEST, Nicola Vetrini wrote:
> On 2025-09-24 18:00, Oleksii Moisieiev wrote:
>> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
>> allow for building Xen without support for booting a regular domain=20
>> (Dom0).
>> This functionality is primarily intended for the ARM architecture.
>>=20
>> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
>> default for ARM and X86 architecture. This symbol signifies that an
>> architecture has the capability to support a Dom0.
>>=20
>> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
>> expert users, this option can be disabled (`CONFIG_EXPERT=3Dy` and no
>> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
>> creation code on ARM. This is useful for embedded or dom0less-only
>> scenarios to reduce binary size and complexity.
>>=20
>> The ARM boot path has been updated to panic if it detects a=20
>> non-dom0less
>> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an=20
>> invalid
>> boot.
>>=20
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>>=20
>> ---
>>=20
>> Changes in v3:
>> - rephrase error message when dom0less mode wasn't detected while dom0
>> is disabled.
>> - rephrase help message for DOM0_BOOT config option
>> - update DOM0_BOOT dependencies for X86
>>=20
>> Changes in v2:
>> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
>> suggested in ML) because in this case HAS_DOM0LESS should be renamed
>> either.
>> - fix order of HAS_DOM0 config parameter
>> - add HAS_DOM0 option to x86 architecture.
>>=20
>> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
>> regular (legacy) domain an optional feature that can be compiled out
>> from the Xen hypervisor build.
>>=20
>> The primary motivation for this change is to enhance modularity and
>> produce a cleaner, more specialized hypervisor binary when a control
>> domain is not needed. In many embedded or dedicated systems, Xen is
>> used in a "dom0less" configuration where guests are pre-configured and
>> launched directly by the hypervisor. In these scenarios, the entire
>> subsystem for booting and managing Dom0 is unnecessary.
>>=20
>> This approach aligns with software quality standards like MISRA C,
>> which advocate for the removal of unreachable or unnecessary code to
>> improve safety and maintainability. Specifically, this change helps=20
>> adhere to:
>>=20
>> MISRA C:2012, Rule 2.2: "There shall be no dead code"
>>=20
>> In a build configured for a dom0less environment, the code responsible
>> for creating Dom0 would be considered "dead code" as it would never be
>> executed. By using the preprocessor to remove it before compilation,
>> we ensure that the final executable is free from this unreachable
>> code. This simplifies static analysis, reduces the attack surface,
>> and makes the codebase easier to verify, which is critical for
>> systems requiring high levels of safety and security.
>>=20
>
> Misra's definition of "dead code" is code that is executed, but can be=20
> removed without changing the behavior of the program, while unreachable=
=20
> code is code that is not executed, so I would cite MISRA C Rule 2.1 ("A=
=20
> project shall not contain unreachable code"), rather that R2.2.
>
>> ---
>>  xen/arch/arm/Kconfig        |  1 +
>>  xen/arch/arm/domain_build.c |  8 ++++++++
>>  xen/arch/arm/setup.c        | 14 ++++++++++----
>>  xen/arch/x86/Kconfig        |  1 +
>>  xen/common/Kconfig          | 11 +++++++++++
>>  5 files changed, 31 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index cf6af68299..336b2ed242 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -17,6 +17,7 @@ config ARM
>>  	select GENERIC_UART_INIT
>>  	select HAS_ALTERNATIVE if HAS_VMAP
>>  	select HAS_DEVICE_TREE_DISCOVERY
>> +	select HAS_DOM0
>>  	select HAS_DOM0LESS
>>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>>  	select HAS_STACK_PROTECTOR
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index fb8fbb1650..62602afc78 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -42,8 +42,10 @@
>>  #include <asm/grant_table.h>
>>  #include <xen/serial.h>
>>=20
>> +#ifdef CONFIG_DOM0_BOOT
>>  static unsigned int __initdata opt_dom0_max_vcpus;
>>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>> +#endif
>>=20
>>  /*
>>   * If true, the extended regions support is enabled for dom0 and
>> @@ -104,6 +106,7 @@ int __init parse_arch_dom0_param(const char *s,=20
>> const char *e)
>>   */
>>  #define DOM0_FDT_EXTRA_SIZE (128 + sizeof(struct fdt_reserve_entry))
>>=20
>> +#ifdef CONFIG_DOM0_BOOT
>>  unsigned int __init dom0_max_vcpus(void)
>>  {
>>      if ( opt_dom0_max_vcpus =3D=3D 0 )
>> @@ -116,6 +119,7 @@ unsigned int __init dom0_max_vcpus(void)
>>=20
>>      return opt_dom0_max_vcpus;
>>  }
>> +#endif
>>=20
>>  /*
>>   * Insert the given pages into a memory bank, banks are ordered by=20
>> address.
>> @@ -1962,6 +1966,7 @@ int __init construct_domain(struct domain *d,=20
>> struct kernel_info *kinfo)
>>      return 0;
>>  }
>>=20
>> +#ifdef CONFIG_DOM0_BOOT
>>  static int __init construct_dom0(struct domain *d)
>>  {
>>      struct kernel_info kinfo =3D KERNEL_INFO_INIT;
>> @@ -1993,6 +1998,7 @@ static int __init construct_dom0(struct domain=20
>> *d)
>>=20
>>      return construct_hwdom(&kinfo, NULL);
>>  }
>> +#endif
>>=20
>>  int __init construct_hwdom(struct kernel_info *kinfo,
>>                             const struct dt_device_node *node)
>> @@ -2046,6 +2052,7 @@ int __init construct_hwdom(struct kernel_info=20
>> *kinfo,
>>      return construct_domain(d, kinfo);
>>  }
>>=20
>> +#ifdef CONFIG_DOM0_BOOT
>>  void __init create_dom0(void)
>>  {
>>      struct domain *dom0;
>> @@ -2103,6 +2110,7 @@ void __init create_dom0(void)
>>=20
>>      set_xs_domain(dom0);
>>  }
>> +#endif /* CONFIG_DOM0_BOOT */
>>=20
>>  /*
>>   * Local variables:
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 7ad870e382..fbb290df60 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -481,12 +481,18 @@ void asmlinkage __init noreturn=20
>> start_xen(unsigned long fdt_paddr)
>>      enable_errata_workarounds();
>>      enable_cpu_features();
>>=20
>> -    /* Create initial domain 0. */
>> -    if ( !is_dom0less_mode() )
>> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )

This probably wants inlining in is_dom0less_mode() so every use gets to be
resolved statically.

>> +    {
>> +        /* Create initial domain 0. */
>>          create_dom0();
>> +    }
>>      else
>> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>> -
>> +    {
>> +        if ( is_dom0less_mode())
>> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
>> +        else
>> +            panic("Neither dom0 nor dom0less mode was detected,=20

I'd rather have a static check in common code.

BUILD_BUG_ON(!CONFIG_DOM0_BOOT && !CONFIG_DOM0LESS_BOOT);

>> aborting\n");
>> +    }
>>      if ( acpi_disabled )
>>      {
>>          create_domUs();
>> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
>> index 3f0f3a0f3a..2aeb361c63 100644
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -18,6 +18,7 @@ config X86
>>  	select HAS_COMPAT
>>  	select HAS_CPUFREQ
>>  	select HAS_DIT
>> +	select HAS_DOM0
>>  	select HAS_EHCI
>>  	select HAS_EX_TABLE
>>  	select HAS_FAST_MULTIPLY
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 76f9ce705f..10a8fc8718 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -26,6 +26,14 @@ config DOM0LESS_BOOT
>>  	  Xen boot without the need of a control domain (Dom0), which could=20
>> be
>>  	  present anyway.
>>=20
>> +config DOM0_BOOT
>> +	bool "Dom0 boot support" if EXPERT
>> +	default y
>> +	depends on (ARM && HAS_DOM0 && HAS_DEVICE_TREE_DISCOVERY &&=20
>> DOMAIN_BUILD_HELPERS) || (X86 && HAS_DOM0)

Why not just HAS_DOM0? And why HAS_DEVICE_DISCOVERY and DOMAIN_BUILD_HELPER=
S?

More importantly, why not drop HAS_DOM0 and do "DOM0LESS_BOOT && (X86 || AR=
M)"
instead? Or just HAS_OPTIONAL_DOM0. dom0less is always optional, while dom0=
 is
supported everywhere. HAS_OPTIONAL_DOM0 would signal that a port is capable=
 of
compiling out special dom0 construction logic.

The current dependency list seems off to me.

>> +	help
>> +	  Dom0 boot support enables Xen to boot to the all-powerful domain=20
>> (Dom0).

... or the pvshim, in the current x86 code.

In time we'll probably want to make it so that !DOM0_BOOT && !DOM0LESS_BOOT=
 &&
PV_SHIM means PVSHIM_EXCLUSIVE, which would solve the Kconfig headaches we =
have
with it by making all options additive.

But as things are today, this includes dom0 and the PV shim.

>> +	  If this isn't enabled Xen is expected to boot in dom0less mode=20
>> only.

... or fail to compile (as per my suggestion above) when dom0less isn't
available either.

There's an annoying side effect here. randconfig will be able to create a b=
roken
config. !DOM0_BOOT && !DOM0LESS_BOOT. CI would need adjusting to keep DOM0_=
BOOT
set in randconfig jobs.

I don't have a good solution for that.

Cheers,
Alejandro

