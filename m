Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D4ACF54C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007252.1386558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEJ1-0006Mb-Va; Thu, 05 Jun 2025 17:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007252.1386558; Thu, 05 Jun 2025 17:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEJ1-0006Kx-SV; Thu, 05 Jun 2025 17:23:07 +0000
Received: by outflank-mailman (input) for mailman id 1007252;
 Thu, 05 Jun 2025 17:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEJ0-0006Kr-B4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:23:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2412::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc58ccfe-4231-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 19:23:05 +0200 (CEST)
Received: from BN9PR03CA0874.namprd03.prod.outlook.com (2603:10b6:408:13c::9)
 by PH7PR12MB7427.namprd12.prod.outlook.com (2603:10b6:510:202::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Thu, 5 Jun
 2025 17:23:00 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::37) by BN9PR03CA0874.outlook.office365.com
 (2603:10b6:408:13c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 17:22:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:22:59 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 12:22:57 -0500
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
X-Inumbo-ID: bc58ccfe-4231-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctZm2dkUGRSZWsMZS3ZvpbvQQfng/nt/Z3o6YAXXvIJ57a+aoJ5DqHUQQNkmXUVW9ttEK6hvOgGl6iUuN1YM029pWo6ifgCNG6WkVAI20IljRf2cTKyb+BRSU988HNQs2FwkJWnEx7YMnD2Pfp/b7I1T1jKQmwEpvspi90UBpNHzN2v3gYGkBAuCW8KQ4Y3ekRpJPSKQ9YGOuOktpvme8UhcbH78U1MTDt1n8jbhBvYriY8PclLHCNHXjGQM/YSpsp1PagcQVxL6zmH5iUDB7uQ7ovpWigsE7Aqro395sF+9J/qq/HyqJB3W5ib8u0TYId/T8JjWGiNaOL4WFiHGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6kfwSE7s6bQuZ3N1lUT5jMKzInmxmzg2O+OG1b5az8=;
 b=qMXsh8/8CL5F81hIibkrmiW5ZFt2OqMEax+Qnel40CYJkNf8YAvIetBW4qKkF0soKaRWqm0UvWS045K4TwGmXwofxTQsF/xQ1AmfsNxGuSintEA9TWJ43pAiXbsyauaQhWdnh/TE3N05v+XvatJFmmg+rVP9N/K2brMOpwusmY4EzVswoszViFAEZ1CXupgBAWCFLSDrmyhJ0MksASL0hrf0jMcaL9CBF0pU6RjaG6pw3oXjYpE78tUK7+YeXi7uKEu98HoipABmzLJC6iU0baRQXJfPZ5Vr4tt2BmUAtgqQ314lE1ztmfLGoxYcjLkZFDEk79kFHWoRQUixZdlz2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6kfwSE7s6bQuZ3N1lUT5jMKzInmxmzg2O+OG1b5az8=;
 b=xS7AG1GftEABFU2Bz+FTEDfOE/8mLRTsAQMTC2RU64SWJSBdYXkUU/OxS2VLs4XOMgJ9OKR7+cM8fiAXu1ecAWgF4I5A2OCLfLYUzuH+jqcBv13pitq7znAM7p4h25CZkOP1voW6LDiPCnerrBkmjLlgk0Yuj/8WZekjac9Jqfk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 19:22:56 +0200
Message-ID: <DAERV1HLF871.2MROGL8YMCF9Z@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
 <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
 <6cc4d172-793b-4d3e-990e-f8fd0d4bbabc@suse.com>
 <DAC723JETPVO.2262JS2GW584S@amd.com>
 <87224eb9-d4a6-4589-8cc2-e222619f8dde@suse.com>
In-Reply-To: <87224eb9-d4a6-4589-8cc2-e222619f8dde@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|PH7PR12MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce2dff7-95d0-4cbb-cc8f-08dda4559eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjZXMHk3T3BWenNnQWc4SDkvZWFVSW5KQitqaDhyOXpWVTBPQzhRd0pLaVIz?=
 =?utf-8?B?bU82QVFieHBrZzNtT0xzb3R2VUxCa0ZvVklKcWtVQm1ENld1TzZsN25GWWVi?=
 =?utf-8?B?Ky9YSlZTa3owQjFhM1hsQjJzREtlYjNaNklKVElSQ1RTSUEzVVUrZHVwc2d3?=
 =?utf-8?B?QWh1VnRTSFZySmtxa3RrUlVEdkFydDlCdlpyenRuRVpqZUhGclV0cHpXOWNM?=
 =?utf-8?B?WWVjOUpIbVUwTUZ4NXJpSFpybW1CM0RuV0tlVE1LbDBRT1d6V2hhdlBSVTA5?=
 =?utf-8?B?L2FMSGJNMWpoS1FCVHg1b3NTRTZnSUhWMWYwcFZOVHFFdTA2YWROQ0wvejFs?=
 =?utf-8?B?b1Z5REpabXF4Z0ZHNEYvaE9leHE3c0gwaDRtdmdyWUxtQ3dJbU5pMHBxR2F0?=
 =?utf-8?B?SUVJWGlyc1B2M2dwSFJLSzRieVBxY3VzTjEzUndEaTl4bTNQOEpKT2RNWTA3?=
 =?utf-8?B?cmlUTUZvdzJHMVFsL0NsRWFoREJsUnJOekhoOGFoQysrL3VJWHpqaCtoRXFG?=
 =?utf-8?B?c2YrQng5Z1JBckNyQytnNGRpZnRNVE1zcHhCdU9iVnkyQTJOejltUk5wZWky?=
 =?utf-8?B?WnVJUkxqQzNDWjBUSDJqZkxNdE85YTVUNm1xUGhaRjVQQjdtMVhTcEdlZ3ZV?=
 =?utf-8?B?emFrU2d5bWxoMnRzQXk1YTc4cEE2ZTdqTXpjNFhpOURLM2VzZ3lGSUxvbFd0?=
 =?utf-8?B?TG41ZUhJK2RKNVlHSld0WGVxQ3pDUE9yYkFVcU1qM2VYckFwMGFjeTdZSnBQ?=
 =?utf-8?B?UkVVUThISzdYSGxSK2k1dzhmTGlFVjFEamxWOE45ejJvTzV6K0JSZGN3RGFG?=
 =?utf-8?B?QnZaTURlTkMycWlmV29JNngwS0pDNW16eDdNeW5sUmFSZWVnWng3dzBVQ3JI?=
 =?utf-8?B?eVVGNFJkdnByOERNSHJicTZjeUhISFh4d0VSNGVibE13Yko2TGJoUURzeUhW?=
 =?utf-8?B?ZTVOYVNtKzdhZnp3OEI4OUQ3ZytMUk0za0o1ekN5WkNBdmRTUHJ4dXQ4Wm1R?=
 =?utf-8?B?dk02cFZXak9RbmsvalVvNWVwNzA3UmRiV0tWbGdUN0RibTZaRWNVQmpneEpW?=
 =?utf-8?B?bFNxSGIvT1o0bFNTVUxxZ3EwS21OaFkyUFBETmIyQUN5OTkrc0ZSOGd4Rmpo?=
 =?utf-8?B?U2Z1Vy9UaVFnYnhobk5lVXV1ZTZ5cGU4bWgvY2dNbTFTczhDVjBwekhCU2tB?=
 =?utf-8?B?TlcxOGN0Mlg1eWVZTTBUaEozZXhhcjdmMTFBWG9EeXZkS1VheTNURGNkR2Er?=
 =?utf-8?B?bGM3ZUgvbzdVMmJKbHZNMDYyYnd0SFJCQ0FsODI4bVZVb1BZeHM5ekd5TTFD?=
 =?utf-8?B?V3B3R1R1a2ZmUmpUL2Z2UDFmMG9oQU16eERuZjhvam1nYzZiTEtoVlFoMkVH?=
 =?utf-8?B?R015V29ZbVZNcFh6QUdRcWd0Qk42UFAyWVVOVGE3cDhuV3F3VlpEK2QzNjQ1?=
 =?utf-8?B?YVZJMEhkaE8va2MxSWtONEJQS0prYmJHUlhsUSt3eDc4NmRHMWFpOVpKb3Ix?=
 =?utf-8?B?NmZXNU4xdjE3M0doWGN3Y2t3TDN0VjRiMnNmRGdLYVloTzl5eEtoZHExWkph?=
 =?utf-8?B?Qyt2dGtSUUU5TENHTkxzNWFWZFVGa3NUNFUrcTZvR2N1Qzhtd1h2aGs0d0w1?=
 =?utf-8?B?dXBWckg3M3JSd2RObkRyNUFSWEpaWlFiN2hoU3VtOEZ5STJzT2J1SkJiY1lL?=
 =?utf-8?B?ME8vNzdiZ1UrL3Nyclo0SUtaNWRISkhOdkV3OE1XRjdTdHV4cjVHTmx4eWtj?=
 =?utf-8?B?WmZ0dnNOQmJ0L0NPRWVwWnBVVTlPODIyaEU2TkVHTnB0SDJrZWJNMGxaUU9J?=
 =?utf-8?B?bEJ3MnF1dEJlMlRlVTJsZk5rbWhUUEErMC9RQUZ5cUhyWlZtWWxZZEJEYzJX?=
 =?utf-8?B?MmRqbitPVzdBYmNQUVovTzNaeTdsYnRwM3BCMWd3dy93OEZOT3dHYjdodWNs?=
 =?utf-8?B?RU5nMGdYbG11U1QzSjEveW9nM3lDd095Uks4N1dDTFYxVWxwblJpT0lJcDZk?=
 =?utf-8?B?NGhkemJXNzBnL0hjSEV2enlKRnVZVEpQd0wzakZ4NlQ0WXh2ZDBnQWI1U2M3?=
 =?utf-8?Q?dEmKnE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:22:59.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce2dff7-95d0-4cbb-cc8f-08dda4559eaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7427

On Tue Jun 3, 2025 at 9:04 AM CEST, Jan Beulich wrote:
> On 02.06.2025 18:39, Alejandro Vallejo wrote:
>> On Mon Jun 2, 2025 at 4:51 PM CEST, Jan Beulich wrote:
>>> On 02.06.2025 16:30, Alejandro Vallejo wrote:
>>>> On Mon Jun 2, 2025 at 9:53 AM CEST, Jan Beulich wrote:
>>>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/=
grant_table.h
>>>>>> +++ b/xen/include/xen/grant_table.h
>>>>>> @@ -27,7 +27,7 @@
>>>>>>  #include <xen/rwlock.h>
>>>>>>  #include <public/grant_table.h>
>>>>>> =20
>>>>>> -#ifdef CONFIG_GRANT_TABLE
>>>>>> +#if __has_include("asm/grant_table.h")
>>>>>>  #include <asm/grant_table.h>
>>>>>>  #endif
>>>>>
>>>>> This change looks wrong (or otherwise is lacking justification): With=
 GRANT_TABLE=3Dn
>>>>> the arch header isn't supposed to be included.
>>>>
>>>> It's not equivalent to the previous code; but that's a feature, not a =
bug.
>>>>
>>>> Not including the header with GRANT_TABLE=3Dn  was the best we could w=
ith
>>>> the older toolchains in order to not try to include a header that migh=
t not
>>>> exist. The high number of sequential inclusions of xen/grant_table.h a=
nd
>>>> asm/grant_table.h seem to attest to that.
>>>>
>>>> I can ammend the commit message to be clearer, but IMO this is what it=
 was always
>>>> meant to be. I can replace the current commit message with:
>>>>
>>>>   "The previous toolchain base version didn't provide __has_include(),=
 which
>>>>    allows conditional inclusion based on a header's existence. Lacking=
 that
>>>>    feature the inclusion was guarded by the GRANT_TABLE option being p=
resent
>>>>    but even then sometimes the arch-specific header is required even w=
hen
>>>>    the option is not selected. This causes inclusion sites to needless=
ly
>>>>    include both asm/grant_table.h and xen/grant_table.h.
>>>>
>>>>    Using __has_include() removes this requirement at inclusion sites."
>>>>
>>>> Thoughts?
>>>
>>> So why would we include a header we don't need when GRANT_TABLE=3Dn? Ov=
erall
>>> we're trying to reduce dependency trees rather than growing them furthe=
r.
>>=20
>> Because we do need it or the code doesn't compile. gnttab_dom0_frames(),=
 for
>> instance, exists and is used in unguarded statements.
>
> I fear I don't understand this: Things are building fine right now, aren'=
t
> they?
>
>> There's more case like
>> that. It may be possible to break those dependencies so the inclusion is
>> not always expected, but the reality is that you tend to need the other =
header
>> for pretty much the same class of reasons you needed xen/grant_table.h t=
o begin
>> with.
>>=20
>> Forcing the code to include both seems counter-productive to me.
>
> Depends on how frequent the double inclusion is, imo.
>
> Jan

Not as much as I feared. I've removed both linkages for v2.

Cheers,
Alejandro

