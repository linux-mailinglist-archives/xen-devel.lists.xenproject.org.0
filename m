Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPOCE1fq1GkjywcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:28:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A509E3ADAE0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 13:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274916.1560887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4ad-00019J-E0; Tue, 07 Apr 2026 11:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274916.1560887; Tue, 07 Apr 2026 11:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA4ad-00017y-BG; Tue, 07 Apr 2026 11:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1274916;
 Tue, 07 Apr 2026 11:27:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wA4ab-00017e-Oo
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 11:27:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA4ab-00FxYz-4B
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:27:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d4ea0f-bab6-0a2a0a5309dd-0a2a4502a196-18
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:27:24 +0200
Received: from [52.101.85.26]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d4ea1a-42fa-0a2a45020019-3465551ad76b-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 13:27:24 +0200
Received: from BN9PR03CA0941.namprd03.prod.outlook.com (2603:10b6:408:108::16)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 11:27:16 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::c1) by BN9PR03CA0941.outlook.office365.com
 (2603:10b6:408:108::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.27 via Frontend Transport; Tue,
 7 Apr 2026 11:27:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 11:27:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 7 Apr
 2026 06:27:15 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Apr
 2026 06:27:15 -0500
Received: from [172.18.74.250] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Apr 2026 06:27:14 -0500
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
 b=dekDUFsnxRjJ9pN4Mu+LW4fMGaU2qHixsrR+4HXVuwEC2Js8LffbmVhjDRze9h6kgxVP+AZPY/1VDdKWbsgM6AUuUkaObD4ZVVuHSC36B01N5Ax3eYqy4obYR5Zg/QoPq3CSc9UZTqyuEJKHuplL3dYErp2p+PPJZ2hqvSHlNIgYsblxnLOByOjrRc99X2qvfR9q1LKosvHTK6k1r3D7Vne5SRShfrL6qNtNDESSTp3o8qaxPm0K1YuTVcMc6AeVt6YzyScPaWC6z8VfeHGqABekOjvbjH1N46R3yWPYvMJZrzxS8uxaOd7UWZW+gcsBgsNprNtWYe9cafVKBkU5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfsFG8/SjaYpBSB12NCcvkBPt3OK1vfCpzahKSH4t90=;
 b=YCn6zgmAZ1AWcGDYSBkiLrugU4DLUyEB2j5LPwg0NUW9X2e/+nccEIzy2ognbVMq9D636P45HazClVtHlnjCX9uXQpHDPWKWmU9WkmTtwr0Ura1uqgRdiZkbVJhWvNQViSup8qj42WsZXMaIdgVDoZ9bY6wZsOrIIoKuNU+IurEnYhRGQSie7QAAp6zg/lJdJ4jetOViMCfKI08YmZuMpjTqU+KCtUR9YrS34+GQJ8GaaLLoCjJe9Vqr0wi9ZpFHjy14bXtcLAuHZ33advgTURWAbAnqrNNT6PGZvtr9WuK3rQl+nOHmcCvCXTsvtk4Wj5Aqe3QO33mL+HSij6z1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfsFG8/SjaYpBSB12NCcvkBPt3OK1vfCpzahKSH4t90=;
 b=Acl8SLo2xG/dkwfkpYtLjh+5sxyRT+wvNZI/EghRpJhz+2/ytG2siS101uu5ZQ6iOEBHEfXBxVu4vqt2Fa6foMn9Gip7Dkj6rdPF1TPaxbdQxC9DsDX1a0HSyW1AsQyywvlgrDZ2pH6o6Fumi9pr+gii6g7DArN+m/Wg9hHQ0Dc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <7ea3a5d8-f9ff-4296-9b3e-07b9ba184e6f@amd.com>
Date: Tue, 7 Apr 2026 07:27:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
 <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
 <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
 <4dfd48a9-37c1-4f28-87f3-19646a339b08@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <4dfd48a9-37c1-4f28-87f3-19646a339b08@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: f53c86a0-05db-409c-32a7-08de94989f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|30052699003|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZKJd0ICmmE0fTBFwkP2Y3icRB+CeJsVJOvXT/uTL+x+KStmv71Wl5dUZxP5K2A3pCMaRu0aztT0UrOgWQd29HLafGm1v6npyTCG7BPC2k2Q9yLK3Yl5QUh59CE9+wpQRLMVNdUXs8JaQ6v4QkqTl/zvKs91+jAc4U9lYkgLu3tCMFTf8xH2QdIGrs/zFWDQ+YzGsB2G6UMtGmvbDJviXiZxvbfHcwRqPL4O5CfA71/ldYIGQmQM03eZh5bkn1oAbayaiX9Pnq2BQ3iYjmsOKzzeD59r5Y36MaBTdwpDTgQB0dPIy3nDja4l49NtSdra0ZAtwThy8oXybjeUDUx1rxa+y1YqiTPvHVXppTSpCQFyYcVdmxlDQ7kyXEOb9si11w5WZyFd/TXOSNOkBSt8v5K9U+gylsI/6JKP0YlIP9vmWzSU70huw4R11+zAtjIgHd5BaUKGF/5tXwpRElLV9X6ZnUTnEogoduxOoSuSPCoNJh/HpQF6RYLTX/l3xTcaCtmxqnjtvuhRamcxb3yZaS+MeWxEiXLcqoUKKRd7+wsjLxls24Wi9CuGd5A/+FqBtjHymzGQCryao5Oqx5hU7SRvr3C88FhgFrQ7UHiEBHSyPOEG6llOn3VJVzzXAS3eCZ/ddhaaABN5wCSojGy4ogv96QoqdSG+UuSYnmjMBREqa39T7I6UZUn+5VaJMs3F+rJ0QOcCVZECKyc0kSHhX4dNuWrzHY0nMUovPeu+DLo3F4Y4qtdaL/wOpSM8CfqLPwtg3F1FJyJ0l9nuaHH8vFA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(30052699003)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tETvIO5kuCuTVuletiykbkKwrx8IHcOi+8qcPmxqdIr06yzFITnHvyODfS5FDGIw9c7+q1cyAZsM8T/hKcu2nv+A3B6kY5OWGNKXy8gwO/A9wnIOskV92k4lFHxkq7Xkc2UaOwYmc6XnQecBDlrMQRzrZg/E7ApQPSeauCrAxYUIGhMD/jfkA6j0yMDSj4pfsgDLmkLWhrhCdT7DS8wEpelu9jj8145P2sHEpagJUhlAQ+PgF1z34xNibN3KVHTCTS7scKk7rFrnGYFh1WlkKFfcC3LjTpl3z5m49+E7G7CDei2rKAAOQCfouBBR3teSIpzsQE2akk0Aon0tIw1Q8O6wi9yvLTuC4qgPIAD7ET2iPQVEgUJ8hkBh54SNREhNekCvTSVvi0bOkJFcK0+72b4fEOOmdJB6mcDrW5CWHUXxMG8Wz0H6X4DyB/TKRIcM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 11:27:16.1041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f53c86a0-05db-409c-32a7-08de94989f48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454
X-purgate-ID: tlsNG-720697/1775561244-AD53CCD1-50166499/0/0
X-purgate-type: clean
X-purgate-size: 4815
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: A509E3ADAE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 02:18, Jan Beulich wrote:
> On 03.04.2026 10:47, Stewart Hildebrand wrote:
>> On 4/1/26 09:03, Jan Beulich wrote:
>>> On 01.04.2026 14:57, Jürgen Groß wrote:
>>>> On 01.04.26 14:29, Jan Beulich wrote:
>>>>> Leaving aside highly disaggregated environments, the control domain is
>>>>> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
>>>>> be able to run unconditionally, not those of the domain with ID 0 (which
>>>>> may not exist at all).
>>>>>
>>>>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> There being no "else" to the if(), what about other control domain vCPU-s?
>>>>
>>>> I guess this is a stale leftover. Doesn't matter for committing anyway.
>>>>
>>>>> ---
>>>>> v3: Don't mistakenly include the idle domain.
>>>>> v2: New.
>>>>>
>>>>> --- a/xen/common/sched/arinc653.c
>>>>> +++ b/xen/common/sched/arinc653.c
>>>>> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>>>>>       spin_lock_irqsave(&sched_priv->lock, flags);
>>>>>   
>>>>>       /*
>>>>> -     * Add every one of dom0's units to the schedule, as long as there are
>>>>> -     * slots available.
>>>>> +     * Add every one of the control domain's units to the schedule, as long as
>>>>> +     * there are slots available.
>>>>>        */
>>>>> -    if ( unit->domain->domain_id == 0 )
>>>>> +    if ( is_control_domain(unit->domain) && !is_idle_domain(unit->domain) )
>>>>>       {
>>>>>           entry = sched_priv->num_schedule_entries;
>>>>>   
>>>>
>>>> Hmm, is it really the control domain only which wants to be scheduled initially?
>>>> I would think that at least the hardware domain and probably a Xenstore domain
>>>> would want to be included, too.
>>>>
>>>> In the end it might even be that other domains created via dom0less would want
>>>> to be able to run initially. They could be part of a mandatory infrastructure.
>>>> Why would they need to be created at boot if they are NOT important?
>>>
>>> This part is easy to answer: Because in a dom0less setup you simply may have
>>> no toolstack at all. (At which point there may also be nothing to set a
>>> schedule, yes.)
>>
>> This is a known limitation. In a dom0less/hyperlaunch scenario, as future work,
>> I would like to see the ability to configure the ARINC653 schedule in device
>> tree, which would likely extend the existing boot time cpu pool work.
>>
>>>> The question is whether the arinc653 scheduler is really meant for such setups.
>>>> OTOH just modifying the test to:
>>>>
>>>>      if ( system_state < SYS_STATE_active &&
>>>>           unit->domain->domain_id < DOMID_FIRST_RESERVED )
>>>>
>>>> seems to be fine for catching all those cases.
>>>>
>>>> With or without this modification:
>>>>
>>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>>
>>> Thanks, yet I'll have to leave to the maintainers to decide which form it
>>> should ultimately take. One remark: A restartable control domain wouldn't
>>> pass that conditional. Granted that's looking far into the future.
>>
>> It may not be desirable to schedule domUs until the control domain has had a say
>> in the matter, considering that the default schedule is unlikely to contain the
>> desired minor frame runtimes. It's less clear whether to include hardware and
>> xenstore domains in the default schedule, though I'm leaning toward only
>> including the domain with ability to invoke XEN_SYSCTL_SCHEDOP_putinfo for now
>> (i.e. the control domain).
>>
>> Hm, the suggested 'system_state < SYS_STATE_active' check is possibly a good
>> addition. This reinforces that the default schedule's purpose is merely to get a
>> system booting until a user-provided schedule can be installed. Without this
>> check, restarting the control domain could result in new entries being added
>> while old entries remain, possibly ending up with duplicates and/or exhausting
>> the schedule. However, the restarted domain would need to retain its uuid if it
>> expects to be scheduled after restart.
>>
>> Lastly, we may consider restricting the default schedule to Pool-0, and
>> eventually we may want a mechanism to disable the default schedule altogether
>> (e.g. when boot time cpupools are in use), but I don't think it's necessary to
>> conflate those with the current patch.
> 
> So what does all of this mean for the patch here? Should I switch to Jürgen's
> suggestion? Should I merely add the system_state check, but otherwise keep as
> is? Or should I not change anything?

I think the patch is good as is, but I just want to give it a few more days to
give Nate or others a chance to chime in. I'll follow up next week if there's no
further discussion.

