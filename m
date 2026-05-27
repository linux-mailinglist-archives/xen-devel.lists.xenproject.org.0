Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJhBBZBLF2r0/wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 21:52:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC845E9BD4
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2026 21:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320724.1587915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSKI2-000231-Np; Wed, 27 May 2026 19:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320724.1587915; Wed, 27 May 2026 19:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSKI2-00020g-Jd; Wed, 27 May 2026 19:51:42 +0000
Received: by outflank-mailman (input) for mailman id 1320724;
 Wed, 27 May 2026 19:51:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1wSKI0-00020X-4t
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 19:51:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSKHz-00CHb8-6R
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 21:51:39 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a174b20-5cb7-0a2a0a5109dd-0a2a4504cff2-38
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 21:51:38 +0200
Received: from [52.101.56.63]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a174b49-1dec-0a2a45040019-3465383fe999-4
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2026 21:51:38 +0200
Received: from BN1PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:e0::15)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 19:51:29 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::5a) by BN1PR10CA0010.outlook.office365.com
 (2603:10b6:408:e0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 19:51:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 19:51:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 14:51:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 27 May
 2026 12:51:28 -0700
Received: from [172.31.199.122] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 27 May 2026 14:51:27 -0500
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
 b=KTmUXAqEOdFvZSxngLYF52qr6BY3XN+znYX0s+5i0icWv28A9Ya/dJ6I8VZHOXhgJfFH7DOqXD71Udsw7LugQ5UInXTQ3FxH2f25Fsn4qa8kmaNCh5U1cXaiBhTzFbE/DsZxtTyQt3zu5qP6/0x9sDeoxyIV3uuPXEv1T40ZwtBD9yMPvuBjNj2t719Bhox4U5I4N+uPUaBXtHYBTKYNHolUbnweC/Ai+7aBfBrGcKQLXWz2s8AJ0FgO15ZzMOV7E+v++GICKDaR9XSlCpRUgJFJ+W0Sgwj8JgRN6YSFjpPY+V8rWEqxqbvWufSnhXySpKGDGB3mGLgiyhVEL4PrHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ak7oUYIlWG8TbIkWnRm/18ov9LGVsz9Zrt/IChJepg=;
 b=DtF34fSvcIDsxA5sf8R23R4iKRCEeFFigauJfSlvBwEAVFFHNEjGr0MEGB1KyaBdXrbmdxW1IHFhUudx4iFc1q9pcjsiun7megryx8YgKcsGL3WHX44vVYjb3NlgeuMyMAojW/JoI8lMQvsqhQNjvnz6jzl9KCoyiB6uNnEJDH/1LYjyhlgG7bTkbcXA0nYDtdrSFmkvuZHAEYWHxxnbiwM45H48ukA9WsxLXf+kHvEwgmLkpLbvxYkcIi28PMsbwPv4oleQ/mi7tGIKEnd4qPyhbqJEaLVEVcqYPHSpuKyeVCeRfskj7gUDb0YhGJIi6gv7KG2IGk4fzAENGS3djQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ak7oUYIlWG8TbIkWnRm/18ov9LGVsz9Zrt/IChJepg=;
 b=jKZLbWtx5ahKBMuQ0AoTRZH6SuFe5YmrTw5LAcxkYUAFjhAhL8VW7kiiYkAagr8/F6T8HhFzYgCYK1Sa4iwLwQpk5g3OV03Vlzp9TdW4kvpMQ2jjiFRZMTNUUNszuZzE4ca4Q/DLqVFHIBzRrd5nrj7Uf9UHvYPnB8rw8HGLHFs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <61fbcf6a-4533-4a1d-ac2a-0c8b2427d27d@amd.com>
Date: Wed, 27 May 2026 15:51:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: remove stale file path comments in
 common/sched directory
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Furkan Caliskan
	<frn1furkan10@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <roger.pau@citrix.com>, <dfaggioli@suse.com>, <gwd@xenproject.org>,
	<jbeulich@suse.com>
References: <20260525102539.27050-1-frn1furkan10@gmail.com>
 <20260526075236.14265-1-frn1furkan10@gmail.com>
 <f21b3696-187e-4526-9c34-bb56e9000898@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <f21b3696-187e-4526-9c34-bb56e9000898@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfc10eb-ef4e-4d0d-88a8-08debc29580a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lGCgFQ7/xQ9HwcEGkMhOMPulmsAoaQsIwSuxAHbEN7G7NliL0xxf7hjxDNrBfdyFqPsjDIlpK7WJk93NIhCE/hzu7Znz4MLvlwGGMoroy29NGsI5KsHn2AV+m0MQcdvTnX2ZpOFkbvndAxz45oO7tuQGv69EB4Vw9+sdk4fQVTJfG9WUInGlhwW7f00/i6FJu8LpL4RY49bVvV+taAKvitJb0sIeqQ9WKSUCmeBs/faw23z/msTnObc3YIuZcEtCKx4M9UtIQj6giBhHym0DxeRQur6/2nsgbN/AqtMYc06foQ/dxtU55Mz50MdjdtMnrV+6ejM53ApeDXrwBdwhQ4dQvZHuOO2/QBakuTGWL19TkRVbqIZDnA+EoFCuwJuQuItWiL0r2totOtCjJRdaYECevT32q5qaioh+KzdNw1nu1nxdOy85e5abtqfb+MabU5yTAUL3xzs2H5HW58iT2QRnCm1S28MjTBNTULe2UrUEzWFhTf1mNcpbOWutQy45//0T/mdsecuIm56thvxLt4tpxFdF4dug2k7Sd//9IjYIQXgGXmNLwVquT96dP9CyuK+Up4Otrhe0Mx/KAb4O+K1iL/oyqs3bFxTRIeZxatdlbER6JpI3HAbw7rP2GP5EGfzmhNuMZ3tXM60dxLswvdyhREb7PjhipLf6XeWewXTtyW2nt479MXw7BIY3hkQWk598FAm36qimT0EvL4GCnqa7mce1OHVRQBvxKSH81No=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7mrwlqb9LoO4fS+M3XSfI+/Lgi+29PCLCTpChCn/6aa/1mnvSLhyH0kz7OPf5qxkQtdqc+oRCfDofrEHs+lNt2otmVKTGsS26s8DFhG2WSTm2Pq1LQkw6rVNzkD7bNjAU7O93G0SHnxn7vgKQcVYkF4FQb4/RUVoay0kB6xesBY39t/TAEytvsFDakUvPS5H33sIFl0S9WkLe0A2X4K7h/zEgSo/ahtASAstSB7HlWYwMrTDot4dsLlNOcxxydEqtSksylO2H1hp/UbMO+5Kj7+ODJrbS0Kfh/iAi3+YgbK80iDwzb5LM96YbH24T28RWipRDY9Yv0BR8j9UbXz15eyG+pJFHTN+lMrCLdpfPleGin6hhR0PNTiiZ0g/qKnEXsyTT2cxpwZgcbAjIQA7IwAT6Cnj5fm1sRbNuvfyEyaZIhwLyB2dDzP4c2kxdsyh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 19:51:28.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfc10eb-ef4e-4d0d-88a8-08debc29580a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271
X-purgate-ID: tlsNG-ebf023/1779911498-42B633FF-75671694/0/0
X-purgate-type: clean
X-purgate-size: 947
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
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:frn1furkan10@gmail.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.com,gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 5BC845E9BD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 06:09, Jürgen Groß wrote:
> On 26.05.26 09:52, Furkan Caliskan wrote:
>> Commit 6cb4b01c03 ("xen/sched: move schedulers and cpupool coding to
>> dedicated directory") moved the scheduler files from xen/common/ to
>> xen/common/sched and renamed some of them, but did not update the
>> in-file path comments at the top of each file.
>>
>> Remove the comments rather than updating them, as they are redundant
>> information already conveyed by the filename itself.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Suggested-by: Juergen Gross <jgross@suse.com>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

For ARINC 653:
Acked-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

FYI, we are in the release cycle for 4.22, and I'm not sure this is justified to
be included in this release. IMO it would be OK to wait for the next cycle.

