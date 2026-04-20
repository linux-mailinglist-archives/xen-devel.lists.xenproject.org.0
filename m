Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLZBI/Sa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:30:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3E8434155
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287730.1568108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwC9-0006H6-1z; Mon, 20 Apr 2026 21:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287730.1568108; Mon, 20 Apr 2026 21:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwC8-0006FE-VY; Mon, 20 Apr 2026 21:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1287730;
 Mon, 20 Apr 2026 21:30:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEwC7-0006F2-95
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwC6-00CBuB-M5
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:30:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69a96-e002-0a2a0a5209dd-0a2a4504dc14-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:30:14 +0200
Received: from [40.107.201.7]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69ae5-1dec-0a2a45040019-286bc90793ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:30:14 +0200
Received: from SJ0PR05CA0108.namprd05.prod.outlook.com (2603:10b6:a03:334::23)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 21:30:08 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::95) by SJ0PR05CA0108.outlook.office365.com
 (2603:10b6:a03:334::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:30:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:30:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 16:30:04 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 14:30:04 -0700
Received: from [172.28.123.27] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 16:30:04 -0500
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
 b=Ns7BPWiTjRLYjE1enpz6X0utBliU0gUOGPAaNd3jmGltmM2FxALGNiKUwrrAb/nyuobjSsynv7O7Eaaa7chKuF/v01FyaBjfazDsda7NlTfgZ2L9+1kdi3Ec1pkvKVlUShdJ32y1GmyIRMXAJAkI6KYAYOWxa43mk1pnKAAtxjVxwBZ62cIfTX0V5sBlioj8Dds1x4ts4+vwH+jwy5joemO7anM4ne+jb5nr4BjjibNs2WLeKs3oK7fW4mWKn8z50OhRPLBiuqUo/3Usw5kM7lxI5USc7ZYXboMZvKJvaQYjV/yPg+yPIpTpsGwrB8hjEl5RbZYkKDxyaYyMmgHFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWp1CJlN0rtlCETeaL43ZIyeO2c4LQXofeHK9g4Gvs4=;
 b=G6H2jrAz5E0PRaPfsWxWht1sdtmgm3FsVIfp5ZT24MsEmvq9vYy6xacXllAv3Hk+VGo8WHNf8VZsWYn3h/7O80yS9nXDBrtwqzU3xHUM5W+sJkF3UGP6KEdveThIdIYMaj1H8T40E4TtIc8V985uz9uusEIsZ78nvPVVDfiWiB9rfpKqMmvdHV61DOmRxCFAJsVBNl4Z4Wpv1DHDeWhiaDth0mX9TnIHf9n5GmVfFsDUv0AWuCoXACWg2ZQeYRRKLeQlSizebChDCm66/tSngKfSuLUOMmovFN1SfposRem+B2tLJn0PGltLNLR4BQFxlEBA2/EBG9tKvZeA8QoeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWp1CJlN0rtlCETeaL43ZIyeO2c4LQXofeHK9g4Gvs4=;
 b=V2dN7obVEqPXxvfa8NFwRR35/Udvm3kpMlotbnXPfKaA21AyJh0201aKWRkfajO/450F8CITLWEOcYfXn7nWmuz9xJCOX3nfQulEAh3Z7Oyx2OY5uriURUQx4lA2qlDLxHGtPEwC4mTBhYkj6TPh4eN7cVN7Xs9BpXQhYW8/NoE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <75667f07-b997-4bba-a905-9c5d80e8ba0c@amd.com>
Date: Mon, 20 Apr 2026 17:30:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] tools/libs/store: add support to use watches with a
 depth parameter
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: e576d413-ff71-4ef5-7f27-08de9f23fecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18096099003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	YyrjqxUs3q1tbdcvGLukBPugjO8bmiiyassRdVm7x6+u+WGKbaM3un5JIWfejPhl4dmR06orBl/Z6j5EnGIdwLpnY30mJezy2Z+vmRwCP10Jw/OW71XysGiT9DZ8mc+euDWdt19j/O6eg0lQBzIYQu38I1+JJ82Re4m7ZJuLpBsnkxiqSgbAZf8t4bVNzupn5OeYmBQ6wusad+XHKLoY64rEbi+jSngYHZh0SFS9CDG+4+ctzlx36GD6JPId2KyAltg6H1DVEaGEe8LhPqfzgeo5qPnMhltkhitNQdMxroVsyDtQwq8GA/s4z0XlSTD9jTMddHGxLDRo+eC626Gl5nbAczMeYMMoNb3ADpd/KQZ/ukvi+u4yK967/xNIWlA9S+Jh3rCBs8auwVaCiZcfO8DJA0BF4duVJYg5KAjubXzRfO1wMijWcNYJw0RKOrot6I60PdegUfz0uGydnZvsAWRTwDy3OMBTKO1qjC8DOfsD+3WRn8Mmcv8YkrdR9VQ7uOfXEhAWNCzigzGLL38mGPEnPcOhhH9pFijumAfti2IYADMyVcTwJl1/F4mKcIhs5DyqUZ2mCW2ySr0HPjXEqo6GRgj4lvRXq4sJCtmerBEvsKrNayNqX7KQHqOdZl+HIb9YEll0mp/a65VPdDH0Q8sZuGTgvFbeuYZGA9yr6Qkk1hXmzs9HUCH9Sacs81JolVfpidqd/knAvciOqm4wGeiBWzHJRg9PDhq9bEZ4L2UkOmFExwGLWDhOxgxppYN5KsDVBgFBPIOs2+FP8zuKDw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18096099003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AWRHASxo+7Nl7yZjoX6xuvkfUG9g1z4RjLAgiILz//cYukHeoqQ+px/FWoY2n5pgL0X7UlRLrbc+OrPzBFRsyAr7Jd75RN3UX1C5mZ6RVmA1IuBOKerb4LgXLQY/iR028GA8HVIt/bfydht9hAlzOsqU660js9InOE3neDpSivq+ebqxri4YpOmLSDKytLFFrIWy6oxL1zV2am1QFuoNZHHdl8pUYn1qWV41LW5jnCrdp5OLO724rYPp5ZSJFUw9FK/fjdeRjdxeVRck7p8WA5hySXTkp1TPSb8eqhBrNu1JI11q9aFl04h5VXjfth1H6cL13RverQxzHP20qAlId/KeJgWYP8CmucUnVIjVOZQNQk+MthpNxeL0CCL5PwXHbbptaWSt/eWJHBV+g5FdQ2np4mcbCzbwGxfBiTl16hKIRReogU9hKHeJArFJP8v1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:30:07.9949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e576d413-ff71-4ef5-7f27-08de9f23fecd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-purgate-ID: tlsNG-ebf023/1776720614-4BD6C3FF-8A4DEB86/0/0
X-purgate-type: clean
X-purgate-size: 2246
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,suse.com:email]
X-Rspamd-Queue-Id: EC3E8434155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Add a new xs_watch_depth() function to libxenstore allowing to limit
> the scope of a Xenstore watch. It can be used only in case Xenstore is
> supporting the XENSTORE_SERVER_FEATURE_WATCHDEPTH feature.
> 
> For convenience add a xs_watch_try_depth() wrapper, which will call
> xs_watch_depth() if supported and xs_watch() otherwise.
> 
> Cache the supported features of Xenstore in order not having to get
> them from Xenstore for each call of one of the new functions.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

> @@ -984,37 +984,29 @@ bool xs_restrict(struct xs_handle *h, unsigned domid)
>   	return false;
>   }
>   
> -/* Watch a node for changes (poll on fd to detect, or call read_watch()).
> - * When the node (or any child) changes, fd will become readable.
> - * Token is returned when watch is read, to allow matching.
> - * Returns false on failure.
> - */
> -bool xs_watch(struct xs_handle *h, const char *path, const char *token)
> +static bool xs_watch_helper(struct xs_handle *h)
>   {
> -	struct xsd_sockmsg msg = { .type = XS_WATCH };
> -	struct iovec iov[3];
> -
>   #ifdef USE_PTHREAD
> +	sigset_t set, old_set;
> +	pthread_attr_t attr;
> +	static size_t stack_size;
> +#ifdef USE_DLSYM
> +	size_t (*getsz)(pthread_attr_t *attr);
> +#endif
> +
>   #define DEFAULT_THREAD_STACKSIZE (16 * 1024)
>   /* NetBSD doesn't have PTHREAD_STACK_MIN. */
>   #ifndef PTHREAD_STACK_MIN
>   # define PTHREAD_STACK_MIN 0
>   #endif
>   
> -#define READ_THREAD_STACKSIZE 					\
> -	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
> +#define READ_THREAD_STACKSIZE					\
> +	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?	\
>   	 PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
>   
>   	/* We dynamically create a reader thread on demand. */
>   	mutex_lock(&h->request_mutex);
>   	if (!h->read_thr_exists) {
> -		sigset_t set, old_set;
> -		pthread_attr_t attr;
> -		static size_t stack_size;
> -#ifdef USE_DLSYM
> -		size_t (*getsz)(pthread_attr_t *attr);
> -#endif

AFAICT, there is no particular reason to change the scope of these 
variables.  Am I missing something?

Everything else looks okay.

Thanks,
Jason

