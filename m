Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE05B0CD8E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 01:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051762.1420180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udzbv-0005iU-Dz; Mon, 21 Jul 2025 23:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051762.1420180; Mon, 21 Jul 2025 23:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udzbv-0005gN-BI; Mon, 21 Jul 2025 23:07:55 +0000
Received: by outflank-mailman (input) for mailman id 1051762;
 Mon, 21 Jul 2025 23:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1C3=2C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1udzbu-0005gH-7q
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 23:07:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2009::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83627a63-6687-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 01:07:46 +0200 (CEST)
Received: from CH0P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::9)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 23:07:43 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::5) by CH0P223CA0021.outlook.office365.com
 (2603:10b6:610:116::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 23:07:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 23:07:42 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 18:07:39 -0500
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
X-Inumbo-ID: 83627a63-6687-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHsfhL4UikzRaBaHs1kyfv0IW1Op9mBNdp9OCp7vtnhcbV1RuLeXjTesVBEH4ozmHtVPqkFRhkLCZmciQ6c7c6LPZkYnz7gL/xdhLpEzyAqK6tJIJ7zqheFKwZvrJUy1J8thZiMrq8xhOwYVAJwpKGkalwH1Dq5bFtj3GsaVyCwPwA8hzMBjEDQURIbzLAB1wbcnQZq0JlIowC8ssnQLuPwP5vlwLJwAUrY7URt361n/XcDamJEnQccLsPDSchGJNr0+ytaKjSPGRapqjy6v+1z4cxcgJtcpNq8OfqLY3tcpp4Vu5o/M7RhS/qg35/qohDhel5jDgajofcouck1PRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5wGzKyRUZnW7HTzIJ0IjWfWR7DHivG01WdxcEDASac=;
 b=Ltx/tY5eCyqIrrrZiYPGjRxCFM1gk65CNS4fZCUbt3IWZsu8PJWy7C8W8U9pSHpJaWuQSouzUbMhPenKZtF/+p4WmObOdV+d9REweRO34kRinLU5e+IHiXqesnuKiUwLxiFSodZzuKrKOIlFyxTA0Y0i4OfktPZwDHJApSO6+tVVoaM6rNraOWX86OsSyiRss6GbPL3xI/Nj7pvn7tDfqUxSOB8oc2M7Hgm7cvDNWPRY6XBVgC/H8pqCe7qZ1QRtr11XHbRdZr2UrhxOAMwGnFdy9JB3XvE2M5GhTOTGejj9DdKfQvMLQZwU9G9WVdmOs8dYUTaWpIrsTibQRsLIIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5wGzKyRUZnW7HTzIJ0IjWfWR7DHivG01WdxcEDASac=;
 b=SV7C1NQCajzMB8YABogoNKDmPMIJX31CFUtCnWc3+/QEJsawY46OuNOfLOffq/JfjsehjdiobGzs+0oWKHYpWZ/CYM+bu6PEfGMIFmLD6ESNV/93jZ8RN/MBjOhBabj7aP+oJGprjrhxUPdlqr9XZYQLjm6J8uCxgph8EGYp9ks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 01:07:38 +0200
Message-ID: <DBI400YRPCVV.1PJA0AMN4CV59@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>
Subject: Re: [PATCH v7 01/11] x86: Replace arch-specific boot_module with
 common one
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
 <20250715161108.141126-2-alejandro.garciavallejo@amd.com>
 <84d9ca22-a303-4490-ad39-aca66685dbb2@apertussolutions.com>
In-Reply-To: <84d9ca22-a303-4490-ad39-aca66685dbb2@apertussolutions.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b446ecc-d295-4d39-fdda-08ddc8ab65cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0NIWFlMT05oMS9wbU0zVXlaUEtyenA5dXQ5OVoxV3dBSTZYaW1PNVE3Yk5D?=
 =?utf-8?B?T2JSUGxWakNvRzhUY0RnN2t1bmh6U1Z2cnVWbHVOSlhiajQ4aVQzdlNHb09I?=
 =?utf-8?B?a215TlFjbmJKb2M4cnJJSlZCbGd3L0dkUXN3UHo3OFdPOVpOSFFoUWhVTkFU?=
 =?utf-8?B?YldBQXlPc0ZGQ01HVFYzd2x4NzRsTUdMVnhsTS9RZS9iK2xJQmpQMHNnYXhh?=
 =?utf-8?B?YkpvQnVDdENRQlNCZlM0TGpFRFJuZlJacFUrUUFjRjRYWEJTUVYwLzk2MmhW?=
 =?utf-8?B?SVg0c2Y4ZmZCc05GMC8zU0NtZDJ1VW1ScnVhcFlNdkdyVjBsdGVpdzRGNW1j?=
 =?utf-8?B?SkM2MDE5enhtYXNGTGMxRHVkWDE1U3ZlTm12WTNYMGNRN2VhYjVYdHNnWFBD?=
 =?utf-8?B?d1pYdWVaNFVEcEZDTXZWaERTaE53ZHBRUURkZ1prL29CYTRROS9Lc1hrc2NT?=
 =?utf-8?B?L015TVpQUE0zY28yOUFVSXBqOW9TSWNPWmhxNEhVVmhBc2NrdTgzU1VSa0dj?=
 =?utf-8?B?QkZwQlM5a3MvYmFXdisyNHI2c3NCRUxEaEpPTnA1VWRSODBEbFo2T1kvNTcz?=
 =?utf-8?B?LzhEbkJyN3NnQkgwalFkNDdhYU02RjdRa1NRb1NnQ1RiaVFUZ3NhZFR3bzFy?=
 =?utf-8?B?N05RbUE1bmxIUExXaUIzb3VteTIvVnNwbm9MWUFIOGt5TDFWRTFaT1AvUHhP?=
 =?utf-8?B?MTlNMys4aUhmY2syV05FTTI1amhSRnZEVDZva2s5UHhySzZERzQ0c3NKeFBO?=
 =?utf-8?B?MGFLWVZuakR0NDBZVVhVL3V4OVNDR3ZEZDFyUVp3a1BYbXl0YjhZUTlwMS9B?=
 =?utf-8?B?U0Nia0FBS2Vyb2tuZkxoQktnYnZOREJ2SGxLTjdZZms4aVRwMzFsZkxUZVZM?=
 =?utf-8?B?NldGaUI0azRZelFKN2Q2bFFHM29CUXQzcWNRc1NLKzY5aStMTlhYNVZ1M3F3?=
 =?utf-8?B?SWVjQlRpSlFIYUJiM0JvNTcvR1lWdU9KSlVZT0VUa1R1RGV3UUpvOGMrYUEx?=
 =?utf-8?B?T01UdGJRTG1lTkh1cnZtckZoaUtKN2pxSDVGb2VRd1dwaGxDVVBHRXAvUmlk?=
 =?utf-8?B?WkxoZTQ3UXozdmF0TE1IbU5lMGJhZnE4MlZQUmJiUy9XanhoQitvY1AzOStF?=
 =?utf-8?B?Yk9MbmJFcUlBbjZ3U2hBSm1hQVNZeWwvdSt6RDN6U25Fb0IzT1Y3WlFlQmVM?=
 =?utf-8?B?OHYxOGpkampVaTBmaHRIWGg0dkFmblFIZ3lUWFg5bDZnVFd3OEcvb1p2bEFh?=
 =?utf-8?B?R2trakRjeFF6YVFCSnRmbG5IbTE4RGlLdXBCellFWkoyczRsRXNnR0o3QXB1?=
 =?utf-8?B?dVJkMUxIQk9wdTdvU1F5NGRhMlNyR3oxYnY0T200K000T256bCtMK3hEMTd5?=
 =?utf-8?B?K01TcFZ5bk1ialFSYTl0UEIzNG9LNGhUdU9UU0JxdHFLQ21BYTM4N283TCti?=
 =?utf-8?B?anUzY3Z1QWEzYjEwQkhFSXZaVE5pd2ZSbmpiNnRKWWFhWUU0QllXNlBsejNJ?=
 =?utf-8?B?dWlVWEZpWGwraENpZlMwdXVJbk91R3BUQnQwZmo0N3RqSis5ci9aRXB5WGVB?=
 =?utf-8?B?bUtTREhvNlB5RUFUWGQxYThwWkNueDBlSDFmZFNKZFc3b2daL0xOQUJ6Mlc5?=
 =?utf-8?B?Vk91SXZnYjJuTjZJanBXRElERnF3endybXlzaEJiNVlka2p2aWU0Z0tFZUh1?=
 =?utf-8?B?aEw2VEo1aDVaWFYreTRaYXdmaVdWVnI2TUJVL3hmNjVRUnJLK3gwNlNONm5K?=
 =?utf-8?B?MGRTYnZQZ2I4am1LZ1JnWWwxT0NoZlY4eWx4VUMvVEhhckZaUzdNTzBtVUhr?=
 =?utf-8?B?N0NHOERKK1QxaUV4cGloVS9xSGcycU1ZS0J3b2twZm9pVXY1Uzd1M2prb3Ir?=
 =?utf-8?B?amJNaldPeTl4N3lzbjBiV2JUeDNya0RQZHNSUkthL2RVU2o1NktFVlU2N3M1?=
 =?utf-8?B?VmV0cHhtQ0YyNWVGYTNBY1FESVg0Yjl2NE1qSi9XZkNhOUdVK3ZjQmVTNity?=
 =?utf-8?B?bEFocE9NL1R3L1lhRTc1d2ZqcXRWYVhqZ1VVQm4vZy9qeTdnYTVZbGZxakZJ?=
 =?utf-8?Q?WMTfXz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 23:07:42.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b446ecc-d295-4d39-fdda-08ddc8ab65cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464

On Tue Jul 22, 2025 at 12:27 AM CEST, Daniel P. Smith wrote:
> On 7/15/25 12:10, Alejandro Vallejo wrote:
>> These types resemble each other very closely in layout and intent,
>> and with "struct boot_module" already in common code it makes perfect
>> sense to merge them. In order to do so, rename identical fields with
>> conflicting names.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/arch/x86/cpu/microcode/core.c   |  7 ++--
>>   xen/arch/x86/hvm/dom0_build.c       |  6 ++--
>>   xen/arch/x86/include/asm/bootfdt.h  | 50 ++++++++++++++++++++++++++
>>   xen/arch/x86/include/asm/bootinfo.h | 56 +++--------------------------
>>   xen/arch/x86/pv/dom0_build.c        |  4 +--
>>   xen/arch/x86/setup.c                | 43 +++++++++++-----------
>>   xen/include/xen/bootfdt.h           |  8 +++++
>>   xen/xsm/xsm_policy.c                |  2 +-
>>   8 files changed, 93 insertions(+), 83 deletions(-)
>>   create mode 100644 xen/arch/x86/include/asm/bootfdt.h
>>=20
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microc=
ode/core.c
>> index 34a94cd25b..816e9bfe40 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -764,8 +764,7 @@ static int __init early_microcode_load(struct boot_i=
nfo *bi)
>>               struct cpio_data cd;
>>  =20
>>               /* Search anything unclaimed or likely to be a CPIO archiv=
e. */
>> -            if ( bm->type !=3D BOOTMOD_UNKNOWN &&
>> -                 bm->type !=3D BOOTMOD_RAMDISK )
>> +            if ( bm->kind !=3D BOOTMOD_UNKNOWN && bm->kind !=3D BOOTMOD=
_RAMDISK )
>>                   continue;
>>  =20
>>               size =3D bm->size;
>> @@ -815,12 +814,12 @@ static int __init early_microcode_load(struct boot=
_info *bi)
>>               return -ENODEV;
>>           }
>>  =20
>> -        if ( bi->mods[idx].type !=3D BOOTMOD_UNKNOWN )
>> +        if ( bi->mods[idx].kind !=3D BOOTMOD_UNKNOWN )
>>           {
>>               printk(XENLOG_WARNING "Microcode: Chosen module %d already=
 used\n", idx);
>>               return -ENODEV;
>>           }
>> -        bi->mods[idx].type =3D BOOTMOD_MICROCODE;
>> +        bi->mods[idx].kind =3D BOOTMOD_MICROCODE;
>>  =20
>>           size =3D bi->mods[idx].size;
>>           data =3D bootstrap_map_bm(&bi->mods[idx]);
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index a038e58c11..2bb8ef355c 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -650,7 +650,7 @@ static int __init pvh_load_kernel(
>>       struct boot_module *image =3D bd->kernel;
>>       struct boot_module *initrd =3D bd->module;
>>       void *image_base =3D bootstrap_map_bm(image);
>> -    void *image_start =3D image_base + image->headroom;
>> +    void *image_start =3D image_base + image->arch.headroom;
>>       unsigned long image_len =3D image->size;
>>       unsigned long initrd_len =3D initrd ? initrd->size : 0;
>>       size_t cmdline_len =3D bd->cmdline ? strlen(bd->cmdline) + 1 : 0;
>> @@ -721,9 +721,9 @@ static int __init pvh_load_kernel(
>>       {
>>           size_t initrd_space =3D elf_round_up(&elf, initrd_len);
>>  =20
>> -        if ( initrd->cmdline_pa )
>> +        if ( initrd->arch.cmdline_pa )
>>           {
>> -            initrd_cmdline =3D __va(initrd->cmdline_pa);
>> +            initrd_cmdline =3D __va(initrd->arch.cmdline_pa);
>>               if ( !*initrd_cmdline )
>>                   initrd_cmdline =3D NULL;
>>           }
>> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/a=
sm/bootfdt.h
>> new file mode 100644
>> index 0000000000..a4c4bf30b9
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>> @@ -0,0 +1,50 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef X86_BOOTFDT_H
>> +#define X86_BOOTFDT_H
>> +
>> +#include <xen/types.h>
>> +
>> +struct arch_boot_module
>> +{
>> +    /*
>> +     * Module State Flags:
>> +     *   relocated:   indicates module has been relocated in memory.
>> +     *   released:    indicates module's pages have been freed.
>> +     */
>> +    bool relocated:1;
>> +    bool released:1;
>> +
>> +    /*
>> +     * A boot module may need decompressing by Xen.  Headroom is an est=
imate of
>> +     * the additional space required to decompress the module.
>> +     *
>> +     * Headroom is accounted for at the start of the module.  Decompres=
sing is
>> +     * done in-place with input=3Dstart, output=3Dstart-headroom, expec=
ting the
>> +     * pointers to become equal (give or take some rounding) when decom=
pression
>> +     * is complete.
>> +     *
>> +     * Memory layout at boot:
>> +     *
>> +     *               start ----+
>> +     *                         v
>> +     *   |<-----headroom------>|<------size------->|
>> +     *                         +-------------------+
>> +     *                         | Compressed Module |
>> +     *   +---------------------+-------------------+
>> +     *   |           Decompressed Module           |
>> +     *   +-----------------------------------------+
>> +     */
>> +    unsigned long headroom;
>> +    paddr_t cmdline_pa;
>> +};
>> +
>> +#endif /* X86_BOOTFDT_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index 3afc214c17..d33b100e04 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -8,6 +8,7 @@
>>   #ifndef X86_BOOTINFO_H
>>   #define X86_BOOTINFO_H
>>  =20
>> +#include <xen/bootfdt.h>
>>   #include <xen/init.h>
>>   #include <xen/multiboot.h>
>>   #include <xen/types.h>
>> @@ -19,55 +20,6 @@
>>   /* Max number of boot domains that Xen can construct */
>>   #define MAX_NR_BOOTDOMS 1
>>  =20
>> -/* Boot module binary type / purpose */
>> -enum bootmod_type {
>> -    BOOTMOD_UNKNOWN,
>> -    BOOTMOD_XEN,
>> -    BOOTMOD_KERNEL,
>> -    BOOTMOD_RAMDISK,
>> -    BOOTMOD_MICROCODE,
>> -    BOOTMOD_XSM_POLICY,
>> -};
>> -
>> -struct boot_module {
>> -    enum bootmod_type type;
>> -
>> -    /*
>> -     * Module State Flags:
>> -     *   relocated: indicates module has been relocated in memory.
>> -     *   released:  indicates module's pages have been freed.
>> -     */
>> -    bool relocated:1;
>> -    bool released:1;
>> -
>> -    /*
>> -     * A boot module may need decompressing by Xen.  Headroom is an est=
imate of
>> -     * the additional space required to decompress the module.
>> -     *
>> -     * Headroom is accounted for at the start of the module.  Decompres=
sing is
>> -     * done in-place with input=3Dstart, output=3Dstart-headroom, expec=
ting the
>> -     * pointers to become equal (give or take some rounding) when decom=
pression
>> -     * is complete.
>> -     *
>> -     * Memory layout at boot:
>> -     *
>> -     *               start ----+
>> -     *                         v
>> -     *   |<-----headroom------>|<------size------->|
>> -     *                         +-------------------+
>> -     *                         | Compressed Module |
>> -     *   +---------------------+-------------------+
>> -     *   |           Decompressed Module           |
>> -     *   +-----------------------------------------+
>> -     */
>> -    unsigned long headroom;
>> -
>> -    paddr_t cmdline_pa;
>> -
>> -    paddr_t start;
>> -    size_t size;
>> -};
>> -
>>   /*
>>    * Xen internal representation of information provided by the
>>    * bootloader/environment, or derived from the information.
>> @@ -94,16 +46,16 @@ struct boot_info {
>>    *      Failure - a value greater than MAX_NR_BOOTMODS
>>    */
>>   static inline unsigned int __init next_boot_module_index(
>> -    const struct boot_info *bi, enum bootmod_type t, unsigned int start=
)
>> +    const struct boot_info *bi, boot_module_kind k, unsigned int start)
>>   {
>>       unsigned int i;
>>  =20
>> -    if ( t =3D=3D BOOTMOD_XEN )
>> +    if ( k =3D=3D BOOTMOD_XEN )
>>           return bi->nr_modules;
>>  =20
>>       for ( i =3D start; i < bi->nr_modules; i++ )
>>       {
>> -        if ( bi->mods[i].type =3D=3D t )
>> +        if ( bi->mods[i].kind =3D=3D k )
>>               return i;
>>       }
>>  =20
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index e1b78d47c2..a4b5362357 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -422,7 +422,7 @@ static int __init dom0_construct(const struct boot_d=
omain *bd)
>>  =20
>>       image_base =3D bootstrap_map_bm(image);
>>       image_len =3D image->size;
>> -    image_start =3D image_base + image->headroom;
>> +    image_start =3D image_base + image->arch.headroom;
>>  =20
>>       d->max_pages =3D ~0U;
>>  =20
>> @@ -659,7 +659,7 @@ static int __init dom0_construct(const struct boot_d=
omain *bd)
>>                * pages. Tell the boot_module handling that we've freed i=
t, so the
>>                * memory is left alone.
>>                */
>> -            initrd->released =3D true;
>> +            initrd->arch.released =3D true;
>>           }
>>  =20
>>           iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 24e4f5ac7f..7e70b46332 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -303,7 +303,7 @@ struct boot_info __initdata xen_boot_info =3D {
>>        *
>>        * The extra entry exists to be able to add the Xen image as a mod=
ule.
>>        */
>> -    .mods =3D { [0 ... MAX_NR_BOOTMODS] =3D { .type =3D BOOTMOD_UNKNOWN=
 } },
>> +    .mods =3D { [0 ... MAX_NR_BOOTMODS] =3D { .kind =3D BOOTMOD_UNKNOWN=
 } },
>>   };
>>  =20
>>   static struct boot_info *__init multiboot_fill_boot_info(
>> @@ -338,7 +338,7 @@ static struct boot_info *__init multiboot_fill_boot_=
info(
>>        */
>>       for ( i =3D 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>>       {
>> -        bi->mods[i].cmdline_pa =3D mods[i].string;
>> +        bi->mods[i].arch.cmdline_pa =3D mods[i].string;
>>  =20
>>           if ( efi_enabled(EFI_LOADER) )
>>           {
>> @@ -361,7 +361,7 @@ static struct boot_info *__init multiboot_fill_boot_=
info(
>>       }
>>  =20
>>       /* Variable 'i' should be one entry past the last module. */
>> -    bi->mods[i].type =3D BOOTMOD_XEN;
>> +    bi->mods[i].kind =3D BOOTMOD_XEN;
>>  =20
>>       return bi;
>>   }
>> @@ -388,11 +388,11 @@ unsigned long __init initial_images_nrpages(nodeid=
_t node)
>>  =20
>>   void __init release_boot_module(struct boot_module *bm)
>>   {
>> -    ASSERT(!bm->released);
>> +    ASSERT(!bm->arch.released);
>>  =20
>>       init_domheap_pages(bm->start, bm->start + PAGE_ALIGN(bm->size));
>>  =20
>> -    bm->released =3D true;
>> +    bm->arch.released =3D true;
>>   }
>>  =20
>>   void __init free_boot_modules(void)
>> @@ -402,7 +402,7 @@ void __init free_boot_modules(void)
>>  =20
>>       for ( i =3D 0; i < bi->nr_modules; ++i )
>>       {
>> -        if ( bi->mods[i].released )
>> +        if ( bi->mods[i].arch.released )
>>               continue;
>>  =20
>>           release_boot_module(&bi->mods[i]);
>> @@ -997,8 +997,8 @@ static size_t __init domain_cmdline_size(const struc=
t boot_info *bi,
>>   {
>>       size_t s =3D 0;
>>  =20
>> -    if ( bd->kernel->cmdline_pa )
>> -        s +=3D strlen(__va(bd->kernel->cmdline_pa));
>> +    if ( bd->kernel->arch.cmdline_pa )
>> +        s +=3D strlen(__va(bd->kernel->arch.cmdline_pa));
>>  =20
>>       if ( bi->kextra )
>>           s +=3D strlen(bi->kextra);
>> @@ -1065,9 +1065,10 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>           if ( !(cmdline =3D xzalloc_array(char, cmdline_size)) )
>>               panic("Error allocating cmdline buffer for %pd\n", d);
>>  =20
>> -        if ( bd->kernel->cmdline_pa )
>> +        if ( bd->kernel->arch.cmdline_pa )
>>               strlcpy(cmdline,
>> -                    cmdline_cook(__va(bd->kernel->cmdline_pa), bi->load=
er),
>> +                    cmdline_cook(__va(bd->kernel->arch.cmdline_pa),
>> +                                 bi->loader),
>>                       cmdline_size);
>>  =20
>>           if ( bi->kextra )
>> @@ -1089,7 +1090,7 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>               strlcat(cmdline, " acpi=3D", cmdline_size);
>>               strlcat(cmdline, acpi_param, cmdline_size);
>>           }
>> -        bd->kernel->cmdline_pa =3D 0;
>> +        bd->kernel->arch.cmdline_pa =3D 0;
>>           bd->cmdline =3D cmdline;
>>       }
>>  =20
>> @@ -1302,7 +1303,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>       }
>>  =20
>>       /* Dom0 kernel is always first */
>> -    bi->mods[0].type =3D BOOTMOD_KERNEL;
>> +    bi->mods[0].kind =3D BOOTMOD_KERNEL;
>>       bi->domains[0].kernel =3D &bi->mods[0];
>>  =20
>>       if ( pvh_boot )
>> @@ -1486,7 +1487,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>           xen->size  =3D __2M_rwdata_end - _stext;
>>       }
>>  =20
>> -    bi->mods[0].headroom =3D
>> +    bi->mods[0].arch.headroom =3D
>>           bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].s=
ize);
>>       bootstrap_unmap();
>>  =20
>> @@ -1568,9 +1569,9 @@ void asmlinkage __init noreturn __start_xen(void)
>>           for ( j =3D bi->nr_modules - 1; j >=3D 0; j-- )
>>           {
>>               struct boot_module *bm =3D &bi->mods[j];
>> -            unsigned long size =3D PAGE_ALIGN(bm->headroom + bm->size);
>> +            unsigned long size =3D PAGE_ALIGN(bm->arch.headroom + bm->s=
ize);
>>  =20
>> -            if ( bm->relocated )
>> +            if ( bm->arch.relocated )
>>                   continue;
>>  =20
>>               /* Don't overlap with other modules (or Xen itself). */
>> @@ -1580,12 +1581,12 @@ void asmlinkage __init noreturn __start_xen(void=
)
>>               if ( highmem_start && end > highmem_start )
>>                   continue;
>>  =20
>> -            if ( s < end && (bm->headroom || (end - size) > bm->start) =
)
>> +            if ( s < end && (bm->arch.headroom || (end - size) > bm->st=
art) )
>>               {
>> -                move_memory(end - size + bm->headroom, bm->start, bm->s=
ize);
>> +                move_memory(end - size + bm->arch.headroom, bm->start, =
bm->size);
>>                   bm->start =3D (end - size);
>> -                bm->size +=3D bm->headroom;
>> -                bm->relocated =3D true;
>> +                bm->size +=3D bm->arch.headroom;
>> +                bm->arch.relocated =3D true;
>>               }
>>           }
>>  =20
>> @@ -1611,7 +1612,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>   #endif
>>       }
>>  =20
>> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>> +    if ( bi->mods[0].arch.headroom && !bi->mods[0].arch.relocated )
>>           panic("Not enough memory to relocate the dom0 kernel image\n")=
;
>>       for ( i =3D 0; i < bi->nr_modules; ++i )
>>       {
>> @@ -2169,7 +2170,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>       initrdidx =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>>       if ( initrdidx < MAX_NR_BOOTMODS )
>>       {
>> -        bi->mods[initrdidx].type =3D BOOTMOD_RAMDISK;
>> +        bi->mods[initrdidx].kind =3D BOOTMOD_RAMDISK;
>>           bi->domains[0].module =3D &bi->mods[initrdidx];
>>           if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOO=
TMODS )
>>               printk(XENLOG_WARNING
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index 7f49d0ccdd..1b19069833 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -7,6 +7,10 @@
>>   #include <xen/macros.h>
>>   #include <xen/xmalloc.h>
>>  =20
>> +#if __has_include(<asm/bootfdt.h>)
>> +#include <asm/bootfdt.h>
>> +#endif
>> +
>>   #define MIN_FDT_ALIGN 8
>>  =20
>>   #define NR_MEM_BANKS 256
>> @@ -110,6 +114,10 @@ struct boot_module {
>>   #endif
>>       paddr_t start;
>>       paddr_t size;
>> +
>> +#if __has_include(<asm/bootfdt.h>)
>> +    struct arch_boot_module arch;
>> +#endif
>>   };
>>  =20
>>   /* DT_MAX_NAME is the node name max length according the DT spec */
>> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
>> index 1f88b4fc5a..1b4030edb4 100644
>> --- a/xen/xsm/xsm_policy.c
>> +++ b/xen/xsm/xsm_policy.c
>> @@ -53,7 +53,7 @@ int __init xsm_multiboot_policy_init(
>>               printk("Policy len %#lx, start at %p.\n",
>>                      _policy_len,_policy_start);
>>  =20
>> -            bm->type =3D BOOTMOD_XSM_POLICY;
>> +            bm->kind =3D BOOTMOD_XSM;
>
> I would ask the change be made the other direction, for the three usages=
=20
> in the device-tree code. This isn't just a personal like, naming matters=
=20
> and XSM does not support external modules, which this insinuates. It=20
> only supports loadable policy and shorting this name creates ambiguity=20
> in something already confusing to many.
>
> v/r,
> dps

Sounds good to me. Will do. I'll re-send it in a jiffy.

Cheers,
Alejandro

