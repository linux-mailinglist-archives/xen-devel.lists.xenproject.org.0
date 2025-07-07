Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E942DAFB677
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 16:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035617.1407951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYn9x-0002QQ-LR; Mon, 07 Jul 2025 14:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035617.1407951; Mon, 07 Jul 2025 14:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYn9x-0002OR-Iq; Mon, 07 Jul 2025 14:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1035617;
 Mon, 07 Jul 2025 14:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPdz=ZU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uYn9v-0002OJ-ST
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 14:49:32 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20622.outbound.protection.outlook.com
 [2a01:111:f403:2009::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f4d004-5b41-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 16:49:25 +0200 (CEST)
Received: from BY5PR04CA0004.namprd04.prod.outlook.com (2603:10b6:a03:1d0::14)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 14:49:20 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::58) by BY5PR04CA0004.outlook.office365.com
 (2603:10b6:a03:1d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.27 via Frontend Transport; Mon,
 7 Jul 2025 14:49:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Mon, 7 Jul 2025 14:49:19 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 09:49:16 -0500
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
X-Inumbo-ID: 92f4d004-5b41-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXQy4a5YBNM9gLht9oYjRjIze4kUyi1xUdulCghs6w+9DIc6F8vPwnYFtsj1Tf9CzcFQjDlizpgwlIVG2FDxfqkDboE4BjiRRsbHTMXOkRB5wAcrNQHpMoBhSueel89q7tYErU8iLK5g2XA1+QDCSh42Dt/fdLhbb16CISP7P7DYzQXwFJkupHvpn1q8+YAhlLFYeM58JSVhUFKA6JCFyGidbq1M5W0hPp8d46vwn5xfQwmaZq4aMUHjn55gBfM8/m27AEot83jQ+KkZTNUBjju38gBZd6UKqQZwGKMnJkbtTyR9SvLk9Lrv2lp5EYa+CN2tTTCC9wPiMVmxqLGSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmnHBb3UG8wWl40u+v3IGQEspltpBY3tLWJ9kkHWfmM=;
 b=g9LkxbvCwqGN5I4IBEVS1O1fdHl89bYHsQL0qusSJZo2ri4iGYngO88t7b2HEn21SZL4dxiN9IeNbLu5iZtoW+O+2/UVJn0JhVbm/lzqkO1ECh/zhkBx6s78GwNSehvw+ft/n3zLSfUMfeZrm9yF6OxehcKnUO1ctBvJP0cGVEVN4csEi5fhZCDLHMTYDrZxzb7wUl981HaaKqb4TizwTIcduolW7/Z3OUas9stYmReu7uSN8wGZ7f/DM2ScW6G71q5k8Z4z6SdTu7tSAgU4dlX8jLdQzFAT/NVwPy+C0t2dVqnHclvf/Z7jHtUNNQPZRhsjWOWFxrveeU8uiGaKWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmnHBb3UG8wWl40u+v3IGQEspltpBY3tLWJ9kkHWfmM=;
 b=5FqC7boL8M+WT6XfYLSojA+lljKoQDUj3Gr+gLgIyrfhaeOpUOEXT2kXKI7k7lhHbAuBtCiqFGHUA6Yx4IvAGcaGOBWNBYbUJn3SYDupZrIAPacPiMXn8XUVI57Jd0Sb2RzTVT0h9zpYf1/ntx2FeZdxJJNqMlIeR5Rv/U5HBuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 7 Jul 2025 16:49:15 +0200
Message-ID: <DB5WMT28UFCC.IM63W6FNEF09@amd.com>
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with
 the common one
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jason Andryuk
	<jandryuk@gmail.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>, Daniel Smith
	<dpsmith@apertussolutions.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
 <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
 <2a7dab07-9e52-4d4a-a80d-99229c9fe093@suse.com>
 <DB1OGNLX29US.Z8UCST2IR3VI@amd.com>
 <3ac18508-d1e6-471f-8fee-6e233ea6cef4@suse.com>
In-Reply-To: <3ac18508-d1e6-471f-8fee-6e233ea6cef4@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f72f83c-4a34-4f9c-60bd-08ddbd657486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTg3QUlEdmtHeHQ1ejV0RGRDSUYvOGNQR2x6TWNhWTJoY3J2T240M1JFekpn?=
 =?utf-8?B?blZRbE9OdFV0NWF3MXZHeGJZMTZXSmltb29SWDE5V1dtUzI3VW1oR3F4Y2FH?=
 =?utf-8?B?M0hXS214bU1seVlwMjc3Z1dwQTJPMHJ2Q0JzUTV6ZVdiWmpyZXNkMVNvV0F0?=
 =?utf-8?B?U2VuV1hseEpTOGJQNmpacDRjZUpodzBieE1iQUlMbTRkdzd5YlBPTno3bkJD?=
 =?utf-8?B?S0U3aGp1TGt5aFI0WVlLOXlEOFQrNVVQMFY5ZTFiSUNmLzlPTEFPcE5sdjFy?=
 =?utf-8?B?MmsrZVFBMFJqeCs2N2lHbEVqLytWK3lLY2RKMEl1MzIyZFoxY3NpWDFTR09H?=
 =?utf-8?B?anR4OEVDTVNKbDRuaGZyUGNNUmRaSGJqYTB5dWUybGlPS0g1NHNpa0pXZTlU?=
 =?utf-8?B?RmQ3eTlwc1dHQ0hINmdJRmN4TTNUMkhRY2VFdlJ2bnRVNitqb0NqQ3JyNEhi?=
 =?utf-8?B?RmxRQktMeXZxMjlIc1M5cjFEYnFwS1VHSFRVR3NoNXJxWWk1NFFDUzVvaEZ0?=
 =?utf-8?B?c2taOEFGbW8xZ3VwWFdrWkZEQmtkcGprN1ZOb3RmRkZkVmtNYitFR3h6RWlZ?=
 =?utf-8?B?WkY5SGZ4eWdjOUllRnl5Q2xmbU9TdldSTXg5bmMxTVFuVVJ5cmViRnZZemtG?=
 =?utf-8?B?dFV5U1U2NHlVekJrL3IvRXZwcUVYS1dENUwrZ01TVm5qcm5QV1dDc3dmQlAw?=
 =?utf-8?B?L0lhS0c0TkNRUjZ1cU1UaE5SZk5seU9Zem80ZTRTK3ZlbHZ1b1liZkoyeWh0?=
 =?utf-8?B?QzIrUFNXdlk3OG1FcjRxOXlzMFFDc0tSVFhnbnhuOERYY1NldjNOa0xPVXRG?=
 =?utf-8?B?OGZjZXdreEIrbkpHc01WNy9ScFkzS2JPRTh0dUx4ODJSdk4xamxjMUlsekNM?=
 =?utf-8?B?OGVobWppRFVxZ1ZLMFE0S3dqak9tWjBMNFZUN0ZVaThnTDBnT0ZtNTFqbDBi?=
 =?utf-8?B?KzVtTW1USmRsTmFFTGJpNmVlMTRMdEtncTh6YWhrdTd5Zk1nd3VLNVF4OTFZ?=
 =?utf-8?B?YWljdTlOT3MrejAxZkdtZGp5aTZzUi9HK09UbDZDZkd5QlJaUDVmMXNobmRa?=
 =?utf-8?B?RmkzSk9FYW5hQTdUZGFoNXpJZml5aUYxUlc5S0tJUDJUVlBrRkUwSVZjMmxD?=
 =?utf-8?B?QjBMZ0ZLTTdzdlNIZFdxQ05ReWZuMng1NGhSQ3JvN2JYVWNOcUZIRnVMaENO?=
 =?utf-8?B?d1NuK1MzaVVwSVc3SnMrOHJvQ3VXejZWOVQ1akpsbVRDeVl0MGljZkdXRXZK?=
 =?utf-8?B?MGNMUzJCdUFVMS81QzRxd3lVajBPd2QzTXl1dEdQSzA3YWRNcDQyaUpEenBh?=
 =?utf-8?B?VW1SNlhLZVQ5MmFzTUdtb2J1aWpENWYwcU9zeC91NEtBOGRETXQwWlNlanY0?=
 =?utf-8?B?TCtQZ3p2bjFNeVMvMEhVWTkrNDdMMTB2Z1luc2k4YlZCRVlldHZEOHphK2NQ?=
 =?utf-8?B?OXJHdUJ3NHJqWk9zS3MzVWpReDBGNUhQNkkwVUcvNzBGNllrOHNyQzYvaUF2?=
 =?utf-8?B?U2I4NytwMUEzR2x4YjZBazl6dVVmQTNEekpSYUFwaTloNFlIMnF4MFRMamRo?=
 =?utf-8?B?WktGL2VmLzduUHFWT0prakdncXZhTEV5dHU5cDM2QkE3aDlKbnNURVpsSXlZ?=
 =?utf-8?B?eDcvb0JYb2ZoeTNDVmJrVHNkUk5DbHUvdUpSVWYwdExnT3pscDRPbDlrMUxJ?=
 =?utf-8?B?Y1pmMForK2dFcjRPdEFkWW93N1JVSWt2N3JxUE13NUJ1SEkyR3FNNDV5MHpw?=
 =?utf-8?B?MHljOThUREpVU0VOeVowY2daeDVEeGgzeXdIVnFuOHlObDVjQ1VYN1o5UzVr?=
 =?utf-8?B?WHJrT2E4ZkhPUzVCTWpreCs4RHR3UFJmMS8yK0g2TkQrTUFGY1ZqbnRZdUVh?=
 =?utf-8?B?Q0JDaUp6UzM1SUF1RDN2SHYzTUtWVUUwQjhOY0VJRnYwWnN1bG9PbzQzL1Zt?=
 =?utf-8?B?WVB1ZjZ6SlNuck1zc2xhZTRMWUQvcGtPcTZlZ04yYmRqUXp5bHp6WEZPaklH?=
 =?utf-8?B?RHVzdUtycUswSnZHeUpmaEdYNnJJa1ZiZ1BDVWtEMVR0SDROYWlRcHBZL0JH?=
 =?utf-8?Q?pyLXgN?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:49:19.9425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f72f83c-4a34-4f9c-60bd-08ddbd657486
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124

On Thu Jul 3, 2025 at 8:04 AM CEST, Jan Beulich wrote:
> On 02.07.2025 17:34, Alejandro Vallejo wrote:
>> On Wed Jul 2, 2025 at 5:15 PM CEST, Jan Beulich wrote:
>>> On 02.07.2025 17:09, Alejandro Vallejo wrote:
>>>> On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
>>>>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>>>>> --- a/xen/arch/x86/include/asm/bootfdt.h
>>>>>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>>>>>> @@ -3,6 +3,12 @@
>>>>>>  #define X86_BOOTFDT_H
>>>>>> =20
>>>>>>  #include <xen/types.h>
>>>>>> +#include <public/xen.h>
>>>>>> +
>>>>>> +struct arch_boot_domain
>>>>>> +{
>>>>>> +    domid_t domid;
>>>>>> +};
>>>>>> =20
>>>>>>  struct arch_boot_module
>>>>>>  {
>>>>>> [...]
>>>>>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(str=
uct boot_info *bi)
>>>>>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>>>>> =20
>>>>>>      /* Create initial domain.  Not d0 for pvshim. */
>>>>>> -    bd->domid =3D get_initial_domain_id();
>>>>>> -    d =3D domain_create(bd->domid, &dom0_cfg,
>>>>>> +    bd->arch.domid =3D get_initial_domain_id();
>>>>>> +    d =3D domain_create(bd->arch.domid, &dom0_cfg,
>>>>>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>>>>>      if ( IS_ERR(d) )
>>>>>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(=
d));
>>>>>
>>>>> This being the only place where the (now) arch-specific field is used=
, why
>>>>> does it exist? A local variable would do? And if it's needed for
>>>>> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
>>>>> arch-specific? Daniel, Jason?
>>>>
>>>> As for the arch-agnostic side of things, arm needs some extra work to =
be
>>>> able to do it safely. dom0less currently constructs domains immediatel=
y after
>>>> parsing them, which is problematic for cases where some domains have t=
he prop
>>>> and others don't. The domid allocation strategy may preclude further o=
therwise
>>>> good domains from being created just because their domid was stolen by=
 a domain
>>>> that didn't actually care about which domid it got.
>>>>
>>>> It'll eventually want to leave the arch-specific area, but I don't wan=
t to do
>>>> that work now.
>>>
>>> But if the domU field is fine to live in a common struct despite being =
unused
>>> on x86, why can't the domid field live in a common struct too, despite =
being
>>> unused on non-x86? Otherwise it'll be extra churn for no gain to later =
move it
>>> there.
>>=20
>> Mostly out of tidiness. Otherwise it's hard to know which fields serve a=
 purpose
>> where.
>>=20
>> I genuinely forgot about the domU field. I'm more than happy to drop tha=
t arch
>> subfield and have domid in the main body of the struct, but I suspect MI=
SRA
>> would have something to say about dead data?
>
> In principle yes (and then also about the domU field), but we rejected th=
e
> respective rule altogether (for now? plus for a reason that I must have f=
orgot
> and that escapes me).
>
> Jan

Actually, moving it to an arch-specific field is rather annoying. everyone =
but
x86 needs the field. I'll just compile it out for x86 specifically with ifd=
ef
guards, even if it is common code.

For the record, I hope to get rid of it on arm/riscv/ppc entirely later on =
by
deducing domU vs dom0 from the capabilities property.

Cheers,
Alejandro

