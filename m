Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E7AE466E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 16:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022507.1398347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTi1n-0003oR-AL; Mon, 23 Jun 2025 14:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022507.1398347; Mon, 23 Jun 2025 14:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTi1n-0003me-6F; Mon, 23 Jun 2025 14:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1022507;
 Mon, 23 Jun 2025 14:20:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjIQ=ZG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uTi1l-0003c9-BE
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 14:20:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f2d795-503d-11f0-a30f-13f23c93f187;
 Mon, 23 Jun 2025 16:20:03 +0200 (CEST)
Received: from MN2PR22CA0015.namprd22.prod.outlook.com (2603:10b6:208:238::20)
 by BL3PR12MB6596.namprd12.prod.outlook.com (2603:10b6:208:38f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 23 Jun
 2025 14:19:58 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::e6) by MN2PR22CA0015.outlook.office365.com
 (2603:10b6:208:238::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 14:19:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 14:19:57 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:19:54 -0500
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
X-Inumbo-ID: 26f2d795-503d-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSpugDQufXYTmpaB3am3478tbLy5usbKjOYAMwm2MTFthJLegRBF4LpI7bnLWm401mtXq1NTRBtAHEeD7URDQCCHeFQ06PocnsQ8sWgDSeEljJZ38eHKQIE4rNmG9LSdi7+YQfl6ZKXnzn8LhDe1zof9c6mr6TOLqtQITMT3n9Wh4hHxZbXbXVOsr+qFyt7vq7uruJHmm7Ex+koXkBLP91+1bEcg+7E5ltG0xsBMxUvMBjFqJJEYITf2VlEeA8eeCT28PzI83TsoWPoyiEaTAM1QWd5bzQaKTWV8DxAGLdlPUdJUZUv59vOgTMR38ZehS9kIssVpPF08RxN5K/tkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH/a4bxTGQA/TIIFCANhDHmItca1Aj/QEbIkhNz4sf8=;
 b=JO4DubX3WH45zmYqo743JC9Pd+zdDDyi+oLw8KSSJ8scBwYYQ6hlnPmtBQ4z6cKIQOvLQNjrgNc6bQOt92NTPM93gFfVTRp41gY6D/t2F4UIfjnctL2HhHLyQFz/AS1grtV6KhI7zvfDRhxNzDxIoWEWwwijn5mvzp02OHNbWlKCsxzSPrV0voYme/8oJElbvXMVtuZz/rcTkifbtVEoKNTDMBRAGl1O5IVykpaxjQavIS4e7XDh6o4LwMe61vNTSCdBh/kQI/uxcXppu0dtCfHxGBdBqssOWKDmxHxbgH5HScwzcp9kHcPAJUDkelutqJxeVyBeGn14UIzKppsK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH/a4bxTGQA/TIIFCANhDHmItca1Aj/QEbIkhNz4sf8=;
 b=gRV1Zvml748zSZb1hV3yn9UeoJ3Wc5Jhq2f9lk4nAHZWwlY+3BJ0W83YCxa9+7sKTTJx6hE6W5s7rjgR/PvXW0vlEDOktIQdBfTi9uxMB1Y2ola9d3uq4XYanFVFseililX0YtzgRtDhuyMwl/Gay8rd8uge/XbfcjJp6rAe8Ow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 16:19:53 +0200
Message-ID: <DATZ8OYEKPTI.3OUBFHLNANFIW@amd.com>
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
In-Reply-To: <1fc40753-727e-408c-940e-07f3efe1ef48@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|BL3PR12MB6596:EE_
X-MS-Office365-Filtering-Correlation-Id: c92b77ce-e379-42d0-793a-08ddb261087b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3oyUEtPZ0VjclFVbG9qcXl1YzFtWnltbFN2R011V0RyaW1qa2ZURzJqQkpk?=
 =?utf-8?B?UnVXNmZzQmJ1VTVkV3NHNUxFUGRIeTFjUHBwUjUvSGxWVFQ2NkhRZ1FpWTho?=
 =?utf-8?B?MGpHSTY3Mll2Y0tNVER3amJuRlI4N1BBa21BZUVXbi80MkQyQ0NEcllTQlJo?=
 =?utf-8?B?aDRscXdCSG9aaGxjZ3NtNEpMUms0OThSQmhyVWx0MHpBVTlrZ2NaZ09reTVD?=
 =?utf-8?B?MUxoNkR6L3BqN0VsYzhqeGN1bEdaMVB5eW1XK2gxc1FrclVqN2xuS21KUVF5?=
 =?utf-8?B?WVpxMCs2dEpld2NIZ3VjZUpCRWRLaWd0cjI3R3NSUnR5WHcvakFLOWlBNi9p?=
 =?utf-8?B?TjZKUEh5eFJkT3E2V1NWK3ZzVVVHcUxQdTh5dTVjVVBQdnVROCtEa1hZb2do?=
 =?utf-8?B?d2QvQkduVjNEbU5rb0VCZzhyQTNUcFJMQ1QxcWw0ZGxiTUNwR0VWTmJTWnUr?=
 =?utf-8?B?b254OG5vYTBTbTd5YW1sWFh1YjF1RDRXK0JMQTZZWDVKNjFEYzlGYXBRYUxP?=
 =?utf-8?B?OFlWNzBoYWRsaEk0Ry9Ndno0WnB3a3djbzZMM3kyN3ZLNGlndHV4MCtGYyt4?=
 =?utf-8?B?eWZ5cE84dTVTemFGci94RVhzY25hUldVOWwxNHBleWpPdk96V1c4VXZNV01G?=
 =?utf-8?B?bEN2dDBsTzc5V3IwSEpzYmtzQjhoUFVsRG1BRjg3eXp0KzdoNFE0UFpCL0lu?=
 =?utf-8?B?VWRxMXJDSkhKY0lRVHNUanluVmtianFkbTBndlozcnlOYnZDc3FTdkNTb2ZL?=
 =?utf-8?B?WHN6ajdSRjBrREJMbU9CazZKY3h2YkFSVlFJMG9rRXhyd2plZU55YXJybE9Q?=
 =?utf-8?B?NlZwZHNmV2hUOWhQSFVCckZZT3pESS90emFiMDhVcXdGM2hEMWNDZEx0d1VG?=
 =?utf-8?B?QUIvcFZGTllWZld0eWxBaXNra1hZNmRxam14cTU3d0dDRWxUSGJGTjlRRzJL?=
 =?utf-8?B?anc3c0poajJ1ZTlFcHhidVJxS2VDYmIybSt5azRSQ09TQzU1VlR6QzNxM0x5?=
 =?utf-8?B?OFRDYktkblgwcUVubHNOWDVNcE1tQUJpamMrenNJZzRoKzAxWG9CV0lBVjA1?=
 =?utf-8?B?c0lUQXk0b1dzSXJXendwa3pzRjdoZ0U5aXIwSDdVMERqdlJwR3diaUFDVzQx?=
 =?utf-8?B?ZjFtam1VS080VU5Cai9XUlZLd3ZXRjAxbTQ4VEpMRDA3eXBxek9za1Q5TDF4?=
 =?utf-8?B?TVh4OHdtdVk4VEZiVlFKRUM5UXJaYjF1TWdjTGNjZXBlbGlTM08vWTZibmJ2?=
 =?utf-8?B?TFdTbENVUVNQTDN0dnBKSkEzOTRzejhjek5JVUpJUlZuWVdJTy9vQ1ZIMGx1?=
 =?utf-8?B?bGVsOHBZS2FNd2pGWndINzNsQ1RGTmI5UW9JM2RiczJMNUhOd0tlNndxd0NU?=
 =?utf-8?B?bGhrckNrMTZJL2tZemNwL2tYdzNpRkxzc2o4VFJ6ajVaRUtjMVpZMXhoWk44?=
 =?utf-8?B?bG5pZlU3Zm9zbTNhRjNoVnVPUklDN3JoWTRFeFk0WGwvT1IvT0FHU2E4bEJD?=
 =?utf-8?B?VnFvbVNZTWc0WmtkT3V5emtmQ2wySFpZNXh3cnJTT1ZEK2dyK3o2Y0REaWll?=
 =?utf-8?B?bEU3N2tiR3A2TWV5dVVOSzJiVk1rUG1WU2I5T0dqM2NSRU8zZzZ1cnJ3ckZO?=
 =?utf-8?B?Qm81MlUrVm5vb1dBZVRtY3dCM1BwOUdqY2RZdkxxK3oyRUxRTjd2V25NNDgr?=
 =?utf-8?B?eDdxRERLQjdFMmdKYlY0T2dESnFaZ1VxTkpTZFlFcEloQlk1bzNXZzc5eDJ2?=
 =?utf-8?B?S3FnaFM4UnV0TW00b0JNNnNwUEZaVkNpRlN3WGpKRW8wbFZWMmxKYmVxZ1FT?=
 =?utf-8?B?UEhZZndDS21SUEFoOVZXRVBiQjJOdmhKVU1Jem5oUUZoR2ZVUUxqREZDNXZB?=
 =?utf-8?B?eGJaNFlWQXdLVExTd2lVSEpDVjh1ZE5YZkVPV2VsNXYreFRsT1ltbDdIckp4?=
 =?utf-8?B?ZGsrSEgzNlpXeDFKS3NGUURIUVZBendkMFgrbkxwQzNrUHNVNERaMmlkNG5N?=
 =?utf-8?B?a3RhaUJpZm1kZ2NQcU8zY1pKeTBhY1V0ZjNhUHBkR1p2QUF2bHV3WXVSRzZX?=
 =?utf-8?Q?EQGZOU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:19:57.9934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c92b77ce-e379-42d0-793a-08ddb261087b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6596

On Mon Jun 23, 2025 at 3:44 PM CEST, Jan Beulich wrote:
> On 23.06.2025 15:11, Alejandro Vallejo wrote:
>> On Mon Jun 23, 2025 at 9:39 AM CEST, Jan Beulich wrote:
>>> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>>>> Moving forward the idea is for there to be:
>>>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>>>   2. Full DT support: used for device discovery and HW setup.
>>>>
>>>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), w=
hile
>>>> DOM0LESS_BOOT is left to describe (1).
>>>
>>> Considering hyperlaunch this feels wrong to me. Did you consider splitt=
ing
>>> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVER=
Y,
>>> as I suggested on the committers call? You weren't there, but Stefano s=
aid
>>> he was taking notes.
>>=20
>> Some might've been lost is transit, I admit. I don't remember hearing ab=
out
>> a HAS_DEVICE_TREE_PARSE, but it might've very well been me being spotty =
when
>> syncing with Stefano.
>>=20
>> Having a special HAS_DEVICE_TREE_PARSE doesn't seem very helpful, as eve=
ry
>> arch would have it set.
>
> Hmm, yes, we don't want or need that. But then what's option 1 about? Tha=
t
> shouldn't be "described" by DOM0LESS_BOOT.

It's about x86 using device_tree/ for hyperlaunch. x86 is the single user t=
hat
doesn't need (2) at all. In the x86 case the same selector that picks =20

>
>> I'd definitely like for the "enable support to boot
>> several predefined domains from DTB descriptions" to be a single option =
for both
>> dom0less and hyperlaunch. And be selectable rather than unconditionally =
selected
>> And ideally move towards a future in which both dom0less and hyperlaunch=
 are one
>> and the same.
>>=20
>> I can do an early rename s/HAS_DOM0LESS/HAS_PREDEFINED_DOMAINS and s/
>> DOM0LESS_BOOT/BOOT_PREDEFINED_DOMAINS/ if that helps. I was waiting to d=
o so
>> until x86 gains the ability to boot off a DTB to avoid having help messa=
ges
>> describing things not yet on the tree.
>
> I have to admit that it's not clear to me if that would help. As you say,=
 on
> x86 that's not a thing just yet. What I think we need to aim for is to no=
t
> leave the tree in a state that's more confusing than anything else. Even =
if
> later (which may be much later) things would get tidied again.

Ok, how about turning it on its head? Seems like we're in agreement with
HAS_DEVICE_TREE_DISCOVERY for Full DT support. There could be a DEVICE_TREE=
_PARSE
(no HAS_) that's selected by HAS_DEVICE_TREE_DISCOVERY and DOM0LESS_BOOT. T=
his
allows x86 to deselect it by not picking DOM0LESS_BOOT.

Note that x86 cannot select DOM0LESS_BOOT yet, but that's how it'd compile-=
in
hyperlaunch. In the meantime, the tree depends on DEVICE_TREE_PARSE instead=
 and
device_tree/ is gated by DEVICE_TREE_PARSE only.

Sounds better?

>
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -14,7 +14,7 @@ config CORE_PARKING
>>>> =20
>>>>  config DOM0LESS_BOOT
>>>>  	bool "Dom0less boot support" if EXPERT
>>>> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>>>> +	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD=
_HELPERS
>>>>  	default y
>>>>  	help
>>>>  	  Dom0less boot support enables Xen to create and start domU guests =
during
>>>> @@ -85,7 +85,7 @@ config HAS_ALTERNATIVE
>>>>  config HAS_COMPAT
>>>>  	bool
>>>> =20
>>>> -config HAS_DEVICE_TREE
>>>> +config HAS_DEVICE_TREE_DISCOVERY
>>>>  	bool
>>>>  	select LIBFDT
>>>
>>> This select imo ought to move to HAS_DEVICE_TREE_PARSE, unless I misund=
erstand
>>> what LIBFDT covers.
>>=20
>> Doing so would preclude compiling it out on x86 when hyperlaunch is not =
there.
>> LIBFDT is very much essential on arm/riscv/ppc, but not so on x86.
>
> Okay, but _something_ has to select that on x86 as well, once hyperlaunch=
 is
> going to need it.

DOM0LESS_BOOT would do so once required. In the proposal above that'd be se=
lected
by DEVICE_TREE_PARSE, which would be selected by DOM0LESS_BOOT.

>
>>>> --- a/xen/common/sched/Kconfig
>>>> +++ b/xen/common/sched/Kconfig
>>>> @@ -67,7 +67,7 @@ endmenu
>>>> =20
>>>>  config BOOT_TIME_CPUPOOLS
>>>>  	bool "Create cpupools at boot time"
>>>> -	depends on HAS_DEVICE_TREE
>>>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>>>>  	help
>>>>  	  Creates cpupools during boot time and assigns cpus to them. Cpupoo=
ls
>>>>  	  options can be specified in the device tree.
>>>
>>> This similarly looks wrong to me. Whether to create CPU pools is purely=
 a
>>> Xen-internal software thing, isn't it?
>>=20
>> In principle, it should be HAS_DOM0LESS and likely will be later when I =
hook it
>> for x86. I was waiting for x86 needing such a change to use the binding.=
 Would
>> you rather have the change done now?
>
> See above - my main concern isn't with what is introduced early or later,=
 but
> what the overall (intermediate and final) state of the tree is going to b=
e.
>
> Jan

I think this latest proposal addresses the concern. Let me know what you th=
ink.

Cheers,
Alejandro

