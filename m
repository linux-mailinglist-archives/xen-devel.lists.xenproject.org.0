Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AWKOk93AWpGaQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:29:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D6508886
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 08:29:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305788.1577940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK8l-0002kK-DP; Mon, 11 May 2026 06:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305788.1577940; Mon, 11 May 2026 06:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMK8l-0002i5-AG; Mon, 11 May 2026 06:29:19 +0000
Received: by outflank-mailman (input) for mailman id 1305788;
 Mon, 11 May 2026 06:29:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMK8j-0002hz-T6
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 06:29:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMK8i-001pmJ-Rd
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 08:29:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a017732-e002-0a2a0a5209dd-0a2a4502a242-34
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:29:16 +0200
Received: from [52.101.48.67]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a01773a-af86-0a2a45020019-346530432b0e-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 08:29:16 +0200
Received: from PH7PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:33d::13)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:29:10 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::f3) by PH7PR02CA0007.outlook.office365.com
 (2603:10b6:510:33d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:29:09 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 06:29:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 01:29:08 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 11 May 2026 01:29:07 -0500
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
 b=psaiCp/48bMH4h8ZGHjXvpWF6KkN0vP9TwMfQZqwQZLEsR62fkHoJoENAd2oU7OmZ3pQAANf/LjhLSI+LY9scS9iFGOg8DVd+/uEdlVUIuN+wSM48zSBcelWQ/goWKdYY4w1Yi1u9qXg65LblTc9mp1AsgsNkgfz+TQcCbb8XAS/w+GlkX0eGlyNbdcFBeREeyhvGxrY5XtIzyYZaGK/4b+kSJb1P4a738cEqrWMOzjaS9mlpMai+/O+3zqupqvDq93jFZwoDatCaPEQgeyCc9ybWjeyZwyCaviO0LgPAYvUFI82/n0WwBxCsHY5bvvoCuWAfXoa4YVW+0sxD1RUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VymbfYdHQ47IFVLcQeL9KdeyJQUl9975L80LJGBG6ro=;
 b=CJFlHXFszcp1Wp0PiI/0lVRMMCa46c4HjyRO+BkdJLgmY/xLpUGT3+Tb9MiRCPlXuvsSBCHtFubqpp7IoB8BgRwx9bHMwDZKqUlfg4Taxm9yzCcIzkcoIiO3GjTHl2612V2Ak4JG119CUcI4WRsD7nO/+X9egqHYPdzrfXMziwzIIh/kWKWjmziOawKjctIR8Rpc0+5ft0aJIXodOIoWKnMzCH7VpQYjinaDhqX+5YViow3bIkFX65x5RWOQtJeKtGFaruIQF5KF7/Wac6Wfp76A/Qi3nJsPp3Qge4qvM/PpeI1aSU4Xu2bMKIRTxnB6kt/JTVqkJ0kMhWxf9KymMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VymbfYdHQ47IFVLcQeL9KdeyJQUl9975L80LJGBG6ro=;
 b=GhVWroHuRUoDXEFPN8F8Rmz0DMZMLBJ4YI5mGgkGyObPtKsN3leyWzO1FBq99wEyOaqy0mPc3AG2Gt60K/M7sXa9JI9/yiGgux4xnWx/nT2jMMdYRPX3Jy2llBaH4AqCDAmAdPwVRqmPMFdcX4VnI+Pus5JQWMQ8wyz7bee9pj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <249ca124-b144-4c50-a0fb-3c0e6db5a1ca@amd.com>
Date: Mon, 11 May 2026 08:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] CI: Add a Debian 13 (Trixie) arm64 container
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
 <20260508212907.1643761-5-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260508212907.1643761-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f5967f-4a23-4354-d775-08deaf269c3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/sB6nWLGXu02VmR2bhwo2R8erEcZ0a7iYeDJIgA0UikYP1lY2ZEsZz10MyoqYKKvIqAJowcai2ukeSMAEt0qdCFwXXmvmrnboIbi4duX6yhbx7F+V5vB5zmqQLzTv07qNhDtqBg2T4eH+Rw44qE4z7vplNCXqP684lH8mCvpbf3iXpsuirVJz8bG9f3XobDh7+EgwGZu6+xrCH8UkyPhcFJT82+dmfxShDgRHttAXZ3JjZeNUvuhEs8HAeEMzzpPeOJTCen4t3x1jmY60OimDDEDqCu9fNZwYADzEGdak4tkaLOLXcwe/MmrItXTc0LFuQvERPoO1IZbjCQz/eUBrMq9FWi1WcqIT74TgoJpDlCkBPzrXwcxMQDNlPxdaBKSjHuo60jiQft09Agzf6MU8Ey+RmcZD6/OkITKtsKkwEPptmqcoMgLZzaN8XrOY8UU0Mrjtox5leyCI8UypV/kelooCsXqLfV3LcTCJR7AaMJkwgWwVCb1FcJDHeg3UniPHtnMlDLsUDitst1oXSRHcny9Lxv+XeFSfh06/mTvHvJe61CVsrIft6fxkIoHr96Ehzzh71yG11TaRhJophiG18ApKsHE1Q9iTAdE1OXTTZi1kA2BI7iFmRmBIuRwrx83Bwjabem21nj1Fu7wc6UXeCFwJeup+TyJlQybowMGLOe5k5JM74P5Fa/+Jf2UaKVMfmz9nQVR3xvyvKRgfYq+1MtHvXf3LNjqiTVys9JSzNs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zCpjqdGGJUEu4icy4WvLx0ZK09CB6WBsMeGTeh5WXIw3zZZHa/PivVXMkpQOstvK8ZgmS4O3cxA8Yit+SUV4VjUBjfImYIC8NLt5xTrLf0NCdK4iaBiPYrKKPG86d8T5ts7+BrAg+0ayMjmAvsmty2Z2W8e5T/QtDTlS/kPVZ7IJEK4+xPB+gVE6VJHv4aR6UNa1Dqdv57g58jsoPbrQsKZB7/KtibJyRKjGNXGpCRdRD9Ws2uoAxJZQQA4RRredBX3GqP5TwanF4oj7MaaX4YTOleRNMTTqoFVLWd8FjymEurlhQBRs3VTNEx3l8XcgvIPZARxraxSYomxCdDg+iE3lJAnLXvb9zXTs3x6iBCLKTr0KjwcjXjLipOG7RGPYUKOBep5/IOB1trYPDjGwVzt/j+AFgYSMmu5Hqq2SQIpl5x4z2ea61d93Eei4Mjrk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:29:09.7036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f5967f-4a23-4354-d775-08deaf269c3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
X-purgate-ID: tlsNG-720697/1778480956-A9971161-D022E69A/10/63158204843
X-purgate-type: spam
X-purgate-size: 4664
X-Rspamd-Queue-Id: 5B1D6508886
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
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim,citrix.com:email,vates.tech:email,cardoe.com:email,xenproject.org:email]
X-Rspamd-Action: no action



On 08-May-26 23:29, Andrew Cooper wrote:
> Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
> qemu-system-aarch64 packages.  These will be used to remove the export jobs.
> 
> Switch qemu-arm{32,64} jobs to use this container.
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
> We should probably wire up some build tests too, but it's too late on a Friday
> for me to be thinking about that for this posting.
> ---
>  automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
>  automation/gitlab-ci/test.yaml                |  4 +-
>  automation/scripts/containerize               |  1 +
>  3 files changed, 74 insertions(+), 2 deletions(-)
>  create mode 100644 automation/build/debian/13-arm64v8.dockerfile
> 
> diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
> new file mode 100644
> index 000000000000..b9062ee8b443
> --- /dev/null
> +++ b/automation/build/debian/13-arm64v8.dockerfile
> @@ -0,0 +1,71 @@
> +# syntax=docker/dockerfile:1
> +FROM --platform=linux/arm64/v8 debian:trixie-slim
> +LABEL maintainer.name="The Xen Project"
> +LABEL maintainer.email="xen-devel@lists.xenproject.org"
> +
> +ENV DEBIAN_FRONTEND=noninteractive
> +
> +RUN <<EOF
> +#!/bin/bash
> +    set -eu
> +
> +    useradd --create-home user
> +
> +    apt-get update
> +
> +    DEPS=(
> +        # Xen
> +        bison
> +        build-essential
> +        checkpolicy
> +        flex
> +
> +        # Tools (general)
> +        ca-certificates
> +        cpio
> +        git-core
> +        pkg-config
> +        wget
> +        # libxenguest dombuilder
> +        libbz2-dev
> +        liblzma-dev
> +        liblzo2-dev
> +        libzstd-dev
> +        zlib1g-dev
> +        # libacpi
> +        acpica-tools
> +        # libxl
> +        libfdt-dev
> +        libjson-c-dev
> +        uuid-dev
> +        # xentop
> +        libncurses5-dev
> +        # Python bindings
> +        python3-dev
> +        python3-setuptools
> +        # Golang bindings
> +        golang-go
> +        # Ocaml bindings/oxenstored
> +        ocaml-nox
> +        ocaml-findlib
Since this is a container used only for tests, why listing packages required for
Xen and tools build?

> +
> +        # for test phase, qemu-* jobs
> +        busybox-static
> +        curl
> +        device-tree-compiler
> +        expect
> +        file
> +        ipxe-qemu
> +        ovmf
> +        qemu-system-aarch64
> +        u-boot-qemu
> +        u-boot-tools
So after this change, even though you replace debian-12 with debian-13 for all
the tests, the debian-12 still contains the unneeded packages (i.e. for a test
phase that it no longer runs).

~Michal

> +    )
> +
> +    apt-get -y --no-install-recommends install "${DEPS[@]}"
> +
> +    rm -rf /var/lib/apt/lists*
> +EOF
> +
> +USER user
> +WORKDIR /build
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 982fd86db079..008deef98d1e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -37,7 +37,7 @@
>  .qemu-arm64:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:12-arm64v8
> +    CONTAINER: debian:13-arm64v8
>      LOGFILE: qemu-smoke-arm64.log
>    artifacts:
>      paths:
> @@ -50,7 +50,7 @@
>  .qemu-arm32:
>    extends: .test-jobs-common
>    variables:
> -    CONTAINER: debian:12-arm64v8
> +    CONTAINER: debian:13-arm64v8
>      LOGFILE: qemu-smoke-arm32.log
>    artifacts:
>      paths:
> diff --git a/automation/scripts/containerize b/automation/scripts/containerize
> index bda06054ebde..8bd2a847aac0 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -41,6 +41,7 @@ case "_${CONTAINER}" in
>      _bookworm-arm64v8-arm32) CONTAINER="${BASE}/debian:12-arm64v8-arm32" ;;
>      _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
>      _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
> +    _trixie-arm64v8) CONTAINER="${BASE}/debian:13-arm64v8" ;;
>      _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
>      _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
>      _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;


