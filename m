Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B56C8EB15
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:06:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173961.1498945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcdX-00009A-Eq; Thu, 27 Nov 2025 14:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173961.1498945; Thu, 27 Nov 2025 14:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcdX-00006o-BK; Thu, 27 Nov 2025 14:06:19 +0000
Received: by outflank-mailman (input) for mailman id 1173961;
 Thu, 27 Nov 2025 14:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vOcdV-00006f-QN
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:06:17 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf5c17b-cb9a-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 15:06:15 +0100 (CET)
Received: from CH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::19)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Thu, 27 Nov
 2025 14:06:08 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:1ee:cafe::9d) by CH5P222CA0007.outlook.office365.com
 (2603:10b6:610:1ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Thu,
 27 Nov 2025 14:06:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.0 via Frontend Transport; Thu, 27 Nov 2025 14:06:08 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 08:06:06 -0600
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
X-Inumbo-ID: 3bf5c17b-cb9a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Idkq4YeYeWbWGBSno6h20BKh5qWvyPPhKT4vj9482Nn5HFxe+9nnpQ1wxdPz83mH3g44NehqayQzuRyEK4dtRJrVNb1K/FSeBx9bRpR//bt2rlZz8io4csSH6BraS1IIVc9RKTKMEoh65DL6fjoP8yqDmpDEvAuwlFuS4F4ZASH2Rx13Rxsy6B4B2UYtxHc3X0obWy7iGPKlt74CMw285zJGLncG/M+Jc8Hi00kYtxrV6balx0UtLww+Q9zG21TB23zoktqAO7GovbyVuZW6ZGk2160UhAfoxuvg3CEWrtJY0jHnCEWOn3UEnTbAFgW95xbahVUDAGueIy+CZB3PNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWlQ8IXeW+nICMCUflGKxsnmKY95bPnyFgfdCZtg6pk=;
 b=jQppsqkrmRcmxsBruoac2BUZGLXQBffuU8eeGuEVt/uxNRACtwhtiGfPgSjPHpYuhxMPoPopXrM1FBeXiwkqNxN/IkbaBSe/2SCH+IEH9+D/rzzsKikok1kd8yn3s4yX8uhB5Bi3r0WFfyIULfAtishSA4yJBlpqykmofsPGLToqeCiK9y99P1oD5K6fmZLzBTjWeeXlMSuDAElN8gqCv1q9wEIdgoLYXln9lLQZhNhfe2+F5Pa9Qs4dlXD8ZLECTooFWtjEOtlFS6OcMDAXqEQNqIfQH/QHmPdOL1wapWLrMvFn024jveF/I6BN1RPJmHXs2PTjF+uTVEYn6BqSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWlQ8IXeW+nICMCUflGKxsnmKY95bPnyFgfdCZtg6pk=;
 b=w3oVFZ2zZjTjkp/JJ01134+GN0UTQKYLlAJJTtbiCz3SLuLGgbknXOZX1u46/EO4Z8wyHhhCeTX9BSna4Kr/anb0eZlQ8Are1MT82wO8/DxQbp5xqFGc4wmVRt90JsE+AGcDK1WLaf+DXhjge2wD1Nh7MZ0pNpK1Q/mFNTPv0SU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 15:06:04 +0100
Message-ID: <DEJJ9NEIB99E.1U013WYUA7TZO@amd.com>
Subject: Re: [RFC PATCH 03/11] x86: Add x86_vendor_is() by itself before
 using it
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-4-alejandro.garciavallejo@amd.com>
 <d71b6b55-6745-4ba4-9a4f-d5e7b08f0aec@suse.com>
 <DEJI6U37EMDI.1F7QHW1I7WV76@amd.com>
 <1ea5b7d2-6d73-4133-bf32-085559f6df41@suse.com>
In-Reply-To: <1ea5b7d2-6d73-4133-bf32-085559f6df41@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: b9021241-3d90-4a28-4fbc-08de2dbe1d19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1hoa1Q4TS9hNHJwbXUwSmtUM29DRlZka2NkRHdyRkR1YmpLZURaMlpzMWVm?=
 =?utf-8?B?b2EzbHEzWW5uOFlKSjFISy9zNVlTMElscjEvdndYWmx1c2R1TWp1R2JKMWRW?=
 =?utf-8?B?NVg4c3FwdkROMlBqQXJlR0E0UGEyaFFtQjFoRDFFaWtBUWU2UVNTK0RyNHhQ?=
 =?utf-8?B?T08zMzNQbUhCUXJpWlFVZzZxNFRRZ0IzakdhSE5JbGtLZk9UMHE4V0s5WVF0?=
 =?utf-8?B?N3E1S3drMUU5UTV2OUorOGNWTVFtL1Yrc3AxbStlQm5lcjFNUjJidnM1VWxq?=
 =?utf-8?B?TDk4WllYVjV2MllIMGhQdkRyU2diTlI1dUM0NldEOStDSU5FNjdvNUx0VWs3?=
 =?utf-8?B?RGliQlAwMFl3OXBvd2h0NmlBQnRZKzIwaUVtK2J4b0NvaFFnMjFyMDRoNnEy?=
 =?utf-8?B?STl3WTJ1M2pDejBTWUNzN2kxenE1SVJiT2pWcXdGeERDRUpIaXlselE3ZXJL?=
 =?utf-8?B?cm1yS2dqM1F6S3JKZlhGZHQwcnJRcW84Yk9ab2V1QWRKUlNsdi9WY21qZFVU?=
 =?utf-8?B?eEUxZWtkaGtWVk1xM0ZNczJOcVZQZUN1MDRXdDZsWmxnWlIwMldpcVkvNS9w?=
 =?utf-8?B?SysyUG5VU2pXZmo3R0dKRHhtQk9hNUNoakR1SDV1ZmltTDFhYi9reTdiWlZS?=
 =?utf-8?B?c2ZoNXJYbmhZNThhZ0Zkc0JkdkprVG5MM2ZMTmNjWTRZeHNjL0lZNUZUMFEz?=
 =?utf-8?B?ZlpFWTNvQWhqenZjWjQrdXFwL2t4ZGVUYVRmMmt1djlMSXFHbXlYZ1I4a0ZP?=
 =?utf-8?B?L0FPUWtNRDcwcnFmU2YrM0puRDZVZjBDNm55K3dDZGdKd21sKzk2TWExT01t?=
 =?utf-8?B?bU5OUlhxK1ErMU80b09mWWdTUlBCdUJiQnIvcWRncno5Y08vaXlaMnczSE1j?=
 =?utf-8?B?RTlnTDh3MjZDVndYbytQQTJNYkJpVERFaGZMS2hNSVRQM3Y3c2x6dFVoUXZK?=
 =?utf-8?B?bXNTVTRvMldaempLOFhqdFQ5RGw2MFJsZjdRWXJMMEpsMXd4Qml4ZnFMdGFU?=
 =?utf-8?B?dnRNRWFMS1JEUWlVQ0FNZmwrRFdWY05DUjFINmhlNUY1dk5rL2NLRCtRZGlt?=
 =?utf-8?B?MHdwRDhJNzNZQ2d1ZXZzUzZUc3Z3ZXg5aS9nUUJZbW15RXYyc1dvZ1dBUXlU?=
 =?utf-8?B?elY4Y0xWODlnc281OGd4SWU2WXZPTWo4SFI0YkxMQmRhRng3ZGpIWkhzbTlF?=
 =?utf-8?B?bWFZMHI4YlNKKys1SVNxVzYwQ3MxRUhEQWpFUmp4MWxwaWdoOStCZVo4Q3FR?=
 =?utf-8?B?UU9QU3dObHV5c1oxQ2lNbjN0NElRNzVqUHh3M0hpeWxWaW5BV1pSSE5pRUY0?=
 =?utf-8?B?THltdUhBNW80WkEwUi9tdkQwUGQxaHZWdmttTTZ4TVV5RnpLYzZSV0lOandD?=
 =?utf-8?B?RVVhckRUdXROZlZnTHJvbmpRakgyQldiT3hZejZRYjJtQmVzSVBYSWhXRCt4?=
 =?utf-8?B?RXBEMjd1SFA4a1ZwYWRSMFRjQnJLOHBuQUVRL0pQTzlibUtMRmFlbmtvWFVY?=
 =?utf-8?B?UTVjZkc5S1RzWGtyM0NYMW9KdU9GNXVicnJ6bUgzaS9sUVludlZ3SVVkRFYx?=
 =?utf-8?B?dkZVaFRyZnlYWG1zeU9iRmZ5a3VteHE3UitDNEpZYzR6K29DWUwxeUJzZlBs?=
 =?utf-8?B?S0NFendHZU1jVlVhTnp5TWZYR0NwUUNkZ3RqMzVGVDFyMkh6ell2NkNNRUZL?=
 =?utf-8?B?R1VaYkN5YTAzRGlzQyttTCtUbVVVYzZNanYwN1RTTUVqdWFDcnlTOGVHUU9w?=
 =?utf-8?B?aEZjZk9IcFpCSzZKcHoxbmpkemM3bmV1WnBKNmxRNlBCcmgyd3IweGZiRDJZ?=
 =?utf-8?B?SExXTk9LN3IxMmQvVitPbmIzRXN3eVY5MjA1RkhFdEdzZHFqSmlJOGx5UFVx?=
 =?utf-8?B?UjBScHFWbVlvY0szbkxLUmNYZVVWU0NMcmFadzlHdkd6Uk13SVJQNzJTelBB?=
 =?utf-8?B?QmppOXVJSDNvc1pUNXhyczBuc29zbEdkNVFJaG9KVklka1ZoMTV5ZHhHZFNt?=
 =?utf-8?B?Y0ttRWVCdTQvNFdoNXA3NWZiUTZDS0h2bGExYkVvcnk4MWZ1SklkUEt4Z0I4?=
 =?utf-8?B?bThpemhoYmQyaGNiYWFybVdYeWZaTDE1Q1o4ckhObXBaV3VaRVQ0emxmajlr?=
 =?utf-8?Q?lW7k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 14:06:08.7818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9021241-3d90-4a28-4fbc-08de2dbe1d19
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287

On Thu Nov 27, 2025 at 2:37 PM CET, Jan Beulich wrote:
> On 27.11.2025 14:15, Alejandro Vallejo wrote:
>> On Thu Nov 27, 2025 at 11:46 AM CET, Jan Beulich wrote:
>>> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>>>> + * A runtime check at the time of CPUID probing guarantees we never r=
un on
>>>> + * wrong hardware and another check when loading CPU policies guarant=
ees we
>>>> + * never run policies for a vendor in another vendor's silicon.
>>>> + *
>>>> + * By the same token, the same folding can happen when no vendor is c=
ompiled
>>>> + * in and the fallback path is present.
>>>> + */
>>>> +static always_inline bool x86_vendor_is(uint8_t candidate, uint8_t ve=
ndor)
>>>
>>> I fear the comment, no matter that it's pretty large already, doesn't m=
ake
>>> clear how this function is to be used, i.e. how for this being an "is"
>>> predicate the two arguments should be chosen. My typical expectation wo=
uld be
>>> for "is" predicates to apply to a single property, with other parameter=
s (if
>>> any) only being auxiliary ones. Maybe it would already help if the firs=
t
>>> parameter wasn't named "candidate" but e.g. "actual" (from looking at j=
ust
>>> the next patch). Or maybe (depending on the number of possible differen=
t
>>> inputs for the first parameter) there want to be a few wrappers, so the
>>> "single property" aspect would be achieved at use sites.
>>>
>>> Then I see no reason for the parameters to be other than unsigned int. =
(Same
>>> for the local variable then, obviously.)
>>=20
>> I could also call it x86_vendor_in(), to mean it's a set membership chec=
k,
>> leaving its prototype as:
>>=20
>> bool x86_vendor_in(unsigned int actual, unsigned int bitmap);
>>=20
>> bitmap is a special kind because literal 0 has a special meaning (unknow=
n). So
>>=20
>> I'd expect x86_vendor_in(X86_VENDOR_UNKNOWN, X86_VENDOR_UNKNOWN) to retu=
rn true
>> when UNKNOWN_CPU=3Dy. One way to alleviate complexity would be to promot=
e the
>> unknown case to a first-class bit. It's not like it's zero for any good =
reason.
>>=20
>> As for the what goes in the first parameter, it's invariably the x86_ven=
dor
>> field of cpuinfo_x86 (for boot_cpu_data), or of any cpu_policy.
>>=20
>> This is meant to replace checks on vendors, so a natural (and universall=
y used)
>> pattern across the codebase is to have a runtime variable checked agains=
t a
>> constant. Here's a longer list of patterns and expected transformations.
>>=20
>>   from: cp->x86_vendor =3D=3D X86_VENDOR_AMD
>>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
>>=20
>>   from: cp->x86_vendor !=3D X86_VENDOR_AMD
>>     to: !x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
>>=20
>>   from: cp->x86_vendor & X86_VENDOR_AMD
>>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD)
>>=20
>>   from: cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)
>>     to: x86_vendor_is(c->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON)
>
> There's a mix of c and cp up from here, but I hope the distinction isn't
> relevant in this context. What is relevant though is that you shouldn't
> be using struct cpuinfo_x86's x86_vendor field anymore. See the struct
> definition.

It indeed isn't relevant. Fair enough, I was misled by its use in cpu/commo=
n.c

>
>>   from: !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
>>     to: !x86_vendor_is(cp->x86_vendor, X86_VENDOR_AMD | X86_VENDOR_HYGON=
)
>>=20
>>   from: cp->x86_vendor =3D=3D X86_VENDOR_UNKNOWN
>>     to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_UNKNOWN)
>
> For it to be clear what the "is" applies to, all of the above would imo
> better be x86_vendor_is(c, X86_VENDOR_...) or
> x86_vendor_is(cp, X86_VENDOR_...) at the call sites. The c / cp are what
> I called "auxiliary data" elsewhere, and the property checked clearly is
> the 2nd argument. To achieve this you could introduce a wrapper macro,
> which would do the de-ref of the ->vendor field. (As a prereq, struct
> cpu_policy would then also need to gain a "vendor" alias of the present
> "x86_vendor" field.)

I'd be fine with that. It'd also trim the diffstat substantially by allowin=
g
a number of cases to become single-line checks rather than splitting

>
>> And switch statements converted to if-elseif chains.
>
> I've voiced concern towards this elsewhere.
>
>>> First: Would one ever pass X86_VENDOR_UNKNOWN for "vendor"? The next pa=
tch,
>>> for example, specifically doesn't.
>>=20
>> I don't think so. There's definitely not any existing case atm. Still, I=
 think
>> it's better to preserve the invariant that the follwing transformation:
>>=20
>>   from: cp->x86_vendor =3D=3D X86_VENDOR_X
>>     to: x86_vendor_is(cp->x86_vendor, X86_VENDOR_X)
>>=20
>> holds for every vendor variant in the "everything compiled-in" case.
>
> Otoh the code could be simplified if you simply rejected the passing of
> X86_VENDOR_UNKNOWN.

How would this rejection go? Something like this at the top?

  if ( vendor =3D=3D X86_VENDOR_UNKNOWN )
      BUG();

I'd rather have something that causes a compile-time error, but I'm not sur=
e
how to cause a compile time failure when a constant matches FOO.

Surely there must be a way...

>
>>>> +    /* single-vendor optimisation */
>>>> +    if ( !IS_ENABLED(CONFIG_UNKNOWN_CPU) &&
>>>> +         (ISOLATE_LSB(X86_ENABLED_VENDORS) =3D=3D X86_ENABLED_VENDORS=
) )
>>>> +        return filtered_vendor =3D=3D X86_ENABLED_VENDORS;
>>>> +
>>>> +    /* compiled-out-vendor-elimination optimisation */
>>>> +    if ( !filtered_vendor )
>>>> +        return false;
>>>> +
>>>> +    /*
>>>> +     * When checking against a single vendor, perform an equality che=
ck, as
>>>> +     * it yields (marginally) better codegen
>>>> +     */
>>>> +    if ( ISOLATE_LSB(filtered_vendor) =3D=3D filtered_vendor )
>>>
>>> So one may pass a combination of multiple vendors for "vendor"? Is so, =
why
>>> is the parameter name singular?
>>=20
>> Yes, it's a bitmap. Parameter could be in fact "bitmap", except the 0 ca=
se is
>> a special.
>
> We have empty bitmaps elsewhere, as a more or less special case, so this =
doesn't
> look overly concerning.
>
> Jan

Ack,

Cheers,
Alejandro

