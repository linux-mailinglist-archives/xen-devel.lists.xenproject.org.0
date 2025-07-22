Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DECDBB0E29C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 19:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052959.1421740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueGok-0007W4-HC; Tue, 22 Jul 2025 17:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052959.1421740; Tue, 22 Jul 2025 17:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueGok-0007TL-EK; Tue, 22 Jul 2025 17:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1052959;
 Tue, 22 Jul 2025 17:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueGoj-0007TF-Jp
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 17:30:17 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86518551-6721-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 19:30:14 +0200 (CEST)
Received: from SJ0PR13CA0230.namprd13.prod.outlook.com (2603:10b6:a03:2c1::25)
 by IA0PPFB67404FBA.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 17:30:08 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::18) by SJ0PR13CA0230.outlook.office365.com
 (2603:10b6:a03:2c1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 17:30:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 17:30:07 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 12:30:00 -0500
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
X-Inumbo-ID: 86518551-6721-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4nr+L6Ay3g9UMlBFvmjwA0KpvhTT0/kfz2ZIM5vsDxwRD8WQmDkhzWd8OY5p1vcJr66DZJ+AN9CgVSE0rfY4us56uw+BfLaQwVK6nSJs2i1Il6dlQAeUjZyHcjmtBhVtY+XTU7mLmSj+X6sUuHwcWT1kQkj28BYBpG9xKoZnNmSoaByMP52RROfd/hhx4YdvNc4Lh/DldkzRru7rKlYRgxTtm4uQiUu/bf+5QDEBFNHqWzJPvdplyFwag2y5xGsEBZHzoRuoCXVkQyaGHjOxgn2w/XDG45JVWMv0nmSE+eSYcIRiYVcKfmR52IfxvrHWPHIZnHdjBnOfYsNjxonEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVdqw6MM9iOE8BD5GPooV0PSEetzCsvBrEFYH2M/HJk=;
 b=UBpJguFZH8H33zXA2/HmJl7jEtCsMBkjI9A8fCd7WkDtTW6+KGg09/DWiZj2qjDlCqLTR2Iw2jbvXmWg2CHY4PurdyVoUdMpz7F0MDllXTSjwAvstiAfbmC2KqzqB8i2BRWq51tX53xK9B4cUiRGTnssQphwfCQRU+z9UI0xJmkSbzH3oMJhGOsn7vNCdvrglyFa/SJKoWtGoYH9cn7ZlEFdJqmoTGV/B3kjqB0zm5byC3BARqe/5RihJG4HsuNfqmS7QSuOiIMi+oQH0dKAlzu5pjFjcAGmtCWCAkhFCXe75vGF6iut1g6sNoYLEHUNH7YAVHSBPhLkkTuBjHkzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVdqw6MM9iOE8BD5GPooV0PSEetzCsvBrEFYH2M/HJk=;
 b=QfocYOJOwjZFI25M3n3j7djgJJx1tTjF6nwBoUrC34VtP/3DbePL395PmX/L9E+x9v50sjgoYsvuVwFgaEYtS2x6iGll8ZP+9k2LP1h/UsPdSR4Aj05zlWWjvEkeSCk8LJeZslL/+E2TDFGX0/i0SKSNy2ptuO93kQ8URzen0cA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 19:29:58 +0200
Message-ID: <DBIRG1CCNTDD.IMDS9BZ1PVE7@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
 <4f3da0b5-d8f1-4f6a-b6b7-7febe46d1750@suse.com>
In-Reply-To: <4f3da0b5-d8f1-4f6a-b6b7-7febe46d1750@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|IA0PPFB67404FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: 57272bf2-deea-4595-0399-08ddc945675f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aldOdlpmdi91Z2J0elFmRDhzbzExNFlrYi96L1lVd3Y5RHVEelZaSUxaQlpF?=
 =?utf-8?B?b0xTNitiaDUzT2t3TlhWRU9USVVoL01rM3N1dTMyN1J4RmljYXF0dGM4NE5h?=
 =?utf-8?B?a0dDOWp5MVRhYTdORTF6TWdWWlV1U3BwZEtrUk5VNG5KaEVwRDNyYzBkUG1R?=
 =?utf-8?B?eDJGUHVuUkxieWdaSXFMN0ZWTmxTY1FidC9YQW9GOG5ibG9wTmZCWG1EVTlC?=
 =?utf-8?B?UU03Z0lNdFY1cU11bGRVV2tlLy9KdnRpdDhkd2FTVGdTSTNUVXNNanZEbHd6?=
 =?utf-8?B?bWJPR0VhU3UycmZyazNsNzBHWDVLcnRaTEtVVW1kQk5ZbGJ1OTEycFBHRjhY?=
 =?utf-8?B?bEh0ekV5d0lEQm8rS1MyTVZKQWhYRHlER3BsZkFIb0pDL0FBbEpjZDZIZVJi?=
 =?utf-8?B?czloQVg1U0JtMGs0elFVaTVyc25XRXBER3poaWhiQkFnSzdNOEo5TWVYMTFt?=
 =?utf-8?B?L3pnMEU2ZWNQUmFyM1lPQVdOaTFGeS9BYm1KblIzSVVpQjlrSWk1dmxpRGJT?=
 =?utf-8?B?ZVZEWnowT2VjMFNEM3ljeHF3Ty9tQWNMVlU5WVE3QVRKZjZYSEVML2JKZmRF?=
 =?utf-8?B?cHY5U1pQek9XQ0pTdEFOWkk1bEFCdUE4V1ZsRXczeGI5THRJMlFpNWY4YXF3?=
 =?utf-8?B?RENCZW5BbXAyamRsMzhmTTBnNmpPQThFNlFYKzNxVHJSbllYNmY0YlVFZjFD?=
 =?utf-8?B?TVA1WE5RRGw0cmlnYm04a0pyMStmMkdpZ0xaUGV4L1Rjd1NmcUptZ2RkNUhL?=
 =?utf-8?B?N2lMamxoeUY3bFdtU3FVWjBTWWJuakpvTUtTeEM3N2dSWUNvbFhmSlRGMlN0?=
 =?utf-8?B?SjFVOEhodTlZTkx2UjVlaldJTmhuM21xQVpaanFsOFpSQ09ObVVTOGNoRGpt?=
 =?utf-8?B?UGt0TU01Q3g2czRlRytJVVM4Sjhjb3VoUFZXUUlicG9SclUwMGNRUjBWUDNX?=
 =?utf-8?B?MjNvMFZQQThIRGVPYUJBblB4OEhWTjNlclRCMWJscklWT1VvSStzZjdVUkpN?=
 =?utf-8?B?YnFjeFg4cVZveTVkUStMUE1uVVhLczVTS1BkQnJMeTNoOTFKRVZXSDhXTHdU?=
 =?utf-8?B?ZS9UbTBUUDRtUnlTQkQ2NnFhWm9mQjF6TUhBR2QyVnpYMlZncmFVSHhIUFUv?=
 =?utf-8?B?aGtoK2lWeWNGVkE1OGkyOUhuVTJKbU55UjZaRzNVNVUvQ0hSa296Q3drTDNu?=
 =?utf-8?B?aTNLRHYzUWNrQ3FjZ0dXdXFFaWRENWlta29RZ2UvK013YXQzVHNNVnBWcExm?=
 =?utf-8?B?TFI4SXNFTm90Rk4vRC9TR2hWdVFlbFZqdXNYeEUxSHZPeWZvai9GUFBVSmpQ?=
 =?utf-8?B?VGRIQVdSN3U1bW8xZ2F5THJxRi9GNERTV0NpdklFNjAxRm84cGVDM1NDdCtw?=
 =?utf-8?B?a1I3Y1pWUU54Y0w0Wm1oeEVmcENKQUdYaGZLZ2ExNnpIb3hPTjNubGc4cGNj?=
 =?utf-8?B?TWNBQ2l4dlRGYS80SWlxUWlhUkhNVk5Mc3VGTWt4QTB4N0xYTitoVms1YXU5?=
 =?utf-8?B?YTNBRytxT0FIT0xmY1dHSGZlYjFOSnhWc1pSdS9WWE9hYnZLNW9MVmhpOUpH?=
 =?utf-8?B?MzZ2Y2pxUm50Zi9JQzNQMWQ1VzB0d2FGNXJXdkJCV0o1K1RKUHRiU1NtZUJq?=
 =?utf-8?B?NnRtMzFtRUp5UW5rWEFFR2s0QlRPdGFUWFRzc1dxVUJvTENSamU2Zkd0L21s?=
 =?utf-8?B?TzhLNlFadm1lajVCYlZQK1pNUWVOK0tuNTREQ1hrQmM3SDI1bzRLank0VG50?=
 =?utf-8?B?VlZLSWU3Nkh2aUN4VWdndzFEd1BEN01EaTRwZVpVMmdoSHRzNTFFZVJRREp3?=
 =?utf-8?B?YTBiYnBJVFRNNUhnR2pRRDVIWGpNRlhhZFkzYUJQZmtTU2xZZlJTYTFmTCtR?=
 =?utf-8?B?ZkUrYUFIRUhNYVUyUFovSHppNG5Qd2hXT0hzTUZyN1ZDRUlmUWFzbURlM3A1?=
 =?utf-8?B?Lzg3WkJlS3BDcExsK2pDeUM3OE5ES2NoNTVoY0ZwV3g2QVRYOXhZN0I3bEJu?=
 =?utf-8?B?eXJ3VGdsWHYyczNHRFQ4dkk4ZkRkazdCWXp1bVNEL3pkakJ1ak9yY0pTWFhV?=
 =?utf-8?Q?w3brjL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 17:30:07.9339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57272bf2-deea-4595-0399-08ddc945675f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB67404FBA

On Tue Jul 22, 2025 at 4:45 PM CEST, Jan Beulich wrote:
> On 17.07.2025 19:51, Alejandro Vallejo wrote:
>> Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
>> behaviour on any hwdom/ctldom identical to that dom0 used to have, and
>> make non-dom0 have auto node affinity.
>>=20
>> Rename the function to alloc_dom_vcpu0() to reflect this change in
>> scope, and move the prototype to asm/domain.h from xen/domain.h as it's
>> only used in x86.
>
> Which makes we wonder what's really x86-specific about it. Yes, the use o=
f
> ...

Mostly that it's the only arch doing it.

>
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
>>      return max_vcpus;
>>  }
>> =20
>> -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
>> +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
>>  {
>> -    dom0->node_affinity =3D dom0_nodes;
>> -    dom0->auto_node_affinity =3D !dom0_nr_pxms;
>> +    d->auto_node_affinity =3D true;
>> +    if ( is_hardware_domain(d) || is_control_domain(d) )
>> +    {
>> +        d->node_affinity =3D dom0_nodes;
>> +        d->auto_node_affinity =3D !dom0_nr_pxms;
>
> ... dom0_nr_pxms here perhaps is. Yet that could be sorted e.g. by making
> this a function parameter.

ARM doesn't dabble with affinities while allocating the first vcpu. It's a
straight vcpu_create(). We could definitely inline setting that affinity
setting and forego the function altogether. I'm not a big fan of functions
with non-obvious side-effects, and this is one such case.

>
>> --- a/xen/arch/x86/include/asm/dom0_build.h
>> +++ b/xen/arch/x86/include/asm/dom0_build.h
>> @@ -23,6 +23,11 @@ unsigned long dom0_paging_pages(const struct domain *=
d,
>>  void dom0_update_physmap(bool compat, unsigned long pfn,
>>                           unsigned long mfn, unsigned long vphysmap_s);
>> =20
>> +/* general domain construction */
>
> Nit: Comment style.

Ack

>
>> @@ -1054,9 +1055,11 @@ static struct domain *__init create_dom0(struct b=
oot_info *bi)
>>      if ( IS_ERR(d) )
>>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>> =20
>> +    bd->d =3D d;
>> +
>>      init_dom0_cpuid_policy(d);
>> =20
>> -    if ( alloc_dom0_vcpu0(d) =3D=3D NULL )
>> +    if ( alloc_dom_vcpu0(d) =3D=3D NULL )
>>          panic("Error creating %pdv0\n", d);
>> =20
>>      cmdline_size =3D domain_cmdline_size(bi, bd);
>> @@ -1093,7 +1096,6 @@ static struct domain *__init create_dom0(struct bo=
ot_info *bi)
>>          bd->cmdline =3D cmdline;
>>      }
>> =20
>> -    bd->d =3D d;
>>      if ( construct_dom0(bd) !=3D 0 )
>>          panic("Could not construct domain 0\n");
>
> Isn't this movement of the bd->d assignment entirely unrelated?
>
> Jan

The prior incarnation of this patch (see Daniel's RFC) took a boot_domain, =
I
think, for which the change would be required. It indeed doesn't seem to be
required any longer.

Cheers,
Alejandro

