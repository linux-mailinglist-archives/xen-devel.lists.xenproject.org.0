Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE11ACB9C0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 18:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003682.1383276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8CT-0000vY-4s; Mon, 02 Jun 2025 16:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003682.1383276; Mon, 02 Jun 2025 16:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM8CT-0000t1-2B; Mon, 02 Jun 2025 16:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1003682;
 Mon, 02 Jun 2025 16:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I+dS=YR=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uM8CQ-0000r5-Rz
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 16:39:46 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20623.outbound.protection.outlook.com
 [2a01:111:f403:240a::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e12b9a9-3fd0-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 18:39:42 +0200 (CEST)
Received: from MW4PR04CA0137.namprd04.prod.outlook.com (2603:10b6:303:84::22)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 16:39:32 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::5a) by MW4PR04CA0137.outlook.office365.com
 (2603:10b6:303:84::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 2 Jun 2025 16:39:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Mon, 2 Jun 2025 16:39:31 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 11:39:28 -0500
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
X-Inumbo-ID: 2e12b9a9-3fd0-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B206H2hna7RIYZzfDLtOj6pX4nUnwp1gPTQg1FlUbAPG2ccfEjrtg6pQiuIuvlzofXg4FnQdG3dyNGnUDR5aXtYxKd+wrXJcus1OaRy5jRFMRVmBETmGHjuAp5DdXsqp16iPrCzoKFXilQ1kyZkjSyUOXHq8Ci1kR66Ft+RxyENIGoVO+maqasWzfJkYNJZINsTglgpswvTjuG4+6wD7UEIXrXh675Ac9wD1PwEPllCtAt6y5nJwhhIbsrnl9AyJIM+pPgMaoNooMAWy5DhRymy0csdEwKS6I9iqHUPht0kdkfnzbRCc7XCOCe9bFXdls2mTJU8zE/aNiHgRKkT3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNzsK8CGtOthrl6qNLnupbK7S6LGHzAYmm62zD66UuQ=;
 b=X1cFaEsMTVW3FZuhS4njkGcOUiUib6FLGxMws2H68FdEkVcPMvfsZ0fsdRkHfqiHJ5cYaGEtY5Fv4/pO/Dm2SPZKfA1f2N+xoAbkiGvv7CT1oqKhbhStwoCuMqR9S13X6zftPEjvgZrM2rZ79fI/vcGCfXd833u3gLpya3yhg5I3gP50p1SO5tY6AS2btKLzTqdkLfIyCKBRyfWp2hnaAFOH5kBJV74vPRvm75lojOaihfTECrz95oOFacDb3fpz0QJkx0xIbiB2YzSxvNTR03r/a03Dd5gTyQnBRjicTAKZRpAUBP9YapgmaHmsA34PfF5u/qF8PdDRJ83r0U54Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNzsK8CGtOthrl6qNLnupbK7S6LGHzAYmm62zD66UuQ=;
 b=3YHE46waC8YfrRcIbE5yk7OqjIGiVq2fVYYyX0+jq/XGUUrJQTZrzmIMGcqkyke+3hDOubyHK88KvhyTGoghIYp0EDApaH5Tb1uHR0nnd5fDhF7rLh56JDqpkezPNHACxzjuPXWpzpZd9I7Do4gbN4B3VIku6rwtj1HzUUZ2g/Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Jun 2025 18:39:26 +0200
Message-ID: <DAC723JETPVO.2262JS2GW584S@amd.com>
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-8-agarciav@amd.com>
 <5f3de127-70cd-422f-a368-6c23d83c6cf9@suse.com>
 <DAC4BPMR5N3A.3JYN5WXUSRGBG@amd.com>
 <6cc4d172-793b-4d3e-990e-f8fd0d4bbabc@suse.com>
In-Reply-To: <6cc4d172-793b-4d3e-990e-f8fd0d4bbabc@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e31b7f-47db-4f97-8f74-08dda1f40d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a05Da3U1QjEyRXNkSi9GdUI0ZEdLYTV4VjlYbnk4L3NjRERPYmRuUTEvcDFv?=
 =?utf-8?B?bDRwWjJDa1NHYVd3Z1FOSGsrS01vdDM5Ymo2UDMybkw5VzhKclN0S2NXaEh0?=
 =?utf-8?B?aFVHTnBROEoxYXdES1B3RHFWRFBGeHNkSXJZS3E4aHRQdTIrZTkyRE8wSzla?=
 =?utf-8?B?ZEJtSEUvZVY5WU15VHlRY25GWHhKR0svU3FsVjUzei9CUEp6dlZzamtjazJS?=
 =?utf-8?B?bjg0WjRWZExibVpDWnNGZkZ5UkxvNUwxZVJxb2FlcVFOSS9VQXNyQ2pvSlJh?=
 =?utf-8?B?OUFTd0l6cWNnR29PVzBId3RkOXpick1TWFJzZWNvbUFqQ040Q1BaOS9wUlNT?=
 =?utf-8?B?a3hvSnh5VW9jV09tRlJtVyt0LzU4MDQ5NHZuQWs1Sk1KdnFUNjE2UlBjY0Fv?=
 =?utf-8?B?Sy9rNTgxMnFrZlB3YTJ4UHROS1RycHBIU0t6ZTZVY0tublpkdlVmRDRJNER0?=
 =?utf-8?B?WGcrSStLaTJ2SW0xYktCdlpDSTlVc1JNelB5bDcvbHFqMDdGeEJYQzdJMFVE?=
 =?utf-8?B?SlVPWWNsWjFkWW8wRmkxRmxocVNISytzTFVtcW9PbHUySUtiVzBvTGtxdTA5?=
 =?utf-8?B?RGFCQi96NW5EWU1jend3NnVubEdNcEkvOHJUaGp0YlFEcEpFV0pwY3lmQ2I3?=
 =?utf-8?B?ZnZPSUJOdmR4OFBJVFg1dXJnL054NkcrTjJBc20rTnJlS0tEOGlRSXkwSEVG?=
 =?utf-8?B?YXNXK1NjQXRrUmg1Z0hDS0NMcWF2Z29GTXNTZDNMS2Z4ZE96dWZxLys5Qkt0?=
 =?utf-8?B?VlBXQ3BheGF6VVkrR1Btd2pBRHYxZDIrczZCRFUrdzNzbE5ZZUhMaXpmZWJu?=
 =?utf-8?B?YjB1U2MrSFBGbStBeWliTHFyby8zSzVFWm53TFdoMG9WZ2p0Vkc1TnZ4OFZD?=
 =?utf-8?B?SEtuR21EcEdJWlI1RUF6czlpVjkwaTREZm14KzZHc1hyVSt6VWFpcTJwa3cx?=
 =?utf-8?B?SWtWeXh1TUJHcFJBR3orSGxBR284SmU3RHZrN1kwbitlYUhpYzcwRElnOS9W?=
 =?utf-8?B?bStzK3hkeWpYejlDdmZVTXB0MmFjSmt4NWNaNXJZcUhGYW9FandSeWhRbEdT?=
 =?utf-8?B?a2s1S3cvOTRXQUNHbnRMczl0WWxtWjBEUkQxQjd2RkcxL1ZSL08rV2Y1Nzh6?=
 =?utf-8?B?aWxyU0RpSzZvS2FmOVVUNkt4Qmh2U0lQMFdPNVZCSGNCRXAzN3gwbEQ5ai8z?=
 =?utf-8?B?TmZMdEpQVDFHZlhJME9wT2VKbU5CTE53RU44eGY5WnRLUXpmKzhnZDZtYkdQ?=
 =?utf-8?B?R2VqRmxCUkpXZDYyUE45U1FYSmp4SWhpdzgwZ1lzcnlKV1RVYUpwTVVUcldZ?=
 =?utf-8?B?SWE5YVZPOGdOQnJkS1UrOE1yK1kxNFVCUTlJYlpqOGk3c04yNFN1cm5Ra3dJ?=
 =?utf-8?B?UjE2Zzdidk1Ud0hZWFplcjFLdWt1azZveWZwcGhtbnJpaG5vM0E2MzFTdHVh?=
 =?utf-8?B?ZzA1ckFnTUVka01JN1ErWklLUUUxajBOT2RybnJlVnIrdWM4WU1NNVJzKzlZ?=
 =?utf-8?B?VjM3cVExdm1FdGI4QVB2cGQyamV3dlZZTG9ic3lmZW8wSDJXcmpJV0NmYXV4?=
 =?utf-8?B?aVo3RVJOVWE5SXpVY2tKVTJaNnJZQktNeEhDMUxmbFhnUmNBQTVHNDN2eGlS?=
 =?utf-8?B?ZlBMQ01ObmozbGNRV2RmOFV4M1pneDZpZllXVUlaUkZYZlBYb1QzakVZRjdk?=
 =?utf-8?B?c0hOdzdLME1nWWVickZDajFZUGdldENHQTFQQ3FjYXZxenRlbUxEK2tENXd6?=
 =?utf-8?B?bUF4elNmS2U1VXZ6Y0NTWEM2WHJHT29BWDh1SWo3OUtCY2xMcnNiZTBPL3Ny?=
 =?utf-8?B?cjdHdDJVOS9ITE9yVXAwWFRDSERyWGpqcW1wLytHQStUQWIrbm8zc3M5ZGVv?=
 =?utf-8?B?RnBmTXFTS01CbnU1T3AzSytBVXVPcm1FQ0lzUjhaQXFVUzFkOTJvOFRZRzl1?=
 =?utf-8?B?MUgzVHNxdzVZc3daY3I2WlhpcGRGdTBTU0dRbHVDTkxyTStDV0MwWk9jS0xk?=
 =?utf-8?B?UDRxckhWejhXUGcvdjYxRnozOGFVYjlKcytSRzZ0NEp0QThhOWI1TDJpUHJU?=
 =?utf-8?Q?o8zsfi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:39:31.8415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e31b7f-47db-4f97-8f74-08dda1f40d12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

On Mon Jun 2, 2025 at 4:51 PM CEST, Jan Beulich wrote:
> On 02.06.2025 16:30, Alejandro Vallejo wrote:
>> On Mon Jun 2, 2025 at 9:53 AM CEST, Jan Beulich wrote:
>>> On 30.05.2025 14:02, Alejandro Vallejo wrote:> --- a/xen/include/xen/gr=
ant_table.h
>>>> +++ b/xen/include/xen/grant_table.h
>>>> @@ -27,7 +27,7 @@
>>>>  #include <xen/rwlock.h>
>>>>  #include <public/grant_table.h>
>>>> =20
>>>> -#ifdef CONFIG_GRANT_TABLE
>>>> +#if __has_include("asm/grant_table.h")
>>>>  #include <asm/grant_table.h>
>>>>  #endif
>>>
>>> This change looks wrong (or otherwise is lacking justification): With G=
RANT_TABLE=3Dn
>>> the arch header isn't supposed to be included.
>>=20
>> It's not equivalent to the previous code; but that's a feature, not a bu=
g.
>>=20
>> Not including the header with GRANT_TABLE=3Dn  was the best we could wit=
h
>> the older toolchains in order to not try to include a header that might =
not
>> exist. The high number of sequential inclusions of xen/grant_table.h and
>> asm/grant_table.h seem to attest to that.
>>=20
>> I can ammend the commit message to be clearer, but IMO this is what it w=
as always
>> meant to be. I can replace the current commit message with:
>>=20
>>   "The previous toolchain base version didn't provide __has_include(), w=
hich
>>    allows conditional inclusion based on a header's existence. Lacking t=
hat
>>    feature the inclusion was guarded by the GRANT_TABLE option being pre=
sent
>>    but even then sometimes the arch-specific header is required even whe=
n
>>    the option is not selected. This causes inclusion sites to needlessly
>>    include both asm/grant_table.h and xen/grant_table.h.
>>=20
>>    Using __has_include() removes this requirement at inclusion sites."
>>=20
>> Thoughts?
>
> So why would we include a header we don't need when GRANT_TABLE=3Dn? Over=
all
> we're trying to reduce dependency trees rather than growing them further.
>
> Jan

Because we do need it or the code doesn't compile. gnttab_dom0_frames(), fo=
r
instance, exists and is used in unguarded statements. There's more case lik=
e
that. It may be possible to break those dependencies so the inclusion is
not always expected, but the reality is that you tend to need the other hea=
der
for pretty much the same class of reasons you needed xen/grant_table.h to b=
egin
with.

Forcing the code to include both seems counter-productive to me.

Cheers,
Alejandro

