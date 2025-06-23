Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5F4AE41CB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 15:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022322.1398107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgy4-0006Dz-Cx; Mon, 23 Jun 2025 13:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022322.1398107; Mon, 23 Jun 2025 13:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTgy4-0006C7-AC; Mon, 23 Jun 2025 13:12:12 +0000
Received: by outflank-mailman (input) for mailman id 1022322;
 Mon, 23 Jun 2025 13:12:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjIQ=ZG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uTgy2-0006Bz-Vj
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 13:12:11 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2408::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5ffc7a8-5033-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 15:12:01 +0200 (CEST)
Received: from SJ0PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:33b::14)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Mon, 23 Jun
 2025 13:11:56 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::55) by SJ0PR05CA0009.outlook.office365.com
 (2603:10b6:a03:33b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Mon,
 23 Jun 2025 13:11:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 13:11:56 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 08:11:52 -0500
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
X-Inumbo-ID: a5ffc7a8-5033-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzvruU7S2Jmj2HGic6maz/fPFXS8AIWR/ijP0AmcMLT3FGz6xrLS3lZUNwRVX3mGDb241ozsfkMQUS0btdr8JtaVk0yxkm+By+znOGctbMhmff00Ay1CezBGMeNt9FsFdlbjJtXxdDWZ57wW+VoL/Fp1uZTfgOCNp8idmnl5mSvHCaL96yrtBiakf90cdGKK5su9NQeAcy/eRZ6L75vNUGwEzxZVw2ASg8InnTYRQgVouhjPHk2lFfijUWqnLkFiCRT9HDRv7tF34Mo4+BkoSXO1/Q9OjlrtPz06/1r05nQsxcAexLwGQck/+iKFZmya9ilEUaMzHIEQmVPfkihgFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8eHeTfqHMNf5Ka4MMWXDpQbPfJva5UEjppPrs3seo8=;
 b=E/AkvMHW9xykNwXERgb53DXWUo+aiNc/EILB0Nq2cS/PKeAsvtKbIHb3e0CDAsLZhnGYVEy+gO1cth9A0ACZ46Ly8htu8WoqAtGpqZ6KI9rmDZJ/g7UrjWbf3LRbOt+VAx4pEwTor7W5Hf82Awh5jMCzeACgccYYN3n6+nWSfGVnK4gUKcjEyI2ZcCAbmHEursjjIvdQuYTyZAth2w850/kcmqeaAXXZywLJN+iS2ehLNRf1oWrcm4sPGtxBYKEa2ZD4MDH0rc+fPCHN8ZdB2D/lt3bqBebuFgD2jZkuUAEz+kTK0lDNUBheXHvYVPb+RsVNz8xoGuq3Gl9p/PztSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8eHeTfqHMNf5Ka4MMWXDpQbPfJva5UEjppPrs3seo8=;
 b=U7qWro2Xwp+R+o+DJmPaYSZPa65oe39IUx1e1UlbovfYU5XP+QpV9nJsAnrvpaqjiYGa64PgaFwcYBDrlVRTi5ja1GSExbYB841/Rydv/sQnzf8CS9gYuGFllaI+AgD3VN1c7/X3xccXCcN7SGM9N7ZhWuiekpLZQD6UZ6XLY6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 15:11:50 +0200
Message-ID: <DATXSLGR4W0C.I4IQ77V0K6FH@amd.com>
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
In-Reply-To: <490ee7bf-cb10-43e3-9416-9a68e7529b96@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|LV3PR12MB9234:EE_
X-MS-Office365-Filtering-Correlation-Id: ffce3b22-77ce-4733-5ddc-08ddb2578790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGE5WmdhZlJ3eXVhb0k0V3dQTksxTXU0MUVneEt1SUhVUFJwdTBGNHNBU2Ro?=
 =?utf-8?B?Uytmcml5akpvV3M1TEllNFNMNmhOZ0EyL3pwbC9HMlVWQnhtemxUTW9UeXQv?=
 =?utf-8?B?K3E3V3M3bTZkZUFHaG1ObFk2enFyK1ptMWozdFVhaWtPU2FmanlhRGd4dHkz?=
 =?utf-8?B?SGUyYnZMTlh4T0JnRDYrUnRoRkxFZG1GMlB6YytPanJKZ2p6Y1RCYmdOb3Mz?=
 =?utf-8?B?aDR3aHFBVDYwZU04T3hkUjk0UXpMNnhiTzZPR0pkWnlyaFpiU0VJejNQV0ZD?=
 =?utf-8?B?NzFKamRZN1Y3b3dwVjlWdkZ4V0UwdjkvcnB3YiszVjZsZURDWVkxeVVFNUF3?=
 =?utf-8?B?SWlQZm1hTTVndlZCRGlSR2w5Y29xSUUwUTFzOXNEaU92QUIzZVlkS21iQ0NI?=
 =?utf-8?B?L2QvUldIek9qR1pHekpqbVpuMlY2bmRpcUMzMXMzT1kxRWpnQUFBSTBXK1By?=
 =?utf-8?B?aStDbG4wS0NJcWFIT2xSWDFWZTVPb0ViLzJXS0Rpc1ZjRVRuSmMwcXRYYTBx?=
 =?utf-8?B?OUdiajQ5TC85VHAxTU1IamliN01jQytlaDNyMzdQQzdtNWNNWHI5Y29kamor?=
 =?utf-8?B?N3FERzRZWEwwZTR0SDRFYmo5L3loRGpBNW5UUGUxNVBMZWE3YkY2NkFnN0t5?=
 =?utf-8?B?NzQ1bWJtczlNb2Vtalp0UDFkN3l5cXdFMVNiK3JjeFF2VEJ1Y2tOVTRLOGxu?=
 =?utf-8?B?ZEdpYXI2TE8zeWhydlovT29Ld0hqdnp0YzNjM0wvVDlsVXBrb0FROERqeUFE?=
 =?utf-8?B?a2xrNUNiRUhIMW1RdUsxaVJRQ2dXdGYvU21lOGFZSWtMUnlVOWw4TnhJaE1j?=
 =?utf-8?B?SC9LODJjV3lSZW9WeHA4UWt2VHpKeUhnZU5hRzIyZ3BBNCtTTnFVd01xMkhw?=
 =?utf-8?B?RUM0SUM1bjRDbHVmTWlPYXI3RUp2R3FvR3NTMkhLdWk4cFRBamVEUHBla0lL?=
 =?utf-8?B?QW5kN1BlMWtjTStVNk9aTDJxM1RuRUxOODU5OWZVd21VNFA4YmhaT0oyTUpU?=
 =?utf-8?B?aTN0cXhTem1DTkpYazhjOG8rWjZ6V0tJcnJBQlJrdmEzMER4RkgxWHRJRFox?=
 =?utf-8?B?QnE4TGUwSUhGaFJQL2RqTXh4aDRoTkViWm84bWQ3SkRRV1JDcmFhY0NVN0JP?=
 =?utf-8?B?MG1wNW83ZUZ1dy9EZkhaZXBNVnNEM1dHN2pidVJxaWkxelB0dnhORUI2bXFS?=
 =?utf-8?B?NDkzd3dBdU1DT0JGN0FRTVR3M3l1SnNycHQ1WTZVVzNmUGd1Y0VHSThDWVNj?=
 =?utf-8?B?OTZtRnZ2dmlEcUNWZHN3N0VlRGFmeWllZnpKaVZMcEdZMVhHUGJ0Q3JTZlla?=
 =?utf-8?B?MVFhWGpOM050TE9Ha2poRUEwSS9ScDltcVlFRHFkcUhxcThvYjdDeEU2M2do?=
 =?utf-8?B?RXVpYWp6NHdERWNWOXgzR01hdzBiQ0Yvd0toakdFQUxHd0pmUHc5YmVCVUNs?=
 =?utf-8?B?NWhoMTlrUmgrYUlWcGRwOXo5VWQxTWYvdDMxbFFKMnhkd0dkNlRubmVFWC9B?=
 =?utf-8?B?MnFXT0xmZ05Md2NsdFRkTGNXYVJUWTMwcjNUSVlvWVozR21hdVU5dFByTTBP?=
 =?utf-8?B?enB1b0ZyQUdDUnVESmkvN1h5VkVlSEtNaWpVTHBHeGRSWWhkN2QvSXo1ZmtG?=
 =?utf-8?B?NGY4dENMNnFmU3hlazZTWkNaMEozdzNqVVd2d0JDaFVUUDZpVjR2VWJEakQ4?=
 =?utf-8?B?MXNFMGYrNzRLZGQzRUVKZ2lNTGNIVEV5UTdETHloOUI5VTdLeVltWUE5amR5?=
 =?utf-8?B?MkRtdHFHU1N5U2ZrZGJGcEQrVnpwOWZjOGdTNjFadUxuZ01jOFk1SjZJYXpl?=
 =?utf-8?B?OHVuZDdTaS9FN2VYL0Q2Z3RNY1hVdmxkRnc1TVNWcDRjRm5TVHBrTmFLM1ZQ?=
 =?utf-8?B?MlB5dUJkQmlhYmQrVVo3THI3L2FpYnpDaitoVS91VUttWmVIMGIvMjBhVks5?=
 =?utf-8?B?NkxvZkJSMUR5Y0R6NWRyckxQbDNobi80U1lWek01SlI4VUsyS0pPUUxoMWty?=
 =?utf-8?B?MGJzd0dWdUVRcEVjZ0p2MmxDTHNmSzA1dWhRTW03Mjlta2o1U0JkSXVpcmJ0?=
 =?utf-8?Q?uq/8Lk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:11:56.1424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffce3b22-77ce-4733-5ddc-08ddb2578790
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234

On Mon Jun 23, 2025 at 9:39 AM CEST, Jan Beulich wrote:
> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>> Moving forward the idea is for there to be:
>>   1. Basic DT support: used by dom0less/hyperlaunch.
>>   2. Full DT support: used for device discovery and HW setup.
>>=20
>> Rename HAS_DEVICE_TREE to HAS_DEVICE_TREE_DISCOVERY to describe (2), whi=
le
>> DOM0LESS_BOOT is left to describe (1).
>
> Considering hyperlaunch this feels wrong to me. Did you consider splittin=
g
> HAS_DEVICE_TREE into HAS_DEVICE_TREE_PARSE and HAS_DEVICE_TREE_DISCOVERY,
> as I suggested on the committers call? You weren't there, but Stefano sai=
d
> he was taking notes.

Some might've been lost is transit, I admit. I don't remember hearing about
a HAS_DEVICE_TREE_PARSE, but it might've very well been me being spotty whe=
n
syncing with Stefano.

Having a special HAS_DEVICE_TREE_PARSE doesn't seem very helpful, as every
arch would have it set. I'd definitely like for the "enable support to boot
several predefined domains from DTB descriptions" to be a single option for=
 both
dom0less and hyperlaunch. And be selectable rather than unconditionally sel=
ected
And ideally move towards a future in which both dom0less and hyperlaunch ar=
e one
and the same.

I can do an early rename s/HAS_DOM0LESS/HAS_PREDEFINED_DOMAINS and s/
DOM0LESS_BOOT/BOOT_PREDEFINED_DOMAINS/ if that helps. I was waiting to do s=
o
until x86 gains the ability to boot off a DTB to avoid having help messages
describing things not yet on the tree.

>
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -14,7 +14,7 @@ config CORE_PARKING
>> =20
>>  config DOM0LESS_BOOT
>>  	bool "Dom0less boot support" if EXPERT
>> -	depends on HAS_DOM0LESS && HAS_DEVICE_TREE && DOMAIN_BUILD_HELPERS
>> +	depends on HAS_DOM0LESS && HAS_DEVICE_TREE_DISCOVERY && DOMAIN_BUILD_H=
ELPERS
>>  	default y
>>  	help
>>  	  Dom0less boot support enables Xen to create and start domU guests du=
ring
>> @@ -85,7 +85,7 @@ config HAS_ALTERNATIVE
>>  config HAS_COMPAT
>>  	bool
>> =20
>> -config HAS_DEVICE_TREE
>> +config HAS_DEVICE_TREE_DISCOVERY
>>  	bool
>>  	select LIBFDT
>
> This select imo ought to move to HAS_DEVICE_TREE_PARSE, unless I misunder=
stand
> what LIBFDT covers.

Doing so would preclude compiling it out on x86 when hyperlaunch is not the=
re.
LIBFDT is very much essential on arm/riscv/ppc, but not so on x86.

>
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -6,9 +6,9 @@ obj-$(CONFIG_HYPFS_CONFIG) +=3D config_data.o
>>  obj-$(CONFIG_CORE_PARKING) +=3D core_parking.o
>>  obj-y +=3D cpu.o
>>  obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
>> -obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
>> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D device.o
>>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) +=3D device.o
>> -obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device-tree/
>> +obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) +=3D device-tree/
>
> Here I'm less certain - is everything in that subdir truly "discovery" re=
lated?

The non-discovery related parts are quite entangled with the discovery ones=
. In
time, I'll want to move an untangled dom0less/hyperlaunch subset onto a sep=
arate
predef-doms/ folder iff all of it starts using LIBFDT rather than unflatten=
ed
DTs, but that's a future endavour.

There's also all of bootinfo, which is not discovery related, but is used A=
TM
exclusively by arches doing discovery.

>
>> --- a/xen/common/sched/Kconfig
>> +++ b/xen/common/sched/Kconfig
>> @@ -67,7 +67,7 @@ endmenu
>> =20
>>  config BOOT_TIME_CPUPOOLS
>>  	bool "Create cpupools at boot time"
>> -	depends on HAS_DEVICE_TREE
>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>>  	help
>>  	  Creates cpupools during boot time and assigns cpus to them. Cpupools
>>  	  options can be specified in the device tree.
>
> This similarly looks wrong to me. Whether to create CPU pools is purely a
> Xen-internal software thing, isn't it?
>
> Jan

In principle, it should be HAS_DOM0LESS and likely will be later when I hoo=
k it
for x86. I was waiting for x86 needing such a change to use the binding. Wo=
uld
you rather have the change done now?

Cheers,
Alejandro

