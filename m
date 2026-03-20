Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MSpM0YQvWlf6QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:15:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD212D7D8E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 10:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257907.1552154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VxB-0000pL-0p; Fri, 20 Mar 2026 09:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257907.1552154; Fri, 20 Mar 2026 09:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3VxA-0000mG-Tn; Fri, 20 Mar 2026 09:15:36 +0000
Received: by outflank-mailman (input) for mailman id 1257907;
 Fri, 20 Mar 2026 09:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XX1m=BU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w3Vx9-0000mA-64
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 09:15:35 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b9f18e-243d-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Mar 2026 10:15:30 +0100 (CET)
Received: from SJ0PR13CA0041.namprd13.prod.outlook.com (2603:10b6:a03:2c2::16)
 by SA1PR12MB8141.namprd12.prod.outlook.com (2603:10b6:806:339::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 09:15:24 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::22) by SJ0PR13CA0041.outlook.office365.com
 (2603:10b6:a03:2c2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 09:15:24 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:15:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 04:15:23 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Mar
 2026 04:15:23 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 20 Mar 2026 04:15:22 -0500
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
X-Inumbo-ID: 56b9f18e-243d-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBxpi8cKm5XRU6olhgN4Gm40Btkp5Mc3MbjuDIlXCastJSV6/XN154Yfe5pxIUicnL80FxVcUaQbnGxfEKO0zpzATb/Lmkx9zedzp/zyt92M/CCBIEhke7bmnC1874Qczcivzz6grcWCDsl1UOcm4HttLibK9CN81rPa3vrKBUWg97lBKBldjNQL8YR7xVHUt1KR8nAbLfjYPAxKnTRU1sgFMPCV3Kp6DPtqbjhENAmAOR9nrHK6X38sTqSMdD0DlEjGVqgYIe8U2iWdF+yR/HXxJMToOqxKgTDyTE7VcJ3/wvr7zHRSUjIR/6FzbWb6LwHfUo/TXx6SCXldDYog/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7nWEB78XXjlSaW/R+PBuX8PG6e7TaYq8Up+wL+N6ZE=;
 b=qgZNRxH8JNFAD6BkFUG2LxPkqvyh5bsJ1I8E4fE9m+3fN6EUbCgrksptpiUoLCdn67YVlhGpVQRRu5fu5NfmwYMr+CuGUI5N4EnQMT1WKJt4f5mfP6N4jto4d8vbKARwlRFxDI0l/Lh1IvQbXyga3S02nn6rM96fvVcT0mu034bX+BCEbpkquALaXJ8CWuI/eZLpr+YIF4jCn2oJtBrlEdqec1AuGsJGk3OMBgGIU/j3kdxUzZCvCCx+SlgfeKUO8zpJNHvIzNswJ8FuY0oDhnvmqmZYZGAHc/UwnWtuEb1okIomZXaujx40tdmhgRUsvofgTDrqLOefTzglQ23z6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7nWEB78XXjlSaW/R+PBuX8PG6e7TaYq8Up+wL+N6ZE=;
 b=EO2JehxveAtdCQq8Sm5sqZqQZTwDyvzsOuRaJ7PvALQeBKZ0YRAFUanpW8sTDSzhbOUttCNM0JSC/sOgiT8CZqqRWCH7KPX4xae5CHMzLm/OVYFxOqc2N+thErviJRV+pvdq17DzDNjQOt72L0sS74HQ/OhJBamPk17MEDiU3e4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b09e3101-e0f5-417c-9d1b-e61c522ff7d6@amd.com>
Date: Fri, 20 Mar 2026 10:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: ffa: Fix local ffa_vm_count shadowing
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Jens Wiklander
	<jens.wiklander@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
References: <cover.1773911799.git.bertrand.marquis@arm.com>
 <030d24e1776af7c2391c588bc696592a64a92c51.1773911799.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <030d24e1776af7c2391c588bc696592a64a92c51.1773911799.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|SA1PR12MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e94b2c-0a63-4f81-12fe-08de866137e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fxGvIYgfRkrtR44daQhKSwmSM/vcj/yclV25A0sJDv07yZBE4l7eKl4N570yu3Tfwkb760cBwLne6KEQ6S0pluUndViMIyaqaX43gX+2bUHPwtmuLY/saurFsj5/3VePmuwkuubU14UDytnvlb1VTzBlU2y/OhbIJszV+okRcIgMAH3t9LN/qXBgdZEgjKJ8F8tUnDzI75JgEAmM+0Rn/+2cLd7ZViCjFptYw0Kst2IfTlZ/IMwLxJk5emZY8mHNMkoC1LhO7CeC4pQEwkpd8Mz4bJe+CrQERpvHifwi45/W1yuNkw0Pc/vnrz/aXCRKNuSx52315EKVlvrAGAseflCVDrGfNTgGn6+JuU+pKqBYjxO5ZGh6nGN027wU+f9Qf28PpnMkTPl2HnKzicKu+9p9fjq7DhNuilr9O4SHCGMk8Nl53kGKtkJ5bWKvBlIchQH2tjtXY9J3tRHuKo8j6Wayqj2p02SdrtfQQXEn6W2kwrYdD2fFW5kTahi2hCY0E9ReiA3mCgmRpwDTxRU4OczAk2uLXaQmvxJfwtno/LcKWg1xpqVAiu8H6LuRYSaEnta9nXBE02e3e5BjK9OW7FXZDJGJia3lBBC67VJM8u+AIy7E9CVmhqfpXF0DEhRAhivbGeSmK/JZ5oP6bCkufce2t+5vVJj08x4HS8aepOQ9eqw57yV4sam07VID6uo1q1VWGjHYH2hn/6gOx/UaHv1lY0TShmxAm5wdcwTDj5HO3zCu1KTS8mzKBdB8AfqY9jS2wHvSrGAZGRvO10QKFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3CUhdALr+VPUAHWoSdDyBjQRH0pii2dVTA/88GN16LUC/YbPemeDL2nr3GTr+oLjgIJRJmVDNqF9cxYr4nvJMju0ggeM8UQLJKLKJKYTzh26w3rblEn/7qhCoTnJ2vxUtYIrsd6Ijy5F+Uc4lHdODFNNboCYZNf6hHQ44IntRfTWzBOrhUJ71FovwYcJKpecwfHWwzG0J5C8nh5KhmNf+Qj8dHsoMH9O3VhrUpzho7dtk1uhegTeMZGAQxLAvL/yE/+ebXzMsfaFrMlIZAKAUnuXc8fylean+uYxnH5hYUseOVOc2VZKRel69Tt5d/sDXUKXmGeKnVWVsosRHaMmkGV3xW4n3+Z9RU3bh434WaG+FlPLy3m5i7o7baq1zgoEdvLoetwp/C0SspC6QEaxWc54Vo853JcO7iaC32PPjmHrT7bgoJeJM8jHgQz/4UWM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:15:24.0223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e94b2c-0a63-4f81-12fe-08de866137e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8141
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 3FD212D7D8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 20/03/2026 10:07, Bertrand Marquis wrote:
> ffa_handle_partition_info_get() declares a local variable named
> ffa_vm_count, which hides the global atomic ffa_vm_count declared in
> ffa_private.h.
> 
> This triggered the ECLAIR Rule 5.3 finding "non-compliant local variable
> `ffa_vm_count'".
> 
> Rename the local counters to vm_count and sp_count and update their
> uses.
> 
> No functional changes.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


