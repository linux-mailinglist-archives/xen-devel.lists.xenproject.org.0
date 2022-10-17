Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA5A600E86
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 14:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424361.671708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOpw-0005mh-NG; Mon, 17 Oct 2022 12:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424361.671708; Mon, 17 Oct 2022 12:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOpw-0005kZ-J7; Mon, 17 Oct 2022 12:03:16 +0000
Received: by outflank-mailman (input) for mailman id 424361;
 Mon, 17 Oct 2022 12:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okOpv-0005kT-KX
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 12:03:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a793cf9f-4e13-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 14:03:05 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 08:03:00 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6801.namprd03.prod.outlook.com (2603:10b6:510:118::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 12:02:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 12:02:58 +0000
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
X-Inumbo-ID: a793cf9f-4e13-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666008194;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/5ggrce/QHUTCx7MXmqe/YGr+Ap2etTSkjFEU7hGmqU=;
  b=U+S0BoUesI+oW4FU/nTvHJSd2R7LOEF/D/7XHQ0x/I8RdlpmZUTTzkpS
   0npVCk2WiVJjwZNI8nj4vrUkRIryCFX57CBmyCgC4G/+1G/xZdfWi6vsF
   RXhQqrviAPCy6iZI8V5ObTRdpPY6GFfkeXsU2Xjcce56m2wZEwB44y0Sd
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 82520829
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YF7k/alM4HD1K1vl+ZCVsZ3o5gygJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXCDvUOPfYYGHzKIt0PdzkpktV78XSnNNrHlQ6qCgwRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRnOqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHUEV8
 MMHJgA2QD+hvaW4mpyVesAzr5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXOhBdhKROfpnhJsqEeCllYwCSQub3a2nvr6pGG9dv4Ad
 GVBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+zpog210vLVow6Tv7zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:/eWmxqFqv9+WaK8RpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.95,191,1661832000"; 
   d="scan'208";a="82520829"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Phv3npqMFHgloSU///MMdEGGrAqWCu030ZEGO77SBRwbEBi+woGvI9Qwny/SxmE2iZicm6Uz/rzvLMpIrRRCAwO4UYifZxAt+uSGt062adX7nl+zI914cvEqODbm3uvMpzp3WFCMn8FklkEpk4cEKIiypyi+2nppJ3sv4Yjp25eZ+1sWkqY8luI8T1Wq4FuuF6IWQQY541S7hpukojMPkgKglf91CyXovpPBZfxepG/DW8myXjaOVuxKDxGaaJrz1cjfOUX+ejG7RBs8e4eWCP2MIIV+4HZmnaIX5L1K6bvJKNcoPm3T2Ra2vizn9WfnVCWcAmV42WDcdJWbiTGRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5ggrce/QHUTCx7MXmqe/YGr+Ap2etTSkjFEU7hGmqU=;
 b=QhdxyZOEN1hf4xSFIOU0aaQjjRLyXHyNv6/84N1qZjZcdw7fc3niUnLZq5wIZdma0esfePsMw2WDtFymcw9zeOyyvagJ0K3hcvJH2q5UWBGXdgeQhzAAQpCBAYua1UDeMd2NN+LHBWssJcsZRPg14/g5DYS9NUzatEuwcgbfh9Ti+h0HrMPAQyhUhDsILcmf5VFk5fYZ0sfrwQTw1Wj1U4w5dZ+uD0UqllPtyqvU2dgbbC+t8J0OguWunSVu2XzXzrkkF1C+kcn7wwLDrhOYqhwud2p9pzak/wStrrykwXHqLXJXyUCQkvaBmmXIYYvbHT4Ee6U8RmDU9xbQ+sBLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5ggrce/QHUTCx7MXmqe/YGr+Ap2etTSkjFEU7hGmqU=;
 b=ukfGaIXOc+giyQO6mXxWZzvzd+8aLfzq3AuqIGPuiFceUGwUGwsaXeF6FDJipa4zpCTCNYPStLz6MMQA943FOocgn/+ZH3m0yS/yQ7IboQuVDwgrROKMzrxNAiP/oEAceJ9/CRUgFetDn0aCL+hGOsj8CFGhVnOm/fZEvFStKZs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17] tools: Workaround wrong use of
 tools/Rules.mk by qemu-trad
Thread-Topic: [XEN PATCH for-4.17] tools: Workaround wrong use of
 tools/Rules.mk by qemu-trad
Thread-Index: AQHY4hQGpCiXp3RqNU+NZuzB/jW9aq4SfKKA
Date: Mon, 17 Oct 2022 12:02:57 +0000
Message-ID: <e4ea8113-9d93-995d-ad7a-d75fedfe1aaa@citrix.com>
References: <20221017103403.63218-1-anthony.perard@citrix.com>
In-Reply-To: <20221017103403.63218-1-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6801:EE_
x-ms-office365-filtering-correlation-id: 66ab6bbb-c3d5-43c3-b290-08dab0378829
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fd7ah8SyoAo4wKhCChBMO2K8Ql6dVNdLrcB0madPCuHOQtjyXS/62ku5p/U5ajnaLeC6AUM4wWTxlI+7etXKem2D2XtYr1Bf13BZseyhVHjhS1ZI5RbtD2BjMKA9QdmZdoLZTxekq5Xbn7qfiNTSgI4sCF9e5NuvHUhzXYbYcr0Ssa6CiyGQm1bsety+QuPzMajCr3Ol42cweEAvw8v5ea1frC+BEeBs+kXja7x6gmJI89t2Etaq5cGUFyIXDkkgfi5rOqJlJHekoStCvD5XGnM000GnflfiMt3QPgdi3QFfHMbaOyr0hTgTx8TEBeZ+Qgu0cGAq6ho5FcmqkvOT1TLzfSy++UXU5gzvHvtAypi5FhHPKanuZZDvu9kxTwlrBTwPuKkpDrKqaXdxmpRIpxVSLDIQnY3hHUOmGInA3tKoJLctlhihtrD1LeWMAeoOw1Uq25JKZ8C39w95FXC5HGKkKCWOPteLxINTkQm2mDNJHPoANJ5YlI45xpWaz+dOnbJfNuNdYVyx2mg9Nj8p94JT6cV7nEj+y2Gmjr7vdcnJSmrcrZRXgT/c1GklwPOMJU4VPdVCSlzllns+aiOD//iSDUbZVouHa7qUUAyFupJK+YTUnxH2T6vlxPpyFxPhkeM1s7GMU6j6R0+DX+SyWe8ViPoGElTMsmAPrwKtO0UcTnalBpbeK1KlsOZJw6BVfTGR0oJ6Rkk0bJxNq8edsCGitMSWFB7EnApbv35Ek/gEPh47eIDkm+AHVncm6o5NF9b+//FzpkfvTQ2QmX80kKDZ1Pa45+uFtSVTMs3bmEaNOTKlff4SgqrqsANXWjSobm9E/5iswUNi0FjoGOHLxQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(2616005)(186003)(83380400001)(38070700005)(31696002)(86362001)(38100700002)(82960400001)(122000001)(5660300002)(4744005)(2906002)(53546011)(41300700001)(8936002)(4326008)(8676002)(64756008)(478600001)(26005)(6512007)(6506007)(316002)(91956017)(66446008)(66476007)(66556008)(66946007)(76116006)(54906003)(71200400001)(110136005)(6486002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1p6YzJlZzQ5UzRacGJISU5GcnN1NGllaGJUbzJDZVBsN0oySDEvNEZqVnZY?=
 =?utf-8?B?QzRrbTFlQUxSREFzZFQ0aEo1akszZmQxa2h2MzNmZkYzczZpNzgxOHBIbjFv?=
 =?utf-8?B?TVIwRDRNRTR5TFVIOUhEaXY5TWhDaE8zd2tldDBWbE1OYlhySTFqQS81UVpH?=
 =?utf-8?B?NmxKU0hWWEtSVUg5SzYweTlSR0lFcXNqVXNKZUVsQzJmUDY3QTd0R0ZPUGxj?=
 =?utf-8?B?WlZQSXZYNkNDTWpoK3JFU0lDOS8xSjYyWDNGeGRBa1RXdnRLTEE1NC9neXFT?=
 =?utf-8?B?ODhIQlFxYmZuMVdaZVhqUXpNTmE0ZWhlQUtrR0pTQUZLUHEvcUYrd0o1RUI0?=
 =?utf-8?B?b3BKdFBOUEFDcWtkRWRyZGlGSGMwQVU3WnQ2OUNKTzNBSG1GcEFMNmN0cmF2?=
 =?utf-8?B?TFFTS0EwSDdFRTFnaXkxb3dGbmdxOWNRMFJBK3Y4bjEveUdmeVRyTGtOY1Ay?=
 =?utf-8?B?ZEczdFVWY1lsQzU0azU0ZWQ4UStSeEN2emxRbmlsQytLajVqK0hENjc4SUsy?=
 =?utf-8?B?QjU0TEJQOVJBQWFNRWtOaFNnK3FhdzBKRDJaYndkaUN3cW4rMDF1QzVpU3VG?=
 =?utf-8?B?Rm9Ma0JQQmEyeldlUGUvSEx6bk84RzFXZUVsU3dlNlJKSEY1REFvTWN5U2Ir?=
 =?utf-8?B?MWJSTmdYVlFod1BXMVJIU1hwajJldGYzb2t3bG9kcXZoekRoYVhDT3ZTc0RL?=
 =?utf-8?B?anJuZ1FJOEVkOTFsU1l2WndDWFY1TlkzOWhvSG1NM2V4ZzdkNDY1ZDhibWE2?=
 =?utf-8?B?Mk9DNW84RFU5T2V1MHRORDQ5UFRZT3FWN2tra3RqeG5pQXdEQ2cxSVlBNU1L?=
 =?utf-8?B?cG0rSzc5ajdFNllqVUllOHgyYkFDbkRCZnhRRlVQN0NYY25aYU5qR0VwL3Vz?=
 =?utf-8?B?a2UvQnNmUjZ5a09KS3ptcTE0cGFzaFdIWHUraFlyNVliMlBpdFJXbUVoQUFx?=
 =?utf-8?B?RWJGQ0drZUw2ajRRT2ExcUl3b2w3aWhiM1Z1aWNuR1hXMkJCbVVHbEs5enJW?=
 =?utf-8?B?bzFkTEY3anNSVTB0SVc5d1MyRjBvbnhzWm45M0dBTDJsSEVFZkxBeGN0eEVp?=
 =?utf-8?B?MGFNdnVFWUZEQlZ4YzZ6cFhCMCtsM2JZVjFlRllXYnhhdXRpZzIwaUlnR3pQ?=
 =?utf-8?B?VTlzZzg3c3hVQ0h0QS9yTHl6NXljdTFGMkxvQ3g3eWRVTFJEYkJPK1VkYUFS?=
 =?utf-8?B?N2pERVpHR1BNbVBCaUQ0M3Y2UENBdFZhc0xTdWRMdm5xb21MMjZ1TEFLeDY4?=
 =?utf-8?B?ak5lYmJFYzk3TUlJQ2VhMjVlMzArc0Nwck83MnZkUnRkVldicnUrVG1pdjJw?=
 =?utf-8?B?RkVyRVhTaEtUUnpwd3NNUHNLQitJNUt1Qkdyc0FobHdlQ2wrVHQ5SDhkeDhj?=
 =?utf-8?B?d1EvaVFRdVE2THBWK1MrV1ZJb1pKR0piaW1pMmpVZExtYm95UDZ4Rm9mUm5O?=
 =?utf-8?B?cTdhTDZQWXJVU3ZlT0tOeVZIcXo0WUZQaysxRm1yRG53aDZBbVpmR3dZYnFr?=
 =?utf-8?B?VlMrVUhYZ1hDN3lSVk1XRWVWOG9MMnNoNm9STEtmZURxVEsvRXl6bFYzZXpu?=
 =?utf-8?B?dHZja0N5TEsrRTZvT2RtMmUyVG4zUmFqbFV3S1R3THhXNkwzdzFmN0c4N2Uy?=
 =?utf-8?B?enp4UlVUMDBreHNlN2NrN2dyQzgrdW9QS1BpWW41RUczTTVzRkx3YjhIY2Nv?=
 =?utf-8?B?anltTk1sai9XL1pXT1pJTlVnZFg4Q1FGOEltZGpFZUV2Nzg4bm4rYTUwcXpN?=
 =?utf-8?B?QWh0MjRiWG9abFFHVHJxRDNWbTVSeG4wYzRIVHdDMHVkVUYwbm5IdEhhZ2s1?=
 =?utf-8?B?OEVEYzZ3SHVXdUdpY3BvMnlyNGluK04zdUgvanFIbitPbzNSM3ZKWDMyaEtV?=
 =?utf-8?B?WFlwWEtwRlAzV01yb0JLMDZDMWExQTRiZW13ZXI4M2tKMC9FNXJGYTRPQjNl?=
 =?utf-8?B?MVF6bjAvRnFwR0tGNzkzakw0blFjOGhxb3hVeXdVVjBnRGJacXZGRy91SGVi?=
 =?utf-8?B?NnpzQlhQeUk2NUs3WkZ2UkVHeDArT2Fybis0WDYvYzIvcnRQSjFzMmlxb1JG?=
 =?utf-8?B?RWxVNFVTNVA5b0lkT3RZWlZ4eGJqOFcxRDhBa045UENIUmx5Tm80WXlJRFFK?=
 =?utf-8?Q?jwHejQAgFO4FYR6u44TNP27xj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2264191DCEB54442969680C84C721873@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ab6bbb-c3d5-43c3-b290-08dab0378829
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 12:02:58.0001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0QSIyX43JKaPhyhrmxSvWiHzzov0p7+X4lR9RFnlZKl9aaehjF0yLPUahF13WpgA1FpfBWNxd7lML93OLCDgSWFrm3Snrxr5dHar+5y4BqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6801

T24gMTcvMTAvMjAyMiAxMTozNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IHFlbXUtdHJhZCBi
dWlsZCBzeXN0ZW0sIHdoZW4gYnVpbHQgZnJvbSB4ZW4uZ2l0LCB3aWxsIG1ha2UgdXNlIG9mDQo+
IFJ1bGVzLm1rIChzZXR1cCB2aWEgcWVtdS10cmFkLmdpdC94ZW4tc2V0dXApLiBUaGlzIG1lYW4g
dGhhdCBjaGFuZ2VzDQo+IHRvIFJ1bGVzLm1rIHdpbGwgaGF2ZSBhbiBpbXBhY3Qgb3VyIGFiaWxp
dHkgdG8gYnVpbGQgcWVtdS10cmFkLg0KPg0KPiBSZWNlbnQgY29tbWl0IGU0ZjU5NDljNDQ2NiAo
InRvb2xzOiBBZGQgLVdlcnJvciBieSBkZWZhdWx0IHRvIGFsbA0KPiB0b29scy8iKSBoYXZlIGFk
ZGVkICItV2Vycm9yIiB0byB0aGUgQ0ZMQUdTIGFuZCBxZW11LXRyYWQgc3RhcnQgdG8gdXNlDQo+
IGl0LiBCdXQgdGhpcyBmYWlscyBhbmQgdGhlcmUncyBsb3RzIG9mIHdhcm5pbmcgdGhhdCBhcmUg
bm93IHR1cm5lZA0KPiBpbnRvIGVycm9yLg0KPg0KPiBXZSBzaG91bGQgdGVhY2ggcWVtdS10cmFk
IGFuZCB4ZW4uZ2l0IHRvIG5vdCBoYXZlIHRvIHVzZSBSdWxlcy5tayB3aGVuDQo+IGJ1aWxkaW5n
IHFlbXUtdHJhZCwgYnV0IGZvciBub3csIGF2b2lkIGFkZGluZyAtV2Vycm9yIHRvIENGTEFHUyB3
aGVuDQo+IGJ1aWxkaW5nIHFlbXUtdHJhZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQpxZW11LXRyYWQgaXMgYSB2ZXJ5IG9i
c29sZXRlIGNvZGViYXNlLsKgIFdlIGRvbid0IHdhbnQgdG8gaGF2ZSB0byBiZQ0KZml4aW5nIGl0
IHVwIHRvIGNvbXBpbGUgd2l0aCBuZXcgY29tcGlsZXJzLg0K

