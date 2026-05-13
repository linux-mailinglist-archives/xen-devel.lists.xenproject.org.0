Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB56O0lyBGprIQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 14:44:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052C5333F3
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 14:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307981.1579530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN8xC-00028N-2x; Wed, 13 May 2026 12:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307981.1579530; Wed, 13 May 2026 12:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN8xC-00025R-0F; Wed, 13 May 2026 12:44:46 +0000
Received: by outflank-mailman (input) for mailman id 1307981;
 Wed, 13 May 2026 12:44:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wN8x9-00025L-MO
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 12:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN8x8-00D6k6-W7
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:44:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a047226-bab6-0a2a0a5309dd-0a2a450297b4-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 14:44:42 +0200
Received: from [40.93.198.33]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a047238-af86-0a2a45020019-285dc621b122-4
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 14:44:42 +0200
Received: from BN9PR03CA0283.namprd03.prod.outlook.com (2603:10b6:408:f5::18)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 12:44:33 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::42) by BN9PR03CA0283.outlook.office365.com
 (2603:10b6:408:f5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Wed,
 13 May 2026 12:44:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 12:44:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 07:44:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 13 May
 2026 07:44:29 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 07:44:27 -0500
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
 b=dcYCbzrigERLMJ5codk/tBuyv1Tv6DSZesWj5i0+JiWMq3KTjWHjBUmlATkHrid4ugXP5QEdxWq2gajF344VLJbKyY247daHRJ4OBlKpCkbKfZGL7aVk6MgoLPy0+qSF4ntrDxGryIKK2QgXCd4gUum/t1wCBp/lfPteikPl11ZoMM+df6sVDUA17VxWM27taqyrDYeJsdCJHxKMG4KbtiYatXQpp9dCJl4Gn8at5/d6LusCIsox7ClRrpfp+xCbcOBfZO3WaV8WpWWr1E4cNkG9WK3qjX6HeFOImZtiCwqpW81i9atCHei6pKlxB9pGVTYKIecx4JSq1rrb7xgJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xy5TRS+D5s54Wr780fF87hz1xDyTSeCMmrSyRjQnrxY=;
 b=eFOc/voTWdRH/4eJrVXwZjXKgwys7QY6t+36ho2BnpZbH8WwwRngJ7pWvydp/MdWndfNdxM2QDb7SbC/QDFd9FOet3PIPQZGoinfvtf9O0+D+GRZUg439aYGSxnLgUv1QtLRWwLKoz91a6Yc6tbJvgNSx5+g+BjyRSoS78LlXRS/HZ7q57B6NxQ75MuosAu5Q9AWh1dAxYkOBW98kNAlR7ATyz9FAtmKETiz8AUfcUBsaViYeZNWEMTKZTFFfmiReBjWsbVjWtp/2FGuCKJl4CI9FzzSreu/EsMDNzWG/c7FG2TGggvIC8LLHVjr9oWsx2jWaObvW76XFo/ZCzsghQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xy5TRS+D5s54Wr780fF87hz1xDyTSeCMmrSyRjQnrxY=;
 b=ZrOpLqrNX7wohzUOZmO9obwcLp6f+JarwO/6L/0yyOovSDAIxbmymioaHYQcKMdGjWgZqoy6ZWrOBHXlpPOukhZywrRQRVSxS207zMzMyodOIRkdhwqPLn81AQCjFwLfOtWTo0XdheJRgmb9DyoVTPCxNHoSRKxGwau+ofAuB0I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <740cca52-656f-4c82-b979-58f2f5874c91@amd.com>
Date: Wed, 13 May 2026 14:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Harry Ramsey <harry.ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20260513124138.275290-1-luca.fancellu@arm.com>
 <20260513124138.275290-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260513124138.275290-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MN2PR12MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: 40457883-8f05-4dcf-f93f-08deb0ed6028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|82310400026|376014|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pwVzFZm3/i507lTL4HGJRYLQ8qchTrw0CuFiXh6foaltUUCuTEpXGWZjaFZgD7nDHSdYSywGh8WZTjmp3/D8jTSZWtCJCIJ+5M4hSX9SO+B1VrtiaKk/AM8CjcI9iDIzVns/6n+/8fiuqBdUrOmO50sWAPx1WlvBkA7KpoP4+RXXLn9dtASMkSAU2x8yWx4I14ARkQGk6GVWrBELc/I775NCWnP9PSPA5W+AI7MMVGd4ZXemyHuBbIIwFDj/SyvbYvA2vE4OTgFiiaHWMm1MTuvWDD6YxJYMlR3xe43IdwdI0O5tjVWh2WALaXBu1n53PiD+7ahhiX8iHGXspZPSuwdT7SAp23y1Pmy9ufrUnVsbuAmQEPftVPwdbQZiP31B3cnWRdUroqst3s+0pz3gvlNhi//28vTnEY6+Z+SBlE/xAWSq+iTnLOCiIpFsHM2R7pQMkthrGYSvkhcFtSW7fvwekpgpNG77bQMOP058GoJQPH+8u/T8vuJa4jRgEDZx+mEnUSQm9/EEEpgxploOX00Squsp+hMBGpSIiXcDliAXPvboDYcS/mxDbECj419H75K9V9ACXU4QkSV83B3rQ/bW20UokvconCWmw/B8lVvyH6Spay8XXUNO+Za1vWGijSXBBTcgu3DyysIyIs16HNNX7bM2OIn60qc4wCEGji3q+LynovsIcQ+lCrrDgzfjGYNEOb84tg5rtE8GXp2LBIdw25yeJpeTC6F4SSYgO6E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(82310400026)(376014)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vhRnthjz/HTNzsJPbxLc/a8JDgAXXykPYCo7rcpyBsC5sfNmm7bJE51DZIsRuEVoo04VDcgYQnjZ4Z3yULuLgn0NIpLFZ0wfgfTUj4tl7ZXBYv+XqW9lxC4R2G+sYQFBwPyGXu7bC2Z4PdN4cYwnpqULkeBG3fQVWBMsIxhefXlIg2USfU+epRYSUGZ4rWNJFTzJ9u9PxDdXyBC9JPLLx2AhoWfRlPpsOs7wg8rKuYVtEm/4hlk5lX9XXZphz2ZIfar9jJ/31EJwmnkP0dis5QXV1qQNg7MgDr89Yn5Fi0OAR1FOnl/6dQMs3FfMl16NRHgJOIJdlvIFlxTB3A8ZITdzo1SvKSh9L77aJbIG9otwN1c64CP5qB1njrO4r64KZahlr/LD8PNyRkIw5RkDtDgMq+b418BMelJStNi1mCR4LdpmrZ+GP63wyHC0lFQI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 12:44:29.9802
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40457883-8f05-4dcf-f93f-08deb0ed6028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045
X-purgate-ID: tlsNG-720697/1778676282-A877A161-B9486FA9/0/0
X-purgate-type: clean
X-purgate-size: 964
X-Rspamd-Queue-Id: 6052C5333F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,xen.org,epam.com,citrix.com,vates.tech,suse.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action



On 13-May-26 14:41, Luca Fancellu wrote:
> From: Harry Ramsey <harry.ramsey@arm.com>
> 
> Add a new device tree property `v8r_el1_msa` to select the MSA (memory
> system architecture) at EL1 for Armv8-R architecture: MPU or MMU, the
> former is the default if the property is not passed.
> 
> Implement the dom0less path to parse the new device tree property, add
> a new domctl hypercall input parameter `v8r_el1_msa` for arm and
> add the sanitisation in arch_sanitise_domain_config(), the parameter
> is intended to be used on CONFIG_MPU systems and returns an error if
> selected for MMU.
> 
> While there, add explicit padding and check that it's zero during
> arch domain config sanitisation, given the breaking change, bump the
> XEN_DOMCTL_INTERFACE_VERSION.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


