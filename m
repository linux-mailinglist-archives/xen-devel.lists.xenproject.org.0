Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJiiGNM08mmxowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 18:41:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96AE497C66
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 18:41:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297649.1573562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI7yl-0007LZ-Bt; Wed, 29 Apr 2026 16:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297649.1573562; Wed, 29 Apr 2026 16:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wI7yl-0007Iy-8e; Wed, 29 Apr 2026 16:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1297649;
 Wed, 29 Apr 2026 16:41:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wI7yj-0007Ir-Te
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 16:41:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wI7yj-00CiN9-49
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 18:41:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69f234bf-bab6-0a2a0a5309dd-0a2a45028ed4-2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 18:41:36 +0200
Received: from [40.107.209.18]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69f234be-af86-0a2a45020019-286bd1120710-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 18:41:36 +0200
Received: from MN2PR15CA0055.namprd15.prod.outlook.com (2603:10b6:208:237::24)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 16:41:27 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:237:cafe::78) by MN2PR15CA0055.outlook.office365.com
 (2603:10b6:208:237::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 16:41:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 16:41:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 29 Apr
 2026 11:41:24 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 29 Apr
 2026 11:41:24 -0500
Received: from [172.18.112.162] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 11:41:23 -0500
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
 b=RTe+C2chu6NGMAZzqH65CgXVjAz/G00mEvCavKkMPbWAVAamxTa59cDWJpzMUEjMhNy5KDhI2SDKSzx8JVJPpxxT3HPm0oy/CgzfemZdAoETPStIX14BFwhr1eMWwwAe1YAATItHkyAJcDJ5YiPkPLBTYdSf96YX9Weax8EAclUBCweyteGT0pXo5+FXFvyTs+7g04vxxoC1E4TxVW8mJBwN3yUbJGb8d6J1M60SXOdGPz9uVXqujWy8xcjnlwMcfgBMAfq3405e9D4eQIatwMu/37FKagp+pAlqmzKotJeD8AHVy07pCzSvCCA6AQjxgKbEs7IwKWkGnsNdkn5ymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLZdDdf+YT2XXeniydDvja7axsW3ZlGefW/HwhAhIl4=;
 b=A4apqci0Xfx256SbYNWxidn4KtNRdlGnry8KJOwL/NJVByM79ki60JbohLbnEUVP2HGFtpO52yBkxmJ6aTWbWjYBh1iPjWGCKkyzAfx9paZvMmCMepQUd6DbCiQwfz4rG/j59VWZUgbC08pK1o5//7mLVQCfYU2YqsrTfoWFVUwm0QK+Cpu5rKlJofU7c36M9h6m1JTviN+jCHKBku9hIBvHiSzlLRMNpfOfh5OlGuzxdyEhl1SD5L1troPKcHLP+Rv8NKKNxJh3eKoxai/R4RFITQe6DWqiR+v4/OwZ7w0UW9WJIKpecBv6NhahYGWtWMQjOV9DIojMdgKuVfwkxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLZdDdf+YT2XXeniydDvja7axsW3ZlGefW/HwhAhIl4=;
 b=FhlC1OEgXXCV7SNfUC5GhvKfddBHUBSUd8+dUVWz/ng6u5u0lda3UTACbrfZ2eZCme8lJaoAcdOL3FZLhg17PUKlDnKWHVTRqSl8I6p1LxStTYicGiTH9UaZMLf0kccKgP00VYPupBtC50B+rHyZLA7K9YURq8Gb7kb6Vg8tNnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e9cfb86e-704d-4a5d-bc59-ad05d07bf69a@amd.com>
Date: Wed, 29 Apr 2026 12:41:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v2 4/4] tools/xenstored: remove permissions related to
 dead domain
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260429120619.1013440-1-jgross@suse.com>
 <20260429120619.1013440-5-jgross@suse.com>
Content-Language: en-US
In-Reply-To: <20260429120619.1013440-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: a87ec23c-28b0-45b6-8cba-08dea60e2858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QjfDs0kaLp0VlYT4fZRK1M/c0sB9pp81//9z2GW0LKV2UMFiFfu4E0PmAI7li9vhKL1a6Ke8C2zx1Y/hAS35FIW4SraDDJTam9v9SMO1EbvwOXiWSofu1SGKMwIjnMrC6capoc6LxJ4LS80c4/cF4p4MoG0ZVkiJYO4zu561nIM0J70UR40Ea09tPN+VUqEzgyjVxvf4+kAaP6P72BEG/NTcjBDm8Typ0oPEwMi7K12UN0HnEZ2iowUmzVBS1+p2y+6JR7xBGeEN0Xh1OA9U2iRxLavTJa239BmwnIqsNEoDkpKZwmExBhiSvYSTnzNoOayEh1Bny5e7cCBxeZvt5NqyL9NbZ+xzVaa2nxYE+fajxYQUMTZzOJjUfHw6YE+Tqp7Bz1I5BDQMmgwKBR8lMJ9qnh2IyiMboM2PUSYkjf+FOEk63sErGlGP6kSAmBgDTg6F1TITI4HGj3KTGtWdnDI96FM1fwGE7oFQYf7/qIOwUnp3zD/kg01I6qPpRZyYEqe/jJGYaP+qFr1QsQUYAAlJSEJlIZVvXjQZ5cww38f2Z6htRAG7tHJtFCiagM+2uaiDGRvAyR9HV58yZZYasvcDKf6f84xkkiDqNXVnE5773B9ZgEnyYeOKk2y05ZepqP2NAweZu3i1et/W4QS7CkvNNXs7T+lqDtcNkYiXtBjpUBc3XCOw04MNUpqg2ozMh0PGApTuLKkcNkwBzh8Yp3XQSc11tRORaaciPb7oJk9byulKm9jalk6fxMJemgotqeSCbNKVb455pjPftTJOMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qADEAC3AKFRbv40Yqb1N8AW5c1D7VweUpjPTDAZX59CJ1JJYnUfKxUAjNq5ddrYjJnbdrOVc5ytLVl7nlPqZqm619YN6Znox+IlqrOLYGwf92hontJc0zn3qtN4nVnjXXhHXDEM3O9tUAeWqg1og2Z899tHdlWsuzgzrSR1VlQdbOU4V5tUPG0ZoTZ57mpdfUgTxQHXq8LGZhG8iiS8iouMXcrrcusLNTIDtvi63R43aXc3v5aRhSNayLA9CfWBuzLSPLodhHn/Ro2qakPJKLQM5Usy6TsBQTmZgailXPlBVYoBXnh91IL3/AxaCIOVmzHxk+sQlRsE3V2EUalvbQsn5xMI2Zqiildar0n10gu4LPJ9jUq/viMRzpZVyEJ8RsthlwFLnmLII+Yr8Whjmi4k0AR8SjLcCHdVCxdClU81gTx9F3FJeW+VbigKlNpxP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:41:26.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a87ec23c-28b0-45b6-8cba-08dea60e2858
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
X-purgate-ID: tlsNG-720697/1777480896-80D7F161-CDF91E7B/0/0
X-purgate-type: clean
X-purgate-size: 503
X-Rspamd-Queue-Id: C96AE497C66
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]

On 2026-04-29 08:06, Juergen Gross wrote:
> Wit unprivileged domains now capable to use the @releaseDomain watch,

s/Wit/With/ again.

Regards,
Jason

> there is no reason not to remove any node permissions which relate to
> a domain which has been removed.
> 
> This resolves a complex scenario where a new domain could inherit the
> permissions of an old one with the same domid.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

