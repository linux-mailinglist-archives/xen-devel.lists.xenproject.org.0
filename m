Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F4B51E7C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 19:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118634.1464342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwOD6-0003ir-1d; Wed, 10 Sep 2025 17:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118634.1464342; Wed, 10 Sep 2025 17:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwOD5-0003ge-Uv; Wed, 10 Sep 2025 17:02:19 +0000
Received: by outflank-mailman (input) for mailman id 1118634;
 Wed, 10 Sep 2025 17:02:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ly7=3V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uwOD4-0003ed-1R
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 17:02:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2413::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6df2fa1-8e67-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 19:02:16 +0200 (CEST)
Received: from SJ0PR05CA0193.namprd05.prod.outlook.com (2603:10b6:a03:330::18)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 17:02:10 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:330:cafe::3) by SJ0PR05CA0193.outlook.office365.com
 (2603:10b6:a03:330::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.14 via Frontend Transport; Wed,
 10 Sep 2025 17:02:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 17:02:09 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 10:01:29 -0700
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
X-Inumbo-ID: e6df2fa1-8e67-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6B48KycYOrf92SpeXKFzxnuxTXMalqYYYkeCUNPqOYtzGmiBk5ES4dWRKzAawfiP30p8oL7zbo8nu88/9J80eLCZhtvqRtEl+Iy71x1+qf2OMi7vTpmPkhxUQev9/wK0rHcEr1988ymHBIV34eNulxYJ5P/bShgNoyOOPUxWr7KLTkbIOrmRnkX5Nk/VE8WpjVFEqt9LKJ6pP8iLUg9W46tSNYkA5LnGL6wyYrYPVBadgmmD7ctG+jyQC+DK01JTdDgCLV6DyjNBO0X/Whak+/HNRcVqK+B94XUDD0262sYfLnzg3d7SnjR/m9Jj4VziASg9AHgQL+k7id3zo9CVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHE1RrkGJDNNNV5lHGYmpuLxiJIwY665xOrzVH6SXlw=;
 b=CqeTuu2gXw7PfgFqOtotaR0UhfW+7/Rs4lFOZbJyEsw0Sy86US/tmlEESka4ru8QCQBPy6Y0HjrKJ9MentPiPRvi1skaORXiV8F4Js5hFaBsjOGh9FVFVZBsA8H1X0QmMvlKRvZ8VDVTeQRO8O7lZdpItGFBMWD2tb+C53pJ0byPXEMS+4DAPZwYwWCSmVK9/R/fBmBDCdTd7AKiZYdh6xalxKoLM5jcOFlXEJJjZX2st3YQEMYFt7b66W97bHfaVm8c81LFYIB1yZqKHN4R41V3OHH23fnvLIRHUoxTp5O4It5+zXEPznrAt0Pphrpz85Ch2pZ9uH4tziGWLBFLgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHE1RrkGJDNNNV5lHGYmpuLxiJIwY665xOrzVH6SXlw=;
 b=bFZUI2dnrlTAgKqrWVYOkNLH6CzVVIcCiuIdunoOL4EQzGePgEzFdSgwx2eKOz2miVDwF5o1UlrYb++fLRBjQ5EvXXADYUvhjHOHNfDPqhqvojhLDE8C+tt9Ty58VKwuQ0l1fAmne77EMlQhudPSQBy4/j8Qj7MNt7sWLr1YZ9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 10 Sep 2025 19:01:28 +0200
Message-ID: <DCPA5G9EUXZZ.1739W35VKVBBP@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Roger Pau Monne <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
X-Mailer: aerc 0.20.1
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
 <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
In-Reply-To: <d753bbad-eb2d-4902-bdf5-ad77542ac28f@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 257f6165-968b-4033-12da-08ddf08bc7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0JZVlI1SnpFc1JzMFFQbS94cExwVkFZQXJjZlNzOC8yN0VoRkVuK0dVV0tn?=
 =?utf-8?B?NmU4dFQydVMwanlKZCtkNE9CLzZ6Um5oRTFuYXVTVjBLRDFOWjc0Y0V2UkZF?=
 =?utf-8?B?SGhjZGNkQkJqWExINTNNdTZiaklDT0dZR09RRENlU1BzWmFBVTdLTjVRd0tG?=
 =?utf-8?B?WVFoNzlMY3RZdmVkYjh0ajZZWjZ4RzlsVXJ2YkJsWjFEbks2Vjh5N3dybHdu?=
 =?utf-8?B?dFlSeCsyTE1DQWk3TVRQOHVCaytsSVIwb21ZYndrRTFPVnZ6ZWMyUjRWbjg2?=
 =?utf-8?B?eE9GZzBvSnMxY01KbUZsTGtsLzIzVWN6V1lwYnovVFNCT2ZHM20zMm0rKy9C?=
 =?utf-8?B?ZmhKM1VTb3U2dzNlcm96K3dVWTdBRlNCa09ITXZmVVRia1phYUsxc2orWGht?=
 =?utf-8?B?MVJWdm1yU0gzTU90RnRkREVzN1BhR1VEVGFIaFNSVjRoT2NoTFhUT21EM0wz?=
 =?utf-8?B?dEttd29kekltd1JlTFVXZUtCSGhOTmJjUW81eHZCRkZ0RVZNdmViRngrdVQ1?=
 =?utf-8?B?bHlVMGVzK2JVNGFMUUx1NnV2RnZOLzZ0MTVOakNOTGlVSTdBNExSR1NMcTJp?=
 =?utf-8?B?YXZJNU43bmpLcFl5d2c1SEVOeDhUczZEUnFJdHJpRzROOThreDlUb2ZGMitx?=
 =?utf-8?B?SGJmN2swMk5YUmY4UWtFSm1Dcm1Ba3ZFd0pmWDM2aEJSTkZRRGxwWmJJdTZY?=
 =?utf-8?B?S25yWEZUajdJL3FBeHFHUHRtN2NOMDJjdW9hRVNqQ2lxY1U0S0JjcXJSQlpl?=
 =?utf-8?B?Nm9peGRFYjl6blZWUm1ub0ptZ2U2QTQ2OXovVUZMTGxVZGlnQjNHcXJJSFZ4?=
 =?utf-8?B?TUxVUlJFTjVsYTlhRUxidWJNTFEyVFZoaXVDdU8zVWJSQXZYUVYrcmZwcy8x?=
 =?utf-8?B?M0YxWmlRVVVDOHdiMVd2cVlhOFRvNE9zWGxmOE5LOVUxWlBoMEprVU5Qdm1M?=
 =?utf-8?B?dVlCNjU3dFRwWHRxSkR3NVh6b2JGMnhaRzlFMUZ3SFlaUkdjc0hhODJ3TU5P?=
 =?utf-8?B?Sk1BZVVLS1dSR0IxRjdIMDI1cEl0ZFVPQUlLN2M2c01kc1p5OGszOXh6eEZx?=
 =?utf-8?B?R1N4cjgyeUdvUFlXclAwdy9CaEE5SFpuTE5OVkM5Ykhob0pyaUE5bGgyRERt?=
 =?utf-8?B?OFpOYlN5dW13ckpsK2UwSEM5QjhFYVBFMC9CWkJiYTZlYTdhU3RaKzVQOWNH?=
 =?utf-8?B?ZU5ucnAyUHl0ZHNaWmE0UGRrMVk3VUVsSmdxeGVBK0doS1hrVHNseFczOVFu?=
 =?utf-8?B?SkRibjdHVXVXOTN4OStIT2lPVHJsZHo1UUtBVXhDdWJxRDU5SUxjY0FxWUlG?=
 =?utf-8?B?QWpRSm82ZUZzNzlUQVJnU1M5NG5UV0IvN3pOdUdaVU1vRGIxNGtCb3hlSjB4?=
 =?utf-8?B?UUppWk1HUEdGREU4YmYydDkwRlZXSXcveXZydUZLQ3BvUjBlbFVBejAvYWNE?=
 =?utf-8?B?R3ZtL3d3Q2RFVjZNV1lwa2E0cGdLekNCNTBranhUNXNXbXhXRFpDNktYWWRs?=
 =?utf-8?B?ck4vcVNWVVJUd0lUb3R3RzgvakpYay8wOWgrdHBFTHRHbVluUXBuRFNCMGZm?=
 =?utf-8?B?b0NNdEV1eDB6SzJVbUptTFF1VVREVk1hU1ZyK0poVkY0QU55UnFZVXRNS0FP?=
 =?utf-8?B?VHR5WW5iaXBUUlBTcHhabmdwVVdhMVBhQk1iTitLSzRzSUorakRYR2Rrdmww?=
 =?utf-8?B?c2xJRjF4Mk1JVnB1NlBMS3UvRkNKL2hPUEFTdThBRDF4Yk1wNWljeGJ1YU5K?=
 =?utf-8?B?Sm9qZkNjRWlXMmxiellTZkZhMzQ4Q3dHdTI4TUlLSEV2NUxrMVQvUWtBZkhM?=
 =?utf-8?B?bnJQYW1ZeW5hSnV5VWt2VmZySHJscXNMMnROejZtWVoycDFiYWlHV2hsUlRK?=
 =?utf-8?B?QVQxa0o0RTEwVHVia3FkUjVKZDNwRUJYamkrZmNITFI2ZzJwNC9IK2tvWHk0?=
 =?utf-8?B?SDJQNSsxVVJuV0t3QkV2TmRlK0JVNzZCTWpsQUdYaEZubjU0TlZLOTBvMGJq?=
 =?utf-8?B?RmdPcXlJVUVWYlZLTExsNmIzaTVlY3RnalVDQll6OCtDMCttYlkydnNjNWpO?=
 =?utf-8?Q?y2P307?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 17:02:09.8431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257f6165-968b-4033-12da-08ddf08bc7ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972

On Wed Sep 10, 2025 at 5:31 PM CEST, Jan Beulich wrote:
> On 10.09.2025 17:16, Alejandro Vallejo wrote:
>> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>>> CPU hotplug relies on the guest having access to the legacy online CPU
>>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
>>>> this causes the MADT to get corrupted due to spurious modifications of
>>>> the "online" flag in MADT entries and the table checksum during the
>>>> initial acpica passes.
>>>
>>> I don't understand this MADT corruption aspect, which - aiui - is why
>>> there's a Fixes: tag here. The code change itself looks plausible.
>>=20
>> When there's no DM to provide a real and honest online CPU bitmap on PIO=
 0xAF00
>> then we get all 1s (because there's no IOREQ server). Which confuses the=
 GPE
>> handler.
>>=20
>> Somehow, the GPE handler is being triggered. Whether this is due to a re=
al SCI
>> or just it being spuriously executed as part of the initial acpica pass,=
 I don't
>> know.
>>=20
>> Both statements combined means the checksum and online flags in the MADT=
 get
>> changed after initial parsing making it appear as-if all 128 CPUs were p=
lugged.
>
> I can follow this part (the online flags one, that is).
>
>> This patch makes the checksums be correct after acpica init.
>
> I'm still in trouble with this one. If MADT is modified in the process, t=
here's
> only one of two possible options:
> 1) It's expected for the checksum to no longer be correct.
> 2) The checksum is being fixed up in the process.
> That's independent of being HVM or PVH and independent of guest boot or l=
ater.
> (Of course there's a sub-variant of 2, where the adjusting of the checksu=
m
> would be broken, but that wouldn't be covered by your change.)
>
> Jan

I see what you mean now. The checksum correction code LOOKS correct. But I
wonder about the table length... We report a table as big as it needs to be=
,
but the checksum update is done irrespective of FLG being inside the valid =
range
of the MADT. If a guest with 2 vCPUs (in max_vcpus) sees vCPU127 being sign=
alled
that'd trigger the (unseen) online flag to be enabled and the checksum adju=
sted,
except the checksum must not being adjusted.

I could add even more AML to cover that, but that'd be QEMU misbehaving (or
being absent). This patch covers the latter case, but it might be good to
change the commit message to reflect the real problem.

Cheers,
Alejandro

