Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLNeGi0OuWkaoQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 09:17:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F52A56B2
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 09:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255865.1550655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2PbO-0005fh-1t; Tue, 17 Mar 2026 08:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255865.1550655; Tue, 17 Mar 2026 08:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2PbN-0005co-VA; Tue, 17 Mar 2026 08:16:33 +0000
Received: by outflank-mailman (input) for mailman id 1255865;
 Tue, 17 Mar 2026 08:16:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U9f7=BR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1w2PbL-0005ci-KM
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 08:16:31 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97f772bb-21d9-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 09:16:26 +0100 (CET)
Received: from CH2PR12CA0006.namprd12.prod.outlook.com (2603:10b6:610:57::16)
 by DS0PR12MB8413.namprd12.prod.outlook.com (2603:10b6:8:f9::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.17; Tue, 17 Mar 2026 08:16:20 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::3e) by CH2PR12CA0006.outlook.office365.com
 (2603:10b6:610:57::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 08:16:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 08:16:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 03:16:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 03:16:19 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 03:16:18 -0500
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
X-Inumbo-ID: 97f772bb-21d9-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffCHkjJsIKuwKRH9Z22A6f5LpzSuvK5MIWj1zJgB7wDn0JAUr1nDuKzFifxn+xGMCt79eGDQeCyM5Txsazp6Ikm9m7q76P3UOipkKKETGYmfkz8tDXpQ2pBLQPvJ0mhSTbzbh8ZdNIjdYdB2MRPncOWv5D5H3QX0OtYWfhme0GOs8GgzgDdfOSowewU39WuV3CSZl6476/mWmIqS+TWoAs00azULH4Y/yLPooY1DrO0PWJt8e1dCYrv5aA5wiY2939kV2Qxve+cATgC7nkmVNUYHhue39oXruWj+sWXznWVIeyHPqZe+6+KRgK1K3Q4JLx/nD34QGf/CRO06H8Gbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2g1VpWtynCcCFbQRfm/X1d7vaggBKUojTzUMnV3lCw=;
 b=uwxu+PwUbSMvzkREiCTVeR9EwyfmdKi10EgoNcPnyiIyHScclpBhaaqYi0Z+GmKk98IDoKyjCwO0g+UT1nuhvFpVSUwmgITVK+OhlRxvI8tvT82zgs4GyXS25oAPlNKWCbdwwwvrJ5HUAbA4d40SOhbm20EhBkVdiztroifJc8Z8j6P9Zw8iW+80q1GVZdswoMX1JfPYuJ0tIK0HKNjEDt4W1sh5frEUFIzWtCMk4aek75Y6pekKzNRly0xKLOlZ59OkboHxrazvmR73ExqQ/WRKcSUpk9SIe0PCnBhvapNAnajFdGzalRwCXgfSDfRc9/6cT6Bd88JVqSgFTYifdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2g1VpWtynCcCFbQRfm/X1d7vaggBKUojTzUMnV3lCw=;
 b=DU4vsyR8mLt2BBAdidmbfe8FxsOAZp/fiqH/I6gDGzjULR+nC+w0D4vxUxPIpUMGrSTE2bMd/Cy+qKYet/csI/CZBTydodqhNruQ2cKyAJD5CXtdFYn2Yei57FM0b+1ChS+FYr433wHhkmQZQxo9N/gx4o+WPdnGYCJlCNG+QNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <f1644c53-4895-40af-b2a9-746592c78fe0@amd.com>
Date: Tue, 17 Mar 2026 09:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/coverage: Drop support for older GCOV
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260316235414.683426-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260316235414.683426-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|DS0PR12MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: fcbad4e7-a88d-4b21-1209-08de83fd7894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	tfGzYTfV3nOEeIP/w3RvtaypaOwuxulA5qA6Pf+bRehh1mfqjBqlRVwNL50aWmcdOSAv2YH8IunZZPfNUaKlyGJOySX3YHabFDM0UEPJ817MY5ovfukAa0MFBLSMbVPCcaKyiq+nS6i7fsQreKJEI7QrL2Q4dUlpSLvFZbkwc0KkWYKMTLOJxtEI1C87T7roukeVBaaQ2yjgaD7+msTRnpdgZeWN7G403M0Kf5PnSyYegNv88zP6w1rw4lOwXmez5uFYTpPSHHFJPFUujqIlIuM8oYUg8x/kqcGZ2NssyreGwbqzeMqBk3QyyOrKYExuhSytpzSmntq7JApkNiLjmx8LPntcZQ5sGKUMWImP+iqPQF+LQm1jNiGb6S0JprIH8pTqpZ2HLPAxvuHXLnPRf9qt6hhf2PjejiBGK+1m4lxbJM20DOm5QkWHyJBgJZSM8Pp09FvloTfJz+r5okuxdJAPjFbxzPASUi2+tFxDW6a6iY/7abO8e6jYHiNkSqiEWDRpoBF6/aoqFVJLVajGfRZyBfMh3Le+9aJ3O0poPO9tpvAF0HpuNijcLyjygTQ2zImrTRyrjErp7S7wAtVp9BIOnBtcO+6U7e6TkGMGZMTaopJ3cNgii4dnJr3dEzhYI2+bAstfZ/TgBqGBi2e6wOXAVwQ8NW+eHhh9txeeujt6ERW/QfAQQ+B+MdobB6jJOzXisNYXAxN6HuBz1AB0uq7uh96CyEWIZdlwcOvl4eJnJFeNE0xRZxpFpNtEszFbUmPvIu5PGvC7qzHmkRSeag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3vjajIqOr7TdelSlsOYtm1gaPeMmeKNtjG4uYJ9Kmf9zeBWyBngT2OXOWf7GH8TLlC4mR8vu0BBDFcyvJKQ1EOgXBfnKjYEPa7CvhdJinmwGQv/tV5Ztv3VwjvJKT3VieAfXR6awNOywhuhq4dnsn66BjW90qbosX/XyMFLFTeEBQJKR17UeDZ6UKgdxd2ak8NGA6WsGzQk3Tb7dTKGFXLYRyXKRFvy+4/HEa8avAl67NiCTroLomuKxTSzaHvhNUYNj+O6KJM3DDTqDqSE9dX+u7XyORfaKhJg1ywm+BqTyRT8r7blEq+j7tZNxfNHMJ+hsk5GS2NG/mCeGZqph/gfpAjyRnx+6k1gayBz90D1wJKImXa02hItHj7ocZ3KPquMaU+vzLYeprTqYUf1Pc2ZrRZRKCGxYT9bYbA6u49udaqcv5D/WxEL8bvxmbaq2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:16:20.5496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbad4e7-a88d-4b21-1209-08de83fd7894
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8413
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: C55F52A56B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 17/03/2026 00:54, Andrew Cooper wrote:
> With the GCC toolchain baseline now at 5.1, gcc_3_4.o (covering 3.4 through
> 4.6) will never get chosen.  Drop it.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


