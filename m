Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKgxKOx1AWr9ZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:23:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C3C508835
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305779.1577931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK34-0001yZ-Qe; Mon, 11 May 2026 06:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305779.1577931; Mon, 11 May 2026 06:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK34-0001wh-Nz; Mon, 11 May 2026 06:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1305779;
 Mon, 11 May 2026 06:23:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMK32-0001wZ-IU
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 06:23:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMK31-009WZV-Re
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:23:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0175cb-5cb7-0a2a0a5109dd-0a2a4503e620-32
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:23:23 +0200
Received: from [40.107.208.61]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0175d9-672d-0a2a45030019-286bd03d3964-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:23:23 +0200
Received: from MN0PR03CA0011.namprd03.prod.outlook.com (2603:10b6:208:52f::13)
 by BN7PPFABD533732.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6df) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 11 May
 2026 06:23:18 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::c6) by MN0PR03CA0011.outlook.office365.com
 (2603:10b6:208:52f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:23:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 06:23:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 01:23:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 01:23:16 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 01:23:15 -0500
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
 b=YOjdv3HxxGLUua1UWD8rnUw3EILEBCRplN4iaMijFoX4j8Y4vdI1MvyhtmM8s8KClsTW2ua+rfkL8La8Fp5UxfswItgxRFl3/uArg8RJcjS1FN2VnuTumWcq8CqaZUv5LtOoIJZ+NnOfZoWyeavsxvEq4WnIII7EIVK572BFJO2Y2onE4dLHg9c2SKAKed6huyXl5R4L3Db0I+lKFYVdXteFGhjYUofwav6XLjjkMeKFklq079iBzp8qzzk9rcWlo703bim46gmEupVkMMDoA8qe43CUWOhSJdqR0hyD7P+NhEqj6qGvTxUTd+YqTuPPlcVdUa5SBoMZd62yhTQ3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E2zqOU8stdp0eov5w5lPGGyrU6skZqTitwyf6EyazM=;
 b=q6mFxtQ2+L8ypWyJSAO+EcEZf9awcvw3pFGehOFeyXwd2ppfRAnir3/wPAyVgR8wdybVUieixaPu1nNwY5MuwwtXxqPnxNSuMZDaVO6YDI7tJXMALRgGc1pSzJUVZmRD2leqOV22EeaK9G2DqJwFmLIvPvzrFr8twbv4z5fXNjoxyMburr1lJKAHCLFB0K45rJSMmh8IjCZcSBXbX3HOBnYtUMykGrnW3EVgB7YjIDzbflX02JYTGFjlDAMoLPlY3T7eH9yTABbMBS1hrjT78G07Sz9DKBiNwvkPtNX25ONhTyI8AzKLdN+pgNXnvjMzG/Hc/xIJV9sl1y/apP3jHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9E2zqOU8stdp0eov5w5lPGGyrU6skZqTitwyf6EyazM=;
 b=KGYmVD/xn1PBuseTyAMkV8uXIDtaGkPuNK/l8zf1IsBsI/ZwFylYSNcZ7rc4LOT5nMdLUetATG2TcnKsirmm5QZ4yW3qclYroYh2KUH5EKZp5ZvJcfi6lIKDbECnbWRDRwulGUfFL3a3I7q8cEPepTgyhgTfDMDF69tAkRlX10Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <efe33c0b-82f2-4851-889d-b954b2169aaa@amd.com>
Date: Mon, 11 May 2026 08:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] CI: Refresh the Debian 12 arm64 container
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-4-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508212907.1643761-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|BN7PPFABD533732:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb89621-e260-4f2c-f0be-08deaf25ca91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	snGhAs1NIzWZQKrs+kuv11as/C5sxUTbh8YWkcssBV0FdtuqyZiqLTmLOtyBpo2tNMVMRGVynTOT2ssSeZkWZOh6nPsmzHjpgC/4rpCOaSgysp1RR/E+DB4HfrvHrXpFwcSWLEMKeLVVCGk2K6+s0uLm2HjNJUYK5Ojxht5bws16UO1agLFNVmsXhNd/Zstzji1ocglX6Y30bUPKjoq7gNXokREq33mYOn3ECb/VnubG5GV4unmzRd0iOfWOMubY9Ra9eDGece5NSTOgoZ4YsifTTrXnjMv8VBwJldwAgc5eS2IQjEo3tiV+jPoPZ4IztIfW9HzLdANlWx3yvpNdy2+WkeGNb1rngkuu6qaW536VO7H8DZzkZrR/55NmpRChAfBwi+Pa6Xsc+qtZ3mKydiEbq/Xiy3SD0b8+wfovf/zqrogldx4hyg/h6lurNJFU2pWzyiZoH+Owb6fuVEuFgzbtT8beMpZ6S7QFVgYy8Y91UvU8baIlKrpOR+eM/fU83tkciwwtAeKH4Vaqhp1ZStXtpvp1x4/gI1Y1VVuz+o48fxIgbDJaVa2/FMAVug7HClG26HGMxTpu+goU8Vv+m6LcQfg/QLc0WmVqALZqpnV6R5LhVjOGXSWFxMtFKnDBMAQiClriwiiLymb6dDk1cQhkpR6YjimFsebRjwrZcmmkc5n+EpumubAxpvLFgip9ifvRmuKnIpWqILO7Q+24yWByoEsQcRdHhp2YTXIGn6I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QyIkAxWO9gXLOjkyKCkHKMq5ldkNVKefUdOFpaMpMkmG9ZbIo6rSCQlhkn11GEpHDji/OSUeNFcVuHcDcoZ/j1+Lt4mp5laUM/iK2nO9PqBZWqzJwIrlBCrZQBlzLgHJ44ch0RcGyv15xy0G7sGYT8Qy8tiZnUT5qiQkmwQtPS3z+Z9kzgFJHvNgSQFYipzVcRElwQgrW6sk9TlYD78gJgq/JuCgLUJ1iks+jBEdCKYyvy1QzyI5wz23N8DpeLgMV22dWRfB0kCr7a2/H+MHsdp/STAl5rB0VN2i68gG66eBJHDSxh9N8D9ezy9YoybP/qg35NimlAzFHj8xuE9gQ0aDx/NQu98/EXUYN+VDjLamBYkEk9zJ7gMoDRLrObVD5tgpC2f+cPLiLp5xesRAsX+P8f+wgUimi0vp4nJpNDt0NsJDwhpWLaT4uWn5PZ96
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:23:18.0046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb89621-e260-4f2c-f0be-08deaf25ca91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFABD533732
X-purgate-ID: tlsNG-33051d/1778480603-4279C938-8FA99089/0/0
X-purgate-type: clean
X-purgate-size: 1030
X-Rspamd-Queue-Id: 13C3C508835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim,citrix.com:email,cloud.com:email]
X-Rspamd-Action: no action



On 08-May-26 23:29, Andrew Cooper wrote:
> From: Javi Merino <javi.merino@cloud.com>
> 
> Rework the container to user heredocs for readability, derive from
> bookworm-slim and use apt-get --no-install-recommends to keep the size down.
> 
> Additionally:
> 
>  * Make it a non-root container.
>  * Drop libext2fs-dev which is an x86-only dependency.
>  * Add libncurses5-dev for xentop and zlib1g-dev which was missing from the
>    libxenguest decompressors.
>  * As there's no ninja, the container can no loger build QEMU so drop
>    libglib2.0-dev and libpixman-1-dev too.
>  * Swap libyajl-dev for libjson-c-dev given the latters deprecation.
> 
> Rename the job to debian-12-arm64-* to follow the naming scheme of all the
> other CI jobs.
> 
> This reduces the size of the debian:12-arm64v8 from 2.25GB down to 1.62GB.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


