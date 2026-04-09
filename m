Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFn7EXCh12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:54:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382A3CAA44
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:54:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277284.1562498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAotG-0003SL-6n; Thu, 09 Apr 2026 12:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277284.1562498; Thu, 09 Apr 2026 12:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAotG-0003Pa-3K; Thu, 09 Apr 2026 12:53:46 +0000
Received: by outflank-mailman (input) for mailman id 1277284;
 Thu, 09 Apr 2026 12:53:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wAotE-0003PS-IH
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:53:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAotD-005WOX-Sr
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:53:43 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7a14a-2eae-0a2a0a5409dd-0a2a4503ecba-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:53:43 +0200
Received: from [52.101.61.42]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d7a156-02b3-0a2a45030019-34653d2a4a58-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:53:43 +0200
Received: from BLAPR03CA0081.namprd03.prod.outlook.com (2603:10b6:208:329::26)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 12:53:32 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::d2) by BLAPR03CA0081.outlook.office365.com
 (2603:10b6:208:329::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Thu,
 9 Apr 2026 12:53:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 12:53:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 07:53:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 05:53:32 -0700
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 9 Apr 2026 07:53:30 -0500
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
 b=IWGl0q7hJuK6UeMBaBvB+p5fmAJRDnr7enONSDsQS7+TKeYgpnThfiSwP3sNHFMxRODaiYlPIF6Zm5GXo36rLMDFt8rLj39qoI88be2XPtta9xUnrAtAzJNCGTVg/DyXai5hNY/Rs6te58gxNLccPuuixa3ZxFE07plRMzvG6v86gV5kCsN0Er/y9VzYZPE9VoKIss+IzYVm71/8oAXd+incrVyVsRc4mlatcaaroju1VLXarjh401WuvIs8XJsKR2di2rpljkGpdynyyYyQpsM6i3T56Fn2kcWOKp0B8Cc0EK7qXoszS/zJYZ/lnkPEQtzoyGCvnHDfFUC76CF5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpTCFJTNVn3cepBCTQQNLq1I8sssaVC5/ZeAGynFNfc=;
 b=yx08/UfeW2pVSN0zgcIoMmNbhLZiTjojs5yIh54cA+RsAGSi3I/ezIg4xOzdY+JONdZdpR9DHLsKVYWP8PT752Zz13/i/W+ASUxm5c3NtD8jR5n2Pw4mol6ko3zcnGj8TlBdgFu6rabMK3nyuenqyH9KWEDtkYiYueukZonHnDNYjq1lfuz4kRzUZlWiGZvj0Nq9plfOUovDwTVov9KQwzGEFI+C4KsM6Az2kPo74uKazZaTe0rWuoF1zUUoU1FWdKviz8sTpEv20VgBmYsnm1Wu+P+i/671wTO+7mI+a3Pz65feB7lbFevK4YsFxOmldI27txkfL7r0IGUFjQUDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpTCFJTNVn3cepBCTQQNLq1I8sssaVC5/ZeAGynFNfc=;
 b=TX75dKAB7vaP+gr/9sRVxgw63pIWvbdWJrGjwIYhGxjsexjePncitbYKdEU/L7fSq3p2ugNXAzg+8cPz3+4VzXD982NGJYaahhghSQdZONfJ+nWgy+lUSakZm1+WBI5tjW5vsB4uXFdYaPg1tvqr1MQse1G9aYyxsb54NEnuZys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <43995524-5c3e-444c-80a1-849e3e1d9430@amd.com>
Date: Thu, 9 Apr 2026 14:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <2ae13059-e0ba-4cf7-bda0-9a21cd428509@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2ae13059-e0ba-4cf7-bda0-9a21cd428509@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: df2c70e7-85d4-4146-b256-08de9637019a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r+7K9PUjl9AE3Ed7h8aYXV+2YwELLhopjHvenw4P6Jbabo0MhpEwhhsoI6qWlQCV2jL8Yzgme8HBoevTnayqUl80cKTyY64Uaefk/jqrx7tenfGRRgoOW2nxSaBYcuwk4viCzm2UX0yhn2JieMinoQodCurmWQv2Qf8iTa3B5e9QIzvtCMQPnNbiuZc8b3rqeIn63aeOXE9xrdV8k2Wr6GuQV4Nn/j7fxntJ/Iy0WlmQ8tpWjN2MNAvbMFs/FPsDYTSebHU+TC7Z9QdT1cugjNDh4aplbFoP+/cTzgrpD7iUGf86reHjOVv51Zj5sGxqUIR3x7HMQ8aTrRWA3B+G6u3UFByeFBpepzRBykJVdelsmNsrncBZifWn7r89Ysyj6nR1feBPoZAb7oGXr3s+dmK0uK0Lj8FXDFeOnNE1cPcCqPh5ynCYzP4kvbBiYJVMQyRaWHF/vr9C6vqpe9ta1SJ4UscWpW7o1SS550hlCBdJCWHjZ+xqvZqDe26ML/Y0zwHyrHqRamWB4qA39oPptUMgEb/YekZ9EroOzskUu1/sCkpVzVnbhT3GKAa0kR+WcniuJWRSOx6wwwJfUBD+pLsD7CBUHpBAlQq53aJPoerubCAqL0H5KWfZPyg9BQZo5OE6+ePJEmnKC+gCxD+2PMmE/qB0iX1DskzXTnT88nUvR+8IRWqxIww82xoPlsI3kE6Es5JS47tpuwadJ69sLgWTiGG7wWYFp5qcCPbhbgo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JLpEPDp0ACAnB6eoeZGoPIloeJjEhvfP4cj1aYGfE6qWRCazgctirOqat1TKi8sTMEacwV1PnRTb5icwbujWgOzI0L/3gAl3sRjdKNeyT5pMTygw86UitcQIe2kC8dw5y6T69TPiFGzctZMdN6L5TpA2CaajW+aTbnyWGfvuPrGur7iozQcvjK0RJYeotUBcySlMWN26vDndSpMh9br3IAWt0KT7MMMdCElOIRxkAprJxy3PDE1pr3NJXr2kqmCgykfqNJVJ8zIikMmwd7v4huwYZOUhzzMPYdTt3DvEzzZgYtVNZNRhrVqtEelXMscYaM4/UIfxapGUODUUEWgemUUnY6bIlKfvjYiu5Qr84O2cfE9k5BBkzAN5qR5c3h0xI3WUzQ2W28USxC8BrmKSD7qCx8i2Sax4xwFoCHdWhRbj3uZf9JU5l/MgBCJs8jUc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 12:53:32.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2c70e7-85d4-4146-b256-08de9637019a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268
X-purgate-ID: tlsNG-33051d/1775739223-CA520C9A-E5E3A19F/0/0
X-purgate-type: clean
X-purgate-size: 1921
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 9382A3CAA44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 09/04/2026 13:47, Andrew Cooper wrote:
> On 09/04/2026 12:39 pm, Michal Orzel wrote:
>> The check uses >= to compare the total number of colors against
>> max_num_colors (which is ARRAY_SIZE of the colors array).  This
>> incorrectly rejects input that would exactly fill the array.
>>
>> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
>> for dom0 would fail.
>>
>> Change >= to > so that exactly filling the array is permitted.
>>
>> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/common/llc-coloring.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
>> index eb7c72b24023..30c1594dac9f 100644
>> --- a/xen/common/llc-coloring.c
>> +++ b/xen/common/llc-coloring.c
>> @@ -78,7 +78,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
>>  
>>          if ( end >= NR_LLC_COLORS || start > end ||
>>               (end - start) >= (UINT_MAX - *num_colors) ||
>> -             (*num_colors + (end - start + 1)) >= max_num_colors )
>> +             (*num_colors + (end - start + 1)) > max_num_colors )
>>              return -EINVAL;
>>  
>>          /* Colors are range checked in check_colors() */
> 
> This boundary was changed by
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=cba8a584de171c8c4510709c2edc9f1cf86b21ab
> because it was off-by-one.
> 
> Are you saying that the analysis in that patch was wrong?
I examined the scenario that is a default for dom0 i.e. dom0 gets all the colors
by default. This is equivalent to setting dom0-llc-colors=0-15. If I set this, I
will get a message:
(XEN) parameter "dom0-llc-colors" has invalid value "0-15", rc=-22!

I admit that I added wrong example in commit msg.

~Michal

> 
> ~Andrew


