Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC0B53748
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120429.1465373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwj2S-0003iN-35; Thu, 11 Sep 2025 15:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120429.1465373; Thu, 11 Sep 2025 15:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwj2R-0003fJ-Vz; Thu, 11 Sep 2025 15:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1120429;
 Thu, 11 Sep 2025 15:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QF+R=3W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwj2Q-0003fD-8u
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:16:42 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [2a01:111:f403:2413::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe38335-8f22-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 17:16:40 +0200 (CEST)
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 15:16:35 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7f) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Thu,
 11 Sep 2025 15:16:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.0 via Frontend Transport; Thu, 11 Sep 2025 15:16:34 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Sep
 2025 08:16:25 -0700
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
X-Inumbo-ID: 4fe38335-8f22-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDy52fDZFwBcin+hvN1bWOq31Tj8L3Y/q4odbDhub/Rz+9cansWh6QkwvJQ8S033CHBI9Y7Br3jqJZ8pXR/2gRfL5AxYJqLnJHBNWcGbTJk3QpQaLnaXUeqE2uvWOI5EoOlsHsP0BAlsAwvfnAdHT99VSkAucy3dnBBLP0a/meKswO9O49RedrNWYJsMjh8ROFJqQBkPCzc8tsyhhzR8RsK+9UGAfxe2gCsJN5EPTlRM0EOZXM4wFJu/3NL2yJ5xl2/WJTzh0werl4Bjv9iWPT+ia4IGnIPIPl0gJozROA8jMYEFUYH7ae7HWUdZnSsj32iKolTHzN/QsXH5yF5ySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtZeKBnVGG3y7WD0wOdYIDiDdz8Dd88mQrLv83KFryQ=;
 b=XeLjQdSyC/S77kKIvcZANjD9QjOR3Uy9gztNICm7LbxTWPsKZqUJP8E5pz9Qw7D96gBnMuiYjkd73mOCJbh9+Zq63J6dy7XUA75cxAor756dFFITOyOocoA1M7JcgtSGi9/PjGLk+17Cv7emjoCz3A+0c+/lHemsFVtioTkIXcixVYow22AY/Ms5zT/4L4TB7NQ6aaZvdJPZ4d+ZU3iQtEP3illz8BJIjXFxMoC6MOEmrYvhHiVD96R2+o4sjVHDTiVev22rwP8XWCG1P/4PP7xLVQILq2sKnLl3LeE/YgjR0RSeeMK8PGf5kjG4ZKkI8s1ekv94VbLZMP2Tut5Otg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtZeKBnVGG3y7WD0wOdYIDiDdz8Dd88mQrLv83KFryQ=;
 b=kDAQWR2Sk1PeJnUrCaGPG8JmW7Q3a4K57FbPcNtUGctIZxZ0ZrtNNL4hvvwjtTJcIy9AS7Kc6h88P/bu8ktYa5M/qQvgq6R0d7Elc4t1JWdTOJWtxiXF5/gVyDF7hZKdCndeXXywj8QygRdZ7x7h0QVm/KRc4mGrA2AOJ8kTK+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Sep 2025 17:16:23 +0200
Message-ID: <DCQ2JJMEV44G.3XPYX0Q2RLID@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] libacpi: Prevent CPU hotplug AML from corrupting
 memory
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: aerc 0.20.1
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-2-alejandro.garciavallejo@amd.com>
 <42bf6ed7-3a6b-4021-9a53-1891117ff2ba@citrix.com>
 <b77e3087-8f58-48fb-8370-0d71ed47811c@suse.com>
In-Reply-To: <b77e3087-8f58-48fb-8370-0d71ed47811c@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: e379a1c0-8abc-4bdf-1e17-08ddf14631e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkY0RWQzYzN3Zm9ZbWtpU0pTQ3RDdGYwaEQ2SFZycWw5Y3l1b1NXbWxLMEJv?=
 =?utf-8?B?TnBXQXo5Tmw2ZVBrVytNTHJNMktHbjVOM0hSVGRUbTJKVHBFS2Q2QVloVmNX?=
 =?utf-8?B?NlRISEdlY1lpT0c4S0ZhSENxQzVpNlJtU1REcm85NVVtd1dhOTY0Y2phN0dN?=
 =?utf-8?B?RExZMGJJSi83OU5idDlrbjMvZXFIaUtITnFaNkp0VkZTYnowV1IzV2piZHNP?=
 =?utf-8?B?eTMyc3hadm1MMlNKUnNkOGQxMVRqZjkwSzJ2Zm5ERGxpY3hnQ3hWNnFkMkIr?=
 =?utf-8?B?cWI0ZGlTeVJ4ZEdhd2p6aWoza253NXRtWkkzU04vZVBVR2hpNXF5bmlnQWI0?=
 =?utf-8?B?UjdhQ2dnQVdsbHVjRzE2a0UyUWhKa01XSEZYM0ZWK0RYb2QrZjBJakZXUWF4?=
 =?utf-8?B?dXZDaUQybGpQUi9FKzUxOFM0dzlrSHpuOHA1aDJUYnBQdG5pNmx4cWVyeE1x?=
 =?utf-8?B?dmZLL1ExQmRtT21xbVY4NEFQaWljYWtMNVNCSlNRQlVhbk5ZbnFMdzVyZ0tn?=
 =?utf-8?B?ZWVraUgzZGttWmhGV2xMMENhRjhIOEZuc2lodk5SUzBJQ1BCbGVrcXR3UHFs?=
 =?utf-8?B?MGtHMkljQTZsQ3EzZ29INkdWaE9oWUdOaUJORFZ3V2VyZUpyMzRxcEtnbnA0?=
 =?utf-8?B?c1hSYzZaV2hmZnZrL21iTzBpeTdQNjRGbHRONFhRbGt3U2VwcVk2T09ZK05H?=
 =?utf-8?B?UU9pRjd4R3FhbmxEenhoRnFmVU9Yd1M1V3A3c0IrcGNkSEhHWVJpWGRZZGwr?=
 =?utf-8?B?TWNwUEZrWG5oUmMzVXRvdGsvaENWemhkQW4zWkNCNnhieC9tMVdRaW1kY1lV?=
 =?utf-8?B?c0hqbkdSZFFRWXh4VDhtR1dqVktrWm1SbkEvNzBGdk11U0pFeW11NnN0Rk1K?=
 =?utf-8?B?cmV0aFBZTExKelpoYVdqQ1lDZFdHeW5pbHNDQ0htYUxzZmdTRTNjZlZ5cUZE?=
 =?utf-8?B?bEFLS0VRUlRrZEk2L2p2RWR2N1VabDd1citjUnpJQ3g2RkVJU1BkNzVRVXMy?=
 =?utf-8?B?aVZEWlU0aW4wYytSMGxoOHZuSllxSjVtRkNnaVMyZVlxaEZHd0tKeDJvMVJm?=
 =?utf-8?B?ZlFKTnI3ZUJoaDhqWTQ0QU4waUxMNkQ0bDR3d001NHVWTG1JdFU2akptRDdr?=
 =?utf-8?B?L3lURTR0UWZLaEFubzVzL0s2WGRWOXBiWUh6YVpocnVCTDhINklvdzVHQjBC?=
 =?utf-8?B?Nm5ta0lRdGVDVU1KQW9keU8vTnhpSEg1N1phUGduaml6Q3hVSGhxYXRFWTJN?=
 =?utf-8?B?SUR6MEsyOERYYTFUSTUyUlF2aFB6N3h0cU13bDdOQ2lJaTRZUStMbXhSZlFy?=
 =?utf-8?B?clAvSEFzVGhrKzNFVWZSK2NUS0ZDT1R6NjFBWHliWHdPa0N6bEVBU0E3a29n?=
 =?utf-8?B?ayt5a0VyMmFSanRUVVk1NnFmcmQ3TTE1WTBGZFhseVlNaHlSVUliVDQwTFNB?=
 =?utf-8?B?V0s5cWpkSFhySWFnWDNBazhTSzFsZEdLVHcvSVd0T2lCYTBnZmVZWjMvYlZj?=
 =?utf-8?B?bGtYWm80cVJ4VUdKYU9FVTgrOFBQTzZNN0lQK1Y5MjZZUVFMVGJRei9ybito?=
 =?utf-8?B?aTUrdFU0MW1LZWlMc1NaY3N0aDc5cHlRRWxsS1grSC9PNjhHS2pHT3dZYkR6?=
 =?utf-8?B?cXV2V1d3OFV2OHR6TDM2TVFsL3M4VDlMNWpRek5YSTFwaUE5NktSRzFWem03?=
 =?utf-8?B?WnZYR0J6MnZPVm0yb0FGWlQ2RWpZOERxNEpmSEFBaHBMbHdTRnpkVGZRenlD?=
 =?utf-8?B?SkdlT0JaZmpJcENRQU14OWFkRGp6OSt4MnRVNGliQm1aaE16elVHM1U2M3hk?=
 =?utf-8?B?YUhjVDRaQzE0TjY0Zko5Q3Vldkd0dGhOTkx4ck5PUDJES1B0TWM1ZytXbHV2?=
 =?utf-8?B?ZkNndlU0YTIvUUdpRzdETW5QM0g5NTNHdFBrbUEzOWlJNVlPMjZKN2NoUlpD?=
 =?utf-8?B?YXpUWi9DcUtLN0FPb1hvaVI1OURORE4zdEVKVG9sTFpuUWx4QWhWWVBoblph?=
 =?utf-8?B?QnVGYzFLNmJOdDE4cjhrZjE4M1ZkQkxLRWVqUWxPSlNQVDN0WFhsVFhtanZW?=
 =?utf-8?Q?s2Y4n+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 15:16:34.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e379a1c0-8abc-4bdf-1e17-08ddf14631e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541

On Thu Sep 11, 2025 at 5:04 PM CEST, Jan Beulich wrote:
> On 11.09.2025 14:03, Andrew Cooper wrote:
>> On 11/09/2025 12:53 pm, Alejandro Vallejo wrote:
>>> CPU hotplug relies on the online CPU bitmap being provided on PIO 0xaf0=
0
>>> by the device model. The GPE handler checks this and compares it agains=
t
>>> the "online" flag on each MADT LAPIC entry, setting the flag to its
>>> related bit in the bitmap and adjusting the table's checksum.
>>>
>>> The bytecode doesn't, however, stop at NCPUS. It keeps comparing until =
it
>>> reaches 128, even if that overflows the MADT into some other (hopefully
>>> mapped) memory. The reading isn't as problematic as the writing though.
>>>
>>> If an "entry" outside the MADT is deemed to disagree with the CPU bitma=
p
>>> then the bit where the "online" flag would be is flipped, thus
>>> corrupting that memory. And the MADT checksum gets adjusted for a flip
>>> that happened outside its range. It's all terrible.
>>>
>>> Note that this corruption happens regardless of the device-model being
>>> present or not, because even if the bitmap holds 0s, the overflowed
>>> memory might not at the bits corresponding to the "online" flag.
>>>
>>> This patch adjusts the DSDT so entries >=3DNCPUS are skipped.
>>>
>>> Fixes: c70ad37a1f7c("HVM vcpu add/remove: setup dsdt infrastructure..."=
)
>>> Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> Half RFC. Not thoroughly untested. Pipeline is green, but none of this =
is tested
>>> there.
>>>
>>> v2:
>>>   * New patch with the general fix for HVM too. Turns out the correctio=
n
>>>     logic was buggy after all.
>>=20
>> Hmm, this does sound rather more serious.=C2=A0 I have a nagging feeling=
 that
>> until recently we always wrote 128 MADT entries.
>
> Not exactly recently, but looks like that's my fault then: 0875433389240
> ("hvmloader: limit CPUs exposed to guests").
>
> Jan

Very right. I got to that commit, but thought nr_processor_objects would ma=
tch=20
NCPUS. Wrong assumption.

That sorts out wich fixes tag to attribute this to.

Cheers,
Alejandro

