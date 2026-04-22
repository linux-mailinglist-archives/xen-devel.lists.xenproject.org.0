Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHq7FdfL6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:23:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62925446AB0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:23:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290539.1570112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXY0-0000P5-MD; Wed, 22 Apr 2026 13:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290539.1570112; Wed, 22 Apr 2026 13:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXY0-0000MJ-IO; Wed, 22 Apr 2026 13:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1290539;
 Wed, 22 Apr 2026 13:23:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wFXXz-0000Lf-1S
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:23:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXXy-000j9P-Ea
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:23:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e8cbc4-e002-0a2a0a5209dd-0a2a4507cfca-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:18 +0200
Received: from [40.107.209.13]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e8cbc4-229c-0a2a45070019-286bd10db11b-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:17 +0200
Received: from CH0PR03CA0312.namprd03.prod.outlook.com (2603:10b6:610:118::21)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 13:23:09 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::a9) by CH0PR03CA0312.outlook.office365.com
 (2603:10b6:610:118::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 13:23:09 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 13:23:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 22 Apr
 2026 08:23:06 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Apr
 2026 08:23:06 -0500
Received: from [172.29.169.138] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 22 Apr 2026 08:23:06 -0500
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
 b=ExGahnoJLFOJ94rK7s+RNdz3r5jIVKYQVNO/uxLvb+Y9KtlZIMbwd4nZvRJVsJ19whRGSxZkxYCpPL5f6UHKG3b1uKyKFYLTN1k1DJZn2Gac3LnmF4cS6WwrAt8TKkbnA3808itDdWjFVowj/2njk703R9g+ZQcuMoS/+q2tlD2dZhFrkRYHiJq9U0pzgK8H8lAvnzuHbO3lFJLXYiETibMyLHw5xYJp/2T8Je9mc7NxlzZ62S69DsBQ+rQjJRMVb8PJqotvFhTIbA1FMgM5UdJ5oE9qk2jaou+iuNwjCllXgOn6wn8XOB2ARwFcPlr/FsiP0KZTCxmGHaSmQOUfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3umMdhVkgCNqepYjY15vJLuZCYc113+SuafNa6V7Aq4=;
 b=AWsx3LLP9ktW1ACTNSjt3IgRMALtRJ0BXh/Rj0DBksR9G9FqqR6meeK6FNiwvXb6X6/E+yKaO+rnDJjKVHKv30UQJ9n/uV5FNuZNCrzi+iOFmOjHsd/1ViJj5O4rCLuxKamv0/d4gzttYbfNlWZsqrONcN4stU3xGoduMKV9pjSxHeRSrSjAUi/GE/EB9eSJsmICYbOgtw8dVC0ZbHVSIu/D+ZWGWhP+DB2mBna7S1xUzKaSekkeoM67GHleX9PavhZeyYv+rfMPzgrU9wVi2/567FxPaZ7AuNFRT7H2IzSGT8snmSoyvEXV9mwiZpub5kUq1I4jgogd7pIQJrcKYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3umMdhVkgCNqepYjY15vJLuZCYc113+SuafNa6V7Aq4=;
 b=MpNXEdLWYdI24jfqSqhSQLUemaoF58QI5hqYbT0ilNkEMwojOASpHPBIUZ2fVTEyuclIPg3XglvZNzxPN73fMKsWiejhGeM4RIZ4iXG77NxixtMxcbmEaaDYCLGl/HOpaRmadD0pM/HaoSAZUSmlo33zYgj5MLKun1frg5FGqMg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bb57b532-20a2-45c8-9d2c-e33705c6bc2c@amd.com>
Date: Wed, 22 Apr 2026 09:23:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HVM: drop dead code from HVM_PARAM_IDENT_PT setting
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <a84daa8c-8481-40cb-9150-956ab5dc56fb@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a84daa8c-8481-40cb-9150-956ab5dc56fb@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e10c39-b783-429a-3d47-08dea0724c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	G77raTWr9w7hlejt4qUKap/MDJ9Y8OGA0sAUgjCoiSXUc2S3xABh0qIKUmIaX/lvtGV84KwiP5r7uEFuFMB/pwRz1LCJxq7fXz32Ai6Qs+oTmid/59C/yzV5IZzUfkoTiP/LErGpLOgj62PDHKkbqwj7n05fdIm2/aqK8vvO3DVhT7okvO+pvHrAM0QPVD61g01ZTkVsoUOQNAQLinASXHReuOGfFtteA/bAFEI+tjtbilB1VADJX9S9xeJo9U/k2pQaE6gRGsldPYq8MxSc5NbTBTHsccdjtEPXjUKP6XeNyYIxYJBcM9yZmz+eCvbylnX9AazBERMwUlUeEpZMTy43rwoejEM9HcO1vRjc7jvvRBtETGhhMeybGbfeKy5i0zAJiayo9Q4X7JnvYBkHWjyMC0US0rzLBOM2K1XbEPIOwjE5ZpH1NVYVm3fXXkVgxGaobFa9g59K6/lJhEa1Zct/ynHwvFJM+LdyI7v1kBUGbq7yFyHUXp5wqUUJsNVzbfQH5ba+b3FNa29sQ2Jj0AFKqcea7cE3qrBl2kP8WvpbpPmK+Q85VUYEZA8KHIyBe/sveIp+H4geLC2yirS/3wDTFgkQ2EX/61NqrS1GwaA5ACHkqI7gAAc+3XJRMZvmkT8w2SkSNn1ENKm5l7Sw7SBUfDGZij2Whco7MdOQgk6kGxg/ewU6M44XSgX1SdHMdTmIgHQGtllRnuFMMvfVKBtAjqkAIleQL/Go4YOcdMalRwnCnx9uKka/54tYFIfgM+FiA/45OaIuFqATZ62i8Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r4qhSdTEAXwFz4+5/NqLgL6WfXmIeYZn5YW6ZYszo+hTPyLMcqw4f7zwCbu8sAJDgXxdZQAS5zFXT7kZY9BHfl2OY1ER/MEtgOQ1+nRZtLY2dXjVaYfs90eUoh2J11sogZKEFJR0OpQmMp6Hvp/7ONASyjgNGi8o+HC9XyMIqI0bwB++9tnBd9//YGDCdbQVbsra7UlW01RN5BPUeY7c0xwFLIFY5Vg3XKAgStfevdmOh1g7lxVDW5n8mlNA6UOhiAOkr0Msl/i6vnlXLkpIpNTByw40ZTWxnKPUHVuNYYhf7YHxVqsDaRlqi1HOSOzfCftKGvcmKGCSWdpru5eD5ZZzp7I71gZpXgfMSiTX5OWa7TgSRcvI2RXPcDSG27WycUM+nQYrlmjggl8aDPWyYPtszG279K7WEJI4+eGMYyI7InynfHB88cCrkIEwkG0J
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 13:23:09.5556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e10c39-b783-429a-3d47-08dea0724c11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728
X-purgate-ID: tlsNG-ef75cf/1776864198-ADD6FC48-BE901E8C/0/0
X-purgate-type: clean
X-purgate-size: 331
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 62925446AB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-04-22 08:52, Jan Beulich wrote:
> The setting of d->arch.hvm.params[] will uniformly happen at the bottom of
> hvm_set_param(), hence as per Misra's classification redundantly doing so
> earlier is "dead code".
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

