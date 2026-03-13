Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6G7xAk+AtGmuowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 22:23:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467228A1E8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 22:23:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1254539.1550314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w19xe-0007kX-9n; Fri, 13 Mar 2026 21:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254539.1550314; Fri, 13 Mar 2026 21:22:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w19xe-0007iX-6g; Fri, 13 Mar 2026 21:22:22 +0000
Received: by outflank-mailman (input) for mailman id 1254539;
 Fri, 13 Mar 2026 21:22:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qi/i=BN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1w19xc-0007iR-7S
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 21:22:20 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0b8b83f-1f22-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 22:22:09 +0100 (CET)
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by SJ5PPFABE38415D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 21:22:04 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::29) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 21:21:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 21:22:04 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 16:22:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 14:22:01 -0700
Received: from [172.31.96.139] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Mar 2026 16:22:00 -0500
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
X-Inumbo-ID: b0b8b83f-1f22-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0vGFm8r2bIRwvefxB/LV4zZmDQsoGlLPCo76QFzO/5Jo026RfPBufvZfGvVpZI+ILCAr33hFt6a52gzOwu35zVhF2Q0EX84yKuwrDF0iRt6CVYgWjM47Z4b1N3nsDtYDgA/9x3CA5XGLX8W2fCvLQQBzJIJ8KAX26MJZ6cMJxxquzbguXv7wfdtBoh89sAr++/d/7OUVGKMzkokSMCUVKiGG+VEQa5dfqppCiuLgYd6Eb/y4tlrf2wyGIkf564f0dRRJVD3XeQw9wn7r+cqFiGfB0sA9DI7y+BKcbFJW3qLqRZe5DWBh5nA268BNITBEJ5E1P8s9cM0QD7P88P7lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvd9igOVGt5yIkkA6IPxQ0vwUtUeB67QYH/xMRh2gnU=;
 b=sKQQw8ZnaUA3s2qvvllwRbmHfSTjoelMlnun9/xqKarRusSzcIKGBIkgqDsEBwqsNbNVWEq6CjNhKEuYD+kSXA65L0J1uxpRJOz12HXWjYyt819DMFth4kHRdrCd7PLgBcgoM3ATlG1fUzwD9pjRKovX4Ynw9xidqUtOndlJO4FUvc3UxQhyMwJDz7vwiN/y3YyRxKlsJhULpFEkfdrW6aRT8BVFuuNJCVo2aJwaQaGThO4nl3/6L/hXmcNRWrLQPNHC3PMh+YcqBCkzj1imAnhepB4FVxkwEP6IzhrdHFUuJr8rTInoNGZoOqgV+6iqRdsAHW4MWAiEIzGJGRggZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvd9igOVGt5yIkkA6IPxQ0vwUtUeB67QYH/xMRh2gnU=;
 b=tglDAx2oFIc7aBA0JoA3ZgQ8hoyX/Ob0MSePAdvL7YO5cVhOGr64zV6shsUTeyo5LxBbtBBKlnGItslRn2PefjxiNv62ij4kPUqp4cHjqcYyaGogSe/ys6jTpi/lqkKX7vL+hbcWkuJAb7Zt9AnG3UXGK1SCxDb0w30PvNZl8pY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <735cfce6-28db-4fb9-9e0d-d3f3f18403a2@amd.com>
Date: Fri, 13 Mar 2026 17:22:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tools/xenstored: add central quota check functions
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-3-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260305135208.2208663-3-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|SJ5PPFABE38415D:EE_
X-MS-Office365-Filtering-Correlation-Id: 2165522d-569f-4dac-7d2f-08de814692ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	MdMQ5fnusIhmmCyL/3imLGDIpX0HhDS/HB8MDIWW1vqA8Ea6Zz4J9FzP+e28GzZvnq2IQw2dlKPOo8XHiu4pr4HNbxZCbQMkuovE+IwtaeQXGoF2+AyHYrBynnn7nH9AFaqQkAuAIg8JytveBGck4DybL47uQzOpLOaS2U4+mQBF+Pvq7nBnSTzxecb3jcYLyjiX2wNcaaLT+8dyuWiJqJr9mvSIBLHt2WW10NmxFyHdbQhjLGHmBkVGy62S6D2AyF6Zd0wxGp+PQIAjogNu4Yry+WPXihKhXujEDFxWiiM3hOdRmio0sd73JNgEoNwy+TEMqWMlwl6FfPy89uwcTyWSzqrxJN8F6Xl0W3evFSv+MFopNdauXOaK5g78Ueo5ZH1o0sknkHzWwVzENMoGU7td+nB07INAUCPbo9tcEj7tdLtDvYWsfeqUKbXAyHWvzaTjjgFarPYdVU4Abrh7PXbHKOf7JjBW46/6+wRBDHw/XmMCDVFTAT9m0iraX2uDerOp0IBzuIH6HYdBPbt4i+WoyAvRNtmbvdLKjw4G7UqXy8N30Q64rTKT5tUEoP4mV9CS96zfaC6g7EcKARql0oj4uaauBUc0QBsX0Q0KFYhzv0Wf6Kco8R7Fg74jaUXaYdrwf0v8nk8OesWD68eKYCNei8f0v4BG2ekWqSfQprr4sMXMe+jBXaG97Ll48og/gD/tu1aVy2iIKYtBvbWm15X+/7TO9KZf408xWAdeW29Dwhw/zZdFOXLjDYsgFMhZRYql2R3hKKNhBY5UdYQjug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wMJNKTGFDDh19PNGdtYv7c/aqBgCkYFuH1NqL8TAwWi0r5I7rJ3K0rMpzwyTnAQCmvx+X8TdjHjVistC50Jmx3MhrTQIPsPTKO5o25oc0RnAcpR0Y7xR0aq8U02f761yqtZ4wwSUg5DJJ0UnPgdS3qJF8H5EyjVjuqW5z8kxw9URdLMND+uxvl4o0vr5Z5k67FNhTCLWE+mDVm4wy+vC3wuya/IMoiEb0Z7hZRUVfKvHKQLaphdyIZNfLuFsjvAibJbi9CM9LfTwXfIV8ZIAjE/gb68IYRCzdHa/ENwaE/BBzD8K0ClVdkgDb63uL9zDRWEl13jYe85xfHldahR1S2mqaWc2LLVfiQuIBJgUOfUol5gmUMCO7fI06Cr5VHPA87BY3RuJPrGNeaKAJfzbYPTuT8N9BTNFE+A8n7+cbPAygYs5Cl6SHFl19OKfTaGG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 21:22:04.0395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2165522d-569f-4dac-7d2f-08de814692ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFABE38415D
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Rspamd-Queue-Id: 6467228A1E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-05 08:51, Juergen Gross wrote:
> Add central functions for checking a value (either an absolute one or
> the current domain value plus an offset) against a specific quota.
> 
> This is in preparation of introducing per-domain quota.
> 
> The required changes allow to drop the "update" parameter from
> domain_nbentry_fix().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
> index e453b3061f..1df9265ad5 100644
> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -389,6 +389,25 @@ void wrl_apply_debit_trans_commit(struct connection *conn)
>   	wrl_apply_debit_actual(conn->domain);
>   }
>   
> +static bool domain_check_quota_val(struct domain *d, enum accitem what,
> +				   unsigned int val)
> +{
> +	unsigned int quota = hard_quotas[what].val;
> +
> +	if (!quota || !domid_is_unprivileged(d->domid))
> +		return false;
> +
> +	return val >= quota;

Personally, I don't like the naming of *check* where the "good" return 
is false.  That seems backwards from what I expect.  So I'd suggest 
either flipping the return value or renaming.  domain_quota_fail() or 
something?

> +}
> +
> +bool domain_check_quota_add(struct domain *d, enum accitem what, int add)
> +{
> +	if (add < 0 || !d)
> +		return false;
> +
> +	return domain_check_quota_val(d, what, d->acc[what].val + add);
> +}
> +
>   static bool check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
>   {
>   	return ((prod - cons) <= XENSTORE_RING_SIZE);

As an example, here "good" is true.

I see Anthony already gave an R-b, so just consider it as a suggestion.

Thanks,
Jason

