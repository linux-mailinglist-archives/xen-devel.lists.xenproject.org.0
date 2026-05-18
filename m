Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL70NQqZCmqU4AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 06:43:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3A565B7A
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 06:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311424.1581554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOppP-0003S1-Gc; Mon, 18 May 2026 04:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311424.1581554; Mon, 18 May 2026 04:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOppP-0003PX-CO; Mon, 18 May 2026 04:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1311424;
 Mon, 18 May 2026 04:43:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wOppO-0003PR-I2
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 04:43:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOppN-007SZU-UP
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:43:41 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a98ed-e002-0a2a0a5209dd-0a2a4506a4b4-6
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:43:41 +0200
Received: from [52.101.56.26]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a98fc-7371-0a2a45060019-3465381a905b-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:43:41 +0200
Received: from DS7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::12) by
 DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Mon, 18 May 2026 04:43:35 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::3) by DS7P220CA0024.outlook.office365.com
 (2603:10b6:8:223::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 04:43:35 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 04:43:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Sun, 17 May
 2026 23:43:34 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 May
 2026 23:43:34 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 17 May 2026 23:43:32 -0500
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
 b=M8CfGzWTrlmlp4kZtAN6CbZqi56RL0wdXr1YXPkcToCzho2l6IkjKGUtuqkkFmMa8msGWU/9RCi+HJX5dB/LX5K+Nk+dkJ/rAiiI3wuQZIGp0aRNoofrCErp+pT1cDyKpplHOLa6tTOqkVZ2vhbGdveaoGZRCCto+sJP7KJalEXrNVBxQArDdMTBnIJyLDdf68AEPKmQ4aCJOztRPXbt+Eg+Yf/PPZNsxx1y+Eyccmxmvm+EaFnPD9mVOX1L1lV2Mk/DuGFijtR7bcgjK2QfGV5jLykRYPdU9OYMjFIgKqHi1JmIICYe2ofJKAaPIGnMHrCBIozyDUNn8ZBXlUI+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu7ayqMrH3qnWZfGPzCNiN5ktW5dNIQOgGBRXrgbBkA=;
 b=eJjQXdiJtVr/1t3wulqWtQfSdgs07SzKs8/XgNxVkcWqzG5mkufHGdChr9HuzfNVNyCXTT3ShNEsxuZJrrj7zvFo2CYkUZpJ31j0dbQ8EeyMDECN1/GuUw3l1ySp8hlkPUSnQzeZFdZuT8n8In7um50t8bS5jX6g4ISj+ik9PNr7mM+CPm7rTuNh/y76qyi95z4qcTa6AsUkEduVf3DH+Wygp7lDGq1F9jZ41Q9eDDjn2v9QqpogRVncn9n1HA7b6/1+J9hYGNboE+c306kIEG2MydM7gq1CcyQogAe8Ud3wZmKFcqJNEqnzVGjdImiBitURXXquY8JybYPFqAH3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu7ayqMrH3qnWZfGPzCNiN5ktW5dNIQOgGBRXrgbBkA=;
 b=Rlme6E2F27okP7zq3G8WJnCP76+cYEs02+l2ul/VZ/fO2GjdEh9RTph5c29qkKpLq9Y1L7DqsBWTuTsjRcM1WgfmH7JwBbKtmxfe+5etmmJLrFmG3z8OblIvMXkRWB2saW21FdC48yJ1EWfTlW5GTRzP11KyLQYB9kcCdieeDyQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8f0aae8f-cdb7-4200-89bb-bac8cb075df8@amd.com>
Date: Mon, 18 May 2026 06:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/gicv3: Detect normal NC ITS command queues
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <4d72da78b9c30f5da62c8e03c3b03a01c24101eb.1778836836.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DS0PR12MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 9faa458d-8a73-4008-8eec-08deb4980578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+lHceWdbBjD59YEfM73BkMIZ9sO7c9dG5dAROCKcxZceM+K5+QeC8CqITQP8eLkauUfWapbO4J57yoUfmzTYh/MQGbB68Eir7xLlzezoQApvSyDjGh6hcvwkZNpzyhUlzFgRZhngoWkratr0VCmLsFGyT+hoxKUxGD+Wn+9w0hyheN+KvGoDUk98f2gNiRdQAvldJ/1qKfg8Yd6GIkiclu9WHLMLwyVx8tGOAN2bHP5CkzA7U5y2v3yeNdNvxpRZ8aF1CiXgKeqwUJ5dQuNzCf0bipRyb5d4TvGdJpvEXDT8EbGq43vsMNRRwJqTx/pbLSnWJeHoqp75wNcO1Vhm1f2K1dxyWD0VMmj00cdMnA58zOBNyojCsU6o3GKaxAFf8+3HutVVbg4ZksMaJw1iVVbX5d8vSqfnrL7lDKhhLcuP0HOi8lBE+51NIMPqwCH/DZi94jcjfI32xVv9llHGcaVbvTHiRDpQ+DtM77lIizXhD4a7Z4b0UxMvEe4ofwWHWJIUb8Wb+OH/LmA7yUEaQcx6c43MGd2ySFPuoO90C2NOlZh4wlo5Skt8SOhBNbV9u4tSEYWaGZtYNNWKoOMZxq6/AIeR5aIcNS3WOuvf/HVlpS6zYDl9m7rujibaeyEiipLXSl+P64CRum8Ny+PMPc9M9pAJwAP6aD6ytvX7JwcKWCAODtzO/yTk9UD6EpuX0tZHDd3RX2Qf2jtsizTB2JGKdmokMjKvhQE2P0L0rHU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RMmWtHv2/Zk1SMPAVTIcUQ8iTgEfbokafRgi6cFs+oJVS61Lcd7TH5My8f6P3atwcy/O9f79OcQ37ibia8wKrlH96Q1WYfJFE/3g+GrppPe04uYT45/PgS4HRIj7Qjj01NAjIR6HcNILvsu0Qmpn25gUCtBbtRqCj0Bozp8ozuZpNvqEnDBHRmTD19sm147KyrvDAqz7oVHTrPLdTGfKk8/wilmcBdOWkj2Cm1d7irrmcAdKHXwYYEruepaWsZ8Z/0VMAkqr5TDN8QcE/q2pK5juO1OBuUJ79y6E7zr6o4CooX+6B62VH5nNjDfdFpRiot2pP34PdE7pp9T+3lQLIc9r9LzCCQnsRgbCct7d+Csv7kLKS3388cJDAGmovyj+bi8fjgWMHikIOOFEnmN0URytcY7Hyf3A7AelX9FSuTD6SiD5XgyERyDauq1X85E5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 04:43:35.2128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9faa458d-8a73-4008-8eec-08deb4980578
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581
X-purgate-ID: tlsNG-16d1c6/1779079421-84767D75-DA9A6CCC/0/0
X-purgate-type: clean
X-purgate-size: 782
X-Rspamd-Queue-Id: 54A3A565B7A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 15-May-26 11:40, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> GITS_CBASER.InnerCache uses the GIC BASER cacheability encoding.
> Both 0b000 (Device-nGnRnE) and 0b001 (Normal Inner
> Non-cacheable) describe non-cacheable accesses to the command queue.
> 
> its_map_cbaser() only checked whether the shifted field was zero,
> so an ITS that reports Normal Inner Non-cacheable would not set
> HOST_ITS_FLUSH_CMD_QUEUE. Decode the field before comparing it with
> the unshifted enum value, matching the handling of ITS BASER tables
> and GICR_PROPBASER.
> 
> Fixes: 8ed8d21373be ("ARM: GICv3 ITS: map ITS command buffer")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


