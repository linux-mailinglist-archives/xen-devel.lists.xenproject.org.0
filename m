Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAF/Gl1f3mn+CQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 17:38:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A893D3FBFC5
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 17:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282015.1564715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCfO7-0000FU-IO; Tue, 14 Apr 2026 15:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282015.1564715; Tue, 14 Apr 2026 15:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCfO7-0000Dn-EY; Tue, 14 Apr 2026 15:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1282015;
 Tue, 14 Apr 2026 15:09:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wCfO5-0000Dh-OH
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCfO5-009Jqk-4G
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 17:09:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de5890-2eae-0a2a0a5409dd-0a2a4501a0b6-16
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 17:09:12 +0200
Received: from [40.93.201.13]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69de5897-c1f2-0a2a45010019-285dc90d7eea-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 17:09:12 +0200
Received: from CY8PR11CA0037.namprd11.prod.outlook.com (2603:10b6:930:4a::29)
 by MW3PR12MB4474.namprd12.prod.outlook.com (2603:10b6:303:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 15:09:06 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:930:4a:cafe::3) by CY8PR11CA0037.outlook.office365.com
 (2603:10b6:930:4a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:09:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 15:09:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 10:09:05 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Apr
 2026 08:09:05 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Apr 2026 10:09:04 -0500
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
 b=eSBa7Ye7ZBFcKKiB6jh26xvEZiIenchoGWuAfY94p7QcKoVTQYNAa3/e3MEEgypn39IGX9ul7dW2YS1Jv0OG4d35B+ioua370gwAa416kRGy7ZPCcsd8Fz0cx1nynl80aOUZnHj/D2cuWKjM+tcVvP+dokxDAzy4MQawnXMKO5kc4yILqILUCaMBqXQHwVkaiVbLCBbAFf4F/Jcv8VzpqSfhhQFVk6S/4PptSneSbeqeC3DK8k+0rG2065bd5L3eE1eEc09WyhmmLm6KXBVMorTrnR3EgiSK0eNYDLsFKquALapDLE4r2/BiVvr+oWFxau5rFmjQlSImNF9hhPrRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPnLa69NK5YQDa5XdNtqbH6KdIGMfRh498olWKYQckE=;
 b=QYW3ito3ZuxQVpG4nUQRBAtsB1ReoqcFQO2eCnInSa7bB5CmV79z37o6ygEtxdQAw1qjosbNJsVT8lEHN51KxqxN1W0MUnjwaYZzeIqcTwR1kYnCrTPoDAokYqIFMetgCT6NEFAquW/EEkw3pg9PXtkscKh3hYbLOI4+eHLNATXjW8h2THjb2VgyOf2DNitWbFHqiR34kjAVLguPHJgyeeqH1LjevUGss9qxbPaifpEkajMBuiVRCOqRBD5K7QOhs4o4PpF5MRoDJRqd4rV9vDW+tV/wFSlLoMAUTiVhc+EeL7S6rh6pAtml7mQhU8j1Dpv/Q0Qy/j8oAiRXobsufQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPnLa69NK5YQDa5XdNtqbH6KdIGMfRh498olWKYQckE=;
 b=TvGUJHjFwSDwBHCSiA4ErT+BbIVmkh9MjunIzDW5xkqO7k/3X7kzfpWJOqTIVAz3tBanfR/QyWldSp1anoyKg3giJKPwEPLu3vGJCcN+TATUvodfU981/iAuMnSTU0cuIes7CvxBaIXmgKGIuJW9mL+mimkLaJtywqMIN0n2hDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <df9e3f30-6130-42ba-b90c-749a2f195074@amd.com>
Date: Tue, 14 Apr 2026 17:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: flushtlb: Optimize
 ARM64_WORKAROUND_REPEAT_TLBI
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Mark Rutland <Mark.Rutland@arm.com>
References: <20260414081124.48741-1-michal.orzel@amd.com>
 <5098DD0F-9FA9-469B-BAAA-2CA0C1382FA0@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5098DD0F-9FA9-469B-BAAA-2CA0C1382FA0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|MW3PR12MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: b3274379-0224-4e0b-968f-08de9a37c57b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003|18096099003;
X-Microsoft-Antispam-Message-Info:
	9dsfwOpcakas2/KZ/RN084Jlqlk2JK1YJsvxdWfCSs76fylVVOZpIhddh+z/KC1sHvhMEjhrtY9vj5q/7uiQ/9O3FRGAwiaTn5tvuD4CIU6Ta+YTJN42oUjUptoscBc4U7vEliRTxSGum3OgqUwVf7x2mUi8VIbQ4cvqs2gAqEPHB7emndawtBqYswbaWUVtgGJgvBTiR2+4K1ArF6C42PE6WWhFHYB7j0epso0yNwKDTkPPzxfVAAmb7GjMPaGOV3tfCC4Z+7PFlgCIP1cuPVRap4d9w4E9uq19Qzcs2LLjWWCT+XOiqtORVoWNw+DIAMIcIbtDsVhN08YL6qQZQfawGIeym6FO5TGsbjFzIUPcBwZrYB1fvqV7Pl+4jRGbv4E2k/MVhsnmmQ1NkEBdBzXJg/0ncL+6d0qPnLsD3YlUASciEEa4B9fmrINkDV0TzgGWVTZvpMFMdLeV+qkrNZqb5hmrhbLV/NmshavYNdllEDXYnOm0adVUPbA8CjYw3GP8Hr1jTO/xhguIEo1VZRECiD4PKIuHWCP2aK5r/zFjOQR9N17Yf0rS+sobyqz9Rfc5Wx5KT+4RK92B57dGPaDGTVd2dLA4Qt1zJ584y2YtJpdfl11LyviLYZLxmhP1enTbACKOwctz8JRu4zPaMgNlEbFMlZDYDtYbrwKLQsbitGJwwO18GYiPRbgXXxjtppz+K+U2Rijhlj+IMOwf7MQhvbSf7HmjKZAERZ4q/zCSj3WRM7hTzGukMqPF+PLHTfpmJnytGfwFdFlbgXUNJO4XQWFVj9vUdIfA1xqqlhw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(18096099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tOstmmu6fGaep4AqO0vOXrVCJwjtgVUuvBfuQyHIh2PqRyaRb+0mcZ0i3KIWjFkzZBF6u6VQtd3Cd2NkhuKJA/+ej3yzVnGiDSzO//CydM7zhR9aCEmXkbGrrXIV3vPHlJBhI+ps0Akpiw6/IIr8t0TcoIoo5AaLoN52OfEVBTiwA9xVV5vorPVMtAqHT66UTKZQ67xtSTGj8DozHaJPZ+Q2zw8KJtmev58eNIytWLMMDbekjdkbKIfE4YwLWnCQ+Sx/huO9TbS2flDZbavINinM1cPqZA2bWPJ7X7aoWO3ytReqRFZTUnTRyHGBjulzRnlcC7VaIpbQwPDtOSF6BSfjEcyKPp0AVcCy39Gho+11TSq4jNdy8cjL6joNKfOclDW51OqH9ZUBvI0l0+71RTSpbCmgE2m2b5q1ON8PQfm+Pr2WtEljYTCpV2496CxO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:09:05.9423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3274379-0224-4e0b-968f-08de9a37c57b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4474
X-purgate-ID: tlsNG-d62444/1776179352-B727DFF4-01CA152A/0/0
X-purgate-type: clean
X-purgate-size: 13844
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
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:Mark.Rutland@arm.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: A893D3FBFC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 14/04/2026 16:00, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 14 Apr 2026, at 09:11, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> The ARM64_WORKAROUND_REPEAT_TLBI workaround is used to mitigate several
>> errata where broadcast TLBI;DSB sequences don't provide all the
>> architecturally required synchronization. The workaround performs more
>> work than necessary, and can have significant overhead. This patch
>> optimizes the workaround, as explained below.
>>
>> 1. All relevant errata only affect the ordering and/or completion of
>>   memory accesses which have been translated by an invalidated TLB
>>   entry. The actual invalidation of TLB entries is unaffected.
>>
>> 2. The existing workaround is applied to both broadcast and local TLB
>>   invalidation, whereas for all relevant errata it is only necessary to
>>   apply a workaround for broadcast invalidation.
>>
>> 3. The existing workaround replaces every TLBI with a TLBI;DSB;TLBI
>>   sequence, whereas for all relevant errata it is only necessary to
>>   execute a single additional TLBI;DSB sequence after any number of
>>   TLBIs are completed by a DSB.
>>
>>   For example, for a sequence of batched TLBIs:
>>
>>       TLBI <op1>[, <arg1>]
>>       TLBI <op2>[, <arg2>]
>>       TLBI <op3>[, <arg3>]
>>       DSB ISH
>>
>>   ... the existing workaround will expand this to:
>>
>>       TLBI <op1>[, <arg1>]
>>       DSB ISH                  // additional
>>       TLBI <op1>[, <arg1>]     // additional
>>       TLBI <op2>[, <arg2>]
>>       DSB ISH                  // additional
>>       TLBI <op2>[, <arg2>]     // additional
>>       TLBI <op3>[, <arg3>]
>>       DSB ISH                  // additional
>>       TLBI <op3>[, <arg3>]     // additional
>>       DSB ISH
>>
>>   ... whereas it is sufficient to have:
>>
>>       TLBI <op1>[, <arg1>]
>>       TLBI <op2>[, <arg2>]
>>       TLBI <op3>[, <arg3>]
>>       DSB ISH
>>       TLBI <opX>[, <argX>]     // additional
>>       DSB ISH                  // additional
>>
>>   Using a single additional TBLI and DSB at the end of the sequence can
> 
> NIT: Typo s/TBLI/TLBI
> 
>>   have significantly lower overhead as each DSB which completes a TLBI
>>   must synchronize with other PEs in the system, with potential
>>   performance effects both locally and system-wide.
>>
>> 4. The existing workaround repeats each specific TLBI operation, whereas
>>   for all relevant errata it is sufficient for the additional TLBI to
>>   use *any* operation which will be broadcast, regardless of which
>>   translation regime or stage of translation the operation applies to.
>>
>>   For example, for a single TLBI:
>>
>>       TLBI ALLE2IS
>>       DSB ISH
>>
>>   ... the existing workaround will expand this to:
>>
>>       TLBI ALLE2IS
>>       DSB ISH
>>       TLBI ALLE2IS             // additional
>>       DSB ISH                  // additional
>>
>>   ... whereas it is sufficient to have:
>>
>>       TLBI ALLE2IS
>>       DSB ISH
>>       TLBI VALE1IS, XZR        // additional
>>       DSB ISH                  // additional
>>
>>   As the additional TLBI doesn't have to match a specific earlier TLBI,
>>   the additional TLBI can be implemented in separate code, with no
>>   memory of the earlier TLBIs. The additional TLBI can also use a
>>   cheaper TLBI operation.
>>
>> 5. The existing workaround is applied to both Stage-1 and Stage-2 TLB
>>   invalidation, whereas for all relevant errata it is only necessary to
>>   apply a workaround for Stage-1 invalidation.
>>
>>   Architecturally, TLBI operations which invalidate only Stage-2
>>   information (e.g. IPAS2E1IS) are not required to invalidate TLB
>>   entries which combine information from Stage-1 and Stage-2
>>   translation table entries, and consequently may not complete memory
>>   accesses translated by those combined entries. In these cases,
>>   completion of memory accesses is only guaranteed after subsequent
>>   invalidation of Stage-1 information (e.g. VMALLE1IS).
>>
>> Rework the workaround logic as follows:
>> - add TLB_HELPER_LOCAL() to be used for local TLB ops without a
>>   workaround,
>> - modify TLB_HELPER() workaround to use tlbi vale2is, xzr as a second
>>   TLB,
> 
> TLBI ?
> 
>> - drop TLB_HELPER_VA(). It's used only by __flush_xen_tlb_one_local
>>   which is local and does not need workaround and by
>>   __flush_xen_tlb_one. In the latter case, since it's used in a loop,
>>   we don't need a workaround in the middle. Add __tlb_repeat_sync with
>>   a workaround to be used at the end after DSB and before final ISB,
>> - TLBI VALE2IS passing XZR is used as an additional TLBI. While there is
>>   an identity mapping there, it's used very rarely. The performance
>>   impact is therefore negligible. If things change in the future, we
>>   can revisit the decision.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Linux counterpart (already merged):
>> https://lore.kernel.org/linux-arm-kernel/20260218164348.2022831-1-mark.rutland@arm.com/
>> ---
>> xen/arch/arm/include/asm/arm32/flushtlb.h |   3 +
>> xen/arch/arm/include/asm/arm64/flushtlb.h | 108 ++++++++++++++--------
>> xen/arch/arm/include/asm/flushtlb.h       |   1 +
>> 3 files changed, 71 insertions(+), 41 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
>> index 61c25a318998..5483be08fbbe 100644
>> --- a/xen/arch/arm/include/asm/arm32/flushtlb.h
>> +++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
>> @@ -57,6 +57,9 @@ static inline void __flush_xen_tlb_one(vaddr_t va)
>>     asm volatile(STORE_CP32(0, TLBIMVAHIS) : : "r" (va) : "memory");
>> }
>>
>> +/* Only for ARM64_WORKAROUND_REPEAT_TLBI */
>> +static inline void __tlb_repeat_sync(void) {}
>> +
>> #endif /* __ASM_ARM_ARM32_FLUSHTLB_H__ */
>> /*
>>  * Local variables:
>> diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
>> index 3b99c11b50d1..1606b26bf28a 100644
>> --- a/xen/arch/arm/include/asm/arm64/flushtlb.h
>> +++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
>> @@ -12,9 +12,14 @@
>>  * ARM64_WORKAROUND_REPEAT_TLBI:
>>  * Modification of the translation table for a virtual address might lead to
>>  * read-after-read ordering violation.
>> - * The workaround repeats TLBI+DSB ISH operation for all the TLB flush
>> - * operations. While this is strictly not necessary, we don't want to
>> - * take any risk.
>> + * The workaround repeats TLBI+DSB ISH operation for broadcast TLB flush
>> + * operations. The workaround is not needed for local operations.
>> + *
>> + * It is sufficient for the additional TLBI to use *any* operation which will
>> + * be broadcast, regardless of which translation regime or stage of translation
>> + * the operation applies to. TLBI VALE2IS is used passing XZR. While there is
>> + * an identity mapping there, it's only used during suspend/resume, CPU on/off,
>> + * so the impact (performance if any) is negligible.
>>  *
>>  * For Xen page-tables the ISB will discard any instructions fetched
>>  * from the old mappings.
>> @@ -26,69 +31,90 @@
>>  * Note that for local TLB flush, using non-shareable (nsh) is sufficient
>>  * (see D5-4929 in ARM DDI 0487H.a). Although, the memory barrier in
>>  * for the workaround is left as inner-shareable to match with Linux
>> - * v6.1-rc8.
>> + * v6.19.
>>  */
>> -#define TLB_HELPER(name, tlbop, sh)              \
>> +#define TLB_HELPER_LOCAL(name, tlbop)            \
>> static inline void name(void)                    \
>> {                                                \
>>     asm_inline volatile (                        \
>> -        "dsb  "  # sh  "st;"                     \
>> +        "dsb  nshst;"                            \
>>         "tlbi "  # tlbop  ";"                    \
>> -        ALTERNATIVE(                             \
>> -            "nop; nop;",                         \
>> -            "dsb  ish;"                          \
>> -            "tlbi "  # tlbop  ";",               \
>> -            ARM64_WORKAROUND_REPEAT_TLBI,        \
>> -            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
>> -        "dsb  "  # sh  ";"                       \
>> +        "dsb  nsh;"                              \
>>         "isb;"                                   \
>>         : : : "memory");                         \
>> }
>>
>> -/*
>> - * FLush TLB by VA. This will likely be used in a loop, so the caller
>> - * is responsible to use the appropriate memory barriers before/after
>> - * the sequence.
>> - *
>> - * See above about the ARM64_WORKAROUND_REPEAT_TLBI sequence.
>> - */
>> -#define TLB_HELPER_VA(name, tlbop)               \
>> -static inline void name(vaddr_t va)              \
>> -{                                                \
>> -    asm_inline volatile (                        \
>> -        "tlbi "  # tlbop  ", %0;"                \
>> -        ALTERNATIVE(                             \
>> -            "nop; nop;",                         \
>> -            "dsb  ish;"                          \
>> -            "tlbi "  # tlbop  ", %0;",           \
>> -            ARM64_WORKAROUND_REPEAT_TLBI,        \
>> -            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI) \
>> -        : : "r" (va >> PAGE_SHIFT) : "memory");  \
>> +#define TLB_HELPER(name, tlbop)                       \
>> +static inline void name(void)                         \
>> +{                                                     \
>> +    asm_inline volatile (                             \
>> +        "dsb  ishst;"                                 \
>> +        "tlbi "  # tlbop  ";"                         \
>> +        ALTERNATIVE(                                  \
>> +            "nop; nop;",                              \
>> +            "dsb  ish;"                               \
>> +            "tlbi vale2is, xzr;",                     \
>> +            ARM64_WORKAROUND_REPEAT_TLBI,             \
>> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)      \
>> +        "dsb  ish;"                                   \
>> +        "isb;"                                        \
>> +        : : : "memory"); \
>> }
>>
>> /* Flush local TLBs, current VMID only. */
>> -TLB_HELPER(flush_guest_tlb_local, vmalls12e1, nsh)
>> +TLB_HELPER_LOCAL(flush_guest_tlb_local, vmalls12e1)
>>
>> /* Flush innershareable TLBs, current VMID only */
>> -TLB_HELPER(flush_guest_tlb, vmalls12e1is, ish)
>> +TLB_HELPER(flush_guest_tlb, vmalls12e1is)
>>
>> /* Flush local TLBs, all VMIDs, non-hypervisor mode */
>> -TLB_HELPER(flush_all_guests_tlb_local, alle1, nsh)
>> +TLB_HELPER_LOCAL(flush_all_guests_tlb_local, alle1)
>>
>> /* Flush innershareable TLBs, all VMIDs, non-hypervisor mode */
>> -TLB_HELPER(flush_all_guests_tlb, alle1is, ish)
>> +TLB_HELPER(flush_all_guests_tlb, alle1is)
>>
>> /* Flush all hypervisor mappings from the TLB of the local processor. */
>> -TLB_HELPER(flush_xen_tlb_local, alle2, nsh)
>> +TLB_HELPER_LOCAL(flush_xen_tlb_local, alle2)
>> +
>> +#undef TLB_HELPER_LOCAL
>> +#undef TLB_HELPER
>> +
>> +/*
>> + * FLush TLB by VA. This will likely be used in a loop, so the caller
>> + * is responsible to use the appropriate memory barriers before/after
>> + * the sequence.
>> + */
>>
>> /* Flush TLB of local processor for address va. */
>> -TLB_HELPER_VA(__flush_xen_tlb_one_local, vae2)
>> +static inline void __flush_xen_tlb_one_local(vaddr_t va)
>> +{
>> +    asm_inline volatile (
>> +        "tlbi vae2, %0" : : "r" (va >> PAGE_SHIFT) : "memory");
>> +}
>>
>> /* Flush TLB of all processors in the inner-shareable domain for address va. */
>> -TLB_HELPER_VA(__flush_xen_tlb_one, vae2is)
>> +static inline void __flush_xen_tlb_one(vaddr_t va)
>> +{
>> +    asm_inline volatile (
>> +        "tlbi vae2is, %0" : : "r" (va >> PAGE_SHIFT) : "memory");
>> +}
>>
>> -#undef TLB_HELPER
>> -#undef TLB_HELPER_VA
>> +/*
>> + * ARM64_WORKAROUND_REPEAT_TLBI:
>> + * For all relevant erratas it is only necessary to execute a single
>> + * additional TLBI;DSB sequence after any number of TLBIs are completed by DSB.
>> + */
>> +static inline void __tlb_repeat_sync(void)
>> +{
>> +    asm_inline volatile (
>> +        ALTERNATIVE(
>> +            "nop; nop;",
>> +            "tlbi vale2is, xzr;"
>> +            "dsb  ish;",
>> +            ARM64_WORKAROUND_REPEAT_TLBI,
>> +            CONFIG_ARM64_WORKAROUND_REPEAT_TLBI)
>> +        : : : "memory");
>> +}
>>
>> #endif /* __ASM_ARM_ARM64_FLUSHTLB_H__ */
>> /*
>> diff --git a/xen/arch/arm/include/asm/flushtlb.h b/xen/arch/arm/include/asm/flushtlb.h
>> index e45fb6d97b02..c292c3c00d29 100644
>> --- a/xen/arch/arm/include/asm/flushtlb.h
>> +++ b/xen/arch/arm/include/asm/flushtlb.h
>> @@ -65,6 +65,7 @@ static inline void flush_xen_tlb_range_va(vaddr_t va,
>>         va += PAGE_SIZE;
>>     }
>>     dsb(ish); /* Ensure the TLB invalidation has completed */
>> +    __tlb_repeat_sync();
> 
> More a question here rather than a comment, shall we have a comment on top
> of this stating that it’s deliberate to have it before the isb?
> Or developer should infer it from the code and from git blame?
I think the explanation in flushtlb.h and commit msg should be enough. To
understand it fully, you still need to read the complete message to get a full
picture, so I don't think that adding a commit with one sentence improves the
situation.

> 
>>     isb();
>> }
>>
>> -- 
>> 2.43.0
>>
>>
> 
> With these fixed:
The NITs can be fixed on commit provided no other remarks from other
maintainers, specifically @Julien.

~Michal


