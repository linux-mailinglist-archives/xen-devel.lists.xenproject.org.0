Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFgAFBO85mkW0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:51:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6B434FA8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288268.1568559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyOy-00076G-9E; Mon, 20 Apr 2026 23:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288268.1568559; Mon, 20 Apr 2026 23:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyOy-00074h-3p; Mon, 20 Apr 2026 23:51:40 +0000
Received: by outflank-mailman (input) for mailman id 1288268;
 Mon, 20 Apr 2026 23:51:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEyOw-000728-Fp
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:51:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEyOv-001cMy-Sg
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:51:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bb99-e002-0a2a0a5209dd-0a2a4501980e-32
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:51:37 +0200
Received: from [52.101.56.71]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bc08-c1f2-0a2a45010019-34653847bc21-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:51:37 +0200
Received: from BYAPR07CA0075.namprd07.prod.outlook.com (2603:10b6:a03:12b::16)
 by MN6PR12MB8567.namprd12.prod.outlook.com (2603:10b6:208:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 23:51:31 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::23) by BYAPR07CA0075.outlook.office365.com
 (2603:10b6:a03:12b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:51:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 23:51:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:51:29 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:51:29 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:51:29 -0500
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
 b=M3pMAIdl2OYzJcK7Urq7O81FIC3rXhYM0PBNxXwmaoCB0MuiBCgaRPckAzQLrvOjY2OitPgl8uIoOa5OpRX6/R2DxFnAyJj2Vtic1YDS6O/Zj/QxbDxI46l7IfTWHJeJ/8QS/xLKs50t780cm7SHlcrRaa3Y4DvUkolQ9sRoeKkHyy02oSHp0e22hGUYY/FxOxEpJKWNFwxPNS4AthA96YDh95jFZzbIwVkQRbB+qz0W9RZAXtCsMF3QEFF9ccs4gztJTbpaGxPa9o7zGsu2YVWipf8vJ/xN1LpYl3MvtYoYAErCHomfepEGFP+V58equjacTSy/HEyKo4CuVSWylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w47/qAKPVw8t8oSI2veTzYmh+TRNWLNKUPFacJxOI4M=;
 b=ZQe+siKrSWLVLyWjvWV8C15t+4kwV5JH6+c+3gJFPmpzfB/y85D0fu7qWzxzBzdw7B/cW8Qqw0EUPP8Gd7dZfS+TBHDlFiEF5TX6Ud5ZD9XdE72DizbmrERwFrQMe5rM4dI3T7SSWPalFJnjV7AHjTr0I8CiqgUza6WFx82bOFe0GVcRawxuokStfVwb0gRmW+jnzFKYsdLHljPO/7FbUxG2KyzmaDgq1O+9eGYdssPeZXRfINlS5dIVbRFDESSvdPqj4iTzFIHcS6lBh7XeVH6awoFIbzbGXgEgTQol5c53DLVyc+82jXjxJr6KwP9SUxLqLTy4VAAQMnMWsU872w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w47/qAKPVw8t8oSI2veTzYmh+TRNWLNKUPFacJxOI4M=;
 b=m2k5t4PR0e6k7vRNjzTl3eldoZA2vzdmYhyoTXlwYsMEY78zAEBt/XhtZKeUgOQZbFDozv15Hr5lk43xN7ak8apSph8YV2zg0m7hKkuy62PdSeYfLQUa6mRczmkA0BKDKm8A/shGQZFg2jdYnObVf65jU3lxjp/j81SJsyz1as8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <47c69c4c-aefa-4666-9b35-8bc84209f350@amd.com>
Date: Mon, 20 Apr 2026 18:56:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] tools/xenstored: make
 XENSTORE_SERVER_FEATURE_WATCHDEPTH available
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-9-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-9-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|MN6PR12MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acc870f-61be-4687-be31-08de9f37beb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mCXl5fqQYaqHl1fXQD1lCirlDL13F896BHCN0OOwXUjvWCk7YnV+JGrObH34pZmanpVueQGLTJHclQWuogwYFrH2iu0qlRjPy7hR2XmcGNUObqJ6FShZ2aHt5Lk2KCZIrPpr9BNv16wNCVq2PACtEgWyYeK9h+p0npIIFkJGlxLKB+5BpOkzFm37FiKJGju0XYncN1AE697XSGI8sNt+W/2JKAVMNggK3xFhzpvFjzbgWsae0na/+Abkw/zg7bmkQ4Ypn/qcNfKPyK8iJyL4OsmGfwTB9gFRLJ7g7G8NelfLhNBkbGjYh5EwMnbN1sALrzElxjvgik1lWJ+CzCOuE6rMdOQ6AEqk3ZWZCYMJa0g5gjJVrmCREHLHW+uPRovVxKSztukRgqhVGD1VoEmUvqPYTgreMfS2+4heiymH8enHBHOj2Co9eiKjgPnsTS7RS7tisQnD3uIQP31KPa1XwSkJ7JzYu9SUb5EDRwexlNIk4tFydILYrqyzw2BTip07/KyxaxGpbPv67yqTAMx+i2Ps4vgFL8dH1DezMUAf23XcXRlzEI5JYygr65k8YdE7Lo+pMFNgfd7sLjq/gGCX123CMPlX9OgCdZQc8jrpIqUOdPgszBVIZvT9lYYu6nsOztVF2ZoBynHjrGCI9bToYbxDTZRgT3T4pIugj8nq9PNsugK6QYaCeTFgqEwfZp5mKJugK8Kg015Ol4JKWoxUPY9adyadPP5jS8yVCjGHogdikFx9qWrpz7Wu25HTuNGuBrQ4lrXswIQFW2WjREzSRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	izwRDcGopvcLsqsCpBR3P2OK/3/PpwbcFcN0lB7aj4Wm7fIpO/oFx3LLEAIMvGN1di+qB7oP+1stiXrlTRyG7ocX0rM3K+OPHkemb8Yz2H7z2dzPUSETV3pZCsySkuy74mQCA0Rh/3K+PptIsNjPpIBz7tSJd+/gqVYLyHx1/tmlCwbfP9TIXBQSy89c91Gqs2HsFBzmSB+RZy8Yl11UMkEcpiV4xlaeW/Owvk6EwB1W56XlImjub8NSyH9a3EBJWWME/4t1qllq2tEDdKxxMFd1yUMtRZBS1RaacwYtrq7R6WLpxPwaM9kHuqgkksmQVY0KsAbAMXmeOSSWKhEzzOE4PZxYqLaYH1D8O603nWjUsoLlCPx9DjkQZMr0WPwOJwVicWf1WVp1B0Z2wADqNTLybM44aVhuUM5z518UggD0M95OlZuON2AM8sgGFhxX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:51:30.3697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acc870f-61be-4687-be31-08de9f37beb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8567
X-purgate-ID: tlsNG-d62444/1776729097-BE460FF4-387EE346/0/0
X-purgate-type: clean
X-purgate-size: 266
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CEC6B434FA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Add XENSTORE_SERVER_FEATURE_WATCHDEPTH to the available features now
> that all needed support has been added.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

