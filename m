Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMjDIUM2HWoqWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:35:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB84B61AF59
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323727.1589393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxAq-0003DI-Kz; Mon, 01 Jun 2026 07:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323727.1589393; Mon, 01 Jun 2026 07:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxAq-0003AS-Hp; Mon, 01 Jun 2026 07:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1323727;
 Mon, 01 Jun 2026 07:34:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wTxAn-0003AM-W8
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:34:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTxAn-00GcC8-8l
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:34:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d3619-e002-0a2a0a5209dd-0a2a450aa8fc-26
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:34:56 +0200
Received: from [40.107.201.4]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d361d-56b3-0a2a450a0019-286bc904723b-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:34:55 +0200
Received: from BYAPR21CA0012.namprd21.prod.outlook.com (2603:10b6:a03:114::22)
 by SA0PR12MB7479.namprd12.prod.outlook.com (2603:10b6:806:24b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 07:34:50 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::46) by BYAPR21CA0012.outlook.office365.com
 (2603:10b6:a03:114::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Mon, 1
 Jun 2026 07:34:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 07:34:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 02:34:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 02:34:49 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 02:34:49 -0500
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
 b=aalrJvPlP2OjH6u2h800ZWkVnzEaVyHiEobxUROWmbncMUDXrX1iVdWNBXEdbXtmYlLS2h+9g3feGbyhYFbHEHeIATyvbpO+lgT23e5xvkBCxg5ytN3tXdE+S7QC7YDBDP4JW+vzyeLeRIUWkEQ5aZaMm/VQsYNVM2wzqZdgxpsli6Xo09u2BLPbU0SdXlXByBgiJSH/57/isAtWYe4PvDbrRLN04lrDjZmDJ/EBnZEOfbA1o3rBdvhPpOuebtquUGhqSD1zQF56kPyc8ipch1Lbejcz6Miw9dQvvpkfhedWIIqrWG+TQXZS5Wfel717UT91QYUZZVsEib+M7ayuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiewfEkKi4x8zFr6QmO9Oh/HQDEw+bCh/sgdL6uNHcE=;
 b=vqRA+aJVhVk3/nKM4autWwAZcpQyww7XcV8WnTnvncV/GGYEsKut1TAbSuqaIJgkH2tLVSLjaRomA6eOoh+wCiXMj+T9J8MZuNvdCGnvae+wZ8u90IH0VxjoyDgJzWJUOkLfyr8cZ2XkWVamdnm2ExTgoFa774S2Q1QEDZAHC9lo7tHw8vXhB6tXo5Uh4US/ZVbTP6B5f/lfJJsebHMrneUe12erTNeNwveSIiiLQTseYdZFPzsmBnufeIiBYJ9LHUAyjxh9hIryfjBf+CBITHhHU3eVottNhnIAS1SmcIJOcw/f4TXs+jL5ZRN9r+F6GGaC2M6yCdfmse9em2u6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiewfEkKi4x8zFr6QmO9Oh/HQDEw+bCh/sgdL6uNHcE=;
 b=ZBAYOnjWyMvkRDxOvDpW3bcjguAkZFE5u2JOFp0LZnUApRZDHDc+wuE281x5tbtzC4PaPOzDrD7ul/OX3eIzZT0fyOYkEKen9sE7hoNcmBrauwenGAQ8PpUcNN8hhe+65aWjClZ9OrN3wvSWUh5koYzuSZc22li2rAKpz3k7BPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d967c9ad-6300-4f64-b484-c61d09b765de@amd.com>
Date: Mon, 1 Jun 2026 09:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] docs: fix typo in printk-formats documentation
To: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20260601071215.468-1-ravindrarkb1205@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260601071215.468-1-ravindrarkb1205@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA0PR12MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: 4179dd17-abf9-4f40-0a97-08debfb043c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LOXlDlwL0FyOHBfMmsjL1VqwsKLU/gDbcsqNn5QwFpus6Dln2biw+kof42zxAX6SEyUZH7erEu3hJhHugytdGglAnsD0xPNyZTnIIFsw3NC5UuOa2nO4quOuInqApW21x7J84HrLLpGjH8zC8GsM4FTBUhqLj9c2rkqnHHY7izpjTR2ud44tjaAMjEuIwmo6NJm25RzGjmq1xzarfK/FjaLDA1gFJizEY3OtTowiz0YLyqsh+WdxwgJ+btuTjB5nmK8YAMwVdi/woq4zmmNbu/+NFZetmvdCy/3rEDDinlsw1OK+MiJX+xWb95eI9zfPCBFlSkQ+Lhvj7O5rB0ODdV79vZRQzU2e7QqUlqZVqWjKuJX1DSuMmYsmN+Gai3TVsn+m15kTFI5b4smWwojOBIJ/RMcQwAPx0xz6oa1+qM5NGDZiT0jysO2amwd2FTGTAk23FmoLOhbvTGjptoYW9eMJtYCWS2Ny6pQzIgmK0f455ues1kkAFGqR2ikqdol7sTzVgzNX6KVJDc67dHwK5aVz3bsuHxFU9tVq/n9If0ttZn4JxwUFP7T0Hc4eyxmJHq1ZxkzWoVfadNAkFvZlHI0599oCeD9irTYjldWKPx/6ckxh6OcEbCVPgZH1brCYG/717becqMVzVgI7711kPV3WFL98o8b0/7gT0l8u7qkiTTHm46X2CLxR6EYIoZkHI3JB6ZrPf2SVNrETiwwkYpd4hQD6effJ2SnU/h9pXJI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yvec5eHc6uqfV2c4GKWNCObGizEbiZUEGEdAqUsitek39VMjQOSYAYnOebtDjLolyhjsSxvOi4ZzQTQ90nyoVCSjmwwyVUcud6jAT2o3cz3KxumVFTNgGtqekVYwAyESKrxBP5jLR7uQXCOvaqGGrQGNVEJ2/CyMxq64IPEPRWw1zaZgDcqDj2wQB+sy8rPzc3f2dHF7RVgpwkWuxQVV57o8xq6ttw7Wr7QZ6IU2z8ZaxiOpQKQqnHPLYNgMt/mJpzw6TyVkjWXlb1NCh1gmYxSUItCGvN3VkBWaj7tHHMB5OF2xtKmB0cufdmpFKaC+tOyqGEftZvEArm/PR2By0Qf3XCaPj+D/FO+GELn4a563MBoyv3SrjlGgXKIYsE5dL/YZ3dvTq9u6rPjAFmrjT43Tzp4RnUR1WPggPmw44PrZ/fXsnJd8eRMl/yujrYNi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:34:50.4217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4179dd17-abf9-4f40-0a97-08debfb043c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7479
X-purgate-ID: tlsNG-4011c0/1780299295-7015A8B7-B8A39ACD/0/0
X-purgate-type: clean
X-purgate-size: 1018
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ravindrarkb1205@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: DB84B61AF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

Thanks for your submission.
When sending patches, please CC relevant maintainers by using
./scripts/add_maintainers.pl (automatically adds them into the patch) or
get_maintainers.pl.

On 01-Jun-26 09:12, Ravindra Kumar Bundela wrote:
> Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
> ---
>  docs/misc/printk-formats.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/misc/printk-formats.txt b/docs/misc/printk-formats.txt
> index ce32829dae..2cad98703b 100644
> --- a/docs/misc/printk-formats.txt
> +++ b/docs/misc/printk-formats.txt
> @@ -23,7 +23,7 @@ Bitmaps (e.g. cpumask/nodemask):
>  
>  Symbol/Function pointers:
>  
> -       %ps     Symbol name with condition offset and size (iff offset != 0)
> +       %ps     Symbol name with conditional offset and size (iff offset != 0)
>                   e.g.  printk
>                         default_idle+0x78/0x7d
>  

Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


