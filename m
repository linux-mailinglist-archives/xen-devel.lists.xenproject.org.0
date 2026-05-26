Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hYFrAmM8FWqgTwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 08:23:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532AC5D1239
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 08:23:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319601.1587089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRlCA-0005wR-0x; Tue, 26 May 2026 06:23:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319601.1587089; Tue, 26 May 2026 06:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRlC9-0005uI-UB; Tue, 26 May 2026 06:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1319601;
 Tue, 26 May 2026 06:23:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wRlC7-0005uC-Tf
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 06:23:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRlC7-008yfl-9b
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 08:23:15 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a153c39-bab6-0a2a0a5309dd-0a2a450cab76-32
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 08:23:14 +0200
Received: from [52.101.48.41]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a153c50-62f1-0a2a450c0019-34653029e428-4
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 08:23:14 +0200
Received: from BY3PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:217::19)
 by MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 06:22:52 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::22) by BY3PR04CA0014.outlook.office365.com
 (2603:10b6:a03:217::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 06:22:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 06:22:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 26 May
 2026 01:22:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 May
 2026 01:22:52 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 01:22:50 -0500
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
 b=ehJHvpXzD7WIvvFuJcG0IYZ8Z1AYGsEH6QqWnKMWzZMsvFnSq07ETFf7XQbpQccI/ppSQgLTivaqlb7kKasI9HL+RN0xjzl4txyCnRkcuLoPQctwd2GBgMKIJoklNfKIQczoiBYzC3oAJa+NjD4+6F/Mcb5d2BCfFU+9anJr7K/o+VGUoMFDpI7YIS4U2N6Th7ONg6puZ8hCmOQNvbgwqQlbkDWl9D6ruVghx3vM+bJumW7lKqdR1Wzb0UMVtyGtIdx6USJBlzaiiOjbIdh2jwPWM0voiDrzlxqnU1ml8EK1YjEyfhjDCddEwHLgsKVxbvifMLDKHqnzLAJt1Hq3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkCzIeLvWAh14bJC5YgrJi7rKh2KALBGsS7powMCtXQ=;
 b=Cs9ffql22BTLbj8GBVCfsJalxYyd5+CJ/0oxc8WEmfp8z82o+CUb/V0nA8W8hufys/snaE4NrgnPPMyVzSLQyjs65oWU+n2h/lcmLb5xR4/PZ5rtPUKWpM3ehkWbdy2VQ2aXROA7cuS4/dfWxckslyFMmSrcRh8DURhvjH0ev9DbNUZljaG8cXRCfbESRZIbItG6P1Sns9WAeW8em3CVGeipl66BRd615qWXIRIXWAQrXzdIZQtYTD+Y/c1zRD02PMzU8MylkU3G7rJuupNSaSKrtv/hQOTrN8nIPuVA1zmX6bVeAwD4cGVZ/MUDFD5may1NcHsDQgVc3YT9WFYChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UkCzIeLvWAh14bJC5YgrJi7rKh2KALBGsS7powMCtXQ=;
 b=WUkug0u4VvoKcIKSejwz7rRZ9V0+uSs38Ma8l4NU+jy3temdErTUUlvcWjqYdRdKR4iGTpZq4uEI4GOCeJLklzEwnp3vvn0F5/kUbK5W5mC5Ah+4UBs2JRJLPqfH4iCggPPihy8D8EwLKpnCitex11ZN+NZMOvjGE92hNz7ZbrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e6a02f83-5db6-4ddf-918e-753202c4d9c4@amd.com>
Date: Tue, 26 May 2026 08:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] libfdt: fix UBSAN null pointer in fdt_property()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, David Gibson
	<david@gibson.dropbear.id.au>, Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <248482e608157a7156f7bb6d8a809540a50f3f86.1779712171.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <248482e608157a7156f7bb6d8a809540a50f3f86.1779712171.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|MN2PR12MB4128:EE_
X-MS-Office365-Filtering-Correlation-Id: 49218356-3030-4e02-63fb-08debaef37ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|4143699003|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d8JKVnLTv7VLoMYnVB8UoWHa8c5YchRqNwaasipnpHZQkaych7tz+Wok/Hjzaa6p2HuhVPilIGr38DttNFEq6X+IpYeRCEIBMeLun9xRpF7RNiISMz/QCp82TeCCxGPgoIVkq9z06dIsYOvXa/oE56VC4IVP+Kdcs6jxv6UvKyWWA/SD6WQOSnNaQKPKWwO3yx4uIC8Yg1RYnIUyKQdQJW5JMePUlZO1O1//CgfyMTlpZOs5wqAHyhr4IX0bew/MWFWqNyJ74RpVn2tbEONAs9JeYJE8co5B2VXhtei59IYlsdV7hrntFsg0JK6lb6Dl+qkjF2h8Nm+SeqK8Jq90MV+3cY6rkDE3Gf9a5DuAUUD+ZnGDQtQCgbSVmzjwxupkAK9mj0HEuiDGtkwZgCLhLY7mT6O7sBXITg50f3zyytnOYUg3KUq7wBrD68DgoAyKnr3NHdsx0Pjsq0vi0+M2i3vvKqWjc423RIgeYs3wOHKwlbp8+jxNfc6Kb9so32ALo7uqFoOB1PMl84uny8d05K4XO8eWCDW0u7JyclVEzyIb9JRJ7kxIxseAkmbl9g5rWXzGlBcYtWHAY27hcukYhcLEmxrn5VtYisZsdBpmWbFRUYGgp2zcr+GVNLERPzqjVoHpmLaghbZ9q7nHwgNAgtabzeY4qsL2DuGYKqmdhIW5RWpPVMvUzKXFzS1UQc+Qn15dRLlzhbhsf4XFm6f3PhChg1gIgS8DrRhel7lHD2s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D9HxSrRsw0hpI+Onec0eNF0sxE3Cl2l+OzvHBi13/JO4vZwJHhW9rFSmmK7EA5YFN1LRk2V+TtS75MQn5klBnU6lpxOMNGgk4N8GH8lRbXGEsczN8mibO2rPL71+fe6xjq7ZSleWEBebSOLUXar9GaSUPiu+yFHENRQV+3Scd39TSAo2Z8it2qL4rbQ/wh1Z4ypZlOGihPMtGHdt9BPR6S35D1aw4Oewnx4sN5g+TjEFXYseByH3gwuf7WC31kNifl2F0pzzqLF6xCCf7bGjQktH4aMFo0e2bpk9MMYk/Plv+uiCauTwIZVzpQNkjDhbqG5fql67oeelhIq8RztYBZvdIIgNeKgcsw9dBRJ16J8tTN17R4CbH+ORXB5R35I8RloX94eaPqTrBrfdCVh37Nw9Z83f6YGU/Nzw7Rsx5Dx7UiDHhzg7VmdGzfFzjxIS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 06:22:52.6544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49218356-3030-4e02-63fb-08debaef37ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
X-purgate-ID: tlsNG-d25034/1779776594-DA368CF5-7730A008/10/73395122804
X-purgate-type: spam
X-purgate-size: 1032
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:david@gibson.dropbear.id.au,m:baptiste.le-duc@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,dropbear.id.au:email]
X-Rspamd-Queue-Id: 532AC5D1239
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 25-May-26 15:20, Oleksii Kurochko wrote:
> fdt_property() unconditionally calls memcpy(ptr, val, len) even when
> len is zero and val is NULL.  This is a legitimate calling convention
> for adding empty FDT properties such as "interrupt-controller", which
> carry no payload.
> 
> However, compilers that treat memcpy as nonnull on its pointer arguments
> will fire UBSAN before observing that len is zero.
> 
> Guard the memcpy() with a check on len so it is skipped entirely when
> there is no payload to copy, bringing the code in line with the
> nonnull contract.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Origin: git://git.kernel.org/pub/scm/utils/dtc/dtc.git f57e7df35df4
> 
> Fixes: f0ea06558068 ("libfdt: add version 1.3.0")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


