Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F963C9EF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 21:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449638.706519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07eS-00074l-5I; Tue, 29 Nov 2022 20:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449638.706519; Tue, 29 Nov 2022 20:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p07eS-00072o-2F; Tue, 29 Nov 2022 20:56:24 +0000
Received: by outflank-mailman (input) for mailman id 449638;
 Tue, 29 Nov 2022 20:56:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xNwm=35=citrix.com=prvs=3259bd577=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p07eQ-00072i-K0
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 20:56:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46346cda-7028-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 21:56:21 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Nov 2022 15:56:07 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6252.namprd03.prod.outlook.com (2603:10b6:510:e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 20:56:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 20:56:02 +0000
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
X-Inumbo-ID: 46346cda-7028-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669755381;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LTmFTHcwAtvjl/r0aHSO93RhTAYtQeVD5U97Z2P3nWQ=;
  b=RSnm4ucckbgJbLfAXxj5rBAgeAHbBQ7thggDTGNq65WqH4XWSOxOxJj7
   BkSN7cdszLgrFMrlbeQ41oAtwOHSsmMtWyv1/eKz4VIEehHDJLn2g0nzf
   cNKpKwJSL4qDDQQQh0FhEDFn+uwxeC8sNErTYZcRdxaRJR08MWAKCTUbj
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 84845013
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:n/joIanJ94fVl6w8UUtxJUjo5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXDzUaK2JNjHxftp1b9y/pEIHucfXyINhSgdlrS0xEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5g6GyRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aEhJh40U0+vu6X13pT8c/g1jJ4jMMa+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSO3kq6Yz2zV/wEQoWDIZRAGQusWIiw27X9ZCE
 1UQ9BUx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodjiBvKF49nCPTs0IyzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxaYowFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:1LaVzqN3v1VWGsBcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaWtrY
 7/Q9tVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjvwQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MCLEGBxZlj9GEkDPw9jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.96,204,1665460800"; 
   d="scan'208";a="84845013"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO0YKzovH4VXg7drbLVCnSXldlE6kAiXKqu1t014/Z1vs3wVX65Gx2/XEacSklryEeUhmOOLuJjB2rUd5Ms+RST8V9BNvDGH2K11vk9d6tmoZ8/N8Xnx1hekc4JuDnPRnFPkroDBeeYgHIeH4y5sleFa7D0MgdmG8GQuxLTvy2NRrf3yiTydDlNT0pxiIHf9IBxdUg9PsrsB6bTVkyRjTqeypCHoqKbAqp/8nu1NwF1Id9t4jVkNLL09Zi59hihN8gwAw3Zn8vsSZVOBg7b8OFV6d7M/MwTBgkE15PoTnlyibMn67y7cfEN1vuiuRzaHQwqTEWFjAap3QGN7BFTHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTmFTHcwAtvjl/r0aHSO93RhTAYtQeVD5U97Z2P3nWQ=;
 b=J+4KWH4PAExB6j6S+qGCdQca/ljHysF9UJhr33v2jDQXs1lOgGJY3Nzo6uzA+0amQ1q9xJ1BKCj0Mb9R2xpn9uHgJVnEw4keSwMoO5jDMSPvfv/dX75MRJ8vgF4iIdrfj3s0FkgOIEurC9/epw4VSntKSTqrM48iITNZaIgxkWyCo8Nq9KM7uxAzfPB6Ugna/SW4wP1QcdxwrCC77FhGg1Lsm7nyfnea8M+MN1Hi8UQSaQpXueExyWExunjyZ9Cv8ehMu2ZC92Gat+fMav8wQzeBc93imi9mAyMcrjP402Ugd2MpTfFUGuDLix/3l1flSeqMZbgYjySLljqJfNOIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTmFTHcwAtvjl/r0aHSO93RhTAYtQeVD5U97Z2P3nWQ=;
 b=fKjr7rPKsmQWPuhT6rHGpG+8fr93vk02s7GbcJ4kKeVu/DwNaHRpqRW6IKnTfz3+btlPitbZqSwLSXgq+WbuBQROxzVrgR7q0qBczWJWBK6xgNEvzQFSJ46AUsOcQDh7kO30Cr1i7RuqdurNv1AX0y8Z0rq2eQinOV/QEk91ySs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Topic: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Thread-Index: AQHZBAKvvRJ2heCKJ0SiESCucWQuIK5WYfSA
Date: Tue, 29 Nov 2022 20:56:02 +0000
Message-ID: <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
References: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
In-Reply-To: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB6252:EE_
x-ms-office365-filtering-correlation-id: 2de3d3d5-48e4-4528-a252-08dad24c1fea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 i1XCKv9+3dnmIImwY2SJM1m3A0VzQtSGcoP/bcu1lMKJrWb4MAK9jN2lA+NHtkyRpR/cHH9yNNhSBqiTc1qq8U9iwcCFLsxcni6Ei5FYgQ0BaLR5fVcMigJkW+frmfGNen4vYTs6QdWIH9ScjDa2uj7obkT3Noh020kCLRHKzdLbzDQ3AnKI5waQczkMNG1bQGyi2/08CWl5nog5CorAHFXINEFTAOtPHZTfbpZDmlw5ZTfAhZAowcTmEs6/ELX1rD8B7KTHfv3sM0Av1rn4enCBhR3zR6LVfytc4GMgOzFxPDRjpVvlnHUtlav0YP8EU2vhVhNWxlmTr+b9ghlB0rKjIAoR0JBuD3GBvuxfC9gv4se+sd3jkiI9f5d5tMILqccmzROV7+qXA4MHH5ycmU2ZDao6ra1RXKho3ElT2BzYjHE3v6lF1DDfy/ekO+NRIENR2uF+nVhHG5jajNmMQWiUSOVDNfs5+tmn9TvfJ4FvFosRbI4rvNYclaJqKs/SGHM675LVKyvJccNXnkP8GKaYNH3Qg62SJ9zVE5wcePdisu2oBH90LINTAR2v6ETMk05JnEqDhAm1d8o5oA4Qg26E28QvgPasuX3PfHOczl0q7HVOH8pzihhh++k2aPmKT/+RDyP5E2bhUoN0Pt0fSHGHBGEEaSHCSDK2wLSaOQRoWFqSyk4TP+lSXrpOM2SBh4SFoFMwSmwiLxCDi5TYX34gGLH5XDG3R0/KRsxZ0uDZJskDk/0mtPbqQQ0aDQ5EnfW23orLchuLaUGdig35Rg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(83380400001)(31696002)(86362001)(8936002)(38100700002)(122000001)(2906002)(110136005)(38070700005)(5660300002)(66476007)(66446008)(41300700001)(107886003)(53546011)(6506007)(2616005)(26005)(71200400001)(186003)(6512007)(64756008)(6486002)(8676002)(91956017)(76116006)(66556008)(316002)(4326008)(478600001)(66946007)(54906003)(82960400001)(31686004)(66899015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cFhIWmVLbkZRa3JSNWVtY1B5NWg5UmczSzBQeFNMN1RxTm1VeGhJUFFIbitv?=
 =?utf-8?B?RmNkL0IyVXZqWmhRMWxoS0NhamdhVGNZM1o2dGU4TzlrOHpmaFRKWmhmSDhu?=
 =?utf-8?B?TVBud2FqTW52VUFaSldWdHZQN0ZWTDdxUGJ0YVJyOW5iK0NTVVQxQ3lmcUhk?=
 =?utf-8?B?bWJCVjJoTkZIK2RMSVc0ZzAySlAwU0xEak9NejRZaHFscjVVTXJEMUFTcDVw?=
 =?utf-8?B?Uk5HTjNiNWEwU0Z4V3U3WGRocDBXVkxyb0tzZHpnaVdWT05TbGE5KzVXZzNF?=
 =?utf-8?B?Uk5iQ1prM0l5NFd2bGcyOCs0UitaKzdKQnlobG85UXQ4QWk3dkpBM0FkUUd3?=
 =?utf-8?B?MXJyd3pxMHpINkU3NlIrckdMV08yRUppVEY4YWR6MExEbmJTbno1TndyRUxM?=
 =?utf-8?B?NkJiVUgxdDFOSW5iNmozaDVjbWdDYlVVYVBCMmNEb0pnMDMzYURNaWxjcmts?=
 =?utf-8?B?Yk5VcklPaVE4Ky85VXg4TitmTGJZOXRHV3o1eWEyL3JRVlF6L0NGcmFYZ3ZG?=
 =?utf-8?B?bmRkNzF0UDVLQ25IcU5ITnZNcDNTQytzRTdkdnBWaTFrbGVGRzVLZ1g0bnF3?=
 =?utf-8?B?UHg0eGhZWUpmOVpMMmRvUXAvekhxN0VGK1UzKytEczlsOWs5RTNCemg3VTdK?=
 =?utf-8?B?c0ZaOUFyQ1p2Y2daRUtZSlBxQ3RIZmFKd0oySi9memxXcVdBMHd5Z1BSdmF4?=
 =?utf-8?B?dXhCTkZnaUx0SmZ1ai9iRXNGZTlEa0hCZzNGWnlJL2l3cWFJYmlvZHV6ajIx?=
 =?utf-8?B?aVFVVHVZOWVZNmYvdEE3ZUhML0Z3Mi9odGQveFR4NnJJWEhsdHQrZ3R0NUpx?=
 =?utf-8?B?UWh6eDNZcTN1L2tBUlIvK0wza2x6RmRzUGZxTWdsV01NUkRnY0p3TmNzeFJy?=
 =?utf-8?B?d1NTU29heEpoSDhLK0FlM2ZYWDdadk5GTXI0N3dvajZwemRmejRHbkJRL3Zh?=
 =?utf-8?B?UmRmbGg1dTFsSHBkMzFZZEJIaGRsTjhCVUxVcjJFdjhGYXp4b0VnbGlxYjMv?=
 =?utf-8?B?aVdkY0ZHWnAyL25FcVZHYXN4cUcrNEt4SFJ4UXBMTDJsay9STW1IZjlsYXVQ?=
 =?utf-8?B?S2cydlFTQkhtRGJaNmtvVFN0OGszaTVRcUdXOUxzOUcrd210RmhvS2FHaXcz?=
 =?utf-8?B?cWhzRWI0TWxEWlBuZi9IM0c3cnNicHBBREcwSzcyOUU0c3N6UmMxYUcvc0Zt?=
 =?utf-8?B?ZWlad1RjM0NMS2N3b2JxYTgzVGVTRVhvSzdoZk1mWENnQ3M5bE81Q0U2Y2pv?=
 =?utf-8?B?SStzYWwrOEpiRUg1WWZHN2s5OXg0OXNFazRiL1JGVmZ6b0o1OERmUyt5ZDVI?=
 =?utf-8?B?K05FRlVkR2pWdjd5dk1ObGM5clFKZDJld1F4Y2xJL0hRbmZ4UUJjSzhUYkxX?=
 =?utf-8?B?eFdsREJJYThTVnNPNUVBNUVDSjhRVlVJTUxibFRxMXF1QVozTEd6MmxPWXNl?=
 =?utf-8?B?R1JBTHQ0a3cxSXNaSzl6dmJWQkZKVjlGdlY2ellNMkEvSEEyRUZGcVlPbXky?=
 =?utf-8?B?Ykk0S2k2azNFUGlXbzh3MnpuNmMzNk5pT29mWDlBWjBEbjdYTFBNcVVBTkNi?=
 =?utf-8?B?eUhZd2RhWE1TbnpNWUEvYnYwb3h6OEZXc2tkWFdPWU9vS0VrNG1abU5QNWFo?=
 =?utf-8?B?K3BNVzlwMGgxZVVIQVBRc3FVNk9ZS2pFUmRER05lZTZ2OWxrU2hZNG5FcUlG?=
 =?utf-8?B?R2ZSRVlHNHNkVHpxTG0wYXNBRDBPMlZtVUhRWHBnaDRyZmRBdFFhN3pEWUdy?=
 =?utf-8?B?TE5nUG16Q2ZiTXI5MnlNVWdQUExQR0hvcDdjTEN4WUMzMndwNzdpRzU2U2Rr?=
 =?utf-8?B?MFd1RHpIdzhCQjkyaDBZcTIzQ2RBazhIUDVDY0ZyVXBmZUlTSGxZRGVFbkdh?=
 =?utf-8?B?RFQ3aHhFMW5Bek1XSFU1N1NqYXdrVjFTTWt0MHlaa0ZJWlRzeFo0VTJ4V3hj?=
 =?utf-8?B?NGFob2dIQVl1d2IwZGQwNlVWQURhdXJWTWdkMjdYOWRGWm5uRVptZUhHb1NI?=
 =?utf-8?B?QWFoY3IzaHRsczAxVGF6WGdZK2Fsc1hqYU9MV3RsVTBTZkMrei9oQlVSc3Qv?=
 =?utf-8?B?WUdia1RuTCt6Y2R6c1dQNTdxR1RRblJ2aXl2ZmZUcWxlUERlV1RyMjlqSlho?=
 =?utf-8?Q?81yu2F7lvxPycdb5xbeRhe44W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <181339373DFEB04782D10284F3CF8947@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hDNM/8grL/mEilJchrHqqkIsnLxVmwyMnNnxhzkZfvohDPEqDPtXDJt2+DU3mLaHzgBkrF+Sh9zaF8SiwRAwx6PgJaLYXZSHrPDHYfL//siiRaKe8RRSc7eyE9Jriv1tjQbDE1QWjtu/C67U2C0T+hqYBu+Nxv6lxiGdDMltA3ryRfousRfTQDjdK0jQ8oR7r/OC9DSzYxoHcjtVnct6f64UXsLD51TsMsyB5MsvbLPUScXCbwiIW1c+UCteDuHjzfnX7IlJIQ48mb9UMS5ZafRshPk1iljujDuaP2F2H4oUiHN8vg2kGtEbhKICuTe3uDchYbj4yp7KjZHjG2fWr0Wo583N0X8bGwBUnAsZZpBrKXxXRbp6msYA7oQiy4tpbJTZtStQY9xTpWOrEJHuoN+fqKTP8XzJMjhlKTA2dUcksM50ExWl8hLa/JK9TsoLpTorJ68EBznFGrjcO97G5tKbuSqtJ+c6PoM17RL4Lbg9VDW5dOEki/TABmPQSqh3etLFb0jv+rs147XR2NaE+UNsolHVeUxMRnCmz5K9x0Hf5AOMuh2gbbs/3EGu7ZtMUvH7kHz/ze7Idj99Uepdpz7Rywq6xuj+6Ji8PZaN6tLom5As+n32HBFXVxZFo2shbNpi4frpbm1WvdeGQw0+MjdR9Z8CCeFq7KTotUj+7lz9HOjc2nabIcZlGvye2zlCPB1tXMwUVa2S4d4/eWs0WOE851ZgkhONQ9WBvvYEtHUnnodMff6ZNvSfNlJRk3+foMSjE6pLiYYCusI7l5cCL3UNdjofX7eATHwfNHpPuuEbnOFxyVOy44ci7VOrWIeTJgmR8j5dvMaRRg0Nl/5/+Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3d3d5-48e4-4528-a252-08dad24c1fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 20:56:02.0852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gYsPs7Ri44HGSKxxDJoZ/Tb0m2jH3ERadd0rR81afls6thQrA3Co7RJNJq+woQBGnwlPJc0FeEtrWBGGsMb53jlLs/zYQ9u63PmDl768GaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6252

T24gMjkvMTEvMjAyMiAxNDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEJ5IGRlZmluaW5nIHRo
ZSBjb25zdGFudCB0byB6ZXJvIHdoZW4gIVNIQURPV19QQUdJTkcgd2UgZ2l2ZSBjb21waWxlcnMN
Cj4gdGhlIGNoYW5jZSB0byBlbGltaW5hdGUgYSBsaXR0bGUgbW9yZSBkZWFkIGNvZGUgZWxzZXdo
ZXJlIGluIHRoZSB0cmVlLg0KPiBQbHVzLCBhcyBhIG1pbm9yIGJlbmVmaXQsIHRoZSBnZW5lcmFs
IHJlZmVyZW5jZSBjb3VudCBjYW4gYmUgb25lIGJpdA0KPiB3aWRlci4gKFRvIHNpbXBsaWZ5IHRo
aW5ncywgaGF2ZSBQR0NfcGFnZV90YWJsZSBjaGFuZ2UgcGxhY2VzIHdpdGgNCj4gUEdDX2V4dHJh
LikNCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
DQpBaGVhZCBvZiBtYWtpbmcgdGhpcyBjaGFuZ2UsIGNhbiB3ZSBwbGVhc2UgcmVuYW1lIGl0IHRv
IHNvbWV0aGluZyBsZXNzDQpjb25mdXNpbmcsIGFuZCBmaXggaXQncyBjb21tZW50IHdoaWNoIGlz
IHdyb25nLg0KDQpQR0Nfc2hhZG93ZWRfcHQgaXMgdGhlIGJlc3QgSSBjYW4gdGhpbmsgb2YuDQoN
Cj4gLS0tDQo+IHRib290LmMncyB1cGRhdGVfcGFnZXRhYmxlX21hYygpIGlzIHN1c3BpY2lvdXM6
IEl0IGVmZmVjdGl2ZWx5IGlzIGENCj4gbm8tb3AgZXZlbiBwcmlvciB0byB0aGlzIGNoYW5nZSB3
aGVuICFTSEFET1dfUEFHSU5HLCB3aGljaCBjYW4ndCBiZQ0KPiBxdWl0ZSByaWdodC4gSWYgKGd1
ZXN0KSBwYWdlIHRhYmxlcyBhcmUgcmVsZXZhbnQgdG8gaW5jbHVkZSBpbiB0aGUNCj4gdmVyaWZp
Y2F0aW9uLCBzaG91bGRuJ3QgdGhpcyBsb29rIGZvciBQR1RfbDxOPl9wYWdlX3RhYmxlIGFzIHdl
bGw/IEhvdw0KPiB0byBkZWFsIHdpdGggSEFQIGd1ZXN0cyB0aGVyZSBpcyBlbnRpcmVseSB1bmNs
ZWFyLg0KDQpDb25zaWRlcmluZyB0aGUgY2FsbGVyLCBpdCBNQUNzIGV2ZXJ5IGRvbWhlYXAgcGFn
ZSBmb3IgZG9tYWlucyB3aXRoDQpDREZfczNfaW50ZWdyaXR5Lg0KDQpUaGUgdGJvb3QgbG9naWNh
bCBhbHNvIGJsaW5kbHkgYXNzdW1lcyB0aGF0IGFueSBub24taWRsZSBkb21haW4gaGFzIGFuDQpJ
bnRlbCBJT01NVSBjb250ZXh0IHdpdGggaXQuwqAgVGhpcyBvbmx5IGRvZXNuJ3QgKHRyaXZpYWxs
eSkgZXhwb3NlDQpiZWNhdXNlIHN0cnVjdCBkb21haW5faW9tbXUgaXMgZW1iZWRkZWQgaW4gc3Ry
dWN0IGRvbWFpbiAocmF0aGVyIHRoYW4NCmFsbG9jYXRlZCBzZXBhcmF0ZWx5KSwgYW5kIHJlYWNo
aW5nIGludG8gdGhlIHdyb25nIHBhcnQgb2YgdGhlIGFyY2gNCnVuaW9uIGlzIG9ubHkgbWl0aWdh
dGVkIGJ5IHRoZSB0Ym9vdCBsb2dpYyBub3QgYmVpbmcgaW52b2tlZCBvbg0Kbm9uLWludGVsIHN5
c3RlbXMuwqAgKEFsc28gdGhlIGlkbGUgZG9tYWluIGNoZWNrIGlzIHVzZWxlc3MsIGdpdmVuIHRo
YXQNCml0J3MgaW4gYSBmb3JfZWFjaF9kb21haW4oKSBsb29wKS4NCg0KSXQgZG9lcyBsb29rIGEg
bGl0dGxlIGxpa2UgdGhlIGNhbGxlciBpcyB3YW50aW5nIHRvIE1BQyBhbGwgWGVuIGRhdGENCnRo
YXQgZGVzY3JpYmVzIHRoZSBndWVzdCwgYnV0IGRvaW5nIHRoaXMgdW5pbGF0ZXJhbGx5IGZvciBh
bGwgc2hhZG93ZWQNCmd1ZXN0cyBzZWVtcyB3cm9uZyBiZXNpZGUgdGhlIHBlci1kb21haW4gczNf
aW50ZWdyaXR5IHNldHRpbmcuDQoNCn5BbmRyZXcNCg==

