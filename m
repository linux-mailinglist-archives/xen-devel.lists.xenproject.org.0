Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B9C68ED3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 11:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164605.1491528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJM9-0004va-Mw; Tue, 18 Nov 2025 10:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164605.1491528; Tue, 18 Nov 2025 10:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJM9-0004sh-Jz; Tue, 18 Nov 2025 10:54:41 +0000
Received: by outflank-mailman (input) for mailman id 1164605;
 Tue, 18 Nov 2025 10:54:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=USx6=52=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vLJM8-0004sX-Lb
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 10:54:40 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f72c6e37-c46c-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 11:54:34 +0100 (CET)
Received: from SA9P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::14)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Tue, 18 Nov
 2025 10:54:30 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::34) by SA9P223CA0009.outlook.office365.com
 (2603:10b6:806:26::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 10:54:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 10:54:29 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 02:54:27 -0800
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
X-Inumbo-ID: f72c6e37-c46c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpR36MjClcKSjTNFJqNR6hHEgBxgOQJVWBIPvjiLYJlCYt5iLkYNDW1kqJry97FvY2oLezMR9TK5EEy+8DDoh1kv0CtU4QkJXgeGCksNbdvUCOoHTS7cZZf2DOkDyLIWFCjwgzL2J8ti9OrjxPcfl8IReTTJiyMvVpgX2j/Rtl4k09vayItzgRyEvxZ8djZMA/adiC1biZJheUrZ8BL9OAhF+Pt8AGG6ea6M0RCfjIY/sRNOhu5sAuG7yBxc9Ft4DGQRKtGL7qf/X8ddCrxhjOe0gWhDbcT6DdMIBmHNoZv4LQ3mH+7yi8B5+/OqKXf1ZcPvBVlyHqGnmIl6SsXySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skz63dM4gCeY8kUjUVXRGg2VLYujiCJ8xVkh/zs2nn4=;
 b=nAsBntYHW4rPb9oW+0GtGNkYKtgHL3t6GKAEflF3NgGhXLK27eeREDOthtqeggp4+DDox3THd41QbNvoM8Caju1G28KS6KzSL15sO56VAdOeYOId6rHwpUkesaplY1lI/X2J/663RjK516I3shf4xb2EDF7YTvkABoIs5E5q+472b7U/vDsZigxFLCHTVyoxYQZbWhKBQBk77+mHRtGCCmfXXi9xUWQQ23oFlZRamVHwPTIgP3oVsPLbw9+/RaKI4V2yj6n1LQ7Lqr9kYS0riANWcfLximuHZYfDHOmQzqsIcNWR2MGi+tzPnQdikCna92JWiVL+q+igPtzRmcWLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skz63dM4gCeY8kUjUVXRGg2VLYujiCJ8xVkh/zs2nn4=;
 b=HpmaVhtiP2LR1m9nAePxlfLdAiK454N1V8SjiH6iYqWxT/KR8k1osoVWifNrUXlOUdXWW27E8jTdsa42PI62UFQ7+m0EgUjhhjAJIdxnw65JCE4v5DtGT4wCQpcFykt/q5wQu0xHALtU5HksISDGIki2X1a7pIDfbd6XIycbryY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Nov 2025 11:54:25 +0100
Message-ID: <DEBRK0H5DR1V.20T45Z6SMT1RR@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julian
 Vetter" <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v3] ioreq: Make sure ioreq is always in-bounds
X-Mailer: aerc 0.20.1
References: <dddbae09e8e6b94a20f5ce24f3560dd15e5c6c01.1763382746.git.teddy.astie@vates.tech> <97ffeca9-348e-4997-a223-359fefa83107@suse.com> <8e1403ce-c333-4236-b38a-82525c7b542f@vates.tech> <e0f69901-b8d4-4af0-b085-d936fdfcb0fd@suse.com>
In-Reply-To: <e0f69901-b8d4-4af0-b085-d936fdfcb0fd@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 47707ba0-c6a4-40b2-99ee-08de2690d971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z09yZEdYUC9wVXIrelZNbURIcG1KaE1MYVBBbU9pa3R2d3dQS3M0dnBBVVZE?=
 =?utf-8?B?ZDUzMUVTcXBBR0ZlTjk0bTN1R0lmamIzS0hwRzVzVnRQL2FpdXlKL2NxQ2s4?=
 =?utf-8?B?QjFVd3VISmU2MGV0M0VwNXRTSG5Ca3lWVnJBdDk0cGVPOEhPS0VrSW9aVnhV?=
 =?utf-8?B?SmxaSnAxMlNyOU1IWENSM3RtS0pnUlU2T1Y0TTI1L1NCTGhRY0hEQ0o4UGx6?=
 =?utf-8?B?YlBQbkF5QVhmUDYwMk9rK3ZScFREZDhQOE9QdDFKeWVMMmRWY3Y5TmkrdWRi?=
 =?utf-8?B?Z1pYVUZ6YVJFcUhWejFqckdwQXZkREg1YVZwbkNCZUhJREZEajFZSjFqNGRV?=
 =?utf-8?B?ZFRGTS9oS0FaNHppSjhwRnlYZVl5bWRjbTVzUkVuT0dtdFdHaHM1cndaSmxJ?=
 =?utf-8?B?bE16SXF6VzM3U3NCRGVTVE1LK2RaUnFWK2R6ekxheDIrdTJXd2lDNGdyaS9s?=
 =?utf-8?B?cWJpVUFXc0htaHB0cVFXdU9hTU9IeUYwUGdFdkk4VS9FLzBlWWlhSHI2STNq?=
 =?utf-8?B?aXNFelNlekRPaHJRd2NXMnoyUGkyb2NieElMSks0TnN5bkdoY0RqcnVMWURt?=
 =?utf-8?B?Z3Q1YTZKMytmK1ZETXhXSlJleVhsNFU5UzdCRXBxeUhqUTFlSXZGaWtBajMr?=
 =?utf-8?B?b2pYKzJQcm5ETDJlQkwzeStwWUt6SisydmNWdGNXWC9EVDBwTVpkem9TaE5R?=
 =?utf-8?B?T0JpdUs1OGdSdnl0RzlGWE4yajN1ajJ5QUFveWZ5djkvOUFlajkrYytSUjha?=
 =?utf-8?B?bWVMT0JyTTlsQm5sWVNMZFduQWhRWERXV003SWJKR1ZCWGkwZ3k5OEFpMVQv?=
 =?utf-8?B?ZDViczZKekMvQTl4eTI4Z1p6WmF4VnMrVm9abEp4aEVQS0VETVk3VHFzeXli?=
 =?utf-8?B?bnVSa1lIa3dZT3dLdHF4WFY4NWdRblpJcCtWbEYwMlRTcUZNazUzdXU1VEdy?=
 =?utf-8?B?cENMZTgxUENtL3l3ZWx6cUtBUndzOWhRZ0wvNFFKMXJLVTkyMk1KekdUMk12?=
 =?utf-8?B?NXZDaVl1Y1JCOUFWVXBPWDBCbXUrdXdxa25Benpkc09Pc3lCa0RLczdBTnM5?=
 =?utf-8?B?bVhOblZ1dyt4RFY0VWJ5MUswMFl2Q2Z1MXNIaEIzS0w5cE9HUndSbnl5c3l0?=
 =?utf-8?B?Y0V0YkxCMDVaaWxqSVVlUXdvRlNhT3NOL3BNeWxQbXVweGZidkxFQ3UvZ1BT?=
 =?utf-8?B?VW9IWHlCVC81V0RFbXZlZHVpVjlwMUs4RzVOOWJjREhHZFhtQnVqd1Z4YXVy?=
 =?utf-8?B?eDRTWkxYVm5PYWdYTU55d0VxSEZsNEtJZ0pYcEQvUGVkb0V1bmdzYVJ3cml0?=
 =?utf-8?B?RVRuSEpkM3ZhQjhzbW5qTGtnckZ6OFh0dXAzTW8rRFc3WVEzSWpoWlIxbjBO?=
 =?utf-8?B?Y3ZiU0ZwNzRSZjdaMVkzNjM0MzU0dXZqWFRVWjZFYUg5NkFBcVFaVldQbkd5?=
 =?utf-8?B?SlM5WENPdDF3eGJzS0kwUi9TOXdlSXVZNFZ0eEdhZ1c0cUtISXVpbzd5Zzkr?=
 =?utf-8?B?NTlpck04QkpoTlBaK2JLMmw0YnRxazJUQVZWODNTaXNzenhkMGFXQi9ueFZX?=
 =?utf-8?B?UGpPOWFUdGFWeWhqTFZwMzQ5QlA0a0tKRXZIWmdURmxFRjM5Q1NEOUN5SUNz?=
 =?utf-8?B?SCtGYzBBbWc4Rk8yek9ZQkM4aEJDbjhET2U5SWNldnJiUmZseU9ObHcxZ2cz?=
 =?utf-8?B?RHdubnNRUEFoYmJ6TnNmR2VtR3dWYVFUZmo1bU5BNDYrcHJmSXFsaE5NVnBM?=
 =?utf-8?B?Wm5wcE12bnNZWE1wMHgxajdGTDJHQUExTTJPTW1oUi9EM3dGdkFnVk9XWEVZ?=
 =?utf-8?B?WkFuTEhaVjFrSW51MzVDQ05ZTWkxSUxzWHdwYm8xRVhJYjFWSkVNY09Vb1JE?=
 =?utf-8?B?SVFtSVVkRGFiU2gyczB0YzRiNXhqM0ptVDdqejRSYmRUb1Y1Q1o3QzJhdlZy?=
 =?utf-8?B?QzJBNEl2Vkx6RTJWK1BYb2p0cFJ6eVozS1E3SkZmYUdldTlYUzArM3gvREpL?=
 =?utf-8?B?Uk5pSkFLUG4rYTBlUEFWSEkvZmRRQ0xabm1kVkppZXZpR1JJL21WZW5yaytm?=
 =?utf-8?B?d0paM3ovOFNuQjZORS96ZlFuK0FjVGhyZjVHVzRUejBSSWx6b3JFdGt1dnVK?=
 =?utf-8?Q?boMw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 10:54:29.7807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47707ba0-c6a4-40b2-99ee-08de2690d971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

On Mon Nov 17, 2025 at 3:09 PM CET, Jan Beulich wrote:
> On 17.11.2025 14:43, Teddy Astie wrote:
>> Le 17/11/2025 =C3=A0 13:46, Jan Beulich a =C3=A9crit=C2=A0:
>>> On 17.11.2025 13:35, Teddy Astie wrote:
>>>> A 4K page appears to be able to hold 128 ioreq entries, which luckly
>>>> matches the current vCPU limit. However, if we decide to increase the
>>>> domain vCPU limit, that doesn't hold anymore and this function would n=
ow
>>>> silently create a out of bounds pointer leading to confusing problems.
>>>>
>>>> All architectures with ioreq support don't support 128 vCPU limit for
>>>> HVM guests, and  have pages that are at least 4 KB large, so this case
>>>> doesn't occurs in with the current limits.
>>>>
>>>> For the time being, make sure we can't make a Xen build that can
>>>> accidentally make a out of bounds pointers here.
>>>>
>>>> No functional change.
>>>>
>>>> Reported-by: Julian Vetter <julian.vetter@vates.tech>
>>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>>>
>>> I was meaning to ack this, but ...
>>>
>>>> --- a/xen/common/ioreq.c
>>>> +++ b/xen/common/ioreq.c
>>>> @@ -99,6 +99,7 @@ static ioreq_t *get_ioreq(struct ioreq_server *s, st=
ruct vcpu *v)
>>>>  =20
>>>>       ASSERT((v =3D=3D current) || !vcpu_runnable(v));
>>>>       ASSERT(p !=3D NULL);
>>>> +    BUILD_BUG_ON(HVM_MAX_VCPUS > (PAGE_SIZE / sizeof(struct ioreq)));
>>>
>>> ... does this even build on e.g. Arm? IOREQ_SERVER is a setting which c=
an be
>>> enabled (with EXPERT=3Dy) also for non-x86. Yet HVM_MAX_VCPUS looks to =
be an
>>> x86-only thing. (I then also wonder about some of what the description =
says).
>>>
>>> Just to mention (no further change requested at this point, in this reg=
ard):
>>> HVM_MAX_VCPUS being part of the public interface, we'll need to see whe=
ther we
>>> can sensibly retain that identifier to carry changed meaning once we up=
 the
>>> limit. The check here may therefore not trigger at that point; the hope=
 then
>>> is that while making respective changes, people would at least stumble =
across
>>> it by e.g. seeing it in grep output.
>>>
>>=20
>> Apparently it doesn't build (debian-bookworm-gcc-arm32-randconfig=20
>> catched it).
>> ARM does provide MAX_VIRT_CPUS and GUEST_MAX_VCPUS which is 128 or=20
>> lower, but that doesn't map (or not properly) with what we have in x86=
=20
>> (MAX_VIRT_CPUS=3D8192 is PV-specific, and GUEST_MAX_VCPUS doesn't exist)=
.
>>=20
>> I am not sure what to do, looks like many things are redundant here.
>
> Maybe non-x86 could surface HVM_MAX_VCPUS as an alias of whatever they al=
ready
> got, much like CONFIG_HVM exists also for Arm, and will likely need intro=
ducing
> for PPC and RISC-V (despite not being overly meaningful for non-x86)?
>
> Jan

I'd say this is the better choice, pending some non-x86 people acking the p=
lan.

Cheers,
Alejandro

