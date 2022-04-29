Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F7514662
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317167.536375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNcc-0000Oh-2x; Fri, 29 Apr 2022 10:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317167.536375; Fri, 29 Apr 2022 10:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNcb-0000Lz-W7; Fri, 29 Apr 2022 10:13:09 +0000
Received: by outflank-mailman (input) for mailman id 317167;
 Fri, 29 Apr 2022 10:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4Mb=VH=citrix.com=prvs=111705440=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nkNca-0000Lr-0I
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:13:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b102ae-c7a4-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:13:06 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 06:13:03 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL0PR03MB4289.namprd03.prod.outlook.com (2603:10b6:208:6c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Fri, 29 Apr
 2022 10:13:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 10:13:00 +0000
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
X-Inumbo-ID: f5b102ae-c7a4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651227186;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=DGh/0byfFRU8xIAivoRv58VSMlQk9CbyKKjdEbA8ltc=;
  b=B96CEZ8IUCyKcbG4zff+rdsjVJ0pt51/pLe/05kV9IMGOXAiSeOaseaK
   nclaMbkRQvtZQnfbRaNaKkIvNS1Cni28WLku4k3TUS4kvfBEteh+Wk1jf
   yf3c94TUMWWapdWRu6qaiiOVWjMSKbSutmsKpoaXuXKhwNJKdx+r3OWwz
   Q=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 70240393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:orY6U6nWKtKGDgtcPaeijSbo5gzyJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWWiGO/fZMTT0L490a42/ox5Q6JbXz4dgHldl+Xw0QiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DlWVLV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYURlyL5zspOchYwBYIzhEYYBFybqXGC3q2SCT5xWun3rE5dxLVRlzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBhGxYasNmRJ4yY
 +IwbzZ1YQuGSBpIIloNU7o1nfuyh2m5eDpdwL6QjfVvuTSLl10quFTrGNmLauKEZYYPokWnh
 jKZ+ETlKTocZOXKnFJp9Vrp3IcjhxjTWogfCbm5/f5Cm0CIyyoYDxh+fUS/iem0jAi5Qd03A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mwJrH85g+YAi0BUWRHYdl/7MsuH2Vyj
 RmOgs/jAiFpvPuNU3WB+7yIrDS0fy8IMWsFYixCRgwAizX+nLwOYtv0Zo4LOMaIYhfdQ1kcH
 xjiQPACuogu
IronPort-HdrOrdr: A9a23:lWGCEqHlWSrLp8XfpLqFuJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNFICPoqTM2ftW7dySWVxeBZnMffKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj4Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWna4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlWFtyssHfsWG1SYczEgNkHmpDo1L/sqq
 iUn/4UBbU215oWRBDsnfKi4Xi67N9k0Q6e9bbRuwqenSW+fkN7NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxEC3fLFuIYO5l7ZvtH+90a1waR7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm0UxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXp0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLuzNNEhyGG+fIx8Z0Wb9ihz3ekIhlSnfsubDcSqciFcr+Kw5/MCH8bcR/
 G/fJpLHv6LFxqbJbp0
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="70240393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpbhQn83+6ZaWx2h7X5cLGGRcxpSFXjbyNfGrFGLPA3uSwsMwk4i7inlJOYJduzxbpFg23fDdeEPshwmwI8kz/+iHNAo0fuzCRlgt8TqLBx5DlCuIzsqjCMrcv6b4/BGCXcgdxG8FAf5BhEyv5cKho6p3xWgGEE4tSMML860wGHzR05n4j044xcP5Qz5ZvtFCJ1VB2HR+e9+PbI534WIT4OMigGNZSQ0NkYakk7hxo+5dwCu4R9Amuv1M6pfCAELEWZdtdtaxbugcDWRfm9ueOOSgFYg+6Qs47fGnsKNqMu6hxUHKmkvz066Vlpyj40NbWzNEq5yDPdF8/48oM+1+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGh/0byfFRU8xIAivoRv58VSMlQk9CbyKKjdEbA8ltc=;
 b=Rej+ccy/s+xkhwNoi2LlHlmzXGy3FIFKLSXcKKV83zk8JcY8OfwYEgd+4FA3S+/eXVtWahtL23bMcIkfOeRbK1sGPOcTLFRApk3lp8d4o8HhsnQ/NLuunEEytIo9kGg0y8Bbl6p298l6SCG50J3Cx6lsszivDgdx2bbTW2N+kjYFm+FuYno6O3BDcjxeHFIHpQfU7nWulAbX6fGbJgbzX2tWe52CGoTtyBAv3TC9cAXeQU3qW5aVnd9d1IgayO7i2ZhYVlrDWcTad16PD+ugeytT8Pzpjbzrpo6FtKMLVrAQe3HQz4wu7lqEe78Gx5QAvMPCFq0X6LXuITMC5hkFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGh/0byfFRU8xIAivoRv58VSMlQk9CbyKKjdEbA8ltc=;
 b=gznAyn9zSzP7kPTZl82UGK7xRleXJ6AyHhi4txg+kSFS/BV6NPI3nqwXTQzQ17j75UAI0j2SHel0iiWq46yjQ0GzE1yePKH76Ij7pSCptqCtNBGvdAb8d1cdW0/yiJIbCt65GyNdOXlmcZYTGN9kQFgzsrW8mxHbBb7n+8UHSn0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Topic: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Index: AQHYWt1N9h0ywB7VLke90Ph7I2J/jK0FG36AgAGSMAA=
Date: Fri, 29 Apr 2022 10:13:00 +0000
Message-ID: <26f1d8e3-597d-31a7-00bc-f17efeeb3e55@citrix.com>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
In-Reply-To: <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94c3b591-e933-41f5-67ed-08da29c8d70f
x-ms-traffictypediagnostic: BL0PR03MB4289:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <BL0PR03MB428902A25259850F9F9CBE03BAFC9@BL0PR03MB4289.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 o0tcrBpNWDG1Bxps95s9CyWc+RNvtgqRYLYJpE/Y39gWcMVhvdJmkSL83J47IgnYp90atNAvi5ilAfN1eqge+I0Uv5fG23llR7AY5fYFV5GO2kq9v2azVTFPDE6sVA+5nszY7F9tS9w9ctFnRBjzgrrIG2DhelUB/cVGK+8EkHo3ZmrSKYD6PPOSxuMG+5HuEWMT1AXP8aaapA9NxqDHHlAKaCAvQ1EuvaoGInrpy4kgQ8N/tRxVhfh9hYGPPW9xbaOgWFLu/z6wVn4tuE3vT2YECGHhfiVBDRdTWRBYwrZgKfWMIug+eVHFgZNblkLIqR2RQfmQ5/tZOIzckwC3s1mqj/54QFHSaZEfsQokHdmYGHV6pf9s9IYQBexc71O+tSrfZMqi5CwwIpFVblWanREuKQkBKFF9CGRNVMXceQ6vfAXOnlCQYME+Z7pXx4yTTK4tfQcJbXEtr+gkV+9CS8mTPgrTBaoUeqP30oguPJUUkVfdyQVu6mCeBx97MrNxJ7pv7q+ZOdA7coSy11LATW5p1pnugCuO7tCYmIOThxpmMQYrULAxZOVjDqDRP6Vj3+Lg6j5C8e/JA7aHQEra4S4Upitq764kW6DRglMMVyDNP6/d6aJP7AvOO+R6gCToVfxptnCKnu8v7EpUBJJsdkFpoGzAOz/ROqQnAUsHOZebDbeJ/UzzBvrF6NSNYIdGzSgECsC80quROyEthvbv+u/EpHkECflVnNfI2Qq1WfPmg7XP32VVk1/8R8qxCmKoOz8q7R0vL2bkkCMue/+x3A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(71200400001)(31686004)(508600001)(2906002)(8676002)(6506007)(66556008)(66476007)(64756008)(66946007)(66446008)(8936002)(76116006)(54906003)(6916009)(4326008)(38070700005)(2616005)(82960400001)(86362001)(38100700002)(316002)(186003)(31696002)(53546011)(83380400001)(5660300002)(6486002)(26005)(6512007)(122000001)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGFzc0hBNVdOZXhaZjFDSUtpaUtsbk13Y1o2QXdPdVp4K2xsbll0Myt2eURr?=
 =?utf-8?B?Skxpek5RbXp0VVdKVHR0RTQxME1EbVdQMzllak83MnB3WVRzZW41NnE0aGl3?=
 =?utf-8?B?b1p6M1BSa2dhejVUaHlMNWZMQ3krYXRrREM1bWxneHZJSXRZaFZRbFFQaW1q?=
 =?utf-8?B?VzZGZ3EvMnA5TDNIVGdPb0cwS255dXhnMlZiT3h6VzNrWEU3UlB0YXVuODNL?=
 =?utf-8?B?RldDbE9UdFJpN2RKSTlUYUR1SEtkdzNXSmEzL3c4Q1dXS01pbU51a2ZYZmtp?=
 =?utf-8?B?K1hXbmZBT0hFY0Njejdrc25abkJrcnBDeHh5RjBUcFJ0MWN0M21NVGEyYzdj?=
 =?utf-8?B?K1V4U1hnL2N4UTVxRERxUVJ2ZUtyazRwNjlqUzk1RW5lMUNFWXd0V05ZQWpN?=
 =?utf-8?B?Sis0Yzh3WUNEajNDWDRWM0F4UENkMXdRZFptZENRdTdZTzRFNmh4QklVTVFo?=
 =?utf-8?B?V1VKWjJvQklLVGVndEN0Zlo2RWhtV0xNQ2JHR2pvTnp1OVNiZnFheUcyWjZi?=
 =?utf-8?B?MHR1NU5CSThINFRHMm05YkkrcGEveXZWZXZZTHBmbSsyb2JPTFhQOFovaUh0?=
 =?utf-8?B?NmFjZmNIckdrRkdrK0pEcjJlejBNV0tVTERsbWdnelFDdEJRNE9ReVJXUUVr?=
 =?utf-8?B?YVNOWlVISG5rQ1VyZElBNUltOWdueVNIVVdieUdpUkwzU1JXTkxNdk9Fdmpl?=
 =?utf-8?B?aTc5UXNpamFLRjkwQWxlMm4rRG5TQkZ1ZTduWTlEUXAwQXZRYS9oaWUrUGdq?=
 =?utf-8?B?ZGxxMTROcWlyd2dPU1RWVHdjUW5vSmJJNW1qb0xQd0tPOUFjdTR6ZS9wK28w?=
 =?utf-8?B?L0xadnhiRGMwek80SldHelN3a1dZQTJjdHVKS1A3SzU4aHZsdmU5R2tsWXE4?=
 =?utf-8?B?ZnhrY2EvT05YdE1YWmYzSHBDVThxaFc2S0Qycy96VFBCRCtPSXp3enN2V1gr?=
 =?utf-8?B?L00xeUVad2dFTlBUTVhoZ3M2bW1xMlg3T1o3c21HekNMVSsxanArbmRNaEI2?=
 =?utf-8?B?MDUrREtQdkZ4M0xDaW8xZFVlNUVzcHpFMjhrSGZDM3RBWW54elRJbVVBNWpl?=
 =?utf-8?B?T01pTDNraFcvakoyWnpJZ3hVQUdTVG9iUnBUMjB5NFZtODQxeFh4WmJGREhS?=
 =?utf-8?B?TzlSWjRwVVVCQ1pMaTFHV2xZNm9HaVcrRGhmV1l1b2tyUzZxRGtMcVFGanJv?=
 =?utf-8?B?dzV1eGlWQ2ZFRW0wQ3JHNG5oMnh3SmRyVDkyeWNTYlhidU9kN0hiOHJVRThr?=
 =?utf-8?B?ZTIraVhSYmp6R0RwVEJ0TjVSYVFmdDVBaldzSitHSnRLMHNNSXZQbGc3TENt?=
 =?utf-8?B?Q2Z6RHFnUnpMTkdSQldnSmdiMXJlcU9vcjNvbFZHMWJpZVJoRUFYclNIKytW?=
 =?utf-8?B?bXdpQURPU3YyTGt5VHkvbHphN0g0SkY3dkZ2T3dmeGFMK05ScTBkNjlkNnFU?=
 =?utf-8?B?V290Wnk5ZXRldEJLdFF5S3NDUEVnaWdhYXVnWmdweHJGU1F6TVBWN2Y5bURo?=
 =?utf-8?B?YlFTblZxTjZoMGdzTlIzek8wYk0wWEtwYjF1YmdPUk1OWWg1SkhzMWJ6dFpq?=
 =?utf-8?B?a1R4QUlJZjBBczZKMExZZVZibmdKVTR4OGVrN2NCRGtXT3o3eDFSb2hXVnlN?=
 =?utf-8?B?Y0dTV3o4UDB1RTJEcVhWelNtVTBtZnFCUi8yYUFCcmx6ZXhzNHJ0MFR6cVlu?=
 =?utf-8?B?M1ZIN0VER0ZWQWFQSEpQNjJGWkI4ZERnUHppNzVQN3ZhSCtKd3NXY0hBM0Uy?=
 =?utf-8?B?Z3FoWGhVMnlUeXhUVEgzWlhVWmQvcGV3d2k2Z1ZsVlAwOGpUL0ZmRFYrODZW?=
 =?utf-8?B?Zkp4eUNsZXhsbWhzYVUyTyt3QzVDa2hXcW45eDgxQXJBSmNpWjJUb2VyRGxa?=
 =?utf-8?B?YWhLbSt4ajE3K2tpbUthRHFjT1MrbTdiOFVhek5pVVNhME9OZzVCbFdGMzBB?=
 =?utf-8?B?aGRsNUdWcEtRU2twMkVzQlZhWGlZQytFS2N1S0Zoc0txM1B6ekh0NmVXc2xo?=
 =?utf-8?B?RGdrczdham5pMlhaZldYUEY4YzhDRktQWk90Vlpuc2l5eU5Kc0dlTmZCUG9n?=
 =?utf-8?B?VGJkNkJLa3l6TnNZRXlVZDd4NVhCakphYWd3Y3Z0Wkg4dXhTWHVURFl6RXg1?=
 =?utf-8?B?TS9vSXNVZ3VoVTNoUXJlZm1aZXN3UDdHVlNQT0pnLzBhbzhMTmJ1YWQ0aUY0?=
 =?utf-8?B?Z3pBMnNmZS8reFBvdjlTZ2k5L25mNXgxTW1QZXVUMlRrdVlGcTZreGJZODE3?=
 =?utf-8?B?ajlvdlNzOHJGLzY2ckg3TExST2F1aXQ2bituRVNpNytqem93RnFNQlpHWFlK?=
 =?utf-8?B?Yk5xNnNCTTlMTHZFUWRHVDV6WkEwdVlKV21hbFZ1SXU3a21IaXRHZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4AAAA6C00B7CB488CA38F0E4CE541C9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c3b591-e933-41f5-67ed-08da29c8d70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 10:13:00.4343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DmG3hwSpA0HXH/IH0ZUmCmq5R/NkQwcN0CbO7DnI6FfxIa8HUQfrUtECJ7crT9jk0ooEtdT1rqJiNvVbB8+A/nzar+em2rqCFyHNigN+EAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4289

T24gMjgvMDQvMjAyMiAxMToxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvc2V0dXAuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMNCj4+IEBAIC0xMTcs
NyArMTE3LDIwIEBAIHN0YXRpYyBpbnQgX19pbml0IGNmX2NoZWNrIHBhcnNlX2NldChjb25zdCBj
aGFyICpzKQ0KPj4gICAgICAgICAgaWYgKCAhc3MgKQ0KPj4gICAgICAgICAgICAgIHNzID0gc3Ry
Y2hyKHMsICdcMCcpOw0KPj4gIA0KPj4gLSAgICAgICAgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVh
bigic2hzdGsiLCBzLCBzcykpID49IDAgKQ0KPj4gKyAgICAgICAgaWYgKCAodmFsID0gcGFyc2Vf
Ym9vbChzLCBzcykpID49IDAgKQ0KPj4gKyAgICAgICAgew0KPj4gKyNpZmRlZiBDT05GSUdfWEVO
X1NIU1RLDQo+PiArICAgICAgICAgICAgb3B0X3hlbl9zaHN0ayA9IHZhbDsNCj4+ICsjZWxzZQ0K
Pj4gKyAgICAgICAgICAgIG5vX2NvbmZpZ19wYXJhbSgiWEVOX1NIU1RLIiwgImNldCIsIHMsIHNz
KTsNCj4+ICsjZW5kaWYNCj4+ICsjaWZkZWYgQ09ORklHX1hFTl9JQlQNCj4+ICsgICAgICAgICAg
ICBvcHRfeGVuX2lidCA9IHZhbDsNCj4+ICsjZWxzZQ0KPj4gKyAgICAgICAgICAgIG5vX2NvbmZp
Z19wYXJhbSgiWEVOX0lCVCIsICJjZXQiLCBzLCBzcyk7DQo+PiArI2VuZGlmDQo+IFRoZXJlIHNo
b3VsZG4ndCBiZSB0d28gaW52b2NhdGlvbnMgb2Ygbm9fY29uZmlnX3BhcmFtKCkgaGVyZTsgaW1v
IGlmDQo+IGVpdGhlciBDT05GSUdfKiBpcyBkZWZpbmVkLCB1c2Ugb2YgdGhlIG9wdGlvbiBzaG91
bGRuJ3QgcHJvZHVjZSBhbnkNCj4gd2FybmluZyBhdCBhbGwuDQoNCkl0J3MgdGhpcywgb3I6DQoN
CsKgwqDCoMKgwqDCoMKgIGlmICggKHZhbCA9IHBhcnNlX2Jvb2wocywgc3MpKSA+PSAwICkNCsKg
wqDCoMKgwqDCoMKgIHsNCiNpZiAhZGVmaW5lZChDT05GSUdfWEVOX1NIU1RLKSAmJiAhZGVmaW5l
ZChDT05GSUdfWEVOX0lCVCkNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9fY29uZmlnX3BhcmFt
KCJYRU5fe1NIU1RLLElCVH0iLCAiY2V0Iiwgcywgc3MpOw0KI2VuZGlmDQojaWZkZWYgQ09ORklH
X1hFTl9TSFNUSw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHRfeGVuX3Noc3RrID0gdmFsOw0K
I2VuZGlmDQojaWZkZWYgQ09ORklHX1hFTl9JQlQNCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3B0
X3hlbl9pYnQgPSB2YWw7DQojZW5kaWYNCsKgwqDCoMKgwqDCoMKgIH0NCg0KSSdtIG5vdCB0ZXJy
aWJseSBmdXNzZWQuDQoNCn5BbmRyZXcNCg==

