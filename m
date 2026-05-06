Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCIwNVb/+mkOVQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:44:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C284D8001
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301310.1575601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXrJ-0002lR-Vp; Wed, 06 May 2026 08:43:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301310.1575601; Wed, 06 May 2026 08:43:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXrJ-0002iW-SX; Wed, 06 May 2026 08:43:57 +0000
Received: by outflank-mailman (input) for mailman id 1301310;
 Wed, 06 May 2026 08:43:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wKXrI-0002iQ-9v
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:43:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXrH-00FGHy-MN
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:43:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faff47-5cb7-0a2a0a5109dd-0a2a4507ad96-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:43:55 +0200
Received: from [52.101.57.71]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69faff4a-229c-0a2a45070019-346539475adb-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:43:55 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6915.namprd03.prod.outlook.com (2603:10b6:510:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:43:52 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:43:52 +0000
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
 b=UivV2WaywKOs1JW7XFbrXEObPuSHZSR2pwni7EkYyEUKh8vhvaStpWGrsEQyxlLucjDMIYtb7WcXtL3PenV84FO6l2XZVexBod5rQifPkDE8M3rFTg0NWBu2fvUdjlAYMFUc3lx7P+KxKNySA5eUZI1gVyMj0JDtMmMRx1nP/hHAx3gEr8+ZMfplN8YTbOtbufT/LaQXkrgEZ/6obzaPh5+RrUAZ61aT2xE5R7U+EwMeN9PxjUfq8qSmvhq7rrbpbCp5g193OnrTPhhfu/BaUoxXDvHquF0ssTL9AHWxiKTQ/iLxmwHASOSvxhEUU5hqBZvNlwXL8z+nHeQ8qnrxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVycNhysnM8nwy+SogsZNGtqJ7e7RtPw7shbmTH/Jg0=;
 b=fLhQmQE1VQ04pGOWn+kzHvaxt32Hp4uP1PIWSMCejSs1kIDExJscobE3jjOxsG1obGhf8My9+mFkNncOTGok8q2tUhVrtsaXa9oPXjBUUepXvgqyAQhfgSipQwk3CqokiA07SLsAK44avDDmDI2UNCarFP1/l4MkBTcRAwruIz8asefS2GwPt0AXZ0YRAozy1X0Gyfv3iFfea7wkDgzcu9eU+rljFw2FmnfF8xyKmbce9KLYT7gOzXQqA9OrK+ob6N+XxVe16Y812Yg95YzuYVABTceLAquyPxlfGAzsEe9o6JGo6aOrPl2QYHHm5zkVKLVWlVlKVLWAJyRSb5gCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVycNhysnM8nwy+SogsZNGtqJ7e7RtPw7shbmTH/Jg0=;
 b=QAfi02YqECSV20265cITDCV77ZU8CUAXwQTKvgt9at3+J8wP/f0gS8SsIegiMS/uK+VB6aVI0xP8YPeBpuxmFTbQOfHV33hFCd+r569RtjERzEwlmdLd0nmPvaC/E/Kd+H8uZJUZw0lwcmQDlceIaKzC3B5WHZePiqF5zYkjg+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 6 May 2026 10:43:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] iommu/amd-vi: do not zero IOMMU MMIO region
Message-ID: <afr_RYYMyJEGkNgP@macbook.local>
References: <20260506073719.40075-1-roger.pau@citrix.com>
 <20260506073719.40075-3-roger.pau@citrix.com>
 <0035d666-2ad3-44d8-a2a8-e612dfd10503@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0035d666-2ad3-44d8-a2a8-e612dfd10503@suse.com>
X-ClientProxiedBy: BN0PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:408:142::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c86a882-f770-4e7c-6f9a-08deab4b998e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t/oIQ13+60+Fb7r8S6gN7EcQLG9qGBLWQqQU4J2qOp3KoIPGIdC1RKbXIFt83x01xqTct7fdqpw/JPASshoG/NlGilCWy3a97txdb33VzIzQfQ7YUJ2RKp6mFXLhThW3YtkxhAgjMD8MbPHljkbII1XamL7HlEuDq+XW+cuZdr8n8AjT5mOBie8PFTI6GqeKjI5v+D914fir5zIhtCoxkRAa2XYrNyFRkYHubRmAnRpEcgAAfzMI6VudPKkQh2eVGxGr/p9h9qSUwhy9dGFIzKVqcKYZdktYKDwjZPWO1Lnmae22Zd+0UMw3pka4DE7ZwO7oD/MgjkuKdildhkG7VWu9pbYDP9IQ8Ky4QIwU4C1pu5wCI2UxdOBKReAC04M9dLtTh6bU3LTIhKjLqwlYltnI1lCRCOtzX5vA+Ob+tHioCSPD15xR55s1m3+uk73FX/YD+TYwa+RvBS+gIiguJTx5QImMZxCM6YpcrLn7OKOD01MYYKOHq7GJmovl4OeiUcDnor9EpwwXUUyjgZj9yf3WXPFXhJNQHqChKEJnffWoHIq9BN47xxmH3+RLNe2cTOhXJ5JCj//eldEcAoeUnUjiTK0vSs+owC9Dh4MOKyeajmVCvkaV0ddO8tEjkY24LhV43bkBDsdckjn8enumNcyPJG1K6AosXfOVAlpn7Q/gC7TtCjS/0W5NGLw2KyXl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0lLV3Z4dW4zWjA4cURkRmxzRXJ2ZzkxbVg3L0pRWnN1YWh5TFNwKzk5Zll2?=
 =?utf-8?B?RFFIL1RzMnhmSDRpODR1WWhVWTJ6UUhCc1NDVVl5RVdRZ0VXTmdRdG1uaE9J?=
 =?utf-8?B?dzRXOVFxZGRKUWVzLzFYWGEzc2NHMW0xTlV5bG5Yek5Iam0rWllhMnBzR3l0?=
 =?utf-8?B?MkRlMGt2eFY4aFp2bjcxTXpTdTRicFFVU0JSZ1lGaCtLUVVGNDFkcm56Mi8w?=
 =?utf-8?B?M1lwNTZYRkdRaURibENSUzVWeFdVUExic3hkd1pmOTUrOHkxMjNmcGNrK1p4?=
 =?utf-8?B?RnhnV3N4cjdZQ3VYaXY5MlVyaUNwN2liVDYzUWt5OFIxWUtxNitEWVZpMjhH?=
 =?utf-8?B?S0FaVCtKdCtXRVNsQmFSUUhNZ3lqMjNlQy9JS0kxYUwzUUZqNmNZbVYzRDVZ?=
 =?utf-8?B?ZXpsY1R4Q0Q3eDBRQWFWQ3p6bkdJd1JQRVVXRnUxU3J2Y3FNTGlKNmR0UUFp?=
 =?utf-8?B?K28rU0NVNnZPTHU2TUxCL2M2c0I5Q2xFWEdnSmdSb0JDQVpNT2laWFhNUnpz?=
 =?utf-8?B?VDJGVE9wTXZ3YWxTWFp3cDMxemtlV00xV25nNy93TzVtU0cwL1FjanFIQUIw?=
 =?utf-8?B?eDUvZm5VMHBmbjZEQW1CVFcxSFZYcHVpOVZkS1ZFSXNyWUVKTCs3VVRBSCtM?=
 =?utf-8?B?N0ltTnJleVhtK1NXTXlaK0ttekdvMHdMcVMvOVJUZFdEL0JoUnBObi9ERGQ4?=
 =?utf-8?B?OGJHdTJ1Mm5uWXFLMk51ZTFzQmkzWVpZNU1QUDE2Mjd5WTBSY3UxS2NLVWVP?=
 =?utf-8?B?bElVQ092VGxuUDgwZmpUcFlWSExHcW1VWDZOZTN2WW9sU2pyZnh6bUdrMjFp?=
 =?utf-8?B?NzlJK3c2Z0JEdXo4ckxtVjRHWjJ5Tjl6dmYyTlRnWEE4dFVQS20yZFRBSWN3?=
 =?utf-8?B?cGNicXBFNnRrMlF4UFAyLzdHdk1DZnd1M2tyRGJ6cU9QUmpxbXA1bFVzTHpw?=
 =?utf-8?B?TGV0K05DbEw2YXhMMVlwSklUR2xFbkxCamVvRzIzcTNYbFJMc0N4MU54cVZj?=
 =?utf-8?B?c1RLelpoNk1QMmNFQmZ1dWszSDQ1bDBXdGFFWnJYdmtTQmVCbys5U1VLdzBo?=
 =?utf-8?B?bHRuU3lXMkp4RVZxdkxGL256azJKb1Z4bUNZa2I2QVBTejNXaktndi9nS3BB?=
 =?utf-8?B?ZThaTU9IazZ2SGI2SGp6TEtsSGl4SjRmQk9heGh2NHlTZUdrdmNhaERpWFhQ?=
 =?utf-8?B?UHFteFpqQUlNcTRwa3paSEFuZnZVQW85eEFmc2hVMEpYU28xUUVUQUpsNCtE?=
 =?utf-8?B?cU9NeTV5WHBsMzhaZGc2Z0RqWTNxdFIxazk4ZWZKOTlCVHdLNFltd2Yrdjd2?=
 =?utf-8?B?UzFEUVkrNy9RektHUCtOTm1STUdxWlg1bnhlaGpZYnFxVVJ1SkM3NUlzYVR5?=
 =?utf-8?B?Rjg0bEFjRWVVOERsN3pmRUpJTHFGNnQ1TjZMcGYzRjU4SWVCNzhoR2pBdjNJ?=
 =?utf-8?B?N3h5SGN4QzdWd0pNanplTzhMaXVxU2FjNzYwTjVLNDExLzlDbVVWa1gyYkJE?=
 =?utf-8?B?Z1FVODlUN2FuMmZJai9Vb1ZTSVhFa0txSTBCS3lxQ2dSdElpbUtXQ3hxVVhZ?=
 =?utf-8?B?YjBhNVJkRDFaanhRNnlBU2ZrK3pyVHJEWktwMlFwT01kSHFOTkgzSlYvTlRu?=
 =?utf-8?B?OWlXRzdKNEorWVVhK2Y2UlQ0U0swQ3AxUDljQnBBL2h2ejFJYkhGZ3ZpcFRN?=
 =?utf-8?B?OEFzeWNmOWN4WWQwcjNQRmlnZmhUVzcrREdPMjUrb05kMTlMUXliL0NVanhM?=
 =?utf-8?B?a3lRYVFDQUlRVzlVbUxKSlREbDAyYTNwNllYSWtQV1ZXWWlybndEZ0dKdUhF?=
 =?utf-8?B?US9SeHBhNlFIOXJMQ2NFcnpTVFZneC82VXBETGV6Nk0zM1NZN2Y5QXZnVnhu?=
 =?utf-8?B?WFkwZnVmMit3c241OUgwNkZOUWpLeGI4TjRRblVrdXBaSUZTaFpDWkdLNUNo?=
 =?utf-8?B?UldCK3p0TFpmS2l4QzV1SURsdmltZnBJbUcrVkl0WFprYUhycDBtY1pRSWx0?=
 =?utf-8?B?MGJJWDlHV3pXY1Z5R2FLYm1GWFpVS1BpNlp0VDAyaHlyeld0MlZZNDBGS0tx?=
 =?utf-8?B?SW9FSU5MRmplbUVXeWVoRFBKS1JKaS9XcHZGVkRXTUFOQmc2TEdaL0R3dEcw?=
 =?utf-8?B?OXlCbXdwVHpHcXRVVVRSZXJkejR4UU15ZWY0bHQyaTFOV0J2THgrWnd6a1RI?=
 =?utf-8?B?RjJGU0xOUmYySmVRVGdyNW9wb01MeUlDaS91aUwyZmx2dERXeXMycEJ6aDFZ?=
 =?utf-8?B?ejVDV3NPamtuS2ZiNzg4STlVcDZvdGtkSkNaWXV4VW1CQmszaE5VVko3T3JO?=
 =?utf-8?B?NjFKYzRmYVMxc2JKR3ByYW1XMzVhMThEMkdqR0xNN1A2RWZhNFRRQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c86a882-f770-4e7c-6f9a-08deab4b998e
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:43:52.3261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06zQCJXH915/SVotgGGE5HCSc8uUw/FV5IA3EwvbV4qAKD9MnjapWSKiTIJDIsyYbj0+MJZYQQyzblBwfQEnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6915
X-purgate-ID: tlsNG-ef75cf/1778057035-AED77C48-5C13F479/0/0
X-purgate-type: clean
X-purgate-size: 1778
X-Rspamd-Queue-Id: 44C284D8001
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,macbook.local:mid];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Wed, May 06, 2026 at 10:28:52AM +0200, Jan Beulich wrote:
> On 06.05.2026 09:37, Roger Pau Monne wrote:
> > @@ -1381,6 +1372,11 @@ static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
> >      if ( amd_iommu_max_paging_mode < amd_iommu_min_paging_mode )
> >          return -ERANGE;
> >  
> > +    /* Read current control register and forcefully disable the IOMMU. */
> > +    iommu->ctrl.raw = readq(iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
> > +    disable_iommu(iommu, true);
> 
> Don't you also need to pre-fill iommu->features?

Indeed, that's done just ahead of this chunk, in the
get_iommu_features() call.

> And with that field's use in
> disable_iommu(), won't we be at risk of leaving stuff enabled which we are
> entirely unaware of?

Possibly, yes, that's always a risk.

> Even if we fully cleared the control register (which
> would eliminate the need to fetch features), down the road a 2nd control
> register could appear.

We do clear the control register, it's indirectly done by us setting
iommu->ctrl.raw = 0 after the disable_iommu() call.

I did wonder about just doing a write of 0 to the control register,
but I think it's best if we try to gracefully disable the features (as
done in disable_iommu()), and then reset the cached control state to
0.  Future writes to the control register will clear any bits not
directly set by Xen.

> Has it become clear which register(s) or bit(s) it
> really is that are causing the observed issue? IOW is there truly something
> we may not clear?

It's not so much as not clearing something, but rather the clearing
itself putting the IOMMU in a broken state which we then can't recover
from using the initialization procedure in Xen.

Thanks, Roger.

