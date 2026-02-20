Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD4XAyxMmGmaFgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 12:57:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C01167617
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 12:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237052.1539522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtP7e-0007hB-Id; Fri, 20 Feb 2026 11:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237052.1539522; Fri, 20 Feb 2026 11:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtP7e-0007eY-FJ; Fri, 20 Feb 2026 11:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1237052;
 Fri, 20 Feb 2026 11:56:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rFK=AY=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vtP7d-0007eQ-6D
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 11:56:37 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3458af38-0e53-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 12:56:36 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by CH0PR03MB6196.namprd03.prod.outlook.com (2603:10b6:610:d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 11:56:31 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 11:56:31 +0000
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
X-Inumbo-ID: 3458af38-0e53-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTBNHB8FNxP05/5sNKkeY+hTpjYZGOz+o7ziruXeRXZJ7ad8YJCrKD/OY0z/5CuaBEFM5nAfwkZ0jhjE12bd1W8B3/48E6681slgACujWNmR0BeFH2lqDXBUi7qPfdYBHlDzUhOl45zIZxgmEpGzCKWXVsaSkXmFPyy8/wjZJqzw+q1/QEK72wMlR0/BhDAVCTVkbk5n79mt1t2/esEwREcs8M3Ez4yrm/I64XmteD7oCdYOjs5TvN3K+sWv2JzNFaB4fg+prBm6J6EYUtMvLP2S20jexv6A+DJU8mM1uw3wfxxaw/y0Oc+8X0etimwiNRsytAkOCJjAOd7B7XQCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgqyFmxbU/ZnklkizziErMyDZ9QgcerDMgr20FC6Tus=;
 b=ipNdLQtkM+JEBtXU51M5BOhSIaMW2kpP2+8nPnLSDhP3ax6DNHsmVrr72CF9jYqYaBdSjQcBhhBClSZbleOtIjLsCbph+8dCCKMP7TI83JeLbV8fJAyyh/yeuEm4iePnOFlNkEZxxJEW7a6RtptKzlj+spCQBlM33Rbo9lyIY2TfJYyLtbNskAV4w234yXS9FpiH0DOl+GaSGJM+KeVxkhmIA+kshzwA6GyxFbgwlhYfqE19VHeGeGtBwu9C3Shtlhr4SVbDTCAq8UagxYsoKKFWboIaXUDlwU43rl0ysrqGfjib0hDZPD4R6ZSVSY9kvBOU+blRFl1K3FgSScSMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgqyFmxbU/ZnklkizziErMyDZ9QgcerDMgr20FC6Tus=;
 b=QBBRP2HboFV8+OfmBxk9E8z+zzd5pdIW5CWrQuogLhmROvlXOhWA1X1/qsGc2vuSJHCfSSFy+l9fYub7XovztkgweXCTO/xYIfbohAzzwTypnL2QjxwVvrxxTwOnXZOJ/tTZQ1YEgHYRsJXIjNSDjbRkzG3ywytQri7LhqLisyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <66bbd1da-3db4-4040-8ca5-d53eb78f59ee@citrix.com>
Date: Fri, 20 Feb 2026 11:56:28 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] tools: specify C standard explicitly
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20260220004344.1980775-1-marmarek@invisiblethingslab.com>
 <aZexPYiQ5UF6t5uz@mail-itl> <1415f4df-8191-4e94-a60a-9b7f0f2599be@suse.com>
 <aZgzJkTdGtHdKwHd@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aZgzJkTdGtHdKwHd@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0193.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::18) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|CH0PR03MB6196:EE_
X-MS-Office365-Filtering-Correlation-Id: 399b1aba-b6b7-42ff-59f4-08de7077166c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVYdnR5TUtEOXlzU3FjRm9nbWpuQUNPcVJkQml3NzIvTmJ2S3JiTnY1ZUdm?=
 =?utf-8?B?YmtxcGgvWlpyWEpVQk1acktxOFhlSmVsa2lEekJWdTVMei9QKzYrc0xKbXdY?=
 =?utf-8?B?SGtTbTNCVkZCWVZWeE5wR3ViNElhNzJTYk9iVjhNY1B1MithUlRYdjNIK0tH?=
 =?utf-8?B?UkNzVEJaTEgyZmh2aGdBWW1uR2FxYzdyL2tYVGI5U1lBWjdPWTkwUTNSK2tG?=
 =?utf-8?B?Q3d3OW4wWEVFQVFuMnhSY0phMVJLL2NjVisxZ1B2Z2U5VWhiUS8rVnRaNXoz?=
 =?utf-8?B?aEV0THljVXpySE1KNjJIcEFuUkZPcjRXV1JCSStkYWh6OFlSbEZTTzg2d21X?=
 =?utf-8?B?a0NHR3F5T3pMR25tRzRRZDJoQUN6YjBXSEV2bEorRzBzUFdYajJITVhRaHQv?=
 =?utf-8?B?NVdsRjF4MCtnZndmN3o0akcrRnlUWVVodUEydTdMYUU2VU45aGJvaTE5Q2Zp?=
 =?utf-8?B?dEhRMWRBT0hEM3ZPOFQwVk5od2pyVlJCRzdjeHJsdVh0UFl0UXpNWkZHeDln?=
 =?utf-8?B?UUlUVVFlWUhvK1EybTAvQmZ1N1VmamJobGJobkNYN3E2WjJVZDVDblgxSWRk?=
 =?utf-8?B?Rmc2Z2MwWGRJQlFuc2JEKy85SUN3WUhmV1pzMS9ROUx2WjVvdlRFT3NtczZi?=
 =?utf-8?B?b0lMWmlCbnRabEY2Nng5WmsrSEMxTGcxdXlpemtMb1UvamVSeDBPSTZaZ0sr?=
 =?utf-8?B?a1M4Q2x0ZVRodktlRmVOQzcxaEV5RjBGOWhvZDZpWnJZSVZ1ZVhtOEZzaHJJ?=
 =?utf-8?B?ejRHTS80Z1QzS0NpSU5tWUx0YkJhOGg5N09rT1Z2QUxQbUVhMHdLR3pEa20x?=
 =?utf-8?B?bDVvMTJkZUowdnh3ZFU5ZzVERlpwS2FyKzVNQkZ2T0VsSjRLdWJPK3B6d2VM?=
 =?utf-8?B?ckxoOTVuSDF2cUVTbGRwWFo4N3c1aTlZeEpBMGRDV1p6M2hrNU9qaEZpaWRv?=
 =?utf-8?B?bjkyNmc4cWczNEFZTDh5VjZaQk4vTHlwQjdTbnFQT2wvalNSZElGeTRCYjZr?=
 =?utf-8?B?OVdsdm1FNFNMcTFDTmhWbTlZa1VsUDRRcjlldGNHaTEwT2ttMXpXSmZ2SXVR?=
 =?utf-8?B?eEpVY0xvL1JoMThkWGVJajhZcWV6QkdMTDhDWHBObEFZc3ZmRDd6V0FXZ2lz?=
 =?utf-8?B?bzVmTzdBRzVJSExoZVk4SHdBQXFZZ0UxSkl4ZUtsOHZMajh2a0QwVUxRNnZ6?=
 =?utf-8?B?VVBQN0tSSnMwK2RoU2FNNUttYmN5dmFkNzhYbHl5b2FQSE50NkhRRVpWdlZM?=
 =?utf-8?B?aGxmUDFxVnBtS3RScTdFdTJvZkVPdzMvdnFaQWJUSXk5T3lkRVY4RUdPQmdq?=
 =?utf-8?B?SHRRV2duYnRpclRIWWg5Wnplak9RWVg0K1FFelowbldpZnZ4dmthamZOeGsw?=
 =?utf-8?B?R2t6eGlrSjE0ZVpqWFErczUrNlNGU3VmNk9RVGNpQzVRdENEaXBmY0dmMVBx?=
 =?utf-8?B?Z1ZCWEgrM3ZpM2lZekxBV2YzWldBU1hnRDdKSFdDLytRMnFyeDZKZkNibkhu?=
 =?utf-8?B?OHhRd1c4MTk4aTkxRzVzM1RaczVVMkR5QVR6M3RNSXVLOGRCV0Fkb3pRT1Fp?=
 =?utf-8?B?ODZRN05Kd25ZTG5naDhCUXdubkpGbkFuaXczcUMwSmVSc0xHMmVHY1pKMmJ2?=
 =?utf-8?B?RzVCQWR4VDR6YThob05RUm5wWVN4Rnh4a1M1bks3ME12cC9KT2Y4WlBvVEJO?=
 =?utf-8?B?dURiZS9KanhkWXJyWEkxaHBTeHhSVGFQamZrdjM1bzBwRjY5R3RNUVFDQVRR?=
 =?utf-8?B?d0Y3MXlSeE8yNDEwUTZjVlZsWUIwN0ZRTm9TNzQyTWtuNWlJMmVETWxDb2tL?=
 =?utf-8?B?VFR1ZEZ2OG0zNlZqelpxSlBSS1NOU3BqOE1VUnJzbVhQU0RmdkpYSVNYUUta?=
 =?utf-8?B?aU8zTGVOZUlwZXpFOTlQVTEvbFo4TjRkZFlPMmJKTnNodnY2MGc4aEVLZ3RD?=
 =?utf-8?B?aEgyb1NtNlNhZVZXS0h6REo3eHZwSEFXcFBSUGRJZHpycklEQTN6Tk9pbVc3?=
 =?utf-8?B?c2JzZVlCalo4WUdhblNUK3pYY1hhS1ltTDVCNFhhamd4OUN6Y3NtYlJ3UlNU?=
 =?utf-8?B?Ump4bjJRUFhGN3BjaGFya251Uy82dHJCTjJQWkVlRFF4UUN6UEpOZ0tUeFE4?=
 =?utf-8?Q?AWHI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEFNNlprZCtzMjExa0RzSmFyeVFtblBSQkkzZ0pKai84OHhpdUlKaVZBMlhS?=
 =?utf-8?B?cE5ySGE1dkJwTHFaSndZcmVydlFtSUNudUZuaGs5aC9mckVCRzdDOENNdnEv?=
 =?utf-8?B?dGVuaDg2TWRiR1hBUCtsUzB0OUphZ2tlSlMwV1hjeUUwUjdaRmRkY1BIUEl6?=
 =?utf-8?B?WTFibGpGS201ck5udVZhUEJ0S2E5alFrTzNKejZWYnAxYmFMK0gxdDFUT1BL?=
 =?utf-8?B?VEswbEJXNWo4dkhNeUFwUDZ5VVphZWovdVl2REN4RWZCTytKMHFKYVRSVnQ1?=
 =?utf-8?B?ZXZSd1FTRnRGclliZ29HdjloT2hSc2dycXNkS1NZU3FHblVpN1dRd1VKZkdh?=
 =?utf-8?B?U0YrRzYyTU5wTDFTOHY4ZTREN05WMWlsbmxFQitvYWMzclA5UU9xekkxZ2tn?=
 =?utf-8?B?Tmd4bzhsZ3lJcnhnYnM4OUpsdy94SE5OeHZEZldENTJoTzA1K0xTU2ErYUEr?=
 =?utf-8?B?RE42UnFPQmtnVTI5RlRYWjZrRm5MVFU3TDlPQlNuc21uZldJVTNDbEQ5ZHNB?=
 =?utf-8?B?T2pjVmI4bTZoV2xXUkdOdHNDaXpHd0FDZTBVOFYxOXZ3TEN2dlA0RkR1Zzh1?=
 =?utf-8?B?ZzR5K3RVOWQwMmZrK0l5Sm1ucUsrNFRFTWJOU3pmajVyLzd2VC9UUUU3T3Y3?=
 =?utf-8?B?RHhuUE9sdWkwSVN4ZTlTMXIvbE5USDY5UUpvSmZ2NTl0UTlET21vYjZKSTRw?=
 =?utf-8?B?d2E5cFRGa2ozN3Z6N0NobURYSjFXK1ZhdVozS242NkRZN1FQaHo5M3dhVCs3?=
 =?utf-8?B?YW9leVRSR0FIcmxUUnB2ZU8rSzQwN1NhUlFkWHFyaHF3QXZ5SW0wd1JXck1C?=
 =?utf-8?B?c0xFbXNwK3hsL0xNZHR3K3ovYy9uUWR6V295TEswRHYwSUhaSzZSTWpZcEQy?=
 =?utf-8?B?ay9XMWZuR1NmcE9sdlJoNExmRVkrbkxSMlFqL0VqYWFiM3pTZEVoVStjTG5C?=
 =?utf-8?B?Q3lLN3V1SlovVlEwZkZsMjRaVWpYQVNuZ3J0WndLa3pWTzlzK0p0OFZZeFJV?=
 =?utf-8?B?OHREYmpsL1pndTdoek1WbXJkYnk4S2ZrbFNLanVyNmRCVkw3bnlYMU0zTGQx?=
 =?utf-8?B?dGJOM1lSRFIzeVR4L2gzRjl4V1NhS2NtMGd1SDV1eGdTSUQ4eXMvb2VGUmZk?=
 =?utf-8?B?MUtzUCs0VlgzM3VnZGcvRzYvZWE2ajR5b1h5Yk5pNG9ZOGFFek9wZFZpckR3?=
 =?utf-8?B?cEZrMmNnS1Y1b2tmZEZUMVBBS2x6MUVnUkRkYjJKY3FjOTRzWUttTm5kakt1?=
 =?utf-8?B?eWM4RnRaV0piazh2SmhsUXFRRzU4VVgzcmhtR0toRVRvV0E2WWNCblZRZzhK?=
 =?utf-8?B?K2REMkxkaUpab3JrTmg1YituK2N1SmtDNWppcGRzK0ZrTUhoekUrWXNieVNi?=
 =?utf-8?B?ZnFUSXNsUUJ4RXN1SEI3QUlBY3psOGg0UGhYNnNaOG1FVU1nQVNnQVdtbWQ5?=
 =?utf-8?B?TmlqWDBmZkxxWnVxSnJhTGtpRVQ5WERiemYweWZ6Z1ZnWWNOYmkyWXBBQUdT?=
 =?utf-8?B?a3I3VW9VdXpPWENkT3BRMURrb3pSM3l6MGowQVJqbmhlckk1OE1RK3k4ZWto?=
 =?utf-8?B?dW5zRlJ4WCtsM0ZUNXNjVGdyMmt5MFJXTkh0RCsxeHRROWU2YzJhRzZZYmdx?=
 =?utf-8?B?aFQ2Z0VlUEcxNFRwMk9KWmtUMEN3a21hZ0xjSzlUb3JXSHlMaUJ6NmNnUlA2?=
 =?utf-8?B?OWVkZVBVNDVFZW5XanZKZzNyR2hIUWlMTnZkek9kU0l2Zm10ZDhOUEJiR2tK?=
 =?utf-8?B?amx3OE05NnRBSzRMRjNQYml0ZHl0SlVzWVVVS0xkTng0aHlndjd1OUZabTN2?=
 =?utf-8?B?MGdjMC9KS1R2cERYK01MMnhMeFgySUErdUNLOG1ZaWxRWGJwMWxta3lnUFMz?=
 =?utf-8?B?WTBUNWh5RlVLOGR2aHBOT21ITjVFd25NcHJ5MW0zSCtqTVpzZmhWeDBpdzla?=
 =?utf-8?B?RGNTblRUSllTUDYyWGwvelcwOCtoU25TZUFyTGx1bnpzOEtPSDlYQVRzWUEz?=
 =?utf-8?B?eEFDNjlzd2p6QjAwMTUxMDhySnZkL2tkS0YzVVo0OE40YU5Ba3FZR2NiUzhF?=
 =?utf-8?B?ZldITkJ0NmExOERzSVBWWUNCMXFWL1I3emRTajNTa0IvRkhGajdRUThUamNE?=
 =?utf-8?B?K280SGtVRlhxVllERWtLTkVMa3JEbEQ3OHJnOFI3VEtZWWlhL1VIRUJ5RG1O?=
 =?utf-8?B?YlhxNjNLbndrUWFXWW5WTml5WDB1Sjg3WG1EQ2NhZUxyVmtWVGpqOWRWS0o0?=
 =?utf-8?B?WEZoTEZ6bVh6YjVmeHBXc2V1TkNoV3FsMzVCUFNsbVZVdHA1c2FhUXRDTyts?=
 =?utf-8?B?aC8vd3FRckRuZm10ZjdSRGJjaHlSaWZ1Z1dMNjNua1BpajVhNnFXdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399b1aba-b6b7-42ff-59f4-08de7077166c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:56:31.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0/c1GfgTEgjJNPxLZTUeSlU+T7hcaFQ620nOP7qtmfa4ofC6rjx9VT0jgd51NG1wABnepVLDqRMZn/8SmtPPL1CM0liUSofHGd74uDR0F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6196
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 66C01167617
X-Rspamd-Action: no action

On 20/02/2026 10:10 am, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 20, 2026 at 08:34:08AM +0100, Jan Beulich wrote:
>> Is it possible that it's not so much the compiler, but glibc, which is the
>> problem here?
> Indeed, that's glibc. I tested it starting with CI container and updated
> packages one by one - it's about glic 2.42 -> 2.43.
>
>>> So, I guess iterate on v1?
>> Perhaps. As per above it first needs to become clear where the issue is
>> actually coming from. Otoh making the code suitably C23-const-correct will
>> want to happen at some point anyway, I suppose.
> I'll sent v3 with remarks from your review on v1 applied.
>

Agreed, the moment we limit tools to a specific std, we will fail to
find stuff like this.

In my copious free time, I keep on meaning to do one CI run with Xen
forced the the newest std too, so we can pick up fixes as we go rather
than finding them all in one go while trying to do something else in a
hurry.

~Andrew

