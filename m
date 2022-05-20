Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53F52EDDD
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334266.558277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3L0-0007Wl-GV; Fri, 20 May 2022 14:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334266.558277; Fri, 20 May 2022 14:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3L0-0007U9-C2; Fri, 20 May 2022 14:10:42 +0000
Received: by outflank-mailman (input) for mailman id 334266;
 Fri, 20 May 2022 14:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcqf=V4=citrix.com=prvs=1324d257b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ns3Ky-0007U1-BW
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:10:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 967f60bb-d846-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 16:10:25 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 10:10:35 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by DM6PR03MB3801.namprd03.prod.outlook.com (2603:10b6:5:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 14:10:32 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::6d0d:b9fa:6b59:36d4]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::6d0d:b9fa:6b59:36d4%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 14:10:31 +0000
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
X-Inumbo-ID: 967f60bb-d846-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653055839;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uUQXC3Fq79Y/LyBYuv63z+vROOqFqA4Hte1H/F2uajI=;
  b=JtmkLWajm1o84FwBG8w2FIeNRlQ0N9gCW90jwc6o/HUir89dbeHiNQAh
   IFlTyzn52zUH5gcEoErNGkAtwa+Stp9a87kgODiVPSd7ZG25iFlUHAkV0
   ApICZ0+BEiNuMeQhUEalL+Uw1X+I6NMQ5SSTI14mBy3jiVBeQEOUB73FO
   8=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 72193311
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dWr6u61MpLzYoZ27J/bD5aBwkn2cJEfYwER7XKvMYLTBsI5bp2BSz
 WEXCGmDPK6MamH9f4p2ady0pksHv5CExoNqHAU5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1znIS+aFw4L5HRv/sDcT5yP3BTMINJreqvzXiX6aR/zmXgWl61m7BLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82eBfySvLe03x9p7ixKNd/Ya
 9AUdnxEaxPYbgcUElwWFIg/jKGjgXyXnzhw9wjM9PFsujG7IApZ7aPiLvT5IcSxRe51uxq6g
 0iaon3JK0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQpgOGXG4NS2cZbMR87ZdvAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obs5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:+dWFwqNsFwdP7sBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUiFYJuYeU9NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="72193311"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ/uB8ljyp3D1n10AG7tbe1klL9jtFYud07m/6gWVJUzWFy4q2t58/wqGZqx5rkzfsjAN/D6+F3HWwETox+AVNfw2uSobDqyXGDN3fwH48u5m9B+5vwJXN8aWmBHR4b20ciU0UaxawFCU18vR7XBwPb1sP/eqXh6ODWMOqXOYK/rS+mJRksY51L7vx0IL4o/NYot33yTbOoYZMVGi0YyakzUz49BR1fNqFj5DJC3FL/imk6RkToZyA5EvZRdmhxu2R83D62yoBYS2M43mAiNBFMU5d1fJU9ndEa3CXY+RLOx5a0ythxEXou96VqtWVO6w07iR45JRxJcxMdD1THW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUQXC3Fq79Y/LyBYuv63z+vROOqFqA4Hte1H/F2uajI=;
 b=Pd1buDryNoifgeYoaqqZmF4qjILUnrawtfEbFcdz4yIl1ErZEGfOFHzm4PLhpmjHM5IC/tPbxZ8wU54mlz0Ps7xh8hoU/G+/TISlKqkRkghVlubS1CFEuhXV5DcIGFI3DiFO1L61PRm4Q2n5gu5OziKN604K11aw+sSdl+nmkGbUK02B7mOlNe7u11RgwU3WZZx47hyDVdTLmYexvo0wVN6uQyP7ayNSEq4Bux5WIOQHll+ZtCuylJal91OkXkZcs6MbqhjWVPFWzpQRfBH27JYWYPWR4ISocvBDar/cjZO49ONfGZHoBZjQAWgtCBaG+VNT9E/+z7raV98JalNlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUQXC3Fq79Y/LyBYuv63z+vROOqFqA4Hte1H/F2uajI=;
 b=b3GsLRX1A/qvvTdU5Cpm93sr9TYHItOhHKYLtMY1KUTCDaa2M2gYbTq5qxvG8rPPF7qZJcjyzexoF9u+2yeUeim4nrnc/DuChYUJTyYB4G87gLSZUo05OuF26Dl6D4pdivdYJigHrYigShh/pDJJZNoqFafvmT9PBEr9G1hXBt4=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Thread-Topic: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Thread-Index: AQHYbE7auBjYBybQdEGztrNyxSKPiK0nzhyA
Date: Fri, 20 May 2022 14:10:31 +0000
Message-ID: <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
In-Reply-To: <20220520133746.66142-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a24331df-ace5-4738-1194-08da3a6a800c
x-ms-traffictypediagnostic: DM6PR03MB3801:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB38019117271492AF8659AA50BAD39@DM6PR03MB3801.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oBJ7kVFEro/HtDTxXsG6aeaM9hDpYj3whW1kB2oMABN4WujerNKLuZlv0IMtyWmg+jMHV2LTE3QYlVBkXeLNDLrqPWFtL/v8ncI0P/3BI0OzIDX5FzR4pzXzNxG9zGTOlxix1Zwukp8ro1w0slnThqswobv/OuMG0fHOoJbySpVjiY5avrBG+DUA7x12wGM9rAZ88lLupbkmcolA+sXr31FKNWnGuNuFgpmmiixrCU4bS5qSsQqAw+lkB4otL9g+Q7kBEBRB0X2ejNFgUBdzHhUdrR+HHkKzukAMARLXRw0sYv+F2kE1WqjHMVWUz9QXunAlMDMIdFF1ax8QWaCEsZf4nHmJKDN5XqqIF+gbEZKriYClpEw+2lgr6JOOB/Ji0p4okLw+gKgkwznmSwz9usX5E2+Z0TnT6bRz3kyGqdSfioFXyaN5iDelZRed9nMSHgg2Ntg4eV1U2ieMVLZ9Zc5abmArn3ceO2iu8eVgx426EuHOUt5svDA/u3nQc4CbHYSeELu18x6oCs91i8hAuyD584B2fsVWph+L9NCOi0orDi9by/L6RiMMmHIxDsHIjBD7T4BcNpAW5Vo/XltXtNXOuppkqxGxToHB6p2mBzgfONtcplY2dKR85JTdwH0HBohGTX+k9et/qdz3c9UjJdt9wPhmfp82QAhVFnyq5P15VzbGW1Gm8VYEeBJWz0m17dWBJBuFL/NycN4f21SO0ZDPXnlkpWUh07J6Si4v1YcOouxvU8bzz92BIEUKKyvlCTt9FdotLl4dHdz2WkFzcw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(86362001)(66946007)(26005)(2906002)(31686004)(6486002)(76116006)(64756008)(66446008)(5660300002)(8676002)(66476007)(4326008)(71200400001)(91956017)(31696002)(316002)(36756003)(6512007)(53546011)(38070700005)(38100700002)(2616005)(110136005)(6506007)(122000001)(54906003)(82960400001)(186003)(508600001)(8936002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em43MWlSUG1mRUhSa3lrYk45MHhrbHp2aFBxWm8zd0lkVW9qRGdSOVFWNm5U?=
 =?utf-8?B?T2ZubENMTUgrWnUzV3pDQllQYVdlQ0N6WEl6WSs5Nmp6cXBSaEcrVzltb200?=
 =?utf-8?B?UHA3U3lQYVozVG51YUV6YXA1R20rc0VIT3Y3NnUxQ3RBMmZlcTM4a2xHWUFT?=
 =?utf-8?B?dXVsbC9Qa2lnbFBSeGtlM3gva2dldkNQa0I3QVI0MUtwalVnMUVtbDB5Q0ln?=
 =?utf-8?B?a3lnUGlJaE01aGttd0pYU2FMdTZKMkJiaHp0dkJwOEtJZlRxOEVMSTdmeWtH?=
 =?utf-8?B?UjJkak5DM25kdGdndS9DaUhUMU00dGh6UDJCNHlmMjYxK1MyZ050UXMvNGxJ?=
 =?utf-8?B?ZjdDRjVha0dBSFFLSUNZUDJPeGxZK1oxNzJJK1A1TTZONVhsZkk2YjdoZWNV?=
 =?utf-8?B?L1VCcVVGakZZRUFNTjF1K0d2cU5DT3VGYW1RL3A1Q0JyYnJzT0dISC9ld01v?=
 =?utf-8?B?QjdsbzZlUHZld2lmeTFsbWZzYnVZeUxRZ0cvQmd1bEJodnBKUEZ2U1JsUnl0?=
 =?utf-8?B?eThteVZuMVlXTkgvT0wyY0t4QnhCR21sSm54WjNkNXE4M3ZBL1FqMTdFdlZa?=
 =?utf-8?B?KzhUWW5tYWNqNnFQOThDVnpJWTRGYjYxU28xa0VKejVIbEZYYjdMdTZKL0VR?=
 =?utf-8?B?MkdJMWVRWS9rUm9TVkFnTFJ0TnBsSlo3RjJvSFY4dkdwT2NFNjFWTDYvbzhm?=
 =?utf-8?B?a2dENUd3SGdONmlWNGZpdERvN3FnUGtBTVpMQk9henBPM1M2d0NIMmttcWlS?=
 =?utf-8?B?bjVwRVZqYm45OHFxMnVjTm9lTHFITEFNY2thdDM2eGVOS3dzSnFRUlRrZ1d4?=
 =?utf-8?B?L3ptdTZudGlzb05GOG03VnJOVEFGUUZZTmIzOSsxR1kwREFjbUJZNG5Ld1pr?=
 =?utf-8?B?aXlVNVZ4cHdlK3UvWEFqUDVKenBzbFFpUjNHbVJkNTIvaTAxTzdsUWQrOHJE?=
 =?utf-8?B?MlJMMUtxbnYxWmtTYmJjN1RVQXdwT1JhUnFuMGFXdGUrNlRxL3ZYZTRpTkNq?=
 =?utf-8?B?Sll6NUQwWDdVMExXcUw2TUd3NTR0WklBVkFXa1VybStNM1RZNklFaDh5cWtk?=
 =?utf-8?B?eVJGTnF1dUwwamJGY0laWjd1Q2xtUkdTVkpDemFrUWNjUVFnZ1RzSG9nUXZM?=
 =?utf-8?B?Sm1NMThDalZ2SW1mRm44aW1HL3dHbnhjcyswN1N3d0JUWC90Q21XSFVueTJa?=
 =?utf-8?B?YzhlK3VwWFNnN3d4Mlk4ZUErSWRrTEVtYmU5bmMrc0VpRHNTMVBSRTBhWE1v?=
 =?utf-8?B?TWQrd29vNThvUnd6K1BLWXdGTmMxUkdYZ2l5TGtZWW1UZWhXVFYxMEtDSWJq?=
 =?utf-8?B?OEtrdlV4ak5iWnBjYVI3QkpJWStWLzRxRUNEdVpuSXN2eEV5NGFQZWM4Kzln?=
 =?utf-8?B?VE9Sc1NhenlLRkFQNFF6eGVoSlpZbGw4S3QxYkpoNFJQb2RXNm9pR0xHMVZP?=
 =?utf-8?B?K0djVjZaVzU2T2huYy9CajliTHVqbmpKTkdvck10RStQaUZZZGlxMkpqYTdw?=
 =?utf-8?B?Z2d1K1dpUUwyWFA4ZnFhZ3ZIczdqekc3dmZ5R3Z4VTN1VmY1cHFzb0Ircmph?=
 =?utf-8?B?OUVub1NkVW03MW9SNVMzN09wamwzUDBIQVErcW9nWkswaUtldGxwK1MvOWlB?=
 =?utf-8?B?b1FGU01rMytnWWtMaGF2T2MwNzNLMDNJb0grdHdHSjZ2SjUzbHl5OE93UU43?=
 =?utf-8?B?SnZQaDBFaGpTOWt6WGcwSWxxVXNZWC9LWWxQMnp0MEozdTBvNXl4a3RHQ09B?=
 =?utf-8?B?SGNSak95YTV4VEVQTjhFNk52akI2a0tLNVhxbEU3UGZjbFQwa0lQbkE4K1lU?=
 =?utf-8?B?Si9FQm9sZVdza3AxdktBZnBpdU5KR1lzTnpKV2JwcTBXVmRPRUZ3eWpNNTZi?=
 =?utf-8?B?eTE0U3NiL09yekdCdGl1ZnFNWERWVTZndWxQNVpweXFPQllpSzJoYU12U1l6?=
 =?utf-8?B?eGFRdUwzNnJQU2YxSU9DNUdIY2k1VFlTZ1M5UUxsYmtqdFpkQi91WDNDL1ZZ?=
 =?utf-8?B?N1RwandDc0VINUttWk16VHVvUUlOWHBiRU0vZ3FFSnpsRlJpN0JqUFVEbDFC?=
 =?utf-8?B?VnFTTUR3SDk0cEh2TnJmQWdXU1VDcjE0cjVFLzBDRXVVcmtTb05DdW1TV2dF?=
 =?utf-8?B?aHFRM092RWh5TWplTDNxaXJtWlIvdE9TRjd2QmtzQzFuNXRXV0l0ak82ZVhT?=
 =?utf-8?B?eXU1a2I2c1IxWTBiT3BWcmxnL1RPdEZVdjk2WjNEd2UwQkUxVDNueUp6Rk91?=
 =?utf-8?B?empCL09VcndMZjV2U1E3bzZxUWtTOUhwNnBUa1c1K09aS1JLNkFMeUJ6QldB?=
 =?utf-8?B?SkwySEpWc2NGczBLM3lxVm40ZGtFOTFOM1RET000SjFxd2ZReVpJZkNhVEw5?=
 =?utf-8?Q?9qd65LMHZ5hxpWFE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6D4E6E4AC5DA14E8A1353955893266F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24331df-ace5-4738-1194-08da3a6a800c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 14:10:31.5096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACZRNuDht/5myb7s31YKhrI5EIcyLQGwRCqYwAMNgLYl24kVsKtk6KIuUsbFkSMh2uGWVN3Ddhu2ZwFpq+3K5NVY1Wyn+rBN5DRNCmTzkxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3801

T24gMjAvMDUvMjAyMiAxNDozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBBbGxvdyBleHBv
c2luZyB0aGUgUERDTSBiaXQgaW4gQ1BVSUQgZm9yIEhWTSBndWVzdHMgaWYgcHJlc2VudCBvbiB0
aGUNCj4gcGxhdGZvcm0sIHdoaWNoIGluIHR1cm4gYWxsb3dzIGV4cG9zaW5nIFBFUkZfQ0FQQUJJ
TElUSUVTLiAgTGltaXQgdGhlDQo+IGluZm9ybWF0aW9uIGV4cG9zZWQgaW4gUEVSRl9DQVBBQklM
SVRJRVMgdG8gdGhlIExCUiBmb3JtYXQgb25seS4NCj4NCj4gVGhpcyBpcyBoZWxwZnVsIGFzIGhh
cmR3YXJlIHdpdGhvdXQgbW9kZWwtc3BlY2lmaWMgTEJScyBzZXQgZm9ybWF0IHRvDQo+IDB4M2Yg
aW4gb3JkZXIgdG8gbm90aWZ5IHRoZSBmZWF0dXJlIGlzIG5vdCBwcmVzZW50Lg0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0t
DQo+IFNlZWluZyBhcyB3ZSBoYXZlIG5ldmVyIGV4cG9zZWQgUERDTSBpbiBDUFVJRCBJIHdvbmRl
ciB3aGV0aGVyIHRoZXJlJ3MNCj4gc29tZXRoaW5nIHRoYXQgSSdtIG1pc3NpbmcgdGhhdCBtYWtl
cyBleHBvc2luZyBQRVJGX0NBUEFCSUxJVElFUyBMQlINCj4gZm9ybWF0IG5vdCBhcyB0cml2aWFs
IGFzIGl0IGxvb2tzLg0KPiAtLS0NCj4gIHhlbi9hcmNoL3g4Ni9tc3IuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA5ICsrKysrKysrKw0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2
L2NwdWZlYXR1cmVzZXQuaCB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21zci5j
IGIveGVuL2FyY2gveDg2L21zci5jDQo+IGluZGV4IDAxYTE1ODU3YjcuLjQyM2E3OTVkMWQgMTAw
NjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvbXNy
LmMNCj4gQEAgLTMxNiw2ICszMTYsMTUgQEAgaW50IGd1ZXN0X3JkbXNyKHN0cnVjdCB2Y3B1ICp2
LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpDQo+ICAgICAgICAgICp2YWwgPSAwOw0KPiAg
ICAgICAgICBicmVhazsNCj4gIA0KPiArICAgIGNhc2UgTVNSX0lBMzJfUEVSRl9DQVBBQklMSVRJ
RVM6DQo+ICsgICAgICAgIGlmICggIWNwLT5iYXNpYy5wZGNtICkNCj4gKyAgICAgICAgICAgIGdv
dG8gZ3BfZmF1bHQ7DQo+ICsNCj4gKyAgICAgICAgLyogT25seSByZXBvcnQgTEJSIGZvcm1hdC4g
Ki8NCj4gKyAgICAgICAgcmRtc3JsKE1TUl9JQTMyX1BFUkZfQ0FQQUJJTElUSUVTLCAqdmFsKTsN
Cj4gKyAgICAgICAgKnZhbCAmPSBNU1JfSUEzMl9QRVJGX0NBUF9MQlJfRk9STUFUOw0KDQpVcmdo
LsKgIFdlIHNob3VsZCBoYXZlIHRoaXMgaW5mbyBjYWNoZWQgZnJvbSBib290LsKgIEV4Y2VwdCBj
YWNoaW5nIG9uDQpib290IGlzIGJyb2tlbiBvbiBoeWJyaWQgY3B1cy7CoCBUaGUgUCBhbmQgRSBj
b3JlcyBvZiBhbiBBbGRlckxha2UgcmVwb3J0DQphIGRpZmZlcmVudCBmb3JtYXQgaWlyYyAodGhl
eSBkaWZmZXIgYmV0d2VlbiBsaW5lYXIsIGFuZCBlZmZlY3RpdmUgYWRkcikuDQoNCkdpdmVuIHRo
ZSBvdGhlciBwYWluIHBvaW50cyB3aXRoIGh5YnJpZCBjcHVzLCBJIHRoaW5rIHdlIGNhbiBpZ25v
cmUgaXQNCmluIHRoZSBzaG9ydCB0ZXJtLg0KDQo+ICsgICAgICAgIGJyZWFrOw0KPiArDQo+ICAg
ICAgY2FzZSBNU1JfWDJBUElDX0ZJUlNUIC4uLiBNU1JfWDJBUElDX0xBU1Q6DQo+ICAgICAgICAg
IGlmICggIWlzX2h2bV9kb21haW4oZCkgfHwgdiAhPSBjdXJyICkNCj4gICAgICAgICAgICAgIGdv
dG8gZ3BfZmF1bHQ7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYv
Y3B1ZmVhdHVyZXNldC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVz
ZXQuaA0KPiBpbmRleCBjZDY0MDlmOWYzLi41ZmRhZWM0M2M1IDEwMDY0NA0KPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oDQo+ICsrKyBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0LmgNCj4gQEAgLTEzNSw3ICsxMzUsNyBA
QCBYRU5fQ1BVRkVBVFVSRShTU1NFMywgICAgICAgICAxKjMyKyA5KSAvKkEgIFN1cHBsZW1lbnRh
bCBTdHJlYW1pbmcgU0lNRCBFeHRlbnNpbw0KPiAgWEVOX0NQVUZFQVRVUkUoRk1BLCAgICAgICAg
ICAgMSozMisxMikgLypBICBGdXNlZCBNdWx0aXBseSBBZGQgKi8NCj4gIFhFTl9DUFVGRUFUVVJF
KENYMTYsICAgICAgICAgIDEqMzIrMTMpIC8qQSAgQ01QWENIRzE2QiAqLw0KPiAgWEVOX0NQVUZF
QVRVUkUoWFRQUiwgICAgICAgICAgMSozMisxNCkgLyogICBTZW5kIFRhc2sgUHJpb3JpdHkgTWVz
c2FnZXMgKi8NCj4gLVhFTl9DUFVGRUFUVVJFKFBEQ00sICAgICAgICAgIDEqMzIrMTUpIC8qICAg
UGVyZi9EZWJ1ZyBDYXBhYmlsaXR5IE1TUiAqLw0KPiArWEVOX0NQVUZFQVRVUkUoUERDTSwgICAg
ICAgICAgMSozMisxNSkgLypTICBQZXJmL0RlYnVnIENhcGFiaWxpdHkgTVNSICovDQoNClRoaXMg
aXMgdGhlIGJpdCB3aGljaCByZXF1aXJlcyBtb3JlIHRvb2xzdGFjayBsb2dpYyB0byBzYWZlbHkg
ZW5hYmxlLsKgDQpVc2luZyAncycgZm9yIG9mZi1ieS1kZWZhdWx0IGlzIGZpbmUgaWYgd2Ugd2Fu
dCB0byBnZXQgdGhlIHNlcmllcyBpbiBub3cuDQoNCkJ1dCBiZWZvcmUgd2UgZXhwb3NlIHRoZSBN
U1IgZ2VuZXJhbGx5LCB3ZSBuZWVkIHRvOg0KDQoxKSBQdXQgdGhlIGNvbmZpZ3VyYXRpb24gaW4g
bXNyX3BvbGljeSBzbyB0aGUgdG9vbHN0YWNrIGNhbiByZWFzb24gYWJvdXQgaXQNCjIpIFJlamVj
dCBtaWdyYXRpb24gYXR0ZW1wdHMgdG8gZGVzdGluYXRpb25zIHdoZXJlIHRoZSBMQlIgZm9ybWF0
IGNoYW5nZXMNCjMpIEFjdHVhbGx5IHB1dCB0aGUgbEJSIHJlZ2lzdGVycyBpbiB0aGUgbWlncmF0
aW9uIHN0cmVhbQ0KDQp+QW5kcmV3DQo=

