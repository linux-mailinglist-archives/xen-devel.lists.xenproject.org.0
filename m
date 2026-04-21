Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CykMcyB52ls9gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:55:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43843B98C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 15:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288999.1569227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBZ2-0005bl-1B; Tue, 21 Apr 2026 13:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288999.1569227; Tue, 21 Apr 2026 13:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFBZ1-0005Zh-UF; Tue, 21 Apr 2026 13:54:55 +0000
Received: by outflank-mailman (input) for mailman id 1288999;
 Tue, 21 Apr 2026 13:54:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wFBZ0-0005ZZ-3W
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:54:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFBYz-00COMb-G4
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 15:54:53 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e781ad-5cb7-0a2a0a5109dd-0a2a4507936a-0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:54:53 +0200
Received: from [40.93.196.69]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e781ab-229c-0a2a45070019-285dc445bc13-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 15:54:52 +0200
Received: from CH2PR17CA0003.namprd17.prod.outlook.com (2603:10b6:610:53::13)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 13:54:47 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::2) by CH2PR17CA0003.outlook.office365.com
 (2603:10b6:610:53::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 13:54:47 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 13:54:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 08:54:47 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 08:54:46 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 08:54:46 -0500
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
 b=do651v2B7k03aYhERZ+XUILETVfNgFws8TRFJ4gHc6p+N2fZAjW7c9MZ+vKjbXtmkJmpulmY2R4Qm2rVDWlv0NH9h4ml0yZGrNEptYX62mndohait9e6XClGhRjF7s3JaL/S3Sjz89jjwVMqQoL75gRiAijSRuSD25923tKY3/mxqNEZeCCpOIiKMuMcGk7Z9QOOyFI/Lgf8kNla2V164874Tgh3xHg4vlsbMNpfmhOUFXOe7cEy59CcOj9aLh+Vkow7OCXFeLIJp8qSUbgOI24aW2H1WS3m0vD4YwLjcDuYD5MDE8tdYXtvlDx1FenNoHGZTKobP7fuhOUdJbHKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRyuYiYcK7B3hZM900kyl7tC80qmQh7ZvMisYRDPC2M=;
 b=VGhn21B4CL12zIKGLF+Db/8ovlp9XoM877+nabSdvJcrzNUTeh0yQYdURzt5elR636/KjHFjXOdfKyco/Fdxrh7HQydCcxceW+qTGHSKNpd241x/iE58GvHVIV/hiPvLCdBsSGL3a0piu+2lh/W/ZU4V17inAOST48HQO9LUlVNg+OBCCJSpV7QWQnWY7d5wIMOnQnvUlbFpI51R6D/HfnwGPRbL5GSvzhqYEB1dh0TX2SW8UyHQ3S0wkG5/mnoNZI5He8HkoZmR+3l26HDskC+QWKFa6e2hdiBTMR1jvQAh2vZcAghjm29Xl6b6o4n8NJC7kBK2ACB+g0643smirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRyuYiYcK7B3hZM900kyl7tC80qmQh7ZvMisYRDPC2M=;
 b=SHLXm20B9cfTY7Xjl34oMTHcn7Petwat7Ag9j3jdsM4fU55i0r5Hq1MBbgTIHbYLLMJXZq+VctNeQXQ931YIACY5gbtU6N3RogPiWeI+y8rHARkP7yrW0FdVchLIGT7Ub/mBErSO4OZU296MO+59+SS8For3puuja62e3ev02N8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>
Date: Tue, 21 Apr 2026 09:54:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] tools/libs/store: add support to use watches with
 a depth parameter
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20260421074211.308473-1-jgross@suse.com>
 <20260421074211.308473-4-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260421074211.308473-4-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5d97c5-35e1-4eed-291a-08de9fad8cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	C7RfGo4ue3hvyxakVJ9c+CzVJ6J/nDd9Yun/ByVwXBjYRml/d+eAse+PvkauVFc/fwQR+tnUhiiC5Mj3175NZcOuedJ/bDcf1I84rcFGVa/kRDupAytkD4UAXgTGa2g59mrfhuR8XLrSvGr0dVtEXk3ol4R1bSIy74l3zukd8lyNaAjmRycQbPMOjPBwOJ7/e0SG/QFNO27qCbmO5cQmQm8eQJHAjQ+j1Kf83Vzhv8tiNewzvbqmMJg69IJ1q7VIvBp6s2jCkHD3CzPYnGZxNbirgCDZBBeX6suMi/YLm5Jq4t4iNcsX496gEvq/1yRCa4nepTu78yaI7HM2ZaA5ZcndDJvEk9ehgoOB0hfPgFyQl1/qvO1UsnEDEz4THpm18oIrZAlgrfXjENh6v+cVlrRytznKyIfqhzLMfiALl6FNMTCM0TfvoSXMnO7VmiGsXQNRW+uDfCjCOZeSyW7H5g3HTArj88pdYw9H+2coGD0WACyvy4nflNVuNEzwA5S7kqZwJed5m5kzbCkXGojzLQbVe3hTZPmLl/aFNnga0XwwAE9exGq+cESe9vXhipFgps4Hjo84EcKQ1Rf69fZE4eYVjviyGEYykRiBAeB74Ib3O2OdSn4zS7LnLzPTt4+luR3rUrixmH7PM4F47s12YwQ1HT9Ngyvps4qKysjw6YGeuLY1SXpRyHrYjMevW1JXM0EwiAg0sVbpfyq2N2DUAsBuVtQOYt/Y9Pa46QTzTsrMPKVUwdGWdt38+eRk4eSmTxcQ96a6zDlCOQ0BWbG43A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9CmnsaMm6/uDRHD244WkTeDBXkL+56daKi1lpVJMIDC1V8WHvfw05j6KQYYrg8vr4gBuQho1wKcUHVr31TseTUwHLt3coxutEefOb2QMttP5OTjtGprT61fZNTbmd85rmExqQ2VieKRl/fFmJUi/wkQHnu8OK7glnF36dki0LG0dZsCaai7QKFxa61Fkd/JRaXoWjuyAijIezZsG0eWq7KOenwPSPrHx2VvxuidMmE3HtouKXztREPCYLTHnWsiN/D/X0w/ggMrwKdB5wh/o0Y1QxWDlZ0Lz+1hu0PbqupDLT8Xeh0Aa288Vx1K/6rGtorThvb7Nr31go10evGfFRTpx5BEIx4tAt36rWSnuYIXBqyMOrVZbNKXFnK8YfCClRyV8Dkj3ndfboFUDEnRtIFEELFn8DoAXOm+Aha/obd/hYEMhjFnm0OzkYtNsX5ir
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 13:54:47.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5d97c5-35e1-4eed-291a-08de9fad8cca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173
X-purgate-ID: tlsNG-ef75cf/1776779693-AF77AC48-E656B825/0/0
X-purgate-type: clean
X-purgate-size: 1514
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 0D43843B98C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-21 03:42, Juergen Gross wrote:
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


> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index 06462445e0..cb3508a86a 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c

> @@ -1001,8 +993,8 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>   # define PTHREAD_STACK_MIN 0
>   #endif
>   
> -#define READ_THREAD_STACKSIZE 					\
> -	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ? 	\
> +#define READ_THREAD_STACKSIZE					\
> +	((DEFAULT_THREAD_STACKSIZE < PTHREAD_STACK_MIN) ?	\

This is an unrelated whitespace change, and not mentioned in the commit 
message.  It should probably be dropped since the surrounding lines are 
no longer touched.  Alternatively kept and mentioned.  With either of those:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

>   	 PTHREAD_STACK_MIN : DEFAULT_THREAD_STACKSIZE)
>   
>   	/* We dynamically create a reader thread on demand. */

