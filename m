Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC4A2528A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 07:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880453.1290527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teq2W-0000ss-8V; Mon, 03 Feb 2025 06:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880453.1290527; Mon, 03 Feb 2025 06:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teq2W-0000qg-1r; Mon, 03 Feb 2025 06:34:36 +0000
Received: by outflank-mailman (input) for mailman id 880453;
 Mon, 03 Feb 2025 05:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxL3=U2=amd.com=nikunj.dadhania@srs-se1.protection.inumbo.net>)
 id 1tepR7-0004wK-Rz
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 05:55:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [2a01:111:f403:200a::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87ac0694-e1f3-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 06:55:55 +0100 (CET)
Received: from BYAPR06CA0060.namprd06.prod.outlook.com (2603:10b6:a03:14b::37)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 05:55:51 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::89) by BYAPR06CA0060.outlook.office365.com
 (2603:10b6:a03:14b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Mon,
 3 Feb 2025 05:55:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 05:55:50 +0000
Received: from BLR-L1-NDADHANI (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 2 Feb
 2025 23:55:15 -0600
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
X-Inumbo-ID: 87ac0694-e1f3-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qe/HrCE+KcGzczlaNno3v3hblZvAvrNxga+jlDOUBmkF/9ogkFYAywUjsxSvaG4JApXyvzc4jkHUF2rP98eKSUtwKwpIdTFmL4AxvJxm13z/NdE6mRXv5KC/Uk1zDAegJcVefNatrYi2jtf2y/y34Mh3yy6fwzdoIr4Lq3/cx+K9/esXhgnJcQ6hKNZrflH5treVKtcEhnRpZYvnZqyrzdx3YAv4VtHiu4V+RclgMnxQjN/MbDLups/VZ7JuHLfbQGiA9PbR8lz25s0MxW+tmVKmlJNfaC2IlJtngI0rlUAGhLbefUcdAeNFOjSJPjMQVUVxT+TkV6qgQTwaZ0mIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8lK7oImK5GsAjjYujbZqwkRW6kPxfs15oiWYx+hDAA=;
 b=bgWHLc407qUOi57kg9bzpjWa9aZ919VWnSlCF2aBiHfu44jkW9mrzCQks2lQLHm8nZevMwukv7luoOnxk/0OkaqO04NbyReGVRBTKFfeiCSC9VVvrqRnEIfuEjXHnS9CIre2lH3xgOUzwtaNqRXuYzfNDYSkTEaLQ8d+fvn85g6Jg+U63u2ua2mngHdWFVAgex6WmpxqwjJmCK9j4I/+4dQzjoGAlU+ikxeYjMf8Yaj+HdMNHW3Aar0/34O0atsWhE3v1JMQDKoiNlb1jDf6ZNKYxPTjXWQ0+mP29dCKGYiz6yMC9KNvLa5DiWBdrkmNCooeB8cTfhYBpGYJlm3jWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8lK7oImK5GsAjjYujbZqwkRW6kPxfs15oiWYx+hDAA=;
 b=AR/5oMM0Ep2Rp/Pgk6uw7drexzJo97IMWZ9SoskydpUVQHhYbAnb+qkwmXnDMnphDFBFEYk7Uv/RkiBRscQbvrNoauQBKVBJ35c6TQYopeHQLic8bWTTGy8Q10pX8PeY3t/7BUQBW39vUpqY/H0bLJ/yTLOU5FR37ZW2ENOKSlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Nikunj A Dadhania <nikunj@amd.com>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross
	<jgross@suse.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
	<haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
	<decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, "Alexey
 Makhalov" <alexey.amakhalov@broadcom.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, "Andy
 Lutomirski" <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	<virtualization@lists.linux.dev>, <linux-hyperv@vger.kernel.org>,
	<jailhouse-dev@googlegroups.com>, <kvm@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
In-Reply-To: <20250201021718.699411-2-seanjc@google.com>
References: <20250201021718.699411-1-seanjc@google.com>
 <20250201021718.699411-2-seanjc@google.com>
Date: Mon, 3 Feb 2025 05:55:02 +0000
Message-ID: <855xlra7yh.fsf@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: a866d209-0981-4b8e-3556-08dd441769f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHnpJxwWZjnytpYcAYL+LWwCw3QW/pQ9N+XyD8SerezGnn6wJ06BQIOh0seo?=
 =?us-ascii?Q?EoP4uTnKYbj1cTrmJceqzOtAkPVwUrisXaKd6J/u7R6HdSLUWdlVQqBAW33q?=
 =?us-ascii?Q?OOZq1bPgBtEmK65lvWVUaqN+BSTNwWNHZUQDR8tLC7s/husAIO3bXfifZZ5r?=
 =?us-ascii?Q?icQeNcNOnB0zVNtMWFLiMaX8fohdfkHyJuGtUTUilPQr2RlTz8CpZbd7xE+E?=
 =?us-ascii?Q?eVIW4r/dgceYuR4SIt9UKH/1qTOZCYq5GJtXONinVUPkqAMPWJIQ2jIW4p/G?=
 =?us-ascii?Q?31CeABi/NYLLVxC/5A2W9ak6UsGhBSsKThCbgXc64nOdlxHX/GE9X4YeqVkX?=
 =?us-ascii?Q?MPT+nd8swdb5yy1u90i4YZgq84qFMl+j2XriuUPkM6+OLYkDf+0c7b3Hm90x?=
 =?us-ascii?Q?p6H8FGvPHASk8WMkMwGf9gm/xOW1CtNiKxSzTnkS6YeYIpRoqZPHmwQ4vHzT?=
 =?us-ascii?Q?5Zhi3ejJ1+xOOT9MLIIxI/yU7DZQyozAF7Np7yKvfVDoyiduqmX1Gq5SMlkn?=
 =?us-ascii?Q?gI6KRiA2H9tA3KyK+72lW0gyoiiNAcmF+8GYD2PjB0VktT8L4Y88yLc9whJQ?=
 =?us-ascii?Q?NgBbnpgeE6u30+SeT3XyVQk5fd1wkUfUF0CCyyq0hk1EZxc0cOyuyidiDDVF?=
 =?us-ascii?Q?wlhMeRwkTt31KRUekS9gLXKlYHHdQtbBtoHSI2cxZWhSjqB5ESKrVs2HzHi2?=
 =?us-ascii?Q?ye9sVv6X8oXYzcIuLvVv0jAZVk3B5s/nP6gAJ79jMoyPf3YqYQqtQrR5bbTb?=
 =?us-ascii?Q?pbI31BN+QSWmKU1m13/cdlpF0sXfF9hILz6kakMFcnmuxCORTPii2xikvYca?=
 =?us-ascii?Q?886IcjHcQzRmvwL81r1uWJlsANVHO8Gqlnsykq5GBdzf7hZzqTA8mXxYAkHL?=
 =?us-ascii?Q?c9hIDuACr7aSfvdmfUeYgkVhj1ZPGjEOgFRhogUDRvg3uNT3Eb0EkCfvmt9T?=
 =?us-ascii?Q?nHTTWzAhBlrFB11XyCtnxH3wSrYzDaEav+CR2OjQ56ninqhwKNRmG2ELte9O?=
 =?us-ascii?Q?KdCfD9KppmwbjLW2GGMN2zL0IFBXHWir267iLpHQ8Mmt5mewJqVb6BUZkDgf?=
 =?us-ascii?Q?O8+TMZ+37oJRVw3qvikHV4eMuC5HwwCukX1xo9Zbd3WE7yEzPMukQLKxJSwD?=
 =?us-ascii?Q?7yS/ZsRWkn8nmwo9dquNnEtvLBsY7AVk/HgSkMiLV/P9PEdXhyCsw8pgxzvl?=
 =?us-ascii?Q?iHCheneNIq9/u8Dd8rHepKs90c7xW8OWsxdEzuuhWjJHBihBsT9uvOdWEXGa?=
 =?us-ascii?Q?hwpVGtXUXnrYSTS3u2fM5j11TYuqMyzwUXdAY+FC9I7O2Xbam86vEN4rR5vm?=
 =?us-ascii?Q?m/In9rYAVotUOQdOdec1SGLw7t9ktkpmlirztFxbw0IAP4vFUsh/25DrSk5D?=
 =?us-ascii?Q?qwG0Cx2ZaITOdv50qYkddEtT0hRLsmDNeDnhFs2sraZ9bmViKFdAgWDuNVcI?=
 =?us-ascii?Q?eIimnEZcqo/yrbsAJj1/hzdcGF2grP2MMQSW4ou43o1SLA928ouJmQGz8mLw?=
 =?us-ascii?Q?SOhHHyidjVEjbbQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(7053199007)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 05:55:50.8351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a866d209-0981-4b8e-3556-08dd441769f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957

Sean Christopherson <seanjc@google.com> writes:
> Extract retrieval of TSC frequency information from CPUID into standalone
> helpers so that TDX guest support and kvmlock can reuse the logic.  Provide

s/kvmlock/kvmclock

> a version that includes the multiplier math as TDX in particular does NOT
> want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> frequency based on CPUID.0x16 when the core crystal frequency isn't known.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

...

> +
> +static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
> +				     unsigned int *crystal_khz)

Should we add this in patch 6/16 where it is being used for the first time ?

Regards
Nikunj

