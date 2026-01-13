Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087DD181F0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 11:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201406.1517052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbsC-00024M-55; Tue, 13 Jan 2026 10:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201406.1517052; Tue, 13 Jan 2026 10:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfbsC-00021j-1c; Tue, 13 Jan 2026 10:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1201406;
 Tue, 13 Jan 2026 10:43:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaIX=7S=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vfbsB-00021b-C8
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 10:43:39 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c43f79-f06c-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 11:43:35 +0100 (CET)
Received: from PH0P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::7) by
 DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Tue, 13 Jan 2026 10:43:31 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::c7) by PH0P220CA0026.outlook.office365.com
 (2603:10b6:510:d3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 10:43:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 10:43:30 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 13 Jan
 2026 04:43:28 -0600
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
X-Inumbo-ID: b5c43f79-f06c-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHSJo1m2W1Hp8Ud7TJyNr+j0PxmJTU2IdcCkKACzTBvd4QoiIsj2TTrc2so35VhZX4infd77VZ5D7PcXxNEyjABdp33SZw93SMToRt1xhjUs9PQ5mbtb1IRhQj/KG39IoS4GgpGfNH8y4+tV88fyQnjYzSD89qs6ZzFL6cnHW/rpiVn91cUXfariY4PdaGqI/MeZSquPnd+pXb5gq73GZHI/Cu85wejJpDV76vftgs6+EZxmkIZmKP0bZ3SP4/E5Umf1GUgFiL6RsqfWsb8wHDjQlN7kgxYawpgiRBLDI4vwTfJPR5yVYfljzcbYRMqwdZ6SoRfK8U/eu9yp4upXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxBAupTg2kQOCyR9dcm+ZDQE2IHBtAaR3DA0JJCHbSY=;
 b=T3WlOvX3X/hRMoXRbwW72k3fpm6XXj4OBmFHgvByoFKpItBOgDjzMrPum9jLM7+m/DUTA6drQKFFanbp2WUEOvQVkJq4Glz3P2Vn2thTf3EHQkrmX1t5usLzwp9rAHNNiFgLUTyxooti3vC4l2DC/+X2V3JPXCjqWOtW/kXGPe4BnWU+7Fcjc0lDvOuIsUQobRp4q+26LkbGAE4RmlrrtqGvXrfsAgfOSz5lbLGH/cXZejx5X1NXw/lhVPQW4p+iECyPBY3YFy9ZKozFYH8Bb72b7KAgFRcs57lsx054ox8v7sdgpVi5tm5WVKiZfuS6qBkuOdiLZGcw8mImtEaEfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxBAupTg2kQOCyR9dcm+ZDQE2IHBtAaR3DA0JJCHbSY=;
 b=LA5E4+JyVCea8XG3YNcCwZ6eVFOq6z3LMYWhZ68Vo21GBDBLEkotY2mDXBqkVIEJLdzqqGFovIYjrP9+dz1kgI1mw9McsuyxSr6hFdpoYYcgaNyrj8L2FXXiNtF/S8gHYFYl+1P359pU1aMUgM9mo5emkaMsQoxXt/ZTiTN4+Ws=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jan 2026 11:43:27 +0100
Message-ID: <DFNEE421TEFG.RHC589DQMSH9@amd.com>
Subject: Re: [PATCH v2 2/2] x86/ucode: Add Kconfig option to remove
 microcode loading
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260112150259.74535-1-alejandro.garciavallejo@amd.com>
 <20260112150259.74535-3-alejandro.garciavallejo@amd.com>
 <96f4f3fe-46c4-4854-af55-d5adea07c847@citrix.com>
 <DFMU244K4E7W.6M0TQ5AI1TUE@amd.com>
 <5fb97540-0b29-40b9-ac9b-039a41e30add@citrix.com>
In-Reply-To: <5fb97540-0b29-40b9-ac9b-039a41e30add@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2d999c-0edb-4fed-b80c-08de529097ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXlqNENsaUNPdUNCR3BtRHk4V1ZXNGF3YnVUYUIyUmpQYitRU3lzSVBROC8r?=
 =?utf-8?B?L05idG1SdTFkNjZzU2FIdFdlb0RUWlZPQjlPaGYzdHMyMVBJanRZbWZya2ZS?=
 =?utf-8?B?c1RQcUx3ZGZNbzZWcHZIdk5xcFYzUE5qTlFaNFhNSzVHSVZ1aWIwandaYmFv?=
 =?utf-8?B?Wnh0U256VTVBUzZWVTRjNmhXbXFyUC85eXU4ZWVGVmU2U3ZqNDNOK2lpeHdu?=
 =?utf-8?B?RUdpVzRGMnNDV0l1RnRPZHB2LzlWMkZQWFlQb1l1SFJ4dWVxbkMxekM5a0gx?=
 =?utf-8?B?NjJTeXNwamkzSGhaSGRZY01vVWtvQ1U2ZzZsNDQ3VVdDbW02eVNxeEYwR0V0?=
 =?utf-8?B?WENLYTVKSzJsZGtOd1ZGR0NUTzQ5YW9leXNEVW13VmpuSUNaYUQ0WE14akV6?=
 =?utf-8?B?RFNLa0kxdHhVcFJJeUVjb05mdUVDeFVVcnlaUFdJOGhveisyeGlUMCsrTFBM?=
 =?utf-8?B?TzFib3Nydk9lUmloWXRSbXRqejdXazh0N1IwdzlXZlNhNlRTYUYrVmJaRk53?=
 =?utf-8?B?YTJLS2tJZG9rT21rNW9abnI3a0lkV0dOT1kzUVQxMFd2TE5Hcnk0ZDM1S1Q2?=
 =?utf-8?B?YXQ5WTZ1ZHJrSFJXTGh0SUJlQWg3Z1pzVzdhQTgxa21KeEVRWWx0eHdoZ3VN?=
 =?utf-8?B?dytxd0tOa3RkZXkwenNydVBuenN6dkFvR3IxaUc5SmVkaElCdlhLRVM2UWdr?=
 =?utf-8?B?dmN0bUZ6TmtWVUpFZDFvZG5lRGgvL21DUXdERU5ZN0xhZmVJVk5qYVBJQ1Q1?=
 =?utf-8?B?Y0Vvd053dGRVZ2tadnBMZmZCeVJhK01kNnFuUCtnbEFzTDVMSW9SVXZPWnps?=
 =?utf-8?B?em1KdUE3azZyK25CSHJPeTRCWU52RUJzeVIxQld1eDhLVHFpYm1WMmFnWkxR?=
 =?utf-8?B?ZlFBdXJVdGgxTU04OThXaWJwTXJiMWE4dFk2aDkzME1jVlRGc0ppWlVXOUQ2?=
 =?utf-8?B?cnVRYit6N1JyYjMrM0lhZTkvU3AyYUZoR2FSaGV0UGlmdW0wWURtakZzUnNm?=
 =?utf-8?B?dkc0YkF3UkFsYTc0UHFRckR3Y3NTc1h5SkVQd2liY0FWSDJYRE8vcVVxaVFJ?=
 =?utf-8?B?b3NGMjBWVlUvb0RsRGlYeW5Sdml2NmF5eS80MERwN3gwZWhoVWNVZ2loUXFJ?=
 =?utf-8?B?cWFRTE9JSWY5NVlSS3BUZ29FRTZLbTA3ZmVjamRha2hZVnpYdDFnN1dzUStk?=
 =?utf-8?B?dkJnVmMyWDVLN0ZpczVPT3AwdG41K3BPc2ppQjFFdWRQMFR6Q0I4NGtGQmxn?=
 =?utf-8?B?UHhpNU04NlVweDBXbWdRdnlrbVRuUThyL0xTbUV6UWI4ekxXUUtxWlFERFVM?=
 =?utf-8?B?OXh1TVpZS0tNUjk3cHhWbGs2ZTArYmRyV2V6RnZ1SjlBbklZcjZZaWRKMWpF?=
 =?utf-8?B?VEhxOTBYejlnM1lxVU0rWnhoT2NjVy8zRzlLN2prMWpJZ2dqSEMxZmhjZ05M?=
 =?utf-8?B?WUk5MUJWRlBqai9GQjRMSloxb1JVYStVUjF1aFVqVHRVSW8xb2kzYVVSdVo5?=
 =?utf-8?B?UHFsZ3pvV1ZjYVh0RUgvbjlQYnBJbnZ5ZXZyMUp2ZDgvOFRRT28rV1BLWEtk?=
 =?utf-8?B?d1VDSW40eXlDU2tPMW05OFV4TFhJYmorMmg1Z0hsR0NzRnVJcVVWL0p4TjZY?=
 =?utf-8?B?RFVTVHZITm9PM2JIVG42T1JwV0ZvRVVkbWVaTUhvakRiMm5adWMxcEYxbVZX?=
 =?utf-8?B?b25VejVLUWRJSXhOQlF6QXE4ZGM1Um9LTEgvdERLeWJSZHRiSzdTUWJmTUdk?=
 =?utf-8?B?VEZJeGoxcVlhWFViVEEvRjFCWWpYK25xRFR0WnMrRGRZUmZ6YmhxYUVTODVx?=
 =?utf-8?B?UHJCWXFMTmtDMXJYT1JjVVp1TDlyNXZ6UDE3RWdBOWZUZXplTWhBNnJ6ZUp0?=
 =?utf-8?B?c0Y3OW4yd1ovZzcySUJWUTdCdU5TY3BxNnpxcUM5TTJUR2ZoanpBcnFxNldw?=
 =?utf-8?B?dlJKQ0o3c2xKNktZVjNGRHpDT1RXRzlxNUZwejdZWncwOXZWenRaZmJ1SGFz?=
 =?utf-8?B?WjIvTms1TjNPNFFxWWJUMDdrUG8xL2tNeFFMQTJneVNuOWVRc0pmMGIwckJy?=
 =?utf-8?B?eWRBSWlPeGNEckZYeXVuTFdXOHpmV1pTc0dSYkZPZ3gyUlhuQTNLeGFLNmxs?=
 =?utf-8?Q?RIkA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 10:43:30.5701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2d999c-0edb-4fed-b80c-08de529097ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466

Hi,

On Mon Jan 12, 2026 at 8:47 PM CET, Andrew Cooper wrote:
> On 12/01/2026 6:47 pm, Alejandro Vallejo wrote:
>> On Mon Jan 12, 2026 at 6:15 PM CET, Andrew Cooper wrote:
>>> On 12/01/2026 3:02 pm, Alejandro Vallejo wrote:
>>>> diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/mic=
rocode/intel.c
>>>> index 281993e725..d9895018b4 100644
>>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>>> @@ -404,21 +404,23 @@ static bool __init can_load_microcode(void)
>>>>      return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
>>>>  }
>>>> =20
>>>> -static const char __initconst intel_cpio_path[] =3D
>>>> +static const char __initconst __maybe_unused intel_cpio_path[] =3D
>>>>      "kernel/x86/microcode/GenuineIntel.bin";
>>>> =20
>>>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_=
ops =3D {
>>>> -    .cpu_request_microcode            =3D cpu_request_microcode,
>>>>      .collect_cpu_info                 =3D collect_cpu_info,
>>>> +#ifdef CONFIG_MICROCODE_LOADING
>>>> +    .cpu_request_microcode            =3D cpu_request_microcode,
>>>>      .apply_microcode                  =3D apply_microcode,
>>>>      .compare                          =3D intel_compare,
>>>>      .cpio_path                        =3D intel_cpio_path,
>>>> +#endif /* CONFIG_MICROCODE_LOADING */
>>>>  };
>>>> =20
>>>>  void __init ucode_probe_intel(struct microcode_ops *ops)
>>>>  {
>>>>      *ops =3D intel_ucode_ops;
>>>> =20
>>>> -    if ( !can_load_microcode() )
>>>> +    if ( IS_ENABLED(CONFIG_MICROCODE_LOADING) && !can_load_microcode(=
) )
>>>>          ops->apply_microcode =3D NULL;
>>>>  }
>>> ! ||, surely?
>> When !CONFIG_MICROCODE_LOADING apply_microcode is already NULL. It's a n=
eedless
>> assignment. This is strictly so the compiler can avoid assigning anythin=
g.
>>
>> Functionally it's irrelevant.
>
> Oh, that's subtle.
>
> As can_load_microcode() is a local static function anyway, it might be
> better to have an early return false in there.
>
> That will get the same DCE, but be easier to follow.
>

Sure

>
>>
>>>
>>>> diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform=
_hypercall.c
>>>> index 79bb99e0b6..5e83965d21 100644
>>>> --- a/xen/arch/x86/platform_hypercall.c
>>>> +++ b/xen/arch/x86/platform_hypercall.c
>>>> @@ -307,6 +307,7 @@ ret_t do_platform_op(
>>>>          break;
>>>>      }
>>>> =20
>>>> +#ifdef CONFIG_MICROCODE_LOADING
>>>>      case XENPF_microcode_update:
>>>>      {
>>>>          XEN_GUEST_HANDLE(const_void) data;
>>>> @@ -327,6 +328,7 @@ ret_t do_platform_op(
>>>>                                   op->u.microcode2.flags);
>>>>          break;
>>>>      }
>>>> +#endif /* CONFIG_MICROCODE_LOADING */
>>> You mustn't #ifdef out a case like this, because it causes the op to
>>> fall into the default case, and some of the default chains go a long wa=
y
>>> and make unwise assumptions, like hitting a BUG().
>> It's normally more convenient for us (AMD) to physically remove code whe=
re
>> possible for coverage reasons, but in this case it probably doesn't matt=
er.
>>
>> That said, I think we can both agree if dom0 can crash the hypervisor re=
questing
>> a non existing op the bug is probably in such a BUG() statement and not
>> elsewhere. Note CONFIG_VIDEO already removes an op in this way in this v=
ery
>> file. The default case returns with ENOSYS, with BUG() being in helpers =
for
>> other data, as far as I can see.
>
> The existing bad practice are the ones I haven't had time to fix yet.
>
> As I recall, we did have a guest reachable BUG_ON() at one point caused
> by this pattern, hence the "never again" position.
>

Fine.

>
>>>> =20
>>>>      case XENPF_platform_quirk:
>>>>      {
>>>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>>>> index 92c97d641e..1e6c92e554 100644
>>>> --- a/xen/common/Makefile
>>>> +++ b/xen/common/Makefile
>>>> @@ -65,7 +65,8 @@ obj-y +=3D wait.o
>>>>  obj-bin-y +=3D warning.init.o
>>>>  obj-y +=3D xmalloc_tlsf.o
>>>> =20
>>>> -obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma=
 lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>>>> +obj-bin-$(CONFIG_MICROCODE_LOADING) +=3D earlycpio.init.o
>>>> +obj-bin-$(CONFIG_X86) +=3D $(foreach n,decompress bunzip2 unxz unlzma=
 lzo unlzo unlz4 unzstd,$(n).init.o)
>>>> =20
>>>>  obj-$(CONFIG_COMPAT) +=3D $(addprefix compat/,domain.o memory.o multi=
call.o xlat.o)
>>>> =20
>>> In a prereq patch, please move earlycpio out of common/ into xen/lib/.=
=C2=A0
>>> It shouldn't be tied to CONFIG_MICROCODE_LOADING like this, and it can
>>> simply be discarded at link time when it's librified and unreferenced.
>>>
>>> ~Andrew
>> That would preclude having it in the init section though, AIUI.
>
> There's already lib stuff placed in init.=C2=A0 It works fine.
>
> (What does get complicated is conditionally-init, conditionally-not, but
> that's complicated irrespective of lib/)

It handles __init fine, but not "lib-y +=3D foo.init.o", AFAICS. It may be =
3 lines
worth of fix, but seeing how earlycpio.c has a single function already tagg=
ed
with __init, I'll just drop the .init.o part and let the compiler place tha=
t
single function in the right section.

Cheers,
Alejandro

