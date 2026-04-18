Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJpzMikv42l9DAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:13:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235634203EE
	for <lists+xen-devel@lfdr.de>; Sat, 18 Apr 2026 09:13:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1284834.1566384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDzru-0004e9-0w; Sat, 18 Apr 2026 07:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1284834.1566384; Sat, 18 Apr 2026 07:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDzrt-0004bc-UA; Sat, 18 Apr 2026 07:13:29 +0000
Received: by outflank-mailman (input) for mailman id 1284834;
 Sat, 18 Apr 2026 07:13:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wDzrs-0004bW-Tu
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 07:13:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDzrs-00FFpP-7D
 for xen-devel@lists.xenproject.org; Sat, 18 Apr 2026 09:13:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e32ef1-5cb7-0a2a0a5109dd-0a2a450ade42-18
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:13:27 +0200
Received: from [52.101.52.39]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 69e32f16-56b3-0a2a450a0019-34653427dd6a-3
 for <xen-devel@lists.xenproject.org>; Sat, 18 Apr 2026 09:13:27 +0200
Received: from SA1P222CA0138.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::27)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Sat, 18 Apr
 2026 07:13:23 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:3c2:cafe::4d) by SA1P222CA0138.outlook.office365.com
 (2603:10b6:806:3c2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.55 via Frontend Transport; Sat,
 18 Apr 2026 07:13:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Sat, 18 Apr 2026 07:13:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 18 Apr
 2026 02:13:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 18 Apr
 2026 02:13:21 -0500
Received: from [10.252.194.40] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 18 Apr 2026 02:13:14 -0500
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
 b=yRRgQLRJqskRP9cv4dGaQK1TQLmDlqgQs7TDe75fX2neJE+29bs2+E+hXKMuDRCXK+wy2PjiM6q7ALye7Dqyps9Xz7NbFLd+90gbodY2h2/Em3bTHSA/9QWLAt1b0UTxDjqbvOB2lhg+9QW1AW9/qJv35LlnmmNfbiCVa128Qi2V5pTlqxt81XyQFvcjXzP9dJSU6zSZrsO1dAFU1uHBORtcQKzlIyhxQr+0zpcBFyIqNYOB4atACUlUvpDhM44Z7/pVwxFI5m7UqJUV2vdSZLxvH1Ua0H3sPzh683xj3lYo5VKQqchFywIoVIT/SD3ea3sgxUCcFMRHH1F9w0N1nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THLwUhVuLXf0NKR0jU1AkBr69GtDTI4t2rIMBmNEEmI=;
 b=XCAahBd42h8rsFabIDTjOEfMJLnyZk318nE5onbXTTv7ztaLttChYWN3Q7NRXJ/t/r0zpyDRLvbeOxoxc+lP3nhz+FLfyA/0ieISzA1tchLZOG5k2hLIAfm5xLhLg+BxvG/sM/kBL3jCMViV1c4lOihJMaICiNeYB3QpWA6yVrXhBgt+89gc7PlaQKy0kJFkaG1By0AG7t0zZg3wCuEAnYl5xMOSzywWNdAob/kuVRXJeJGkfUmEzmI2n0VT0hdFWHXSBC6Dx46AOzmaYVqTxZYIB9V+STKiou53ea4ewyCRtUW9Pwbsnl0dbHU/0l8CzkQVMDWwZRhfGRSF4RldvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THLwUhVuLXf0NKR0jU1AkBr69GtDTI4t2rIMBmNEEmI=;
 b=qlO8Sm4ZEPzFvhG/DSocI9UgqTMcqlejR8k5LjBCVnpYiw0htQaonBxqa/2mBRN5bXBpKJTjC8VVdSTHx/Aqc7/hdg++8Xa70bxUdIuohSbkD7qG6fWxRmUABX16Tto0RDsTLk7SITMTGgYeDAb80LXS0u8wlCkCNEjGFM3ARfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <360f731d-5902-4578-b6cd-7cc438b1d998@amd.com>
Date: Sat, 18 Apr 2026 08:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: gic-v3: Introduce CONFIG_GICV3_NR_LRS
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>, Ayan
 Kumar Halder <ayan.kumar.halder@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20260318140900.3795710-1-ayan.kumar.halder@amd.com>
 <D28202A5-EA01-4AE7-816C-FE3B703605F6@arm.com>
 <56478969-509d-4527-b136-4498840606e2@xen.org>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <56478969-509d-4527-b136-4498840606e2@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: cd6f4f51-ccff-495c-57cb-08de9d19f9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ErDqgRir+6PI6prQzfXWDXHZ7gtOjO6bXjFpFm+3alEExHJZ6uZTFpXvRevw2+Chk5C3EfyEXGKBuRXKJNOmFPlQZl8WNHlb7hyaj7Vi0y9F6dFVaB+3oOaEwmisW+Yd4BIWIYH4ltVpML/TVMvjakVlv6W37KvId9Az1dT2yjRuncDk1gMZBA6CeHf8Enqv3038ALgwHKHhkaREfx2Ez0gkUvGSpEOYKEf8i4SfwEEBeHR4wT/ddLw2d7MVkfYAU9EtCTw1ra16XD1OHv6jqNyEgJlAcxHTC7y0s9LeHHod5t4R1uxSGDQj6bVEhiIZX8sTrqqYQXH5qf7eZFjH4bNt3fGRrOrE9aqkLgV7MEBoWT2JkjWH1VxfxYsae2xKCAbX48f7G0jCE2q1d7+ELcTkRBqmkIsSmzWmkEH8tzAmUeyagqY0o6Lx+AmtlsIvoi8UUc41U9Ga4f4DsPYKqu1H/8qczT/BWRM4D+70iiud3w/v4HkYmcXNIQiRZ6k/2eYq7OdpYQRzqvo2xxqLls73cpP1+zMO/S71UyiP2O/7HDVfKTWESUa3HGRa5424k/bGpq32bmlQiYEW+qG/BZKkU7VU2a1O4Z45ZDhP86WA739AWt185GU5z7Jtj8Fllrsss7VdeTpl43zrj/c08XH/XuV3SZog6K/UkFfD9bnknwniQXm+Q29RhyX85gaBLY3XxflcOKRH8CoV3yAQj/5NxB1IChaGN5udlhS+3rToT+ow47mQHfSastfQUCWxQqB3j1j5r0gomTsIdYJiuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hwC6Sip7xxN4zXKRqh9Y53wacGyBttqVW8Ik9SNoU69LYbZvnqNyX6YLygIj4aqdh7fMXM8+BjHcWSqRBdPsD2eL0saqNFcvIn5IU4ilTdf3RNbFsEpK0lgHT1RiCGti2TBMUk7JiJjXhkAX7iJDc/DS6rLI6WS23PoSMnyGHQ6qrbbboJZp1pu5nVoD3qNHtBoeRYuIejz4F0u7n8Kz1grb/odn42LD8P2vAwIwNQ04Id053SD8NvycdLF5g8+D2fHTaxOTbQLnBT5kuFtessMQTg11RvbFXqlahp2lqWf+Y3uLOVxiL+ptUu1QS3JRnEIezR8VulbvMRN/bUc0pXxtZUcZJkTFNuNO6tZHRnjjKk8B6LchhC+DcHPQ9yWOrxSuk+IkGdZplTZYw8Iob6+RVLAW/SbtDAdhYYP+e5RbiuYnlWsdSP101V8GOLde
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 07:13:22.3760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6f4f51-ccff-495c-57cb-08de9d19f9d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
X-purgate-ID: tlsNG-4011c0/1776496407-47B7F8B7-F21EC398/0/0
X-purgate-type: clean
X-purgate-size: 1622
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:Luca.Fancellu@arm.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
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
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 235634203EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 14/04/2026 03:10, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 08/04/2026 23:24, Luca Fancellu wrote:
>>> @@ -203,6 +209,10 @@ static uint64_t gicv3_ich_read_lr(int lr)
>>>
>>> static void gicv3_ich_write_lr(int lr, uint64_t val)
>>> {
>>> +    /* WI for unsupported LR */
>>> +    if ( lr >= LRS )
>>> +        return;
>>> +
>>>      switch ( lr )
>>>      {
>>>      case 0:
>>
>> Now, since we are using CONFIG_GICV3_NR_LRS or gicv3_info.nr_lrs in 
>> gicv3_save_lrs/gicv3_restore_lrs,
>> there are other part of the codebase using nr_lrs (gic_get_nr_lrs() 
>> is one of them), but all the callers of that
>> function will use the HW nr_lrs and not the CONFIG_GICV3_NR_LRS, so I 
>> think some work needs to be done
>> to align them or there will be mismatches at runtime with possible 
>> loss of information.
>
> +1. We need a consistent view for the number of LRs. I could also see 
> a use case where the integrator wants to support less LRs than what 
> the HW supports (this doesn't seem to be prevented with this patch).

This scenario is ok. In this case, we should use the value provided by 
the GICV3_NR_LRS. I don't think this should be something we want to 
prevent. Or I might be missing something ?

The issue is with the opposite situation. If GICV3_NR_LRS is greater 
than what the hardware supports, we should print a warning. And let Xen 
use the value GICV3_NR_LRS.

>
> Note, during Xen boot, we may need to zero the LRs which are unused as 
> they may potentially contain active interrupts.

Ack.

- Ayan

>
> Cheers,
>

