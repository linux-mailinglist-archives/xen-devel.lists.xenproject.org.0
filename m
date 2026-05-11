Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDEJHqN0AWr9ZwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:18:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B2508748
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305758.1577913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMJww-0008E1-V2; Mon, 11 May 2026 06:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305758.1577913; Mon, 11 May 2026 06:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMJww-0008Ax-N6; Mon, 11 May 2026 06:17:06 +0000
Received: by outflank-mailman (input) for mailman id 1305758;
 Mon, 11 May 2026 06:17:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wMJwv-0008Ar-Gy
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 06:17:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMJwu-004sn7-Fn
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:17:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a017458-e002-0a2a0a5209dd-0a2a45038aec-24
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:17:03 +0200
Received: from [52.101.48.62]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01745e-672d-0a2a45030019-3465303e43a2-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:17:03 +0200
Received: from BN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:408:e6::22)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::993) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 06:16:57 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:e6:cafe::76) by BN0PR03CA0017.outlook.office365.com
 (2603:10b6:408:e6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 06:16:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 06:16:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 01:16:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 01:16:56 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 01:16:55 -0500
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
 b=TGPB9o+nUFjsuTGvX5kL9wnB7bVn4FyEncTmTmQ5LqTQw1dSjX88Jm4SVI4v9eRR9dYgDJ9J185I0wDvQ2RGlZWEjH0tV+WyJAghVuXLIkzw7JKd81hSe57bNv57TVF7HgEavZic1eDybJPC0PS8aJgNrJl5S8v5yHTHM5HtKqwkmsNcXAvoXoUssQqnmwokxngKJl2MhpRRG+ApJagCZmgFTvEeGy8ASofzl3r+ptjGFmAcuFUCRlb6V8jtxgxSnRW48/ntiOI4BjnHPC4MQMhR094WcFTS9uojFSUgAzih7egAdUmOmQ4X/+Q2t1s9zcyKP11qqrqFugHOWovuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xB6YnHqIy3x5v/O1+TImmWizAfouAcAAeyLqOsoTeRM=;
 b=C19g/grNSg3q9r49IQyDpTKOYQdKIsQU8NXmz/LIPPAhgcsyrFSWEzGbbOKU5lWKNc0buSr5BaoizrRaU0hx1Wib6pjPdqgfDc6NtjqFgacrRjqHMAV5VYpHAkT43n27DKoryO0rE/EgHB+TQnD+FhsJt6lew3yZKWDEu1waseX0PuNcvvYTEvGMYmMQAfxs8aiAzuQaS4bfVo6NpsSAgt+k+WzL13TQ0OD4aKHfZK1NY9J2HMUdxjg9iFayEZWhThSeK0fYbx7YHl3HGkID+F+wKTMjvt08ZqoNn9c4i4AheOKGneaI1JpIbejgrK0wcqlUnMu/j/eQdbWmBvFTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xB6YnHqIy3x5v/O1+TImmWizAfouAcAAeyLqOsoTeRM=;
 b=isxZbv/GyWaHEWs+gAURr1lRvFOpMy4iTvYP+7x0YDEGNyrWNuCMTSuG5SK/m8X8D7kIR6z+Rk7qeW2lP2g508XC1ixVs+xBcgZOZEIsWZTILMT2b2lsP53RJVRJmLUpq8zJ9p1gmd0RipDszthkblfq/Qnet9pMevsP/INaPxE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a7932bc7-86ad-401c-b462-01078e6e11bb@amd.com>
Date: Mon, 11 May 2026 08:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] CI: Adjust test needs[] to ensure binaries/ is
 non-root
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-2-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508212907.1643761-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b3daa51-a50f-438a-1005-08deaf24e7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	h57W9QwEx3I8NHIYajgaXLFlK1rOUbCi9/7Eakyn+TiO8DOVQLpaxUCTxgvEDqvB00SIpL4VuzMVA5f9mvBgBeMbxdVKJjvV1yn7F8sk8w8TV9MoS/dfFGuwv+UaRdR1Oks64K2E4N1S9IuWc4PdUFmOwZBjC8zgPKMLv658WOyrRWZPRoUnfo/cDTaYrxOcrVyXhaxuUYFaBeWPjmysY+6BQusfvOEiQ6YerFjriPlqJ/XeXIhlfDx51WtIF3NSseGpN1NmvSJQbG57vPfKAn1Yp0FS/h45zPGhaxJKDNMwr4EDpzLCntlYOlxsoyKwZ9vvZ0b7HXiMHMrX7VK450Kd/pnNAY0FQ3gzZ4sHyxIHJMgxRzq1ViSiaoHK4hoa2MSzP1ZlgYrGD4KKoQUqI8Lqmt6IUy6q1j83V3ZGNnRy85RCCJ7CQNEGGtSY/AO2onXR3wsFMYk0dZkh4D6R5qcvXbUtUvJB5KyavcItc3GqoO+zM65pQhhal6X/U1V3WAzdUmJ0DDGspietJP1o9Ybd1aNFDPX3VTyImn9N/OUdO66d60cJnuHEE0nZvUf5yGkpO2f91+xUCB0/rP7xAs3ylhXHiuR3xfjr4BhfuX5QllfVv5qJT0DTkM8r8jCb3r0YhewfpCqi4wSgncm37cQ8TWp84VytEllp5y3pDmT7StY/E7tJ9ErfaZIYcQdHOOB5pmgv/X4K9KcHhmSt7EjV35J64qgiknCF1YFj6vQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PzD+cxI9Vgws0aogubZQWwvV+NhUTySfMr8pNfvcqPcLS37QXpIr/D+qjwaG3Fhh/3D6raN2+NeH8BXKXK741IbyE//pj2tuA81tRzSUtpqexjnXFHLcPgq9N+MFRcr5WixLZn6qcjEpGIsA7mwR3HajTM4oQlzUT3ZeaoNnLizQ3VL7nwbvSLkh2olbcdAOzwTmwpnRdYEIlrWM9R6GHbhNwyBzsETUM9Ih0LqqftB2+kcRYGkbUhy6x4T4y0UyyZMKyNrhw/kooh9iPkyAJ3kRzi4innXqX86DhECaoGrqIKuQQEcqAve9h867fx9T0fHUal+Dbx2lEzyyG60c/J90wnyP1AtIIIxBZ8J59o6wpl7WevBF1XI1Bz0G21PnS9DhpumO48XrDZmPRibfUCw4zdJL8phZFYk8bIa0P/ufQsuNjuJsipblf1Ufz8Nq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:16:57.3853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b3daa51-a50f-438a-1005-08deaf24e7b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
X-purgate-ID: tlsNG-33051d/1778480223-38B74938-F545CCBE/0/0
X-purgate-type: clean
X-purgate-size: 3134
X-Rspamd-Queue-Id: C74B2508748
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,cardoe.com:email]
X-Rspamd-Action: no action



On 08-May-26 23:29, Andrew Cooper wrote:
> The binaries/ directory is a composition from the artefacts, and also used as
> a working directory for most of the tests.  If the very first artefact is from
> a root container, then the test must also be a root container to use it as a
> working directory.
> 
> For arm64, the existing linux-arm64 artefact suffices.  For arm32, pull in the
> microcode-x86 artefact as it's the smallest available.  This bodge can be
> removed when all build containers have become non-root.
> 
> For the qemu-xtf-dom0less-arm64-*-xen-version jobs, use *arm64-test-needs
> ahead of alpine-3.18-gcc-* (as it's a root container), and to deduplicate
> the *-export dependency.
> 
> This will allow us to change containers to being non-root one at a time,
> rather than all in one go.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> 
> We should also stop using binaries/ as a working directory for the tests, but
> that gets very complicated very quickly and I don't have time to do it at this
> juncture.
> ---
>  automation/gitlab-ci/test.yaml | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 8770c523e228..517af1732437 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -15,6 +15,12 @@
>    - qemu-system-aarch64-6.0.0-arm64-export
>  
>  .arm32-test-needs: &arm32-test-needs
> +  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
> +  # from a non-root container, and microcode-x86 is the smallest.  Remove when
> +  # all build containers have become non-root.
> +  - project: $ARTIFACTS_REPO
> +    job: microcode-x86
> +    ref: $ARTIFACTS_BRANCH
I don't see it being removed in this series even though the containers are non-root.

>    - qemu-system-aarch64-6.0.0-arm32-export
>  
>  .x86-64-test-needs: &x86-64-test-needs
> @@ -569,16 +575,16 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
>    script:
>      - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
This also pulls in Linux image and rootfs which XTF tests don't need. I think
it's much better for a test to list the actual list of its dependencies.
Otherwise you are asking user/developer to dig into the yaml.

~Michal

>      - alpine-3.18-gcc-arm64
> -    - qemu-system-aarch64-6.0.0-arm64-export
>  
>  qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
>    extends: .qemu-arm64
>    script:
>      - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
>    needs:
> +    - *arm64-test-needs
>      - alpine-3.18-gcc-debug-arm64
> -    - qemu-system-aarch64-6.0.0-arm64-export
>  
>  qemu-smoke-dom0-arm32-gcc:
>    extends: .qemu-arm32


