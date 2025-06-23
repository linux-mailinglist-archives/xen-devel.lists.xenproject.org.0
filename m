Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A8AE4800
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 17:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022566.1398407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiob-0007aS-47; Mon, 23 Jun 2025 15:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022566.1398407; Mon, 23 Jun 2025 15:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTiob-0007Yb-1A; Mon, 23 Jun 2025 15:10:33 +0000
Received: by outflank-mailman (input) for mailman id 1022566;
 Mon, 23 Jun 2025 15:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjIQ=ZG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uTioZ-0007YV-FP
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 15:10:31 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:2409::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 325e0eea-5044-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 17:10:29 +0200 (CEST)
Received: from BN0PR08CA0010.namprd08.prod.outlook.com (2603:10b6:408:142::11)
 by DS7PR12MB9526.namprd12.prod.outlook.com (2603:10b6:8:251::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 15:10:26 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:142:cafe::96) by BN0PR08CA0010.outlook.office365.com
 (2603:10b6:408:142::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 15:10:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.1 via Frontend Transport; Mon, 23 Jun 2025 15:10:25 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 10:10:22 -0500
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
X-Inumbo-ID: 325e0eea-5044-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVzLFh1VYTuRnmo5uaRQMe5GRCmTMa2sOJv7a7qGrmHzlLh3O1feKtaBm0c5uIZRD2Mjj9GLJ2dncwlQyv6pTUML0nFeZxl2kt4BydLcL3j6MEQb5MIRQ6Egqv0eKjMBVC3KXT9Rc4Z5fRxLsX2XmXZhupdibUbB6IjO7xbmjtCWl3qyopH7NWXoQaVAcatBQoEX8SrZrIe5v1shf9PwSRvmRQwSnI82BT9TrCm4QS/ICMKsMUQmomSG4lFi7kOvuuNA1mfwIKjEgKfzMOWFooFZ0YsHJDFMr+LlN44keg4Mm5uZgFC2pIMgmVj8t3SymZjsgAL8D5sNm9m4vNj58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqAf6hbSoWeQD5mlTjoRJtxg5ng4Zi6N36njYr0gjKE=;
 b=ErXH8fAKJpR9Vt3mY/yafPznxGhaDBD7MxQDQyOKIc98wdpFkmyEDQTgCGx5sVVCePlyUlRBxY3O6yQfqsGZFHViXTTUl4lFp2cDFDecBXIQ9kVJGjqQXVbUV10EbQJzPIY9sNFeRly0Khv3psy0xw7xrc3sAc+tvqKxPQ/HEEKWjQGkiOm/wYx2CD9WH72YXbbTuysBpJ6f5j4w6T5F+EFOnXgwbHmzCOvkg8v7d1pDGLNSUHHFQt3NIpUpAqWkgXSQuVXey/Quj9/OWO3IU8xZ9j8L3lhLLVShv4UOebJj+9c/GfBj4StB/DJG+4l7Hi722k7d80up7JlCkCWLHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqAf6hbSoWeQD5mlTjoRJtxg5ng4Zi6N36njYr0gjKE=;
 b=kAnE8xEIGZdel5PIOJ56sJRCtL84S1mxxpsRkbUGOzv0Fm0ETmlh80nKhyzOHmH9tTEQXC2VM9YDbQ4sFKJHmMmVQh/82k2uem740flwiY++QL4Kk28ZgWUTocHfMdhLL9FyQNKDDAvgNxXrsRL/YPen2nVdhxufOM+xT8faWTA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 17:10:20 +0200
Message-ID: <DAU0BBS9Y6OY.3H4TCAT3TZ0TM@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 10/12] xen: Rename CONFIG_HAS_DEVICE_TREE to
 CONFIG_HAS_DEVICE_TREE_DISCOVERY
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-11-agarciav@amd.com>
 <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
 <DATXSLGR4W0C.I4IQ77V0K6FH@amd.com>
 <1fc40753-727e-408c-940e-07f3efe1ef48@suse.com>
 <DATZ8OYEKPTI.3OUBFHLNANFIW@amd.com>
 <a751010b-070f-4d03-a5e2-ea58adf05214@suse.com>
In-Reply-To: <a751010b-070f-4d03-a5e2-ea58adf05214@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DS7PR12MB9526:EE_
X-MS-Office365-Filtering-Correlation-Id: 702f293c-8a20-47a9-7dd6-08ddb26814fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djErbjdyTk5OSm1wUkpZeEtJa0xNeC85dEgvVEtld0RROW1rTUk2dFYwMjRs?=
 =?utf-8?B?cGhVNVgrMWxCRjVHaW5yUFkyWExacHh1elhObW50MzRvQWZDVVFTVlZKU0F3?=
 =?utf-8?B?ejhKN1pVWmxjU3NYazBPT0pLUkx2N2JZZXFXMWJ2bERBZHZ1RVd5UCthcHVm?=
 =?utf-8?B?L3p5WFQzNHNUMWxSZXRJcDYxT25uc1Yzc2Y4ajZiK0dIaTZucitCZUkxNEtJ?=
 =?utf-8?B?eDBNTUxremFpYi8vSlVXR2hzN0RaV2RwR01aUHZmNHZZOXlOSXVLWmh3QVQy?=
 =?utf-8?B?NFlrZFV5bzd2ek1pTzJTWWt1UlE2RkM4T0RkdzVud2RCY1o4ZlYyaDR0Mldj?=
 =?utf-8?B?RXlrV04xaWYzRkI3VE9HNWZZVmI3dzdvODlMb2RMWUxsNHFPNWFhMTVWWFFN?=
 =?utf-8?B?blM3Z2piSE85eExGVmZYYWhRdFlHcWMxWkRKZVdKSVNaeXFCVzVEY3JLT3pn?=
 =?utf-8?B?NHpNMUJtTHRGWEQ0bkhmZXpxMlJ6RlJ4NVZRZ0c4eHdDMEJoQ1hlcGF2WFYw?=
 =?utf-8?B?SW1QTnZHRnRjZ3l1TzhzalRmZzdzME1nVWZqSTBOQjhLdTMxd3FRUWNxejVR?=
 =?utf-8?B?ODQ5ZnljVStwdzZPZmp4Yng0SU9KMlJoR2ZiZkorN1BIbHltZGZVa3UyVUF2?=
 =?utf-8?B?NFJWQytIRzdoUHo0TDdpek5JcEhrQVVZTE9aWW5vd0czK2ZJMGxEaWlyaXFw?=
 =?utf-8?B?VnZZVXZrWXJuaHhzR2dweHhmUnlneDRjL2lLYzkyYkZyMHdrRmxZUzNRMFha?=
 =?utf-8?B?eUQ5dWVJcmFtbjY5bjBmYTZUQUJpdUk4YnRKbGNJSDhhWjlRTTN0NTR1Qjhk?=
 =?utf-8?B?SXh4OXVtTk53a1U2ZUtldlhhQlI3ZlEzWThvQXZKaUVLRHRiTmxEdWJYUkM2?=
 =?utf-8?B?bnlLdUVSRW9tNGxzanUwcFlFSTUrcjAwYTU0ZEZzKzlERGZhcFd0cmpXZ3Rj?=
 =?utf-8?B?K0sxK21lRlFtN0NIcTdvdERWd3kyczdpL1lXMnhoSk4rRjdZSDR0SVdvdUNm?=
 =?utf-8?B?b2VqdGxlVHQ5UkZzbHlRcC8wQ3NWaVlkeHZYSWxOSk5XMnJKU0hLUFNXdjd5?=
 =?utf-8?B?czQ3dDB5TXhTSHZXU25NS3JLTC9qQlprVlEyQzJiTjNEdFJJYS9ZZUgzSGFv?=
 =?utf-8?B?amptdWJWT0JlZ2EzMTlXeU5yUm0xOTdWTkkxWm9KeEozQURhK0ZTOUg3MGE2?=
 =?utf-8?B?dnYwSytOczg0RGpsbjc4Y0J0Y3B6QkFPSlVLbGlQUzYwdnkrTTNXWUd5Y1VD?=
 =?utf-8?B?L2JMNEVKa25VQW8wbmFDY0dqVWxqMU1SdWxwRHUvaDdGRDFKTUtsSGRtVE0z?=
 =?utf-8?B?eTBDM1VWRHlyQU9JYThEV3hXSjRHbzJCTFljVTRRN3J3MUw0d0lWeko4cHlC?=
 =?utf-8?B?aU9LZmRoREhiNjNud0hZUDNqdndNTUFJOHo1Yk5NdFVnQkgrNVRhOVVuNVNh?=
 =?utf-8?B?NVhwWXV1U2lQRVVHVnRWWGVXMGZpRXZ1SnRnc2Q5RkU1SHYwdWFpR1lQdWV6?=
 =?utf-8?B?OTdFOEZZR2I1TGU3dlF5Z0szK1FsTy9wVzA3YzJma0FiUXpwY3JweDVnc09M?=
 =?utf-8?B?bGVkSGdXTTVWWDhiWFBycWNSaXl1NDdETU96Rzl6WTFHNU1yU3dkWXExV1hP?=
 =?utf-8?B?VWR6TEdPMC9pdHMxNWJrMVZFTmlwQlFLTkZZVmxUV3JhU2UySUVFNW0wRU0r?=
 =?utf-8?B?cVo0aVRlUUlmZlc2bEtCemI1czNqRjFBVVo4djFpOEI1WVJUVFdqekM3Rm1z?=
 =?utf-8?B?LzFONjRHN3FoM2ZwMHptSlY2L3RlN1doTUpROUZOY2pVYUF2TSsxcWg2WVl3?=
 =?utf-8?B?NXJidVZEWXo2UjR5b1RTQzlWdE10ZzExMVNpSFdaT3RZQlJWZ0hzNmZsZEk4?=
 =?utf-8?B?emZsUTVDWmZERzZ1WnR5L1dRMEFxNVBuSlpjVXFpUlVRTThyNlBMdWxFZVR0?=
 =?utf-8?B?amJJd1VRdVBhN0F3bFlreDY4UGc5Ly8rQktNSGwxRElBWTM3N1ZQb3pKTEx4?=
 =?utf-8?B?U0t1VStENTV1T2VXL0svd25sMUhQN3JlUTcrczAyQ2J1K3QyTE9SUlNGTUZt?=
 =?utf-8?Q?puMyN2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:10:25.4545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 702f293c-8a20-47a9-7dd6-08ddb26814fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9526

On Mon Jun 23, 2025 at 4:26 PM CEST, Jan Beulich wrote:
> On 23.06.2025 16:19, Alejandro Vallejo wrote:
>> On Mon Jun 23, 2025 at 3:44 PM CEST, Jan Beulich wrote:
>>> On 23.06.2025 15:11, Alejandro Vallejo wrote:
>>>> On Mon Jun 23, 2025 at 9:39 AM CEST, Jan Beulich wrote:
>>>>> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>>>>>> Moving forward the idea is for there to be:
>>>>>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>>>>>   2. Full DT support: used for device discovery and HW setup.
>>>>>>
>>>>>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2),=
 while
>>>>>> DOM0LESS_BOOT is left to describe (1).
>>>>>
>>>>> Considering hyperlaunch this feels wrong to me. Did you consider spli=
tting
>>>>> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOV=
ERY,
>>>>> as I suggested on the committers call? You weren't there, but Stefano=
 said
>>>>> he was taking notes.
>>>>
>>>> Some might've been lost is transit, I admit. I don't remember hearing =
about
>>>> a HAS_DEVICE_TREE_PARSE, but it might've very well been me being spott=
y when
>>>> syncing with Stefano.
>>>>
>>>> Having a special HAS_DEVICE_TREE_PARSE doesn't seem very helpful, as e=
very
>>>> arch would have it set.
>>>
>>> Hmm, yes, we don't want or need that. But then what's option 1 about? T=
hat
>>> shouldn't be "described" by DOM0LESS_BOOT.
>>=20
>> It's about x86 using device_tree/ for hyperlaunch. x86 is the single use=
r that
>> doesn't need (2) at all. In the x86 case the same selector that picks =
=20
>>=20
>>>
>>>> I'd definitely like for the "enable support to boot
>>>> several predefined domains from DTB descriptions" to be a single optio=
n for both
>>>> dom0less and hyperlaunch. And be selectable rather than unconditionall=
y selected
>>>> And ideally move towards a future in which both dom0less and hyperlaun=
ch are one
>>>> and the same.
>>>>
>>>> I can do an early rename s/HAS_DOM0LESS/HAS_PREDEFINED_DOMAINS and s/
>>>> DOM0LESS_BOOT/BOOT_PREDEFINED_DOMAINS/ if that helps. I was waiting to=
 do so
>>>> until x86 gains the ability to boot off a DTB to avoid having help mes=
sages
>>>> describing things not yet on the tree.
>>>
>>> I have to admit that it's not clear to me if that would help. As you sa=
y, on
>>> x86 that's not a thing just yet. What I think we need to aim for is to =
not
>>> leave the tree in a state that's more confusing than anything else. Eve=
n if
>>> later (which may be much later) things would get tidied again.
>>=20
>> Ok, how about turning it on its head? Seems like we're in agreement with
>> HAS_DEVICE_TREE_DISCOVERY for Full DT support. There could be a DEVICE_T=
REE_PARSE
>> (no HAS_) that's selected by HAS_DEVICE_TREE_DISCOVERY and DOM0LESS_BOOT=
. This
>> allows x86 to deselect it by not picking DOM0LESS_BOOT.
>>=20
>> Note that x86 cannot select DOM0LESS_BOOT yet, but that's how it'd compi=
le-in
>> hyperlaunch. In the meantime, the tree depends on DEVICE_TREE_PARSE inst=
ead and
>> device_tree/ is gated by DEVICE_TREE_PARSE only.
>>=20
>> Sounds better?
>
> Yes. Except that in the last sentence of the previous paragraph: What's "=
the
> tree"?

By "the tree", I meant the hypervisor tree. I just mean that Kconfig would =
use
DEVICEC_TREE_PARSE for selection purposes and the code would ifdef based on
DEVICE_TREE_PARSE rather than DOM0LESS_BOOT rather than using the latter as=
 a
proxy. =20

> And in device_tree/ wouldn't we end up with unreachable code on x86
> this way (the parts that are needed only by HAS_DEVICE_TREE_DISCOVERY)?

They'd be compiled-out, just as they are now gated on HAS_DEVICE_TREE_DISCO=
VERY on
this patch. device-tree/ as a whole would be gated by DEVICE_TREE_PARSE, an=
d each
individual file inside might optionally be gated by stronger options.

Cheers,
Alejandro

