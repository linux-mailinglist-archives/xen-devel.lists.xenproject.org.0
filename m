Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxaDgSWFmq1ngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 08:58:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952575E01A7
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 08:58:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320356.1587672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS8CM-0001Zt-1e; Wed, 27 May 2026 06:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320356.1587672; Wed, 27 May 2026 06:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wS8CL-0001YM-UL; Wed, 27 May 2026 06:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1320356;
 Wed, 27 May 2026 06:57:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wS8CK-0001YG-T9
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 06:57:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wS8CK-001AO6-4y
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 08:57:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1695ba-bab6-0a2a0a5309dd-0a2a450b80c4-6
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 08:56:59 +0200
Received: from [52.101.48.25]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a1695b9-212f-0a2a450b0019-34653019d08b-3
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 08:56:59 +0200
Received: from MW4P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::25)
 by SA3PR12MB9200.namprd12.prod.outlook.com (2603:10b6:806:39c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 06:56:52 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::30) by MW4P223CA0020.outlook.office365.com
 (2603:10b6:303:80::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 06:56:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 06:56:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 01:56:50 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 01:56:47 -0500
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
 b=m242J/hDiQ4T08EyhZ6CtR46sOiRsniOqwT/MbRp3z8zVn+J28muQ36d3lRktD0z4csHoIyLAgyb7mWw+uGpMgslBI6qy+qQ5/wc8eLPyHCiPA6GJWGZ1+ccuCprgfVSuYsq4KsCrgn0O0z9RVBy42/Ah47L0CH4UVwlJgqfcm2prbd6XGgSNS57j+EtClxfl2zcRyxmQPtp3b5Jz2SYu1UAqc7C0rrIb2dSsPeZ0434Pd9QArxxBsSVk7qzzNvawbWiCDS6b2pz6hx9PZ2hIgQoMJV/JFx3fUyCFp0aEMiJTzJD5hj8ddZMP023UsrTuD/o5t7l5aOvO+ZnaLUmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+Hm0WuG4SBwX4sQapygElVvNNT9HpnJRdBg2OLnvV8=;
 b=N0pFjnQWQ6ohClIdsbJPb7MeOXWMvGTPd+hI7h5OQKgmJG1FMGopt7OwSgNpQLGz9dhDOKWOvMI7W/m7cqFdjvhvhrMN06WwfNNicKXHypYe9msEHbw04corevysMNEmXTtjJNwnQeyJJlRCkEAoQ6Z4IpC7tjX/V5bHeqkoCGZnL/XfjXmRDR+Fg9z5OcVRsIwOByoHIaZXXutznrh/906RE4btxW+w9yFz+s5fo6GF8BKgx6R1gnG9F76LJSCwDcapKKaBXtPyTZEkYwVyPmEh/sLtmtB3tRLn85Y3AWGs/4cCs8bdW6wpPtgaiOzIMQIJmE2L6dPdiTaqaEW+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+Hm0WuG4SBwX4sQapygElVvNNT9HpnJRdBg2OLnvV8=;
 b=O5SYaYJBY5xnCdI002F2q++D6F8mFwF3PNSR3nihYIVy0vV37NzsE16yUFyFmVVsncYcPfutPRz7/xoVGtTlbg7wHXPZ9u2yUpBxhzLOKuq6Ra9aspSfvXal/t/3DL3npyF3C7LwWSUqmXeh8o2NNutFAcy7LHFhAVvZDQtI8eA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e9b6b372-0d97-42c0-9ccd-246f626cf19a@amd.com>
Date: Wed, 27 May 2026 08:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/2] docs/arm: Document GICv3 vCPU limit for
 host-layout domains
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <cover.1779840898.git.mykola_kvach@epam.com>
 <0799399a712539130dbfced315d5abb8e20137ad.1779840898.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0799399a712539130dbfced315d5abb8e20137ad.1779840898.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|SA3PR12MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: cffb2ffc-a3e5-4302-ad81-08debbbd2182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099006|4143699003|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bLXZN6OOko+pnL3N4Y+w9rczW3pW/8LMOPNTY7MnWHsQOODYeutm6KCpgy77UlBJHKIoYyeke6cRf0hFZS3J+jDC+Iaeg06dszSM7aDqwdCHvtBRsP/ajkf415N9yUafZPe7Ys+bc7teZloDTb1ASWeMGVBEHcQuGZ2kJX5tay3WSNOeJPwgHRU5L4v15C5joiHwJMsj+odCYzTU6VxzYNuVWbPfyvQc+Naln629oQqUCSpz6caf/d39/VcbZt3RAmMq8aTCV++O7URAR87tqCvfi13C+OTjojZUQL+8fFzJngOUdPYYOna6hvM9eGLySGNb+S2DKYma1rFCCoiNayIyEQ9XdDGq8943aIDSYkS6Vv6nlf0fsAQBSkdQwmlMCPUf9VlOwYsDXsc3KW5Dwch0d+BvLI4AlB5xzhmgW704sWlzoJV9+6Aq2O5SElf3y5my89t4xNIX5rZpgZuR9ox8+WCpLzlDxXu78Q5WNy7YJyK/f/6XYNJBBfje9p/wyJraL99uKazGN0ZFX4WITMVWJsiEYyItdJFnYXY6/vi7TQhbcpAKIlMJyMqREB3z1PGxKMWjSoUb5WNMLtgXbM8l+yQI8os6dnZNIiXDoUphrgQ8TWONSaqFHV9BpY9HR9BYPuN6yaoYKDF6HdcrrvypojfdPbRZs7ZrNCs4W1OuPtMLCnteU6KFDVLaDRfki6omn9b6YGgXvPDSlYAZtN2P7PakQyyPFto/m/3Dqmo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099006)(4143699003)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2BuoibAlQBy2zcaclYaON7tzJBhjgvFrlZhRUTKC2fqo4SuU3jTsxouvCThFm8w694XMvhFOGvxE9L16kSy9nA9WhXWlOPBYuzMa73rerB6gmZ2X8c0ae8YzSLiEA3BxOy/DJbWZzF6HSCFyysnXFOGLeOicJyxumQNMsKGU2OXF3pVruHtximC1dAI54B/CWtwqUwn9qtCldAYKQqgcrm+Z72Zwx4MLRc56qoj9mhERB5ANnN8YLelcx1W77/oIsJ9ojIQVRHNiNkDLwYdd/5IHQvzAsMEskzJS+GpFoN7ddFta3vEMoSSgQ4aHhDvh2iTJCBy8u/QkLxxzs1MmgTJ2aef82C6UQ4q6Vy8xU0CDfUth7qvPTvaLIXT93nFGRCMbHLXjihfIvbRxjpxJPhJ+DD1Pg+O1+dm3LA8fJbcOr2vqF9+FHccGKjSNYgoz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 06:56:51.7518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cffb2ffc-a3e5-4302-ad81-08debbbd2182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9200
X-purgate-ID: tlsNG-42698a/1779865019-20479F3B-CBC19789/0/0
X-purgate-type: clean
X-purgate-size: 791
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:xakepamatop@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[epam.com,kernel.org,xen.org,arm.com,citrix.com,vates.tech,suse.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 952575E01A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 27-May-26 03:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The number of vCPUs requested for a boot-time Arm domain is not bounded
> solely by Xen's generic domain limits. For GICv3 domains using the host
> memory layout, Xen can only create vCPUs whose virtual redistributor
> frame is covered by redistributor MMIO regions exposed for that layout.
> 
> This can affect the hardware domain and direct-mapped domains. Document
> the GICv3-specific limit in the `cpus` property description in the Arm
> device-tree booting guide. Also add a generic domain-limit caveat to the
> `dom0_max_vcpus` command-line documentation.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


