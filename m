Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FpmBaW85mkW0QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:54:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565D435007
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288279.1568567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyRG-0000yI-I3; Mon, 20 Apr 2026 23:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288279.1568567; Mon, 20 Apr 2026 23:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyRG-0000wK-Ey; Mon, 20 Apr 2026 23:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1288279;
 Mon, 20 Apr 2026 23:54:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEyRE-0000tf-TU
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:54:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEyRE-008xIO-Aa
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:54:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bc43-2eae-0a2a0a5409dd-0a2a45099b5a-34
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:53:59 +0200
Received: from [40.107.200.48]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6bc95-2497-0a2a45090019-286bc8301d4a-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:53:59 +0200
Received: from CH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::14)
 by EAYPR12MB999180.namprd12.prod.outlook.com (2603:10b6:303:2c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Mon, 20 Apr
 2026 23:53:54 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::5) by CH5P220CA0010.outlook.office365.com
 (2603:10b6:610:1ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:53:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 23:53:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 18:53:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 18:53:53 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:53:53 -0500
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
 b=MStZgXdBGjey3wIzU1gFrN+7E0Qmf23yl0RdJl8jgS103/8RI3S8yv7x+EcU2O8C6oOwKUezE8Ik8eDsmslxz4L3q0UmxTnls76tS4heoe1QyLPhVjyArbF4mkcvV8oVTD8icOQZkLHWoDa6Gbm3KoXS9S3hO4x3KyAoY0HjtrxgSQu4EhtnFtchaiXR30HQoQ7D1cGXjpWIAg0+njmTAPIm8pWKYq8U02kwTo/BNcDYF89KTlRGWWstjhGZlkZIe7Uo3ybsrL3OC3AZGgJLgCjfiEKmd5lYe1RAFHL+ddQMw/4v60HNXE7v4P4oBu3PMKfP9LENkLPtv9D1XDf+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTai0B5TlkNX4vDN7bm6aSQUEu4hnG5t5CdHzY7PlHY=;
 b=wFrPFmFQA/eF2kEe4muA1wfOqLuPYbxuVRJvPKZU6tWEh61G0LzaiGqlQcOFekx8YgWZAj5bOzgPCvdj+PtNbmzzZ1/t2yX8ARcmcf9b2ld1kAF6eYNg6gFLigt8hQnUQUeeCTxCDe4v7HJblVY2+5xtzv18Pu8UEub95sjKi3CJIKoj6kbFB1HtEZWFx6Jn2vooqbVBvm+wLw+oRVkCmESjj1Rf1lAFOJ4YUVDSBGBglr1keh27jIVO2qas/y7Ax2bF1FDsVw7XtObO/7E8AZ1uHPa4fB52y1SWcUWvsQZpkScDKRj8pP82pZ9VTVlbOEmr70ED2zY3iYTn9uZdLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTai0B5TlkNX4vDN7bm6aSQUEu4hnG5t5CdHzY7PlHY=;
 b=TVNjxYKJviLfKn0klROiRABrxwFYQVu4nsjrNZub6fgRw2NBgOIAiEExPn9xaoDDw0tAY37+7yCSVd+FzU7XCqz/zf4MbTSc354k+aib+lypeJvA43f5JRa1vKXTAQmEzqqPaQ+XlPdCtUKUBfix/2Teqas+/EAaDh3Nm0UudF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0744dac1-4154-426f-889e-efedf7c34803@amd.com>
Date: Mon, 20 Apr 2026 18:59:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/8] tools/xs-clients: support depth with xenstore-watch
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260319150626.436719-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260319150626.436719-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|EAYPR12MB999180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1f6fc5-6e95-4c24-2296-08de9f381466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nDnhp0YYQX6RgG0XVjcRNwBA/CtGu2/qS7zrhgrkXAgtR9+RKXebUtNRyAqFCYrbyV5WFD4cT5mS4PmDQ/axWfXALk9r6d8x4CmsAFRnmlNlZs/iG9DXuJkG8GVpNDofFxLSiMk+RCebWo5DTTflVpGVHJAc4kUJIxSfndu3TnbhNMBGtAadILZGZN9Iu58MsUbi/BSZ8eR1gnAccnGyS/JAi4t8ccXUmGEcj1eHC2ZAwm32Xjw+6i7KTb4N53HVrFlsr32XSQStbc2qkZtNLdx4E+OB5Jfs+XreETxNM1CiZ5u8FUz42Cv6A8ReCIFNNo7WkckSFd/so7j4lyU/MAxl3K91lVHsZRRWA51SMNG9VTWpW4qVlURtmnTIjhLVAFZwt9lW/MJhjKOq5UcXuwjwmG4o3Xn+aJDEC+Op3oTvKTQFcj2N9j1ttHAvQzYmIIlK8hl/D3PgahUmbOo+k/qFojeiAwS/UwgdaS4IRFMILR4OVCr/GeEFYRj4LhD9p8F1Kcx4pCD9IpIF3uaIFDj6NDO9V8hNne17g+gGh/o2/Lk+TcnnnncqTRJK2sq3YLUw3eyNgdIvkuPIJ38DEIuZkBkBtSHm8k7hqNWSGBC0G5JMkrK5YmZNlyMeyCqMsbfTs+tYE+UdRTFosjFSbsBqo/ohigVhO+vrl83xAmw9tyrghb25GSRvhHL/6Cl48hlJUgUSz1tCI7seS8nwNQzvPs8j1s013cj5zQDvE40CbDcGzNxDvlhWZM8EoxQpzUMTOm3UnmDKW5ZwiDC8ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	amFMLXD0R5uasg8I/mrxQraarUKzpSwHbcu6CudeOEjEJgrkP9PJ4KGZ1kR3ZjB+sp0eqPKNTj/gWEtKnwioIZlu5nLJ6HvTwvQyAgwhZtmoCwvwrIDVvVoF7Eyow8/eQR4FdXkute75934Ach6jGePf/erZaT9Pt5TaJ3QMQyfPiR0aey9/YqYr4NuOVVqBECllYEN1EB8vUZiZEtD8hsKQKqDgdQVFvp9cmUWa/rGP/P/WFu+I1iCOveNw5FKdj8UCqqc9gQhtMa/oUVXD2nbs8olMPmwtUk60fYseqGcR9II+lx/1bA133usy2hO6zac0VruLO7/s8tCzjLCCOkvwvIXKjHc0uVMJ3LqUdlbRK0iq9lULlpPH8HIzt+msBMZVDaHeo7qYEsq6597vGxldYjwjc8SjVYkEu4cC6PwT7XvfieD1L8J3QujEOlsf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:53:54.2099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1f6fc5-6e95-4c24-2296-08de9f381466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999180
X-purgate-ID: tlsNG-bad1c0/1776729239-400ABA53-3B04D88A/0/0
X-purgate-type: clean
X-purgate-size: 437
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
X-Rspamd-Queue-Id: 6565D435007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-19 11:06, Juergen Gross wrote:
> Add a "-d <depth>" parameter to xenstore-watch, allowing to specify
> the depth parameter of the XS_WATCH command.
> 
> Using "-d" without support of depth by xenstored will refuse to set
> the watch(es).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

For bonus points, you can add it to the man page :)

Regards,
Jason

