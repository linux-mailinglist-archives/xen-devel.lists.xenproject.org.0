Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB396B51EF0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 19:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118662.1464353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwOdn-0006r0-3k; Wed, 10 Sep 2025 17:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118662.1464353; Wed, 10 Sep 2025 17:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwOdm-0006nq-Vd; Wed, 10 Sep 2025 17:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1118662;
 Wed, 10 Sep 2025 17:29:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ly7=3V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwOdk-0006nc-Qi
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 17:29:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:200a::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c13ee6ca-8e6b-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 19:29:50 +0200 (CEST)
Received: from MN2PR17CA0021.namprd17.prod.outlook.com (2603:10b6:208:15e::34)
 by PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 17:29:46 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::a4) by MN2PR17CA0021.outlook.office365.com
 (2603:10b6:208:15e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Wed,
 10 Sep 2025 17:29:45 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 17:29:45 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 10:29:44 -0700
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
X-Inumbo-ID: c13ee6ca-8e6b-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4jzC+STGa0F6fdRtKB0+wEZxkU5DY8RXHSjqGye1whQhG6ckM4xI/SDE6+Ej6rFrD33gduy4gMinngl+k8syBD4/DgGByBPhT9NbP9BQR01OQEVmFmxnL2hoLovXWIPT5WMqI5I4hgG+xtK9Cx/VfxWI+UGhQYWmWgX2h70A2rctRHcjurkfv5EyqsngtI1q8iCJWi4W6SaQd7tGb+ZdarBYSShBq0yhzECor7tfD1sUjBlRS4fvVQSgvIQz6htsT36PkngSqwCRSHczOLImVpoq107FOx2d80BI2J7dtMC2Zpvqwzriwim7a1XazjdjQBckYKgRKGlYJM/yJMeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Eg5T/iQcS2XH8Uv+ZB99onyrXxOKCdOx9AyoMMLx7Q=;
 b=bWUrLn3Zbp3lt1BNUx9OyYoAafHbTD4UrSlv9VQuRc3XpAMWqwwZhv1xHp6X+QPmE7pNmJpvlODPBtOspshzptgPpKBZQbr38D43vnGwdluBWmkr1Jk1sV0Dubp+NGkycehFtymYBw4r7Yb5xEFWS/GrLAfckBRzqs/sbvsqptitFEmUAxlzlbZCwe1nawRjmtHFDP+4oboYRDfRvNFNsQKaYUK39mGdRAU3cA9ryUu7h2rUmllJ4aXm7jDEkuzfBWmFraXV8NIKvxkN5gX1TZqJyN6XjM/WGHsmgU1Yzipc9h4UiHtWUQIuPY73OCb0U3Khv7sB14cc+kfk/bErUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Eg5T/iQcS2XH8Uv+ZB99onyrXxOKCdOx9AyoMMLx7Q=;
 b=E/95nCaSVSl5AO2+fT+Ejm0jrf/0Me4NejIko1FjZBMWU4LcrEAHMv+NQ3ianZA7/Q0j8pdHaZoKiEHtsXuCf/hcnheWxAOImKgidwn8EvffD7lWom5GQXjy/EBM3PzwDysDArFJmpmhJ6ok1lRh0NN/UUhY9DBUTeQd1Wrgj20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Sep 2025 19:29:42 +0200
Message-ID: <DCPAR2NLL4VI.78XRJRDLA0ID@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
 <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
 <DCPA5G9EUXZZ.1739W35VKVBBP@amd.com>
In-Reply-To: <DCPA5G9EUXZZ.1739W35VKVBBP@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|PH0PR12MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: c470c5e9-0b59-4933-bfb4-08ddf08fa2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXF5RXZlOHBTOXptdEVEaVZ4QnhxMVJ2eFQ3Z0E4V1lIZldsMFRMMlVYejhs?=
 =?utf-8?B?N01JalFOTy9XVUdMVm0yQW40eithUmJyT1hWaTllYXpic0FpWkJ1SzBFNWgy?=
 =?utf-8?B?M20rYUJSTWg2clRIWFB5bjFRb2RZWmtHV2d5SzYwYkcxcEpLL3VZejJCVVNi?=
 =?utf-8?B?TFBxK3VSZTc1VWRxL21adXZydmYrSE5aeC9uV1RZTXMwVVRrQjBveVlJWktl?=
 =?utf-8?B?MTByZmo5QmFlNlNiRGlxZmFxTSswYkowR1JjM0pVUHJKUGNDMW91eW1PaXlS?=
 =?utf-8?B?VVR4SFRKMGJuNlVuaFhYd1ZnU1FMQkVoUTNsYWxnaGN2T1JoZnhjOGh4d2lI?=
 =?utf-8?B?WWozNFR1MnlLeEVHMDdORHM0ZnBobGtkcVFMR1RRUjgwREFZZ211cHU3SXdT?=
 =?utf-8?B?MVk4OXJWaXlSUWVzVXdKTzhWUWNJSjFNYXozMnV0RTJFQjFuLzBodGNUWWRS?=
 =?utf-8?B?S2pZSW1HS1ZHWVVCZ0t3R2J3TVVYUlhUd3V0M2FoM2VWQVc1QWg4TWJqTWRY?=
 =?utf-8?B?ZERNZnlpRms0Y3JkVmF5STZzSitEMkpKKzRESDgxRndwcHcvd3piRDVqeW84?=
 =?utf-8?B?ZklKY1JnMGtZazZiTWJ4dlRVbGloekw2SlE5L2o0RnJXOG84NWNXU3dhNEVV?=
 =?utf-8?B?SnE4NllJUzlXdGMxSStGcUJ5L1F6YTc5aGFLMlBabzdTNDdmaG5tQklZRmJH?=
 =?utf-8?B?cVdadzJVYjRTUWRySllCUVE2QzU4TjBSZDdscEFrMTJiSGNhL3VSckFVMkNZ?=
 =?utf-8?B?NG5Vd3M0QmNkVEhDeUx4UFppSFU5UkVpWU4wcE55TUNmY0s3eDdRZXJqRlpj?=
 =?utf-8?B?Wml0Y0Y4OWRpcU51SGUxL0lwSDNaWjQvZWo2MzVoWHh6dEFOL1BuTW5mUG8x?=
 =?utf-8?B?NzM4WEx2bDdaQWRmU01JaWxTalpnTEEvQjJGNkl6UUN5NXp1QURXWGlac00x?=
 =?utf-8?B?djZRdis3YTdwNlJvWlZoTlZZb00zNU4wdzFtZjBiY2dvZ0hIMjUrczUrQllN?=
 =?utf-8?B?d2l3RXpFNHVyclYwQWpiRFpMZTNSeGZSZjVvTFBxT3VUclNVc0RQK3FUeTNB?=
 =?utf-8?B?TURDZzVkby80SzZ3dFpXQ3RHUWRrRU80SjdJbGVUV0RQUHFROXp0Ni9CR3pI?=
 =?utf-8?B?SCs0NW5iS0JvWHZDNlh5Y1plNUVkSEFuTTNWdGpHSVIwMEZUbFBQZjFDWEtZ?=
 =?utf-8?B?NjNaYjBkbzJmVVZJcWVqZ0xvR0l3UEtFeVNxejNNSFZIM0dHOFQzZm8xNnBV?=
 =?utf-8?B?ZGlueWtYd0pES0N6RWFaSFhjMVF1ZTFHa2lOSk92Rm5HaFNHK0M5dmVzWXdQ?=
 =?utf-8?B?Wm1RR3pFQ0N5V0U2OE9zUk5BZGxLdzF3TDdpaFd6UDc2OFJ0SEhTK21IRnFt?=
 =?utf-8?B?ZG43SUVoVFlaWnMyallBR2RWbVpRcFU4SEVSZnNsWFkxbDBXR1Y5QTFTMEVx?=
 =?utf-8?B?RDJGY2s4RkdoMnZPSG40SitTc1JhbGhrTGZ6b3M1d2RJLy93bDVvOWVxSjEv?=
 =?utf-8?B?U3lMdzduMnBoaGMrNTh1eXZETkdNZFpMK2JYK0RNcXFkaVNabVZvMHZ5WFR3?=
 =?utf-8?B?RGdmTDVub3YyMitETXhxKzFpQUpHNXZGdXNHemw4VCtZRXhBZVVNNzBLUlhl?=
 =?utf-8?B?Tm9yVHJiZllyY28wRmhXdFMzcWxrT0h5ZVhBcXEySHAycEVPUjEwQ0lDVG56?=
 =?utf-8?B?aFRnclQ2SkllVHBjQnBhbi9Fd1VHMU1scXBkWFhGVjNGMFJrVHkrYUtVLzF0?=
 =?utf-8?B?ZjM1ak5PU2lpdDhaM01VRGwvVzhmMlllNEl4OGxYdyt0SnVkTUNqOXg5c3JO?=
 =?utf-8?B?NEFHd01uYktkRVoyZTlVdXk5TUVmNFNPK3U0Nlh6Z1RtWVRIM0dBVkVZRUh4?=
 =?utf-8?B?RnpUTk1xRnNGYjAxaXRVK3ZJdzZGUWV5eFh5b0VTeGNML3Q0WU1hcDdhRlVT?=
 =?utf-8?B?Qjl6S2krRFF4dzdUdW1oWWpyeXVuUUo4aDEybmQxdzQyeloxVzdCNkdvajBq?=
 =?utf-8?B?OTdjcDBKd3ZNNVowN2c3dnVWam12dmNEWXNvMThCOGw2SXlhenFBZ24zNk9L?=
 =?utf-8?Q?cWsasD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 17:29:45.6632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c470c5e9-0b59-4933-bfb4-08ddf08fa2b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813

On Wed Sep 10, 2025 at 7:01 PM CEST, Alejandro Vallejo wrote:
> On Wed Sep 10, 2025 at 5:31 PM CEST, Jan Beulich wrote:
>> On 10.09.2025 17:16, Alejandro Vallejo wrote:
>>> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>>>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>>>> CPU hotplug relies on the guest having access to the legacy online CP=
U
>>>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, s=
o
>>>>> this causes the MADT to get corrupted due to spurious modifications o=
f
>>>>> the "online" flag in MADT entries and the table checksum during the
>>>>> initial acpica passes.
>>>>
>>>> I don't understand this MADT corruption aspect, which - aiui - is why
>>>> there's a Fixes: tag here. The code change itself looks plausible.
>>>=20
>>> When there's no DM to provide a real and honest online CPU bitmap on PI=
O 0xAF00
>>> then we get all 1s (because there's no IOREQ server). Which confuses th=
e GPE
>>> handler.
>>>=20
>>> Somehow, the GPE handler is being triggered. Whether this is due to a r=
eal SCI
>>> or just it being spuriously executed as part of the initial acpica pass=
, I don't
>>> know.
>>>=20
>>> Both statements combined means the checksum and online flags in the MAD=
T get
>>> changed after initial parsing making it appear as-if all 128 CPUs were =
plugged.
>>
>> I can follow this part (the online flags one, that is).
>>
>>> This patch makes the checksums be correct after acpica init.
>>
>> I'm still in trouble with this one. If MADT is modified in the process, =
there's
>> only one of two possible options:
>> 1) It's expected for the checksum to no longer be correct.
>> 2) The checksum is being fixed up in the process.
>> That's independent of being HVM or PVH and independent of guest boot or =
later.
>> (Of course there's a sub-variant of 2, where the adjusting of the checks=
um
>> would be broken, but that wouldn't be covered by your change.)
>>
>> Jan
>
> I see what you mean now. The checksum correction code LOOKS correct. But =
I
> wonder about the table length... We report a table as big as it needs to =
be,
> but the checksum update is done irrespective of FLG being inside the vali=
d range
> of the MADT. If a guest with 2 vCPUs (in max_vcpus) sees vCPU127 being si=
gnalled
> that'd trigger the (unseen) online flag to be enabled and the checksum ad=
justed,
> except the checksum must not being adjusted.
>
> I could add even more AML to cover that, but that'd be QEMU misbehaving (=
or
> being absent). This patch covers the latter case, but it might be good to
> change the commit message to reflect the real problem.
>
> Cheers,
> Alejandro

It doesn't quite add up in the mismatch though. There might be something el=
se
lurking in there.

Regardless, I don't want this junk in PVH. Would a commit reword suffice to=
 have
it acked?

Cheers,
Alejandro

