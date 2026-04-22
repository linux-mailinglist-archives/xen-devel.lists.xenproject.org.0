Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLuAB9DL6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:23:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95434446AA1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290538.1570102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXXq-00007M-EZ; Wed, 22 Apr 2026 13:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290538.1570102; Wed, 22 Apr 2026 13:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXXq-0008WO-BS; Wed, 22 Apr 2026 13:23:10 +0000
Received: by outflank-mailman (input) for mailman id 1290538;
 Wed, 22 Apr 2026 13:23:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wFXXo-0008WD-Ls
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:23:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXXo-007MYT-2Z
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:23:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e8cbba-2eae-0a2a0a5409dd-0a2a4504a4aa-4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:07 +0200
Received: from [52.101.62.19]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e8cbb9-1dec-0a2a45040019-34653e1325b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:07 +0200
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 13:23:02 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::3e) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 13:23:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 13:23:01 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 22 Apr
 2026 08:23:00 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Apr
 2026 08:23:00 -0500
Received: from [172.29.169.138] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 08:23:00 -0500
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
 b=lkYdj9Wle8kXYbmW3hsIcMB9Xo5JtBTBjWQdLxOoBJFEmwvyD+X79jH2zjXn4xP6r6pHuE4ZOkdXyvBkcLKGMcrE2g9YJZv9SlE1mDGI0yxv14sgGbgxLD2ihvmnRXKjC3/QFra7aW5sX4pNyNeswQ6gogjJS1UdSqa+axg7lX7Ak8/EitND3Xx2hewhDj4Qp1cHdk2/cmXH/EUHvRr3PQyWHkN8OBFj5gZlF2Bm7uzJYkF0RtI/67JhZSIOj/mMHAg8t0h3aLPNMxfbxD/2B0LdYb315MjrJcreu4sdiDNcc42ryT7wgtB3mcTO5aPgK5zLFTyijSIjc9ldJodogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCebRR3E+3XOTHOD3xaKmkxFWSweV4rtrn6h2sO0FGk=;
 b=paYs4UbbX+vr4npf6cGm1uJyNaqXQ8+tvGuuHBwZNZV9+tVhE9M8VQNe7XwAE+Ind3oeNmY0Q9JJG3Yww204OPyxwpmLnRBFb7pV3h63YtQVY4TgverzIye0I67kVB2uYqyHKRqOJKa0sN8QzM5lHyY1/+qMCz1rSJvzhJD8lQXFTNu/DK4LT9zTDcYiJD7pInZ222EUKMepb6Gv8xlSDJ8Ailg/mRxwPuC7QsM0msCYJZxivX08o+gPt0eEr2t3HZV82C16He1V5pg+1Q6nBJ4kGin96BcDtgUGW3Acc6Rr+6sJiG07IlM9m8Qutb82iC7drGPOXnIKVg7onjOAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCebRR3E+3XOTHOD3xaKmkxFWSweV4rtrn6h2sO0FGk=;
 b=UotpT+spUt+AiQAq4h85e2nOu0Zwm/AgcSJ4de+50mQUZLbaEm1nS61eGLn1YLbcK8q6/gZWirH2R6M/bewVqOtwgdehQGTVnj4nU9I7bS6Rq0RShZX4Rvtz0oNhK3Ho+aoTbJJK1wwAODYCaXmRAOg8CRa0xSdOFiULKSo1k5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <11a2f814-984b-4766-a62e-2af059c6b63f@amd.com>
Date: Wed, 22 Apr 2026 09:22:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tools/xenstored: remove unneeded check in
 create_node()
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260421071510.222547-1-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260421071510.222547-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN2PR12MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: b36bd5aa-f267-46cb-1763-08dea072478a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RR4qGfhR1BG2L9+cr+PLw3py5D7RIM5NuHfcxY2YlpioQ+oj1jHdl5FTY6KEwdYwjVPWsaCaF+GLPZbd3ACELxSA5O86VifuL5SVyty1ZSmq9jmIwC20kXrYuqbW9fEu8WvMeV/HPxhPjipYVSP8ThsM9xGQCL63ks6i+4q8tvo8Ck1UjKC7VGDfxGDMmgXOnkR+6kGZEbIIlaQQNYCPdLUIqbrNzR0Fu3IMQKkP/pH38Y9mB4Sb4bc2Qh2k/uVrZQSmD4oSn/I2T6SP42xZewuBfocsXLJw6BxKEkM1+y1gAIsYbhmUzzALk1OqYEnPkAzcb3OxrII4KyScOw1hPFfSlMBex23hk04ZcMO17fmvJTuo3j8JpZZDDmalsowMl2Cqiw/5pdVKQ8GbdiddWwi01rc43hVlCdHyUr3n1CVvXMUF54XP99i4xQ1lkfYlPtobIu+pFFKO5kjkSQmZdpETDIAkDnWDRkXM5Oi//vjokoEfoJx7kz/XU0SLPA/tm9xpZr78WTpSRzUpqff4lx+/W6l6DH6ElUT2vv6eoM6rrobi4ZW2roWH4fABDK3kYmEMUMIz9Dp9s5HP+ednSyAtOdStp6Z2TO3CbqAL+Xwda0BH1/YdzzgB7g3W1zpcCklotFVGq6E3wz8xUlw+QxE6ELPXwyedTaMAgDNznrm7iyzD6bvzvTiYtC8X/l+/OepIpSxrB9EiyJV/iI6ZPcUMl6xLWZ6bkjK6Cpqp/uIvUQ52z6cSnsItAWuIH7wAGcgsrvqfJ2dr0th/54cI2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ADGAAH3Bmv16KQffGKpWH65tjYcPH7WQqcruD9E1/RHT8vRZZDMeqXiw7SwlmrZKCSGolidWf4I0nyYZW+uzV1CA2vfbmH6xw8+LJW5z7SzDbld8H4yHnMiHtQySFriFKi5S0GhuOED/aiqoBmkv6N98/lRAkuFOSS5Cfa47mdfpnZ5NIRnhwYL5srX3+BSwDJ2JkEK4GkUD4Epg7JxVD6WWbX6CpBOd9eUxuxtgOlDHEz8qvMZ6UQMr6Qj44AwgHFKk1hVrN7p5WiC5/bARKu98PBLVuDpdj1wg2RagBI8YKXusoECB/37G9KBjj+eV/OmHJeUd6S2N6mDs3oVny2xJMUwL7Kl5aem22asS1MjAlCFwr+pZ4i5OfqtDXqLRyQZQULUJPuyNqo6hekc+1krKWmrb25mM6ZcOYCaFIR1T/6G3m2dWlV4PQl8sLTYF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:23:01.9565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36bd5aa-f267-46cb-1763-08dea072478a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
X-purgate-ID: tlsNG-ebf023/1776864187-32C773FF-6BC6489F/0/0
X-purgate-type: clean
X-purgate-size: 343
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 95434446AA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-21 03:15, Juergen Gross wrote:
> create_node() is called only for issued xenstore commands. This means
> that the "conn" parameter is never NULL.
> 
> Remove checking whether "conn" is not NULL.
> 
> Coverity ID: 1690859
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

