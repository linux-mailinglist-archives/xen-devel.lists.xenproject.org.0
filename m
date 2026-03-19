Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HEpKYLLu2leoQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:10:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B52C9440
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256898.1551373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3AJi-0008Tt-Ky; Thu, 19 Mar 2026 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256898.1551373; Thu, 19 Mar 2026 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3AJi-0008Rs-Hm; Thu, 19 Mar 2026 10:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1256898;
 Thu, 19 Mar 2026 10:09:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYGS=BT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w3AJh-0008Dm-1e
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 10:09:25 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3acc3a8-237b-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 11:09:24 +0100 (CET)
Received: from DM6PR03CA0027.namprd03.prod.outlook.com (2603:10b6:5:40::40) by
 IA0PR12MB7579.namprd12.prod.outlook.com (2603:10b6:208:43c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:09:16 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::5c) by DM6PR03CA0027.outlook.office365.com
 (2603:10b6:5:40::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 10:09:16 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:09:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 19 Mar
 2026 05:09:12 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Mar
 2026 05:09:12 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 05:09:10 -0500
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
X-Inumbo-ID: b3acc3a8-237b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7RKThrl7w/ktD+jSYbaFjCUy+XKC3mSYQMOeVbDwJBwjx2oKBtMGjRx4yHTl/CR2RoIuBZatIxoj89v48KediCNSPpztFF3uIlk2xp4RjDXRsa3S+bAu3fkhY6p6erxAcMC8ScXQppwTadCsVWubPLvj91ogXQ+t7j0LuotywX7mm7jqbaUxMD5VvYCarddAfEJjOqin2+Pjv0Jl9MDhw/SRBYH0o6OcGCDui8xjWE4CXr8RF1G8xoQEATJ5oFazMoDC3TLYhHkVAwT3Fp8Yt6PFL2juMEztjcRkjb2O4nuVI4VZbQOwFXrMSS7p+dmAYH5CFxOGN1NyOc1S+Dvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfm6QmnRtILbCzalGWpjoEwtNmGG9743U550ZpB9xa8=;
 b=TFzuAgHXOfB3X80P031G+9Zx9XsZsJrWGtTMFSjQDvckxFzRSNJWKzeRbHRWqLs3Pf+tuRekPz8ayjGCwQdyjNYLmSm5KCUfOI0wfWoA+uYDfNFQzruimMzxDiVMAQ0hEmfAWJZGQaa42Uyis3qJzuAJqSmhVa2nsgLNJA9Q286cue75S3V4RQxh2ibu87oNOEzWW30NIAu4/+5lVh/l9PaI9Sl3sxNS+F+l+j33mT+SfIutvw52SmQg3kHv6gqssjEHnapusQEGa1TNPYjzL0OEZsTq55YAE3A6qnUZcIve5jsrcWUMU+sNrroicWLSzO65GmYHhJqHiEUd8fkG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfm6QmnRtILbCzalGWpjoEwtNmGG9743U550ZpB9xa8=;
 b=O4RrZrprF4zqF62vO2E/F+Cq1d2R0bGcE+oG0LlxMy2rtX6J1V1ofpIeBKxuRX/8LaArFF5LbcjLsrazFWElj5UIpz9/wiDcVWBBcTxhLYB1jr4Z/acnoYxzglhAb/clUFe+Ci1g3OQ9pl7zowgKhTD59pXQbrtT0hyP34BJay0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5bc8a4ab-3e23-494a-b5ce-d1aa5c6ec7de@amd.com>
Date: Thu, 19 Mar 2026 11:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|IA0PR12MB7579:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb81651-0836-4998-fc3f-08de859f9448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3YMJKZlohwTfjkN8qb+vxfIF/baE9RMDDWo775PVi+ZUxtsvL452pe+0pBnJtQKj9AhsO4lRjiehJ7m14vfKPGqzDZxSqRoO34EoVe/9fW9ZhwWn9hvnZT8HEugmVDdlUP/ju8v9/k39BALnpzKjyqwR8UqTlRg6CXvuAZ1Fe6XxpJ8E9cdbTWmt+GTKtGebaMymGsEmOMB/q/oZCDjgFnxnIAQlFTFiu3BeP7Omu/KG2QmVWKWYFJ+6+Z42bxe1VV/gfoWsQ4DWWJYsqwpuv5lwc7fM1jpHUefuemn2bE27Vob7EcjSB0r+PfAMD/S+PWnrFllY1yfsh04QDYZW2eDrTN5Q0mZXtOvG2QBUPCSjzq63LzgrDewmnXPWKD2HRyDjOdQRtqsCoSYIguHJFkHDT8RExKp3Oh8L03GwJvGQFl6NRRxfv9i/luzhDkVZvWCalus5LsTEo/EexjHc8dVizdM4jYtccfD9mvxwA4+D0e3KWGQCl4K1NMXL3Y4xiniC4KG1NeyWzBl5B/C3fDS7s1Jf5huyBKzwwOMYMsP/kMjgzoLlR5d/nSVfWRNTRsjMKXFCmJ/sTtnemiD6NdTsA5eOt68Hq81Ry8CdjUAFvrCIiI/UWFz+EjfZUmgpZkejvXybZW5vhF2xAVgOycvn4XWTTsuAiSP0nxLwo7PukZJtvrPh4QEYbFHC5JwTQ9pOsZ8DhriXsPVYvywdkXrdkIphIE/peVYoG6NncaAgDN3RTv8gVkgb3z4RFi1UjJeTTvKi85TxdQPscoRyGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w9cxeTlpMS+4+QyA1VOU8QBhIS2hv9dRXVvw51NlqNTfDnvW7uFLIlxGFRAt6oa8QL7XQTBxx0p4/qmAt654kiAnQZD6oRP0efD67bpUrkF6ct8YYy3BoRNqi1/uAhVl+YP4GQBlwHzVFmc0cENscuj1fIPr5mR5N4v+L5eO01VT6x+7E2aqYPFc3r4oiuR/KpdrHNabqOfmKhoLdtP/KfSHPysss1ECrkJo2gbZ9oL43CanMAjt8fE/wTviWbsLONa89CJsVES8GuB0D8GGN5XuC8H4Pp2BjvucCFoavoq7qSs8wr3wmzlePHvoyfbCJgbkTDbkTm1oAP9kYm+SA/dYNpAnR22OafhVORhI25bhJuhfZaGc8HmOTSc8llrz4HKhGgo5ZFfq0/lewDFHy9EILEgpFYcqb53e20AMyNOaPcquIYtbzc7RmKPWpsdw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:09:16.6874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb81651-0836-4998-fc3f-08de859f9448
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7579
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:paul@xen.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 5C6B52C9440
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 19/03/2026 00:25, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The domain shutdown flow currently overloads is_shutting_down and
> is_shut_down to represent multiple phases of the shutdown lifecycle,
> while some users treat is_shutting_down as a broader "domain is no
> longer normal" condition.
> 
> Make the shutdown lifecycle explicit by introducing
> enum domain_shutdown_state and converting the existing users to helper
> predicates describing whether shutdown is in progress, complete, or
> active.
> 
> At the same time, make domain_resume() validate its input state and
> return an error to its callers. Resume is now accepted only from the
> fully shut down state.
Also, you limit it now to SHUTDOWN_suspend or SHUTDOWN_soft_reset. Ideally you
should explain why i.e. resuming from crash/poweroff/reboot is semantically
meaningless.

> 
> This removes the implicit coupling between unrelated users of
> is_shutting_down and makes the shutdown/resume state transitions
> self-describing.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
This is mostly a mechanical change. I verified that correct helpers are used in
place of old flags.
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


