Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B31C5757C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:12:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161136.1489151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWBV-0006kN-Rb; Thu, 13 Nov 2025 12:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161136.1489151; Thu, 13 Nov 2025 12:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWBV-0006it-OO; Thu, 13 Nov 2025 12:12:17 +0000
Received: by outflank-mailman (input) for mailman id 1161136;
 Thu, 13 Nov 2025 12:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIX7=5V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJWBU-0005l5-L1
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:12:16 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd8c8432-c089-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:12:14 +0100 (CET)
Received: from CY3P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:fb::10)
 by DS2PR12MB9616.namprd12.prod.outlook.com (2603:10b6:8:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 12:12:11 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:fb:cafe::2f) by CY3P220CA0008.outlook.office365.com
 (2603:10b6:930:fb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 12:12:19 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 12:12:11 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 04:12:09 -0800
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
X-Inumbo-ID: fd8c8432-c089-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcw8tbpiHCKVRDx+LDTx0XVPlBdk30DGYBcYgMir+yuJptkhMzVGoBoXhzw1zDHZIOQHc5H4rM5Fa8csXsHsvrpIbXT23AXZjnetGWc4WZm8vsu7tD8Gp+e+MSxWKYlwyIEOZXW5+JLFvnfqkk48J6nNVudTALcibLlnkiXkDn12n4NjvfshbuRVRAeupAYJ0LyRKdMxEw6ADzdDbEb6WVJjuVNj4UkJtojsPS/sRj+Z4xMBFucGDtrFiKZDXL8yAxpjLj3IgOcXkqv4tMFayKFHsLYnqAxfwvvoU5TyZSWULKeb6atTSjrpJIJ9k04KSwEsze1wVwTJyOWBnL8kSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+FacR7mEg8qfbq9hx46rrqy8DywRwjvTi6AGMVrifM=;
 b=egYUoPsRDloWMwkb45iAmYZHOX6Ypv7OQVafU4utubCYxHX4j25EQP9/zvMLZzLprli28/qENEqkWVUNvCAow9IZu1Am90HndrWmvPDhJaVezzSSMRqYgiY89sKuUqBv55xdYAFmNLqSz39QI+Ls/GVBFTEw8V4sfLhH2F4HCglCAcGxHcUVFiRJAYOiV+1YNW/NVxS8H7j4efIzMF3D/3+Dimh6b4ihnWqX8N05EOVctGsHabLrq1Qdh2DF2G7/nY6xnwHrJy7yhF2kUJWVO9yVI6np7eSyQiZUd3ua7b18MBo8ZEeBcNQ5kjI46jQuUifVM8cuKRqxJvRYd029Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+FacR7mEg8qfbq9hx46rrqy8DywRwjvTi6AGMVrifM=;
 b=MhxfnsDz7MrUJdNPqA5zd+U7rbYpEBptzbbnLKIyapKN3ZKzTTf8iS4sEwG1RE0N/JBHDHNPIwiLV9jL5wsBodEdqb061PHwXmGaZSTrvqp01E/hFKf8Wxw/LUjui1JwBCvXtdxaSzHDoP0HWnp23fUjNzOGx5tGSb0YFhWd/6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Nov 2025 13:12:07 +0100
Message-ID: <DE7K2RY582S4.3HVVCVXA8BARS@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
 <248593ca-e24a-4518-800e-2c58e3197937@suse.com>
In-Reply-To: <248593ca-e24a-4518-800e-2c58e3197937@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DS2PR12MB9616:EE_
X-MS-Office365-Filtering-Correlation-Id: af1bf8b4-2257-495b-2e8b-08de22ade004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z3VqZmt0Uko3OEhGRDBiWXNQQUxVRjVUUmx2YmllSnVqNlFUb0VRTFA3NlBP?=
 =?utf-8?B?NE80T3dZSkVNcE9pUy9LMTJHK0F0aUFKTlpxZFE4d0RmT2hGZ0JUQ0ZHN3Q0?=
 =?utf-8?B?YjRoeFpHU000VG9CcnROakR1TEQrY3JZMXdTOGpHclVWUGZ0Mkxpa3V4YWJJ?=
 =?utf-8?B?bG9xMzNmMWZsVTlJQStjNGljMzBiaTNnbzU4M2xSR3RlZ1JSRldCRXBudnJ4?=
 =?utf-8?B?ZEtYVlJWeEhSK1I4NkJUNU0wRFIyV0dUZnEwSmZ0UEtTWlppa1NZNFdvYXdl?=
 =?utf-8?B?N3BWMXV1c1VlZ0Q5V3FrdWZTR1B0SnBUVFE3MC80Z0oxS3dlSHZ2eHBZbi9h?=
 =?utf-8?B?dXN1dWI0eGJ3cFFxMm1MZy96VlZpNXJOZko1dXZxNlh4TEorcE5sR1dnb3FT?=
 =?utf-8?B?V3o5cUlPbXZjSnpFOWtLTWNSaVJVdU9zTWJGUldhSCtlakx0dWFPcHJZb09I?=
 =?utf-8?B?Z1RNcTR1TE5LNmVJS211cVE1VVhiM2ExZHpBUEVrcXZaMTFzczJOZUEraVpI?=
 =?utf-8?B?SDhFVnhpL3pHZDkySzM4TVRqK1AyRGlsTWw5UHlVL2RDcC85aWE1c2R2djlp?=
 =?utf-8?B?NHlYMFhjNDhLUFRCOXhQTnVKREh3ekFON1h5cFEzWExYanR2SDl3czlHUmxZ?=
 =?utf-8?B?Y2VmU1ZWdks0MjlXSGhsSG5oelV0R0dYVGI5VUdhdVNJTElRcEFOTnNyY3RN?=
 =?utf-8?B?QTNHN1UyU1FhZDJqVzFyc285cWZDTTMxY0tKWkp1MGhBVVlIOFlRRFkwWHpO?=
 =?utf-8?B?M2FpdkQzZGJBdGNPRGFkbXVmY1czbmd6aWpMZFNaUmgvRDNjandQd29KTWJO?=
 =?utf-8?B?YjRUeVlmRXNLMFpqOTBaWlQzNFp1b1p6aXpvaVMzbEtVekE5YXdySGwvK3g0?=
 =?utf-8?B?S0x0aitzdEx4OHU2RTI3d0doUk5LclpDdkdQa00yQWtvWjlZTTRDZm1CL3pT?=
 =?utf-8?B?NmJTaHpQWU5sMW5HUzZ2c3JFMmFOSXU2eC9jRGpHTitLZzBnc1NiOXNzSGcy?=
 =?utf-8?B?bGpJa3grdTFEeU1MZjFwWGIwWVB5NzVTUHk5ZVBDaXFqc0ZUMzdVVi9FTFpm?=
 =?utf-8?B?cDdSWVpzU3cxU0dEOUhEQnhkUkdaWUNXbmlkejAxQk5jTmRGV1RqeU5Eci9z?=
 =?utf-8?B?LzQyRXJjS2Nrb3Z4L25OMGl1L2p2c1VzOC8rY1N0ZnAxcjN2V0YxbUVOOEh5?=
 =?utf-8?B?YTA1Vm5vc1BOOHAyTFN2Y1FDOUUxeDVBVXN0TUI1ZHFYTVZ2Tm0wNnVNQndE?=
 =?utf-8?B?T3hKREN6M05VUnE5WFU5clQwblpOUDRST0wyZUN6eitmTjhRT09HM2g5dGtu?=
 =?utf-8?B?OUNWQkk3WEdjbHVlOFFwR05la0dqNEp0Vk43RzJSSVBaVTdTMnZ0NGNsT1ZB?=
 =?utf-8?B?dXdVMUtERnhzVisxZGxoU2g3eUJYRlppVU0zdytoQld0Y3h6cndnWlpNSSt6?=
 =?utf-8?B?MWtrNFdtK1JUT0VtRXlSQWRkbnVsTWZDL2FrVy8vOXo3bmtPTkE2aVBKYmpq?=
 =?utf-8?B?YmJXdmZ0VDBWLy9LSitiQURFb3YwN200bmdCYnNjQWFLTDVHVXFYeXlMdUti?=
 =?utf-8?B?Z1FxQUJJL3FIYlpoQUpYcXdDN01LRGhIaDJYNlBBUXJkNDhCK28rcWhNdk9h?=
 =?utf-8?B?RXhzQnVFTkd4bjcvUXNlbko5RmtxMEpWNmNTU2Y0OGhFcUFLMEg0NUM1K3Rm?=
 =?utf-8?B?Vk9FSkFyY1VGaG9CQ0FLQTFpczVuQ2V6V01icTkvWEUwUW1Wd3E2ZVRvUHhO?=
 =?utf-8?B?Um9nSHp5SkpENEJ1L3pGeGNsRUxKOThaMGloWTZUNGs2VFF3Mi9Jc0k0aTJl?=
 =?utf-8?B?c2pjc0FPMVVodW1Ib0t2dXJQQk1xeDV6VXdUSzI4RkRnZmRIdEIzVUxqVEdp?=
 =?utf-8?B?TzM5NEZkZFVta1lDS3pWQStCTG0xMlgwZXhBc25KMzNKYnJzMjR3S2d3TXBF?=
 =?utf-8?B?b2VPVHYrWlV5TndHNkVaTjgzazNSNUVvNEkvUmhXQmhmR0Z1bWRhcU9ibWw5?=
 =?utf-8?B?RVU4djhlb2VmVFNBVzdTb2V1WGp3RHpQTGdoTXN2eng5TXlLejByOFhNcGZx?=
 =?utf-8?B?eGtHSGRzREJBNVNQUUx3S0U0d09tL05vQWtOM2dkUEdDQVZJVDZIVWI5bHQ4?=
 =?utf-8?Q?GG8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:12:11.5372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af1bf8b4-2257-495b-2e8b-08de22ade004
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9616

On Thu Nov 13, 2025 at 8:36 AM CET, Jan Beulich wrote:
> On 12.11.2025 17:22, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> The series is mostly a refactor between everything needed to load microc=
ode and
>> the bare minimum to probe the current microcode revision.
>>=20
>> The Kconfig option keeps the reading of microcode rev data around, as it=
's very
>> relevant for security and debuggability in order to deduce which erratas=
 apply
>> to the current platform.
>>=20
>> The idea is to move everything that must still be compiled with !CONFIG_=
UCODE
>> onto {,amd-,intel-}base.c, then remove everything else conditionally at =
the
>> Makefile level.
>>=20
>> Renaming files (e.g: s/base/core/ and s/core/common/) would better refle=
ct
>> post-series reality, but it'd be annoying for later backports in this ge=
neral
>> area.
>>=20
>> Cheers,
>> Alejandro
>>=20
>> Alejandro Vallejo (4):
>>   x86: Split out AMD-specific code to be executed without ucode loading
>>   x86: Split out Intel-specific code to be executed without ucode
>>     loading
>>   x86: Split out early_microcode_load() and microcode_load_one()
>>   x86: Add Kconfig option to disable microcode loading
>>=20
>>  xen/arch/x86/Kconfig                    | 12 ++++
>>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>>  xen/arch/x86/platform_hypercall.c       |  2 +
>>  13 files changed, 259 insertions(+), 158 deletions(-)
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h
>
> Purely based on this diffstat: A doc update likely is necessary as well, =
as
> the ucode=3D command line option now becomes only conditionally applicabl=
e (aiui,
> i.e. without having looked at the patches them selves).
>
> Jan

Yes, that sounds sensible.

Cheers,
Alejandro

