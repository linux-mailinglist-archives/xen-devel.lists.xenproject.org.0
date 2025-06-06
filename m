Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A8EAD006C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008412.1387706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNULT-00030T-3x; Fri, 06 Jun 2025 10:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008412.1387706; Fri, 06 Jun 2025 10:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNULT-0002yG-0O; Fri, 06 Jun 2025 10:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1008412;
 Fri, 06 Jun 2025 10:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Tda=YV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNULS-0002yA-I8
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:30:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4ab52a-42c1-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 12:30:40 +0200 (CEST)
Received: from MN2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:208:23c::25)
 by PH7PR12MB7939.namprd12.prod.outlook.com (2603:10b6:510:278::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 6 Jun
 2025 10:30:35 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:23c:cafe::55) by MN2PR18CA0020.outlook.office365.com
 (2603:10b6:208:23c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Fri,
 6 Jun 2025 10:30:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Fri, 6 Jun 2025 10:30:34 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 05:30:32 -0500
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
X-Inumbo-ID: 4a4ab52a-42c1-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUpvWkEymrz7LxdVAiYzVbKiuQA4hI1oTG0FbKshCSp1DnlX8OS/aa4l5XuN2HaUp+lsGXELib1pmGoMi5fu/HHZodpM0aEuuNEER6jNahDQHD3dJgMxWcokR/6A3utVSvDtGMBbz0s84Dkqqf9OUzqHtGPiua6kS/jPhm2O/brua6BnmiYAaQd85R1n6nWEMTkBKflTmnq6PmwLOyfdiOxsH0rTiN6BbBXvQDhIyN8x7ziTm3ewsVpPfnODM9vyTII7Uw3R9FiL7A/dx0IBY3aA/2X3Ez0k3e9sw5Y3jZqmefBnm8U6V7MGLEYxWm0n8qLyRlV1qjCalo8Xrk+HXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlI4OHdxVjEPk5j1MB5u+ErzkzH5FUOQtE2SUIybIJ8=;
 b=sSX9IBU0ZEEABfgA0ThCaVzRMUNXiLPZpJSQ5Y65gqU9PksNs+yBDEvXZv9536sS2GjrHT/G5XOqeJ1aw31zCanttEh9LlTlSpKZybtcTzhn9NvfLOxAJijChDmHQ7DF5QWyOKygeZAeqEY4tkYCAS+2Om/ngakeM1jJf1ddIJD0if0F99Ih7LT9nIsasQY9Yn3t4vuNAYIyNWovz3a2N2DBcZ77F4/uNjTMfzCHW8BaJQaQy66iGr8CV30I5BF4gek8wDjYSqopKZ/YHQE5bGA/P2EYDNjFysQiGfwMO49jQh5nj3PrV9p/aVdHfkRH6PV7xGoD1ksiFtu5lnBDCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlI4OHdxVjEPk5j1MB5u+ErzkzH5FUOQtE2SUIybIJ8=;
 b=43tbBtC/7jPbo4vgijqy33nRKDOwWOQtuQT9r77CUqLat/dBVSIVj1Dv6juzr+owgxB1d0xzaB2gORIwwuKe4xIACVRHF8DHDA9isVP2IN8FNauqXBoPyIp+Zn3uvTYE+KyDjsKASnoKD5UZ6GLpyg8vAn1s34LOOzogI/xF9Ug=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 12:30:31 +0200
Message-ID: <DAFDPTBLTEL9.3MTSVY5O3ONL0@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/15] arm/gnttab: Break links between
 asm/grant_table.h and xen/grant_table.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250605194810.2782031-1-agarciav@amd.com>
 <20250605194810.2782031-3-agarciav@amd.com>
 <765d42ec-a421-4b8c-80bd-30c909e81e8d@suse.com>
 <DAFD46XOYPG8.3V37FNPAPPT3T@amd.com>
 <66d75dad-4407-4b09-8dd3-c61b5d05ed91@suse.com>
In-Reply-To: <66d75dad-4407-4b09-8dd3-c61b5d05ed91@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH7PR12MB7939:EE_
X-MS-Office365-Filtering-Correlation-Id: fea09f2a-1183-4a72-e267-08dda4e52bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzBrcm1Pc2ZhdVZsZzhQTkE3QUl1YjIrcVo5dEhuVGlGejlOODNXMGVCcFdx?=
 =?utf-8?B?YmlPSVlERWJGbEZqLzlhUThXRmMwVUthdG5aSVJtS2t1UUhGNmRibVFDRE9R?=
 =?utf-8?B?UkVOc2RZYTRzZ3BwS0lYMVZsd01SR2VnaTRVWnZQVEZ0T2xDSTVPd284MWJH?=
 =?utf-8?B?aWVUUjYxQm16TFhPdi8remdneUhRRW9Nd1RnQmhxZmJDN1BLTHhqTG1EdE1K?=
 =?utf-8?B?S1dMb2VBL1d3enpsOG9GUzhpWkZlak4zU3luTzBiaW5jSUx6ZXY4UXFra01a?=
 =?utf-8?B?YzNIWmxkWTl1enoxYTJzK0lWRzBIaHNRR3RWOFcxMVVRays1TEo2TDRUMlJj?=
 =?utf-8?B?UldlVHBWWncxYUlBODFHVHdaUDM0eWQ4UnphL2FzQlBpZElLZENkeEd2V3pi?=
 =?utf-8?B?dHBBdXVTNHk0NVVrRllOL094OTAvb1ZzY2dWeEV6cXBWUFFPTDluTWt2a00r?=
 =?utf-8?B?WnRLSVBPdjFCWFB0cjhScG1ld3FsdWU1alRWV2dHRDBySnRlZ3ZiWndNYU5n?=
 =?utf-8?B?eUZmbkhYQU9zMUI0ZDZFNHRUS2JHMWh2dnV5Vkt1bkdqUnBVRWl2d0NFT0RO?=
 =?utf-8?B?ODZIYWVpT0s2S0kvV2g1dlFVY0toQ3Fwa2gyOGtFc1VGVjM2NVU3NFowRnpz?=
 =?utf-8?B?YjdGRWhuZisvMFIwNXFLMzgwUmdYYy9QYkVNT1ZmUjhaM3BueGtUdzNQVzBz?=
 =?utf-8?B?UHdVNnYwZURYSUxGcTNvb2Jpc2hmWTQvSE9Kdll4RXFGbmhSTWZ3WWJkdjRm?=
 =?utf-8?B?YmFkN3MyeEE3ckQ3M05KcWVneDJVV1hrelFhMTZkOUFlQndReEhwdnlwKzFJ?=
 =?utf-8?B?cWJVeGczci9xQ01oZkxVYUlLWHcra1ZnV0p5ME1jSTBnQWVZbS93Q0VEUHU5?=
 =?utf-8?B?RjJYamFibXkzOGZmQVFwOWdDOVZzbU5yUDF2V2VFWGJjNGp6Z3g2YUg0MnhM?=
 =?utf-8?B?UkFhT0drSmt6V0NDYnYzc2FTVlFwVHc3eDVOS0FDR0NubEJvemJmSVNZckht?=
 =?utf-8?B?WVhrcDlpUEVzaWF4TkxGNGw3RCt2aGl4dEFoTXRZcU1vRjB1N0J0VTdFOWdR?=
 =?utf-8?B?RncvN1B2S1NOYVBzdVRqVy9HUXljeE5OSjFWZUM5NFN0WmFlWmJLL1NLak5o?=
 =?utf-8?B?ZnlEYUVIaFZ0anI0Q3F6WllrV0ZBckdtTHh1dzVZS2lMYWwvMnJKeUtubzhh?=
 =?utf-8?B?Zm5wdmRBVVVyb1kwS1ZGTGJNV0k0MlRYTDlkVzl0cmcrNGUvYnNlbnlDMDda?=
 =?utf-8?B?TUFvZTZBRi9UcnIrUUhWRUtqZ1pRZEFsdEZzakVFZ0JtNWJObHFVSERIdkhF?=
 =?utf-8?B?UHVlYzVuQmlCQjZoVTg2NzdPK3k3b1AzL3luaGJERnFGYVNpSGkwUHdMeHMw?=
 =?utf-8?B?M1h2Zm14ZUZkRXJFSTFCdEJOT0FDbEZ3UXpOeER2eURtNklMY3R6WDRDQWZV?=
 =?utf-8?B?QS9ydGdRUXJKRjFEQWN3M3R2UXlJU1M2TS9kWVNieXRka0w3VXA2a2MzS2xo?=
 =?utf-8?B?VDl4NTJzSUtGeUg0MzBReitiSU5xVk82MEtyTTBXV3Q3TTBFT3JUbkhvTitW?=
 =?utf-8?B?UkFrMUlRZGZDbC8rRVI2dS9GZEtsUENvbzR2Ukt1aklBalR3VXgzdmFwdHdT?=
 =?utf-8?B?MGJqY0ZmZEhud083Ry96OHdqWGY5NmlDSUdBTEZiVDZpcnFUclIyRG5WbzZz?=
 =?utf-8?B?SWowbzVYd0pGQll5eDlwTkErVlMwVlMxa00yTFlKOWU3TDQwM3o0aHlCL21D?=
 =?utf-8?B?MUUyazdvc3RmLytYc0VDNFJLaHNEekZHOTF5Si9Rc0lCQ3JjU3dPby80NHov?=
 =?utf-8?B?UjBUMHZPUjNYd09YeGFZcllQZHZIOExUeitVQzdaRy8zSXgvYktpT2paVjFz?=
 =?utf-8?B?Q3FpK0ROYWVvRmdrM1lyYSt0cGFtZkYwVXRqRC8yeVhoUS9pTkc5WGluRHo5?=
 =?utf-8?B?NWx4bVFzWHgySHVYRnlrYllvU3hOdE84K2RncHdSaWd2QllwMmdXVTk5T2Rx?=
 =?utf-8?B?eFordXJXOElJajZkaDhvOXd5eDFJaTFtdjFtVStkZkhRcXJURk52cG8zS0Zy?=
 =?utf-8?Q?sEglyl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:30:34.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fea09f2a-1183-4a72-e267-08dda4e52bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7939

On Fri Jun 6, 2025 at 12:07 PM CEST, Jan Beulich wrote:
> On 06.06.2025 12:02, Alejandro Vallejo wrote:
>> On Fri Jun 6, 2025 at 8:52 AM CEST, Jan Beulich wrote:
>>> On 05.06.2025 21:47, Alejandro Vallejo wrote:
>>>> --- a/xen/common/grant_table.c
>>>> +++ b/xen/common/grant_table.c
>>>> @@ -42,8 +42,10 @@
>>>>  #include <xen/xvmalloc.h>
>>>>  #include <xen/nospec.h>
>>>>  #include <xsm/xsm.h>
>>>> +
>>>>  #include <asm/flushtlb.h>
>>>>  #include <asm/guest_atomics.h>
>>>> +#include <asm/grant_table.h>
>>>> =20
>>>>  #ifdef CONFIG_PV_SHIM
>>>>  #include <asm/guest.h>
>>>> --- a/xen/include/xen/grant_table.h
>>>> +++ b/xen/include/xen/grant_table.h
>>>> @@ -27,10 +27,6 @@
>>>>  #include <xen/rwlock.h>
>>>>  #include <public/grant_table.h>
>>>> =20
>>>> -#ifdef CONFIG_GRANT_TABLE
>>>> -#include <asm/grant_table.h>
>>>> -#endif
>>>> -
>>>>  struct grant_table;
>>>> =20
>>>>  /* Seed a gnttab entry for Hyperlaunch/dom0less. */
>>>
>>> The description doesn't make clear why these two files need changing.
>>=20
>> What sort of description? I removed a conditional include  and added it =
to one
>> of the few places it didn't include it already along with xen/grant_tabl=
e.h.
>>=20
>> The title does say the patch removes the crossed includes in asm/grant_t=
able.h
>> and xen/grant_table.h.
>>=20
>> It's, I hope, self-explanatory regular spring cleanup.
>
> Then I'm sorry, to me it isn't. "Break links" has an entirely different (=
file
> system) meaning to me, in the common case. Plus that says what is being d=
one,
> but not why. And it's the "why" that I'm seeking clarification on. From y=
our
> response to my remarks on v1 I was concluding that the issue is that in a=
 few
> places asm/grant_table.h would need including additionally. I didn't expe=
ct
> any #include to (need to) go away.
>
> Jan

Let me take a step back then. How about this commit message for this same p=
atch?

  xen/gnttab: Remove cyclic includes in xen/grant_table.h and arm's asm/gra=
nt_table.h

  The way they currently include each other, with one of the includes being=
 conditional
  on CONFIG_GRANT_TABLE, makes it hard to know which contents are included =
when.

  Seeing how nothing in either header depends on the other, let the include=
 sites
  include both if both are needed.

  Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Cheers,
Alejandro

