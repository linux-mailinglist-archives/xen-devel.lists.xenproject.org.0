Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMadL0C/zGmYWQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:46:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A43755E8
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269755.1558665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pLD-0003b7-Jl; Wed, 01 Apr 2026 06:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269755.1558665; Wed, 01 Apr 2026 06:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7pLD-0003Yf-GM; Wed, 01 Apr 2026 06:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1269755;
 Wed, 01 Apr 2026 06:46:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1w7pLC-0003YZ-8o
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:46:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7pLB-00AAHF-Kr
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:46:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbf2a-5cb7-0a2a0a5109dd-0a2a4501d592-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:46:13 +0200
Received: from [40.93.196.54]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69ccbf33-6fc9-0a2a45010019-285dc4364333-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:46:13 +0200
Received: from CH0PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:76::31)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 06:46:07 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::c4) by CH0PR04CA0026.outlook.office365.com
 (2603:10b6:610:76::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 06:46:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 06:46:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Apr
 2026 01:46:04 -0500
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 01:46:03 -0500
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
 b=AXR4cmwKAEzyzC6mUk1CKdDOB1ufGZoTaxpI+2Becepydu+JkK9qrsU+45CB/77EwdFkXsm/UejYGrdCOBKdw30D4tlSPBRdujS5u8z5IsBC5x5LOqj7vogebgyHF4DL3G9Sz5JC5QoOgpHBPRhHhqq/W2ySbltFn2dThD1AAC/I0b2w9D4erXJBkvvfxhRfTLlt/84XAeZiyCl44ZxjdSarvaou3O5lg8Xaa4Cu8cu5yNFkI6axoo1iaQ+wUTza8vVwALchP0d75sqdp1yoN5wQSNbwcD2S4+3ISiLCGDE1ykqs8sSCYVq7l/KWf7gf0mcLEHtyjWIFozE+aWjHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rw4tKnQoOVbwXnrv8HFEfZNhZKyh93a/veiDamHtP2Q=;
 b=UBeD/C4eofar3wGB4bh+G/vMnouLugDbFKV9amNyhdP7Ac9XPQaLaIcmHNrWzOfdCM9jO4NliMsqQ3ssds5FA1QVdwWYT7CCMZkipEbkcBHXEIAze2aCH/41lZROD7Q8VR3UM/oGWl+cbyuAJXb33HLrTdBYHZuRcrn0Bg/vVIFM5OgKZiu47w90BztuteYdmFjhI/2mUNP+zFF6QDDkqNoSJPqwasSmYXH50HzMqivS5XX04hhMVZxu8Y5CR2h+UJa+TRcwJ9kNY/2uNCI3NA2XmyT9GXUkCAASj4aPc47weNDuAYA5xyaZV+k/6KLDYcI06nrLbVlWai1Kv4dZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=invisiblethingslab.com
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rw4tKnQoOVbwXnrv8HFEfZNhZKyh93a/veiDamHtP2Q=;
 b=m4Vu/m/SK3GihQoFK7dusol4WZIN4PsS3H5r5UDxkHkKCLMTPQvyxAMT2y9F17Lx4L7yfr+T24P038XFdC6LcH4reUOui2MsZwS7GVj+8Afft9FW/abPdXw8iyzdowjcJiNMl0bB8vSrlMgPofIXcRhghU4C4/40g9P5222eh78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <bf843de8-dbfb-436c-ac33-ea801ac61b53@amd.com>
Date: Wed, 1 Apr 2026 08:46:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v3 02/13] Switch Linux builds to use Alpine
 3.22 container
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
 <652a2f219b370af5364d8ef29264acc33a89f676.1774999132.git-series.marmarek@invisiblethingslab.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <652a2f219b370af5364d8ef29264acc33a89f676.1774999132.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: a60293a3-52a3-4a06-6c33-08de8fba59c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	4XfCFt28bekcFj2zA0N5AriK3+lHT6ktB4sA7GLWuk9pVg1IOvbPL9XTolKo7jU4lkhLKU/gxX2ZAOlXFHqY8D1WGsPyHO30awgJ0PN+gLvut0rh3tJWg4dNrCfDZlhbDJMPnfz+sRF+Sr1OdNP1775d6bImcff//n90JiIPgbY3h73HfNp3vpGH5Q7Gid1sVTTrrK4Zoim+pkSK/aCzczzku7O54929PaN40mAOz5iFKGqtX5sI9ml9k9FTmonNIhd+NdASrcQhep4nWX1+uq6hyKey86oR7rcnnbJMZfaOdbOuKLFeS4L0b0otuAgc5c2R99Sl6VDXZzg3ks5nKOwWzHfXeA//smB0IYoCippBbgS4hjWSpW7tyq2fUNrya6LKYyEuQG5Wqt1hSJRyUU+YyUcom/MrhItzRD3CcRA+7wNpYAr7+uIe55xs1FX5Dg/NLZ03wWUvK+PxKNj1zASIroOpi35KflGcZ7oDMxA5PZGH9eHDS7HymC5kLSJ5ZsHHtKJiAnHU9/ZToCD6ZbMIC71+IiSCwkKp5ew6SuCmOnJpbxIWjSIzD0eJfrpSyaJa3CdW7oS+PWiL4/7IoomhcNYyCqMgXDJ+Mk4disPQtR2MWgiysojyKUitHWojVo+dEeEr9ASl5CGE8ZAjTfGHGN4bA/az6RAjomz/BFTE48N4l2jWA8STRW+cadzNGuDYaTK8maFSb7bt4Mcq/q7CX7sXQpuRfu+/ghgMZLAIpeA/pB5Fdtmmyvkz5/Y7qei43cS9smfnIpfFji1xkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t51idwP8G0Ar0Or4kkIgq5BTPYnZ43F5kp4GMS6kPSAUhlgIpX162aNnOATKCERpaReix7ZqdHX93X16fjwVFw65srMui28al8xYQ1+rYXdaNrCuDZp+Qw+IAS3j3UVBfV8mYXXMRmOAN3L5czRRLNqA/aUVZnTTeelNVZAfcoA75sbCsGMdsNTaWwRzP95JaWH3VkcMXMTAD9paJAFNLThXV3LdmQapmtIr46Ag709zIIQI1nI5hawVyAfF7Iwi3bTV3Th1mI7AOJF6T/b7WAcGRCT0SjF3cr/X0UMR5rXy6WSRgOBkn4TYeOvIbnrQsGlomfJOyJEkm/lUTmI4mTSp4Smuwx1K1oCKC5hWGfssnDLwO0SPPtucbKnWSJZdW1H8W13VrJ7kxhTXLhl4By3vlpcFoUmFU7SZBwy4Al7u2Ci02uPkrLgUcIvKzxCj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:46:06.5200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60293a3-52a3-4a06-6c33-08de8fba59c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
X-purgate-ID: tlsNG-d62444/1775025973-174FE185-BB7B4374/0/0
X-purgate-type: clean
X-purgate-size: 836
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 342A43755E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Why not 3.23 if it's already there?

~Michal

On 01/04/2026 01:21, Marek Marczykowski-Górecki wrote:
> Slowly phase out 3.18 one.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 17d25ce0f921..36622c723ce9 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -21,14 +21,14 @@ stages:
>    tags:
>      - arm64
>    variables:
> -    CONTAINER: alpine:3.18-arm64-build
> +    CONTAINER: alpine:3.22-arm64-build
>  
>  .x86_64-artifacts:
>    extends: .artifacts
>    tags:
>      - x86_64
>    variables:
> -    CONTAINER: alpine:3.18-x86_64-build
> +    CONTAINER: alpine:3.22-x86_64-build
>  
>  #
>  # ARM64 artifacts


