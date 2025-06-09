Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C2AD1A20
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 10:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010161.1388303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYKE-0004Fj-Kk; Mon, 09 Jun 2025 08:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010161.1388303; Mon, 09 Jun 2025 08:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYKE-0004EH-Hh; Mon, 09 Jun 2025 08:57:50 +0000
Received: by outflank-mailman (input) for mailman id 1010161;
 Mon, 09 Jun 2025 08:57:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+Qs=YY=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uOYKC-0004EB-Qo
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 08:57:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdbb8926-450f-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 10:57:42 +0200 (CEST)
Received: from PH7P220CA0176.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::29)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 08:57:33 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:510:33b:cafe::4) by PH7P220CA0176.outlook.office365.com
 (2603:10b6:510:33b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 08:57:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 08:57:32 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 03:57:29 -0500
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
X-Inumbo-ID: cdbb8926-450f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldCkX0qDcKSazz/64T+VlRh2oxAZ8jYyEG8QaUJnkiTUM9/shUiI+mycW8keryyGpUFoI0aR/nj0U6DLo1sFXWu7L5bcgWU5KceSOCq3nDHKAYdVd1dROuClpipEMSuzo2IQcnnH77nSGx4ZuSHPFHCSdv+GNmTrxnerulwu6tFO9rpwGGzOCSdj4Gw3nxjM/BzNA/nRMiRoIqtD9sordXeqe88uP/8uh1XsgGVMq7wIAxlz4U3m6oPVcpei9/LScUEvWanTPDNQt0zAfXkmHDcY/IV9q7yUZygC9gbO3auEx3XiJTdd+NziE3S9DH0gJGZtUB73gm4QI5FLaVZv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//rOgV1lkZ3K+GPF2ikpI2nbOZsOTAvgIfp/KleYHoA=;
 b=Qh2tj/dprvbBByHXoOJk/WJh3zmU32718ktp1ywrGrFJQbKimffBWZPYI4DNsjKpcpAUlo3bER4EMSmznzQHYGY3WZ6/6uQZapgI3gX86Dli4QFaCgSuA9WlIwEDrFUkpz15X8iErgW8tv+vQl/J1/ShlVrRQFX9n9UTjn7b9YuyV8AS4SL3mHmjoJbzlNnhiEAM4pekeVH2oIpAHdvSyI6LvuoaNzzK4u/Bl/Ej8go77pgBNsB5sGTp/ZsDFsZhn3o9DuetnvO2ZQdWl3aU7ENr82+RmMqr3V2lRyjpNtcGWG9w7puE8BT79X1QrEodDw8Uun1YQjlVOtzaBeWpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//rOgV1lkZ3K+GPF2ikpI2nbOZsOTAvgIfp/KleYHoA=;
 b=QkjzDF3A9Vj37krYXfmyUFSVB6P2iTW7A5PLpkYVa3PrLCGoebDTkH6mGuxUuA4KuPdHUUWzcllw60EOareSA5GLxjxaamteBGZ4cMGBZMyD/ZcW90kaXlkfiVaeaNvxr/xv2WaC3nlSb+ltp//SGmwqOqJTXN0sFXXkNY/m1zk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 9 Jun 2025 10:57:27 +0200
Message-ID: <DAHVM7420N2J.39X8IUHOX2B97@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 07/15] x86: Replace boot_domain with bootdomain
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-8-agarciav@amd.com>
 <alpine.DEB.2.22.394.2506061623500.2495561@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2506061623500.2495561@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f24e586-fda7-41ce-d658-08dda733ac02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2N4bzdNSFZBVHNvdW1tU1l2V25nYkxDN21JOFQ3NmZqT2g0M1FacnZORVV6?=
 =?utf-8?B?RHhDc2hTcmF1SjA2aTdYeVRoSmFieGpyL3htK2hmejVzN0laTXQwZXp6L1l2?=
 =?utf-8?B?dk5vSzc2UE94V016Y2E0QWNUWEZKYjk1V0tNWWZWcjFJZzRKSVliNHdod3N2?=
 =?utf-8?B?R3F4R3EvK3A5NDZLbTYyaUZBQ2pzY01YdnpGSzlWazRQTUZnVFkxQWZvakZX?=
 =?utf-8?B?czdpaTFHWDJBVFFkY05hN3Q1N1U4Mkx0dDhkNTNpbVEzaFFwTmYyU2Y0MkNp?=
 =?utf-8?B?a3hydjdlQms5YmlpRUkreTdmTkNQWDdENksvZ1NyM2orRGNRTkdqS2tOMkxv?=
 =?utf-8?B?WUVBT3M0MWVqQ0o5WXFmQXdUd3hIK2Q1cXVnbW1kTE41TU9CMmhIVTRvYTI1?=
 =?utf-8?B?MXQ5b2NSMGhWd2pEUlkwekNvY05VZ3o3YmFWMlNIc0hHaEZlOWQ4K3FSNFpr?=
 =?utf-8?B?TzI4YmR6eEdha2FyWjNUU1VhRlhKU2Erbk1tdE02V1JhMVJ5SzB6MmVSMm9u?=
 =?utf-8?B?bDBmK3JUbmxoTzI3a0tEUE1sUmU2T0RqcXZ2bHR6clUvbHNUajE2RzNqczlK?=
 =?utf-8?B?R05DV2J4QXk4M2xvWXpJYXFBeXRsYzN1aTllOGl1WW5FNk14S25FanlHZXpC?=
 =?utf-8?B?dGtndmh3bXpNcWdBMnk2Qktpd0pKQjNJV1gyRzVYZ1dZanNJRmtVbmRCYUx3?=
 =?utf-8?B?UDlHclVGYjRzV2NBcE4xQ2Q1ZkRuUVhrVVpyb3JpUG5sN3pLTnVQZXVrK2FW?=
 =?utf-8?B?cnNvSE1yZjVrcnE5SUJsQklwSjVGcGtXRkR3aXZDUTd6VnhUemhKcUo3N3gv?=
 =?utf-8?B?MjVyN3BtbjZaNlRPV3BJVWJYc0hqU0pXYlZNNUN2UmdXTEVoY1JqUVdMN1Qw?=
 =?utf-8?B?c2pST2hVU2JPS3FDZ0ZUd0FNRDdwTmpBK1VUVVA2N2Y5NHhQWDF5SmxzS0RF?=
 =?utf-8?B?V2t0bHlEZEEzTU5vN2RyL3d5Z1JCSUVSd1dBOG9zai9xc3U4WVo5YmFhN2I1?=
 =?utf-8?B?cGpsU0M2b2pUTFV0cGZDN0cxSTIzWmhDVnEwdVNFL0dIaG4wdVlhSzJGRE9t?=
 =?utf-8?B?cEwxNmNkWU5XcXowbkMzTVNuSXRYb1hGeWE4NW5rVGdvcnhSeDZXdTh4ekQ4?=
 =?utf-8?B?Si9UT0RlTzdpM1lNVmV4c1V6OVFNbHhBL1JCVlZBRmh6MEdCSVVEeExqK2RU?=
 =?utf-8?B?R2FyMkY4Y1d5clhVZW1hMFNVUmVmVGVHY3RQZ1lLYnBCZTgzUnNTQVR0cWNp?=
 =?utf-8?B?aG9zVVdZbHVEd3FjT2FKdzdjbFZFalFBMGpGVzFSMG1yUnJaQ1FvYnlNYTJQ?=
 =?utf-8?B?cTZPQlJKV0dqY1FoWEJ1MnJCSytLVjlMbDJqQnkvTS9KZ0hlcVRjSTd0UW5q?=
 =?utf-8?B?YmRqRmo3N3VZTWhUT0t6ZStwelZ3b1FHY3FRRjRwV0pwYk5SeWxOVUNpcWt5?=
 =?utf-8?B?blBiSGdOdTJJV1VGMG13NTRlR2xFRXRYVWhkVG11aXBJVko2RFlDTnp5Z20r?=
 =?utf-8?B?TVNQK0pLdytKNU9OZ3h6eFEyNkhHeVNWcWlHeVVtTjlUN2VvM3hzdkp1Slh3?=
 =?utf-8?B?N1pRNXJ2VXRicjV3cHFXKzNyaXVncjRucVlENzVrczlaY3QwTzJqZXFxRnFU?=
 =?utf-8?B?c2xhb0Q3Z28vcEJFNXkwL2pnTlBCbzBhS2czUnBMV2szVEVnUEZOM1daOU1Y?=
 =?utf-8?B?SGRvV1oxRWptZUc1S1Z6c2xyaWgzVExvWDdMVlJiWWErcXhwYXc5UFJGMDNv?=
 =?utf-8?B?eUpYWDN0bllxRGFrV1o4Q2l2Wmx1WjI2SWJVQ0N5Y3d6M1dFdFZ0Rzl1WVdX?=
 =?utf-8?B?eTNYSG13SHpEZnZHdk00NDhZZlR3b0ZOd1B3WE4yczJXT255VWxaRFArVEli?=
 =?utf-8?B?UVB4Y1VlN3hCNXFZYmc0WkIzUkNMcHBSOE11RHFFeFR1SkVvMFVtcFM1VHgw?=
 =?utf-8?B?OTU0L1dEMHRldmpGamlsVUcxSm9LVnRaSDVnR3R4QVVvRnh4ZnQvb0JUVUU1?=
 =?utf-8?B?NStpdEcrVFg4dWZrMjdTbTE5Q1VNV1ZlblBWWTZiWFhvenhQTDI2TExBc1Js?=
 =?utf-8?Q?SERyml?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:57:32.6236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f24e586-fda7-41ce-d658-08dda733ac02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

On Sat Jun 7, 2025 at 1:28 AM CEST, Stefano Stabellini wrote:
> On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
>> No functional change intended.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v2:
>>   * Replaces the previous patch in which kernel_info replaced boot_domai=
n
>> ---
>>  xen/arch/x86/dom0_build.c              |  2 +-
>>  xen/arch/x86/hvm/dom0_build.c          |  6 ++---
>>  xen/arch/x86/include/asm/boot-domain.h | 33 --------------------------
>>  xen/arch/x86/include/asm/bootfdt.h     |  7 ++++++
>>  xen/arch/x86/include/asm/bootinfo.h    |  3 +--
>>  xen/arch/x86/include/asm/dom0_build.h  |  6 ++---
>>  xen/arch/x86/include/asm/setup.h       |  4 ++--
>>  xen/arch/x86/pv/dom0_build.c           |  6 ++---
>>  xen/arch/x86/setup.c                   | 16 +++++++------
>>  xen/include/xen/bootfdt.h              |  4 ++++
>>  10 files changed, 33 insertions(+), 54 deletions(-)
>>  delete mode 100644 xen/arch/x86/include/asm/boot-domain.h
>>=20
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 0b467fd4a4..1c8c5140a3 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -615,7 +615,7 @@ int __init dom0_setup_permissions(struct domain *d)
>>      return rc;
>>  }
>> =20
>> -int __init construct_dom0(const struct boot_domain *bd)
>> +int __init construct_dom0(const struct bootdomain *bd)
>>  {
>>      int rc;
>>      const struct domain *d =3D bd->d;
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index 96410344a8..85c000b259 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -644,11 +644,11 @@ static bool __init check_and_adjust_load_address(
>>  }
>> =20
>>  static int __init pvh_load_kernel(
>> -    const struct boot_domain *bd, paddr_t *entry, paddr_t *start_info_a=
ddr)
>> +    const struct bootdomain *bd, paddr_t *entry, paddr_t *start_info_ad=
dr)
>>  {
>>      struct domain *d =3D bd->d;
>>      struct bootmodule *image =3D bd->kernel;
>> -    struct bootmodule *initrd =3D bd->module;
>> +    struct bootmodule *initrd =3D bd->initrd;
>>      void *image_base =3D bootstrap_map_bm(image);
>>      void *image_start =3D image_base + image->arch.headroom;
>>      unsigned long image_len =3D image->size;
>> @@ -1329,7 +1329,7 @@ static void __hwdom_init pvh_setup_mmcfg(struct do=
main *d)
>>      }
>>  }
>> =20
>> -int __init dom0_construct_pvh(const struct boot_domain *bd)
>> +int __init dom0_construct_pvh(const struct bootdomain *bd)
>>  {
>>      paddr_t entry, start_info;
>>      struct domain *d =3D bd->d;
>> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/inclu=
de/asm/boot-domain.h
>> deleted file mode 100644
>> index 242e9c9c2b..0000000000
>> --- a/xen/arch/x86/include/asm/boot-domain.h
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-or-later */
>> -/*
>> - * Copyright (c) 2024 Apertus Solutions, LLC
>> - * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
>> - * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
>> - */
>> -
>> -#ifndef __XEN_X86_BOOTDOMAIN_H__
>> -#define __XEN_X86_BOOTDOMAIN_H__
>> -
>> -#include <public/xen.h>
>> -
>> -struct boot_domain {
>> -    domid_t domid;
>> -
>> -    struct bootmodule *kernel;
>> -    struct bootmodule *module;
>> -    const char *cmdline;
>> -
>> -    struct domain *d;
>> -};
>> -
>> -#endif
>> -
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * tab-width: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/a=
sm/bootfdt.h
>> index 2fc705a1cd..b30132381e 100644
>> --- a/xen/arch/x86/include/asm/bootfdt.h
>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>> @@ -4,6 +4,13 @@
>> =20
>>  #include <xen/types.h>
>> =20
>> +#include <public/xen.h>
>> +
>> +struct arch_bootdomain
>> +{
>> +    domid_t domid;
>> +};
>> +
>>  struct arch_bootmodule
>>  {
>>      /*
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index f3210b7d6a..b8280ba357 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -12,7 +12,6 @@
>>  #include <xen/init.h>
>>  #include <xen/multiboot.h>
>>  #include <xen/types.h>
>> -#include <asm/boot-domain.h>
>> =20
>>  /* Max number of boot modules a bootloader can provide in addition to X=
en */
>>  #define MAX_NR_BOOTMODS 63
>> @@ -34,7 +33,7 @@ struct boot_info {
>> =20
>>      unsigned int nr_modules;
>>      struct bootmodule mods[MAX_NR_BOOTMODS + 1];
>> -    struct boot_domain domains[MAX_NR_BOOTDOMS];
>> +    struct bootdomain  domains[MAX_NR_BOOTDOMS];
>>  };
>> =20
>>  /*
>> diff --git a/xen/arch/x86/include/asm/dom0_build.h b/xen/arch/x86/includ=
e/asm/dom0_build.h
>> index ff021c24af..df03189870 100644
>> --- a/xen/arch/x86/include/asm/dom0_build.h
>> +++ b/xen/arch/x86/include/asm/dom0_build.h
>> @@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
>>                                      unsigned long initrd_len);
>>  int dom0_setup_permissions(struct domain *d);
>> =20
>> -struct boot_domain;
>> -int dom0_construct_pv(const struct boot_domain *bd);
>> -int dom0_construct_pvh(const struct boot_domain *bd);
>> +struct bootdomain;
>> +int dom0_construct_pv(const struct bootdomain *bd);
>> +int dom0_construct_pvh(const struct bootdomain *bd);
>> =20
>>  unsigned long dom0_paging_pages(const struct domain *d,
>>                                  unsigned long nr_pages);
>> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm=
/setup.h
>> index c7deaba109..a8647f0fdf 100644
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -26,8 +26,8 @@ void subarch_init_memory(void);
>> =20
>>  void init_IRQ(void);
>> =20
>> -struct boot_domain;
>> -int construct_dom0(const struct boot_domain *bd);
>> +struct bootdomain;
>> +int construct_dom0(const struct bootdomain *bd);
>> =20
>>  void setup_io_bitmap(struct domain *d);
>> =20
>> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
>> index e6c77413f5..a6f212fe0a 100644
>> --- a/xen/arch/x86/pv/dom0_build.c
>> +++ b/xen/arch/x86/pv/dom0_build.c
>> @@ -355,7 +355,7 @@ static struct page_info * __init alloc_chunk(struct =
domain *d,
>>      return page;
>>  }
>> =20
>> -static int __init dom0_construct(const struct boot_domain *bd)
>> +static int __init dom0_construct(const struct bootdomain *bd)
>>  {
>>      unsigned int i;
>>      int rc, order, machine;
>> @@ -375,7 +375,7 @@ static int __init dom0_construct(const struct boot_d=
omain *bd)
>>      struct vcpu *v =3D d->vcpu[0];
>> =20
>>      struct bootmodule *image =3D bd->kernel;
>> -    struct bootmodule *initrd =3D bd->module;
>> +    struct bootmodule *initrd =3D bd->initrd;
>>      void *image_base;
>>      unsigned long image_len;
>>      void *image_start;
>> @@ -1070,7 +1070,7 @@ out:
>>      return rc;
>>  }
>> =20
>> -int __init dom0_construct_pv(const struct boot_domain *bd)
>> +int __init dom0_construct_pv(const struct bootdomain *bd)
>>  {
>>      unsigned long cr4 =3D read_cr4();
>>      int rc;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index e9a70c2c2b..726adad0e5 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -297,7 +297,9 @@ static const char *cmdline_cook(const char *p, const=
 char *loader_name);
>>  struct boot_info __initdata xen_boot_info =3D {
>>      .loader =3D "unknown",
>>      .cmdline =3D "",
>> -    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D { .domid =3D DOMID_I=
NVALID } },
>> +    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D {
>> +        .arch.domid =3D DOMID_INVALID
>> +    }},
>>      /*
>>       * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by=
 one.
>>       *
>> @@ -987,7 +989,7 @@ static unsigned int __init copy_bios_e820(struct e82=
0entry *map, unsigned int li
>>  }
>> =20
>>  static size_t __init domain_cmdline_size(const struct boot_info *bi,
>> -                                         const struct boot_domain *bd)
>> +                                         const struct bootdomain *bd)
>>  {
>>      size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>>      const struct arch_bootmodule *abm =3D &bd->kernel->arch;
>> @@ -1022,7 +1024,7 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>              .misc_flags =3D opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED =
: 0,
>>          },
>>      };
>> -    struct boot_domain *bd =3D &bi->domains[0];
>> +    struct bootdomain *bd =3D &bi->domains[0];
>>      struct domain *d;
>> =20
>>      if ( opt_dom0_pvh )
>> @@ -1039,11 +1041,11 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>>      /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid =3D get_initial_domain_id();
>> -    d =3D domain_create(bd->domid, &dom0_cfg,
>> +    bd->arch.domid =3D get_initial_domain_id();
>> +    d =3D domain_create(bd->arch.domid, &dom0_cfg,
>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>      if ( IS_ERR(d) )
>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>> =20
>>      init_dom0_cpuid_policy(d);
>> =20
>> @@ -2162,7 +2164,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>      if ( initrdidx < MAX_NR_BOOTMODS )
>>      {
>>          bi->mods[initrdidx].kind =3D BOOTMOD_RAMDISK;
>> -        bi->domains[0].module =3D &bi->mods[initrdidx];
>> +        bi->domains[0].initrd =3D &bi->mods[initrdidx];
>>          if ( first_boot_module_index(bi, BOOTMOD_UNKNOWN) < MAX_NR_BOOT=
MODS )
>>              printk(XENLOG_WARNING
>>                     "Multiple initrd candidates, picking module #%u\n",
>> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
>> index e6d52a599f..19d2ff0f0c 100644
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -108,6 +108,10 @@ struct bootdomain {
>>      struct bootmodule *initrd;
>> =20
>>      const char* cmdline;
>> +
>> +#if __has_include(<asm/bootfdt.h>)
>> +    struct arch_bootdomain arch;
>> +#endif
>>  };
>
> One suggestion for improvement:

That would function today, but that field is important later on when we
retrieve the domid from the DTB. That's where it's stored until we create t=
hem.

>
> diff --git a/xen/arch/x86/include/asm/bootfdt.h b/xen/arch/x86/include/as=
m/bootfdt.h
> index b30132381e..892a0e2373 100644
> --- a/xen/arch/x86/include/asm/bootfdt.h
> +++ b/xen/arch/x86/include/asm/bootfdt.h
> @@ -6,11 +6,6 @@
> =20
>  #include <public/xen.h>
> =20
> -struct arch_bootdomain
> -{
> -    domid_t domid;
> -};
> -
>  struct arch_bootmodule
>  {
>      /*
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 726adad0e5..39f294b88b 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -297,9 +297,6 @@ static const char *cmdline_cook(const char *p, const =
char *loader_name);
>  struct boot_info __initdata xen_boot_info =3D {
>      .loader =3D "unknown",
>      .cmdline =3D "",
> -    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D {
> -        .arch.domid =3D DOMID_INVALID
> -    }},
>      /*
>       * There's a MAX_NR_BOOTMODS-th entry in the array. It's not off by =
one.
>       *
> @@ -1026,6 +1023,7 @@ static struct domain *__init create_dom0(struct boo=
t_info *bi)
>      };
>      struct bootdomain *bd =3D &bi->domains[0];
>      struct domain *d;
> +    domid_t domid;
> =20
>      if ( opt_dom0_pvh )
>      {
> @@ -1041,11 +1039,11 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
> =20
>      /* Create initial domain.  Not d0 for pvshim. */
> -    bd->arch.domid =3D get_initial_domain_id();
> -    d =3D domain_create(bd->arch.domid, &dom0_cfg,
> +    domid =3D get_initial_domain_id();
> +    d =3D domain_create(domid, &dom0_cfg,
>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>      if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
> +        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
> =20
>      init_dom0_cpuid_policy(d);
> =20
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 19d2ff0f0c..e6d52a599f 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -108,10 +108,6 @@ struct bootdomain {
>      struct bootmodule *initrd;
> =20
>      const char* cmdline;
> -
> -#if __has_include(<asm/bootfdt.h>)
> -    struct arch_bootdomain arch;
> -#endif
>  };
> =20
>  /*

Cheers,
Alejandro

