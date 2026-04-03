Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB+QG5KAz2mvwgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 10:55:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD931392647
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 10:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272690.1560107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8aIg-0006HR-Df; Fri, 03 Apr 2026 08:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272690.1560107; Fri, 03 Apr 2026 08:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8aIg-0006Fm-Am; Fri, 03 Apr 2026 08:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1272690;
 Fri, 03 Apr 2026 08:54:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w8aIe-0006Fg-6V
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 08:54:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8aId-007YVz-BS
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 10:54:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69cf803d-5cb7-0a2a0a5109dd-0a2a4501c6b6-14
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 10:54:42 +0200
Received: from [40.107.201.24]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69cf8051-6fc9-0a2a45010019-286bc918806a-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 10:54:42 +0200
Received: from PH7P220CA0061.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::25)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 08:54:37 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:510:32c:cafe::ae) by PH7P220CA0061.outlook.office365.com
 (2603:10b6:510:32c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Fri,
 3 Apr 2026 08:54:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Fri, 3 Apr 2026 08:54:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 3 Apr
 2026 03:54:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Apr
 2026 03:54:36 -0500
Received: from [172.24.72.131] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 3 Apr 2026 03:54:35 -0500
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
 b=wV+uT3gA4veXlDBeuaKpmHxs6qa0LV89yFzmCgz3n4GjBXTQQ0WuLhzEQ0UcMCxGRWq53itgQoLu/Nm4UtaRAVYYwnopsTrABadCTzj7HZcKuBDkYhOs60hze8755P80a0hQ+oEjOWoH5XPn6RCTDyJEQzK5MB2RUEg+P0KfdvXJuHYTrHrVLuDU1th5NOs+Dd+hWh+e3iZWujuTsfp/HCxd0fQkXEm584tfRJGlsunc4jd5yH4UX9wooBldBPCb4/8RO4XN75DhpaLRuGZ/4GJe+yrg3JjgL4/9bCIbBt1ChiFOjwHQXedydjrZg9bfe8i4O4sMyGT476SQHPbIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pUPD6ERaLox44Hs8k1Jg3sa3tTqiLYmT0AJ6/LvpnM=;
 b=ahNtCifhCSqcVgRwbw5igtBj/2hz6hZbZ5NfPrWMLAS2noC9BcIu8rcCcbdxiw4thpW86wHoj/Bon/RHBxfLnSCZe7Z5Wyy96xt/WI5gQP+4/lRcUguIHfqRA7Yg23fE6wn+ZVoiIyXUtGX1+kN8ctiUZbPWtIh78CHzVz/Ug60lzAMsZNAQ4ms849d0/FpaWKfibW4Govp3+stvlK6PU+s80rBeZPi6oU0V778mUzwPbdq1RxMdR+z2mJQ4M2jJxVuPDglvTrmXPsiQrd7HKKjlHzKu6z29febfUFnSRzVECGlft9BSkWvzQP8MYlW6B7cv1TYO5qSCtAHfrBuCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pUPD6ERaLox44Hs8k1Jg3sa3tTqiLYmT0AJ6/LvpnM=;
 b=MDIPul3+5BkdjsO4liiSuZCzLuEiGCE6Sgl1xE2JVAJ+CA+a8BhfBN0j34g1pZ5gT69X1GQKPwQvhkzYgsOfuGMi22ytstbyAOjfi7nhUBo7CiUj0p0W+Z0A+R8sVRCbj+sJoNxWS1kBbnOqZ1gwz0ZoLO3Q6xjHjVXyee3GPd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fa04f9e1-bc9e-4b34-84f4-dc7ca8999eb3@amd.com>
Date: Fri, 3 Apr 2026 04:47:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arinc653: don't assume Dom0 is the control domain
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
	<jgross@suse.com>
CC: Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <89d17a24-0a1f-4f3f-ac2f-f3701a8d78dd@suse.com>
 <4a4c011e-9666-4416-be1b-33d1dcad5afe@suse.com>
 <73e51afc-ae7c-4d08-9054-75dab660bf42@suse.com>
 <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <ca934061-f3e2-4511-bdad-465c4f2d0de1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 277b0599-881b-4467-111e-08de915ea24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ASNkt3Q4ZuMZ1sYzkmZhksFmSeYkCAdsLIiWnG5T2Vzuj4fa8tItYkQlg3rx13yBytwIs7n2o8tXIGTXlAAJJqR1YmrdKspgDTk+DNsMfEXEIwD0Cuop0IsfuUxg12QIn6GysYnjRDFEuivywjk/a7JzAA2MATwH5L86WBP+2s5PvEVo0AiynZlUeQRhWhELDu/KtibzMMilj8B4e92xOUsIgZrH29iSecvaLgo9jsej+KvDmgNrVK3oZK50zF3+EWSYVV2gprAnC6HAmzq6ltHDMasI2FrnAYECN5n1E/Lzd9UAGys/laKFoBMullg/4bAu1aQKK4OsM+a7Ixt88fDbvVINDRbnQ0DEhKdg2RrTf0P9aUrpK2toUJh5lqsgOCrYyyuZEpDSMWJrd/oIHxQm2PPztWa3RWkslGv51Gaugu95P26aUI6JbFLa7uzvAXjLVv+fbI2ITYs3XUtVoSdYFmSBKREg6m5pRjG26wSv1Vdk0KVDVZOS89KCWUHGhTG/xjxBpBfnmqYg0tdmRNGxJKUvhaFWfOugCzxFmnbf0MoH+RgCZ2nmVqP2yHSKELoeRB/XvBAgnoFPcYiVyIa0t3IGCheh4bQF1pXaofkY71CAC1sWyMN5wvvyUeOYoEMEQ4scfcaLC+WMtDkcvX4qvyvPMbZC8TQ4nwWquVE/5msVYSbPKUAbOkW/A1yABBgTL/ckSI6QPo3Vk5Wo4a6PTR1w5ENKy+XZgn+AknM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vryGxbmzsLPt6iutfMC0oxnj37X2B4seVkhebo6fjFgJqe+GIjCxMY3oc1JKlX0AvTC0XL2sDmQOAnUv0MBcZiS0/Fw+whPjGJzjb7ubXi6etKlmBozPRz1dO3T3ayZcawnIu24zz+Bpj03b21K3b8o8/A+6j3ytnDquUAOCmlhWnumVTaYm0rJHI4EeMZyveTyMrCyKp9xgRPMLWe5ds6ZHSvhrcZK22+eY2elh+5vFHrv3CGMeR0cjZ3q1F71QHmCounBFJFXbau5VHtsjasAvR6mM4mT4Wt1Rhmk6eboODoXCIbidbfCSffvxsbNILErpu5SigHfeUR14gDbJxBpatW+q3MLWCZd5jzdQMU73FJmNeR/VSomYq/EXj+xdjafpzbCIilqhMYml+hlEN02IP1bbsqhWvc8dbYcIBa09RYeCwNwxGtSGTbEvos7E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 08:54:36.8438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277b0599-881b-4467-111e-08de915ea24f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
X-purgate-ID: tlsNG-d62444/1775206482-B62E9185-E787EA1F/0/0
X-purgate-type: clean
X-purgate-size: 4143
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:jgross@suse.com,m:nathan.studer@dornerworks.com,m:stewart@stew.dk,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: BD931392647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 09:03, Jan Beulich wrote:
> On 01.04.2026 14:57, Jürgen Groß wrote:
>> On 01.04.26 14:29, Jan Beulich wrote:
>>> Leaving aside highly disaggregated environments, the control domain is
>>> what will invoke XEN_SYSCTL_SCHEDOP_putinfo. Its vCPU-s therefore need to
>>> be able to run unconditionally, not those of the domain with ID 0 (which
>>> may not exist at all).
>>>
>>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> There being no "else" to the if(), what about other control domain vCPU-s?
>>
>> I guess this is a stale leftover. Doesn't matter for committing anyway.
>>
>>> ---
>>> v3: Don't mistakenly include the idle domain.
>>> v2: New.
>>>
>>> --- a/xen/common/sched/arinc653.c
>>> +++ b/xen/common/sched/arinc653.c
>>> @@ -411,10 +411,10 @@ a653sched_alloc_udata(const struct sched
>>>       spin_lock_irqsave(&sched_priv->lock, flags);
>>>   
>>>       /*
>>> -     * Add every one of dom0's units to the schedule, as long as there are
>>> -     * slots available.
>>> +     * Add every one of the control domain's units to the schedule, as long as
>>> +     * there are slots available.
>>>        */
>>> -    if ( unit->domain->domain_id == 0 )
>>> +    if ( is_control_domain(unit->domain) && !is_idle_domain(unit->domain) )
>>>       {
>>>           entry = sched_priv->num_schedule_entries;
>>>   
>>
>> Hmm, is it really the control domain only which wants to be scheduled initially?
>> I would think that at least the hardware domain and probably a Xenstore domain
>> would want to be included, too.
>>
>> In the end it might even be that other domains created via dom0less would want
>> to be able to run initially. They could be part of a mandatory infrastructure.
>> Why would they need to be created at boot if they are NOT important?
> 
> This part is easy to answer: Because in a dom0less setup you simply may have
> no toolstack at all. (At which point there may also be nothing to set a
> schedule, yes.)

This is a known limitation. In a dom0less/hyperlaunch scenario, as future work,
I would like to see the ability to configure the ARINC653 schedule in device
tree, which would likely extend the existing boot time cpu pool work.

>> The question is whether the arinc653 scheduler is really meant for such setups.
>> OTOH just modifying the test to:
>>
>>      if ( system_state < SYS_STATE_active &&
>>           unit->domain->domain_id < DOMID_FIRST_RESERVED )
>>
>> seems to be fine for catching all those cases.
>>
>> With or without this modification:
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Thanks, yet I'll have to leave to the maintainers to decide which form it
> should ultimately take. One remark: A restartable control domain wouldn't
> pass that conditional. Granted that's looking far into the future.

It may not be desirable to schedule domUs until the control domain has had a say
in the matter, considering that the default schedule is unlikely to contain the
desired minor frame runtimes. It's less clear whether to include hardware and
xenstore domains in the default schedule, though I'm leaning toward only
including the domain with ability to invoke XEN_SYSCTL_SCHEDOP_putinfo for now
(i.e. the control domain).

Hm, the suggested 'system_state < SYS_STATE_active' check is possibly a good
addition. This reinforces that the default schedule's purpose is merely to get a
system booting until a user-provided schedule can be installed. Without this
check, restarting the control domain could result in new entries being added
while old entries remain, possibly ending up with duplicates and/or exhausting
the schedule. However, the restarted domain would need to retain its uuid if it
expects to be scheduled after restart.

Lastly, we may consider restricting the default schedule to Pool-0, and
eventually we may want a mechanism to disable the default schedule altogether
(e.g. when boot time cpupools are in use), but I don't think it's necessary to
conflate those with the current patch.

