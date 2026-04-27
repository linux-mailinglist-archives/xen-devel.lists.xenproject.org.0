Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HkqBqfc72kiHAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:01:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F247B0EC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 00:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1295354.1572029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0i-0003aW-5X; Mon, 27 Apr 2026 22:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295354.1572029; Mon, 27 Apr 2026 22:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHU0i-0003Xk-2A; Mon, 27 Apr 2026 22:01:00 +0000
Received: by outflank-mailman (input) for mailman id 1295354;
 Mon, 27 Apr 2026 22:00:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wHU0g-0003Wv-EZ
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 22:00:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHU0f-00FCX7-RW
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 00:00:57 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc93-e002-0a2a0a5209dd-0a2a45089396-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:57 +0200
Received: from [52.101.85.64]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69efdc96-63b5-0a2a45080019-3465554034c0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 00:00:57 +0200
Received: from BYAPR21CA0021.namprd21.prod.outlook.com (2603:10b6:a03:114::31)
 by DS0PR12MB8766.namprd12.prod.outlook.com (2603:10b6:8:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 22:00:51 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::d0) by BYAPR21CA0021.outlook.office365.com
 (2603:10b6:a03:114::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.2 via Frontend Transport; Mon,
 27 Apr 2026 22:00:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 22:00:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 27 Apr
 2026 17:00:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Apr
 2026 17:00:50 -0500
Received: from [172.27.93.19] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 17:00:50 -0500
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
 b=m4/D5kzX0/+1APkYg6CSrmoPsrXDyJACnvbiSnp2aWI5Estdb6c8zov+G5K89R0acLu34cZdoYLOfg5rm33P8dt61IA6si4fv2/It5wTZ3UtrkKUQmzKkaIkzcEXvCc8iwiCMycwBgiCV9J2SFYd8L6bEzOP2T8HokXaZNB6JK/2RiyU6ROsTy1XgzIu8eXVrtu7stmCSo1HUtBIT/gHxhGqlb1jDlGCSgNwg2AGSZ2zu5ZC1i3ZxwllcTJs7y3qza4tjfBt1p1xY8B+CNRuAhAhf5jqhq18QNcuToQ+PYvNebh+c0EI5+ECqzz4ILTck+2nkKFnso7ht9o9fgw6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTDQTBsfrSi1BnoV0I+HO4KO1eLO5hOjyxRXPRkj7KQ=;
 b=j/bz189VTZMspYaIo4ijixB8h56PCQZw2sqneBeoXdg1z5arxPozT6XgFABP1S9+o4enIaSuB74XihpmrenBgFFYEXJzhItXrDiy6wia1HExf8W6m+SU58LU8izA5O8OVqkSftdJiVxV7ip323wWIF3afQEXVy1LCYlctWV2N9q7JHxsKPC2tO1qKzlpcw6iyasnJlSBAV8q77edatMyRhf9A88DyzckzogqtbnVGWi0uklSMB6Jmwc0NEOJdFWDLlmoK2w1hOO2qV4n9rDobepsqSrhYfOSrMy9ZdEPVhdvOUbJhztGQwm2YJixV9N4E/dZWDfZnS8bvcMxTHeJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTDQTBsfrSi1BnoV0I+HO4KO1eLO5hOjyxRXPRkj7KQ=;
 b=TUEcpDMKGToytEehpOeL5jlLBbp7il3hj+F3lkrpM1EIwMr5ZwEFpojeRLlCF1fNB6OTpm8xKABmNAfzqrgQRMPQotVlhpmnHrcT1HdEQvp2kKZMzmyOWYSTDAw/qzOtGFJWUnlmBLLDnhRVgXzumAbflL49e0vebps3BiOlqvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d7359a69-267c-4168-bb39-d2997e9b3908@amd.com>
Date: Mon, 27 Apr 2026 18:00:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] tools/xenstored: allow @releaseDomain watch for all
 domains
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: <dmukhin@ford.com>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony.perard@vates.tech>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260423080840.530547-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DS0PR12MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 733dd991-4a5c-43ef-cc02-08dea4a87276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z2NHH0ZadU1TQGqSAzq/ORtbTd1mT3wcqe2RJS3VCvsI9O4dIaCBv4VkLZPoNo1J1INUXyc4mDPSvAKJ13yazRsLrqoGKVlsewP1UxbsRGqtPRBp93alLhi/dGcVayPib1VZt4PRZj4t36YqwG0ZTSEOuOdS3NmjIg+0PB8LCVkuK4k1FKTpaYmAzTRinxJyFD2v2R88RbcqUO/yko8XsZRNImMXjtUzVE38MU3koJSFN/CEx7cgJH30jgDG109rv6swkjQWvGjuIIQVx2DKBYe35vsiODie9MA2A9WZLEW9Tu6pu/jEM+JOpg8b2YKhhfx8vqpSH0N/XF8vbPBRkM2ys+papCbfhXmHCj9U/zwwJU6OEWEMvGPExNG0o0SZfq6arR5Tz3m4jEBs8TFoTuqAz1RJKHVeBtdTAzuIkkzi7ZRD/GYQ1BArPZ+gXllpTGt103ZPPCghfbkzjv7GwoicgPwY6cfccvJcR+GiN8AH6AIaCLSZnaoDrCJAwMGWeEXv8QIl6YbDB+khByhrOjxdabsWraNFqVzq9MzoosNcpFYGxsKghpPVo6d5WrUUoI6BptKQhZt+1KotvuZwbc+0s/wQ08MWll9HMQrusTYgsp07OfY9q6H7F+wG60qpj3GwsmPHJi6uh8PlCP+o8z3Chjf+NVNmxA5XHCkbYrgELQzJ5yQO7ULskkflKr9Wj1kl1wwepEM8eE2xnrm6MQ/Edu9MCpt04qzw6h2bfJZM3ZUmaSRehobtJuw21SKa1OHtekoiCXjTjH0FU3ZnbQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F4cbfXilUVYQdEV+xSYM8nZOwJ2SxQYIt8NJb698N5OKMbL3bgmMFSn50ZavYWjhbUgxxbZQA1rgkXsUYUKfIkhOSKyY8QpBwe4+fXRUbrygTR4SBB4c7qmD0epqAOdb9VbJ70yOSFUjJMSEXXH/S8JtThxlvy7v9tSfadA/oingyO8Lz+j7/U28T2MSHMxOf0IIW4h2JzKuNX0YvVBdHmstWle7/62eNkdDVMIQW9bYdITaDpjCygyIJ4dAmtqT1jL2f1Lhe/tga+dSzi20y9sdv0MHwsj3Q9F/fu2XeG6WRdqnn3KaIGFq1sog+VJZ1YuSGakw0uwzsyLu8q+vNv9bu3RxDuw+X1R3IZ+pNpZ+88ObeejrfvOnATWCbqdQiqV/4P8LT7AwKuuDoWOyR04FkbSmLuQJvHUB7qFf2//+TIbXO2oHWHB6ejR7Ji87
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 22:00:51.4211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 733dd991-4a5c-43ef-cc02-08dea4a87276
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8766
X-purgate-ID: tlsNG-c1860d/1777327257-C1161DB1-564C5364/0/0
X-purgate-type: clean
X-purgate-size: 454
X-Rspamd-Queue-Id: 9A1F247B0EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:server fail];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]

On 2026-04-23 04:08, Juergen Gross wrote:
> Currently the @releaseDomain watch is allowed for dom0 only. This is
> problematic for guests which want to give other domains access to
> Xenstore entries, as they have no simple way to tell when such a
> domain is stopped.
> 
> Allow @releaseDomain to be usable by all domains as the default.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

