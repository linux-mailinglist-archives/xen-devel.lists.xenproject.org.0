Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFRXHzL+3Gk3YwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:31:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B83ED551
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281192.1564215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIJQ-0006nF-TW; Mon, 13 Apr 2026 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281192.1564215; Mon, 13 Apr 2026 14:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIJQ-0006lL-QO; Mon, 13 Apr 2026 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1281192;
 Mon, 13 Apr 2026 14:30:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wCIJO-0006lF-IJ
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:30:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCIJN-00DE36-UO
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:30:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69dcfe0c-bab6-0a2a0a5309dd-0a2a4507ce2c-38
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:30:49 +0200
Received: from [40.107.200.65]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69dcfe17-ba2d-0a2a45070019-286bc841e2ee-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:30:48 +0200
Received: from CYXPR02CA0048.namprd02.prod.outlook.com (2603:10b6:930:cc::26)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:30:45 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:cc:cafe::5a) by CYXPR02CA0048.outlook.office365.com
 (2603:10b6:930:cc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:30:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 14:30:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 13 Apr
 2026 09:30:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Apr
 2026 09:30:44 -0500
Received: from [172.24.171.253] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Apr 2026 09:30:43 -0500
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
 b=KcRUr6n9VFbu6g2SnulC019SkymGzDaxFI3zV3cNy68uED2iOO4UkfAsEDQIfsmuBT289XkDrrD4Ng3YZ4b0G9HEUUkr7omb0iwVUlVro7SEuAp6hdDbshZQlLN6ubHmppg/h3Kfd+KhD1MH4pJDDzITLeZw3+b668/x+E9FHt+aGaFKbJezptN9YhU2NLJGtlmN78vCIBUddPgHJwmRPNz0+rABWYiq3m0wPp3pByqyPIHyWVrdvFlxGTLITHqCF/Z6q6+2arLcIKdptIZm1copPuogbBrDqfMnC4JOmpyYG3Y3VwNJrC21TWjLZRGcZtOyPfN0q/CZG420DPFm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91i3G8cCsRuVTzCrLA15uZisLzTf8O+SKiCVkYxiWXQ=;
 b=tVIoaEvXQbjvFVKwrPIZvdOwLp23IaATZ0OnRK7BfjFMa0Y9CkiBJqE8tQ+fM/6V9g+s4Jt1Zb1ZSNmxpG+9wIDFCg7GOeawFV9BzCVBwTY8H0hdHrTNs/IrJ1Kik5qbaqnvBE/lhzHorrG7NJq7OB6PZ+EFxf90FE3l6sVPtSXPgRzbr0rs+4qX4rDdARoHOl1RSJ60o7L7/LHihMwde1mnFQOBrqtS0JJc2Y4GLWkH670vW0XeS4YY8FXmCdo3VOrb9F1/QLmP2qw+8pRK2Jzd8vBu3ZYiiQsT33/webGfbVBs/iEMjnuU+p80xzI3R7XheG4TQwrfMNuyTrWmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91i3G8cCsRuVTzCrLA15uZisLzTf8O+SKiCVkYxiWXQ=;
 b=15i/Z8HohVKpDN9dc+yl1wnWQsfEG7FLp37J5umvPxgXKgjYCkO6O69CyvnyvYNhKfMUIFhv6gCxuKwLIgwxiUv6MZ1qEaIDO5meefhY2tXe3k0KWdZIGnuKzVkoad0O23QvSlJY3qk5izkoUNSy6xXRQfFaQ5K8FdKdtc2xQ28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5d09f299-6df9-4225-ad9d-576409e19484@amd.com>
Date: Mon, 13 Apr 2026 10:30:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] xen: branch for v7.1-rc1
To: Juergen Gross <jgross@suse.com>, <torvalds@linux-foundation.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>
References: <20260412062202.627248-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260412062202.627248-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CY8PR12MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f275a5c-3b0b-45f3-a437-08de99693f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eBZ2x9vwhMP96Jw5pBDxCh4U3nRUooRDwvmlqxjLTaI6JR4wDgn/Id/geNzPczNNJ5VE5oURNV6VQOU4rQ2iWd0S5YfWfNdbMKoED1gtYkiHkB6wKLCpiECjcKIDaMiknsVdppRTikNYdBe+SyaQjjbtIgxP9BVSA5VooifJmH4UPblhYTk5bK0W363JYL5vSAPEu/YGGLIthRdChJLTk9sxfSAyhvj7bt8XeLoHaJuU24wDGlOo9jDw+AS0pGhjDnM4ObE+B4xdKAqdItsdIW5PJ1L70tNqYE7AMyinJ4lkeQ/wKThPsOpji1FPKTl0o75hxrB7hsx4qgZ1GrR08rZk5PIJuGcxP72o8e5iVcK6pd8K4C9eNnhqgYZ1wl7BMlzjYfU+hGtmai2KWd8qRILa/DVluzI466t31UrEcaauwB4A3Yi5LXJpvkAzgxpnPdHGmNqACMNuErV9xF1RjewZ0ickQ54AunFwU2VkYTaexSvFRQJUw/4A9ooo+PI9hsT05p8uvpksbHGGcRmm2wBFTGFXUXMEUPoi0Atw0eQFYdaPLJuZDDvM0+IKGntSzjwOv7MySCTMBOjwzQVA7/TKnN1maWpgQKk7uxoOhDnC1KRjdahhPWm+czKt0pJj5uZWNuyJfLF/oxdL8asllf+OKUdY2tcyyGvYuhfSWjuk95k2We66jJcSNvKagk7DBlsUdt51lwqug2VFSCltRN4JZIDv28+6XDmixLG/uccCOWW4fHiLwZNHjKK+l3BuwYLb8OVHSLnGYnCzMnbUKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1p3dCqWYwk28SKFVEtBmIxpQ57AIcE30BYGOusFCZILfAKHxzaP0H66pObK2NKwk7Dye//PT0ARmkf5yW/TSWN9/d16nxVWVF8Xgk4KB/28D0HfaAO0MNu4AziYwtTm523GyQ/IL8j9S3h8SaJACopnNvWCYTB+HSpHUi0nr31X82EFolkN4yjIiva1qJOyVM8a56cBN6qNTc7U/kHQRefor8tq101CFzTbjdZDGMg17ByAWv5e8dzzWchjHhcyznr+57gfrDesOgZD4Q3OKzIaJXwscBmlAxCwQ7OQgX1AAy1X6SE5nSB1TQfGiUgPjFmViXUornYa33XcHYn3xQkypAa0/FzPYw7eVS8ndPDE/K1JOeIJLnpL3w3/lSN0bcEaS5DnRxi8hmPcslQC7KNEgdz8hKZPzMnoNK9XY5EBrbUo6PcUsu/etfli1yeHG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:30:44.8980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f275a5c-3b0b-45f3-a437-08de99693f8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
X-purgate-ID: tlsNG-ef75cf/1776090649-1039741E-BCA8FF7F/0/0
X-purgate-type: clean
X-purgate-size: 801
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:torvalds@linux-foundation.org,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: D64B83ED551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Juergen and Greg,

On 2026-04-12 02:22, Juergen Gross wrote:
> Linus,
> 
> Please git pull the following tag:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git for-linus-7.1-rc1-tag
> 
> xen: branch for v7.1-rc1

> - a fix for the Xen console driver solving a boot hangup when the
>    console backend isn't yet running

> 
> Jason Andryuk (1):
>        hvc/xen: Check console connection flag

Greg included this one in tty-testing as 
d50dd728ced93a1900ff0be924b6f273baf59fb2, which has been in linux-next 
for a bit.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-testing&id=d50dd728ced93a1900ff0be924b6f273baf59fb2

I just wanted to bring this to your attention so you can decide which 
way it should go.

Thanks,
Jason

