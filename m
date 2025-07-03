Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78E0AF6FA9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031925.1405670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGoU-0001Lj-ME; Thu, 03 Jul 2025 10:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031925.1405670; Thu, 03 Jul 2025 10:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXGoU-0001JT-II; Thu, 03 Jul 2025 10:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1031925;
 Thu, 03 Jul 2025 10:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTCS=ZQ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uXGoT-0001Ff-I9
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:05:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc893de-57f5-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 12:05:04 +0200 (CEST)
Received: from BN8PR12CA0025.namprd12.prod.outlook.com (2603:10b6:408:60::38)
 by DM4PR12MB7695.namprd12.prod.outlook.com (2603:10b6:8:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 3 Jul
 2025 10:04:59 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:60:cafe::f9) by BN8PR12CA0025.outlook.office365.com
 (2603:10b6:408:60::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 10:04:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 10:04:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 05:04:54 -0500
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
X-Inumbo-ID: 2fc893de-57f5-11f0-a314-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XO6OiWuZGog7rP3LjmcF21aI8q7kXKim/nDZCRWwW0HmUxb8GZhaspChFJfH3HB11yc7BdA1gWeO99nK+syiJ/3WaAgRIPJF2c3PQDffrmc4a5vk4dz4+GoM4t+sXb394yLet2MFESPZrS6udGA29lyb3GPCaJr191fehRw+76JnMy0r5IH6tDPuYZTpY9wz/uugPwbKJWYAjVmwCOoqCFHzW7WPv06TIRiSdgdRK9VW9IUGmFHmRHPuIgn4lmwtwpSdwudqQLgsZWLSkCg6Ig49ptg0o6xHBeFBLGQMXPmcaaafwYON6ZFwlzaQYnBa+6rI7gxJ79o1IHYYmP1C3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GjkJu+YHwj9zJw8c/oqOkQcEn17UUJdUD8+C20siiI=;
 b=TR46xplg+WC/uZ9ZS7c0tXJd+0CUw3JtH3nR4ubo5MqLb+/wzw/PP940S8RE2uQnjEP6i2dynHB4RAKYXZRSE5A4aDkAe+w3lD8KrlnjvdadRCNAOZu2GMGOpehX+PC+CRH+bAlcllkSPfzZhLWfgUp8q2V1HNF388wS6ucbSLTZwWrqX5no8KrW1gcqubOZbBidlDMzApWiRH5x5XNdfVieZYqLwXqdt/haJmmbCX3/Q8ZBZUERppLiK6zWt/sFUuQxD7DT6KbZ1IMrlvt1ZdEZFx5XVV9Ouu2BZAhbXMTgM7US7BXnUmyRCmIOWl1wJ2YeMUbaIlrMuIBmXpTpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GjkJu+YHwj9zJw8c/oqOkQcEn17UUJdUD8+C20siiI=;
 b=y9XfWcfCw9kfwdCUUJPPSep7l/BuQjmuZGC5N/iansTpZjiGBR1sasjNJATsF/vumcWNEXs0Xxph7yl48cwOEVekZJ/82qA3zp/8Fr/LoKxuJ08XlmUQUkFml/09YgVZQxnVV0sEvooat+0S0VoWHR2dXmAy9Z+Mv6Rd2y1KCB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 3 Jul 2025 12:04:53 +0200
Message-ID: <DB2C2WI2CUB9.14NIBGCJPF6BV@amd.com>
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
Subject: Re: [PATCH v5 08/10] xen: Split HAS_DEVICE_TREE in two
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-9-agarciav@amd.com>
 <ffba326b-6fa4-449d-8db3-66fb145a61a4@suse.com>
 <DB1OC2FGH37J.3VDC4G4ABWFRI@amd.com>
 <db890d7b-0e4f-46de-b91c-e8a5a5185487@suse.com>
In-Reply-To: <db890d7b-0e4f-46de-b91c-e8a5a5185487@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|DM4PR12MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cadc7b-434d-4f1a-4aee-08ddba1911ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmRmOVRqZEhHQ0dtV0NpL1Nnd0pRbnhCMnZld2lXSldCb3JUdlpoTTFUTzdY?=
 =?utf-8?B?VktFWXVUWFowR2k2dVV3RktyV0xiM2pENExObkw2cUVrVGxNSWNId2E3T2U3?=
 =?utf-8?B?T01tNjdDd0lZRUM3MCtEUVRjRXJkMFlZa01pYXBXWVRqVnJoTGZsT2RZWjgx?=
 =?utf-8?B?WDhIeFZNV1ZwRTdIOWFoQkNuNzNZT0h6Vm5Rc1RJTjVhRWJiZjZrVlA0dGEr?=
 =?utf-8?B?YTdXZGIvLzVkbTBuS0U0c1ZsditNUEd1RnRjTGZDd3lTUXB5WitCSjJxQTVI?=
 =?utf-8?B?L3FMNVB6QXV4SHh5L0MrSElQMlVlclM3ZitBbjFnRXU4aWcxQ3BoRnRqMFlO?=
 =?utf-8?B?MnE5aEE1WjVHNkZGY0UvTm4vb2xLSU5NanZSSVJ0TnZmRlh2YzVFT2lvTGJ3?=
 =?utf-8?B?Sk5mU2FsZDcwbDFXSEpNcUVmN21vVjEwVnlqUE5Vd1BqdU8rdk9IUXE0SFlP?=
 =?utf-8?B?NUNKcnoxekNhQ2p6WVY4bytBUTJnZ05KdUdtOTUrUFBETk9tQzRrbSs1ZUlB?=
 =?utf-8?B?V0s5QXVKUEQvRHVORnI1K21aK1Y3WTZtRGJRUmFJVUxERXJTcEt6K25CeExX?=
 =?utf-8?B?UXMrVDNXSWt6WmtCQ3lCYjlZZ3orNyttT1lIa3B1UE1wYUtERGlUYjVLeDQ1?=
 =?utf-8?B?UStLUzB4TmN6RmVOcy9Sc1VTcWhaTXhWbzZ3c3drd1kvYnlMRG9zSVJUY1pT?=
 =?utf-8?B?OHR3bUlZMUFCTnJCSXRZbk1EMzBBMnNjKzdqRGp3RDBoNDFoRStKZVRSejdI?=
 =?utf-8?B?bkpVaVRuK3RUQXhEb2QxcTdJaFRUb0N0MVFZcitsUlFlSTVBM1FoMjM2c05s?=
 =?utf-8?B?RXAwSHA5Yy9LNEVoV05DSUhYTWhZcUVKS3FINzlGUitxaTN6TEt2RUdpRHdk?=
 =?utf-8?B?UDhpWW1WODRZOU5MZXBjREhGYnpyYzlvRnY4aVMvZlRCZHZ3Smh3K3NyeUMr?=
 =?utf-8?B?cnM5OGtvMGxsVlEzQnM5NlI5SkRqeFVQaGhSc0djcWwrZ3pnOFYydURQSFBn?=
 =?utf-8?B?dTlORFVSTDRCUDlyeXRRZlVvLzduMTllbG15Q1o2UTErVkc5b2d4NXFBTXhQ?=
 =?utf-8?B?RUM3Mnd5YmJZTEdscE4wODJ3ZEdmUmJPWHEreU5LbWpXeWdGN01XVmxzaml0?=
 =?utf-8?B?WThYWkFFTXBXUlk2VzgrNXRXeGlSa05Ka09FYWJLSEd2dzdMQ1B0b2YyYzlp?=
 =?utf-8?B?VlREKytuUkpmVmZGMTc4WXQrYkpMQ2t5VWZtam5xZVgwbDhWRlhZMnQ3U2Na?=
 =?utf-8?B?eDJFWEVRU2QzVEpTeEZMczZFek40MFMxOHVQNXVZaHZRMGhUbzZzNFVWcjIr?=
 =?utf-8?B?QjF4eGdjOVdxSE5wYjBvSG41dVFnS3p3MFhaR2JYSTdxKyttNkRZNzMwanhl?=
 =?utf-8?B?UkFvcjA5djBpY3FlQXhLTG9XNlpqTng2MG9ROFNqMmdlYnRDSU9ydis0cDdj?=
 =?utf-8?B?L2FhUDQ5UENrVzVxU3RKMFpLN0hXN1k2MC8reXRlbXlXN3h1R1FONCt6LzBW?=
 =?utf-8?B?VUFtVlE3eHl5cTJBM0NhZWhlTFVlSUR0a3VERktOOGc3MEtQVFZjdHVQSDJt?=
 =?utf-8?B?ZkFPN0xRT29VQ2lsOHlEVERIdGRVVFZpQXhLYmZYcXRoMnJNWmY3cHBwZzlj?=
 =?utf-8?B?a3lGRnhRUlRXdWduYlhjYkliMEZuN1dIOFF2RU9TQmZTanpuUnVZOVIzQXR0?=
 =?utf-8?B?eUNFTExaNzFNSzFvZm1OMGhDMGZ3eXJFeWEvVU41dC84WlNYaS9kVHZ5MHR3?=
 =?utf-8?B?NS8zNWxIWGVnbUIwbVBQcWdjZitCaVF3anJCOGNpT0l4TERabDYyK0J3WDl0?=
 =?utf-8?B?VlhDdXZzMk9palVpOFd0M0ZaaTJNYVpTOHhaT1lSODFuTnZjQUx1RW9MOGRU?=
 =?utf-8?B?dkh4ZnA5QVQ2T251WjV5Y05xNXlTK1NOOWhiUi9rNGNUdlNiYkNEUy9jNXFa?=
 =?utf-8?B?N0MrVUJsbXN3dzdyMFFabTVJU2JlbUU4S1NZb1YyQm5jY0JOem13Ni95NFhD?=
 =?utf-8?B?eWw1RFF1UDRGZDBHUjg0WmgzOGE3ZG4vTklBQVhXR1dHQ2ZVRmdPKzVtb2RD?=
 =?utf-8?Q?68tA0n?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:04:59.3569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cadc7b-434d-4f1a-4aee-08ddba1911ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7695

On Thu Jul 3, 2025 at 7:55 AM CEST, Jan Beulich wrote:
> On 02.07.2025 17:28, Alejandro Vallejo wrote:
>> On Wed Jul 2, 2025 at 3:30 PM CEST, Jan Beulich wrote:
>>> On 01.07.2025 12:57, Alejandro Vallejo wrote:
>>>> @@ -85,7 +86,11 @@ config HAS_ALTERNATIVE
>>>>  config HAS_COMPAT
>>>>  	bool
>>>> =20
>>>> -config HAS_DEVICE_TREE
>>>> +config HAS_DEVICE_TREE_DISCOVERY
>>>> +	bool
>>>> +	select DEVICE_TREE_PARSE
>>>> +
>>>> +config DEVICE_TREE_PARSE
>>>>  	bool
>>>>  	select LIBFDT
>>>> =20
>>>
>>> We're in the middle of various ([almost] alphabetically sorted) HAS_* h=
ere.
>>> Thus DEVICE_TREE_PARSE wants to move elsewhere. Or we want to move back=
 to
>>> naming it HAS_DEVICE_TREE_PARSE, but I think there was a reason why we =
didn't
>>> want it like that? Just that I don't recall what that reason was ...
>>=20
>> AIUI, HAS_X are options selected by your architecture. Things that tell =
you
>> whether X is supported in your arch or not. In this case, HAS_DEVICE_TRE=
E_PARSE
>> would be supported everywhere, while DEVICE_TREE_PARSE is not an arch pr=
operty,
>> but an option selected by DOM0LESS_BOOT (which appears in menuconfig) an=
d
>> HAS_DEVICE_TREE_DISCOVERY.
>
> It's on the edge here, I agree. Yet we have other cases where one HAS_* s=
elects
> another HAS_*, and I think we're in the process of gaining more.

HAS_* selecting another HAS_* makes sense to me, but that's not what would =
be
going on here. On x86:

    HAS_DOM0LESS =3D> DOM0LESS_BOOT[y] =3D> HAS_DEVICE_TREE_PARSE

thus leading to HAS_DEVICE_TREE_PARSE being indirectly selectable via
DOM0LESS_BOOT, which is hardly a HAS_* relationship.

>
>> I can move it elsewhere, but it's unfortunate to separate two so closely
>> related options.
>
> Imo there's only one of two options - move it or rename it.

I'll just move it elsewhere then.

>
>>>> --- a/xen/common/sched/Kconfig
>>>> +++ b/xen/common/sched/Kconfig
>>>> @@ -67,7 +67,7 @@ endmenu
>>>> =20
>>>>  config BOOT_TIME_CPUPOOLS
>>>>  	bool "Create cpupools at boot time"
>>>> -	depends on HAS_DEVICE_TREE
>>>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>>>
>>> Is this correct? CPU pool creation isn't driven by DT discovery, I thou=
ght,
>>> but is a software-only thing much like dom0less?
>>=20
>> In principle it would be possible. But I haven't tested the configuratio=
n, so
>> I'd rather err on the side of caution and not enable features prematurel=
y.
>>=20
>> In time, this should become DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY.
>
> DEVICE_TREE_PARSE, that is?

Yes :)

Cheers,
Alejandro

