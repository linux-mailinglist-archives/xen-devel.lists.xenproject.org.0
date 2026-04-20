Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHUfFJWa5mnCygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CD3434103
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 23:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1287710.1568091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwAe-0003PZ-C5; Mon, 20 Apr 2026 21:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1287710.1568091; Mon, 20 Apr 2026 21:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEwAe-0003ME-8t; Mon, 20 Apr 2026 21:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1287710;
 Mon, 20 Apr 2026 21:28:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEwAc-0003Kn-Rn
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:28:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEwAc-00CBn7-8c
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:28:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69a76-e002-0a2a0a5209dd-0a2a4502cbe8-10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:41 +0200
Received: from [52.101.43.41]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e69a87-af86-0a2a45020019-34652b293681-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 23:28:41 +0200
Received: from BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::15)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 21:28:36 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::a5) by BY1P220CA0004.outlook.office365.com
 (2603:10b6:a03:59d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 21:28:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 21:28:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 16:28:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 16:28:35 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 16:28:34 -0500
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
 b=dMUelBZXaGBkphqheZp35pSI5IsMeb18f7eo0FvtCBRyCU9gyLSXr7G5T5Na+3mmUGsARMCWxURUg94nLsMnNgPVqoyyFuSdiHwcBXeKU9aDOwWV0FVlzfTJ1ie2DD1Sfbylwyt+1KThMr40rj1rZN63wkmO/wgXktz1GGwecLPFkU6PTJ1fet+QE7yzhF7AgAG/zjuD6RRuvCfx+qe7wa9KN6Fk1ENCzvUcopC4jq7PXlZS8f9dFQrdWCCSQlvE4Cze/poEUoEtEqQmT2PUOcT+lOUSe0c5pshla3gHW66L1rbdRims1K/hrPa3DkmmRrmpQU9N/8bfaIifWUrmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26xqOvvXQHptsIYYwqzi2V5Krx1Y9DPz9R1+yB4pqvs=;
 b=CzYK/4jHtL1v5m+LgeosMTedTpo5NI9SHEoByQk/Ui7/Z7nAnCZDESRaiNVxcCg+xo5N3AELC9s3fZDhre6z40NHu9gANYx0BHDxDPzgfZH8SodVyEaP+MduqwNmjzJw6+rcrNxNhkZoCvdewvOO1stJYNLs9MKwZC7gSngHi+kXhdUcZC/FIb3RpqgiF5eizT/ymt1XoNVEg41Tdi9NUI4o9AILsGn9Q+34kkS3eLge7nbdI8DAETKRb/JZ1RVflyRNFu7iCChVFwdNaRylipW0OEYs2umst1WofjJHcfdzNylZE1TpBxm3DlS/kmQO+U2/5Risg0DMVdLFcAhcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26xqOvvXQHptsIYYwqzi2V5Krx1Y9DPz9R1+yB4pqvs=;
 b=oTS2rjwlrZp2U9ZXYKSGMwXYbinsQhFPYlOb8gJ/TUBCKfK8i+NyaBpN1QAztf3xbWrvl7QKVkBEQD8GjE0Pe6uD3IbqZOJ5MTrq2FUG5n0EeWUsdC2JkglfatLPAEAKMq+PDf8CJHqxuHf427SVMAPTnFRH1st1yhC+gZU00QM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <d0f9b670-49e1-4e06-bfdc-4847db790cbc@amd.com>
Date: Mon, 20 Apr 2026 17:28:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] tools/xenstored: allow domU to get own features
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-2-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd93f28-fe3f-4a7b-77bc-08de9f23c858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lnBTgGK4qQgYrdsujuVEE7lVHXoBbkLSW1oO5xeu9jJhjkFsxNhGV4x5uuiERjIO8xGluzgXq2P7uHdNlN5uZqKitI57hJeU+rsRugfig7y2Vz1SzJJSBfHOKRY6CiJZJXrNYTfvGkop8QyWQ2lu90fHKaWJsh/cErxjTxOd7AWNXpOX6zHWs6FSVUyTKtqCrss7ZzkQQ/8wNyU8w2td52Y46wadMnp7kw5+v5u8vkbdJ19g279KV4+dGKd0W+3M9/+vGihPGpgKXEuZGWAWXD5QTrGqo4wVDdKYNlU5fOgngBeLtAQKxyDwsNeWuVCuoNac0eNrSpyzTRg1FKr1SxKQEztZhoiQ62MSJlCXraTqqqmIvHFxRLzJx+g9CC4en4D6I66LSqYAfDavFdA7agUIKggQ+d+bJ5fvaWB5TSVckWbo71l4ftdZPsv8KenDu1YQ5smumOhzI+iKkRreEkTYS4u8srLm3dJbdOA36RyinLIFq3wCPMFhwZoPfKMUZV8ayDFeE8Vq2Nl/AvJf782R7l0RzK1EtHQd1GndszmDXXIRSN9g2vIjD4jBT5tWwwsELiR80kbs2FnWvrr7yCsrl+4RB6jWIWG4srimW9WejQI+iEq/I0vhLEB+U1E9zEfS7h1LXUTw+f9vmNCMDY1pnAzoIv3nf0p1GTUJY1Pd0liwrNwEEvCBpECL7ft1R68zN+30pTBzbyPJIkcZ8t8jjE8yzXi+sumBqzrrxJW3McSKks0h8RxUBkuC9nvwMPY10jjg89c6JC7zMBXfkg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HENEAHweVZM9dx1Voiw7aSFf3MAFVwqfPKdMlyTXNfpFmkiokTT9YGdzmr7t8bf8xyoZQwTtRTL4lAzhvK+y5NFsiEbCvYlI1Uo69qStJMARVeIlsj9UZljYSWAcQlJY9f/zLkcRJqNyLWDHRscrnagY2D+FM+z8g4YSln6+3LX+t17DlQ+v19XxCCv34MeAJTgbkCJHp43mfvVVzvbT/UDAJB2ng5vxAyjPbIaBs7eqgTAdt4ep6wKY6VAp85f9mExtgfrjycpEj2/zH/Myntzrb/li/ilstCc8+t+GqtGggfaPczxNjoc4wbzWpIAtQlzR2+itjmr3JeTlKz1xDzJvnvCw5wUIFx99J5SPlRvQoG2XxAbmfRESLm6E4bEo+DRXaEzjyFHwXH2IiGxQEOD1e5f+29pSHR2WEpswhT7Mtan0w73+vtvHZJtAAPD8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 21:28:36.5765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd93f28-fe3f-4a7b-77bc-08de9f23c858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
X-purgate-ID: tlsNG-720697/1776720521-8A2C6161-3F6434FC/0/0
X-purgate-type: clean
X-purgate-size: 2195
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
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
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email]
X-Rspamd-Queue-Id: B5CD3434103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Expand the XS_GET_FEATURE command to allow an unprivileged domain to
> read its own available features. While this information is available
> via the related field in the shared page used for communication with
> Xenstore, user land components of the domU would need special support
> in the related kernel driver to obtain that data. With supporting the
> XS_GET_FEATURE for that purpose, only an up to date libxenstore is
> needed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   docs/misc/xenstore.txt   |  9 +++++----
>   tools/xenstored/core.c   |  3 +--
>   tools/xenstored/domain.c | 16 +++++++++++-----
>   3 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 4eccbc2f7f..8a2c19d116 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -427,13 +427,14 @@ SET_FEATURE		<domid>|<value>|
>   	to set a bit for a feature not being supported by the running
>   	Xenstore will be denied. Providing no <domid> with the
>   	GET_FEATURE command will return the features which are supported
> -	by Xenstore.
> +	by Xenstore for the domain issuing the command.
>   
>   	SET_FEATURE for a domain will be rejected after the INTRODUCE
> -	command for this domain has been sent to xenstored.
> +	command for this domain has been sent to xenstored. This has the
> +	effect that dom0 will always have all supported features enabled.

This statement...

> --- a/tools/xenstored/domain.c
> +++ b/tools/xenstored/domain.c
> @@ -1293,17 +1293,23 @@ int do_get_feature(const void *ctx, struct connection *conn,
>   	char *result;
>   
>   	n_args = get_strings(in, vec, ARRAY_SIZE(vec));
> -	if (n_args > 1)
> -		return EINVAL;
>   
> -	if (n_args == 1) {
> +	if (!n_args) {
> +		features = conn->domain ? conn->domain->features
> +					: XENSTORE_FEATURES;

... cover this, yes?  With a stubdom, dom0 will have conn->domain. 
conn->domain->features is initialized to XENSTORE_FEATURES and cannot 
change.  Provided that is correct:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

