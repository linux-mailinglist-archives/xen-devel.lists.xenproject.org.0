Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAgjDiyvDmr6AwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:07:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C6B59FE4C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 09:07:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314846.1584818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxUu-0004dm-BU; Thu, 21 May 2026 07:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314846.1584818; Thu, 21 May 2026 07:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPxUu-0004bl-8Q; Thu, 21 May 2026 07:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1314846;
 Thu, 21 May 2026 07:07:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPxUs-0004at-JV
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 07:07:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPxUr-00FMZ3-Hr
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 09:07:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0eaf12-bab6-0a2a0a5309dd-0a2a4502c2d6-46
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:07:09 +0200
Received: from [52.101.53.2]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0eaf1b-af86-0a2a45020019-3465350220be-4
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 09:07:08 +0200
Received: from BL1PR13CA0212.namprd13.prod.outlook.com (2603:10b6:208:2bf::7)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 07:07:02 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:208:2bf:cafe::ac) by BL1PR13CA0212.outlook.office365.com
 (2603:10b6:208:2bf::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 07:07:02 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Thu, 21 May 2026 07:07:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 02:07:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 21 May
 2026 00:07:01 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 21 May 2026 02:07:00 -0500
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
 b=XUKrdQjw/Al4dhb44yNpSOalj949dxfYLuR778quSdznIPEIldg3xcFDe4kqZBsy07IRtJr6ucF6QGor5TvOkG80c+FH7B4PrrKx0TwjeGv8pVqGJN2dOhvxXJoBoJbAhWH8GZ5XfHFpDrkhLLrMZksMHJgdEQq1XHmqzTy002c/o9rGBdKbgjJhUuYpSH47Lu2xZUfU4ChfyS8r8PGR5jXRfqZmbobgFBTrzK8FbgDGpjrgy0/eyV+MJWiKjdhXF5ketl9luBhrvR6+cizEg5S4PidkDUl2mCfnPD0Z5yC6F1udlSFlx36AasC2SzE9XPdaYjMqyGv/V9icQXPqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5mGbkkwVs8s/HN7qOdJ3f2S3rRuN4gFpBiFq5edXAY=;
 b=S+jHg9qA0Xy9eIsiSrOOb9bsgw8AQjO/bBamRWKda0NoO3Iullu4BNc3Xl+IQ9yNBc4ulj3Cv3IpcXbXQHlS80qIuzTB1dhL+g3FJAT27q4Bxpq2cuHTaKX+dnQcqa93jKhr614aQ3PzGOReFf/udc+y6PWxcsJ+njz3mG5ZZfWxZgM8Reb0xTJ0KvH9R8KJIWXA+3E36xMrAKGByAURwH6YfsZW2e3YiTTyFSRA86zhx/V0GWP1cv8/jjZ3K5JZE2Bm1fos3qv26KfmE6oLbnkHIiMmqDJeNvx2JIGa3UofcKCcdpcgOw44ZZ2DajpmtNaVucbcdHiw5vIY2wiwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5mGbkkwVs8s/HN7qOdJ3f2S3rRuN4gFpBiFq5edXAY=;
 b=hucckEj65C20c56Gp5Rk696KVt/H5LNWTxG6yP+WKprKkLPClwUoX4ao4SxRDwn8YiF7Xrp/FaaCtSq3zgz3PCmuYyct+tBdszXFF0L+y73iEpUtPPl8uiRpX+bWDszYUKgp4bvELvHE3SOEehazjjhAoiqWq4cFP8EiiWreaJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7bde7370-cd19-414b-9b53-37aaf076ba82@amd.com>
Date: Thu, 21 May 2026 09:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gic-v3: Fix redistributor wakeup polling
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
References: <20260518070524.19813-1-luca.fancellu@arm.com>
 <64094528-9c9c-47d4-98b6-640df0a9df3b@amd.com>
Content-Language: en-US
In-Reply-To: <64094528-9c9c-47d4-98b6-640df0a9df3b@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 54fb5fc0-ff66-4e0f-a2c9-08deb7078eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|4143699003|56012099003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	UVJRqD3vO5HgX/ihiQybGymvamTkkWI7IX2Q59T1bwFhW8WpR9WwHKpwpeQ4uSOzqQdjNUmpPAbc/I3u0reghtCP0VTM13Fbsy9TOqV5oGBsThg/f/GFsZOB0xgPfQdrM41xZNjYk7UZmgwtLbcQUlwBTNcVv1zCnYaDZjGojtXSdKgq32OkHTgPn6SqUmeOZDdKMGFl8nZ+p9d3t4bXsU064Qm4muUy9mjD9kTmhxJ+Bby2OokJf3dJW50TOqzBeCi6pjnDUK0u3cie/knGqWf7cz1iRf9FJaG9ceM3Hhl+bk+Zk5EQ1rBfBcLbC8bs54nj6rGUMwiAZXOa+3vu4dVrj600JwOSYWJF7YJgdewbSD0Mt6SOHxVyqu5AIu/Iz03fAHCEn7ocsXLuL6yR5J7BeO4wCRBpUACSQ1bdHdXiZj3E3T8sJRj/F3uoCmI+5z2hOSW2UqlNQtfFoR5ikDnreo0SXraCUieo80N2XwxMBlhMEIpA8wrbGGqKOosi7kqyWNXLIKqRGuBBR+T9lBqfzFILLFserP0ms/ZRFp5BaFyxKUR00BwZQn7+UCmhVdOqZkPGGZahvLbBfLfhEMhoeMAvRa2AmdVerDQ9ZTVisTx7aD5zg3MpyK6mVNOrpHkmNkdGSUgG7M5bJwMYwsqqI6m5tLVPmTuSY/A1tYTA0wmgrzC0ZLqSEilXwVn534WiFU+XGkGg/Sle9mI6ziMJ5LUOLHo75zit+HQ9cmM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(4143699003)(56012099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I7G4GwQPvU5T8ozxW51LG8U15vTABeWZe8MvgqxcKXk3kHzbaBfgZarEDsGZ84n4sXJ3eavTCHpphpnlVUBWVonYGPlSg9GHdq6oklP71fW7aBrKGeJ60plV4zxJB5OtyibjmPKWYr5l/AV70GwIdeB/foFf2NkiTQjROwGbw9xFX9E7Zq8ESy2xTNSRDppfPEDmchCkYLguxQl3+db2fYPOIbf5DnQ+vNISwBPP4hpENV3Vzgr5+FOsNNwS2SnSbA44guQdaCj7+brzZjGZ+b9Czw9NdDMgUtJNFgxkPtSXahbVaAuvurdfP0Zl+3ZRrnMKpP1rX6OvU0FL7P5H5D/NN+Jur+3aJvfjIlLNlIIYa3jWcQnbhbud9OULE7LKVtRLYmEkn/gqqG4gk0IP+lHPb2LBj9DOI17BoJSWtd/+BtXvDk1MtmOiu+yPLl0d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:07:01.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fb5fc0-ff66-4e0f-a2c9-08deb7078eac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
X-purgate-ID: tlsNG-720697/1779347229-AA374161-19C4A849/0/0
X-purgate-type: clean
X-purgate-size: 1109
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,epam.com,gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,arm.com:email]
X-Rspamd-Queue-Id: 84C6B59FE4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Oleksii, can we ask for a release ack for this fix?

~Michal

On 19-May-26 09:19, Orzel, Michal wrote:
> 
> 
> On 18-May-26 09:05, Luca Fancellu wrote:
>> gicv3_enable_redist() clears GICR_WAKER.ProcessorSleep and then waits for
>> GICR_WAKER.ChildrenAsleep to clear, as required after waking a
>> redistributor.
>>
>> However, the polling loop currently uses "while ( timeout )". Since
>> timeout is initially false, the loop runs only once unless the timeout
>> path has already been reached. As a result, Xen can continue before the
>> redistributor has completed wakeup.
>>
>> Use an unconditional loop, matching the surrounding timeout/break pattern,
>> so the code polls until either ChildrenAsleep is clear or the deadline is
>> reached.
>>
>> While there, also fix the timeout message. This path polls
>> GICR_WAKER.ChildrenAsleep, not an RWP bit, so "RWP timeout" is misleading.
>>
>> Fixes: bc183a0235e0 ("xen/arm: Add support for GIC v3")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> 


