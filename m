Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL7lJ4s+2GlqaQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:04:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078B83D0B3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278203.1563134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzLM-0004tM-L1; Fri, 10 Apr 2026 00:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278203.1563134; Fri, 10 Apr 2026 00:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAzLM-0004rd-Hl; Fri, 10 Apr 2026 00:03:28 +0000
Received: by outflank-mailman (input) for mailman id 1278203;
 Fri, 10 Apr 2026 00:03:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1wAzLK-0004rX-BD
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 00:03:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAzLJ-002neG-Iz
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 02:03:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 69d83de2-e002-0a2a0a5209dd-0a2a4507d0ba-42
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:03:25 +0200
Received: from [40.93.196.13]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <stefano.stabellini@amd.com>)
 id 69d83e4b-ba2d-0a2a45070019-285dc40d6d55-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:03:24 +0200
Received: from PH8PR02CA0038.namprd02.prod.outlook.com (2603:10b6:510:2da::10)
 by LV8PR12MB9417.namprd12.prod.outlook.com (2603:10b6:408:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 00:03:14 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:510:2da:cafe::30) by PH8PR02CA0038.outlook.office365.com
 (2603:10b6:510:2da::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Fri,
 10 Apr 2026 00:03:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 00:03:13 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 19:03:13 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 17:03:13 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 9 Apr 2026 19:03:12 -0500
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
 b=NWEK8+iV5i/Yan2TRwdFe7PDRtU1Q1yfRJEtcK3OM7xoCehFz61QOeiK0PeSFbZ6iM1UrYnrBK903m28CxC3NO5gqo4+uWzZbpJ4XDsg2LzICzRH0hHyw2rQbf02yUy3nq0qlthy8e3wWXJSg/NMhcxZux719HWTlqc5XWdMPPTe9bsPiGs5TeBnU6wE6QQGEOB2J/NvGE1kSRRhX1iRRZS4i7DAQsv+5PQJeeuoFAsntdJrY8fEMLVZ5LDb0WYdcchIpNMl9wBn4SEUcHrcfbpHu2GTT4FizIyP9FI3ag1JpEMlLixMaFQdBfXdhD31a/ZZqDM6qlm8oJL6BRNpHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgVP21WMuoqGG7UmabFPMkYWI2cIV4Qy5UVoD6ilV7E=;
 b=RAIXB+6Ux0JwK+ZTqv305TJwR92vmSvUSadUB2bDRe2v0xR4YsqPNsE9L519tdkYF/UcBUn14J/M2mxmsONHa5KkK3OpmFRo9U3iSUXg9NCEVEf2E/y1shr7778IH03s0ZMEkIw0JCscL5GDpnXJ9LFV/zAqZZRj89MW9k8jdCcJVEGcXraQPJZ3MGQjIoWiaW0JEYVa3wIF+if+kyhKv0VyRC4bfXQdzOcabHTaf23LOHyJKzvUOWQdezPltWPixJuD/1vUley4n0zxhFn4UaTF0Hp4Po46C9SxrR6/ekyoyu08aZT4zXQKPK3JyKUu3o7jWWqEfWcNMCt+2zJd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgVP21WMuoqGG7UmabFPMkYWI2cIV4Qy5UVoD6ilV7E=;
 b=zKPJpZglBg+U/NEXO/vtLtUSDOjH3/BWF6sTEpXlGOJ4Hv1elIEpgYrGcXDQtvhVzZjMqsUGrWk4j38geX2LWLlxhc0VFZ2W4NB83oDkCZotPD+8pgD+EeaDsrLoCrDTEaGlDiSz2/8HRGHRJHuk3YLeLMpqFjJjQDn5GflN3Bc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Date: Thu, 9 Apr 2026 17:03:11 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Fix off-by-one in iomem_deny_access()
 calls
In-Reply-To: <1D67F18E-0A2E-4A58-8FD7-FC5FD6BE2C6B@arm.com>
Message-ID: <alpine.DEB.2.22.394.2604091703060.2873990@ubuntu-linux-20-04-desktop>
References: <20260409113934.197619-1-michal.orzel@amd.com> <20260409113934.197619-2-michal.orzel@amd.com> <1D67F18E-0A2E-4A58-8FD7-FC5FD6BE2C6B@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|LV8PR12MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e2c3a1-95b7-4566-1bdb-08de96948f36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CfRL5t3il86yljT5a4B/cy5WJmV892htj8Pr+sYOBoE5O2c3Of2E/FTPofk1R9MGMBWHhFtyht5xveXBtWvFdouJLPvlWXcBeiPe0gOd3sbflGjPUhNgsV/3+kebK0NCqta2IuIEUBQ6SFlBgs8GfqTwOkKCIP81qtNrmnrWrMIv482JNYQCxiXLJV+VfGMVq3BAYQamyEOkkE/KrOD2IC+JL5JyIBBgjSDEm3n4G1KToaksUkv01y+gEBPXkyg4e25+TCpH6wvRphwBNoEym7rBlA7Ja4+83eRktzUKm+y2HWwRIuBhfdlyRtSy269y35mvc/nZYkB6dZDeI64fLcW7dPu3swCP2O89w8aNKNOnIvRl+70HFTecAwy3EY3QmkhOeAHGLgJM6GPVJiDvKPBWUW3SRcAAKn4ovb+S9bp2SstuTbh/ADz7uy5p4F5zjnZG84pzWtMIjON5LSce/Fpii0YiRiw2eJetb1bNAn0UiuQc8FIKH46rfoy6MbdTVUpu4Aw/mJBj50ujKLBcG9px1QqDxGUpCnnEY+e7L9RaBwlohY0BVxGjF2vEaCDVgUFKOJtz8pJiZnB28SD6gJ5h3+ZEQJIB5xw9gg5mrCe0uGk7mwCsF3GoRbgTHCilnW+6vRZ4irt6xpNFtdU5VaxYyEFQTek0sC5i6gb3y82+XZ9Zl882jVLzXEH+oIlYqNcsGBEQs7mTafEE1tQZHV6e1aAnjq693G/ATpF8VXf2jphxvKcgbzP64U1Ungj/vff9akwfn2Su7WcU7QEJxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rOTEABFCQW0nzeOqlSDR/Y/Y0tsD04FBtfq5lI9a5nc99oJH484mn0Caul063w2VA2Cwk3XgQVa8S8bmEOq1ekGcMVrPbLyv6G3i+OweZ8Qr9/epOR0E34nBvncGN4fMfjsA0r8GU3sVdNn3bdNU76qRfhxi9vv45HsheanstIxM7ZjeG2BdgWWwNcT5p7reimVKbcaY3Va/Y1485EKZHGSVW7DSipUUvx7Fra4UDZozBRdcnv3TFTyim6JAdZFPCQoqdCt61q184dqrKdJGx0DDGJ2qky8JeX9du3JJN6r94VOd81FoXk1J+ngi2VONsBnMILotJRWzt/PJaOvbF9/xbF/vHQp4q0KgJvW1m+D9LoUW+HXdKBYjvJRZE+XEMsXUKbhiQsH6Oj9TmLdIqDRPcP4rs60vpc6pZACKt/I0N2t0BSY/B6z0HX6p+jlY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 00:03:13.4326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e2c3a1-95b7-4566-1bdb-08de96948f36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9417
X-purgate-ID: tlsNG-ef75cf/1775779405-88F5E41E-077C80BF/0/0
X-purgate-type: clean
X-purgate-size: 1113
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,arm.com:email]
X-Rspamd-Queue-Id: 078B83D0B3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026, Luca Fancellu wrote:
> Hi Michal,
> 
> > On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
> > 
> > iomem_deny_access() wraps rangeset_remove_range() which takes inclusive
> > endpoints.  All call sites in the GIC and ACPI code pass 'mfn + nr' (or
> > 'mfn + 1' for single-page regions) as the end parameter, which causes
> > one extra page beyond each region to be denied.
> > 
> > For single-page regions, use 'mfn' as the end (denying exactly one page).
> > For all multi-page regions, use 'mfn + nr - 1'.
> > 
> > This matches the correct pattern used elsewhere, e.g. in device.c.
> > 
> > Fixes: 8300b3377e ("arm/gic: Add a new callback to deny Dom0 access to GIC regions")
> > Fixes: 66158be465 ("ARM: ITS: Deny hardware domain access to ITS")
> > Fixes: 97e9875646 ("arm/acpi: Permit MMIO access of Xen unused devices for Dom0")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > 
> 
> This looks ok to me.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>

