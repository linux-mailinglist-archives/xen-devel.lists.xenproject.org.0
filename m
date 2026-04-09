Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMDUGMxe12kCNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:09:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1433C785E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 10:09:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276796.1562104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkS7-0007b1-4Q; Thu, 09 Apr 2026 08:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276796.1562104; Thu, 09 Apr 2026 08:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkS7-0007Zk-0R; Thu, 09 Apr 2026 08:09:27 +0000
Received: by outflank-mailman (input) for mailman id 1276796;
 Thu, 09 Apr 2026 08:09:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wAkS5-0007Yt-DE
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:09:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkS4-000gJf-KE
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:09:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75eaf-e002-0a2a0a5209dd-0a2a4505de66-26
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:09:24 +0200
Received: from [52.101.46.59]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <roger.pau@citrix.com>)
 id 69d75eb2-3760-0a2a45050019-34652e3be9da-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 10:09:24 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7653.namprd03.prod.outlook.com (2603:10b6:8:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 08:09:21 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9769.014; Thu, 9 Apr 2026
 08:09:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVDEqEqriwoihwW8jPkx6Grl6xH4lsUtSmRnRlCazO/6q9IM2lB9xunPAvKdikkXzuRBWJyDqRxFls59fRw3RtjK6tolR29C0AWFE0IjBn9Gsmc1FI/YxgNABhcIFA3Kf2AYvvBgGNjNsdwJv9Yc5ggLmOvG52/bmv3L+AYhsTyvYEUxINP8Ye4Let6FUoRBHl0DePuH3IHjq/Z3sCnsb9XXEXvl967zzoJAoAepPzy73Oed97dox6+lUSVj2KySWno8l1u9MFc2n52V/upHcO0cYdbBecXP2NGxA5RODnJw5a55TUoIEjgRO/2Z+6J+iX7sAoEqrtXTe7gDFLKiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl4In8M/dS3DGCtPmp6KkKZvPtzKXfkMeLwqaqijPDM=;
 b=ZhH1odhu3YfTvZ4c3BHMBmpN0HVsVGV4bcXH3JC0qrpUNw7COp2MVrX+Z0oDrkPGjZtKjwH3gSeAv01W5n200mPwJvNk7ii3GGrqGuOSe/iLg1U8YzihuERWkEzTJZv83eGedFJOvtcUPT71N+hl+EGoMrSnaRtzLh43gt8LF9+w7ZySQOVdjzKWXQ9XJN4ojsCx8UmfaYXDAFySacFFxFfv2YZhwMVqJ8JZ+QbqNtlzpSY+6bGH57J5k+nNIbU/7TUSSNVDpQORv4bxG1Cx0vfNlW6GrDtK9eJurddhWhqYr9eXamoSS39UMI0eeMqhmXNTskXOlecwNA8mqgr86g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl4In8M/dS3DGCtPmp6KkKZvPtzKXfkMeLwqaqijPDM=;
 b=ByUbBd6IX0fYTszsuYDSERPXCpPqAlGZ4ni3oFadhSNCzXshGPZL2tbe5OQhdYZr1bPNLV3tfQQ0s/pxyYUNz3GtohkUt8xJ9rdzB1CXJfabz585cSLAuGfbAoyeWLYjOcxTX+n4Fx1hDqZ9MdiFRuQEDVrsaMvF80g5H4F6oIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 9 Apr 2026 10:09:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/3] xen/smp: Rewrite on_selected_cpus() to be lockless
Message-ID: <addergb4PBVIAhQg@macbook.local>
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401163521.3603665-3-ross.lagerwall@citrix.com>
X-ClientProxiedBy: BN9PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:408:f4::11) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 3038ee71-8426-4fe4-152e-08de960f4da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	85X/zcWqI22xtBgjjgOf+lgXcwGlqxNjfdZufYyIinwEwfYhXNQAVC5uidvSyD8P+wUKD1h3HYRce6kQMMLI8qgbK1/MrM+BedEnky3neuTVsbgIPJ6gCO5/8zoQN1TuCxt6BV5xaZVw4eIZgp6fo9TOF+2cSmPtSM5DK8vrQzOXfsfzULqQBBuvnLflPJ8UKyMnyxhv0tON4qRYBnt4tUOJJmajnRMug70a6R/dclhF72TxMOzyQJPeP9jsfrxOcojxY8JLLwrIHKnGKWlKpd+hq9/xTumoHfWkCK3z44yTgtSA5fiywKug+exBH0Y/3ssDCiLxhYinsnX13/WhmOAuArWWYUfn+dHlrALHTsQR7gojHQVLMIptVNUQ3mrZw9xfvjGvJ6eTV9zt1U6KOaTzc1trN0z4zXvh1okrQvJLG9OwoZ0BTL5o6/oH9WDGv10ICPI4Q5Ucnc/d7fNgfI4qvU6V1V17qFcxYkO95/y6xPrP0RsztOixrnq8JfTJP7zdGWHDN8vm1qF5fe2yrYxsGL4QfziYlBAobtQHDKMof2oj6a0nQbrCd1LkX/GXOXcDqS1JoGGFwmePGemfqA8drm53oMrYhCidVb6Cu3rn6oCbcP/hH5glGC+j84Nd1hxkldCWFU59J3SD52+rewzzdwyv7L4y4rTu2Ni1kpeSEYY4mOe6RnuyqkuL7jiL66GtWXNzHGCCPWnePEBcqZtHRYR3FMpSx7r3Mp2iBcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHhMZFQ5YVk2Ly9iVTIvcVpQMEhlMklRRnJUQnl0bXlaZ1A3NDlUMDFHWFFK?=
 =?utf-8?B?SzVWa1pRNmNYdW1naVJMaG8vQTFrTVExSFl5TStuK3hNTDNGU2xhUkFBV01i?=
 =?utf-8?B?ZHNZVUpEQ1ltRDMyb3RCOUQrckhiRVQrTFZnZkROZEhLSjF4alpTaWZCUXU2?=
 =?utf-8?B?RUlTSnVUaGhDSEs0NnJXdlJ6N0RZaDlLRzQ1RDRIR21WLzQxMlViSStPbGZm?=
 =?utf-8?B?b0x6SHBpczdsRU94cXZKQnFWVDcxZGoyY0Q3Z0ZJdGFVcWFCR2J6SkJuTGxn?=
 =?utf-8?B?NzhXZEZRWis3OTVTakJRWFlLeW5iVUlXSExUSzFiOW9oajVxTVl3Tm1jcUpJ?=
 =?utf-8?B?SEJWVDg3OFhwUUJxeXBVTGJqY1YrN0kzcHBUTlNCR0kvNE9XaS9JcmtFMzZ1?=
 =?utf-8?B?UHB1VmxCYldyOTVqWi8rRC9VMFdERWd5UnVTaGM3Q08weUh3WFB4cGZQR0V2?=
 =?utf-8?B?eGFBT3R4dzlDT00zOEFPdzdOMkEvOXI4UzNxZEtjMDN3SGdqYTNGTGJYWjlL?=
 =?utf-8?B?dEtBVjVCQTQ5TlV2UjJXNzF1clB1OW5Fb0tTa3ZMeTJ3OXg2YXZZaWZrUngy?=
 =?utf-8?B?ejhMN1NmeGI3MEw1ekdTbnU3SzdZU1kwL0JueXRYNUpWSUs5cWRzYi9md3dY?=
 =?utf-8?B?N1hZR2JRMjdwYlpPZGhZdVFob0drT2F6akZBekVPM05IelJpVzJpQWxBNDBn?=
 =?utf-8?B?YTRKQUdYSXZ5VDdETUlxdTNIL2JSWTR4UDNhMXJTRTVKeHNLNHlyaVJzSkNE?=
 =?utf-8?B?RW5tS3hyTzBrb2x1QTNlanNtQ2JDWE5TVDc4QXNreEdlOVcyM0tMMmhZK1hW?=
 =?utf-8?B?SVk0MGh5R2wzYTZFdjJ3alEwbWZERXpaeEozcXE3Z0s2M3NBU2ttVk96ZjRR?=
 =?utf-8?B?TjNaQzc0eGVzdFVFRFhyc3ZsT0hFY21IMXJCQll2alVCdUtnbFVLMWptREJx?=
 =?utf-8?B?Vkp4MzI1OFRRTDhlS0c0a2N5aTVFdDJTc21RUFQxUWVxbWtMekdhWWgyVzlD?=
 =?utf-8?B?allQWW5OMGJ5N3pYdXRNcG9qMzR6aTNYV1RWNGtUTmhzc09KSXFWUnZHOFdy?=
 =?utf-8?B?NXA4MFU1VUxoMmpIZklhbml0RW5GTGhaL3c0UzRhZlJRNEhCM2ROUUNSRVdp?=
 =?utf-8?B?Y1d1cVdvdmMrZ3NZT3NUSHRuZkdRcVFhdTFzbksxUmZWeXFFWjdvNWZjV3Ew?=
 =?utf-8?B?d1h6YWhCYmNBTWxEUENpRnc2NXVoR0pnODRyV3N0ZU1SUkhzT29Md2NjSnpP?=
 =?utf-8?B?R2JISG4zb1JWL2srcHdpT0IrdHZ5RGxxRmJPSnZEcE1XeER5bGFMWGNwb1U1?=
 =?utf-8?B?eXJ3a0FIVFZBY1E0RVBkdVBodnVCcjdvM2hySndZZHFnNnhQdlprMmtUVXJO?=
 =?utf-8?B?ampzdzdvbGI4aEt2UERKbit5NzVBeGgxcjN4bXM3MmJmYXFDcTUxQlFuL2cr?=
 =?utf-8?B?MGRFN2xLVWxzU3JFU2o3Wml2b08wVVRVNDJ6aUYwQ04xUnpaL01ZU2Q5WHpx?=
 =?utf-8?B?RE5CR3A2UHk3SzR2MEFDNSt6Qk5jdExXY2RoSUFlcDBPOXliSGpuVGx3VUxk?=
 =?utf-8?B?YUJiMmQzNDd6Y0tqVk5QMTlZSDlabjM0UG1GQUhJLys4bnhzMlRMa09Ma05G?=
 =?utf-8?B?OVN0VlViWm0waDVGRU1PNk9xNU5tMUNxOHQ1NFJkR1d6dGI1QXlmNnVLeWIr?=
 =?utf-8?B?UUJFeS9iVjBhZHFjSXpnY2JaYXpiVU1Jb0xhUGF3RVJqVFlMWTRMWnVHZVFT?=
 =?utf-8?B?RGg5c2RyYlhYdUdsQldnTkZhelFiN3RQd1YvSS91YUthcEZqZmtLb3JsL1lW?=
 =?utf-8?B?MEMyZzZMOEN2YW1BUVhYOEtRTEtoTU5SaFRrY214SDRpM0VqUFlueWhJZndE?=
 =?utf-8?B?NTE3Nk4zYm5vU3Rsd0I3cjdERzduc0JCcCtKWlB1MWtaMjM1MlI5V0JHOUgr?=
 =?utf-8?B?bTVNTFVKYnpNVUVHVjZONmpNTUhIcytISzVmY056UU1zMUJiUW4weDRhWnhN?=
 =?utf-8?B?dEg3djMyUkZLU1hGT3VyeURRaDdPYXp3RkNjT1VvbWxkODVnUjI3Z0JCTFE1?=
 =?utf-8?B?V2Y3eU9zQzhOZ3huRXpoa0dTYWZ3eGEzZlUvaGR5UjlsaTNYaFRxRytJSEIw?=
 =?utf-8?B?WTlEN0RGVnp5T3F1SXMzVHZ4T00zbkxaazQvOURZTlZBbUNqWGpMRm8yaDEw?=
 =?utf-8?B?WFRTSmNZSHU2ZXQwd0lCNksxYi90bm1FcndtejRzWTZvbjhXODZqQ2QySVdw?=
 =?utf-8?B?cDJCTXZzSU9DamlZZlRETC9JVFBZYzg2SlNZYThtWWY5YWJmc1c3T1JwVzZ2?=
 =?utf-8?B?Qm94Yk9OQW1yc3lqcFdFRWthaHRTT1dQcE1GWkRvSXFEOWtmOVVSUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3038ee71-8426-4fe4-152e-08de960f4da7
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:09:20.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNrkXacb6qahvdRMooyaH4rCmc8pCUDisvV1c8ppVIgG0YynTmGa5wBU/q39sWL0HrXJMpuZuF/IyLuuW7JBPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7653
X-purgate-ID: tlsNG-c201ff/1775722164-3979296F-ACFD7DA9/0/0
X-purgate-type: clean
X-purgate-size: 1320
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE1433C785E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 05:35:20PM +0100, Ross Lagerwall wrote:
> on_selected_cpus() holds a global lock even if the function is to be
> called on non-overlapping CPUs. This is a scalability bottleneck so to
> avoid that:
> 
> 1. Remove the global lock.
> 2. Make call_data_struct per-CPU.
> 3. Track which CPUs are currently running on_selected_cpus() using a
>    global CPU mask. This tells CPUs running the interrupt which per-CPU
>    call_data_structs to look at.
> 
> Since the call data is now per-CPU, skip waiting for CPUs to "check in"
> for async calls. Instead, delay it until the next time
> on_selected_cpus() is called by which point there should be nothing to
> wait for.

One concern I have about this approach is loosing the fairness that
the usage of the spin lock provided.  Without the spinlock, and with
the usage of for_each_cpu ( i, &tasks ) to process any pending tasks,
it means the tasks from lower CPUs will always get preference over
the tasks from higher CPUs, regardless of when they have been
queued.

Ideally we need some kind of mechanism that can do a FIFO style
processing of the pending tasks, otherwise we are introducing a
performance penalty to high CPU IDs compared to low ones, and that's
likely to get worse as systems get bigger.

Thanks, Roger.

