Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0519ACF629
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 20:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007356.1386681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEwv-0002UT-QL; Thu, 05 Jun 2025 18:04:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007356.1386681; Thu, 05 Jun 2025 18:04:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEwv-0002Ro-NP; Thu, 05 Jun 2025 18:04:21 +0000
Received: by outflank-mailman (input) for mailman id 1007356;
 Thu, 05 Jun 2025 18:04:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEwt-0002Pu-LU
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 18:04:19 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20618.outbound.protection.outlook.com
 [2a01:111:f403:2408::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d131c11-4237-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 20:04:15 +0200 (CEST)
Received: from SN7P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::22)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 5 Jun
 2025 18:04:09 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::96) by SN7P222CA0005.outlook.office365.com
 (2603:10b6:806:124::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 5 Jun 2025 18:04:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 18:04:09 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 13:04:06 -0500
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
X-Inumbo-ID: 7d131c11-4237-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMeICOW18kgXJUNVlIwDenzVC12DzqsPHEqdiT1Smb9EFKDebNuy0imIdxfjUjbYnomOUptJCg8f+2c6Jjl78qE8TzjL/6HFOoRd/NWPjqITfwbCTRQbJmviD0UHTegzG7AjdSb+lzjXn6IVB5DQXnNvauT7ggyi/E38pD/cVVaJgcXdxeIZ1PJDI/VuRNe0iPTxAE6M0ZQLavZGBFhrg71OqxugCq8f+SelzdNUw34VTBtJoXQGEZe0BBczZCBsuGXnioRHW/xjsouZg1GH1sAbF8p4zxRxzZyWCm+lP4mt2nySp/bPEbJTsqY5TRBTuDMcSBrz7W4eMKl566bY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiLnOrisgAz1u9VniU4nunJ84BlQ/KNE/r2YdbvGLF0=;
 b=Ng6GMQBrwloB4tWCmVSSPUVtfT+xkzKoBqeX+Lu9d2oLDD2viXdKkstEVm+a6ECPkJinTNfjfiohet6xiWgUTrKwD94nr1TMG2m9KKDfQWW7xgrDfAoKUI0IGs3FyIiqKqRfu8qSdlGgmG57SjrMKR7xgvB9vmEAK8gAEav34EIjJUykceB5w7KSxKG8xfbR8i9tVHN7vRuuWZ+8uIy/Auim8GBzRlYV14od8qMak/zcUzaDTv+rVWiWEDmooi0jl96iXMALPusuypWwSd92z5UJBED/VRrtjGZMQqXfsU3TFGPiJj7bqG6suJ2DCm1vcLKjJbG/1Tt9KMGJ+7Mf2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiLnOrisgAz1u9VniU4nunJ84BlQ/KNE/r2YdbvGLF0=;
 b=jfKCXbAWVoVoO5hzvedQ2Rlg7g6fICTZFkC2oL/+w35oZ4k92c2vH4yuqK3UxaTYVVYKS46nXCbZSFuPwV389bmy8YROODLaLSwBfpkrNCBaofSok5d1mqdkg0FUWxZjsLPqPaEDGd5pelHzkhpVkvumJ8kbZGbDhjhFANfpf0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 20:04:04 +0200
Message-ID: <DAESQJL4DFLQ.1HJH3KE56C3ZT@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 13/19] xen/dt: Move bootinfo functions to a new
 bootinfo.h
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-14-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301832520.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301832520.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b934531-4681-4bb8-9e07-08dda45b5e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGRjaCtLUDMyOTlnSjdQN3BWTS9pdWFuVVE5YThTNkZXRUtBeFhuaUNDNW1s?=
 =?utf-8?B?ZldxRVZuSlFrYlhMVGZlUlErM3NEQW9TcHRDQkVzdFMxbkpEZEJMcnJrTW5h?=
 =?utf-8?B?MlovM0VRdmc3aTJlSkxNLzZJekJyMGtmQ2M2KytVOWVtR0kxRTZ5bENkZFlN?=
 =?utf-8?B?bEFCNGxLanhrMGNMeElzMmRqVjJwS3d6ekVKYkFyTWZHL1kvSVlGcDZvYmFr?=
 =?utf-8?B?VzR2WDlNYS9uMjVLOGV0V2tqS3djR0NvNzg0SjJDdVlWR1lCUmExSk8wMVR1?=
 =?utf-8?B?VUJEZGpLV0RZZTQ3SHhacUx6UWRRNlpxcFMrUThvbml6SFRoYjM3QjlscnQv?=
 =?utf-8?B?bk90bzQ1elZPQXkrVHY5Y1ZsRlF3REN3NmZTZDRLOWhrMGd1US9ZZGJYSkV3?=
 =?utf-8?B?UlJ6K2lwU1NTd2FYeTRxd0dRVlI2VnZ6eEkxT1h4alVrRmpnbi93c0tQRU1F?=
 =?utf-8?B?eUxFOGhQbXViVVdjdDE2UnpiSi9PdTMrWUJRdEhSbWd0Vk94a3l6NUZpTXhh?=
 =?utf-8?B?R3J2d2sySFlabk8vaUJacm5KZ0N4KzNOQlloWU1GRUc1QmJFWlltN0grWnk0?=
 =?utf-8?B?b1hDbjRsR3VmeTlXWXFPRWlKelNodWU1ZHlVcW5QZk5TSFpqeFMzS2dDeEpQ?=
 =?utf-8?B?S3ZPMHhlVFNXRnk0dkEwbG9zbS8rQUNVN2lvdWQ1Y0pSalNPTHkwOHNISFph?=
 =?utf-8?B?UHhtWnBiMzF6b2h0UkdwRXkxdXB4YTRqWkFkOHV1clJSbzVsSStkY3NXbDlS?=
 =?utf-8?B?aG93cmhhbU0yMndMTGtMWkVreG90WDBCYXpFVzh4VFZKZU1tOStLNTkxMkQx?=
 =?utf-8?B?cThjcHVXMENNWGlLWjNFZGs2YkxrMFVvV3B5eTFZelloZUJJemI3K3AyNlFJ?=
 =?utf-8?B?eWxFaEhWQXhRaVZCVVZRZVBPTnJ2bDhsc3gxeGtUZ21xMkVrbXhGNGh1b0Jq?=
 =?utf-8?B?dzZZaVA3ZExHQ3RLb0NvK1l1Q1pvMWNFQ0FBWi9SbVVtTzRucU4weEI0LzMy?=
 =?utf-8?B?U0NhT2w5Rzc5QzRZNFVOTUpYa1Rmb3R4TVhTRU9WUjVaUGk1NW01T3Z3Lzcv?=
 =?utf-8?B?VnU3bE1rR2pxRExhTVJZSElndG83aGJ0VDZNN2JxeFpuOFE4THB6dC8xbnhn?=
 =?utf-8?B?My81MUhTeWlXU21IRUZidFBpZ29pRk51VGVTc1Mvc0FIQVN3MW0vYWtoUTZB?=
 =?utf-8?B?MjVrbWVHR3RpaE5CenlwaUFrdWxUOXJ3MzRISHFhZGNsQkFLanc2emI5eE13?=
 =?utf-8?B?b2hLWVNINTd0d2tuNWhFOVhhaCtkdEVUM0JyWkZ6ZmNSZGhkb0NMT29pTEln?=
 =?utf-8?B?Nm94ZFBTWTEwTlRUd0k2d0xsRjg1WHlCTnZtY3JlZmZaS1BwZnp4YXhSekVa?=
 =?utf-8?B?L1kxK0JDMnhKOUhVRHFjR0orK0dpM25JenVlZVROU016Wjc4a0oyeHlxZGNy?=
 =?utf-8?B?TGxpcVRqQ1dIQzhKejU3dHB5Z1BEdWgwQldqTC9yUTRYOEVsMHRxNVZMeU1P?=
 =?utf-8?B?dGlVVU9EUGNWNGp1Nkl6cGFDeHM3RjNNdm55R244NTFIdnIvSHNweDJ6MkY0?=
 =?utf-8?B?NnE3SzE2eXlUOXliQ0pndTBLWnp1ZytBcTNybkoxY3gzcGkrZHljL3J1QUFn?=
 =?utf-8?B?b1QwLzRkdGh2ZDQvSTZ2Tmx5NzVjVFNLN0ppSHpneFJDVE1TUjliNHVIOTNM?=
 =?utf-8?B?dDEyVzJSNDVqdURWTXk1MDJSN243djAzeVhYeGk0RHBBV1dYellhbjliajdN?=
 =?utf-8?B?NFFKU2FKY1lkWnRVV1NUZDhNSWtlSUJzdTZiZy90cUJGVG8wbVFENWljdlB1?=
 =?utf-8?B?ZVM0eTVlSWNPN0pla2UvTDV2V3dXSGJaeU9RLzdJQlZtNTUzNDlQWkxyUlFw?=
 =?utf-8?B?M3EzekRKa09aTTQwYzBsNTIzbWl6dVdIQ0g2UHdCTlZ6L1d4WmNrc1BFVGha?=
 =?utf-8?B?Vkx2cjlycmVibG05UEMxN0t5VFFzOHBBY3R1bVFzNVBMeGl4N0FLQjVCL3ls?=
 =?utf-8?B?NHcxdlJoTWpXaC9nVnQvZnNuK0hJWFBMWjhjN2hGMVE4Qi9WeUhtZlgvajJn?=
 =?utf-8?Q?R5WGAo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:04:09.0934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b934531-4681-4bb8-9e07-08dda45b5e8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882

On Sat May 31, 2025 at 3:42 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> Part of an unpicking process to extract bootfdt contents independent of
>> bootinfo to a separate file for x86 to take.
>>=20
>> With this, bootfdt.h can be cleanly included from x86. A later patch
>> extracts the definitions so the functions may be called too.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  xen/arch/arm/domain_build.c             |   1 +
>>  xen/arch/arm/mmu/mm.c                   |   1 +
>>  xen/arch/riscv/mm.c                     |   2 +-
>>  xen/arch/riscv/setup.c                  |   2 +-
>>  xen/common/device-tree/bootfdt.c        |   1 +
>>  xen/common/device-tree/bootinfo.c       |   2 +-
>>  xen/common/device-tree/dom0less-build.c |   2 +-
>>  xen/common/device-tree/domain-build.c   |   2 +-
>>  xen/common/device-tree/kernel.c         |   2 +-
>>  xen/include/xen/bootfdt.h               | 206 -----------------------
>>  xen/include/xen/bootinfo.h              | 212 ++++++++++++++++++++++++
>>  xen/include/xen/device_tree.h           |   2 +-
>>  xen/include/xen/fdt-domain-build.h      |   2 +-
>>  xen/include/xen/fdt-kernel.h            |   2 +-
>>  14 files changed, 224 insertions(+), 215 deletions(-)
>>  create mode 100644 xen/include/xen/bootinfo.h
>>=20
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 11cc03e5db..c53da76682 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1,5 +1,6 @@
>>  /* SPDX-License-Identifier: GPL-2.0-only */
>>  #include <xen/init.h>
>> +#include <xen/bootinfo.h>
>>  #include <xen/compile.h>
>>  #include <xen/fdt-domain-build.h>
>>  #include <xen/fdt-kernel.h>
>> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
>> index 9c50479c63..77f82757bb 100644
>> --- a/xen/arch/arm/mmu/mm.c
>> +++ b/xen/arch/arm/mmu/mm.c
>> @@ -1,5 +1,6 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>> =20
>> +#include <xen/bootinfo.h>
>>  #include <xen/init.h>
>>  #include <xen/lib.h>
>>  #include <xen/macros.h>
>> diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>> index d3ece9f132..040db73d00 100644
>> --- a/xen/arch/riscv/mm.c
>> +++ b/xen/arch/riscv/mm.c
>> @@ -1,6 +1,6 @@
>>  /* SPDX-License-Identifier: GPL-2.0-only */
>> =20
>> -#include <xen/bootfdt.h>
>> +#include <xen/bootinfo.h>
>>  #include <xen/bug.h>
>>  #include <xen/compiler.h>
>>  #include <xen/init.h>
>> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
>> index 4e416f6e44..0a2d0dc1eb 100644
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -2,7 +2,7 @@
>> =20
>>  #include <xen/acpi.h>
>>  #include <xen/bug.h>
>> -#include <xen/bootfdt.h>
>> +#include <xen/bootinfo.h>
>>  #include <xen/compile.h>
>>  #include <xen/device_tree.h>
>>  #include <xen/init.h>
>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/b=
ootfdt.c
>> index 529c91e603..fb4ac06390 100644
>> --- a/xen/common/device-tree/bootfdt.c
>> +++ b/xen/common/device-tree/bootfdt.c
>> @@ -6,6 +6,7 @@
>>   */
>> =20
>>  #include <xen/bootfdt.h>
>
> Is this kept on purpose?

No. Should've been subsumed

Cheers,
Alejandro

