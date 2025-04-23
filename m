Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7208A98A69
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 15:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964657.1355397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZnG-0007Zu-88; Wed, 23 Apr 2025 13:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964657.1355397; Wed, 23 Apr 2025 13:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZnG-0007Y0-4h; Wed, 23 Apr 2025 13:05:38 +0000
Received: by outflank-mailman (input) for mailman id 964657;
 Wed, 23 Apr 2025 13:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VjMx=XJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7ZnE-0007Dl-L1
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 13:05:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2415::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2d850c7-2043-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 15:05:32 +0200 (CEST)
Received: from BN9PR03CA0685.namprd03.prod.outlook.com (2603:10b6:408:10e::30)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 13:05:25 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::ff) by BN9PR03CA0685.outlook.office365.com
 (2603:10b6:408:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 13:05:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 13:05:24 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 08:05:22 -0500
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
X-Inumbo-ID: a2d850c7-2043-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9YeIZ9TAf/chWimnB0GaPAJ3tKKLkrBnxEkiqyLA2OWHKjB9C3ZC8njGQpQq1o0JJvwfScyIwfPkuWDDrOV2+NcF9WaTKgHzfrGlSvUpvPOVM0OATTrxdwvuwGLzLaWeObkjHUdM47qmiTDCh6vhzIJwDKJ+nUCxHzxSXfJaaHMYFARvG+Q9CUAgvmfFSqx6XZ61277v3iDLDtwpYCTrnVu+LWDGSlvkdxsku7EdyMro/h3Mk/yEJhUs1fOOrD4fhrO9GO2aFwPiYuj6RCkiGFk7WKF8h+k/Uzjz4cs1/q72/Q+Lp9spQUhCDTYw1LM6YuFgRGTWAIySO00S4rWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0BnSVIvKuggEUL7lwrJ3sy4hxNZiE2bq6jdHVZuyEQ=;
 b=ovBezUlOKxIa2RVm58L5AxBpRLzXVvSR8vpvjhL1GtdwEqGaWvZKNdREPD5OHvNhIvXdGMXDfIYBvE8uubzsmu/Ojl8j/a6hwuPSa+5szRaQ4fYP+3h5/XodP6Ydaa0lp+e2wQ2s3+ZQzJAXTJamJ3oh5OooyqNqLLN+lvm/5hD/esDQJVF2sadWbNgYvnfdZAmY0aApv6AWZ9Gt9UT5ocmIwf9n18flGRAIwb5Cpih+HYZjuL8zd7On/TvBT8zwvGSN/GKjfDjHyOK3O4R8knYORBmZeP7Npfn7XGzntjkdzIxhTGMSa9n55uEQdNvd7olHAoKEAp1f1A2rDwcZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0BnSVIvKuggEUL7lwrJ3sy4hxNZiE2bq6jdHVZuyEQ=;
 b=FzzuJHDqeN20lUbmYL6zkOoPO2Ig7U34Ty3t+FydGwdSdTJ5srPKZ62BLEb50rYE7eFGm0W5RHsR3InrGD7Dq9DyEIdixy4AKqsnmCDFwmHfYdBb/yOZxygOfYdfLl041t7bSwTYJMKz2exrQIOW6WxPVjdHvE/54frmRH3aHvU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Apr 2025 14:05:20 +0100
Message-ID: <D9E1GDUZWNM8.1JUXA0OEBDMKC@amd.com>
CC: <xen-devel@lists.xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 11/13] x86/hyperlaunch: add memory parsing to domain
 config
From: Alejandro Vallejo <agarciav@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-12-agarciav@amd.com> <aALeY6bt7lDCwXii@kraken>
In-Reply-To: <aALeY6bt7lDCwXii@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|PH8PR12MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f0d081a-7fbb-41a3-e963-08dd82678320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk5NMUxYbjJycmVIeDVwUDlyQXU3VWVMcEswcmZ6REkzS3VCNlZsVHNJb0Ex?=
 =?utf-8?B?WTdraXhYNG9wM28wUlE5d3d4Y3Y0blBzRjIyd25ibFhlbzVhZWRYaWZuWkJR?=
 =?utf-8?B?SExoQjBOTWx6ekh5K0dMOU1XTmtrK3pwTjBqb1lUTndCcnU5cWdqRXpSRWJL?=
 =?utf-8?B?Rjl2cmN3VXFORVhoWE5tQmRZUVFxZnlSay9PeVMweXdqQUNSNk9wZXZOQ2J1?=
 =?utf-8?B?cXlJUE02cHYzb3BjQkUyYXFERld3SENJalRxMHNJeXVaNTFqdkhoWkNhZ3NY?=
 =?utf-8?B?M2U5eDlTZjJtYk1iY0p5ZVNMRm1NR0hSaW1RZVVHTmppa0RVT0NUb0owWjd5?=
 =?utf-8?B?T0pFZU5UaEczdFdKRm44NjJYRnI3Rlg1eEgvY1g0aDNZVFk2bHcvdXB3eHBq?=
 =?utf-8?B?NVFNS1paNE5YNU9uQk5vaERoLzZGR3dLQmZJd25PV1Mzc3hFcVpMZThBMzJ5?=
 =?utf-8?B?Y0loYkc4NUQ2UzdhZUVRMTNNR0pOZGp0Yk5aQno4T2s5STY0bk1NdFRMQkRB?=
 =?utf-8?B?SU9iUEFjdTlhOEFaS0R0Ymd4eFUzeVJzUTRYMXlqR1dYS3M5NmRPcmRPazZK?=
 =?utf-8?B?NENxUlE5Y2xCeGtGcTdzZWZnUzRxOEovT2pkODZYa3NkdzN1ZEdOMDM1c0xW?=
 =?utf-8?B?Rm8vVkoyUTRrRHZYa3J3Ryt0T2lRL1RKaEtQOWI0QzNQSFJKWUs3RnpDZ3o5?=
 =?utf-8?B?TzUyVmZjdU9qc1U1eWRWcUVsd3BWdnJwazNLSHRpNDJWL0N4d21lYzZHbDJj?=
 =?utf-8?B?RnVmdm4xS2creU5iNXIweTN2dGU1eDh2czZtY3dWeTJ1dU5DWXJzc1ViS2FF?=
 =?utf-8?B?VkU3eC93UzNBSkI1UllubVVHMGxCK0Fwd1YzSFp4RDlpRTJKQ2srZklocWxD?=
 =?utf-8?B?TGwwRXJyVVFyQWhuMVQ5SFU3SHgyUmdPTkFaRGVyY0Y1QXJzUG5BbFh4aDAz?=
 =?utf-8?B?Q0FBOXppTHh5eGVzc1Bqdkt2cGpFYVRvMm1QMmYzMEF0aWtSRlBqYldCdWFE?=
 =?utf-8?B?RFB4cXlyTTJnblE5aE9rTlZ3T253Y0dQWlhrbEhCbnhxdE1FczJHWm5Oa0Zi?=
 =?utf-8?B?YitYTjEwQVlTZUc1cU8ydkFrbXhkcDNiQkM1ak03ZmVPbUpkcFZTVWVidUNV?=
 =?utf-8?B?cTRKYStEa2QxeDE3bS9LajN3RnY0UGt2Kzd0cnhzaGxYWDVvQUMzNTh6Smt5?=
 =?utf-8?B?NWtYbTNsQnFOanNjU1JnbWFlTnVNOWsrYzVqTnp2dnJLV0dRcE1WN1ZWSE9U?=
 =?utf-8?B?eTVTNGQ5TlpwWTFrbDNCTm9pZFhKbjhPVEFHSUpLK21hM3BpY2h4T2JXM00v?=
 =?utf-8?B?MWhHV2VYYUptRFJ4ZlArR1REd3RLUFdPNlh1b1hsM2ZYb1E2QlMzM1BTY2VQ?=
 =?utf-8?B?ZGtZSUJhVUlIcmlOSVVIanlvTHFrSVBBa2tzWkNTY21RVXNCK2hrdW5Kdm1G?=
 =?utf-8?B?aUZIcmp0VnR5c0VsU3VpSnNLZW45bWtFSEltMjUwa3krOXRNb3BQRU41RzhV?=
 =?utf-8?B?N1pnNFlSZVplM2pDQmlNclBNazNCbE9LTzFGUHVCbkg0YXo2R2NQOC9TVjFv?=
 =?utf-8?B?aDZjYXdlQzNaQ0tUK2JFSkVWdTUxU3hXelpxVmp1WDVnRThoS2h3VHgzY25I?=
 =?utf-8?B?cEtlcUV6aVc3TWJpNm1iYVM0NWYySzlUaDg4NHFPeE1oWk1FejZpak51ajFS?=
 =?utf-8?B?Y0xqT0dkU0tHaEFHNUw4YjRjVExKRGl0R1MzQ0ZLaUtrMUlPWmtYUUI1Y0Qr?=
 =?utf-8?B?UHVRZGxENXY1YTNDQXlTSi9zV1JXN2I5SlR5VWFXV2hpVTI1bFhGLzJ1dUoz?=
 =?utf-8?B?WWRqbGVkbWFiRmlOS1NsYXpsdGNpZlJpOUxINysyMjlQNGJJWUdUblhjSnh3?=
 =?utf-8?B?WnZiTUJLTTRmMTl4bW4yK3g3MjVFTk8xVE4yWUdCa3k0RmdPajBWZ3NQVE1L?=
 =?utf-8?B?L1lFTFZvenIwVGQ3ZUtXS0swb1JQeEFvOVpwYURkbEJ4TEFJRHZ5ZEVoYjQw?=
 =?utf-8?B?eDNGM0FwNUQ1cGFxdHVoQWFQVmMwWFBBRU55STh2T01qRkkvdEloZEJwcTNv?=
 =?utf-8?Q?AWEstt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 13:05:24.9268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0d081a-7fbb-41a3-e963-08dd82678320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255

On Sat Apr 19, 2025 at 12:21 AM BST, dmkhn wrote:
> On Thu, Apr 17, 2025 at 01:48:33PM +0100, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add three properties, memory, mem-min, and mem-max, to the domain node d=
evice
>> tree parsing to define the memory allocation for a domain. All three fie=
lds are
>> expressed in kb and written as a u64 in the device tree entries.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> Can't use KB() rather tha SZ_1K, as that's strictly for literals.
>
> Oh, that's right! Thanks!
>
>>=20
>> v4:
>>   * Don't override fdt_prop_as_u64() rc on error.
>>   * Add separate printk statements for each memory prop error.
>>   * Fix bug setting up dom0_size, dom0_min_size and dom0_max_size
>>     * Was overriding dom0_size on all 3 paths.
>>   * Pre-initialise max_pages of all boot_domains to be LONG_MAX, just as
>>     dom0_max_size.
>>     * Eventually dom0_max_size drops out in the bigger series, so we
>>       need that logic to be correct.
>> ---
>>  xen/arch/x86/dom0_build.c              |  8 ++++++
>>  xen/arch/x86/include/asm/boot-domain.h |  4 +++
>>  xen/arch/x86/setup.c                   |  5 +++-
>>  xen/common/domain-builder/fdt.c        | 36 ++++++++++++++++++++++++++
>>  xen/include/xen/libfdt/libfdt-xen.h    | 10 +++++++
>>  5 files changed, 62 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 0b467fd4a4..8db24dbc0a 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -627,6 +627,14 @@ int __init construct_dom0(const struct boot_domain =
*bd)
>>=20
>>      process_pending_softirqs();
>>=20
>> +    /* If param dom0_size was not set and HL config provided memory siz=
e */
>> +    if ( !get_memsize(&dom0_size, ULONG_MAX) && bd->mem_pages )
>> +        dom0_size.nr_pages =3D bd->mem_pages;
>> +    if ( !get_memsize(&dom0_min_size, ULONG_MAX) && bd->min_pages )
>> +        dom0_min_size.nr_pages =3D bd->min_pages;
>> +    if ( !get_memsize(&dom0_max_size, ULONG_MAX) && bd->max_pages )
>> +        dom0_max_size.nr_pages =3D bd->max_pages;
>> +
>>      if ( is_hvm_domain(d) )
>>          rc =3D dom0_construct_pvh(bd);
>>      else if ( is_pv_domain(d) )
>> diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/inclu=
de/asm/boot-domain.h
>> index e316d4bcde..fa8ea1cc66 100644
>> --- a/xen/arch/x86/include/asm/boot-domain.h
>> +++ b/xen/arch/x86/include/asm/boot-domain.h
>> @@ -18,6 +18,10 @@ struct boot_domain {
>>  #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
>>      uint32_t mode;
>>=20
>> +    unsigned long mem_pages;
>> +    unsigned long min_pages;
>> +    unsigned long max_pages;
>> +
>>      struct boot_module *kernel;
>>      struct boot_module *module;
>>      const char *cmdline;
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index 05e3d2cf2a..455dad454c 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -296,7 +296,10 @@ static const char *cmdline_cook(const char *p, cons=
t char *loader_name);
>>  struct boot_info __initdata xen_boot_info =3D {
>>      .loader =3D "unknown",
>>      .cmdline =3D "",
>> -    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D { .domid =3D DOMID_I=
NVALID } },
>> +    .domains =3D { [0 ... MAX_NR_BOOTDOMS - 1] =3D {
>> +        .domid =3D DOMID_INVALID,
>> +        .max_pages =3D ULONG_MAX,
>> +    }},
>>  };
>>=20
>>  static struct boot_info *__init multiboot_fill_boot_info(
>> diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder=
/fdt.c
>> index 6809c7f917..90218d120a 100644
>> --- a/xen/common/domain-builder/fdt.c
>> +++ b/xen/common/domain-builder/fdt.c
>> @@ -7,6 +7,7 @@
>>  #include <xen/init.h>
>>  #include <xen/lib.h>
>>  #include <xen/libfdt/libfdt.h>
>> +#include <xen/sizes.h>
>>=20
>>  #include <asm/bootinfo.h>
>>  #include <asm/page.h>
>> @@ -246,6 +247,41 @@ static int __init process_domain_node(
>>                     (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
>>                                                         "pvh");
>>          }
>> +        else if ( strncmp(prop_name, "memory", name_len) =3D=3D 0 )
>
> Use !strncmp(...) like in the below code?

Sure

>
>> +        {
>> +            uint64_t kb;
>> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
>> +            {
>> +                printk(XENLOG_ERR "  bad \"memory\" prop on domain %s\n=
", name);
>> +                return rc;
>> +            }
>> +            bd->mem_pages =3D PFN_DOWN(kb * SZ_1K);
>> +            printk(XENLOG_ERR "  memory: %lu KiB\n", kb);
>> +        }
>> +        else if ( !strncmp(prop_name, "mem-min", name_len) )
>> +        {
>> +            uint64_t kb;
>> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "  bad \"mem-min\" prop on domain %s\n", name);
>> +                return rc;
>> +            }
>> +            bd->min_pages =3D PFN_DOWN(kb * SZ_1K);
>> +            printk(XENLOG_INFO "  min memory: %lu kb\n", kb);
>> +        }
>> +        else if ( !strncmp(prop_name, "mem-max", name_len) )
>> +        {
>> +            uint64_t kb;
>> +            if ( (rc =3D fdt_prop_as_u64(prop, &kb)) )
>> +            {
>> +                printk(XENLOG_ERR
>> +                       "  bad \"mem-max\" prop on domain %s\n", name);
>> +                return rc;
>> +            }
>> +            bd->max_pages =3D PFN_DOWN(kb * SZ_1K);
>> +            printk(XENLOG_INFO "  max memory: %lu KiB\n", kb);
>> +        }
>>      }
>>=20
>>      fdt_for_each_subnode(node, fdt, dom_node)
>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfd=
t/libfdt-xen.h
>> index afc76e7750..3054b48a83 100644
>> --- a/xen/include/xen/libfdt/libfdt-xen.h
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -24,6 +24,16 @@ static inline int __init fdt_prop_as_u32(
>>      return 0;
>>  }
>>=20
>> +static inline int __init fdt_prop_as_u64(
>> +    const struct fdt_property *prop, uint64_t *val)
>> +{
>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(uint64_t) )
>> +        return -EINVAL;
>> +
>> +    *val =3D fdt64_to_cpu(*(const fdt64_t *)prop->data);
>> +    return 0;
>> +}
>
> Perhaps move the call to common/domain-builder/fdt.c?

Yes, all new additions to that header ought to have gone to fdt.c
instead. That was my original intent, but then didn't go through with
everything.

Cheers,
Alejandro

