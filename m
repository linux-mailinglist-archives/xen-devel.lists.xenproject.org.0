Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NknBv53sWk2vgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:11:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386526520F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:11:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251147.1548389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KGI-0005uM-52; Wed, 11 Mar 2026 14:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251147.1548389; Wed, 11 Mar 2026 14:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KGI-0005ry-1s; Wed, 11 Mar 2026 14:10:10 +0000
Received: by outflank-mailman (input) for mailman id 1251147;
 Wed, 11 Mar 2026 14:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x/zG=BL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1w0KGG-0004uP-Q9
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:10:08 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00b9ee66-1d54-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 15:10:06 +0100 (CET)
Received: from BN9PR03CA0526.namprd03.prod.outlook.com (2603:10b6:408:131::21)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:09:58 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::3e) by BN9PR03CA0526.outlook.office365.com
 (2603:10b6:408:131::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 14:09:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:09:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:09:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 07:09:56 -0700
Received: from [172.22.194.138] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 11 Mar 2026 09:09:55 -0500
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
X-Inumbo-ID: 00b9ee66-1d54-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHSB9k28sB7kUHz4QI13a+wqhdHaQdN+uJd3uXfo1wRZ1Ea0p6wCPjR4LUUXM9LbmiYzghENDXdop8LsnlEM50FOrYsm9W6Ubav+9z7LKfqCDz6pnFJDRs9gta64/R7wtz5wgHiBeHboPvcEJk0X4ExKGdaYzJ24ijdQppJsUxfkc3w0aRZZSuWzvQtosDDs4hkckd5vMqJE0dahi401Mk5vQhp6zDX0JwZi9zV9tUOAxU7jthtxLhSa8rxqiwVzn32SleNqIqYonOaFLc7kFnHZ6VHZ5+mN5gHj2c50AQVF80FV8kabDdNw3OcutUkkokoKKAedPAByukNQrvgp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4YOctJBCJL3jsVpHCrS9Gm56uQh0xSYflxixPkOSk0=;
 b=s51oPup+ET5DtgpUeZyIuhOQ4/fUpsAetxFhZ1KhxSacthz26RbbKsnS/gY5LDJ81FPkxdRj6CkrfXKdFkGArgurcvJcdV4I7TUWK4Huz1vCEMene41Sje6ndSWNIzSdZ8tuuZCY0cZN1IglcaxEPrh6kosxrms6OCxb2uIgSVKGCkdlHboSPIPY5iEEI/6Dkc+BYUxrhUHFbc75DV8ylQFm02tR7yF71uMmt95dBps8BbUrki0dxLqAglKLHXGjVkt/4vdZdYfRwY7GeUVQDSKt3hG9RQMttzJKz7k5pjFeBPhtnsKk5PSNhn8zU76BWXnVXDvq6U6o8M/SPcPZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4YOctJBCJL3jsVpHCrS9Gm56uQh0xSYflxixPkOSk0=;
 b=AU6uvStSt5BblpzqCx/zMevi9PksCnesTpynOqm/Xy52tcEtoQsk3yC8NaMWwb7dgCveXn4AHDBsfSg527NVaUNKcyLgnIGz9g6IxqrSuSip8fPceuZMttOyA2WKSfpHqQReqN+SV81PaICFAgshAWvTt1c3cJcdpyHWf004J00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8ccde8eb-d8a4-411c-bd6e-9c3fcea1150f@amd.com>
Date: Wed, 11 Mar 2026 10:09:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix unmapped access trapping on GICv2 hardware
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20260205190128.38716-1-stewart.hildebrand@amd.com>
 <f91e0f7e-9afe-40bd-8e44-4aadbdf8e4b0@amd.com>
 <1e8f9976-b0b6-47b1-88c0-690d4f1589ce@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <1e8f9976-b0b6-47b1-88c0-690d4f1589ce@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: 8486a416-9bba-4eeb-1342-08de7f77e01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	O+2s6PO9jtD8zTXDjTw0EEXZFIfVtSV8cvM3SmCkm4gLz5evPPc9bf+i1aOMFwbm4uxijQQcuWd693ipFDyvCTvbOrE8YODnBlso/WvcEj8PJ+DmRYlaomx09pEMy7hGhTsFUIcx1BuBFkcYUZDAQi5itLW21KAp0veu+wa6pfOUMb5XCa7uob4kdX3aFdkR8FSdvYkJrVuHtkGKIpG9H6hIo1uYerkcVQplMYPxarP8wcVf+h733iQcDHD82SKQVO8WAEf5K2KPnV5zHuaWWMLPaqQ7V+OJGmnshV7PfwwZAAVBUuyhvq+1qWn8N/YAkiFDuaKyKIrPiNjR86QVhDT6wNURnZf5Nn1UHo8QMLonCcHaVYq69wzjNbjTD09joebf9T8t5ej13MJ0GCGBzRxE0KGPdtttcdikdOJ7mwwdJx16/u7Kb8KsvugQRpsW0652NK2YPoZEdwybGJD7rmfaeHH7OohMmWO/PCqiYNF9TF7HEQQHQ8BConh1OrUB+B9reBit2sUXJM6hVYwwpCw2k0xCut3DROjRMIYjlxP7y1kAeyCw531tMC0oXSkOQHi+eLoWp7u4VSfKkdpyFCAo4jDyr2CzQjG4K8IxjuJBSCONQzk3V1CluflzR0qqQgodoca/7iqSkLzJdvFrHL5+FU8ADGDtwlesYfhfVzEVt1cSEgX+RCWO3T3fovlXGuPKCeLTxdokrEg9rd9BCiUeSUYq5tfexQLFnOI9mYDAK7BzIHtJHU3J8T4moarM8S+509w0rG+mTs3UVQgGfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KzNDEO56otrvHbRZr8cnb7bbJoYUaf3lvxyaqKvA6GDXyNSptOmPFC/uXINRT1Xv4bP9MN+KNarr9ITDcurq9vWX4tCueU9fjoGDNCUZ8Ovjxx2HMKhgZQ06x9A4AUQnBdUhgObLRbjU5G9b6SOt4cIYexLimps0RGg0V+4lxOkYUcR52k7P0uSJ8ejWrZZ6hhEwSz5tE5TrZ7vJI7LZTLAjyZeYDX1Uu4ccmq6JqsRt/fOxJTSOfNkRuqqF2d6HZS0vistLRj6EGjgnGaJpvmjF67TKVm39gbHZAYeNpFdMvU+ws/3nhTPDRiI55Ose5+U2QU+hh8KXmTUhqg4obaxx/IaFTIZl3veTuuJLDi63O6X6orcq5JrGP46XSUuAFv4TK756l6HN81R9utvQXx27d/YdPuqXB9fLAHFMn25dBsYSgmt1XYYsGEG6lzK2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:09:57.0517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8486a416-9bba-4eeb-1342-08de7f77e01c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
X-Rspamd-Queue-Id: 7386526520F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

On 2/18/26 12:16, Orzel, Michal wrote:
> 
> 
> On 18/02/2026 15:21, Stewart Hildebrand wrote:
>> Gentle ping.
> Sorry, I'm quite busy these days.
> 
>>
>> To be clear, domU interrupts with vGICv2 are currently broken when
>> XEN_DOMCTL_CDF_trap_unmapped_accesses is not set.
>>
>> On 2/5/26 14:01, Stewart Hildebrand wrote:
>>> Since 4dbcb0653621, the vGICv2 CPU interface is mapped in a deferred
>>> manner. On domains with XEN_DOMCTL_CDF_trap_unmapped_accesses unset on
>>> GICv2 hardware, the vGICv2 CPU interface fails to be mapped. A visible
>>> symptom is that a domU gets stuck at:
>>>
>>>   [    0.177983] smp: Bringing up secondary CPUs ...
>>>
>>> Move the 2nd check_p2m earlier so it's prioritized over try_handle_mmio.
>>>
>>> Fixes: 980aff4e8fcd ("xen/arm: Add way to disable traps on accesses to unmapped addresses")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> I investigated whether the reordering is safe and it looks ok:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks! Is there any other feedback? Is this ready for commit?

