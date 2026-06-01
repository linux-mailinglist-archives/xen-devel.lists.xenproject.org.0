Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCxKLlM2HWoqWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:35:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9A561AF67
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 09:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323733.1589402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxBQ-0003dh-U2; Mon, 01 Jun 2026 07:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323733.1589402; Mon, 01 Jun 2026 07:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTxBQ-0003bT-Pp; Mon, 01 Jun 2026 07:35:36 +0000
Received: by outflank-mailman (input) for mailman id 1323733;
 Mon, 01 Jun 2026 07:35:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wTxBQ-0003bL-1m
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 07:35:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTxBP-00Gt5C-AP
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 09:35:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d3643-e002-0a2a0a5209dd-0a2a4506d9b2-10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:35:34 +0200
Received: from [40.107.209.62]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1d3645-7371-0a2a45060019-286bd13e1d5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 09:35:34 +0200
Received: from SJ0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:a03:33b::23)
 by DS2PR12MB9797.namprd12.prod.outlook.com (2603:10b6:8:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 07:35:30 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::86) by SJ0PR05CA0018.outlook.office365.com
 (2603:10b6:a03:33b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 07:35:30 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 07:35:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 02:35:29 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 02:35:29 -0500
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
 b=ggxeYiuEHxL9GeVz/num41fKTGIg20pqzAuQ0HYfCErggfIWX5X2fobWeNXMt/e4+0ALggYKxhioDMcAr53rMGOu+Y/7tgJ/1kU7Vu6PZdgf++ulhM1CUIhlXA7dOZnrHDN4sdNLOgsNRFLkKcsEiC/YBmHGddDdah7I7+J1+pO9DCYWlt1pvaPjPxfZpwlaEBBI5GF9BN7hcdk85zLBD8ykUlPz7dVRu9craRtHu41dD354+LUr99kV+FECficTCVeF518aF9JX/ruiwTVaePEEXpG2Q+QDE3VxW+Ce6m3U/2Yhvee9ddye+mz8qVG9Y7oxXP//YmJGW4y8kjCpJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGQ8o2jBaiMrjtHXL6W4eUAjrwGGJq65hyAYLj7qiM4=;
 b=gBEPovWyfeBVclvYEVdmZVuBYw3jgsvH9JQ/vidvnuK8uNfmjvmyntMk3kwdc/RFpGGjY0abRM1JPrMJ8L+4f331vjvQVnbsdLTc3qqSJWsQ+CZai0fItacccYV1535Z0hfgA2wIM+0VNdvdrJwzBZgo9JPW97ZmM0IBtu5V42VJ0neFqeGnnkD+WcBNcBs5UKwwV7sOoeDn9yp5jgItlta/J9Y1bc97qRuc9Jutw3/MK697s97bvLitjAO72L2aWJTSSEXwO4RjouFqYXwCDa/+BLYGaAXN7SMZ5VXi9oOblBnLxkF80JJHe4FzYlKMQx/Wy6uieNUpYUoXIeTYiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGQ8o2jBaiMrjtHXL6W4eUAjrwGGJq65hyAYLj7qiM4=;
 b=fn/VryiFIHDfnNm5kPzUjT8f/CgQwnW9lOOtY+b1Ru2k2rZCTSdYinLQPESdqXvT8g5bvpdWOtDqnvCK4zz/1fuCCmUJ0/7x1KQX2NiT3r6RD0YLaiMaCLk8qQY3XZ52/THG/sULSny7dAhFUxmAl9rjOTe4fqUTN6aafO4oWiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ac824188-52d5-4a29-ab40-25ea9fd421a0@amd.com>
Date: Mon, 1 Jun 2026 09:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs: fix spelling of 'receive' in xen-command-line
To: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20260601071215.468-1-ravindrarkb1205@gmail.com>
 <20260601071215.468-2-ravindrarkb1205@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260601071215.468-2-ravindrarkb1205@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|DS2PR12MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc6a55a-6028-416e-a751-08debfb05b65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|22082099003|18002099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3iIotwc4dGlrV8w6OQVgXBfs8B/cO5uDLjJSS5m7IJBCFtaFiD1Sp036L3XNb0BdqDFK9rVLWaAWI6V4WtWTH+Znm1vXwEyczUjGYOq85Z83ewdiT3EKAFctxSavkVMrCv8S0dG0CHpw6DJ4kZKBWJ8icQRw+H4kfcvRTVwGGEVEOBU04nw5Szk0evnWQQtOvupekZRw4CkzMWBm4t+SJzwVSLJRCR1+APALXQRDWHdnA8AmSSZx+PPlVIfbMBJB8vRyO5R+A6MqvOMOyjHtdBgCJ0+hGssLDWtPd6Mmr1u5+UwxFJUFC8bgA37P9MEmHF5Dt+kNrMTSU/p3eJS+Q9KYkgk0MlBhfU2E8SEPO5mqxcrjxZa/m7bc/IUg5qoD0bJ6xhqiBrhL11stbCjTn/ZY9T361Il0iEAOGNyXCFOk/J4hoBYfOseUo5g6qUAsv+kxRevhQhdPLFL2Sl9ClDycjOKOYP1re/IMm4g5Bf3SiTikM2p4j5a9RNwu7OHSSEf/3z/Si6TGlyFO1oG//3NxWkwyrlK9dPhUL3/xmeYSMv1smoOx2mV+2IN80w774/EyKKytp+RgfGjpFllZ1uajdypt78e7+OgcA2yaZDD++Svb1SatfPmhyaDs58JO2f8EXIz37yIG1b42IY1nEGKUMjSrMojc8sgCOIt+bBGtOgG5l7opNQxk22appFF9U7NCA6lfNWCcFG7Mx3VhMB35oo4Kov5cSMMtabANBrM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fmfv6NZgrKQ+pWs6QH7izyJTLGdE7BaLw7+oJn+gDoOCrI2RlKlQYUHa2hDGRd8ZNetBwwn/bQlHRPcnt0GQ1DuH3oGgU6eB6DZWPIF1RvvjUydQOUDiyQexNMNOLYDw49iNR4tkO99jj9z10QSz0X4H8VcVGqyTH4yOHUtMOqMJwW2vonpBaTCY4uRkK4Y0ulfsK1Bl+xqFBF/K6Gy6azbk+iNW4lrsWUqjlZTOdHBL3DPa3Hr173kwAM067iTjbv3R3BdugDIR0YvQqkyOR4gNI0LaVpfWVnLCF7GRWoI0jc+HPLeE+pNwAbeSsfYkn5qw9orXJ13DPT6j3MgxhK6uOI7owEPXFmdp8alYb5uJDLLI/KwjO4iOzYwRP4TdFuNbWcLyNCEM2tuWELfNdDMOeavyeZuR4D+twO1ccouhiUohi/QRqhLnUoHGopX1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 07:35:30.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc6a55a-6028-416e-a751-08debfb05b65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9797
X-purgate-ID: tlsNG-16d1c6/1780299334-7F77FD75-563310CB/0/0
X-purgate-type: clean
X-purgate-size: 1083
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ravindrarkb1205@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 2C9A561AF67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01-Jun-26 09:12, Ravindra Kumar Bundela wrote:
> Signed-off-by: Ravindra Kumar Bundela <ravindrarkb1205@gmail.com>
> ---
>  docs/misc/xen-command-line.pandoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 8c89b7852c..ef3c737189 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -191,7 +191,7 @@ The functionality that this option controls is only available when Xen has been
>  compiled with the build setting for Argo enabled in the build configuration.
>  
>  Argo is a interdomain communication mechanism, where Xen acts as the central
> -point of authority.  Guests may register memory rings to recieve messages,
> +point of authority.  Guests may register memory rings to receive messages,
>  query the status of other domains, and send messages by hypercall, all subject
>  to appropriate auditing by Xen.  Argo is disabled by default.
>  
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


