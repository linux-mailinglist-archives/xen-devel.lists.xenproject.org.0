Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DBBD298E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142194.1476376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8G25-0000Tc-U8; Mon, 13 Oct 2025 10:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142194.1476376; Mon, 13 Oct 2025 10:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8G25-0000Rt-RP; Mon, 13 Oct 2025 10:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1142194;
 Mon, 13 Oct 2025 10:43:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZn2=4W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v8G23-0000Rh-PY
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:43:59 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82f536e3-a821-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 12:43:53 +0200 (CEST)
Received: from CH2PR11CA0011.namprd11.prod.outlook.com (2603:10b6:610:54::21)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:43:49 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::91) by CH2PR11CA0011.outlook.office365.com
 (2603:10b6:610:54::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Mon,
 13 Oct 2025 10:43:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:43:49 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 03:43:46 -0700
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
X-Inumbo-ID: 82f536e3-a821-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f28le4UyXclV6DRDNk1CY4pTeaDDtUphCdDlaOWzQhumsGEGA8LZhREK4UW7RFUzSp8koBFaPQ21St3PhXpqEuIznCjP4Yft+TXjznq86Fuiczw1XGj1WDGcBPXBt8sS9qwYEbo/r0sXuYEIEPVNh0FO8KdhU4ro8Vswo2JoBNEFs22LRUAOJiB/VouO2tOvzV6vYzZONGrKi/XcS8hn3xbUASdIcd9Nmo5ruPgvdD3GdlfjsH7TKq7rUNb3fisdTNDFemakyxgjmR4wGX4McpriBcreUmnMiCaOGGcmXK0TCYLE2qoHFuhm8HyLVYKIU5BceMObGcoFPuTVaL2B1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3hyAGuYKXHdIyltTIG0zCrXJWunGtE8jaDPWRrTg5M=;
 b=ALlDhj/beekt6koksfgrt/+euw3LRuH1G/y9N7zpp/dphffSYTAo+z7rDufdiiX6yiwyf7ARNNaVln19tZmnOgY3pUDX3aKp69NmDCboWwhOirO+9x8pbfJ8/RQAWYbRZNmMg4wlarjddfafTAe7MbNlpE8IEL9JiugziH5VCt9iABimgdq2lfKpHggZQJqDLu+MEGiUv8wJ7H/SqhStW0e0WeJWAO1MjeAkITk4sKA+QU/BOX6Ua0ngjmRKFvXzijTiGCXfQmoOoA0qoko9W0svmtDjLnCRt9/Tq3q+Ykf2MZ6JfhsZV1w2naLgodWcO4uwwKUBHF6fNhDBorIZ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3hyAGuYKXHdIyltTIG0zCrXJWunGtE8jaDPWRrTg5M=;
 b=xKLFmp9Zdb5892v3FYP9SjzkM3TAv+a/ykb/L8qXDzKF1rWmYop+XRqYV9FD3KXYUCalPP/ACmXMq6GvnOjaypxHWxQiSGxQ/pnDGeEX7uvS0MrCy5Wy/w22fcvFCtCZPTSOcu5QNu0xMeo5iWidqUnuugCrmmNpVAreHrAvH1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Oct 2025 12:43:45 +0200
Message-ID: <DDH4S89FCPOF.2JQM7OUYX3YH6@amd.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] xen/domctl: Fix double domid_free in
 XEN_DOMCTL_createdomain error path
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <37561a9a3b6000502bb1a43651f6ddc49cd9149c.1757759941.git.oleksii_moisieiev@epam.com> <3ba29020-3a9b-4e10-8523-82bfb63482f6@citrix.com>
In-Reply-To: <3ba29020-3a9b-4e10-8523-82bfb63482f6@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|CY5PR12MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: a686552a-4f9a-4eee-1536-08de0a4564ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWpmbHZyL3RuY2poL2FTSXl3eE5jSEJab3JJZVNkSkV3NVRFWnV0T3M0QTF5?=
 =?utf-8?B?U28yOXRSNGdBaXdkRFNTVHN1c0dhYmZLcFFJRkJzQ2xEa1VyV2NTQXBTTG43?=
 =?utf-8?B?WTRQTU0zT1NOTTFpNGpSWXhidElQa0hIaEo4NzJITkVmMXhDQ1RZNXRicFFx?=
 =?utf-8?B?YkUrK0xmV1Y2QzNBNmY1Y3ErWTFaM21XY2FvbU5XSUpqcUY3b1FzRFhndS9u?=
 =?utf-8?B?M01DSE90YWhYMS9QcWJya3ArU2ljbURQbDNFNEZVQ3hTYWFiMXl4c0VtTTlj?=
 =?utf-8?B?cWs5S1FvQUkxcGwxbW9KcDRhM0pQMUVtK1d3Vm9yQUNYeHBTWDlyS1p0Zk04?=
 =?utf-8?B?NStxSEhEUUZSVEg2ZFE5MW9JcW8rbnFqK1lyOUJqYWVScmYxWEdCb1lOdEgr?=
 =?utf-8?B?TDIyOG9maW5MQlB4UHI4RXMwUjQ0QlBhaExFNzU4bzRuM2xiNisrWkwyODhN?=
 =?utf-8?B?T1MwVjFZUmVCNzN4c3RkWmdaNGlQNVZ5dnFrVFNrN3o1d1lTSHRRVXRqd0tk?=
 =?utf-8?B?MzdoSzNhTHJnZkhkWTVqMEFxNHVZRVdWY1ZMQmFKRGNBa2FPbXBrc0ZnTmpQ?=
 =?utf-8?B?cGd5L3FqOXRia3NRNDVYdExOalE2amQ0cnBIRWRCUFJRa1JsdUdRSkcyY1o3?=
 =?utf-8?B?SHFSUHZxTVV0bklnZHg2ckplU1RRTmpiMjBGUVNRZjZ3bGR2alVKcFFCc0M2?=
 =?utf-8?B?dkpFd0M2aGZWeE96aXVDeXE3dkMwd3pPdmtUSUdqdGJrMFZDNkU5ci9sUStB?=
 =?utf-8?B?Q2hqbHRldElsRnhLU3FiQWNLWUQrSEx3OGcycDdvM2h3aHQvR1BaeURzSzg1?=
 =?utf-8?B?bGdkVm1ZOXhHNDNhVzJkcnAydkdvZExlSTNFSnplT2YvV1JZZm95MmFxRjJn?=
 =?utf-8?B?eDFrbWZ5SHdXazFTTHdLZ2xBT0lmRmxiODErOXN5eW1IY0FqYmdkRlMrYXgv?=
 =?utf-8?B?NEFCMmZBRGk4eDZoVjl5M052QmozQ2VRR1ZsN2tmaW5YK2RlQittZ0tXMVNE?=
 =?utf-8?B?bzBHeWExaTdWMVN6WU0wQjdTQnVseVRNbXppOGVNTVlhUUxVYXhkZHMzMnNN?=
 =?utf-8?B?SytRQ2VkamdQRGxiNXpBOEh4dDVYeGdYOXc5MkxCY3ZPMGFiUHFCTTNYN1ZZ?=
 =?utf-8?B?VDFnYk4wTkZCVXNrOTVqOEthd3JsSWFhMnhIeGRDUUxLcGkrcUk4cEdlT3NH?=
 =?utf-8?B?dXRqNlYwWm9EVnhVa3g4dUF5cTNKNGMxbXR2aXFqYkhrZitIV3kyY3p3SzNP?=
 =?utf-8?B?V1B0cTdVbmRIUmFrN3lTdXRmNU1OUFNWcUVLcnRVQ29UcUpwdmdMT2wreVZC?=
 =?utf-8?B?cUliTXExbTdMT2tUQ0dudmdjQlVWNjZlOGdOQ2NBcjhUbDJnTjVtSHRDdkF5?=
 =?utf-8?B?aTJCT2g3anl1MThFR1FaMnM0T2tJSzJiRk52Z3JaTmZBZ29hc3haNzUwSWkz?=
 =?utf-8?B?N0U1dy9LamhibEFCVEVYSERvdXJBQnpNQ2dCMTVUcU81eWJpclN5UjRsaHBD?=
 =?utf-8?B?SzVWNmJncDlubDFoUlJKamtvTnhxRmRMVEthZUdFUUlJa1pzWGYwS0hBeW1h?=
 =?utf-8?B?bC95SFpXNld2dkdOS0d1T2lVeFZ6c2hyNktBWlJmQWpWNGJqaGVSK0xibUJW?=
 =?utf-8?B?dWk5eWRMeXovOTRtV21FNHZiMU55S0gvekYxYVNQbjNVQUtVNWVCWHlVWW8r?=
 =?utf-8?B?OGZHVUdTWXE3RHRLWUdoSlBzcnl0NEZsMU9kYnNrRjVTdjdWejY4Mk1POFhV?=
 =?utf-8?B?aDRXaDVmVDVzUUs4dUlzWXZtaEdwNkRRQkhvYXF2SXNkMWYyb25TUjdLcHpi?=
 =?utf-8?B?cFNGdEMycWFjdlFFcDhjV3M2Uyt4czkvSWVsZTlNZkZxckEyVDM5U0daelFx?=
 =?utf-8?B?cVZISDZDMkZ5NkNJVjVERFYvOTdEWU5oTWg3WWtpMU8rUlNsZ2REZVhvUmJU?=
 =?utf-8?B?ejJSVEdiVnp4aHZrVFpKTkF5M0U3WDBvOEE4MkNmczVxVEpnbzBtaDVuV1BU?=
 =?utf-8?B?V0k2THluZW43WVM5Q01VZTA0ZGZ3TXhKOFkrUEhyNGhHTVJBMzhNSStxZnha?=
 =?utf-8?B?NjFEWDRSUzJWSHAwSG15eXNYOElKNm8rLzFNc1lzakE5Y1ZSS0hqeHArWnly?=
 =?utf-8?Q?voOk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:43:49.2641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a686552a-4f9a-4eee-1536-08de0a4564ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202

On Sat Sep 13, 2025 at 1:56 PM CEST, Andrew Cooper wrote:
> On 13/09/2025 11:44 am, Oleksii Moisieiev wrote:
>> Remove redundant domid_free() call in the XEN_DOMCTL_createdomain error
>> handling path to prevent a double-free condition.
>>
>> When domain_create() fails, it internally calls _domain_destroy() during
>> its cleanup routine, which already invokes domid_free() to release the
>> allocated domain ID. The additional domid_free() call in the domctl erro=
r
>> path creates a double-free scenario, triggering an assertion failure in
>> domid.c:
>>
>>     Assertion 'rc' failed at common/domid.c:84
>>
>> The domain creation flow is:
>> 1. domid_alloc() allocates a domain ID
>> 2. domain_create() is called with the allocated ID
>> 3. If domain_create() fails:
>>    a) domain_create() calls _domain_destroy() internally
>>    b) _domain_destroy() calls domid_free() to release the ID
>>    c) domctl incorrectly calls domid_free() again
>>
>> This double-free violates the domain ID management invariants and causes
>> system instability. The fix ensures domid_free() is called exactly once
>> per allocated domain ID, maintaining proper resource cleanup
>> semantics.
>
> Fixes: 2d5065060710 ("xen/domain: unify domain ID allocation")
>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> the tl;dr is that domain_create() either inserts the domain into the
> domlist, or cleans up after itself.
>
> The domid alloc infrastructure is problematic in multiple ways, not
> least because it now means there are two sources of truth for which
> domain's exist, and they are not interlocked.

The source of truth of existing domains is the domlist. The source of truth
of domids is the domid bitmap; and they need not match.

A domid being allocated doesn't mean the domain exists. Merely that the dom=
id
is unavailable for allocation.

This is fairly important to allow fallible boots, where some boot-domains a=
re
allowed to fail construction for one reason or another while preventing the=
ir
domids from being hijacked by a later domain, and thus prevent some resourc=
es
granted to those domains that failed construction from being usable by othe=
rs.

The actual problem is that the lifetime of certain resources assigned to do=
mains
extends past the lifetime of the domain, and the mere possesion of a domid
grants authority over resources assigned to the domid, even after its assoc=
iated
domain died. This is wrong and bad, and has been wrong and bad since before=
 the
time_t was 0.

If it wasn't for this messed up means of resource management we wouldn't ha=
ve a
need for preventing certain domids from being used. We need saner semantics=
 with
the lifetimes of event channels and grants. And possibly more resources.

Cheers,
Alejandro

