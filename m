Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CDA988ED
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964500.1355278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YfH-0007JW-E7; Wed, 23 Apr 2025 11:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964500.1355278; Wed, 23 Apr 2025 11:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YfH-0007Hn-BP; Wed, 23 Apr 2025 11:53:19 +0000
Received: by outflank-mailman (input) for mailman id 964500;
 Wed, 23 Apr 2025 11:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7YfF-0007Hf-FT
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:53:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87acaca2-2039-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 13:53:12 +0200 (CEST)
Received: from BN9PR03CA0416.namprd03.prod.outlook.com (2603:10b6:408:111::31)
 by DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 11:53:06 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:408:111:cafe::b8) by BN9PR03CA0416.outlook.office365.com
 (2603:10b6:408:111::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Wed,
 23 Apr 2025 11:53:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 11:53:06 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 06:53:00 -0500
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
X-Inumbo-ID: 87acaca2-2039-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC7SrDasos7dCQvz3JYtdey2DQMTMBT/wIKMUSLmgE3ZrB8xwEzwYXUQqkuu3Nmxx+P2RnA0m0gVpy/0AIsoqBJqjUAIYNHvQVftv2foVDiYuDsKcHJLPKabfeglj19Mc1oBfjWJ4Q7nL1byE8lA+jbcU39h8GxT2mWLiROxUfkI4pjUDiKMBrggZjprm3mTSSl2LjhpEd8mehsbzsYMMzk7u1Gm83jCtYONg68WWZ7Mf5joUYWorsvqyKBijao7lHir+m0en5wJBw2Z1xtlK15xlmmw7NeWUYBg673S5ucLaG7plly99RflxtnPfssShOe9PrUcmBCUYhT6ZVIm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LMLm7VJCnH2nKyG/FQ8tX9hwWfCZI6ToONo/A6Zfp8=;
 b=zLj2VyT5JTJXwnfWOWEWsv14w+4EYPJ3Pgb+CyzfTQ41chOjx16nJTrzWbW+fsPZdnbB8SY35RaqzrZObG14dLcrcSvEqT0qVvcFHwFbv9F5Z+fENGmmOAzVgxut2Y3M5fb7Cd7Av6llB3yg9RFY3LOraDZFz0VP8nH8fWy6dXgzf6Xq6udDnbpyfUEplUTktH2Tlr00hrHPyAB4rb8//RqGg/JnYsnnlTzEg+HSsb1hw9C/t1tgrBDlPVjLRSQlU8iBHll8fho7pMv0PUHmq5WEf0qVCWViWNTteX3Xbg9mslwoIFwW7HSWe2BmNRwlH25Zu4hrPVpXLTgSgLlF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LMLm7VJCnH2nKyG/FQ8tX9hwWfCZI6ToONo/A6Zfp8=;
 b=lPPSiqdDj/wyxbRWc8R2cNo2nVCzpamGZzIRdtK/XxBJFyW4bU2C3TzkpbplhSmn6dZ4jApUql0H+Vc8cYUaDSuOuuX5VUkiZunO4ZS9sW+xP/t7zNO/NPG4oPMt4gTX22WBHE9cvonnyng+znDEe6q+W69a0QuaV1Im/svAM94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 12:52:58 +0100
Message-ID: <D9DZWZDYLF7B.11NTQG6LIA1IX@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 03/13] common/hyperlaunch: introduce the domain
 builder
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-4-agarciav@amd.com> <aALKTolElzpGmD60@kraken>
In-Reply-To: <aALKTolElzpGmD60@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c365ea-5491-46ae-a9ac-08dd825d6912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU1WaGlnVjk0a0I3RVl1NVlWdk1Td1djQmNWZWZZMXpIU2dyblNxTnJ2T0Iz?=
 =?utf-8?B?SUppQkdhNzZYQVJFUm9jVk16dHh4RzBiV1lWNUVNa0QxMmdvRXM2d3F6UGhj?=
 =?utf-8?B?YmtnbUNvQVJ3OGdOZXNsMXdha2d6TXFvL0xCTFBkbnM3UzhWR2twdXpFSHNW?=
 =?utf-8?B?cW5MZXB0OGdQUUhvVnVkbEppSjdzdm02cW9CSnM3cTgwcFZwbUhyaXBLbzdK?=
 =?utf-8?B?QnI2ZDlEaGJ6TXl1bEJTNnUxMDhRYmNNNEJFNFN4Um5HMXd2cnVlczNsMjRX?=
 =?utf-8?B?bmhENUZmbFVLVWU2U0l2eDR4c3ZsSjlaY2hzUXV6R3ZDS3Q3c3BGcnhaazRI?=
 =?utf-8?B?bFhCUFlBZURyc0thL1hXaGhCQWhoNy9SdGlBbU5NMjlxQ0gzNzBoSDB5b2pz?=
 =?utf-8?B?eWM0d2NuM0xRdmlQSkFKWXcvOVhSL1hkM3pWWlZDVFJxSzY2RzJFUEhyQTFY?=
 =?utf-8?B?aXA5ZTVZdjJPazhkdnZ2WFIrZW9GMXpNS1dINGxpWFdVUHVmaXRORVNmNmVi?=
 =?utf-8?B?UjYwdXVlejUzQThraUxHSzBDWUpuTm5wTEVTaDB2a0YxTmQyTjMvd2l6Lysv?=
 =?utf-8?B?OXM0SXVtVmRQbm9SZk14WHRrcjdNVy9HS3R5NXNZdmQ1OG53VWF3ZVFHSEJV?=
 =?utf-8?B?NVlxWTZoaEE4U0xEbVZDZUs0emRVZm9NRFlhWmZQSmRyak11S1RSUmI4Y1k4?=
 =?utf-8?B?ZUZWUlpOY2E2Q3lDdEIvT2kyYWEvbDl6YmIzamVnQ1l3MGlLOU15ZjMvUUtP?=
 =?utf-8?B?eHNYNWRPUW1iUUVUZCtXT2o0KzhHSDQzVjB5NGtjZkVlQWp5NHhQRkYweFN2?=
 =?utf-8?B?VG1xZkxYTGtrS3l3YXpOYVBlOW5uSDg0dW9uQU1QSzd1aUJMSUV2MmREYUl3?=
 =?utf-8?B?Z2xGYUpSY01WdFROTkVwNFE3amdXR0lwdDIySTFoeXVmUFROYWlKSDJhNGlx?=
 =?utf-8?B?UldpNFIyWGlpSCtwUElOY09MS29xdldCM2kwUkhWcW90cnk3UHpDVi9UNGUr?=
 =?utf-8?B?d1ByRlN1MXJFa25xRWkrUnU3UStwOFBTanhTR3ZFb1E4cGczTXYzZE1TbXA4?=
 =?utf-8?B?K3hkZnEzR2JIUFFSUkhoWEw0TXZJNE9GUUZOTVd1ZEdjenNZYnF4KzUycmo0?=
 =?utf-8?B?WUVvakgxYW1RVEhiVDYyRVh2a1hjYXltdHQyUU8wOU1OcFJ0eU9vdVVDR0pG?=
 =?utf-8?B?UHVEZlc4SzBsVG5YaDEvYStvaEMzL2hLVnpXWVZaM3dVNzFDU2JXSVZXbHo2?=
 =?utf-8?B?ZTZWQXprU09MYUJaL094NkQ3RnAzS3R3enA4ZzUxcHJjd0MwTTZrcVUvbXNW?=
 =?utf-8?B?ZE1GUlpZZmZ0SVlIRTFRaEtoQXpZeTh0ZDNmSndIOE1GY1JsUW1IZk93V1VD?=
 =?utf-8?B?K1hyOWVkaUNTYzdoa05JSUk2MFBHc0VQQzVIT1BHdjg5UVpjZHBvQ21Cdita?=
 =?utf-8?B?T3VKQnFGaEtHSURVeG42dDViMVZrYVp5R1hXUmdHc0IxdXZjY2tCSHBBTmlq?=
 =?utf-8?B?ZFVBVG5relcxaXhPM1JOK2FLbldtOFpmYVUxMkJlL1VneEVub1VueFNDYUVK?=
 =?utf-8?B?YmkvUUxnTkFMVitKbWRIWFZSd2dxeXVwU2NQWU1PUUpLZHdWaVBGT0E5aHR2?=
 =?utf-8?B?SFQwWVpHN0lzS253Q1JSbW12T3dvUHI3UVZaSWkyUkxrN29IU1lnd3M5Q2ta?=
 =?utf-8?B?QnJEM05nN3U5WWp0VmxubEJjcE5CZmRaOU5pVE1nZWJjL1ZqMTBvNXFWSE5l?=
 =?utf-8?B?dUtiUjJZNTNaZG03Mkc0RFhpQVlKNXJnelNOYWpjR2s4UmdpWHNpVENYUVk2?=
 =?utf-8?B?SWNvSGdZUUxLZEEwOXBJaGg5cUUzako0VGZNTGJwcFhuRFBnaVQ5L1MvOXlR?=
 =?utf-8?B?dUFyZHpXYnY2RUFPSDFtNG5RYzVhNHBMN25OTjhORDR2aUY5R1oxVWVOL3U0?=
 =?utf-8?B?aGw1VVlqelorNkJZT2YremdBb1VNU2o1anNWMUsvMjQ1ZGdTZy9EYWQza1pp?=
 =?utf-8?B?R091a1JQZmJZeXFtNU9ORm1MWUg0SjRoelhxSkcyakVqN0JRdHU5d01PMkFv?=
 =?utf-8?Q?nvWwvD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 11:53:06.2443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c365ea-5491-46ae-a9ac-08dd825d6912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842

On Fri Apr 18, 2025 at 10:55 PM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:25PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the domain builder which is capable of consuming a device tree=
 as the
>> first boot module. If it finds a device tree as the first boot module, i=
t will
>> set its type to BOOTMOD_FDT. This change only detects the boot module an=
d
>> continues to boot with slight change to the boot convention that the dom=
0
>> kernel is no longer first boot module but is the second.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> v4:
>>   * Moved from arch/x86/ to common/
>>   * gated all of domain-builder/ on CONFIG_BOOT_INFO
>>   * Hide the domain builder submenu for !X86
>>   * Factor out the "hyperlaunch_enabled =3D false" toggle core.c
>>   * Removed stub inline, as DCE makes it unnecessary
>>   * Adjusted printks.
>> ---
>>  xen/arch/x86/include/asm/bootinfo.h |  3 ++
>>  xen/arch/x86/setup.c                | 17 +++++----
>>  xen/common/Makefile                 |  1 +
>>  xen/common/domain-builder/Makefile  |  2 ++
>>  xen/common/domain-builder/core.c    | 56 +++++++++++++++++++++++++++++
>>  xen/common/domain-builder/fdt.c     | 37 +++++++++++++++++++
>>  xen/common/domain-builder/fdt.h     | 12 +++++++
>>  xen/include/xen/domain-builder.h    |  9 +++++
>>  8 files changed, 131 insertions(+), 6 deletions(-)
>>  create mode 100644 xen/common/domain-builder/Makefile
>>  create mode 100644 xen/common/domain-builder/core.c
>>  create mode 100644 xen/common/domain-builder/fdt.c
>>  create mode 100644 xen/common/domain-builder/fdt.h
>>  create mode 100644 xen/include/xen/domain-builder.h
>>=20
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/=
asm/bootinfo.h
>> index 3afc214c17..82c2650fcf 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -27,6 +27,7 @@ enum bootmod_type {
>>      BOOTMOD_RAMDISK,
>>      BOOTMOD_MICROCODE,
>>      BOOTMOD_XSM_POLICY,
>> +    BOOTMOD_FDT,
>>  };
>>=20
>>  struct boot_module {
>> @@ -80,6 +81,8 @@ struct boot_info {
>>      paddr_t memmap_addr;
>>      size_t memmap_length;
>>=20
>> +    bool hyperlaunch_enabled;
>> +
>>      unsigned int nr_modules;
>>      struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>      struct boot_domain domains[MAX_NR_BOOTDOMS];
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 4df012460d..ccc57cc70a 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -5,6 +5,7 @@
>>  #include <xen/cpuidle.h>
>>  #include <xen/dmi.h>
>>  #include <xen/domain.h>
>> +#include <xen/domain-builder.h>
>>  #include <xen/domain_page.h>
>>  #include <xen/efi.h>
>>  #include <xen/err.h>
>> @@ -1282,9 +1283,12 @@ void asmlinkage __init noreturn __start_xen(void)
>>                 bi->nr_modules);
>>      }
>>=20
>> -    /* Dom0 kernel is always first */
>> -    bi->mods[0].type =3D BOOTMOD_KERNEL;
>> -    bi->domains[0].kernel =3D &bi->mods[0];
>> +    builder_init(bi);
>> +
>> +    /* Find first unknown boot module to use as dom0 kernel */
>> +    i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>> +    bi->mods[i].type =3D BOOTMOD_KERNEL;
>> +    bi->domains[0].kernel =3D &bi->mods[i];
>
> Nit: perhaps add convenience aliases for bi->domains[0] (e.g. dom0) and=
=20
> for bi->mods[0] (e.g. mod)?

Inside the boot_info? As in separate aliasing pointers into the arrays?
I'd rather not. It'd be dangerous on systems without an actual dom0.

The PV shim comes to mind, but other configurations might arise in the
future where no domain holds the id of 0.

>
>>=20
>>      if ( pvh_boot )
>>      {
>> @@ -1467,8 +1471,9 @@ void asmlinkage __init noreturn __start_xen(void)
>>          xen->size  =3D __2M_rwdata_end - _stext;
>>      }
>>=20
>> -    bi->mods[0].headroom =3D
>> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].si=
ze);
>> +    bi->domains[0].kernel->headroom =3D
>> +        bzimage_headroom(bootstrap_map_bm(bi->domains[0].kernel),
>> +                         bi->domains[0].kernel->size);
>>      bootstrap_unmap();
>>=20
>>  #ifndef highmem_start
>> @@ -1592,7 +1597,7 @@ void asmlinkage __init noreturn __start_xen(void)
>>  #endif
>>      }
>>=20
>> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
>> +    if ( bi->domains[0].kernel->headroom && !bi->domains[0].kernel->rel=
ocated )
>>          panic("Not enough memory to relocate the dom0 kernel image\n");
>>      for ( i =3D 0; i < bi->nr_modules; ++i )
>>      {
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 98f0873056..565837bc71 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -11,6 +11,7 @@ obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D de=
vice.o
>>  obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
>>  obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>>  obj-y +=3D domain.o
>> +obj-$(CONFIG_HAS_BOOT_INFO) +=3D domain-builder/
>>  obj-y +=3D event_2l.o
>>  obj-y +=3D event_channel.o
>>  obj-$(CONFIG_EVTCHN_FIFO) +=3D event_fifo.o
>> diff --git a/xen/common/domain-builder/Makefile b/xen/common/domain-buil=
der/Makefile
>> new file mode 100644
>> index 0000000000..b10cd56b28
>> --- /dev/null
>> +++ b/xen/common/domain-builder/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-$(CONFIG_DOMAIN_BUILDER) +=3D fdt.init.o
>> +obj-y +=3D core.init.o
>> diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builde=
r/core.c
>> new file mode 100644
>> index 0000000000..a5b21fc179
>> --- /dev/null
>> +++ b/xen/common/domain-builder/core.c
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2024, Apertus Solutions, LLC
>> + */
>> +#include <xen/err.h>
>> +#include <xen/init.h>
>> +#include <xen/kconfig.h>
>> +#include <xen/lib.h>
>> +
>> +#include <asm/bootinfo.h>
>> +
>> +#include "fdt.h"
>> +
>> +void __init builder_init(struct boot_info *bi)
>> +{
>> +    bi->hyperlaunch_enabled =3D false;
>> +
>> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>
> I would re-organize the code to remove one level of indentation, e.g.:
>
>        if ( !IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
>             return;
>
>        switch ( ret =3D has_hyperlaunch_fdt(bi) )
>        ...
>
> or even add #ifdef CONFIG_DOMAIN_BUILDER for builder_init() in the header=
 file.
>
> What do you think?

In this patch it sounds good, but a later patch adds more stuff at the
tail of the function that must not be skipped, so it wouldn't work
as-is.

Another matter is whether this function could be skipped in the "no-fdt"
case, and it probably could. But I do know the longer series (big RFC
from Daniel) adds more common logic present when !CONFIG_DOMAIN_BUILDER,
so I'm reticent to deviate too much from it to avoid rebasing headaches.

>
>> +    {
>> +        int ret;
>> +
>> +        switch ( ret =3D has_hyperlaunch_fdt(bi) )
>> +        {
>> +        case 0:
>> +            printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
>> +            bi->hyperlaunch_enabled =3D true;
>> +            bi->mods[0].type =3D BOOTMOD_FDT;
>> +            break;
>> +
>> +        case -EINVAL:
>> +            /* No DT found */
>> +            break;
>> +
>> +        case -ENOENT:
>> +        case -ENODATA:
>
> Looks like this code accounts for the follow on change: current implement=
ation
> only returns -EINVAL or 0.
>
> Is it possible to convert has_hyperlaunch_fdt() to a simple predicate?

The function is a misnomer and it ought to change to return an
enumerated type instead where it returns FDT_HYPERLAUNCH, FDT_DOM0LESS,
FDT_UNKNOWN or NO_FDT. Using error codes for identification is a tad too
hacky.

Cheers,
Alejandro

