Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D853A417
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 13:30:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340426.565461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwMXV-0004GL-I4; Wed, 01 Jun 2022 11:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340426.565461; Wed, 01 Jun 2022 11:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwMXV-0004ES-Dj; Wed, 01 Jun 2022 11:29:25 +0000
Received: by outflank-mailman (input) for mailman id 340426;
 Wed, 01 Jun 2022 11:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwMXT-0004EM-ID
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 11:29:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13ed77f3-e19e-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 13:29:21 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 07:29:16 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4205.namprd03.prod.outlook.com (2603:10b6:805:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 11:29:11 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 11:29:11 +0000
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
X-Inumbo-ID: 13ed77f3-e19e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654082961;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=f1CnLgqqnK0eKYzt2XQLaDWrTRLbcJ0tquj82uVdlxA=;
  b=L2IOtlVXu0aSCfOZEzFThyCLNO7C0P7d3qP7agCLxv5PuXljFQ8cNOdA
   uV2kGbUuksdvQ0bMtyBULWJBFd5Bkc0l5zB7Cf6orQSXdasXA6kwcMBn8
   LOgcBVdJrWu2rj5w2apkKDeslk8BBF4qsF6htGbXjCCjVVAeSIpSCVJaL
   E=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 72460125
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rxK6S6mkogP/DMReQrq7gK/o5gz7J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXGCCbP3bZmeketl0bYq+8xtQvZKGnYJnSwdvrCFmFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DnW1rV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYV0RyALH0ir0mVkdbIyIlbJ1o2Z/fCC3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhGlYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8g7L/fNtvgA/yiRO/ufrPeLKVuDQas9OlUiKp
 DLi4XnAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUS9wWl2qfSpQGDCQA5oiVpbdUnsIo8Q2Ms3
 1rQx9fxX2U37vuSVG6X8aqSoXWqIy8JIGQeZCgCCwwY/93kp4J1hRXKJjp+LJOIYhTOMWmY6
 1i3QOIW3t3/UeZjO32HwG36
IronPort-HdrOrdr: A9a23:jrBHhqG6lFgxUJrepLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,268,1647316800"; 
   d="scan'208";a="72460125"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or7GHXPapmwFzcUpzWP29USdbCZ4ReV2jiwcYoXAnVM4Ju9um25ZGtgiQkk8YrNVC+qFYlad6CZAIxpuRPXxfrm+lEbUxyN/oU13wUF9GeHGQ4CXm9qhERgfQK8+NCXW8C8dY3PFkCSy5At5+3TCnV684F4ya2pGvVCz6CzS/DoEx9Ih2a1XbqMOiIp6EBAmi30FqvliJhHos/j3FIldF77tziIthu6Ble62ZD7jqNQfYq6oveFIO5coAFgneT63+oUwOTW+E3tzzzmlzC2Bzs7X2BdxeI5ytwM/U9woQbRJynIvmY8Bus3G1MbuWLIbweH/4Kt5ax/ChO/LHJotig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=apl+oZUNBUkv+oZsSLPe55QO3VhhU92cOwCPBQ+mZ3c=;
 b=Sj5/7jP2x6EcEaKeMTYLK2DGw/DPk+2Wljzu9R/U0dL9hsW8fKrW+21J0sox0yITpV1vnB+Pt10bwqHiJ/YJoWu9nTpPPBq/9iYKmod4/GspFP3J+RPbvfQgAof+Q2EwXN+JnDnJcBGHwjqMXIuD8oLgC3X9foy7+DcnyVPHcmgElOqofspQiaCJuRCjyPCbWOfhoSwww32AF0Meuki5ZcMq5fpqYeLLJm77MoWpqjJwRIRK8LVSUevopGz0RpeFyQBXAE+M66PAILDt5/jRUI8GJ6W4WBKcsfmMTJNLr0k4N+U72Xp2YbWjNzZVlkcPKcqbD2SRatQhxByAcEGllA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=apl+oZUNBUkv+oZsSLPe55QO3VhhU92cOwCPBQ+mZ3c=;
 b=J84O+RPnpczP/9ghT1XlryY6X422IlB3Da4vXevG0qjsXxQpkLLPWJeC0tWu1D/g1LsFztupOajE8+CSKWQakJVufFXMMvpuVYri4oDNw5hpi+as7SEThwjeXWjzB0ToZqgxlNdtjLmNclQwc6qzraK16UYYfPGD17X7XrQJ7RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 13:29:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 07/15] x86: introduce helper for recording degree of
 contiguity in page tables
Message-ID: <YpdNg5fgAncfSeTK@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <1fec512a-8c7b-69b5-40bf-88b42e9ecb7d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fec512a-8c7b-69b5-40bf-88b42e9ecb7d@suse.com>
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899559bc-c72e-47b6-d9f7-08da43c1f33c
X-MS-TrafficTypeDiagnostic: SN6PR03MB4205:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB4205219A7BF7CAE4D08788118FDF9@SN6PR03MB4205.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RvP/b5EK+/lGQZ4cCvIF8bSl8CPJeEowPGk6GrCBhQ1DlJRgy2To2p7sLJQTJ88liMhOek0GJSdAtUWwrVVtxkhqlj9eMngJzwQmCaW7U3JbyGIXyo5+LiGTe3jobj7hMVd4OL0Qx1HgUdtnCgNMDX9wLELN5gRvy6STsdcuPA7nNhRbvyorpyfoDWN48mB+V4akv/ScYqfMbzOqbYtYbs7mLt4JNJsBA69Wrd2rMGnnmg4Z3o261DzRYxSkFH0+q5NulMJbmr14gimgDxquJ7yo5pYBnoAQ/EvdOigbRWwwnVL/b3CU33LL+wvNvvvJ5MuKXvnFzMADUyjPH+KQY487+OXDh8KSL28N9H+9CebQtSTGu5CDAIPgBW734/vHb7Z3kaEbpHvC/ctaX/qSlohPQyo8enmV6RoMKjbJxkphotdky6HXZzTjtDnxt5t7SV4rsp/IKsKZjDUNkRRc33aNREcqV7iPi4iiOwpriWMGw0AoZDc7fkOJVnS0a8n47KmneyLC+DEzti9vi4aK92j8+p+/LRrOumnOvt6Qt6+en95+6tkdp2tsWROLoN5ONFeFOkWzLMaBABX/LqFmXcUXKAJAD8KY4NckzeM8dfvZo6Fon5R8rbstmWeSZvihOAzbT4BUUs1LndymAN1hfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(6666004)(38100700002)(186003)(83380400001)(5660300002)(66476007)(4326008)(66946007)(33716001)(85182001)(8936002)(9686003)(66556008)(8676002)(2906002)(316002)(54906003)(6916009)(6506007)(26005)(6512007)(508600001)(82960400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lpcWh4ZFdoTU5tOFhSVk9Ud01lc1FUNm9KUEd6WXBMVWhHTnlkTmo0NDV6?=
 =?utf-8?B?MFRMQUhIb2s3YWw0U1FybzRUSGwyT20wZndpcWg2ZjViR2dpNzJiWVgzQ0tr?=
 =?utf-8?B?Z2NNSFFXOW1zd2FTMGcvMXBreXM4aUtKa0N2eDRCZVpGaHZXeG10SmxpU1VK?=
 =?utf-8?B?aG44d01wMGo2b1lYOHRYcnhCelIvV2xoVlNhV1VlZWlFdGNUTkZQekRMZ3dY?=
 =?utf-8?B?eDJEOHF1M0R3eEJxRS9HQlErZlRyK0p4N2g5VG55RVNTZ2pZK1pFaU9OQm8w?=
 =?utf-8?B?dU5KOWlLTTVWMHV0SWdCQUhFWFFGZ2RDYzhHY0dBMHJxaDFoZnVXVVBwTGZh?=
 =?utf-8?B?b1RtTlZFVWlJWGduajZNU1FKOCtGc2o0VlQvNzMrejJhVE1ONElqOFlqZTNp?=
 =?utf-8?B?RmgxSXRjbGFMZWVROVFPMDJuMlQvSmdWbVdiRzgycEs2K2tUQ2dGSWp1Kzdm?=
 =?utf-8?B?NUFna2hBc2Y2eEdMYzdrNnVqdXUwZ1FQQXJ2RzlobnFLTEJlWGpBUWxRVEJu?=
 =?utf-8?B?a2dVZzdUMXhwNEp1bWdBOTFyOHdOYzA0ajlDM2RIbGFTcGEvcm44VE1ndTFE?=
 =?utf-8?B?VElsZ0hnSVZlVERLZDZ0MjFDVHp3N1N2YTdSVGhVM2tEN2hoc3gwZ2dUQW9r?=
 =?utf-8?B?SExZVzA4Q3h4eG4va3ByTnFKdlZ4Qmt3Qm5aVEZ4dFJZZG5RdGVQZHNGUFMx?=
 =?utf-8?B?ckVvN0FKbmhhbEZNdjhYMHByeHdDMUJPSXM5dktKUWdSMnI0cjI0UVJQTnVL?=
 =?utf-8?B?WmlXL3N4YXpuQ0tncEdXTUpDVEp6ditHeGxJWDdNMzgvUng1Nyt6WlRTWGRi?=
 =?utf-8?B?K3pMQUFMT1EvTE51RXJMT084dlVpdS9KUmIzdGMvQjNWQTVvcUwrekhRN21O?=
 =?utf-8?B?eXQ3QUxDeGNWZUNSVS9HVSs5eTBmK1dzMXJoSWE1U1FnZjRPL1A3bXdNeHdm?=
 =?utf-8?B?ZlJBQWIzZGZHUGtCR0ZweEN6dyttallrREFNOVQ5Skx3WkZlZFBlRTRyNSsy?=
 =?utf-8?B?cUZPNTVVUW9JcnJORlpySEFnS1JnQkVlMjVqbklhSmJ2MnFSOHpERzFLNE92?=
 =?utf-8?B?b05hM2VveitHaStYNEViYkgrWlVuM01kOFN3SS8wSExLcE01blNDRUJtTG9N?=
 =?utf-8?B?TThVdmlXdjVsOWNwZVpaUFowZWJ5UDZoYTBEVHlBKzhNRGRTOU0rVDhndEZN?=
 =?utf-8?B?OEdyY05Lcnl3YjYxeXY1Q0s0M0pmTE1wRHRCMS9lYVliVE5lMnIwRHB6V3E3?=
 =?utf-8?B?WFhKSno2TU1BbURkVmhZUVA3RWc3ajl3YW9jL2pWMXR2Rzk5S1pEM2ZPQVJr?=
 =?utf-8?B?YUlXekdGLzRrZVlFVHR1MFhlR2dNQ2IxODVBU0FQUFB1TnRRRGRzcGNuVnBa?=
 =?utf-8?B?V1Vjb0JpRGgwVklKblQzK3N1UnZsRDk0T1poUHA2YVRFU01kTEhZRXFhOHY0?=
 =?utf-8?B?UHBwbEpDMzRDWHVSR3JvVFRSNzJ6dUtLeTNCWWxGS0ZuajhlQWtiTEpSNVox?=
 =?utf-8?B?elF2Kzc4eWdyVlN3UTNlcGlWakFVWXZtOFh6eG9rRUV5U1BjR0toaVY5SDJ2?=
 =?utf-8?B?S0J3YlBNNTc1NG4wdkdPdU5IaC95NVhDTXVyekdSbnpabm5JREY0Q2Z4aXp5?=
 =?utf-8?B?UThYVEwzWjBVTjF4NFlsRWpNUmRKQ2Q2Ulk2TVl3b0FCeFJGencxVXBFbHFy?=
 =?utf-8?B?dU5lWGJ4Y2ttZGoxRXFVKzMzNURYdkU2QlFhcW9GRGM1dks5MXhnaUtuMWo2?=
 =?utf-8?B?SUVOT0xQTnJoQ2xNR0w3dmpSQ3ZJTy9CSWdiTUkyYW9YdUVmZlU1MFNWVzQ4?=
 =?utf-8?B?cDBWcVF3YStUQzN5WUhtYUk1M0IxR3VwWENDSTExRnZwVG9aZWYzbC9WNlov?=
 =?utf-8?B?NGZPOXVBaXY5UCt3UU9sRXFLTTJ2eWJCQW95ZFlSQ2lpemJiSTlWR01zcUhN?=
 =?utf-8?B?b2NObE9NWEd5VENCcVdFdDVVTkwrc1J1WWkrRVBiWS84MEYwVVBOQW05WlhY?=
 =?utf-8?B?NVZyL21kZTZWWXp4c2hCbitvdVB0a0ZFQllCR3l4TTVWcGVqaFpGM0lIWG9s?=
 =?utf-8?B?QTZJdVJzOXcyNHVidzJqaXllcVA3cUxPWG10WnFMTk5NS3BIMlptWEY1ZkFm?=
 =?utf-8?B?THcyZldCd0RGdGJNejNDVk9yMmhZZ2psNTM2VU1HM1ZOcXFVNHFwVE9KNVF0?=
 =?utf-8?B?NWVhd2xSU0Nkd0t3R2wwdHRmQXI5RzdKK2huWVVBUUVCSElmMEtSdGRBdlRZ?=
 =?utf-8?B?OHdTMkFiNktaS09ZRWFTY3VuQzVGWlpKdWQ2b1ZpM1BpYks4QlBVQ0NCOWtp?=
 =?utf-8?B?WDFkRkg4eVZGdzRpQnh2UDUzNGRiNTE4VlFiRG9iRmJ2WGZUWU9IanFwS0tK?=
 =?utf-8?Q?oiauv27UUZ7zOVrM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899559bc-c72e-47b6-d9f7-08da43c1f33c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 11:29:11.6353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOo6sL4DOOgdil15GRjIGg6c8yVJpqIhSt0qtJzkOj1BE/RQBZkwubVaMGs0R2JvF7RFi7dxn1AYP2uFJiHurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4205

On Fri, May 27, 2022 at 01:17:08PM +0200, Jan Beulich wrote:
> This is a re-usable helper (kind of a template) which gets introduced
> without users so that the individual subsequent patches introducing such
> users can get committed independently of one another.
> 
> See the comment at the top of the new file. To demonstrate the effect,
> if a page table had just 16 entries, this would be the set of markers
> for a page table with fully contiguous mappings:
> 
> index  0 1 2 3 4 5 6 7 8 9 A B C D E F
> marker 4 0 1 0 2 0 1 0 3 0 1 0 2 0 1 0
> 
> "Contiguous" here means not only present entries with successively
> increasing MFNs, each one suitably aligned for its slot, but also a
> respective number of all non-present entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> @Roger: I've retained your R-b, but I was on the edge of dropping it.

Sure, that's fine.

> ---
> v5: Bail early from step 1 if possible. Arrange for consumers who are
>     just after CONTIG_{LEVEL_SHIFT,NR}. Extend comment.
> v3: Rename function and header. Introduce IS_CONTIG().
> v2: New.
> 
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/pt-contig-markers.h
> @@ -0,0 +1,110 @@
> +#ifndef __ASM_X86_PT_CONTIG_MARKERS_H
> +#define __ASM_X86_PT_CONTIG_MARKERS_H
> +
> +/*
> + * Short of having function templates in C, the function defined below is
> + * intended to be used by multiple parties interested in recording the
> + * degree of contiguity in mappings by a single page table.
> + *
> + * Scheme: Every entry records the order of contiguous successive entries,
> + * up to the maximum order covered by that entry (which is the number of
> + * clear low bits in its index, with entry 0 being the exception using
> + * the base-2 logarithm of the number of entries in a single page table).
> + * While a few entries need touching upon update, knowing whether the
> + * table is fully contiguous (and can hence be replaced by a higher level
> + * leaf entry) is then possible by simply looking at entry 0's marker.
> + *
> + * Prereqs:
> + * - CONTIG_MASK needs to be #define-d, to a value having at least 4
> + *   contiguous bits (ignored by hardware), before including this file (or
> + *   else only CONTIG_LEVEL_SHIFT and CONTIG_NR will become available),
> + * - page tables to be passed to the helper need to be initialized with
> + *   correct markers,
> + * - not-present entries need to be entirely clear except for the marker.
> + */
> +
> +/* This is the same for all anticipated users, so doesn't need passing in. */
> +#define CONTIG_LEVEL_SHIFT 9
> +#define CONTIG_NR          (1 << CONTIG_LEVEL_SHIFT)
> +
> +#ifdef CONTIG_MASK
> +
> +#include <xen/bitops.h>
> +#include <xen/lib.h>
> +#include <xen/page-size.h>
> +
> +#define GET_MARKER(e) MASK_EXTR(e, CONTIG_MASK)
> +#define SET_MARKER(e, m) \
> +    ((void)((e) = ((e) & ~CONTIG_MASK) | MASK_INSR(m, CONTIG_MASK)))
> +
> +#define IS_CONTIG(kind, pt, i, idx, shift, b) \
> +    ((kind) == PTE_kind_leaf \
> +     ? (((pt)[i] ^ (pt)[idx]) & ~CONTIG_MASK) == (1ULL << ((b) + (shift))) \
> +     : !((pt)[i] & ~CONTIG_MASK))
> +
> +enum PTE_kind {
> +    PTE_kind_null,
> +    PTE_kind_leaf,
> +    PTE_kind_table,
> +};
> +
> +static bool pt_update_contig_markers(uint64_t *pt, unsigned int idx,
> +                                     unsigned int level, enum PTE_kind kind)
> +{
> +    unsigned int b, i = idx;
> +    unsigned int shift = (level - 1) * CONTIG_LEVEL_SHIFT + PAGE_SHIFT;
> +
> +    ASSERT(idx < CONTIG_NR);
> +    ASSERT(!(pt[idx] & CONTIG_MASK));
> +
> +    /* Step 1: Reduce markers in lower numbered entries. */
> +    while ( i )
> +    {
> +        b = find_first_set_bit(i);
> +        i &= ~(1U << b);
> +        if ( GET_MARKER(pt[i]) <= b )
> +            break;
> +        SET_MARKER(pt[i], b);
> +    }
> +
> +    /* An intermediate table is never contiguous with anything. */
> +    if ( kind == PTE_kind_table )
> +        return false;
> +
> +    /*
> +     * Present entries need in-sync index and address to be a candidate
> +     * for being contiguous: What we're after is whether ultimately the
> +     * intermediate table can be replaced by a superpage.
> +     */
> +    if ( kind != PTE_kind_null &&
> +         idx != ((pt[idx] >> shift) & (CONTIG_NR - 1)) )
> +        return false;
> +
> +    /* Step 2: Check higher numbered entries for contiguity. */
> +    for ( b = 0; b < CONTIG_LEVEL_SHIFT && !(idx & (1U << b)); ++b )
> +    {
> +        i = idx | (1U << b);
> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
> +            break;
> +    }
> +
> +    /* Step 3: Update markers in this and lower numbered entries. */
> +    for ( ; SET_MARKER(pt[idx], b), b < CONTIG_LEVEL_SHIFT; ++b )
> +    {
> +        i = idx ^ (1U << b);
> +        if ( !IS_CONTIG(kind, pt, i, idx, shift, b) || GET_MARKER(pt[i]) != b )
> +            break;
> +        idx &= ~(1U << b);
> +    }
> +
> +    return b == CONTIG_LEVEL_SHIFT;
> +}
> +
> +#undef IS_CONTIG
> +#undef SET_MARKER
> +#undef GET_MARKER
> +#undef CONTIG_MASK

Is it fine to undef CONTIG_MASK here, when it was defined outside of
this file?  It does seem weird to me.

Thanks, Roger.

