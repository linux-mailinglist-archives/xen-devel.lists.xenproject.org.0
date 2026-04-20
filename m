Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGRgDRy45mli0AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:34:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89232434E23
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 01:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288230.1568522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEy8G-0003YZ-4l; Mon, 20 Apr 2026 23:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288230.1568522; Mon, 20 Apr 2026 23:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEy8G-0003VV-27; Mon, 20 Apr 2026 23:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1288230;
 Mon, 20 Apr 2026 23:34:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wEy8D-0003Tl-Pc
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 23:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEy8A-009eSF-DL
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 01:34:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6b784-bab6-0a2a0a5309dd-0a2a450aa3dc-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:34:19 +0200
Received: from [40.93.194.57]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 69e6b7f9-56b3-0a2a450a0019-285dc2399429-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:34:19 +0200
Received: from BN0PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:e8::16)
 by IA0PR12MB7602.namprd12.prod.outlook.com (2603:10b6:208:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 23:34:14 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::5b) by BN0PR04CA0041.outlook.office365.com
 (2603:10b6:408:e8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 23:34:14 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.4 via Frontend Transport; Mon, 20 Apr 2026 23:34:14 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 18:34:14 -0500
Received: from [172.28.123.27] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 18:34:14 -0500
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
 b=n7FCbnkZ5PKewzkupj8L9PTAJYgF2AGiqlkzQvJ9jD92cZhqfGY+b7ccav8I7wlltWtcdl0Iaj62aGlDG3xlGaXpk0XwoPOQWGQ/MwGJQ5k9voUBosqYM48Szxz6plRNzeb4hW4b0m3u4TpF8vz6/e93uTdk3W3un3KNI8/R7YcdSzzVCnKWKazR2hcOUaT4T+/ezLDHlwcmJcfrtmg7QtxN2N+deOsONaHmgXwu09Yy2kch5eD/4JbIzbDYbqMG21KnPsyLTzxRhUSPbevzBdm8X6uDaZiKxP2sD0KPKn3ieo37S+mO0dOisde0GKComNkBT5stGmUN74eHRz/c6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAXkQR3X09OxLoIp02nG51ZIBJyVPATqCdfSQ3x3tuQ=;
 b=c41apt8/y430/KG6+1BX8x1kwKTbfexwaTbr6nEmMYqz7yrVy/TJPwZvgbw6GLjPM5eIfJwfQasuv5JLht+2Nu0qk3HMBW7t69vHhEOol1BzNiFCbaO+6D0VmyvutnwZzV/ItdR1uXZnIO2/wLstiiPCsdkFg+nb9Qphhfs8bvFC9vti0pHiwpmuaW0rqLcxHUM6idpi7OsUT7c01Lj8qu3S3RyqgZCkV2hI3FXoCudQtu2ceDyPaTbHQIyT19aC/HHsl0NwnvM/Xfu0CYANR5x1r9c2wepJmfyrCk24jiUOhNt9aMG0ofbmXCgyhRnMSTO7oHeEC99BZt6isBGRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAXkQR3X09OxLoIp02nG51ZIBJyVPATqCdfSQ3x3tuQ=;
 b=TihURjgqUDPQzlkCTb7qij+MaqTT9SwUUWGo3y0sA1cw+bvrbHEASiqvAcoGQMeOpwBIniVWTIeybCknMzi583U5PIHp80T4grnLiEYDqpqlfhdjI8G6w7+bDQ7xUeYMVnWVFClAyDu696i87FaBvUz8sfX4wlptw+oBt0eKPtM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <cd0f2aec-bac0-493a-98c3-7da0991d6fb1@amd.com>
Date: Mon, 20 Apr 2026 18:37:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] tools/xenstored: add depth information to watches
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20260313074751.2904215-1-jgross@suse.com>
 <20260313074751.2904215-5-jgross@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260313074751.2904215-5-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|IA0PR12MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: e190bafb-565d-43e3-ea88-08de9f35555b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8tOgjStQjO5mFySfvIke0Dk2Tb10wrj9uJapuRhvz+DNaza98vxpdB106fEPakv/4rQsqXC8w29KTD+n88XdrJFWM35mYDB/3trlCNROM8yaRDenVx/f8mma1F9Ft4VPiMwqhmobmH4IPRKZAUPd3/3n0C4SB+j/RFjf47vn8wOKePHlxyqd1n4rdRtAsKu2dIjKwjAN27ycL4KOYzvMLKwAvkzPw7bFy3/FY8GYFlF3LvKdv4Xt5J5G8JZXexdxQhtQk/CI7ZXzReRQE097rJ65WFrwnRdtjWUSwv8LYSE6feIkxDzvkirUhBABLF4srliGVLDrXPn+njNlHWSYcssaIAP85r8J73qKhOe018OqJ5UcZG4P4baxxlLoOO4dPPSQcpHVKITzcKE723jFEXTHFBYH/PvlNhKJZQ0jReXn2g/7xhE0K6DVy4e5jNAl8njs8X1aocFBlGr5vwTBPBD9+Ryqwf7ISwaaES4gVJj4FKv6u7Kv2BGkhDaDPreOKlxv6hMZdXpPAcA4VmsYYjM1v+PEbM6Bu103pO3gfmrohjLu1iLejuEoBywd52YiSfKqFaKXTcm6fLk0/auc6+R4dfmxmKrrrF6pgssIGffibnUCvtANpj9KcYHwO8AkdcL2JVeVAYCe1teK5nJcGNuEY3hz8Ccc2aMzuUZH7m1knPChMLRU/WYNXATvDlCPm6ymjS2nFYpMAcOYo4EE5xCQRJbzQB2tFdpdQQ1P72MxIeEFxrgQtOqEsy6x92XmVYoVPiTUx+ezIq89EHITXA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	laatSRY+TAXMyV9TLi+M2Sa9bL6plBks2Net4+BGrCpQdYxM3A9kUOe21rS/oMWk0tMSp0HTbJZtUYOOedsnhQlTnV6kpN3vye6G4/U3vfEkA1y+qy1RVLnJGNoDMSBhPVDATqYI5n83ZK85yf5Fg/wzJYHlaRt/aZ/ioK13xV0Mn7cb7wpPu50g9HhCDU90v9uAWRAAfzyjI7/hGMnqncz0peixZ7WEO54/zG/tlFt0xS6n2V43yg+qn6sGZracn5me2iO1PZggLUDNDUu6/e4mNr0dNr4yvXqhv2DS1jfIDBDSoWB9NxlsMJiK0rleYZup66vMLrI9ssB/8EQLOVW/rkAcfgOVSAKstLWVesTTXaNCrm/oCpgBaM6q+0syioX5H8KpkgJ0VEEyw5zFUHoRbSDd26GJJSdczfczilr9NiJdKAw+hAxj8T7IIMKC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 23:34:14.6946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e190bafb-565d-43e3-ea88-08de9f35555b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602
X-purgate-ID: tlsNG-4011c0/1776728059-4596E8B7-5982E9C8/0/0
X-purgate-type: clean
X-purgate-size: 299
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 89232434E23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-13 03:47, Juergen Gross wrote:
> Add the depth for matching subdirectories of a watch to the watch
> handling. A depth value of -1 is used for the current model of no
> limit.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

