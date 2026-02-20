Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GLOK3IpmGlqBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 10:29:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2871663F2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 10:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236953.1539430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMob-0000mf-Kn; Fri, 20 Feb 2026 09:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236953.1539430; Fri, 20 Feb 2026 09:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtMob-0000kg-Hd; Fri, 20 Feb 2026 09:28:49 +0000
Received: by outflank-mailman (input) for mailman id 1236953;
 Fri, 20 Feb 2026 09:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtMoa-0000ka-2g
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 09:28:48 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d221a6d-0e3e-11f1-9ccf-f158ae23cfc8;
 Fri, 20 Feb 2026 10:28:45 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by SA1PR03MB6339.namprd03.prod.outlook.com (2603:10b6:806:1b6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 20 Feb
 2026 09:28:41 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:28:40 +0000
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
X-Inumbo-ID: 8d221a6d-0e3e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTrdWvTFuX+Jt7s2eAjWM120lORCNKsdER56YoArSb8yLaGBesgKJo/v39ziHdYHIIjosuPPfoTj27gWgsvHnQall9Q1XbQ/sa4bwtIuEQ2XZlpcgh/wEIuteuKGL/vyjbW/SZ5sx+H92BRZovsiiHp1Djy6e8iqAcuhh91vOLfPa9ip776FjMvxbKbsj10iOD0sfMTjhVQc5I0KVfApDG1STj1fua6QrP7mXNOZ8EC/Kt/fgVlzR2Tzwzxh9SVb1CwE2ov1O48wKRaCy0P9zXL/NcFDYHdZoCzxUN00cyOuAbhNHZpBjMs/hap8INx/qzmOvr6tVrqjL84ufoS7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjPgYlu4Sdq/NiqSWWbU2KUELamqcQiCdR9k1ufeGVQ=;
 b=DxyUgTlOYrYvkWqNUDJEMcBxbGB441OL99UkV8Ngp+ZRyuMCg8w3seFC34o36iTa0hQyOgOf4DSNVTlnRMyTVbqWwWRxk3C/LfWKY0G9QPL/yjjBRqTyYTnWL2ZEIohCY4AIKlzeMAk/mXd2ANEttAQ33r+HQhoyl6o5nbAy5acU0YAuOXREj6JrenYKjZV9XB+LZBwGPPhYdAHjty4HetBhMs4bS/R51oowf2mYJn3bLc/rI3b0KUtfdPiQ/Yx0wHMN4d0OLbTLkPPglE4gmlcr1gHD3ZGM7bJdHSUezU/qDSTNIqTHphK4rPtgynKK3vI0O0zdOTJ1nS/xlCw5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjPgYlu4Sdq/NiqSWWbU2KUELamqcQiCdR9k1ufeGVQ=;
 b=UoM0geQAUGycdep0rHdkfFilqyeg0Es7YoXUVFYyv6Pf1K6qeIhpeNnnKJAfWgd6XrEr1M8Gb1rGG//lN6odfEQEjwown2nCakA/aF94GPy3YUS8folzI5tzIscSp9Nj3MfrcYj8ZHWEffOdGTI+t3sNfWblaD6rkGFZ9IQBXQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 Feb 2026 10:28:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v4 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
Message-ID: <aZgpRAXefanISluT@macbook.local>
References: <25c65557-c97c-499c-a698-571e40cde563@suse.com>
 <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <67b1f190-a7a8-4cf2-89ca-7186204f0b56@suse.com>
X-ClientProxiedBy: MR1P264CA0063.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::30) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|SA1PR03MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ff5bd9-feff-41a5-092a-08de70626ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmJiakZuNUFySFN3My9aa1FkMnltN3dsMWFFVVRZMW5BOEE2dnQzZ2M2VHlG?=
 =?utf-8?B?UlJobVRTNWhnZndpZUZXYS9ycE40bU8ralBHaVJ1L05RMTAwejhaSU9JSWpI?=
 =?utf-8?B?WHRFdUY1ZU9iU3BYVFd6aHpMZ0p6NmVxWENJNHIzd054WHVINTVXbFRGZjBC?=
 =?utf-8?B?VjNHd2l1MG1XaUNXdmJ5Tkp6LzBzUUY5dVZGR0M1Rk04TFZ5dkFJM29FdDY1?=
 =?utf-8?B?Y0pGSWdEWmFqKzA2cWpXaFZsazZpa1ZoVVRHUitwREpaZGErTGNsRDhnbmpU?=
 =?utf-8?B?UmZCZVovVnhZVkgwdXJaQmR5d1hLS2FMWkp1d1l3dGNVVzhhYnVzVm5XRkpu?=
 =?utf-8?B?N2VWdmExMkl4WVVLZTJjeXMwVG9yMXNFenNHdEU5RXpTQUJXTkNWUHg5clZN?=
 =?utf-8?B?NTJvOVFRckxsRXlpb0t0TmVBbW45OFVMQzVWNFJ5Uzk3UmR0TXpCbVArdTEy?=
 =?utf-8?B?TW9nMVV3TUgrcnBXc09haUxDNWZyN3Z0bzVLa2QraVJ6TStTMk5vWHd0YlYr?=
 =?utf-8?B?NFB1d1ptQVQxMDlaUXZwcUo3ZXc0YVR2QTkvYWU2TU43VG5rYUhMNHRhMlVB?=
 =?utf-8?B?cUtuOFhEVzZpcjdjdDQzeSs4OXhPQ1BLN3VjZTFTcGJOR2RVZk14VmNEUno5?=
 =?utf-8?B?TXlhWmdHWjBibjVQeWhONVMxaGlqVEFrdko0cXM0ckFiWmdQemxvdGxOZnY1?=
 =?utf-8?B?VFBEZ3plV1R2Y3ppY3BRSElEQWFYV255TUVETUdSNzBqTGRmbEdSYmdhYW40?=
 =?utf-8?B?TkVkMlIyaXdYNW80NnFlRmp1cmx2YTFrb205OW1tRjVNOWVKRE11a1ZUUmRV?=
 =?utf-8?B?eXBGYmJEdFNLOTdxSTNBVndIOFZVWksyY0NxWWFiMHlIbmRPMzVkVmhBS1Fa?=
 =?utf-8?B?b2xVTHoxM0dnYTRzUkdVc2JJMHBLNWVsUUgrbXBqTmlwMys2bmd6MmdHaVc0?=
 =?utf-8?B?eU50UFEvRWtkblJaZS9XTWgxcTdhRTM0cGx5YjRGN2pQelFBUHNHMFhyVWpz?=
 =?utf-8?B?cFpMMng0QjhydDl3WGR5c1JmeHFSelRXWXFaZERyWUY5dzVaOXdJdlBCaGF2?=
 =?utf-8?B?S0tBNEZWWWlpSHgwQlh0aThPZTlvNzAvQWNpSzZEVkVyRlk1dGIrd2hrOHMr?=
 =?utf-8?B?M0t1ai82OFRrMWU5RU1iTVBJT2FBeTM5OGJUSXhlSDBieUQ1bHNhSDAwK1F0?=
 =?utf-8?B?NmxaenpHK3llN1k2YUZ1eWpmZnRaYU9LUnQvazc5b3B1VFVlMWs2alZBWjV5?=
 =?utf-8?B?TGV5bGE4TjJvdlB4QnBENnNTRFNvWkhHVlJlVFhpRHg0di93dGoxeWtPT0g4?=
 =?utf-8?B?c3Zra05xUHVnQU0vL24vNEhuRmM2aXg1bnhvSzRVeVZ2bnNyNHBvWUxsNjVm?=
 =?utf-8?B?RjQxMTE5dW5LNUQrYVBIek85Y2xzRFZVTkNEOHVDd3RGcVZGcHBjcVplSnpn?=
 =?utf-8?B?Yjk3ekpPdFZXelpwLzA0ekFZc2h0dmlpQ21qL2NibGhjK08wWkNLakozSzdG?=
 =?utf-8?B?S2x6SDdzMXN3ZVZxd1FObEpqenlqRDZ2ZDRHSFBCRlVhTkZZYnNaUGUwTXVM?=
 =?utf-8?B?RmVSS0dwaXdnTnFUL3NyS0RQcHdFWVA0c0tmak9waU4xdGdZUnhEN0xkWmJT?=
 =?utf-8?B?ejRGM3ArdmRlTmJWNjhKWEwxa3R5Y1RyQ3o3aEE2M0JxcDlCR010a3lCMDA2?=
 =?utf-8?B?Rk9UUTcraElrWUsrN2dkZXJESStXUDdNVjNaeUl2bUlQeEpRYS9Zei9EUWJ0?=
 =?utf-8?B?cjFTa1g3cVRrd2tuMEh3Q1VOR3dVa2U4SGsvVHFtdXlidW8xV05yeTlUYm1y?=
 =?utf-8?B?ZDNQREtkZHFJVjdITDNBdVgvUnQyaGFTc0JOU2RZV3NPMHJNT2taaFVseEly?=
 =?utf-8?B?VzY4RTRwSUx2eGxuNHJNc2FQYWxCeGdHSHMrTkludGdRNTIrcUdaTkJSbnNh?=
 =?utf-8?B?d1pGZEVHY1U3aU1wZ3J2WDZDY1BzWWV1eE5MazRUODJ6WUdvWnZUajd4elQ5?=
 =?utf-8?B?dHdZSVpGYXRUN240ajhSWVNZczlPUDl1SjIvVXZMQVlsMnpQZDIycG5Hc0JF?=
 =?utf-8?B?S1M1d1dwbEdRRk5zM0VEQ2xoYnQ3ZU5yUmZ3eTlTb3dFVXZ6TGhRQmtJakpK?=
 =?utf-8?Q?93+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm9wTzE5KzhtRzFPTFR1amdpWGNiSmZoS1ZwTFpvcnUwMThTSUg3UjZYRVgy?=
 =?utf-8?B?MmVkTkUxcUd0dzRQekJwV1NlSkVZaVlaTkxjVWFjT0kzM1RHVGJtakwyS05y?=
 =?utf-8?B?Q01mdlBtYlRwN0k5YmVaWjcremVHL0NVcWRZZjlqd0VIRldQRUZiZkd1UVAw?=
 =?utf-8?B?MHpNdW10Q2tVWkoycUpuMTg2MDd3aVBFeGJRS1B0NXowbk5aL3dOeVRhdVFl?=
 =?utf-8?B?cnJmSFVPMWJYeTlheW9vQWVOMFlZWFJDVEgzSEVXWlZpaWdVUkRzVTQyMmpD?=
 =?utf-8?B?M1pPalRoQWFtZFJZMzNvS1FEZERsMDlCY3FyU1dmcGZCd3RCU1NtYkZqMFlB?=
 =?utf-8?B?bmlYbDJaeXFsUXhrQlp1aVhzbzhXN09xUC8wMkduck5VN3BqUlJ6cndGWGJt?=
 =?utf-8?B?TGloak14cWZMZkJacWxXWUFQNzRIbis1SEJpd0NQQU92T3ZpMmcxNHNsa3hQ?=
 =?utf-8?B?eFJhc1VTemo3NUJLUXRwWVdHWER2bmF6Ym0vRG5aUWlwSzFYUDZaOHZ5VE5J?=
 =?utf-8?B?ZTZkeEZLeVFzNEZPVkJIbENKdVZjSjI0MjNZWWZEL3BXb2YyT0E1QlVhS0Nn?=
 =?utf-8?B?WEdFdFV5ak5PeEJjTllsdnFoanA1SmhYdDVROWwyZGRvNStSdk1EdDQxUzZN?=
 =?utf-8?B?RFhxeUFCWnhvUHlNblpVSFh1WmhyR3Y3Y1B4OWw2a0g1LzBRTE5BQUY2SVl2?=
 =?utf-8?B?bC8ycTExajc1TmttSlRDNlBqR1kweDV0ZHpIRUpjTk9rWHJrNWoweXVXM3RC?=
 =?utf-8?B?MnlaYnhWUkZkS2x1Y1hLZlpKN25SRmY2K2Fqc0NuZkVSbUtJM0RJUWZCZVo3?=
 =?utf-8?B?VUZhRDhlMEdQQm5xMEVxSy9LbjlsUit3NGdaMVlaYlZpcnBNeGh0UGtkZTlm?=
 =?utf-8?B?cUxaSGw1SVlPbUxlcllqU25yMHlnVEtQMWIwSFZGVjJmemxHU3I3UE9hT0xP?=
 =?utf-8?B?TkdRUzloL3lySzF1SlNxRDdIZkRJRDE5SWdvSlB3cENITXNLT3VQUnZoRmFR?=
 =?utf-8?B?K3hVUEtCT0REdmV1KzVhYUwzSnArZEpuM2VrNEJUeEhtckR0dHQyR0kyOXA4?=
 =?utf-8?B?Mkw1MHNSTWNRWXBMc0hoYVRlRUdDa3RXVENIMEIrbzgxSWpha0hPZEwrVEJz?=
 =?utf-8?B?UCtqb2N3emwyaEpScGVzVTdlMEFiRXRFcWdxQmhIbVVxS2JzdHQ4eUNjajRC?=
 =?utf-8?B?a24wNWRpdXUvZTFxWll2Y1A0OW1FQm5UOGZlOCtnbGNWQmNRMmQvSkF1MWYw?=
 =?utf-8?B?eHNpd2pWRTBBTWxkWW1oZWt5WGhwS3lRVzBFb2loVjNmQnNQdFk3REpWaWY4?=
 =?utf-8?B?a3puQUJLSTRxR1hnakpVelkwdVhlK0U2RWxNanlFWXkyazlvSDg0TjBVZ1FP?=
 =?utf-8?B?M3Zzb2hDNXptY3JxaGZreGpYSmRhQjhnRkkvUFlPLzR2aVM0UHQ2UnI2Q0R2?=
 =?utf-8?B?cWFtd2R2cWlHZWpQVEs3TWZjU0lFOW5QQ3ZoU3F2akd1WFlPQ3Y0eUw0N2Jh?=
 =?utf-8?B?TGNRYXAvT1dVV0wwdW01RWw5cXBTVmhneG53a05ZQUptSTFQK3VEb1RPckxO?=
 =?utf-8?B?Y2JoTm5BRTJibzV0N2Fidm5NQm05T2thOWFpbGs3Qk1hSHhVUTNRbGFCL0wy?=
 =?utf-8?B?Z3VRQjdyZzVqVWlJSjhKZ21pVWxhUVI2R2lDK1lxbS9wVjBOeDg2UGNqMUFT?=
 =?utf-8?B?cE9tMk51TFN2K00zbUIzanBnVTVEbldkNE1wWi9UNTF6Q2VqcjNsdGh6YWJN?=
 =?utf-8?B?OGNuMnpOQjUzcVBWU0JyaU1xWTlwM0pQVGVIdDFzd2gxR05URG5QUE1SMWtF?=
 =?utf-8?B?emdCSkVnM3BRSENDNE1SVmg0STRkNGs5OVgvTW1xWDFLUE5OZ3JTaHFBbk4y?=
 =?utf-8?B?UzVvcUc0eHdkbktOZ0tGMlZQNkVHTkg5ODJFZFRIWWdidU81QlFuektHekRK?=
 =?utf-8?B?bldGWUNiR3ErTHZ6VDcxZmFXa3NxOThUVzRESjFNZ0hBdC81QnlrdVZyVmVj?=
 =?utf-8?B?RUtkMHdBU1Voa0w4N0M2MjNIbUppTjRrMkFjNEx5OTMwRFR3NG9SbjVkWmhq?=
 =?utf-8?B?L0Nuc0x2MTFLSlRsZlM4WWFiVmJmdGk2V0VMbG81NGxwUmNIcEtFSFZBSStk?=
 =?utf-8?B?Ukp3aEZxV0t4UXpidnd5c2wxZ05zZWJ2aGZKNFlUODVVeTFsVzFQa2liMkJZ?=
 =?utf-8?B?VjBYM0FrL3RQOTE4TTY3L1QwZzNEOWZyNU1pZHcwenhsL2VoZFI4c3lTdGR0?=
 =?utf-8?B?Z09kQkRiNmtBTm5DR1FUY3BReWh4UzBrR1I0U0xEbTR2ZGUyZmNQbEd6eUkw?=
 =?utf-8?B?OGcwRkJYaXQ0YURnbTdJSnBBNVFhVVdHZVhOOTBzaGtuV2RqQnYrdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ff5bd9-feff-41a5-092a-08de70626ee0
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:28:40.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lbEojz8jMZo0kdzqgEaRdcuWDZz4C/JlHZSNGwgTkuma5lxMV5CfB5oEZwy+dxBAapjwJ4Vu71LowT74CkBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6339
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[macbook.local:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0C2871663F2
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 11:55:34AM +0100, Jan Beulich wrote:
> When Dom0 informs us about MMCFG usability, this may change whether
> extended capabilities are available (accessible) for devices. Zap what
> might be on record, and re-initialize things.
> 
> No synchronization is added for the case where devices may already be in
> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> vpci_reinit_ext_capabilities()'es return value isn't checked, as it
> doesn't feel quite right to fail the hypercall because of this. At the
> same time it also doesn't feel quite right to have the function return
> "void". Thoughts?

For the non hardwware domain case we could deassign the device from
the domain?

And print a warning message for both cases.

> ---
> v4: Make sure ->cleanup() and ->init() are invoked.
> v3: New.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -8,6 +8,8 @@
>  #include <xen/guest_access.h>
>  #include <xen/iocap.h>
>  #include <xen/serial.h>
> +#include <xen/vpci.h>
> +
>  #include <asm/current.h>
>  #include <asm/io_apic.h>
>  #include <asm/msi.h>
> @@ -169,7 +171,10 @@ int cf_check physdev_check_pci_extcfg(st
>  
>      ASSERT(pdev->seg == info->segment);
>      if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> +    {
>          pci_check_extcfg(pdev);
> +        vpci_reinit_ext_capabilities(pdev);
> +    }
>  
>      return 0;
>  }
> --- a/xen/drivers/vpci/cap.c
> +++ b/xen/drivers/vpci/cap.c
> @@ -285,13 +285,16 @@ static int vpci_init_ext_capability_list
>      return 0;
>  }
>  
> -int vpci_init_capabilities(struct pci_dev *pdev)
> +int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only)
>  {
>      int rc;
>  
> -    rc = vpci_init_capability_list(pdev);
> -    if ( rc )
> -        return rc;
> +    if ( !ext_only )
> +    {
> +        rc = vpci_init_capability_list(pdev);
> +        if ( rc )
> +            return rc;
> +    }
>  
>      rc = vpci_init_ext_capability_list(pdev);
>      if ( rc )
> @@ -305,7 +308,7 @@ int vpci_init_capabilities(struct pci_de
>          unsigned int pos = 0;
>  
>          if ( !is_ext )
> -            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +            pos = !ext_only ? pci_find_cap_offset(pdev->sbdf, cap) : 0;
>          else if ( is_hardware_domain(pdev->domain) )
>              pos = pci_find_ext_capability(pdev, cap);
>  
> @@ -349,7 +352,7 @@ int vpci_init_capabilities(struct pci_de
>      return 0;
>  }
>  
> -void vpci_cleanup_capabilities(struct pci_dev *pdev)
> +void vpci_cleanup_capabilities(struct pci_dev *pdev, bool ext_only)
>  {
>      for ( unsigned int i = 0; i < NUM_VPCI_INIT; i++ )
>      {
> @@ -361,7 +364,7 @@ void vpci_cleanup_capabilities(struct pc
>              continue;
>  
>          if ( !capability->is_ext )
> -            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +            pos = !ext_only ? pci_find_cap_offset(pdev->sbdf, cap) : 0;
>          else if ( is_hardware_domain(pdev->domain) )
>              pos = pci_find_ext_capability(pdev, cap);
>          if ( pos )
> @@ -376,6 +379,20 @@ void vpci_cleanup_capabilities(struct pc
>      }
>  }
>  
> +int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
> +{
> +    if ( !pdev->vpci )
> +        return 0;
> +
> +    vpci_cleanup_capabilities(pdev, true);
> +
> +    if ( vpci_remove_registers(pdev->vpci, PCI_CFG_SPACE_SIZE,
> +                               PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) )
> +        ASSERT_UNREACHABLE();
> +
> +    return vpci_init_capabilities(pdev, true);

I wonder here, in the context here, where the device is already
assigned to a domain you likely need to take the vPCI lock to safely
perform (parts of?) the cleanup and reinit.  Otherwise you could free
capability data while it's being accessed by the handlers.

The only current extended capability (reBAR) doesn't have any internal
state to free on cleanup, so it's all safe.  But a cleanup like the
MSI(-X) ones would be racy, as they free the structure without holding
the vPCI lock.  I think we need to be careful, and possibly adjust the
cleanup functions so they can tolerate cleanup with possible
concurrent accesses.

Thanks, Roger.

