Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH3NLp011mlZBwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:01:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE03BB0A8
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 13:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275713.1561466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQf3-0002Ss-B9; Wed, 08 Apr 2026 11:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275713.1561466; Wed, 08 Apr 2026 11:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQf3-0002Py-8J; Wed, 08 Apr 2026 11:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1275713;
 Wed, 08 Apr 2026 11:01:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAQf1-0002Pm-Hs
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 11:01:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQez-005KIO-Be
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:01:26 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d63583-e002-0a2a0a5209dd-0a2a450c9878-24
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:01:26 +0200
Received: from [52.101.52.20]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d63585-f40c-0a2a450c0019-34653414e16e-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 13:01:26 +0200
Received: from BN9PR03CA0365.namprd03.prod.outlook.com (2603:10b6:408:f7::10)
 by CY3PR12MB9580.namprd12.prod.outlook.com (2603:10b6:930:10a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:01:22 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::24) by BN9PR03CA0365.outlook.office365.com
 (2603:10b6:408:f7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 11:01:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 11:01:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 06:01:21 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 06:01:08 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 8 Apr 2026 06:01:07 -0500
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
 b=UYly3IxmaPq8L3hw/d+Y0HcVX87rEq0tTfXQeO/zh5hKzH+NlQbMuZV/+MlMzYWqh7+9VWuGKhh1WGdalhKmc1GaDFK8sbhMXk+v+dFqwvjf4Imq4JSuoYZXl3yAfk9DizejwaeMqHSluRfzF6TZ06vD19dW3nnTgD+4xInEAZaaO8g/tpBvH1b/Salk4QyJw9p351eGNGLf7pNjKODbb5DZs73WKhesNB+AUI/v2JsGz2bA9Psbt3tE2gwlqSCoe8S/n9y8ksBuhROl1+TFmP+48eowTAD527lW7PsaWCjQk9vxwPPAvS+F7yvG7OEuJTAa0q17fKc+69RzQaejLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9/oM4e5REMMaLpgogGrdx+1RpVuC9eOrJ43E8qEBiI=;
 b=ai8jL7YzhP8t/uS5zJ09kORAgV+xfBVhnmp6WtrK8R5j/D1VFNFxvGyYpTBMCGuVKkcskELkR4yxqvgqf/2IGqj1mCpSygvkr5WmpAX5mxqXZuuls4toetYagbT4qKOTlFMO7UZ/ygRLR3gKZD1hEAlw62YjdyC08fcwMoXLVwTASl8BeqRgJcja9Lt9CkC2PXGdqOzv8GbqyD3okRuInaDN7oD9Y12i0YfRmmj4AfghQLWUtvFwGbWoumrbiLTwsgERzF38lfu+MIj04qlU1F3+25OhnKzksgO/fWMSN8mSXSsrkWL6bvn07oxmedW87/aFkUBCZ31MgXeQubUKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9/oM4e5REMMaLpgogGrdx+1RpVuC9eOrJ43E8qEBiI=;
 b=f5iuounG/H5jziVh47BJ1tZF0Lb+XPSGCyccoVasIm1Pi/DJHzkGpd7jEB7HHw+Y+2kbDZFY3Riizg57RuGYpCkfBwxbbyAwozOVLmP3DXR76Umnf1M9kj+seGLanEoe+SLt8Wpd7HS2o71WY6RNBTWfIFs8MQ+OmE1Q9FGX6RY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <1b0e5252-f28c-425e-b982-f023f8976ec4@amd.com>
Date: Wed, 8 Apr 2026 13:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Final series to make Arm MISRA allcode green
To: Andrew Cooper <andrew.cooper3@citrix.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Rahul
 Singh" <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <68cea196-efdc-4481-9e4b-bb450bcd2071@citrix.com>
 <bdb8e991bbd200de2f0af5991304dffb@bugseng.com>
 <14185c87-84c0-4019-a3f6-50587b941350@citrix.com>
 <7fbcb3d1ccdcf6fabb45f5805b504096@bugseng.com>
 <18ab9849-f525-46cf-a244-d8125bef1655@amd.com>
 <cf083203-7258-491c-8dbb-6ffe62418811@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <cf083203-7258-491c-8dbb-6ffe62418811@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CY3PR12MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: 856d90d5-a1ab-49c7-b5ae-08de955e2ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8wnUtX073Iiz7hXjt4WNEjVWgz8LcdnHbhPGYSDtQqVsxGQCvzvWsExe9ilPABVXSv4/Yl+UZ3CZS/eGmSQ3m+uoDHH4xWX2aEu2HQPuXZIsel/69PxPebGx1PW5iI+hUPdA0GHB8KrCWkxw2otdJvhDOi/OjhsdJjZP0a2pHDdYHkZPGesL/97/vee4nddBORhrCSZ1PTpBvfPZp7IKX5bAUTlyPH9q7zVLF5Zw9/mgyhxIISiAzl7JOTZjea8DyTvNcalAddMUI8JruEWQ8foLEi+VEv8pjNAQs67vpcPCnpLayV3IzAF6/jt52q06YKgVDku2SiRHRn68TsJMnXL+WTue2nsBwN1v8sWRhNFm7aCa+zRPlTT2+7BRhdTf8/bEy5uPtI91AdritzNyf0BuB32UjVds2dNJNL9iIoDAaJ2fits1IzZ6f25Pw3zD2DtPISwQZPciTU4sT0l+TUiXdFKoaZpLLsn2RuTyLUwtcd520x3V8ez0/dSVczgy5CBkMOys/kBOGw6Dfx4o4yH5d9saOWOT53fMtXAuHOX5NeS7VA0HH/M70X7MChSBbzSxLnC6WM3n3D9gom5rpzAQDr2mcrAkEWvi44MVEQjDFtstZt4Pi1gO9IK7Bq7X7zb68aFcZ4mSLV1q4j+WEr67XJrNkJIo4SY/O7Rf6NOragUrF4AUHkZavmeKd/VKndi/wnYA2r2ZyqgzIVqhs+e5K1AJW8sZwNEF4yrD+tY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2HWXbgsXwKIBwG+PWe2tJw+HXT52QkbsLBn+Gz3Qb/mXD2vRTpU7jIa4CN3G9DO3VaF8KbxgeKaqE7A0kOdcvOMCIWu1QyCe3wS8C5NNypjFArQVy2l2HslRhfXlvlycIroeg9yvQqkBHiPzOUIwQy6q2l+m5N7/OOqDrMGP1yhQXpi5nshbomlmVluQW9nCHkopkHdV7oRE0S6O2pPVZ6SIrwB/lsNBicGsAGYL2fKFH3RmFL1y1uLpbu70n/wXUHsVF/9z9yZiyzdwssc4CD15BrFvcDwbFUW1sZeSOtTixmfPyk0L4PDu7TFXEUQPkunU6kD6J4VJvylXSSLhDH8ZHHGehB3d0PVrcbvqgqJU0/ycnHpciukgqx6uf6FClXV0/IFOWP3dryK6/QyElgdA3kiI5DOna8Iokyv8+h7t/4etn3pQGUIyyfdo03Fy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 11:01:22.4710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 856d90d5-a1ab-49c7-b5ae-08de955e2ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9580
X-purgate-ID: tlsNG-d25034/1775646086-FD358A3D-5A7C1E0E/0/0
X-purgate-type: clean
X-purgate-size: 2565
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[amd.com:query timed out];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,gitlab.com:url]
X-Rspamd-Queue-Id: 3CEE03BB0A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 08/04/2026 12:42, Andrew Cooper wrote:
> On 08/04/2026 11:36 am, Orzel, Michal wrote:
>>
>> On 08/04/2026 12:21, Nicola Vetrini wrote:
>>> On 2026-04-08 11:51, Andrew Cooper wrote:
>>>> On 08/04/2026 10:46 am, Nicola Vetrini wrote:
>>>>> On 2026-04-08 11:22, Andrew Cooper wrote:
>>>>>> On 07/04/2026 11:34 am, Michal Orzel wrote:
>>>>>>> No more regressions for clean guidelines:
>>>>>>> https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2433943072
>>>>>>>
>>>>>>> Michal Orzel (2):
>>>>>>>   iommu/arm: smmu: Fix variable shadowing
>>>>>>>   iommu/arm: ipmmu-vmsa: Fix variable shadowing
>>>>>>>
>>>>>>>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>>>>>>>  xen/drivers/passthrough/arm/smmu.c       | 7 +++----
>>>>>>>  2 files changed, 5 insertions(+), 8 deletions(-)
>>>>>> If all the violations are fixed, should this test be made blocking?
>>>>>>
>>>>>> ~Andrew
>>>>> Only if they are also clean on x86; otherwise an arm-specific list of
>>>>> clean rules should be made (probably better). @Michal what do you 
>>>>> prefer?
>>>>>
>>>> All I'm suggesting is this:
>>>>
>>>> xen.git/xen$ git diff
>>>> diff --git a/automation/gitlab-ci/analyze.yaml 
>>>> b/automation/gitlab-ci/analyze.yaml
>>>> index 4e9af9d60224..f01798c5dee6 100644
>>>> --- a/automation/gitlab-ci/analyze.yaml
>>>> +++ b/automation/gitlab-ci/analyze.yaml
>>>> @@ -149,7 +149,7 @@ eclair-ARM64-allcode:
>>>>        CONFIG_STACK_PROTECTOR=y
>>>>        CONFIG_UNSUPPORTED=y
>>>>        CONFIG_VM_EVENT=y
>>>> -  allow_failure: true
>>>> +  allow_failure: false
>>>>  
>>>>  eclair-ARM64-testing:
>>>>    extends: eclair-ARM64-allcode
>>>>
>>>>
>>>> so regressions become blocking.
>>>>
>>>> ~Andrew
>>> Ah, yes, indeed. I didn't look at the patches but given the diff it 
>>> makes sense
>> In general that's a good idea and something I had in mind. That said, we will
>> likely be expanding the list of enabled features there as soon as one arrives.
>> What should we do in that case? Make sure that before adding new =y option, the
>> allcode passes in our Xen fork?
> 
> New code could be clean as it goes in.  At this point, it's not
> interestingly different from "does it compile" as a prerequisite.
I can see there are some missing features like static memory/shared memory but
they are tested as part of AMD (it would still be good to have all listed in
allcode). Additionally, we could enable early printk with some dummy values to
cover early_printk.c

~Michal


