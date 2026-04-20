Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dYJGDKq65mnh0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:45:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F6434F06
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288250.1568541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyIx-0001fR-AY; Mon, 20 Apr 2026 23:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288250.1568541; Mon, 20 Apr 2026 23:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEyIx-0001e5-68; Mon, 20 Apr 2026 23:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1288250;
 Mon, 20 Apr 2026 23:45:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEyIu-0001ch-TM
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:45:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEyIt-005HaB-SG
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:45:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6ba6b-e002-0a2a0a5209dd-0a2a4505b21a-20
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:45:23 +0200
Received: from [40.93.198.4]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6ba91-aaa8-0a2a45050019-285dc6044f9b-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:45:23 +0200
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by LV9PR12MB9808.namprd12.prod.outlook.com (2603:10b6:408:2e7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 23:45:18 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::c4) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:45:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 23:45:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 20 Apr
 2026 18:45:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Apr
 2026 18:45:17 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:45:17 -0500
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
 b=NMxVSICLyVvpKmHYdNIdqAN7oXYnLhNRVfejZs66rT6ZlZD5v8CyqWsIOt0wNUS923z7miwkHyh+D0a6E36KYhBwd3LdUkczKY4hi07GZ/8gqJO+VEHSKKMmZy5fX26BB5pAqsGbVACObttvpUVTZAvIevLAPZRmUg7uaQu01vzKIH5hKocHXuDTeAKRYsT8tIP330LQZq3mAHD9X3H0Nyh4GJCRpNnKTHBdEOYrGcUB0eDxDcfN6hi+X1dc9hZEi6n7nX4IFgWU2Z4pNsacIyggjKv4jTYpr8c3dIZGXsLzPis50uSAH0f4Av6dfeJ08VvG3GdWH0kNQAZfVUqFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JX+4GSi+gK9LZSigC1lXxl/fnCZsTJ+Y7VXPebjVX+A=;
 b=e31bICYR7mNf+aUo0Tj3Nh6HiAQFvl19XnrTsy9+1SoUZu16w5mGLeWSMfS45vFbk8ETrw2G91BI4lQxXlG6jh0xmo5a1vrmGoz3wt/3cIkp1dfCq3Q8CHa9epNk7PRApW0kGADh7GKnNrW94OAP9B+pNkKCq1UheqEGtmUeMfy1S7a15LXyHKQBgheanj+6d77AooAdhAB6mWvNxpo0kSvdpuflMrsJW2WOZDQ1+Y3rQmhxud4XJJmGLKcbqVnN5ItEWGmxLgPYuX2Xi1H/3YD/Xv60n49BFh3f4cHme4WENtw+ogu7YGctMXpPoMW6oaR5Q+swvm2q5qV3KNtFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JX+4GSi+gK9LZSigC1lXxl/fnCZsTJ+Y7VXPebjVX+A=;
 b=pmJoc8RcNnkEY4RTypWPQLtb6AXKU3NVnavl1UFIrL36SKIOaMlTeGgI/vA7lWiu253zPiVaKXasYY15H8y3+qKSOCbGQ8maKU7VQguwLxex5iJ0g9GXGuF0aW/QFbynXdnpzmiWtD317icf2Nk/NyunRVpMjhIfA5PINx0ndsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <76f82d46-9b47-475c-9fbb-732750332f56@amd.com>
Date: Mon, 20 Apr 2026 18:49:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] tools/xenstored: replace the fire_watches() exact
 parameter
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-7-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-7-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|LV9PR12MB9808:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c103238-ac0b-46d3-92cb-08de9f36e10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jFsKwGXd1wQ1ImP36fgyEIyV3k0SO1Xw6oLxjAnHtDW60n5Ep6OiiHWDvTz8NNSKNkD8uWXwiEvL+uaPJY3xq86H9PGDrvIK/yIwiakA4RFdLWV8i5XkVA1iPlLnC0de/BuZsaJeQna5U05UWKYOWxTstB7ZwBk06b1W8+F7g30PeS5sioMlENTpPIz4PNZLSM5k3PCMG/yf1t/f8simn8kRAbo3Zmdr6xtkA8z5XVV67wTWGzvB/7a1VC9/T1qgCMd4wEL0sKEiQCvYrvZjHxQXrTgrSUlR5O5lRSLQSFbx4QitAbyBu1mHi3VgiptrVMzOGoMZ+Pi0i3YrVO32ikIVoI/++IFx4ecI5g7U5MrE+4ksnBlwfKW4OYgCagKceVgDuhlXHSGiIWUQ+4uJw5s1El+4yblRwSpi4/eq6OlKHB3UCYHNX3vC3IH2PE44z6r3UWYXCIjmm835WakUhhLdEGfU3+g7EVSVaLDt15aSz/cQNZLVwYtDw9yPE6CP1ecM7lhE/CV9yZrs8JHSVdpiXsrbN+PzB6ODF7TWwe708QUBFLk/KN8UoPTxMrJwS4jwmtW3BZ+IzOfVtozWvVUSo9ucAoHRgO7+zsSmjMRnHPrDcMJqx0+LUMC7EG3HNxeBdFw5m2vgmabOs3enRpM1uANKXIdIdu+09dOGaKXnp8qZLoaBRcEuUcF7NtlTyrcWYgBoEydbJgS3cIkDJY+lVfxS/Qup/aw2kX2PkV8+bCKiHEdtx5cQ0cwTPxTa2YyerbpBGPtogbBtHXA49w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1x4jES18wa2EYrYsF4sBQt7lZG+rmP8BAc4cnDWV+INZHveCUoklNOaLQsC5kyAqg1n1Gz6BJoHRQ2oSHRg7uFgeu1HOyDHVd6hLQXxOCvmaVq+vuYh0npZt59Rdv9zRU2D6NrxAk7v88I5/HyIWyeV87BW/F33yjBhXqemNKwHiDxuo4j4cfhYOEa1uOiQFzgk4sgwr93h5SntDjxVK2Ar4F2JTusFYxSiHab7eY9pTh+aI5QavcLyZbxJCAZuGibQQvxcC3xMy3lWHPW40ab7TjWvPwEJvwDsxPXcwOQDQ2D5pm7IGfGZQz+GilDzGAipxjXrIUGyVINVveXR8Yf23OPrBvvN2u7s+YubZoo0++1NJRUcMJ3mz/7V16fanY5qcHRzukxvVXP/+ZjJZd7nkH305zaW0YZTyQEKmdU6wztNDBUjB4I9tCS789z0i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:45:18.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c103238-ac0b-46d3-92cb-08de9f36e10b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9808
X-purgate-ID: tlsNG-c201ff/1776728723-2A374443-BA623F4B/0/0
X-purgate-type: clean
X-purgate-size: 934
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 492F6434F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Today fire_watches() has the boolean "exact" parameter specifying how
> the matching of the modified node with registered watches is to be
> handled (only the exact node name is matching or all nodes being
> in the subtree beneath the watched node).
> 
> For the handling of <special-watch>/<domid> watch events 2 additional
> matching possibility needs to be added, as those events should only
> be delivered to clients having requested such events, either by
> watching <special-watch> with the depth=1 parameter, or by directly
> watching for <special-watch>/<domid>, while the traditional special
> watch events should NOT delivered to those watchers.
> 
> For this purpose rename the "exact" parameter to "match" and make it
> an enum with four possible values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

