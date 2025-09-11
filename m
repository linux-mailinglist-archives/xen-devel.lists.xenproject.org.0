Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD5B52F6B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:09:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119977.1465101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfBN-0001Zv-R1; Thu, 11 Sep 2025 11:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119977.1465101; Thu, 11 Sep 2025 11:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwfBN-0001Wm-Nb; Thu, 11 Sep 2025 11:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1119977;
 Thu, 11 Sep 2025 11:09:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwfBM-0001Wb-FH
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:09:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2009::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd237ba5-8eff-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:09:36 +0200 (CEST)
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:09:31 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:5:177:cafe::75) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 11:09:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Thu, 11 Sep 2025 11:09:31 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 04:09:29 -0700
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
X-Inumbo-ID: cd237ba5-8eff-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skbS0wOlC5IYLFmra5PlObBTRryHA/XmaNmK99+xqdMIL7lO22am6AURPERYWGOXZe2ZgmuWwpcEJ+YqXK4JWxpufgeMNfI66Y1QUG6J/EPTaqT9JPH5/MDwY/AbdDAZWUxxxp4JjskAakPNYEH0JqSLiH+j2ZYzQH/Junkm2kSQ1bhpAVvCWrOZKoMw+xguYQQwVp06zuAf3TXGvwF8yeD0YRoykFQduaC8W8S2eeZml9tO8OyZUVzbNEFNw0OXLQTEIYoDpO+mx/XZiJnfRHpgxKzrKQPjiQ+emZuxwoAllIuKgdyIu1PEe8Jb3qoNUoXre8gIip5e/xpSINJt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSiKUZrAcTKU40jPaohK4uN8CCQUbKaVe/0osqfKl1o=;
 b=lhXHSEDzBOdsiH3jjex+Q4sGwXj1qbZvIWfrYL5/D+bu1yzEF9g712oZZN+uQbp9aDwOcGUeufi8dHYxKhdzJZBoR5zZK4nX/nsalLptF27dwpNZEsTkQ5kcl7n9deCveilZ+7T/QLGrXbNcFyuECFzs2nIP9JOJlUQ9p+Iup615R+vmMw+hW3vYACyoi0ny8evLg9A3k8aObPelHLaWEi8+a1IvGGSe1DJXbiDaMqewlYpxh9qnR1G/SBIYrRp6h8i927SFfKq17lRF0XcFWXgaOO8eP33AmHRXqYu8YDxt9IDSzcq/hYP868VnNhTOwgOq8DYPuxpS5GngiPXy5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSiKUZrAcTKU40jPaohK4uN8CCQUbKaVe/0osqfKl1o=;
 b=k0irrSeMiP/rrf6UyeUUV3sO8L6bSfXPeDrkpy4uFYb6ZzWfe9RjYPHnNfJ2UgtBmPOXATwhvVngv8I1nNBPSgX0qRzAc4y8YRqt34Nr3lynkhlUj7fTyyCrQ+mxpf1i1415UHDM4CRs5zrSQBLpq+AxGhkdNhJISIjMExL7Xr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 13:09:28 +0200
Message-ID: <DCPXAHDC4FYX.3DH1XG3S916ME@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
X-Mailer: aerc 0.20.1
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
 <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
 <DCPA5G9EUXZZ.1739W35VKVBBP@amd.com> <DCPAR2NLL4VI.78XRJRDLA0ID@amd.com>
 <96b58fe4-668f-44be-9469-0ec7f4f28c6f@suse.com>
In-Reply-To: <96b58fe4-668f-44be-9469-0ec7f4f28c6f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 355cf80f-2534-46e7-1fdc-08ddf123aeb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cXg5SVRHbFBVdy9BRlYraXJKZjZCeDIrdHduUSt5SlloSEMrRXVuZEVhWWkv?=
 =?utf-8?B?T0RpOEZWMTR1TzFhN21GWWFqa0NJVHpVY1l2emt5TElhSjlKNkZmdjBDd3Jj?=
 =?utf-8?B?aHVoVDdWRmlKUHU1c0FoclUycTlPZlBzS2xsdDMrKzljN3NEWWNMbGsxTW82?=
 =?utf-8?B?N05tNzdRNzNqOVZjSm1pcmNWblIxSDNKSWI1clptZHVxaDhrcFB0T1A4T0lj?=
 =?utf-8?B?VUhxY09mckZ3QURZZmFzVUUzN1VMZ1FLbXViVm5vYTFSSnJ0WkhzVm1DYkJm?=
 =?utf-8?B?UXZvNWZkZEtyd1NkQnFjT05SK2owZnZKQU1QWWVOaURXdW1vWCtvYkVndDVP?=
 =?utf-8?B?T3MvSXhmM3dZQ3hRS1IvUXZmNnlibktlOUFYRFNGMEo1SU9QeTlxRVZod1Fz?=
 =?utf-8?B?N1hOOHFkcVdScXRUR3JqU1B2dU52UC9vancxK29rNFl5MUR6SUhCRFE4WWl2?=
 =?utf-8?B?TmFQRzFieW5MZVlDc08xL2RnM0paSGJvWEliOE1Mc2d6YXBoMGVMRVZ3Q1Bm?=
 =?utf-8?B?K1B6WE5EUnRaK3ZLcGlLOFRQYUdVZHBseGlDR3V0UkNOMEZWT1dyS2w3VjM3?=
 =?utf-8?B?ME1VU3hoYXRDVUc1bXBHZk5nNDhWajFHRWlQbGowTVRNNkd5UlpkQUpUTTRL?=
 =?utf-8?B?cDlZaVQ0cldDWnVLZklnV01FaU9CdStuaHFQKzZRaVR1b2pkMUZQalVkdWwv?=
 =?utf-8?B?bGd4ejBvUCt6eXp6dS84L0R4bWpxOWRzZ2twaFJzS0N0U1crU0FuWUVRcWNQ?=
 =?utf-8?B?Rk1SMlE1WERCY3JtNW0zYjRvOTFBTUxOSktjV1RXMzBJbzNCNjdkV3doc1Uv?=
 =?utf-8?B?WXExaDdiZzU0d2Y0MUNHUG9zd0ZiWFgrVmdPd1Z2L05uYlUyRWpkSVBPK1hv?=
 =?utf-8?B?NmJJclQzM2NOVitibjY1U2hYTm5WVEkyYU9VVGU0RW9SWEJPRkl6alhZRDhq?=
 =?utf-8?B?eHUvamd6ekdnaW55cnhGYnZiZWRPZXlrSTd4bGlJVkxReFE5bzVLTU5ZZmlr?=
 =?utf-8?B?cjhiYmlQR2pLZEh4QXBEUVl1NkE3Uzl5d1NPdEp5MHFTb0hsTWgxL2o3ZFNN?=
 =?utf-8?B?RXNGZWRKbGlGcmhrSCtmWGZkN2I0Tjl3T2o0VnFvSHh2VkNIaWV1MnB4Skht?=
 =?utf-8?B?S1htdzRHYnlDN3dRLzdGNEhObWtRb0ZvemtBNlFBNkpxZFNyZFlZeTNOTEcr?=
 =?utf-8?B?ak9Za2ZWVUFERjZ6L29pcHI2MFRzdzFMNUUwQlFsR0dyTWlCOEFuMnV2OExw?=
 =?utf-8?B?RnJuSDlHdE9PNE5DRk5FS053Q0p6U1RZNzNOV0tHcXZYaWg0VUpkV3pqbnR4?=
 =?utf-8?B?S3lucUZXVGdjQTNZcCtmdkFWSUsza056akZDYXpHNmxOdFA4R0ROVElVSi9s?=
 =?utf-8?B?UzE5Qlg1ZkE2T2g0U2hYQ01BZTQrWm95WWtjeFMrRG51TG44SDA2eGY1cGNa?=
 =?utf-8?B?THBmT2JtS0JnbFc2UlR1YjQ3eGVFV25pOVZHdE9PTjRydXE2dTNERCs4RG5O?=
 =?utf-8?B?UUxEZmFIdmV6Y3lRRjhaOGtFbS9naXhqRFR1NmtPRDMwY29HeU12WTJncytK?=
 =?utf-8?B?aS9JT3VHb2F1M2JwRHVwZ2VETXdodVgyanMxMmZySTlFWFFIa2NmZm05TVFX?=
 =?utf-8?B?WVNrR3lMZkdvVkF4bFBpdU9ySUhpbFI2VEVscEx5UlJ5R2pKSyt4ZFVYRDNJ?=
 =?utf-8?B?THNQUkNhb05qSCtROUNENXd3MlpHRC9Lc1BxWmZXRVJPMlR2TjZDK1JsTUMr?=
 =?utf-8?B?cG1JTXR6RFYySGp0WUNlbU0yQnRJUTdpSXdRd0pDMGVaMG4ydmxaNE9ubUlC?=
 =?utf-8?B?M2hyMmpsWUNXUnJSVlRSRTc0ekVubkE1UWR6Vm4yZzhxOHhoNTR1S0lyYWtk?=
 =?utf-8?B?QlhYa21tSmdKUExqT1Q5VGNVN3hJUnRQR095V1hWcm5GSjdRTjZzaXpJZklW?=
 =?utf-8?B?c3J6UUdTeUI1ZWRLbEFhcjNBQWo4bkt2T2U5eUJuOEY1WUZhbW1XT0xzbHZX?=
 =?utf-8?B?TzdPUjBHbFBqT0FUek1yalAwU2EyN3V5R0JISFdqL2FYZ1o5MjR2OVN2OXdk?=
 =?utf-8?Q?Fdb7tL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:09:31.2664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355cf80f-2534-46e7-1fdc-08ddf123aeb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

On Thu Sep 11, 2025 at 9:44 AM CEST, Jan Beulich wrote:
> On 10.09.2025 19:29, Alejandro Vallejo wrote:
>> On Wed Sep 10, 2025 at 7:01 PM CEST, Alejandro Vallejo wrote:
>>> On Wed Sep 10, 2025 at 5:31 PM CEST, Jan Beulich wrote:
>>>> On 10.09.2025 17:16, Alejandro Vallejo wrote:
>>>>> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>>>>>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>>>>>> CPU hotplug relies on the guest having access to the legacy online =
CPU
>>>>>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM,=
 so
>>>>>>> this causes the MADT to get corrupted due to spurious modifications=
 of
>>>>>>> the "online" flag in MADT entries and the table checksum during the
>>>>>>> initial acpica passes.
>>>>>>
>>>>>> I don't understand this MADT corruption aspect, which - aiui - is wh=
y
>>>>>> there's a Fixes: tag here. The code change itself looks plausible.
>>>>>
>>>>> When there's no DM to provide a real and honest online CPU bitmap on =
PIO 0xAF00
>>>>> then we get all 1s (because there's no IOREQ server). Which confuses =
the GPE
>>>>> handler.
>>>>>
>>>>> Somehow, the GPE handler is being triggered. Whether this is due to a=
 real SCI
>>>>> or just it being spuriously executed as part of the initial acpica pa=
ss, I don't
>>>>> know.
>>>>>
>>>>> Both statements combined means the checksum and online flags in the M=
ADT get
>>>>> changed after initial parsing making it appear as-if all 128 CPUs wer=
e plugged.
>>>>
>>>> I can follow this part (the online flags one, that is).
>>>>
>>>>> This patch makes the checksums be correct after acpica init.
>>>>
>>>> I'm still in trouble with this one. If MADT is modified in the process=
, there's
>>>> only one of two possible options:
>>>> 1) It's expected for the checksum to no longer be correct.
>>>> 2) The checksum is being fixed up in the process.
>>>> That's independent of being HVM or PVH and independent of guest boot o=
r later.
>>>> (Of course there's a sub-variant of 2, where the adjusting of the chec=
ksum
>>>> would be broken, but that wouldn't be covered by your change.)
>>>
>>> I see what you mean now. The checksum correction code LOOKS correct. Bu=
t I
>>> wonder about the table length... We report a table as big as it needs t=
o be,
>>> but the checksum update is done irrespective of FLG being inside the va=
lid range
>>> of the MADT. If a guest with 2 vCPUs (in max_vcpus) sees vCPU127 being =
signalled
>>> that'd trigger the (unseen) online flag to be enabled and the checksum =
adjusted,
>>> except the checksum must not being adjusted.
>>>
>>> I could add even more AML to cover that, but that'd be QEMU misbehaving=
 (or
>>> being absent). This patch covers the latter case, but it might be good =
to
>>> change the commit message to reflect the real problem.
>>=20
>> It doesn't quite add up in the mismatch though. There might be something=
 else
>> lurking in there.
>>=20
>> Regardless, I don't want this junk in PVH. Would a commit reword suffice=
 to have
>> it acked?
>
> I think so, yes.
>
> Jan

The problem is present in HVM too, I think. It just clicked to me that if A=
ML
overflows the MADT it WILL corrupt whatever is after it, and how many times=
 (and
in what direction) the checksum changes is undefined because the memory aft=
er the
MADT is undefined. I somehow thought we allocated a full 128-CPU MADT, but =
that
doesn't seem to be the case (rightfully so).

So this is a general ACPI memory corruption bug. The saving grace is that t=
ables
are already parsed by the time execute AML, and the corruption doesn't seem=
 to
reach the DSDT.

Modifying the DSDT to avoid the overflow seems unavoidable. That should fix=
 the
root cause.

I still want to remove it all on PVH, but HVM should be fixed too.

Cheers,
Alejandro

