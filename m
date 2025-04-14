Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BBA88B6C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 20:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951151.1347269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Oex-0000P0-Vz; Mon, 14 Apr 2025 18:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951151.1347269; Mon, 14 Apr 2025 18:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Oex-0000O4-Sl; Mon, 14 Apr 2025 18:35:55 +0000
Received: by outflank-mailman (input) for mailman id 951151;
 Mon, 14 Apr 2025 18:35:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B3Nx=XA=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4Oex-0000Ny-39
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 18:35:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f403:2415::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1c5ab2-195f-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 20:35:53 +0200 (CEST)
Received: from MN2PR19CA0009.namprd19.prod.outlook.com (2603:10b6:208:178::22)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 18:35:47 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::2f) by MN2PR19CA0009.outlook.office365.com
 (2603:10b6:208:178::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 18:35:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:35:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 13:35:45 -0500
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
X-Inumbo-ID: 4b1c5ab2-195f-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQXj4O6pGyoF1I6b5kQYk5ap7JDh+8FbCyrV8Oj9FIYMY3gt34e+qsVp1CZL8ywH60iaX4YWTzJMYNCLa3PYOJU9i0bue5cyiIUiC+Epd866sbtNy03dwwULP8YBICPeFASG3e76f624MBiYnPgudRqw2VAZQWa3c46mOWFZmkaYa/1XhSqkR5X4pnhLMVxBlOsiZUGXiW8IAtGv57EV4gf58p52rkML/l3V7oD44V1AbLHQmMI2G5ZL2giEf81+vgCgrRyjP0baP+cY63JLLO9QemOEtg/d9WCA5DJSMhvTdEV61sBJV7jdC0+iMoGMhi//XwyVzm9UhPACOoP6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2xn3W946iG4qq5hfboD3hHxp8YySCs//TPq+BUPxtI=;
 b=h+f5Cn6etQrJchkrcD0s+tKRpii1NsYXxjVahoa1RZCJK24KJ8T4Pf7z9Eb0pb/T/rmvgFFJYs+IyRsV8fRZLyHljEgyZ1vtJUo/9mXCbKUGYPNFH4dhDw259mYirKVu11Li0l++DQut1s1TjCdJeeyqAyDtfdkRveToPlPIijI9gTxeHInkYDXii9OlfNjZQyIsGrii2wwK3wHmlrFlSq1N2YToEqeK3SbN2ZEEIW2ox6DzP1ebGEltYA7u+SyzxP4hhERAkpPadGzOL/p0mFxQX4RqitAwUbIZE1h7XkNYg4+VUI/jVQkPFOFu8WvYQM+l4BBsufGMTGeSo1piqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2xn3W946iG4qq5hfboD3hHxp8YySCs//TPq+BUPxtI=;
 b=Fub9O8omqBrwWst6MBJx8swW86XhLcmQsQaixEEMcANDHYZiXUB71CMxvQbxEevYctSRGR/qmZxIvP49YHzdf+CAqwFeIGmQIabdMinWYCk87m/E+tro/EOhkDmkQFZYWdxlv1Zawxa+4SVeSmdD8nHRG18oBb1ScEBcT0jG2xQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 14 Apr 2025 19:35:44 +0100
Message-ID: <D96KUGJTQO7F.39OKDX33SSKYH@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to
 domain config
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
In-Reply-To: <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: b986d15e-b4c8-45c8-2753-08dd7b832ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnRIRHdjWHRvdGtrTnpua1ViOSs5a1hFckhFOHlRVlczd1ZHMno1Y3VlQkxr?=
 =?utf-8?B?MGxMRno1VFErVklma1lwUTJQTE5rWEFVa0RqV01oR2dOSTJmOXBYaDVmTjRU?=
 =?utf-8?B?eUM2Yjc0bDZuSldRd3k1U0IwQUhQeWZxYmVxWkVtVCtHd0V0eGpwWkpZOEcx?=
 =?utf-8?B?TEtGZU00cy9qaENNTjluVHBPTzlKM1U2MUdxb3hCVXpDb0szVlVhY1lQTElY?=
 =?utf-8?B?UzB1V0Q1bStMVlc5RXVpM3V0WTQvcUlYVTYrVmx3NzZ5SGx2VS83UEJ6aFBL?=
 =?utf-8?B?RVlXcUJqTFFRbm9BU3p4UHE2ekZyYVV5b29UazlBTEhCejJIaTArWmVCU3Nt?=
 =?utf-8?B?cUttaWduRnhGME9HWEViTFUyOEgxR2YvdkhUMHdWcEhyUFhJVkNmUFB6MVRz?=
 =?utf-8?B?VnY1STJ1VEVzTE9naDZJY3VNdFpOT1JIZm1aZmJ5N3V4bm1jUjZUR0ErcFpN?=
 =?utf-8?B?V3dGZFc3enNGV25uVktlbUZ0V3VSSmlpK3pHTGFjQ3E2MWJTMXQ2aW50ZUpV?=
 =?utf-8?B?SjQ2c3FqT29oeGUvVm5KTG9HYzlmTmYyclVMR1RMQUpGcy9qZkZiRmVXQ0lN?=
 =?utf-8?B?TWUzTTlTNXp0R09MclV5U3UzMkJsMTZ5M3BTNjcyWExUSElWR21zYk9xbFJF?=
 =?utf-8?B?N1BWQUs5Z1BETWVjb1UveFdSZENvRTBrYTNCTDB5bkk0VEZkNTZZRjZzNmZk?=
 =?utf-8?B?MDMzbHo5NFBxMmtLMTM1Y1IxY3RFY1dZSFBNQWhsRmlldmJ6UXdDSjhuS3J2?=
 =?utf-8?B?QUpkVkhPSW9GejZpd2VNNGdkTnBML0dJQXdjR2ZRd2FWelB0UXdLRU9Fbkh5?=
 =?utf-8?B?bGV4VElnUFdIR3RBRldjam5IUUNxM1BxcG9oLzFEVE50MG9TdS9jK0VDUTlD?=
 =?utf-8?B?ZHhodFB3N2hMakI0a21BeG9KY3BOMEpCY2ZnN2QxTGdFWXYrUUZ2OFlLKzM4?=
 =?utf-8?B?dEZSbnpTSVZpS2pLWldMMmx6ZFA4cVpZS1EvdVYrOWgvTWUzR3Jyc245djlH?=
 =?utf-8?B?dUpKWWRHL1FLWUJFdmlHbFpBdjRBMnd3ejgrRXdXTHcyRHFpeGNxNENqQkZX?=
 =?utf-8?B?b1RoeTM3aUo0R1FDeXlwRm5kaEV4VXlLTHZ1clhkK2dwNWFidXM3bVQrenN5?=
 =?utf-8?B?SmlzSVVNbmZQMlNVbjVCdjg1VkJJMk41K0pWSENXZ1pCWXZHaTN2RXFmT0lG?=
 =?utf-8?B?cVhWWHVzeWw3bzNaUVlhQUR0bEs0K2oyVjJuQWx4eGErblNpMGd6MVNyUXRX?=
 =?utf-8?B?NU9HWjRRUDBPb2pDQmFWT2RCSVV2TGNKamJJTXNZbUUvVEgrRlFOdGExUzBJ?=
 =?utf-8?B?MlZxVThPTEszNWdlSjlPeUROTHFXbngzdFNPZWpjZHpVT2tlWjN2bTc0dTJM?=
 =?utf-8?B?REV6dUxiOGRVTVZSUlMwSVhUaXhrc1JSY0xnMjNjL2tXQUwydjhsaDN2MGtT?=
 =?utf-8?B?Qzdha3NhZlRpd2RpcGJHOEdQRVRSajlZbmFvU0o1VmRrZ0VzWlR1QlQyNDhZ?=
 =?utf-8?B?TFYzb25iYUdNTFFTSjcxZE1QSEc4VVZ5b2RZaXg0OHdPSTRUNFVHV0lpVWN3?=
 =?utf-8?B?MGhsOVgxQXlPcVAzeVlDS0FjQy9zZ01icjJ0bG1kTUhDMnZyZ0JIcVNWaGZj?=
 =?utf-8?B?ckZNMFI3c0J2d3E5VCtaalJaMmRnQXVTUDNjaWZQNzE1eGV2dC9qSlNUdHF6?=
 =?utf-8?B?ZnEzZk5PWFNKQXZ3bUhQSEtpaERUK1dLUDNHWWhoajJKeFhyL1llNEgwVThW?=
 =?utf-8?B?ZEU3NjAwRFM0UXN4elk0K2RrQzVDb1pEamVqL2hSTWVwbWQrVXhLa2hiLzVy?=
 =?utf-8?B?aTRjZEdSS0RvdzkwNGFrK2ZSaXBMZ3A3YUxieldXck90RW55L0l0Mm1iekl2?=
 =?utf-8?B?bFpnYkhZMDZRa0s4eTNMZ05idGQ4N1BobjM1d2VFR0tZWk04WncxT0dEc29s?=
 =?utf-8?B?Si9yU0FKSjVxZ0dpQkpiQ3h0VCtaakxkNXlxc1ZIVk5RR1RNQTViUGZmakJh?=
 =?utf-8?B?d0ZvYjVGRnBoVHJZaTFWVUg0WC9ZZzVtM05BS2dRby9peC9WNTZhTUZtZW5t?=
 =?utf-8?Q?UvXQoe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:35:47.5831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b986d15e-b4c8-45c8-2753-08dd7b832ca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607

On Thu Apr 10, 2025 at 12:49 PM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Introduce the ability to specify the desired domain id for the domain
>> definition. The domain id will be populated in the domid property of the
>> domain
>> node in the device tree configuration.
>
> Nit: Odd splitting of lines.

Fixed

>
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -8,6 +8,7 @@
>>  #include <xen/libfdt/libfdt.h>
>> =20
>>  #include <asm/bootinfo.h>
>> +#include <asm/guest.h>
>
> What is this needed for?

get_initial_domain_id(), but that ought to come from xen/domain.h instead.

Fixed.

>
>> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *f=
dt, int node,
>>  static int __init process_domain_node(
>>      struct boot_info *bi, const void *fdt, int dom_node)
>>  {
>> -    int node;
>> +    int node, property;
>>      struct boot_domain *bd =3D &bi->domains[bi->nr_domains];
>>      const char *name =3D fdt_get_name(fdt, dom_node, NULL) ?: "unknown"=
;
>>      int address_cells =3D fdt_address_cells(fdt, dom_node);
>>      int size_cells =3D fdt_size_cells(fdt, dom_node);
>> =20
>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>> +    {
>> +        const struct fdt_property *prop;
>> +        const char *prop_name;
>> +        int name_len;
>> +
>> +        prop =3D fdt_get_property_by_offset(fdt, property, NULL);
>> +        if ( !prop )
>> +            continue; /* silently skip */
>> +
>> +        prop_name =3D fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), =
&name_len);
>> +
>> +        if ( strncmp(prop_name, "domid", name_len) =3D=3D 0 )
>> +        {
>> +            uint32_t val =3D DOMID_INVALID;
>> +            if ( fdt_prop_as_u32(prop, &val) !=3D 0 )
>
> Nit: Blank line please between declaration(s) and statement(s).

Ack.

>
>> +            {
>> +                printk("  failed processing domain id for domain %s\n",=
 name);
>> +                return -EINVAL;
>> +            }
>> +            if ( val >=3D DOMID_FIRST_RESERVED )
>> +            {
>> +                printk("  invalid domain id for domain %s\n", name);
>> +                return -EINVAL;
>> +            }
>> +            bd->domid =3D (domid_t)val;
>
> And a conflict with other domains' IDs will not be complained about?

Hmmm... sure, I can iterate the domlist and check.

>
>> +            printk("  domid: %d\n", bd->domid);
>
> If the error messages log "name" for (I suppose) disambiguation, why woul=
d
> the success message here not also do so?
>
>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>          return -ENODATA;
>>      }
>> =20
>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>> +        bd->domid =3D get_initial_domain_id();
>> +    else if ( bd->domid !=3D get_initial_domain_id() )
>> +        printk(XENLOG_WARNING
>> +               "WARN: Booting without initial domid not supported.\n");
>
> I'm not a native speaker, but (or perhaps because of that) "without" feel=
s
> wrong here.

It's probably the compound effect of without and "not supported". The
statement is correct, but it's arguably a bit obtuse.

I'll replace it with "WARN: Unsupported boot with missing initial domid.".

As for the first branch of that clause... I'm not sure we want to
support running with DTs that are missing the domid property.

>
> Also nit: No full stops please at the end of log messages, at least in th=
e
> common case.

Ack

>
> Is the resolving of DOMID_INVALID invalid really needed both here and ...
>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1033,8 +1033,9 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>      if ( iommu_enabled )
>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>> =20
>> -    /* Create initial domain.  Not d0 for pvshim. */
>> -    bd->domid =3D get_initial_domain_id();
>> +    if ( bd->domid =3D=3D DOMID_INVALID )
>> +        /* Create initial domain.  Not d0 for pvshim. */
>> +        bd->domid =3D get_initial_domain_id();
>
> ... here?

I'll rationatise all that on v4.

>
>> @@ -23,6 +24,16 @@ static inline uint64_t  __init fdt_cell_as_u64(const =
fdt32_t *cell)
>>      return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[=
1]);
>>  }
>> =20
>> +static inline int __init fdt_prop_as_u32(
>> +    const struct fdt_property *prop, uint32_t *val)
>> +{
>> +    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
>> +        return -EINVAL;
>> +
>> +    *val =3D fdt_cell_as_u32((fdt32_t *)prop->data);
>> +    return 0;
>> +}
>
> Path 08 looks to (partly) open-code this. Perhaps better to introduce alr=
eady
> there?

Already done.

Cheers,
Alejandro


