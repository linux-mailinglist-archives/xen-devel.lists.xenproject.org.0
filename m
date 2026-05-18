Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IE4CImYCmp+4AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 06:41:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D5565B51
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 06:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311417.1581544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOpmK-0002tH-1o; Mon, 18 May 2026 04:40:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311417.1581544; Mon, 18 May 2026 04:40:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOpmJ-0002qL-RQ; Mon, 18 May 2026 04:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1311417;
 Mon, 18 May 2026 04:40:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wOpmH-0002qF-AI
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 04:40:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOpmG-008H0A-Md
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 06:40:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a9825-e002-0a2a0a5209dd-0a2a4502c626-32
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:40:28 +0200
Received: from [40.107.201.27]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0a983a-af86-0a2a45020019-286bc91b59fa-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 06:40:27 +0200
Received: from MW4PR04CA0109.namprd04.prod.outlook.com (2603:10b6:303:83::24)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 04:40:24 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:83:cafe::c6) by MW4PR04CA0109.outlook.office365.com
 (2603:10b6:303:83::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.22 via Frontend Transport; Mon, 18
 May 2026 04:40:23 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 04:40:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Sun, 17 May
 2026 23:40:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 17 May
 2026 23:40:22 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 17 May 2026 23:40:21 -0500
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
 b=ABOy49aWMeDVnRc4M/F2A6MnoQePoQC2KEpHddd77cPZBpnCSkVihDkx7jKdJAp18obr5oQYgiShhknFB2l1fnrAPNuP2wzsCeH2T3JyPOpUT37xAxlkCAmJzlSFiwzHpxEcO4dI3s0uDJh0OLWRZfdgt4vpJ4hxdPhnXsqpvicb9Lt4IeN7YqTqOoTe8nSMRZ6oZv/EYJxxG1pAmH4GT0c+fnS2EOgmGscJN04AZh93QwN9iXUWt7dxABjQlksP6l6ubGvtC81G9OaDMhZoLfAbDWh9oeVCDliADsSXCNxe2oqsPVhA9eFwVQ1+sIj5bcWdc4T+qof5knm2m60Hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUYfxPpATFHSXkm6dLvUWLUHw5eYI30x3dRwJHoN4Vg=;
 b=d92rwK3IxsUw3hCHLnluyLqh2qCOy5Gr4uey+QaTbEnhaslFC0NjGKTpM3yXoMoxREySt1Revexc5sD+qhehyWx7gazmbavXCKPm6XNYN3re7uOBSDP+2f+OyCAw8kMII2Dj5+SJR7Swv9/8MUNO/EgTl3JEtIY5005Vve6WhBooV6FKAtc4tCk7scmUgJNJ2GEswb2Ta02lyUIv9exvnU/Hx7ScMBCcoMYieLtnKTq4v5VRM5MIEebJcoDwQhHSXkXAVXu1jKgWAFdfC5zZ7iIwGT8tvm1AEoCxfFHp1zVlHk1FZAH7ip/rFozrnFNAzNoRrHUVOSsiMjS8tmKlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUYfxPpATFHSXkm6dLvUWLUHw5eYI30x3dRwJHoN4Vg=;
 b=PtjMmr3lzSjHlskx7cGWrxVBBwA9rlOOKkrwdit1GcG3/iiBwD98xQ2gZ3xtXHY58r6Z+eyCii98LTQX6kEUvYckgTRJ1V/y7eN/1pNBWn/uLF5yhHebTl1zsmssyrI1B/l/QITSSFr8Ev84gdmHmFk4NnElcluL+mc1+N0wUAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <771c8c64-2743-4a49-bd11-55fb6feec2ba@amd.com>
Date: Mon, 18 May 2026 06:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Wait for redistributor RWP using the
 right bit
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
References: <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0fc5e4d297b8dde66ea36be3ebd60a68dea2562d.1778749474.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|BL4PR12MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d97f8db-e986-4562-406c-08deb4979369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|56012099003|18002099003|11063799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oubaLMXsyBcyk5CIMmkfvCYcNd6rM0BiIy2gvAorvrXQd6Y2j24i+MbcX/r4oDEcUghRAVTYYbLTKg6s82qMFFrI4FoXdRWopXW4vP9SI1oN9dsaYAC1FgedKuNr2pPhufF4YX9RtdIPPKgAjXcigobyTI2g6wE6LLGFJMqyZ+hNGQq+tgOm9C5JT2q/Xk4TvdIqHW1okpLT/x2jNWWa9WPjbegwDQymGaZ5LM5H6bx7c6WUvUKOVjQdywmTk7Iah/XPnpajU4to6MRSFlPbn0nr2917iiukcIL0Lmt3W19wnvKqOP07LOb33DCTHQkqKhYbnC3R//MGkgKsTxW+KU945+zJPFild+NB4gDHoYGKfqBePNkm567rur7wFs9+YNemWRYRL1aUyGzuNzXlefFHPmnbr7Yu7UrkPhqKeHN7LA5rj4FWFKreoW/stNJc37fXDWqdIi7KKf53DA+JHBHHjL5EFPBaSIJtSFLXvKUZKCjr+5Brq2VLnQtUR4XWfmgb4NHbNq7yz9kIKGbPUFRekd9BTwKOMbOW+CfhKNg8tKIfCg4ihl0nE2dM21TCSMj71NTVLrKRZueoTg+qWCz15NeeyA2uNl3rojC0ZXSar0mq6krCYE1GAnznikV/6kAgJPPtGZIvYPfzmOPFXgFobzYyQeF5Ixr4L5vUhkhw9YPnOXxMhIBOKo0X8k6iKtwQOdn8qXnQRe2YhQTyvODhbCsAYZnKRg9G4q533X0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(56012099003)(18002099003)(11063799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yDy8X+QK3lP0tu0OWUEHRwMoHNwJkqkoI+JNVS7MDPbKql/MtToDPphOqqRyztGQgxPUwPeq/DQYeAnIIqN2OABtD57qa7ZJn1InOM5EDGq0dHfMdTrhsabrL2GNvrtPcoOX0tjGAj7SSWIL+XO/STjX49RtRNeI9ZAKeIb+9DNH0/KLIEdIknc8Kz4SaosAd0F+taJ4MNlzFN+FS8LKbt2JaWh9bNoFPJ50ucpIXLWjnllXB2XDLDhTQVVONXHlTGv4hu+YX7hrZ+UolCwIkGZD5am3BZCji/2KPWZaqDDcVRuaqicGtOWx6AFc64zbixsqNKyLSa7ad4/GbU8B8bmr0RjhMILFJ1l4Wx7nzk2eZr5RZCVYBWpSYjFImEGEw+YiQgnp/v3qwe0PLkd1R1owhNoRLfax8edTFolyCSyNXni3EJ637OVz42UoNaYe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 04:40:23.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d97f8db-e986-4562-406c-08deb4979369
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723
X-purgate-ID: tlsNG-720697/1779079228-81B70161-6648E6E8/0/0
X-purgate-type: clean
X-purgate-size: 1171
X-Rspamd-Queue-Id: 737D5565B51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:luca.fancellu@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email]
X-Rspamd-Action: no action



On 14-May-26 11:08, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> gicv3_do_wait_for_rwp() is used for both distributor and
> redistributor writes. The CTLR register is at offset 0 for both,
> but the RWP bit is not in the same position.
> 
> For GICD_CTLR, RWP is bit 31. For GICR_CTLR, bit 31 is UWP,
> while RWP is bit 3. The redistributor wait path was therefore
> polling UWP instead of RWP.
> 
> UWP covers upstream writes, including Generate SGI packets, and is
> not a substitute for redistributor register write completion. The
> existing redistributor callers need RWP semantics for redistributor
> register writes such as GICR_ICENABLER0 and GICR_CTLR updates.
> 
> Add GICR_CTLR_RWP and pass the expected RWP bit to the shared
> helper.
> 
> Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Good, now it matches what Linux did a few years ago:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0df6664

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


