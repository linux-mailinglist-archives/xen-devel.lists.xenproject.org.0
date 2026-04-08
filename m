Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNLSOqww1mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:40:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2E3BABE8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275678.1561439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQKN-0006Uy-66; Wed, 08 Apr 2026 10:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275678.1561439; Wed, 08 Apr 2026 10:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQKN-0006T2-3F; Wed, 08 Apr 2026 10:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1275678;
 Wed, 08 Apr 2026 10:40:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAQKM-0006LU-2Z
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:40:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQKL-00F08C-B6
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:40:05 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d6307f-bab6-0a2a0a5309dd-0a2a4505a034-38
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:40:04 +0200
Received: from [40.107.208.41]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d6300a-3760-0a2a45050019-286bd029f730-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:38:04 +0200
Received: from BN0PR04CA0150.namprd04.prod.outlook.com (2603:10b6:408:ed::35)
 by IA1PR12MB8333.namprd12.prod.outlook.com (2603:10b6:208:3fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 10:37:55 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::e6) by BN0PR04CA0150.outlook.office365.com
 (2603:10b6:408:ed::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 10:37:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 10:37:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 05:36:54 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 05:36:53 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swgpgUlG/Uc+psqIfiGtQukP/Gby+Ui9t6/X8Wabz26cF5TCKIcOXMpjD2525gb4bo6ftrE0RY8nz9TbUaVvpktdTMe5/+0/ycOe6d98D2JvQ616So+Pzmf7d+EZDT9xgWHgHp90ib9VaW8o8yH6SxIEOIcqkSVX7NG6IeDZBaQnXPVIuRwbrAQGPDaHK9/FKJiLolH53wNTd80e+dFQzPNKI8tkCWLeXQXazPUFoY0dPjE+dgwSiqGOnS/DeOoHkiFiRMIvqs1SxN9LuYhoEvvNnN65PuupdwkQc1T09V5X9GoCTUTVvhevMQEyfOuYWTuqwGOv8kSt/zcoPthWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNCZYlDWBDu0COOSKEhXAsSATFn51a5xyrmKkW3ks3E=;
 b=nsuAVbeBkLLP9CXkLc0RxclqVC6xwrQVptcxLVCidaQdPtDabl9v6VcMo53iY/WKqA7Rcb6Cw9RpbkRgcyzdGF5tziDyMk+vBt39vkPeXXIR32L8DPxvqNNE6RFLO2Bku5+gzo06fatB7N2pL9gw4+EId0+74grjeGMA5oByaTjzaqk/wvfg75gGgCPJGt9NNHpK1vt+i7yd1V8olD32qRrmKIIT/rZBawItyQ0GACaJ/pUn32qAmd4QTCNF6qCG4nVTPtRH6Z6PKl5MhY1xo9FticiBinGHGckEXHwWctQUJ0qrmMaQstdMkSujQML30IFERKsMRvnWPUkjZ3Y74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bugseng.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNCZYlDWBDu0COOSKEhXAsSATFn51a5xyrmKkW3ks3E=;
 b=ZMJ508/KzJ5VGdIyPFxCAryTTICoKdUwV2fatt6jkIIbyaqfj2Q/Y/UNMlwa6Hv4hhgatHG5mpJzb8fctMVV49IZqUgaBuWuPxKnRMtZNw54U3Cl0QuC8jwoszUfnTzafXNOj3ofW/zq1Dt4s2F4zJsZir9+muzA6dpklthDJ0Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <18ab9849-f525-46cf-a244-d8125bef1655@amd.com>
Date: Wed, 8 Apr 2026 12:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Rahul
 Singh <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
 <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
 <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
 <7fbcb3d1ccdcf6fabb45f5805b504096@bugseng.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7fbcb3d1ccdcf6fabb45f5805b504096@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|IA1PR12MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cbb902-b975-40a8-26fb-08de955ae4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lHWdDSJOi+R63OqiQI7u/v/frhw/A1W5sdR/of5mI8hMf2UKYNVhI+UTSpL7k8lgwj28b/S1NKbpgFTsHXBeUl96Klh/pbDXesbtMYGuOpBUAO6hT4E+NifWfjJzbKOxTfRoYlParrOI1AehqWcyP/SzIlrTbZOnSH7J8Lp//yQakZsFCXY/Eup+L5dYRgtNpBw9et74GTAVHOt/Xk4sdeE6Aamu+JVXVbjyhNLYiRybuJfPvB0AzE66fO/0tFD1hI6f3mCUkT+sBNregAhhgsnDkcbAWdcPaRigiQfuU5ZMupL3YM2SsYmlPLQEB6W9RD2HhsAZDOgvRg+2EEM5jAkf5XdqPmS+gdbuu6+9/Mft8Pui8tScBWLnQOnPPDC1C7+5TPW4hm5qpD03XIbuE16DBdTEuEpM41MZCEW5ZAFCMA6mlNLiXTfFuBQQhOzNJVb0pQKRsE0vRFNBlCkqAmbvyCMm1ip9uEAm72AncI+QDnUdcs3zf1RpO1ikz2r3m98WV2bm/Bx8P3ik6sTjM/UCziy3/i7SsQRqqjcvNM+JDbyCXIRdbEXNYKhuw+RaPeXuVTOCfevNrXL+VcCZipu4zdc+Fo+6Qq7IG373ktSnSs4vYWO7v5xZkiC/vlOIEgTzHtMti65GVbulsGTSdf4V8wlSfSkji2wViOn11KRa0iVkvvdCEa67JJCe4llNfCs3YWPtnj0jGYle8XXymxcm+gUiHcR2I3X22W7eXEg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KY5/pArWC7EIPmuBUMuvKaE7JdvSJmw7RWf9I+27LGVu4KMYebcOEX1mqbrO1A2f/FEApb54i4iKIukw45nnXbHsJ8UsOxjMMHMFeXYZzjfM5Ui7eueqPCaASuFjmkqdwMPdZxixNWI5zjDQGFaRLzyqUiRJ1nf1+bGy+8thuZkW6m16pha57LZEyPQh9JQG0qzClsya+wvGzrFXt7joG4l5Gsvk1OxP5vaG2yHrTYRO++ColT3MR4/HE0n0eclqaqSk4HoWusgAprlSqIQO9jjsjgGNs/CGwTKvm3xtTuISoWg8OBdQ9Uk5TpLRQkCQorJrbgVUZJq6Ps+42ZypgsvVkfq8ndpenZYGf7Kq5oFJLXptr9ii/00hTYfupy2qKNncQcgYE9zMfCd/JYlPZUckesngM9jUMZzL4NyuXTDTRHBHJB4Jy7zSIN23SgIY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:37:55.1649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cbb902-b975-40a8-26fb-08de955ae4d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8333
X-purgate-ID: tlsNG-c201ff/1775644684-3133496F-4CF43354/0/0
X-purgate-type: clean
X-purgate-size: 1983
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid,gitlab.com:url]
X-Rspamd-Queue-Id: 55F2E3BABE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08/04/2026 12:21, Nicola Vetrini wrote:
> On 2026-04-08 11:51, Andrew Cooper wrote:
>> On 08/04/2026 10:46 am, Nicola Vetrini wrote:
>>> On 2026-04-08 11:22, Andrew Cooper wrote:
>>>> On 07/04/2026 11:34 am, Michal Orzel wrote:
>>>>> No more regressions for clean guidelines:
>>>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>>>>>
>>>>> Michal Orzel (2):
>>>>>   iommu/arm: smmu: Fix variable shadowing
>>>>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>>>>>
>>>>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>>>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>>>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>>>
>>>> If all the violations are fixed, should this test be made blocking?
>>>>
>>>> ~Andrew
>>>
>>> Only if they are also clean on x86; otherwise an arm-specific list of
>>> clean rules should be made (probably better). @Michal what do you 
>>> prefer?
>>>
>>
>> All I'm suggesting is this:
>>
>> xen.git/xen$ git diff
>> diff --git a/automation/gitlab-ci/analyze.yaml 
>> b/automation/gitlab-ci/analyze.yaml
>> index 4e9af9d60224..f01798c5dee6 100644
>> --- a/automation/gitlab-ci/analyze.yaml
>> +++ b/automation/gitlab-ci/analyze.yaml
>> @@ -149,7 +149,7 @@ eclair-ARM64-allcode:
>>        CONFIG_STACK_PROTECTOR=y
>>        CONFIG_UNSUPPORTED=y
>>        CONFIG_VM_EVENT=y
>> -  allow_failure: true
>> +  allow_failure: false
>>  
>>  eclair-ARM64-testing:
>>    extends: eclair-ARM64-allcode
>>
>>
>> so regressions become blocking.
>>
>> ~Andrew
> 
> Ah, yes, indeed. I didn't look at the patches but given the diff it 
> makes sense
In general that's a good idea and something I had in mind. That said, we will
likely be expanding the list of enabled features there as soon as one arrives.
What should we do in that case? Make sure that before adding new =y option, the
allcode passes in our Xen fork?

~Michal


