Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5678DAD004D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008405.1387693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNUCu-0001Hi-9o; Fri, 06 Jun 2025 10:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008405.1387693; Fri, 06 Jun 2025 10:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNUCu-0001G9-68; Fri, 06 Jun 2025 10:21:52 +0000
Received: by outflank-mailman (input) for mailman id 1008405;
 Fri, 06 Jun 2025 10:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Tda=YV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNUCs-0001Et-61
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:21:50 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20617.outbound.protection.outlook.com
 [2a01:111:f403:2405::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b4a0176-42c0-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:21:45 +0200 (CEST)
Received: from DM6PR06CA0061.namprd06.prod.outlook.com (2603:10b6:5:54::38) by
 SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 6 Jun
 2025 10:21:37 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::e5) by DM6PR06CA0061.outlook.office365.com
 (2603:10b6:5:54::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 6 Jun 2025 10:21:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 10:21:37 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 05:21:34 -0500
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
X-Inumbo-ID: 0b4a0176-42c0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNubjrCPpIv+4+oKumy4iBnED8LUiZTSeWZrS/F1EQ7jxIPNHmAMCCaLn3TwgJC2AHreYy2L7xVs+xG7D8xdAz1Z51OUMRpmBUA+s6zZN+OC4zjIOGZRBtG2Sxr5g138Dh6ShxcI9d3D3nm5LQ3tAplT90rF/118Qh9rn9HiuXBJpkAhY+OjIHhTbSABQgytjiEKKZrVE1DmVMvU4W+/I+rEqoc+0ZF9lf5TKJlWCLpZ8T5AUUSOznrLPxki/Z5SgxwuwcSl7oA6VZLLV2+NdVR1QkX4MutLggHlzF64GrUiPDsHLzg5HpSwSs8jlHtOekIR9JipVClZAlpgzaCH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9VZL+7u7O0wdQzIObCKnPDKU6jDyEgg825DwfufhCI=;
 b=uYnfU7n9F1Tj8SuuQpkmOsfX89DSy6STxZThamSxEdrkX6V4fwD9PEffD+ZevVX8xN394liZUo5UxbHv80kDZ/iohSqFt6v77w0cj7HoTOQJDoiVF3mJTyJWMSZvOW1RgHV7vhPuQLkiXk2/t8jjveNUeLNtPSwkokCdEzxEdWGKkOqp40lF2sAuLf52Wtz3t7viiPojPV2u2dNakHEMUsWuJj7lAj6L+Oeq9ZRDQPwzftbzQ+yom+NsasgHMK70+OLTwof/qz417mHF/UjtHJdqG2fG5+JRWQfGY9NUbuzgW5vmO2/tF5ptGOioefOQHqGk63P571+qneH6WCvKHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9VZL+7u7O0wdQzIObCKnPDKU6jDyEgg825DwfufhCI=;
 b=kGmOC7K0CWExcWJVASmKxeX7rZJsoCqjDNmovN5RWMaavVwcBH5i8jOcct4GOItl8dWNbJq2kCfEO+JnJbYuzz0frczfHJBDJbk5zVahlmUJy5t34DoL2FqRAV3dWHcdK+3bVnhPfiPmXD9WZldRBY7EypxgGVOtzSUOBvfEWBA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 12:21:32 +0200
Message-ID: <DAFDIY3ZUD7P.25YOTSEIDV71M@amd.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 01/15] xen: Clean up asm-generic/device.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-2-agarciav@amd.com>
 <38104467-fb7e-4aa3-9c78-0f9bf23183eb@suse.com>
 <DAFCZ0J2JEVF.3TIHRWPDJA1PL@amd.com>
 <20e6673b-bf85-4f9d-9938-7005a481b898@suse.com>
In-Reply-To: <20e6673b-bf85-4f9d-9938-7005a481b898@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 823466d1-5f5e-4251-f9d4-08dda4e3ebc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U29yNkY3TG1xeW56TWphNW5XRmtKVllvaVpkUk9uOElnRndqQlZHaU95bVlz?=
 =?utf-8?B?YXpSOFJ0M0FmUkpHaHYwa3lDaEpEWFdlSE81Rmw2TmttVnpyRjg2NW9QQ291?=
 =?utf-8?B?T3RwNGNSNTlzTjRYVEdFaWoxQ0c4bFJDN3VhMU01SkgrTStRWlAxa1Y4REp5?=
 =?utf-8?B?VXBBbW1YcXAzNGtlS2NodkVLaGJmODZtUnpuc3UrV3ZBZXFPc1FxK1FUWDlM?=
 =?utf-8?B?MkF1MXQ1dDR3NmFxcnRwbUttdTJ6eHFVUXJVS1lhS2loUmVRdjloTVc4dmo0?=
 =?utf-8?B?ZjRhZnZ0d2lFY3JzaUw4a2k4czBSZk83OXRtNUVSVEhQUEJaNkhodmRyK3Ir?=
 =?utf-8?B?STN1Y3BweTBmV0ZXQjNCc2lQWGgwMGt2eldrNE5lVC9teG5lcXI3VmpaNXE0?=
 =?utf-8?B?K0t0UVZ2MVl0RkFoWlkwakQ1U3JseFh6NXo2QTVZcUMrZEtVR1dwdnI0Sjdo?=
 =?utf-8?B?dG9rRmh0OFRjakljRyt1RWNGTHNCR3VKc28vaHplNHVka3c2amxQTmp3RWhX?=
 =?utf-8?B?SUJ6bEVMZ3ZVMkZVYUN1c3Rra1FoME9ick8rZ05MRkpsTUJ5YzdSQTlZcFJW?=
 =?utf-8?B?TVVxb2lnK1pQVjJBbEhYWFJHOHZ4eDBsMG84dFI5RE5Gd0hkWTFtTGhweWdt?=
 =?utf-8?B?R1RIVmFaeUdLcFpDSFNPeFM5c3hkaVJFMXhOMUcvYTNBWkVFUVZwSnNuU0lP?=
 =?utf-8?B?eFVVZ0RDajRYdi9tRjd2N0oxNGxiV3hBcjQ1RlFhM2RqY0tNVUFyRCtkRGVM?=
 =?utf-8?B?STNjWmVsNTd5NmRILy9YSUtCWFNzeXI0YThFQjMybXVqS0JrYTNCaXAzUTB0?=
 =?utf-8?B?UVFHQTlRM2JEdFJoOXlqVzNFZXMrdW14MUhjSHNabmhYYjl1T1M1YjhlRXVU?=
 =?utf-8?B?bnlBR2VWcHlZRlN3Q2Eyc3VySjVQZnI5NlMrMzJRZmhkRnprT0lJbU5vb2lj?=
 =?utf-8?B?OTh5YWoxR3FCMUdiRTcrYThZMk9VUjF6NHZUdThDWFhoalEybHFPaWZlVkdX?=
 =?utf-8?B?MUdtWFFMcFJXMTM5NjNqbndyQ2gyTmJLRjdqbEI5REc0S3lnQWM3UjQvQ2hU?=
 =?utf-8?B?T2xLdGdqZmNzZmJZZGJHMlJleWZ0bzdTV2RuclY1WnA3cVpBc0dBcjZoY1lQ?=
 =?utf-8?B?S0J6UXlqT0NydTJKaVl6NlRhQXhHaG1KZWpXU1FTQUtyU2h5ZGEwUkpJYTda?=
 =?utf-8?B?T3h3T0JhV0N3dTljYlBqdENKM0dVeDNsdkJpU3pxRnArZVYweFJOaXN0dWJm?=
 =?utf-8?B?Qkk0UTFHV3g0WEY5T3FnN3FDNzQ2S0pnK1RLWS9tUXIyL1I5YkYyQWh3V3Ew?=
 =?utf-8?B?SG80Ykc1NU1hWmhoMFdSZ2hVWFgydVdaQXJ6MnVUT3I4ZEFUeGNIY0F4NXEy?=
 =?utf-8?B?S1ozMzVHSkJPWnhLbW5GMFdja0tNY1BiOE8vVUlPVmgvaG1BdVUvRHZDTEFz?=
 =?utf-8?B?NmtRRVFiVmFPSXl2bUhPSzlZWURCV09zM0c3bkwwbnVDZmVJUm41N2k3V01M?=
 =?utf-8?B?SHJBaFUzQ1NZRUpwclZMUTh4SzRBOC93TjhMY1NPSEFPT1hlY20wWXVYNmQx?=
 =?utf-8?B?ZnYrckY3YkZNa2RFK2pTQzNIc20wT3MydjVZckg0elgyVFhhQTR0aHRDQjZ4?=
 =?utf-8?B?ejdIdG1rdjE1S3AydEoyNGl4YzlZdVl5SksyNkpUTE5UM2VjSEdDY3lGSGpj?=
 =?utf-8?B?cFo5VHRYVHI4Z2kxN2w4UjhST0VvdmxwUU9Iem5hZHgwYUxIUFM1emM2ZjU4?=
 =?utf-8?B?UkNQSlk3Y3Z1bFdtenVzZ2VHTHZqeFdKVWVDamM2UDlJSEttSHA4dVZ1Q3c5?=
 =?utf-8?B?dlZ5dVozcWhVSis2N0tveW44OXVCdTNHUTRYTVVjSlBUbnhhbWUvdlRZcHRX?=
 =?utf-8?B?UFhnRlQvV1BrbW1JMkU4RjRlZzdYVHZUSVl6ZUtMVTRRa1J5SEVlK1d3cjc2?=
 =?utf-8?B?ZkI4cGlraUthSjlPRlJ0UEtJNjMrdmlyOW1rVHNTWXN1enE1bG5QRHBPT0xZ?=
 =?utf-8?B?blhCb3VhditoQWk2WGR4US96cVA5YWxOR1dBZVZzVlFUVFR5MmFmYWlyeXVy?=
 =?utf-8?Q?5Cn3HH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:21:37.5902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823466d1-5f5e-4251-f9d4-08dda4e3ebc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909

On Fri Jun 6, 2025 at 12:03 PM CEST, Jan Beulich wrote:
> On 06.06.2025 11:55, Alejandro Vallejo wrote:
>> On Fri Jun 6, 2025 at 8:51 AM CEST, Jan Beulich wrote:
>>> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>>>> --- a/xen/include/asm-generic/device.h
>>>> +++ b/xen/include/asm-generic/device.h
>>>> @@ -1,14 +1,20 @@
>>>>  /* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * This header helps DTB-based architectures abstract away where a pa=
rticular
>>>> + * device came from, be it the DTB itself or enumerated on a PCI bus.
>>>> + */
>>>>  #ifndef __ASM_GENERIC_DEVICE_H__
>>>>  #define __ASM_GENERIC_DEVICE_H__
>>>> =20
>>>> +#ifndef CONFIG_HAS_DEVICE_TREE
>>>> +#error "Header for exclusive use of DTB-based architectures"
>>>> +#endif
>>>> +
>>>>  #include <xen/stdbool.h>
>>>> =20
>>>>  enum device_type
>>>>  {
>>>> -#ifdef CONFIG_HAS_DEVICE_TREE
>>>>      DEV_DT,
>>>> -#endif
>>>>      DEV_PCI
>>>>  };
>>>
>>> My objection to these changes remains; as a generic header it ought to =
be what
>>> that attribute says - generic.
>>=20
>> It is generic for any architecture where platform DTs exist (that is, an=
ything
>> but x86).
>
> Here you're limiting things to what Xen presently "knows". I'm sure there=
 are
> other architectures where DT is entirely unknown.

You'll struggle a lot to find one such arch unless you want to revive the
itanium port, and even then itanium would simply re-use x86's asm override.

>
> Furthermore isn't the work here part of the hyperlaunch effort, where DT =
will
> be introduced to x86? Hence "anything but" isn't quite right either then.
>
> Jan

Not a general DTB, no. A DTB defines the platform (in the same vein as a AC=
PI/
DSDT), with all platform devices enumerated there. x86 will not get any of =
that.

Without devices defined in the DTB, my original point still stands.

In general, if you don't have DT devices you typedef device_t to pci_dev to
avoid these wrappers altogether, and if you do you don't and the ifdef guar=
ds
stop having meaning.

If you remain unconvinced and others don't pitch in I'll just drop it from =
v3.
As I said, it's not essential.

Cheers,
Alejandro

