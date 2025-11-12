Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215E3C52B58
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 15:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159972.1488223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBpG-0002r7-SQ; Wed, 12 Nov 2025 14:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159972.1488223; Wed, 12 Nov 2025 14:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJBpG-0002pf-Oi; Wed, 12 Nov 2025 14:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1159972;
 Wed, 12 Nov 2025 14:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJBpF-0002pU-5o
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 14:27:57 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5bd1dab-bfd3-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 15:27:53 +0100 (CET)
Received: from SN7PR04CA0208.namprd04.prod.outlook.com (2603:10b6:806:126::33)
 by SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 14:27:48 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::2) by SN7PR04CA0208.outlook.office365.com
 (2603:10b6:806:126::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 14:27:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 14:27:48 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 06:27:46 -0800
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
X-Inumbo-ID: c5bd1dab-bfd3-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtQ5wVd9yZEiSZheeyJ5pKbr1U2RujyAFRCT5LaoQcJqOzaxWqdJCZ+iqrmOFWowS3rrgwOjvHPD9aanikyU/urKjE9lLLQSpV7a0CaHN85hYXl361iO79iwi6xGXEcUMU6fPIKk6dkFvidAktubFsZJ13PBXxffx/7z9YUfTafmgr2BLyRYxJWhQTEo/3xxqW/2fW3o/S6zA8zVhlKpQHbC7LzsC2dYuek0UrFjJruSV3Eh1vXBo+vE9du4NHGy9uVkNmmIM3mtH52DR8xNyPwuBbR/0Hsay6rbVLoizTUn6q5BlkHjriuNLavshYRr2kPZBsVnVFBBrokE/Y2Iaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGuOmNpP5yyZ1l/CrpgcvPM7sz1OuSZiU/VII2toOT4=;
 b=mTJYomaYpxU9Pw4x93QhH4Iozy09TwmWmoXhiO6HvHzoCd/V+kC99tCRX+tGAhOLXWwZfcGdOci6YswQZRUpcrfEhEg2MaGP0Myq2L7cOPwKE9P+8Bzj9l6HAPYNIg2NLirUDHhQvmEErl/qgbHtwa5975wCz9X/A9qWDJlU/8Y6ZHbF5Nw9HTB0P0C/XKbF48FSGdKEkXdoLE4Z0C8gLg5Cf5FDpQneE7l9XDbFgE/NCWVedoeGyHDfcWW3j9h+iz6CH2S/Qg8cHYZgyt2RdLBJUQrFSCkhuo0Y+MBwnqrR19swxdjCUCc1/6Oq9mgv3+ffOchBk3LFo79XXKmkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGuOmNpP5yyZ1l/CrpgcvPM7sz1OuSZiU/VII2toOT4=;
 b=SYaLcMTNHkdW9MgBuq7lAxSk4QgWKdPEq2EA0UWaqh/v25ku+SOEWNqJuKb1zBU3WdmC+Kc9EAWg5R/wR4u1TX+OCyXqEhRe6TjoEM/IHirLZWK/JeDnlF2C/uJ4LdI8uikL3oodOyfosbYhcuf1O2+t6ymOjalktt0ak1dVbFk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 Nov 2025 15:27:45 +0100
Message-ID: <DE6SC2RG21IK.20ONZLHO187R5@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
X-Mailer: aerc 0.20.1
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
 <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
 <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
 <0a5af540-214d-46cc-93e5-f0266bb79064@epam.com>
 <b829a9dc-ed1d-45f9-a56f-ec288e0d5523@suse.com>
In-Reply-To: <b829a9dc-ed1d-45f9-a56f-ec288e0d5523@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb78638-0daa-426b-226e-08de21f7a77e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGh3eitkZEVlb2NZUnlNTGRQSTZVK1ZtQXlQRGVSRGZDMGMySWxYMTQ2ZEx6?=
 =?utf-8?B?M0h1RDQ4OXJ1RVJQODNUKzFUL3I5L1RPUmpIVm1Eb2JSRnhEbmE0bTltOHNp?=
 =?utf-8?B?SVZVcG92K3Jsc2kwdWNBcjJwb0dUQXh0dEgxaEJDbFZmaHdmQitLY2JxRDkz?=
 =?utf-8?B?b0tIYi9ZN1NNNHVMWlJSTWFKdlZHR3gxOXd0eDhkbGx2TG9PMGI4cDNOMHhP?=
 =?utf-8?B?N0FjUUtJNmV0ZkZTM0NlVVV6bTduNUxONEo0dFdtT2lqYVBKY2lYSGgxQ0FF?=
 =?utf-8?B?bUY2MHVOWnBLbm5qbFk3M2ltcEl1WXRnbDl3U2xDTjFrT1YxMWdQbW9ZbnJ1?=
 =?utf-8?B?cWlabnBuOXZRS0ZYR0ZzV3ZrOFV6Vlo5RElaQWJncnFJTVhNLzhZYnp0NmlX?=
 =?utf-8?B?L2tHSE5OY2NORzFUSGJBWHNGdlRoWXRoeU9udGQ5K3JxS1ZwdjhrMWVXUWY5?=
 =?utf-8?B?M25TRW0wWVNDclcrQ21OZytOYW5Sbk5oSmtTMmtld25wU21sUmVkSkhpV3JT?=
 =?utf-8?B?bXZEMXcxTkZPeTB1US9xZy81R1lZdXRkbC82QVRqOFlxQjBUaHNpWERvSVhs?=
 =?utf-8?B?ZGpydlFraWJRMmRPSElZNkkwQ0t1NkViY09jeXM1RW10eWY5aUV6eFhnNWF0?=
 =?utf-8?B?TVplR1dIdGVkeWVMdGorcmZkR2VnTWpJTDVpZjh6Mi9KKzdIa2pGTTc5ZVhF?=
 =?utf-8?B?NEpUK1ppclE4RWp1M0x1NGE2aFhOUGxLWWh6V1Z2RTBpbXAyV01CMWd2VjI0?=
 =?utf-8?B?b1R0alh3LzBaV0c2R0lUQmg2Y0NueXRxZ1Q0T1BTTnF1QW1VLzFWZTZHY3h6?=
 =?utf-8?B?N0dzazlZUjRwS2NvbjBJV0NhTTM5aDJ0bWsxbDRVL1dQbHRhSlB4TFRib0ow?=
 =?utf-8?B?aVhTVjFtOWlNK3NlZFlXTTZXWnJwanVTRDBpZ0U0a3IzclR1dzRPandKd1Nj?=
 =?utf-8?B?N3JkcVFTdC85M05zbzN6SVlpclJ0RXZYZCtHeWxnTXhHZHc2Y3oxQXl5NDkv?=
 =?utf-8?B?cGp6eFlHaG5vN1pEc1NCaHU1d2FIcHU0SVNJRitQaTNtTzl1T1Jjd2FiMEhQ?=
 =?utf-8?B?ekRrTE9Sd0VvZHBCYWFVc21PN0ZSWWpnSVVJa1lxT2RldzlRc1pTSktnc1ha?=
 =?utf-8?B?dEJoZ0p6aHJheEZSakM4K2dLUFViL2xrN0o3cmRoZmJ3eUJqSjgweXVDTnpB?=
 =?utf-8?B?NTYyNmRKLzhoQ0xrWFk0a0NyVHZzOXZVQm1YSTRRVE95SnlrN25OWUQzUWkr?=
 =?utf-8?B?YXNMbmNPc3pvc2hkS2tuOVZiK1A4YnVuM1NYM2VOYjNOVUpiT0EwYW1OZDJv?=
 =?utf-8?B?TWgyeGFBaWhkSmpaYU9ZR3N0WDFsanpMeXE5amxRYWlya29KSEh0bmRPMGlY?=
 =?utf-8?B?T3lLR2NjVUhGbjBhMWplUzVnTzZkdTR1T0xQR0NqR0xMUW04bUE0c0wvZTJr?=
 =?utf-8?B?c2tDQUtYeWxoVFpvM0dZeW4yRGFhVHFMWVRCWUJ5VVQvc016Mkt4ZWtNOGZu?=
 =?utf-8?B?R01ocFVab25ZZ2lKbjBrWmZoSEF4aGM0NHVob2ZQZm5yZ2V6aFZBMGtYZ2tv?=
 =?utf-8?B?MTVYTTNaUlc2ODhjaVlNLzZUc200ZldUR3BScUh1UTlNQXozd2dvSHdsSC9s?=
 =?utf-8?B?U2dlR1hLS2ZXd2hWNm5DbWNjUEdFR3ZCbXVKNFRTUmxGQTAvSzhmdVFTUkhr?=
 =?utf-8?B?Y1dmWE9QdFBOQXBlTVZQUWhiR3JrdEFCeXNWc2t5SFZublNLVHo0NVY3RXpB?=
 =?utf-8?B?OVVKNzJSV3g2Z05LNnNhRE1DNVVhaTQ5V1lJV3cwN1RDd083Q3k0em1ETDBH?=
 =?utf-8?B?UjcrVitGZlpPNzNsNzFvZlY3eUtrc09JYU5UdW9PVUpCQVVmbndBS3AwTjRC?=
 =?utf-8?B?NVc5Z1NlM3pMT1hlVFdYUmRYM05EVWxYMjZlSnVVMEM2V3ZhSm1nNnpyWno4?=
 =?utf-8?B?ZFZoVUYvSUdRVmpqVnBKTWd1U3pxR2xwVXBBbVNDQWk4WUliT1BTTDZaZHAv?=
 =?utf-8?B?UEorVXZiZjlLdGZPTVpGUkVNanFmZ0FON0RHdUcza2E2eFRVUU9jTjNzQUJQ?=
 =?utf-8?B?Z2NiYjNYOEhNL2xsOWIzNlhFTzIvUHpFbHZrM212Q3pnWVE3Y1NMQStqQ1dW?=
 =?utf-8?Q?cGTs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:27:48.3141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb78638-0daa-426b-226e-08de21f7a77e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202

On Wed Nov 12, 2025 at 7:40 AM CET, Jan Beulich wrote:
> On 11.11.2025 19:25, Grygorii Strashko wrote:
>> On 06.11.25 15:47, Jan Beulich wrote:
>>> On 06.11.2025 14:42, Grygorii Strashko wrote:
>>>> On 06.11.25 13:35, Jan Beulich wrote:
>>>>> On 31.10.2025 17:17, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uin=
t32_t index, uint64_t value)
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case HVM_PARAM_VIRIDIAN:
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (value & ~HVMPV_fea=
ture_mask) ||
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 !(value & HVMPV_base_freq) )
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !IS_ENABLED(CONFIG_=
VIRIDIAN) && value )
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
rc =3D -ENODEV;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( (value & ~HVMP=
V_feature_mask) || !(value & HVMPV_base_freq) )
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 rc =3D -EINVAL;
>>>>>
>>>>> I find the check for value to be (non-)zero a little dubious here: If=
 any caller
>>>>> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be m=
ore suitable
>>>>> in that case as well. Things would be different if 0 was a valid valu=
e to pass in.
>>>>
>>>> The idea was to distinguish between "Feature enabled, Invalid paramete=
r" and "Feature disabled".
>>> "
>>> But you don't, or else the addition would need to live after the -EINVA=
L checks.
>>> I also question the utility of knowing "parameter was invalid" when the=
 feature
>>> isn't available anyway.
>>=20
>> My understanding here - I need to drop non-zero "value" check.
>> will be:
>>=20
>> =C2=A0=C2=A0=C2=A0 case HVM_PARAM_VIRIDIAN:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !IS_ENABLED(CONFIG_VIRID=
IAN) )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D -ENODEV;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if ( (value & ~HVMPV_fea=
ture_mask) || !(value & HVMPV_base_freq) )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =
=3D -EINVAL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>
> Yes, or alternatively
>
>     case HVM_PARAM_VIRIDIAN:
>         if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) =
)
>             rc =3D -EINVAL;
>         else if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>             rc =3D -ENODEV;
>         break;
>
> Both have their up- and down-sides.
>
> Jan

We should aim for Grygorii's form, imo. If anything because it eliminates
the second else-if on !VIRIDIAN, leading to a marginal binary size reductio=
n.

There's no value in validation when viridian support just isn't there.

Cheers,
Alejandro


