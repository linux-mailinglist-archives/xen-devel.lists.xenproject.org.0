Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFSoHcdB+GnCrwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:50:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0E94B902E
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 08:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299532.1574074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJn8S-0005H8-2x; Mon, 04 May 2026 06:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299532.1574074; Mon, 04 May 2026 06:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJn8S-0005Fh-05; Mon, 04 May 2026 06:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1299532;
 Mon, 04 May 2026 06:50:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wJn8Q-0005Fb-5o
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 06:50:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJn8P-0011GQ-Fm
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 08:50:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f841b2-2eae-0a2a0a5409dd-0a2a4507d964-14
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:50:28 +0200
Received: from [40.93.196.11]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69f841b3-229c-0a2a45070019-285dc40b14da-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 08:50:28 +0200
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by MW6PR12MB9018.namprd12.prod.outlook.com (2603:10b6:303:241::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 06:50:22 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:2d8:cafe::85) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 06:50:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.1 via Frontend Transport; Mon, 4 May 2026 06:50:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 4 May
 2026 01:50:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 4 May
 2026 01:50:17 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 4 May 2026 01:50:16 -0500
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
 b=rpNlU/vZtwTTFv7XXQQ3Io7TfBTY/yvlnf2/VAwuNca4Y3ffc0ZUWFN3ggD1T3BJVBfeyzjjockCR04heu0HSQftxh9g/xuwydiR4NUSJNSd+hxXTrNphChL5MnWBZ+w097+gen9ndjT63uAqoiCviK4Ob0wXu1dGk0OIQ64761jau5675svekawaLg+psLdmamEeZyluouCCbqXJnfpJ/dk6elWFD4+VcAO7VgxwY637OGUQAjlEIhYh3OJIzWoBgSdfbeR9nglma2uScreLyYMimokGoPwVNscRODbDN66Di104W2OTUi1SDNsEFgWXtnRcWhbCjB910pmmLRm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpqUjFKiK1Aqh68TRvb9+tr1IbfG89bWxVthJX3f/vw=;
 b=ieAAcemGFrGjShai2KBsxcyshf8j6PyjKLbXalhlQ1prr/hgiCvNzZFaW4g1jpOQviPuaO+v8rqW4huk1McCAu0Rj5Yraa+tRLooM+kJBGGPAcBvvWNrvuN/s9TgoWGZJXum7md3HqDPMNBLCoX6t62fgoCzSWjycAHnetyVr5Dwh9m7J89fF67HCtspIo2SIAddpB2CmFc6mM0hWhV/NEvpJg9fpLQ76c77IwS2rjKphknFAgaHCKQCsmL9CvG/+MvaDBIEUIHtdLtPE+fxp2vXFJsi/ZxpBZuJ201nzRFdO3WcnSfDxVH7yjdlBQ/IdSh4EYssTbWaAl1UNsklcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpqUjFKiK1Aqh68TRvb9+tr1IbfG89bWxVthJX3f/vw=;
 b=Zt2CVqZDej5B2kEaS7JSH9WTvKYmijBFR0TBxucgBZV+zbShC3ZLDIVwYYF1sLUgqVd9gWQbq2uQk8i5YemqvbBOVdOmoMnDhbRM3IWS7H9DlgCBWx24UUvNyRns2yik1umcjbnKd8FFEDKiz7dc72guySrcoL1xa3n4NLzOaVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b0a340a9-a10e-4256-9f38-c804767b0bfd@amd.com>
Date: Mon, 4 May 2026 08:50:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for
 SMC32 PSCI arguments
To: Mykola Kvach <xakep.amatop@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
 <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
 <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com>
 <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
 <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com>
 <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
 <CAGeoDV_0r8_-dB33G5U81+Q1yncgzgLgMF5Ar_rmVt5h8-rgZQ@mail.gmail.com>
 <CAGeoDV-FWcrCHnE92s6Y+gpoVqa6vJDzB63Z6uXtL2T6Jfr7xw@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV-FWcrCHnE92s6Y+gpoVqa6vJDzB63Z6uXtL2T6Jfr7xw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|MW6PR12MB9018:EE_
X-MS-Office365-Filtering-Correlation-Id: 958da7ae-83f7-4302-13a3-08dea9a967ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fcN8WGEL+cbm85dq80DHl8QVxsvPRZmCjIWkhFLshbZHzr/t1Wa4l5YszEjO8Eh9tcF/fZXrwFifaODVW7gr6tX4EKOtxyxCbXWgZfTor7XhPwrLZT3aCPuTrrjZgSL0ktfkRnSZUjZ84cQPiBz/rnsaDhLwSgbJpDsbcXhYbGAbkOYL2BdfvJUPLyLrlIEnLTnt79SXGb1FMsoCBnwABA/gXAWn54S0hZngy45jexnAGqWHPIx3Eh4MiJtYbhViMvdiZpGoE+1wwT/ZLzHTFlUMz8HM1onYPUuxjcRhGQ8AMTmt4nn6mNXDZ9qBom3GfOyDlshCePe/qiAeWOS640cgWip3lEIZvSpOMS0/+vYx0AYUv4g/7wn0lL46kSpVoL4gvFDnNfw8GpN6t2+lEbgHI2sh8KsA3GDWiDHF9XA34YY+c3+bgj8hqhn8vT2Q0XZkG7op2s0alhCN09akmh0iPkzD3kxV2Sjf3XfuLXj7Kn0Ejd/g8NNux0ELmiDcvSEcbxTibsnS0Tp0KtZHooxVG9TwHwqElVk+Q5FHydPGaAuwna/gmBL5EMwLSUAxCiLOcpVjJ9cQOcQ3HzJ6WhwU21Aa1cFsRh/iFcXgjzhfrd0yeS+FuLYedasjPmhJ2f+BQK1p61O3Lp98r5FoVlDlklKT6CJ9KxgjH9u5NHQTtt9Jl72hupouo2LasSCm0fSXNv55IYPBE7Wihn5mw/cgakIUAhs6r6Mjs+DdQmg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9YbTnO57pNUKr9fEwJZkFjQ6xtvlPMjdrE+nHHvIT9uedPa358n6B5suqnaVbBV9ea3WrONUGMD4BCbzVJZQ4+PL5UX8hqSZ2nkr9kN/63CSy5fR3xoxwby/h80AKN/q8LT0TX9B/MhRS056NEZtWlV07YVR3VDKVK2OIw0JbvhHSnEMIWhek8hjgmh7eK4ByMvI8DDn7yZTjRdfUr0SoQXuSXYjKl3MQXa6z6fFIQaAV3eFqYa+owkkFqlckUzvzc7XVAZ7vo3rdjXQWKbjuPF0mEiA0SEoLngetjDifB/CTTuayjeA+gwlQ19OzMdqCtNm4t2sO/ExH4eE10cFVDz6RAzf3KPLJtT1rEg/Sx7uLq5OWU8G3o3k9umowP4CVckCX4kXgWO4K4GpkMle7xfGe73FfHbFIco3WSLswJ6GJ85mp+xCHdvmLBzpWQiO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 06:50:18.5858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 958da7ae-83f7-4302-13a3-08dea9a967ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9018
X-purgate-ID: tlsNG-ef75cf/1777877428-14E57C48-02439D3C/0/0
X-purgate-type: clean
X-purgate-size: 306
X-Rspamd-Queue-Id: DD0E94B902E
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:Bertrand.Marquis@arm.com,m:jbeulich@suse.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,arm.com];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]



On 04-May-26 08:46, Mykola Kvach wrote:
> Hi all,
> 
> Gentle ping on this patch.
> 
> Bertrand has re-confirmed his Reviewed-by, and the previous discussion
> looks resolved from my side.
> 
> Could this be picked up if there are no remaining concerns?
Yes, I'll merge it soon.

~Michal


