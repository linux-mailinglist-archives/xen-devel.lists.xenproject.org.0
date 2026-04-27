Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePajFZss72mb8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:30:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7A346FEF6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 11:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294753.1571453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIHr-00028Q-AF; Mon, 27 Apr 2026 09:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294753.1571453; Mon, 27 Apr 2026 09:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHIHr-00026Q-5R; Mon, 27 Apr 2026 09:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1294753;
 Mon, 27 Apr 2026 09:29:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wHIHp-00026I-2p
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 09:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHIHo-004g9j-FV
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 11:29:52 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef2c85-bab6-0a2a0a5309dd-0a2a450597ec-34
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:29:52 +0200
Received: from [40.93.196.66]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ef2c8e-aaa8-0a2a45050019-285dc442c4bb-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 11:29:51 +0200
Received: from PH7PR10CA0017.namprd10.prod.outlook.com (2603:10b6:510:23d::10)
 by CH3PR12MB9218.namprd12.prod.outlook.com (2603:10b6:610:19f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 09:29:44 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::b9) by PH7PR10CA0017.outlook.office365.com
 (2603:10b6:510:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 09:29:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 09:29:44 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 27 Apr
 2026 04:29:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Apr 2026 04:29:42 -0500
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
 b=ERFeo0BiUTzwTXP3UXlTnqv6n1McIMvYhmRlYuJpNaGAyXnAs1spsceDKKr1QUtXhnU27u/oEpo1KrMZRfCmrh/6H9JfTx+4Oi+8olGrHe2FDZxQuHgmwGtK1tSOT7f44KZ3+sczwDn0y32sU6gEerGqjqUP2q2mYEELQPgeHhwu8VnWvnzBHQqU8TbnSBtUFWOKgpKLnotYmKrcEUuc8zTWMeE4uGD8ed7fCQsm2jUXTw/feXpKktMJ3jqY2xszqNo3gEa+5vJff9JinEExvuNT8/G/6JN45Zlz9QMQWVUBbv5PuSXlhi49irSFtP9MlyOI2LAH1p1VRzbCCOa8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDg9CJhuPiqxLjSHwdb9K9pncKzpK44pSkYsiPh/VmY=;
 b=u6aWXzDJUxX4oxUXPn3XtbjN0OJc2oZ5tE7YO6vIjk+lxFWWbMrInpyNfPCSqV98Vzm54MjvIdsTCyUEUklMFyAudfpkBeUVJ1rQS/UNrGU1iVR72XH5zwoNPOlOFhAumukFicBuZ84dR2bBQCqZMqWs1pphrIMAQm+tvn7DVWnh/1wf64SGfREobfy/9UJZKwQJSD8+CQacXczaAZ8cUe71O9ynSYT+fsLW2RSV83Ox4l5SMeynyTYeO+lw9Hok6EtZCq4Pam+AFxtsz6LZ+m/UdJelG/upuh4s3tqGRwQY14nfUYTBApLM9IhBJkewR/Uu8bWAAozuH+WAaQnCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDg9CJhuPiqxLjSHwdb9K9pncKzpK44pSkYsiPh/VmY=;
 b=NvCttFFEl4oDXNw/ezCLTBC02XpD+zNpdGkbycdRUVd1a6BSLeF6Dpb1uSvt4YzSkZQ6niqqrs3ud4bRbECi38osxHS41qrbZQ8IXUpJcLgnbcygJr9mH+tlXn0ETJoOVblU5VUw8asy8DmY5xHWyajzKA9RfkeN0EGlCdQqIso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <728169ed-693b-4abc-bfb7-3dfc7b239e86@amd.com>
Date: Mon, 27 Apr 2026 11:29:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm/gicv3: Decode cacheability fields before comparing
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
References: <5da34f44edab55c50163addc6b52c680ea1ce2f7.1777278902.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5da34f44edab55c50163addc6b52c680ea1ce2f7.1777278902.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|CH3PR12MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dad48f-4153-4309-cc09-08dea43f8435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m2mXetUK7cN5q+s0XpYSkbSU6iMR8RCVtAAdu7hX/c3IXF9wLFfDvF9+BUrBn2leZDZ1EKPU+CWaU+OO/xs5p/7HUNPESQvCPwA8xJ0sNnGK5TepntGQTKLmmtbrVp0RogFrD6qFs7aQE9FyMBwK3J41RUVtz3YRgUUCjFxJCumQdZDL25gINJhgqPwkHhL9+gGATUCGlLc5TMIQXy00260NTMMA0SW14lTwHSprAaMMuDzjTyBIIJu/5mkGb4dMJ3vt0jHFHQylsJSBTTlWmDpFjc32c3/h3AjY+t2A0l65iD/EsY/C1wZTpwqihr2mlrRCzhsKW7bW3Q2p+sCUsVBIpbjAc68WJUGkYBINBp5Pdy4lpbiXFp2m61Z2bRDX0jejQ+ReaNpnR77sYM/SqXfKOMEyjOUTGeT13y7ZVVtSZXL2ObXzoXmUd8Mos59PTo0UcC67ieBLbgHlfhcbuVz33Br4x+YZoKNpjFm+l9dOXc7Tp81rJocrZ+w40tt4O6IpAMnD8auFtoFUlMqTVQhpzFZIIOQZUHcbxD2m4YkkIc8pFx5q4ltZlpdFAgXW+NnvENtWwvBPcpkYesgC6r0k5pNPKGj1zTntblmKABLtQq6NsFBb7X6G228wNpHV0R30KI76cOcb2ByBRtjwAdHS6BDt/RBkAZRYCMNU9qsd7KnE5t1bg7csnMSU+MUBFki7jr1pG9lETbhKm3ugJvH8Jj85AkSjLVynMymDUB4bm/RRKoERxQN1uY/o4BObFLtyGx7QnPBK2gJ2oM9icw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q/dwaMsFK09PxRs7GbW+gn8N42PRGKxurBHLFI01noiowJbgOmCobtarcKauhu3fVG/prjAGT/q34sbUaynMwxRfjxPcJ1/bNX2fiYGvQ5GEqZ0YXIrsG8uv0WKyIlCkqUWTVrSMkFTzg3QSHySr3/cLnN2g84Iub4SuKWgHfbsY1d6t9EHxVfid7q+6ZEU/IWHCOy8FhsfmfCyjYAftMROvHnjwuZ+s69IrVfSAXZ65XeOeK1AXSB2UhUXDFsIJncvKI12nlVio7QY07gzqWycSxEvKJlwQ5AnAt/Fo+cN7CAm69omxIqVQtf/iDcAheFPfm7ifdMec0DEE36BHMcwbAru6ChSsQ8FC9VJPO2xnpFG1WR5JIa6oCugqZOldq2HY4fpVGmist1njZIbffxlHPSDDrnhHweeL6ID5w7EG+JtoKm4RGy2E0TlLFPkd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 09:29:44.0311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dad48f-4153-4309-cc09-08dea43f8435
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9218
X-purgate-ID: tlsNG-c201ff/1777282192-E13A0443-DC5A69E3/0/0
X-purgate-type: clean
X-purgate-size: 905
X-Rspamd-Queue-Id: BA7A346FEF6
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:mykyta_poturai@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]



On 27-Apr-26 10:37 AM, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> GITS_BASER_INNER_CACHEABILITY_MASK and
> GICR_PROPBASER_INNER_CACHEABILITY_MASK are shifted masks. Comparing the
> masked but unshifted values against GIC_BASER_CACHE_nC, which is an
> unshifted enum value, leads to incorrect detection of non-cacheable
> GITS_BASER tables and GICR_PROPBASER mappings.
> 
> Use MASK_EXTR() to decode these cacheability fields before comparing
> against GIC_BASER_CACHE_nC, so the backing memory is flushed when
> required.
> 
> Fixes: 05238012b86d ("ARM: GICv3 ITS: allocate device and collection table")
> Fixes: c9b939863c89 ("ARM: GICv3: allocate LPI pending and property table")
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


