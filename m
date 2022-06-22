Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B35554510
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 12:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353691.580656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xEz-00040s-Pl; Wed, 22 Jun 2022 10:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353691.580656; Wed, 22 Jun 2022 10:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3xEz-0003z2-JK; Wed, 22 Jun 2022 10:05:41 +0000
Received: by outflank-mailman (input) for mailman id 353691;
 Wed, 22 Jun 2022 10:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Os2d=W5=citrix.com=prvs=1655f9567=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1o3xEy-0003yp-Gk
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 10:05:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dce625c7-f212-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 12:05:38 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 06:05:29 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by SA2PR03MB5691.namprd03.prod.outlook.com (2603:10b6:806:118::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 10:05:25 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::b402:44ba:be8:2308%4]) with mapi id 15.20.5353.022; Wed, 22 Jun 2022
 10:05:25 +0000
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
X-Inumbo-ID: dce625c7-f212-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655892338;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=p3X8mF44Ye+gNBlaEb2kuL/soYaCDycAKq1cOiOXmUU=;
  b=UhZ/pDQZCwsaoxleVneXBs7AAgJJX1BfRhCge1MrwYSgeOsZbdek8CBn
   hfehidpM4OorOvUqeBTEH5gfIdFy48yjpthV1PmljMa0mNaASDDxcagDS
   iHIlL2tvIpbjHH3iesl6u6NIRFGNbspff0zlabtxLm/MGs0r/Ze6e2ovB
   A=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 73995798
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Chsj3ajLEbigULqxqTFjFlbgX161KBAKZh0ujC45NGQN5FlGYwSy9
 lOraxnFY6jUMyawOYxoOc7lxf41yZPUndM1TAU5rSoyFStB9cGaDtqSdBusNCrPcJTOEk4+t
 c8TNdeeIcllHibX+0z0auDrpyl3j/nRG+SlAr+UZHkZqWOIMMsEoUsLd7kR3t446TTAPz6wh
 D/SnyH+EAH51jUoY2lEsvqIpB0+7f2o5j8RsgFhbP4WsFOOznIbXc4Tfa2/ESD1E9JedgKYq
 0cv710bEkfxpUpF5gaNy+6jGqEyaueOe1DI0BK6YoD66vR4jnVaPp0TabxNMy+7tx3Tx4ork
 IsX78TqIesUFvakdNo1AkEw/x5WZcWqyJefSZRomZXOp6FuWyKEL8RGVCnaD6VBkgpEKTgmG
 cgjACIMdni+a9eem9pXfAXOavMLd6EHNKtH0p1pIKqw4fwOGfgvSI2SjTNUMatZammj0p8ya
 uJAAQeDYigsbDViBA4QJo0ut9un3GvGQjZClA2slKc4tj27IAxZiNABMfLzU/nSGYB5uxjdo
 WjLuWPkHhsdKdqTjyKf9W6hjfPOmiW9X58OELq/9bhhh1j7Km47UUVKEwfk56bizBLjMz5cA
 xV8Fi4GgqU17kOmCPXgWRmxuFaPvwIGWsoWGOo/gO2I4vWPslfEWTlUJtJHQP5/6/Q8VTgS6
 mHXouO3JwJiraSFZn3Io994qhv3Y0D5N1QqZyUJUA8E6NnLu5wog1TESdMLOKu8ktz8Ajzuy
 iqDhCc7jrQXy8UM0s2T+Fnbgju34IbAVAcd+AzLU3nj4BkRTIy4Y42l73DL4PAGK5yWJnGap
 2QNkcWa6OEIDLmOmTaLTeFLG6umj96aNBXMjFgpGIMunxyh9XescoFX5DBWP1pyP4APfjqBS
 F/ev0Zd6YFeOFOubLRreMShBsIy16/iGN/5EPfOYbJzjoNZcQaG+GRiYBCW1mW1zEw0y/ljZ
 NGcbNqmCmscBeJ/1j2qSuwB0LgtgCcj2WfUQpO9xBOiuVaDWEOopX4+GAPmRogEAGms+W05L
 /432xO29ihi
IronPort-HdrOrdr: A9a23:trb3HaHI+pXwplK+pLqFRJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5VoMkmsj6KdgLNhcItKOTOLhILGFvAE0WKP+Vzd8mjFh5ZgPM
 RbAuRD4b/LfD5HZK/BiWHWferIguP3iZxA7t2urUuFODsaD52ImD0JbzpzfHcXeCB2Qb4CUL
 aM7MtOoDStPV4NaN6gO3UDV+/f4/XWiZPPe3c9dlAawTjLqQntxK/xEhCe0BtbeShI260e/W
 /MlBG8zrm/ssu81gTX2wbontVrcZrau5t+7f63+4oowwbX+0OVjUNaKvm/VQUO0aKSAZAR4Z
 7xSlkbToJOAjjqDxyISFPWqnXdOXAVmjDfIBaj8AXeiN28SzQgB8Vbg4VFNhPf9ko7pdl5lL
 lGxmSDqvNsfFv9dLSU3am2a/hGrDvDnZMZq59bs5Wfa/ptVJZB6YgEuE9FGpYJGyz3rIghDe
 l1FcnZoPJba0mTYXzVtnRmhIXEZAV4Ij6WBkwZ/sCF2Tlfm350i0Me2cwEh38FsJYwUYNN6e
 jIOrlh0LtOUsgVZ6RgA/ppe7r9NkXdBRbXdG6CK1XuE68Kf3rLtp7s+b0woPqnfZQZpaFC76
 gpkGkowVLaV3ieefFmhqc7gywlaF/NLgjF24VZ+4VzvKH6Sf7iLTCDIWpe5vednw==
X-IronPort-AV: E=Sophos;i="5.92,212,1650945600"; 
   d="asc'?scan'208";a="73995798"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH6IcRsEFboGKSxQKjaf37P+W8F0cPxmZTQl7Vy3XKvsIcdjC2PC/qVlNSlWTO7pjeeBgP2hDI4t2NrST/Q5uGOOFBXwuQF8UC9VbT3yg1d2wGEdW8EpvwAt4xnrvj/+O5rxB2LtNhZRc2/Ya3QN/3aKKr61f4XogLuyZlzNc3UD8GN4o/0P8hzQAHUms0hOW4XqrsImwSHwaoPXwOvZYB11nSieqIk+KYaVixZn2650Ry5OQFCg1YweUM7fKIctc3jYoPx/arntD8zlVzBAp1J+N6t9D5/molwyHnLZczXdRsMYxTaA23g6djzW1t71QRnEopoyfy6MLLo5vEHNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHATz9a3VeiG49wv5gpmGPDG42GsV2Sg+b6A3HVOMCw=;
 b=OKLYoWPd5bgMQMBIFBXwuxY0H/0JxKUPPJRVR9gsKf1rem4fhT701j8Tfsau4ZC9kycZUFNuNgUJTFSun1h+Dw6UMwKaL3pPPVjtfmI57Yh5o2DdroBX3CbPurleXM8iLP34RJXU6UCUP6cgMEMb2T5DdWpoJeAfea2qX2Y7h+ApAnrse2sTecvKPXoXhJMwVx+2sd7/I5wc4Yu4Dx3TtOhqSp8C3AmKbQKILFxtHFqZUzVew0UG1f8f97+kiig1s+g7Sdy+0CVO+i/bw62uso0qaVKSJPAFaYqq/GXHYNsKsIi5TmiF3pi5dqtSMnleqAZCDKglB6E2e4EuDvspdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHATz9a3VeiG49wv5gpmGPDG42GsV2Sg+b6A3HVOMCw=;
 b=tnAk9mC8aEbfjlk5EIKEKe0VIBkxHpnhjkksVWrhLqez8gW/kVl0xoKHwINR4+rPkPx0JdQ592Sp5k3fWBVE0gi63sdgwitrlRsxWltFzWpZ2tOG5Zj4BP8d/YhHGOeEv9vtoG3S3FtiagsnQltG4o0OuVSYbp89SlVnklXLNbE=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>, Matias Ezequiel Vara
 Larsen <matias.vara@vates.fr>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Thread-Topic: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Thread-Index: AQHYafsc/WlHBvFB/kqWUrR4CBI56K1bWOUAgAASTQA=
Date: Wed, 22 Jun 2022 10:05:25 +0000
Message-ID: <63208954-3C7A-4C91-97C3-8D6EA21F29C8@citrix.com>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
 <5b788e1a-d872-e318-1be5-8640fe887b9d@suse.com>
In-Reply-To: <5b788e1a-d872-e318-1be5-8640fe887b9d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae10ce37-17ef-4f60-f84c-08da5436ba4f
x-ms-traffictypediagnostic: SA2PR03MB5691:EE_
x-microsoft-antispam-prvs:
 <SA2PR03MB569142DAEE257F99F002A45999B29@SA2PR03MB5691.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4KpqzKPJCTbYRDqFjRroLtf6bOGaPqjj7hgEuAKZnPW8AzAtBIlCt3sPBz+BcNgmeUjADfr+Q86FXUk4QSOODDBpn9cOR7yj7LKTELVACsBzdsVJ5yS+WKQvotTGYWxL6lzlOpTg7EFjTWyuj9oeSeBkqQazSvwhpElBunn++DUrSEgmaJ/jGAHGpTL8Fis7JiQ8Cab48Sqymublat7GZCTbgvvgfxg6DO6HUFBmX/SWGWDjnkzpYc2VC1GiQmjrOmZvXX5zCiTA92Ek+3hBcJo0uQIdrBtvSOyQqq0Xb2rLyK34U/9yb+42XSpvwhJjyiu1ZocOV6jy6HOjqj2rppOO66X8H1/go/lggdZNiLqpBlqWujno655fbHHtvUhIAjxm6xur3Yftr03ZcRxfQ84ilcLN0OMi+40tOrMtro66P88U2pKXRAvjRq7l7/93znZJKpJpmyqU5XG0HvgxUoLPzODPflE/qwCvdPHqrRoCgptQ5PPWOAonla5irMmLKSG9WIR2s8vu3BwxhTm22ZsqBJp0A+wvS35aWCKn6qTdMsPdWg5IUgy5RNw861uXd9zSAtEJ7pK2jTP7LagNzjmOatZoKdO9PZ+tWyoUXo2JVapoDel9D/JcZUpeYNwyYDYSImUeYpeXRF5Tbp91+eyQeTAjEFCDu56crTTmSfj6HnmY8KQfHn0AqSgdojGy5h/4K3lcsNVqPqxVioTKbdVJcqhnhw2J8BN8z/EBn1zR6Y0aizEXBb4Rwpo1EBcc7teTrleO5UUHTjeKVlAvfugej1q8bFwcxvAAkYAwpP4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(99936003)(66446008)(4326008)(66556008)(54906003)(8676002)(82960400001)(122000001)(66476007)(66946007)(38070700005)(91956017)(6486002)(186003)(76116006)(71200400001)(64756008)(41300700001)(53546011)(6916009)(478600001)(2616005)(86362001)(33656002)(38100700002)(6506007)(316002)(6512007)(36756003)(4744005)(2906002)(8936002)(26005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UElyZHorL2FkSDNLZFlkTVg4NW43Skk2VVM3bWY2R21vZjhpRVhKazBxdHdm?=
 =?utf-8?B?MXlnckdxK2dsMUpkQUtSdEhVN3lqejk2YlNGaEJvVGp0NFBLMEZvVXRVbWZS?=
 =?utf-8?B?dHMydmZLa21TRzF6dnVVdzJkMThvWmdjSzhPUkdGc0VHcGVxOGhFU01oYnp5?=
 =?utf-8?B?aUZEOXNrQzNsbGoyYys4cEhyTnlVQlRFMGJETHUydzVENmVWMzdHelFZaUpB?=
 =?utf-8?B?NzZVcGNqMlhlQy80T1lsd2NTeExodzJGMlZxdUIyaGdxVFY5YXhKZmZmUUpP?=
 =?utf-8?B?SFAxbjNtZmFiMFpoYkJneHV0STUyb0ZXeWZDc1dhdUg4ZVVOMW5HdEgxSjJ3?=
 =?utf-8?B?dk1vTnBkdU4vU0E0YlAzZjJCOG5MVmRJTlJqZHNGT2Q0cTZUTTdKTTE5UHp1?=
 =?utf-8?B?Z0Fhckp1TEJuQ2dpU2tKMVNWZi9qTnJDZ3REWkhFL2VsVG1wQUpZaEFSQWph?=
 =?utf-8?B?UlZFSklic2UxUjBCYzVCVWZockRDdlN2NGhsZWw0OW9vN0d3SzVIMFp5TERE?=
 =?utf-8?B?Z2dwRXNlMlQwZzdXMHEzTjZaVGRhMmc0dGJiaEhyYkphNTl1c2lCL25laERR?=
 =?utf-8?B?Y3dQNzY4bXNTdnc5RXZmU2dOUURGcUVXWHZIVnJlVVpSOHM0K1EvV1czdnRP?=
 =?utf-8?B?dHVrWWlNbW54NGNEK3MwcDJWb1N4UVB1NGhoTXc5V0g1Mk5DZVpJWkxlMEV3?=
 =?utf-8?B?WW9vRnNUVzV6K1djbE1xaitZMnpXYUMyUFowTGpFbkpDTkxGQ1dYWXl5T2ha?=
 =?utf-8?B?NzNUNCtJT01yUHBvb1NxYUIrQkFBNHEvY2ZyTm03ME9kSWRzVEwyb1g5c280?=
 =?utf-8?B?cmpZaTNaZi9udDZDdlZ2ak9xRnM2VWlEMTFkc08veVdpYUFRQUZuYyt1a2pK?=
 =?utf-8?B?WGFBM3BXUTNpazRMK1FkZytBay9sYjh5TDRjU0g0a3RzWXRuU1liNlRieklK?=
 =?utf-8?B?VGhrT29WN1d3RG9pL21Ebk5ycUw0Z25tdkFnb1djZjBSREg1QWVrdVd0WTIr?=
 =?utf-8?B?TDR6Smx3cWlodEFEcS9FMFpJU2I0bXVsbDV5Mlo1MEJ6bitIK3VJaXA1cjVG?=
 =?utf-8?B?MnJzN3o3WVlQeEpBa2xPcW51clN2bU1UZ2d6alNNQ2tncTRXdVV1QUJDSjRu?=
 =?utf-8?B?TWRtNkNET1lPUWZzSkljbWEzVjcwa1RFZGJmc1pkZFFvM3lJaGZWZGNjK0tz?=
 =?utf-8?B?SFFaN1g5LzdTbDZzS2FISTdNU1JFb0ozUjduM1hZbng1TmM1M0srOEZMTVRn?=
 =?utf-8?B?ZERHOWc3THA5VGpDWGEzaGtHNlY2UThieDhMQkxPcXQ4MnhWMHB2ZVpkdTFt?=
 =?utf-8?B?UTQ1eFFDSWNnRWpkRTZKaHluN3BlbW9mSmRXY2FWa0djU21OSnFrdUg2QlN5?=
 =?utf-8?B?aXF4MUgvdVUxN3BqNEZHY21zalF2a3lyRlVsR0JFc3BNak1vOW9MYVVES0JO?=
 =?utf-8?B?bmxvM0pkSEF0WmZMZWdtR08wV3poM1dydVBjclcvekdSb0pGTWFrWmdFSG1l?=
 =?utf-8?B?N2lkVHlQV21SU1ViS01FSUt4VEovTDRqcDRWZmp5QVFrV1ZvRkFMMHphcDBj?=
 =?utf-8?B?c29pU3p5YlZMYTJDRjlhSmQwWHVCWngxSUVFMVhERFVtYWJRQXNFcG1tc2pS?=
 =?utf-8?B?Ry84NnZQSkNndGZVZlhlekRuaXBicHlPZU5lY2MrWXdFd1ljU2ttWE1uQ25h?=
 =?utf-8?B?WXE2YmZUdDdscys1Q203ZkpEZllKRzA5YnliTG5GeVloaFdsbkxxZ1BRV0xQ?=
 =?utf-8?B?enVMUlNEMkRXcDV2NnhZcDY5a200cE4rcVZ5OEI5TzEwWEN5dEs4eGZWb1Nu?=
 =?utf-8?B?Y252MDRQdEpNYlZiOHRwYTdYMkRpaEdjM3BIbnRlSGVEZklBMFNqLy8ycVc2?=
 =?utf-8?B?eWVlRlZGLy9ETWJ5TEduVU1WMVp1REJCeisxSE8xQ0F3ZWJiSzd4SGxVQzc4?=
 =?utf-8?B?VVBaRzdTY20xZTd3QUY5Y1dIL0pGekphRmtwUWZydjVhaWs2SXBTbHdqYkZp?=
 =?utf-8?B?Mjd6TU5nS0ZzYkZTM21HcnMyNlorbENjR2hlbTJGd0ZYNEhLSmdzOFp6cjB3?=
 =?utf-8?B?MG40QU9rVlhlTStzUVVyZnVrQmlvTGxRV3JQcjF0R2FVTy81RGh4Y2F0dDg0?=
 =?utf-8?B?VyszbStIVkVxankyVUFrQXNyVStoOTQ1d1U0S3VKaUpwOS8vTXE0Y1RseXNx?=
 =?utf-8?B?TmIrbXpHOXVmU0R4dXpBMU5mSG9hWktvbjlyTElpajFZR1dqMWt2MFhwMmxu?=
 =?utf-8?B?T2xqalk2OEEvaTNzcHUxaE5RNGtPeFk2TDlmY1ZFOWpPemkzU0xVbDF0UnRD?=
 =?utf-8?B?M0gyWDVMZWpHQzZSV1d0TmIzRDRSUUp0QU9VcGpMQWFJd2tTdWdZalJrM1dM?=
 =?utf-8?Q?xi87GQJE+l2iH5jw=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A27804B2-1101-47D6-8B94-B22A797E32EF";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae10ce37-17ef-4f60-f84c-08da5436ba4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2022 10:05:25.6960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KQXlK5nqiM6WmFflNypoL+ah8ARipv5jHsIOOtNNWn3ij66pRE+w0P3yl5DNaf+AZYr+3+JKcGNbMVKvIlACRRkQ3t6qWiOe/xlXyhQneus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5691

--Apple-Mail=_A27804B2-1101-47D6-8B94-B22A797E32EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 22 Jun 2022, at 09:59, Jan Beulich <jbeulich@suse.com> wrote:
>=20
[snip]
> In general I also have to admit that I'm not sure the exposed data =
really
> qualifies as a "resource", and hence I'm not really convinced of your =
use
> of the resource mapping interface as a vehicle.

I=E2=80=99m not sure if I=E2=80=99d call any of the things currently =
mappable via that interface (ioreq pages, vmcall buffers, etc) =
=E2=80=9Cresources=E2=80=9D.  I=E2=80=99m not sure why the name was =
chosen, except perhaps that it was meant to be a more generalized form =
of =E2=80=9Cpage=E2=80=9D or =E2=80=9Cpages".

The alternate is to try to plumb through a new ad-hoc hypercall.  Andy =
suggested Matias use this interface specifically to avoid having to do =
that; and it sounds like he believes the interface was designed =
specifically for this kind of thing.

 -George

--Apple-Mail=_A27804B2-1101-47D6-8B94-B22A797E32EF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmKy6WAACgkQshXHp8eE
G+34Tgf9G7VE0lOrDdV0pss0YGd39U8iR4xI4SFYmZMnjxU19iJQk4/Xo3COMALh
bO1fQuJkFducNyapE3EW9DmT0AfzPoUGapJ8+bBxvsRXjmSCErLxTGcvIjSmH3q8
FDFGFa3BWoG5F0/ouGbaw8jU5XjZgM/9b/47/5Gsm7UUg0LcKOAxqTWkwmXJq/9f
H89AvfpCOZGs9thepSmIQ8yziq/tMdyWdkeGZp5ZXX6PScJkyF1mXG1s34AqJS22
jKTVNKoY8eenu6fiqqktKTJkyN7M7Buc8bNbQseE25vuQpc4b3Su03lwS1YcRX43
wmYuEVu5zWj+UktSesSJ8f0GT13LlQ==
=f55s
-----END PGP SIGNATURE-----

--Apple-Mail=_A27804B2-1101-47D6-8B94-B22A797E32EF--

