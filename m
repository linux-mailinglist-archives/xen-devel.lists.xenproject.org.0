Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9CAC0B57
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 14:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993840.1376966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4jv-00012b-8l; Thu, 22 May 2025 12:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993840.1376966; Thu, 22 May 2025 12:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI4jv-0000zU-5K; Thu, 22 May 2025 12:09:35 +0000
Received: by outflank-mailman (input) for mailman id 993840;
 Thu, 22 May 2025 12:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/RR=YG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uI4jt-0000zN-7e
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 12:09:33 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d86cd47-3705-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 14:09:31 +0200 (CEST)
Received: from BY5PR16CA0026.namprd16.prod.outlook.com (2603:10b6:a03:1a0::39)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 12:09:26 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::a2) by BY5PR16CA0026.outlook.office365.com
 (2603:10b6:a03:1a0::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via Frontend Transport; Thu,
 22 May 2025 12:09:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 12:09:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 07:09:23 -0500
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
X-Inumbo-ID: 9d86cd47-3705-11f0-a2fb-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuCChqeO7yeLHq469TCzC7PhXksB3jiRJ0xsVoPSAbQI6w+/z8jMYIEOAv6c5zOT2ETuYnpfyK2VPgffer7N/bgnZGb7lnEv75qVnRtqsq+uNxrHXrDrj/f7l3aZIQfEi7rxdwutxKzsGmUE/6KXZTXcjBjFA+0FKXILwLhorBEhubDWicfTSjezB8vSFQ+NpKaOtec0wXRDoa7+RtCD3o1Mld8LkLVKX81EMYthP2dIDh9bk+Bwr5/qnIFglovbhjrV4c+qcTVzdqqp7Jgz/LJeCr9BbkOZAnbDF95uivThobDFmHpNEKareV35Kn0vQl1VKc4Iy704lqX4xETYsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yo6JcFNN/IEQDveHnx9Bzv6eOfNIFeZqCYxwX/8Trc=;
 b=I1kZJaWcB++hFc5MN2kjPMpcQDUUUIVZjxraKh3qNwPObBfJ6EsOt9PW6+xzJteXqsjql6BES+nSqV/QoWvHL3AxIpWakDm9bkA6uCMr823fR5BPZdGviHDXb1B8UjW0kTjdiOTGNSYbggrDe7Z24kWAKRAezYPSnA3C4/+XZtNCkNKRMpNFw9Yxdo9LZi8HlqlMaAuinm5ekZMiNQvLbyf93xowPwdOMGx38TETSXDJaoWOnJ6yfB3nE6qYvtLtPP3yx2fI3zGysU3ATmY2F/2uiqjRVYEVj63Avd/0oHfOBabXdm2VGGGrDsCBZhLvOZK2lV0/8Llrru1bNnOknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yo6JcFNN/IEQDveHnx9Bzv6eOfNIFeZqCYxwX/8Trc=;
 b=fzaI8vgCeUDjFYHTfuQ+eT4XSoAc6SiD02I8CyZ02QBF9e5JkqoIL9qIGjHoiuToIXaNqF/rmcMVO4Jt2eiDX5EjcC8Kc5+fBLR2eh7t6WP1juiaPvGxTAtopLLeftEZ4DQ+nw5BU+Ug0Iw29yPe2kmd67VRU+1AJc4h4EyDVCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 May 2025 14:09:21 +0200
Message-ID: <DA2OFBJB9ZT9.3EE1U62WVDG9F@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jason Andryuk <jason.andryuk@amd.com>,
	Denis Mukhin <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 02/12] common/hyperlaunch: introduce the domain
 builder
X-Mailer: aerc 0.20.1
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-3-agarciav@amd.com>
 <b57229cf-cdf9-46ea-89d4-4cce4b1bf0df@suse.com>
In-Reply-To: <b57229cf-cdf9-46ea-89d4-4cce4b1bf0df@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6f200a-197b-4200-a8d9-08dd99297ed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2VKQ2IxYWVZalpsYTZmUm10RXBmMkVFRkw4d3dXcDU5a1JVbVp0R0ViTVNU?=
 =?utf-8?B?OGtqK1hhdVYvdmE0a0tpam03cWNSODBxdWgrQ0NMU1hyYXRmN04xeDhWWGcv?=
 =?utf-8?B?d0VXZDVIbS9pR2RKMDZUeWhtRGlIbTRUWkpRWDd2UGQ5eEpLeE9EME5rL005?=
 =?utf-8?B?d1FHd3FPL0J1OVVWSUlTYzBhRU9QblVFTUN6d1hNUStuSHgxcU9WS0lWWXdk?=
 =?utf-8?B?ZUJ5S3NEejlRcDhPekxEOVA4SGRwUDBTNGIvWDFxL1Y2cU5IUzhYblFScWc4?=
 =?utf-8?B?emE4K1dLcktoc3ZLbEtjY002STFGTFBvSmlNeHk0UzczQit1VE42V0M4aXFC?=
 =?utf-8?B?OXNhQzgrVnpRRUVYYkd6OEs1VittSFQ4TmxIZUJWWmdFNWJEMXZQem5vZE9U?=
 =?utf-8?B?ZUc0SW51bjZWUVZwWUtWY0hPbzdPYVhLSGl4aXNOZ29oZ2NVQnJ4MldpVXhK?=
 =?utf-8?B?ZnBBUVE3bW5UVXhXK3hLNFdNMElIbHJLWElnRkpZRFpsQWpCSklsSFB1NmZ0?=
 =?utf-8?B?eEU4akJ6Nktrc0VmUStib244cjlrL1A1TkdraC9nOUMyU3NzbWM2c003aGJK?=
 =?utf-8?B?OVRteVhTZFI1UEdjYk5zK20xZzNSWUNCTVFaMldiNjhXcUhCb1JTSTZKTkFM?=
 =?utf-8?B?U3F5VmhJOU5IUFA2ODdsa1B3MERBYVZrdC9rMGVTaVp4Vm1rSnlaNGp1Tm9Z?=
 =?utf-8?B?OVdDVys1Z1ZiNDNBQkMrQ2REUFFYU2RVazcvL0ZrMTdyWm9KTWswYWJLUU5n?=
 =?utf-8?B?OFE5UWQ4ZlZzZFlLYzlNeU15d014SlV4ZnpranNha3hZZmx2RklBanN4c3Js?=
 =?utf-8?B?YmkyUGJyZWFvUldEQi9kc2t1eVNLNzBkaHZRMGpkaEJmZmlDeGJoMUk3bW5Z?=
 =?utf-8?B?cm1Hd2s1ZlNVRHJzMkh3WEh2UzNIR0VLVndrNDhXU0J3NHdGc0xzUXZhblBF?=
 =?utf-8?B?U3pqMVUwL0o1dElZQjRNNXFLMzV6STNScGJQTWUvMnV0T24rbWJWUEdhbGpB?=
 =?utf-8?B?VVptRjlGbSswT1MzSmFVb3lCcXYwZHYxSmFTMGN3USt1OHAvaUwxdmJNZEM3?=
 =?utf-8?B?NFVYcFU3d0w4Zm85dk9LV3U1TjlNeWtXTHhVUXNXQjZtZVpMaERFeTlOL3hN?=
 =?utf-8?B?Z0tMTSs0d1pLVzRFakV4Um9WbCs2REZuUUtVbkhjVm5YZHovdVVkMkd2TnYw?=
 =?utf-8?B?ZlRvYmt0a1FneTFJbVFEMGNTRlA5Y08wQlhRNW04SEI1aGhYaHRqVTYzR05J?=
 =?utf-8?B?VlJoc0JGekgvc3NNay93Q1JEK3pXMmkrd0IyZUVIL3U2VkhFK1FWd3ZCcEtU?=
 =?utf-8?B?VkJ3UTlhOFdzcjJFdE9qSlZTNjcxaTZSOG9LUnJNVGFTZjBIamdJelFiWXk5?=
 =?utf-8?B?YXIyWjI4aytiVlJtQktTaVBvWUFIcGVhNWJjQ08yRXg0V3BobVVTSzFJWWMr?=
 =?utf-8?B?UFQ1M2hwd3J2am1yRStZaTNtcGtCQ242SDcvaUlQNjdWYU1jSGZvRlg2SnpH?=
 =?utf-8?B?U0hueEU3cUdqQ0JuVElLdFd5OUtSWWVmZDF3b3VUdU1OaDFqazUxZllpZXUw?=
 =?utf-8?B?elNNVVV3MVIvVmtZRUhaT092UEZUS1E4VFdvbnVSTlBPdmgwOEg4YlpOUktK?=
 =?utf-8?B?TVpZU3VHdkxvQTdlVTI5a3YrZkRHWGt6bUYwVXJFTElyNXNhdmkzMlBiMWow?=
 =?utf-8?B?NjI0UkNhdHVOOVIyZDhjc3dKVjh0ZWx2YXpVYVpKS3EvTmd3dXprR2VCNld0?=
 =?utf-8?B?NmE2MVRTQS9XZjZENHlmcVdBY05ISFpXbFRqNER5clpmWHZVWUtNWUIyMy9P?=
 =?utf-8?B?SGxObDg1SGgydmU2enkrUlFtU3ZFVE9ocHdkZHdpZGdIbUpzSlcxVXc3L1FV?=
 =?utf-8?B?WnU5djY2d2dvZVNXNmpSL1JxakJyTmJ4di83M1dVOEhBZTU3VHFiU0lvcC8z?=
 =?utf-8?B?NmFpNzhqVzlOVWtWSk5KcVJ4NS9mQkJVdEppbjQ5R1hMRGhaTkV1R0RKcGlh?=
 =?utf-8?B?b2o5ZGlPdXJDaFNJOXl6QWJ1VDBXa1U2d0ZvdmJ4L05wWWdIejJDN2VSTVVJ?=
 =?utf-8?Q?rOUgEy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:09:25.5909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6f200a-197b-4200-a8d9-08dd99297ed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060

On Wed May 21, 2025 at 10:54 AM CEST, Jan Beulich wrote:
> On 29.04.2025 14:36, Alejandro Vallejo wrote:
>> @@ -1284,9 +1285,14 @@ void asmlinkage __init noreturn __start_xen(void)
>>                 bi->nr_modules);
>>      }
>> =20
>> -    /* Dom0 kernel is always first */
>> -    bi->mods[0].type =3D BOOTMOD_KERNEL;
>> -    bi->domains[0].kernel =3D &bi->mods[0];
>> +    if ( builder_init(bi) =3D=3D FDT_KIND_NONE )
>
> With this, can ...
>
>> +    {
>> +        /* Find first unknown boot module to use as dom0 kernel */
>> +        i =3D first_boot_module_index(bi, BOOTMOD_UNKNOWN);
>
> ... i ever be anything else than 0? If not, perhaps keeping the call here=
 is
> still fine (kind of for doc purposes), but an assertion may then want add=
ing.

I don't think so, no. It's there for symmetry with the way the initrd is
discovered later on, as that might be on module1, or 2, or 3 depending
on whether there's microcode, or an XSM policy or anything else. in
other modules.

>
>> +        bi->mods[i].type =3D BOOTMOD_KERNEL;
>> +        bi->domains[0].kernel =3D &bi->mods[i];
>> +        bi->hyperlaunch_enabled =3D false;
>
> Is this necessary, when the field is supposed to be starting out clear?

It isn't necessary, but I think it gave a sense of intent. That said I'm
pondering removing that boolean though in favour of something like

  bi->mods[0].type =3D=3D BOOTMOD_FDT

At which point that assignment disappears.

>
>> --- /dev/null
>> +++ b/xen/common/domain-builder/Makefile
>> @@ -0,0 +1,2 @@
>> +obj-y +=3D fdt.init.o
>> +obj-y +=3D core.init.o
>
> Any reason for these not both adding to obj-bin-y, like we do elsewhere f=
or
> *.init.o?
>
> Also please sort object lists alphabetically.
>
>> --- /dev/null
>> +++ b/xen/include/xen/domain-builder.h
>> @@ -0,0 +1,29 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __XEN_DOMAIN_BUILDER_H__
>> +#define __XEN_DOMAIN_BUILDER_H__
>> +
>> +struct boot_info;
>> +
>> +/* Return status of builder_init(). Shows which boot mechanism was dete=
cted */
>> +enum fdt_kind
>> +{
>> +    /* FDT not found. Skipped builder. */
>> +    FDT_KIND_NONE,
>> +    /* Found an FDT that wasn't hyperlaunch. */
>> +    FDT_KIND_UNKNOWN,
>> +};
>> +
>> +/*
>> + * Initialises `bi` if it detects a compatible FDT. Otherwise returns
>> + * FDT_KIND_NONE and leaves initialisation up to the caller.
>> + */
>> +#if IS_ENABLED(CONFIG_DOMAIN_BUILDER)
>
> For the pre-processor it wants to be the simpler #ifdef.

True. Don't know what I was thinking.

>
> Jan

Cheers,
Alejandro

