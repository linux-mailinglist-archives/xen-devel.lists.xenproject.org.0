Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F76A89D05
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 13:59:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953725.1348168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ewl-0000a7-Mo; Tue, 15 Apr 2025 11:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953725.1348168; Tue, 15 Apr 2025 11:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ewl-0000Xn-JZ; Tue, 15 Apr 2025 11:59:23 +0000
Received: by outflank-mailman (input) for mailman id 953725;
 Tue, 15 Apr 2025 11:59:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=moIN=XB=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u4ewj-0000Xh-AU
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 11:59:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2412::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ee139dc-19f1-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 13:59:19 +0200 (CEST)
Received: from SA1P222CA0081.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::7)
 by DS0PR12MB9725.namprd12.prod.outlook.com (2603:10b6:8:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 15 Apr
 2025 11:59:12 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:35e:cafe::10) by SA1P222CA0081.outlook.office365.com
 (2603:10b6:806:35e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Tue,
 15 Apr 2025 11:59:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 11:59:11 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 06:59:10 -0500
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
X-Inumbo-ID: 0ee139dc-19f1-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+cOAThzlMgPLwLDj5R98nURces2nP9lnRgUadspLAqX1PahgootI9p6A6io9VI0yse0A7fZlgFUFK1UGfx5GRCPR9oZwQQNxZQglcjnhnIg1TY8f1t1BwpHsiINe0vvQCardgS6GUI+p4h3GLtv/7PNLKIKdwaya+hT7jof05mbV3O+OoV8tJWPLPDpb1BdVDZwwA4OOs8R0yG2e0/YQghB9dv9fFzZd6LqY3lG5Rb4OvZClQFvOTfQMVM7h5BSTHvNtP1hV5yOxp2zUDQB24sag+S4+BRSi3jrMtbbDA/7rH98IR27ybgRsUtTANmKZskH4xzigF/8Y1VmsuYorg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExV+xGI3EJ/S5vot5B2WCL40GqYWjUIaIdeNRue2KKE=;
 b=o4dRwG/RITaURSYI1iPit9JviSlFX0LvDfFI+P5Ya5A1JdCpi3ys/RaWtg/w1iU/NK3ALwUWsHpmLtTL4Tx2UVj5557+klf+FK10p99rcCDZdeYsYZQUHfh728wFnavkmvgb67Wu6wf7U4OZvritlPpEVdWydd7wNys0OOGAbBv/VHTYVTNdmLfb6aM3iTndJPcGnPrwb7i1viag1wDLqhDE6eFiKReiQHW2ORX1ud19DqXCSnDzEnK4vhItOlBYUtlOPVGWp4orlYlv3dzjAQ2kQIVGQNWgKyzd0oIwmQpER8IP3Pja8jdse6Pn9IhowrVTD5xA0PKmWNm7S1MieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExV+xGI3EJ/S5vot5B2WCL40GqYWjUIaIdeNRue2KKE=;
 b=bJ8tjw+fG3TW0FlnCG4TEljY8+/vFFNI7VCEOtmhuZ4dBizgAM93WeqTp9c5mh72sOASRq8uv1c9jsg71I65trCWK/bqGYbpc9sL8ldJ/ozqbv2o3FUrx0VvXf4jl9YUCgDSr9IjCMBuaTHMWQ9kly9fAA+6cXwMYxzdrq2QSvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Apr 2025 12:59:09 +0100
Message-ID: <D9771CIVB3IR.TAKEYOHRCY30@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com> <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
 <60363eb4-cb35-4077-b964-0c321c495a19@suse.com>
In-Reply-To: <60363eb4-cb35-4077-b964-0c321c495a19@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DS0PR12MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 199e08a5-374d-4fb4-b06b-08dd7c14ef98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnFqbXNXRlZkVWRkc2JLRjZQbnhPQ3BsaVF6cnp0NnFtSEFXZGdiSVNqVC83?=
 =?utf-8?B?ODFoR1IzdDhHNWlSMk94a25JV2V2VGlIaGh2a3lSMnR1ekNLWnBvMjdmVUN0?=
 =?utf-8?B?UmQwZGhZR0w4KzQwcnBEQUQvREVKRlA4Tm82U1o4cjUvKzVtMjYrb05UdCt1?=
 =?utf-8?B?ZzJWNHVCVUVralZrOHFnMHRuRkxrNkpwZjYyWHhlUHY0NkdUTEVlOWg1d2s5?=
 =?utf-8?B?cjRucnZ4cWdRekR2WFBmOXVHaSs4akNDL2orWmdUbVQ1M3YvdkNCNHl1ZzlW?=
 =?utf-8?B?T3R6UHdvdUx5MXg1cFMwTHNTWDFvMmg2WW55KzJRQjI5bzZDbCswakZaN1I5?=
 =?utf-8?B?dTdkWnNGbHpwNkFwc3F1RFdkUGFZZ1pidEhBNkZSUnNsU2VBaEx5eldhZTEv?=
 =?utf-8?B?TUhnL0pRTUtjVU4rQXZaQUk1WFVpVkJwUnltNFgrMTJROW1zUHRhRlJUc3VC?=
 =?utf-8?B?SUFuZnNuWmxkSVJDZVhRR3c1bS9rTWxyVGVuWVQzdGI5VzM4M2xtT1JObVJn?=
 =?utf-8?B?LytudTdLM25CZHFlSnJ6VDN3SXRKN3lOd1FtSEVLUk1xdUhBVmtJUWVTZVEw?=
 =?utf-8?B?YTFaL2NoNUpNSVZQSDlDWmR4aCswYm10cGJOcHRCalRycjB3NU9INERZVVFD?=
 =?utf-8?B?TnFwN3VJT2hmazNBOTlJMWgwV2RkTUVtb0VsbXNyY1JiZksreWxyazVzQzla?=
 =?utf-8?B?dmZKUmtBNzNCUXlHcmxZSWc2S2hRbHVYcE15YUdYcFdLYUlZdExkYUN6TmhC?=
 =?utf-8?B?ZHVwMjFkMEhQSWI2bUd5Zk50UGswVk96dFErNmdReDJvWFNXMnJSVGpNeExM?=
 =?utf-8?B?WXVYd2RJMUM3eDRqdlMzMWhQbHdYWXlpWU55RXd3aHJCY0NOZ0lVakozRnJh?=
 =?utf-8?B?dllySkRWdEpieDMvVDNBbHFENTl0bnpVTXlpRUlEdEk4ZmFleTVPc1d5MjBE?=
 =?utf-8?B?TWxFTmlBaUw1d3lpaGtsSVNDUHBBUmluellSWWVMTk05T2xubmhZZ3NCS1Vz?=
 =?utf-8?B?anQ5QnJCSmIwNFBNZVkrVHB3T0Y3aEZBMjBla2p1Si83NDhERG40OWwxdVZk?=
 =?utf-8?B?SExhMXJReEI4K0V2Q0k1YitveGlXeXpjcjRDT0xzb3F4UXFnQjQ1dmR0a3Fw?=
 =?utf-8?B?SGZMMnF3alpZYlgyUVU5ZTMxTzg0c1dsNmwxbktZTVpyMTFUTTFQa05wN3Vt?=
 =?utf-8?B?M2VHWkhuekVZMVBJNU1NSk5uRDloclE5bVFTWWxtQ2szaWFxbzdXQlVnL3NU?=
 =?utf-8?B?YzBEdytKQWdqc2xhbVNEU2RWMUV5MkFIS1doRy8zbFdTMnFxajF6Mk9FVldx?=
 =?utf-8?B?VEFWSmhBR01IZmo4ang0ZGFOSXprWWFubW5rS0htUlMyNHRFVXhKSkF1Q0N1?=
 =?utf-8?B?S01qR1pMSkl2N2lka2haK1p2VU83NjR4WDNUMUFYaGM4ZTQzTkZERWZoUEg2?=
 =?utf-8?B?V3A5ZWhlR1Q2QklYY3hNM3pIRkw5L3NVL2JGVEVudVVxbXZIU1E5MkpFRTRN?=
 =?utf-8?B?SVAySXFmL29JV0tvOEt5U212R2w0RGNVQnF4ZitVVGhzMFVjR3VJSjJYOElD?=
 =?utf-8?B?MEFxWGQ3ZTVlN1prdE8rYUxQaWw0UXZoN2NKczA2dlNEVDNsVWorVU1odXU4?=
 =?utf-8?B?RDM3UElIMjJYN05FM3ZwRVA1Qnc3U3Mzb1M0QzhtWXFxR3VERXNMTm1yWnNi?=
 =?utf-8?B?NXF1Z2VWckhqZUhleVVsQ2pOUXBScDhIWlpaNHJ3SWV5eDVQVnNMM2t0WDYr?=
 =?utf-8?B?NHBqVXpZWHpITWNqRW9mcjhoZThvaHMzZTFhUFZaRHFtby9HaFJiQWd6blNj?=
 =?utf-8?B?TXN0eWgzTG9mTW5DUmxKNTlkU1dpcUpzL1F3dXgwbGtJeFdvNVRERUxHMmt5?=
 =?utf-8?B?Si9xZkJHTnZRdWNKWklGdXdkRFlxUWhEbVJOYkwyN3U4N1UyaUgwRVRmemxN?=
 =?utf-8?B?THROT016RHNrWGVCdnJUV05KNHlhbzc3eG9hM1R1bEYvYzFmUUNtZE1Ja1hi?=
 =?utf-8?B?a2tzSXRybEhXUmc3NENubGlyUkYxY2tPMC9UdkdMWlJsK2xldTUyK2dzYkVD?=
 =?utf-8?Q?Xu88gx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:59:11.6804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 199e08a5-374d-4fb4-b06b-08dd7c14ef98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9725

On Tue Apr 15, 2025 at 7:17 AM BST, Jan Beulich wrote:
> On 14.04.2025 19:27, Alejandro Vallejo wrote:
>> On Mon Apr 14, 2025 at 6:06 PM BST, Alejandro Vallejo wrote:
>>> On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>
>>>>> +            printk("  ramdisk: boot module %d\n", idx);
>>>>> +            bi->mods[idx].type =3D BOOTMOD_RAMDISK;
>>>>> +            bd->module =3D &bi->mods[idx];
>>>>
>>>> The field's named "module" now, but that now ends up inconsistent with
>>>> naming used elsewhere, as is pretty noticeable here.
>>>
>>> Well, yes. It is confusing. Also, the DTB is called multiboot,ramdisk,
>>> because multiboot,module is already used to detect what nodes are
>>> expressed as multiboot,modules. I'm considering going back and calling
>>> them ramdisk again. If anything, to avoid the ambiguity between
>>> domain modules and multiboot modules. e.g: a kernel is a multiboot
>>> module, but not a domain module.
>>=20
>> Particularly when misc/arm/device-tree/booting.txt already states that
>> the initrd for dom0 ought to be provided with the "multiboot,ramdisk"
>> string in the "compatible" prop.  Deviating from that is just going to
>> make it far more annoying to unify arm and x86 in the future.  And
>> calling those ramdisks anything but ramdisk internally is just plain
>> confusing (as evidenced in the current series).
>
> Yet the limitation of this is quite obvious: How would you express
> multiple such items?

With multiple such nodes.

  initrd1 {
      compatible =3D "multiboot,ramdisk", "multiboot,module"
      module-idx =3D <2>
  };
  initrd2 {
      compatible =3D "multiboot,ramdisk", "multiboot,module"
      module-idx =3D <3>
  };

as is done in dom0less. This is not a hypothetical, it's already
comitted.

> Have many "ramdisk"s?

As many as I require. If I was booting Xen(dom0+initrd) on
Xen(hyperlaunch), that'd be 2 (with Xen passed as the kernel).

> Even if some of them serve an entirely different purpose?

The purpose of a ramdisk/initrd is of no concern to the hypervisor. They ar=
e
specially crafted blobs consumed by kernels for purposes of bootstrap.

> See how Linux has gone to tuck together multiple CPIOs, as they can
> have only one thing called "ramdisk" (which, aiui, now no longer truly
> is).

That's an internal Linux matter. If they need 1, we'll pass 1. We do
need several such blobs, because some OSs do need them. Namely, Xen. And
AFAICS we call them modules mostly because (a) Xen does not have the
module infrastructure that Linux has, which would causes ambiguities and
(b) is typically loaded via multiboot, which does call each blob a
module.

>
>> So... how frontally opposed would you be to restoring the ramdisk
>> nomenclature? Also, for ease of rebasing future patches it'd be far
>> nicer to go back to ramdisk rather than reinventing some new name.
>
> Well, I fear I wouldn't ack such a patch. If everyone else agrees
> that "ramdisk" is the best of all names (or at least getting close),
> I'd perhaps mumble over, but let it go in.

Ok... When I send v4 I'll do so keeping the "module" rename. Meanwhile,
I'll try to think of some options. Calling Xen's modules and the booted
kernel modules the same way is just way too confusing.

I take it you have the same dislike for initrd as you do for ramdisk?

>
> (Only partly as a joke: If we dislike "module", how about "blob" or
> some such?)

Better not. Blob makes "kernel" sound like an adjective: Kernel blob.

There might be some other suitable word. I'll think about it.

Cheers,
Alejandro

