Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E94375F4A
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 06:08:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123759.233484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lerlS-0006Fo-KD; Fri, 07 May 2021 04:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123759.233484; Fri, 07 May 2021 04:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lerlS-0006DY-GV; Fri, 07 May 2021 04:06:58 +0000
Received: by outflank-mailman (input) for mailman id 123759;
 Fri, 07 May 2021 04:06:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agx6=KC=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lerlQ-0006DS-Km
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 04:06:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1bdfedc-3c58-42dc-9da7-110fb137233e;
 Fri, 07 May 2021 04:06:55 +0000 (UTC)
Received: from DB6PR0601CA0024.eurprd06.prod.outlook.com (2603:10a6:4:7b::34)
 by AM8PR08MB5603.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 04:06:53 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::c9) by DB6PR0601CA0024.outlook.office365.com
 (2603:10a6:4:7b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 7 May 2021 04:06:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 7 May 2021 04:06:52 +0000
Received: ("Tessian outbound 52fcc5bd9d3a:v91");
 Fri, 07 May 2021 04:06:52 +0000
Received: from 61a990d8c294.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 60DD2C07-0A7C-431B-8096-2587661F36B0.1; 
 Fri, 07 May 2021 04:06:46 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61a990d8c294.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 07 May 2021 04:06:46 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PR2PR08MB4748.eurprd08.prod.outlook.com (2603:10a6:101:1f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Fri, 7 May
 2021 04:06:37 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 04:06:35 +0000
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
X-Inumbo-ID: d1bdfedc-3c58-42dc-9da7-110fb137233e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx5ewWZhaU7kL7WXqUZVcrXrshUKMDtOMIsINzIIukw=;
 b=Z5+F5p5THg7doCKyRFU0BaqzWNlcAzLrkUEuJvKddBYRtzZKjdjQs6Duw0/wTbFxfd0aJh+XNlrIdSW942+cPeuXmIAOrnHRtrpSEykXYy/17YrFkp4rZ8ZJkuzL0KAHKS/TA6Ju0rh2/TlXoNYQU3BHBSQBdMVyT4JFEhZHhxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mkuf0gsNGEsM2y9SEkCKroe3ukIaMT9jaSSukWHfhKPTMoxOlcqw+BKdtZLGKiDnDVzBSdmogMBp30bKEoUD7/86jO7CLCTyUFdqVyhHyNygc/dFjGyjV0OQXXit+54pas6hT+/D3c5m55hBQomGYHp1p54wcvOxpg77uZADon7zKPRyGH46y2aGeShBKXVCJh3ntcEVLaGq5VDUVmEnBRVCGAZQPn7MN9aVLwr+lpGiAKK+9tqJlQd80XkGtI+5Ka9aCEhcKe8vKD1bcCEdeuhtaUNVUstBJfpaAoAmKKjqY+okF1DBHAfIt+RkieX50fZjouL18AOsjyHDk6fBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx5ewWZhaU7kL7WXqUZVcrXrshUKMDtOMIsINzIIukw=;
 b=fOyBeaD8ne3phbK+2OaTi+fvHfq3K4R0nwMfVs2zPCvMsoj0AUoq2lJTPZMgjyKfSRbWfC1lQVG2/Iw+UXfEWWo0cunsm7DyU21aHIfNXRPMSN4TBLbDz6ZXkBRmcHYtuNODWzFW7UlRcfjuAtJCtDWYMgA5uXX6WDo4lLDe5nxc8tpXA6KC9eXN8WHZ0TuuIrGahwgT7MNo2N1lvMYUmou+YpUkEke+GEqAb8evafZ+JImjc1xSIHj42hdUrxUrUmVb/0WRn6XuFzLaIjMmpsyy2mMOCd+J6TOJ4S4Ujz1TLeiA6tzoz+v+7ZuDXlEvmIoZgZTzsTb0oYC7ell/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx5ewWZhaU7kL7WXqUZVcrXrshUKMDtOMIsINzIIukw=;
 b=Z5+F5p5THg7doCKyRFU0BaqzWNlcAzLrkUEuJvKddBYRtzZKjdjQs6Duw0/wTbFxfd0aJh+XNlrIdSW942+cPeuXmIAOrnHRtrpSEykXYy/17YrFkp4rZ8ZJkuzL0KAHKS/TA6Ju0rh2/TlXoNYQU3BHBSQBdMVyT4JFEhZHhxc=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index:
 Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyAADhcqlAABznSAAGrycWA
Date: Fri, 7 May 2021 04:06:33 +0000
Message-ID:
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
In-Reply-To: <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4DE9EA2C25A43B4A97526981C69DD760.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 83e3d666-1f06-431d-9f73-08d9110d8bed
x-ms-traffictypediagnostic: PR2PR08MB4748:|AM8PR08MB5603:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56032372398586C215E42B3B92579@AM8PR08MB5603.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zpjgGDBQL+vArh6GmhC5HpzXrTR38XHqVFvMZlUs5OmQPlCyIAGEb0FwkN9pSl+7qZ+8M7D1Bx5lhU1u2WthcpjoRK4YW9+veuFh0Y1WHy3ifv3PTxHAoo4UFG+Aa2JghB/EiRcml4ePdX9uekCUhMHolRCKF7HvMaeohBaMB2dBCwP9/D++fpxk+uGMyU3a9C13Xl1XY3O2voyt3v/O9ROqBsBjyofaCZ5Lak69QXfSR7PftZDJG/rud7YaDQKpR38tkr0SRcHHJXOFf35pS7BJYK+0imvR5IkVTWbsWnvDPwa+1r8kGVX8ovs11wOFz6jg3NZ9JG9k6Do8iasWb6MJJpV7e/hXN+X1RLjvDig7MZ0uhcTrLwDVzze+lYbCfOclu+cR61T3jC79TGLsXJa+3p97xI0tBmMjMG4ay0DEsL7/sEa1iUwLxtLmyyiEnQYVoGe2/4AnY5BrmMdW9xnnI5dvjp4rlqMBI1wOKcdSdHJniKi1ytVzABbBxxjuZC04MoigtL0wmWcJZQWtaG2Cw+5qi/3FTymR0yqxkEVluSG/Bs5JyoTyZKWvoR7rUQavCvTm4T589dyq7FTN7EbXtCSTspQGj0lEGk+2siiOvDPYexn5SEemhALCgNd6nCOgMTFyrvqwGwHVfWgm7VZi7nkRaRhlFCbzIijkeGsAfwVaSU1SXg86r3VTJVOt
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(8936002)(966005)(53546011)(478600001)(316002)(186003)(6506007)(26005)(38100700002)(8676002)(122000001)(52536014)(5660300002)(33656002)(7696005)(2906002)(66476007)(83380400001)(66446008)(64756008)(66556008)(9686003)(76116006)(54906003)(86362001)(71200400001)(55016002)(110136005)(4326008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MVRDVkFnZ3RFMGJUY2hWcmJXRS9HMFR5aFhlRnVZKzBuckxtK2toMjF5cnVW?=
 =?utf-8?B?cW43cEJwVTg0cmlaeTlQVjJmQ2FwRW0xYTJUZlQvOU1CWEpmN0preEVTVi9u?=
 =?utf-8?B?QmhQVnhaRHh0dW41SEdSWjM3Rkl4bzg1MTVIRU1YOHllbFBsc3JCTHRiM2ti?=
 =?utf-8?B?K1FCbEd6ai95UDFxYndpdW92bjRSMkJXL2hiemxVVnpNejk5RDBRVWd6M1Nk?=
 =?utf-8?B?emwzMUQ5OExIa0hZZjR5Z3ZpdWFMamFnQ28raTFmMEUvVVBuQUcrOERwWkpB?=
 =?utf-8?B?czA2Y0hIWHUwM1VheGgrYjFtWDNXa0NtUnVBMkZUL3FTVkZEeHpHTUxBdmwv?=
 =?utf-8?B?QzVrWEkyd21QdU1UNWFpSm5mbXczTmVUejdjYTlkUG4xblduekRNUHRlVDdn?=
 =?utf-8?B?Vis2Zk9rdmZDVTRrRjRWRnNjc2xUQWtJOXY4bGtHcnptbGVWYnlJd0NLOWVK?=
 =?utf-8?B?WURzVEI4WXg4UjBFMzZZaTFPT0xBSGo4aHdnM0pIcStoWm9ZR1pmSS9LYS9Z?=
 =?utf-8?B?Q2E5aDcvOGpUM1hSbHEySnZVQ2JadXQ2bjlkY2RhR2ZGS2tYTUJUSTM2SUdN?=
 =?utf-8?B?TWFyek00YTZhbnFiRkIvYVkrZzgrcnI5ZmhpRkdOcVNkZzlKVjE2dzZndEEz?=
 =?utf-8?B?dUJyd1cwSk80UmsxczI4Y2dsYzgvVU5TSlRtQXNGYThiMHF4cDdSNSs3dWtF?=
 =?utf-8?B?enVKekVJR0NMVEtvdnBOaktpMnRlTjQ4YkR0djFSVVhncmc1STAxWUx3ZDlG?=
 =?utf-8?B?K3c4RTRxcEJjbnM0MllZVGRLblc3VEMxV0NscGJLNkF4dGxlZ0hTdS93Yk9y?=
 =?utf-8?B?WUZTcHd6cVMzUThyTEtGWStkL05UZTBPT0lmREdmZjNNTGV1MUJYQVNXL3JP?=
 =?utf-8?B?aW9NNnJjNEpMajdRVnY4elkvU0hkYjdwalFTbWplWVZ2dFZZWmNGb0dscWxl?=
 =?utf-8?B?UE1ib2x2SEZTSGRMT0N3NW9qUERzSUxYZU0xU0pvbytpWlVTNDVhMlVyb0pi?=
 =?utf-8?B?ajdXMXdoczVFcWRuN2lYbDlzelpoV2FXU0pIK0duZEZRdFg3NS8vejJQV2Yx?=
 =?utf-8?B?OTVTck1vSXhkekpSOHgzRUZPazRsMm5sbTc3ZnJmenFMQ0tqUDZ2QjJXMVNR?=
 =?utf-8?B?b2djYlhKOWRjNG5XMTlGSTZUK1prK1o5ZEtqNURHMnVzOVoyb3dnSldUTjFZ?=
 =?utf-8?B?d0MzekpaWTdTMmtaR1hmREc3MkVCMGJiRXhFV0F1aEJneE8xU2FOUHJKYVFu?=
 =?utf-8?B?UUVoUU1QLzdrNGpkSE5tay9ZaDRla3EzbXpieXI4SU5OQ09BVU43eUlBNWxp?=
 =?utf-8?B?blN2TjVQTkJTSUdtVkc3RWtIVzJvS25RMTRDQWFSdG5CUTZoSmFvSkNwS2du?=
 =?utf-8?B?VWRxbzFRRkF2NHhldE1pQnY5bWpDcHgrcjByR2FwL3BjamxIU0x3WDlSTGxt?=
 =?utf-8?B?VkpmaHl6a2dVVVBSR2JtNDJZVGdINWYxSWlFaFVyaTF5cTdsVHZRTitKazFD?=
 =?utf-8?B?dXo0dVhRaXgzUWtJYVAxNCtUcWx2bU1Ub29qSjRtQWtnbXc4S2pydjBXdmRU?=
 =?utf-8?B?NDl4RDBQRW96cTRHbkpBditPM1hCOEFrM0c3enNUWW9MZjFiMjZTZGZrM1pZ?=
 =?utf-8?B?VEphdERvRlM4NGQ0ektvVXo5YzBXeTN5ay95b1RDSm55ZFN3S2xwK1h3Z1Iy?=
 =?utf-8?B?VDZaV2RwZVhacVpNc2RhOVByd1JXaFIrVjUyM1BxL1JqUk1wbkYrMWRzQzNm?=
 =?utf-8?Q?IuSumQTw85f2swOnjw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4748
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5eb538a3-b6cc-4631-f41d-08d9110d81da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TS2gr5Rnta5rxlnaHyZHJQMefWWKK7OaaxUmR7uUeht9ks32oXgTbiUpw6fbXBj7bToEUX1LmBnMqlZWlQhUQbYFvEaYFGfOw1DOgF1Lr598fBPZNIhYVhhdwTANzwnymGfWq5NuOIixl8wwoFW3JR3opgtD3CTBd97DPDQL72fY2zRK8WZaEh7fkEo6UlHRMBiinmG0laeGf9GSrAXucOh+5d2qfxy8Rbgb2lu/ZfWQVVwswDrrzdCjTm6ybDgsI4AhmBfNXQ6czIKKCqfyuMB3gNiwQ3v98+oqnDzIcmrT377Ksh37wT7d0POT50GW7676OuWD+V8Klzh7qNa5gKW1/ns0qnfnqVjvjZ171dWRf1GOEiFch8U44dlWLnfEiwulQxLNe2UWiV1ZPXY0Hdi+FTm/1V+MXrk4vHTPiH8CQYwQklabtuLh6rhYVm7Ri1SakiBSkqEnwdd5i3UgJ1wO+OsurC2ioUizPajk4hKk/SVpzXop0mHqv8WIG2yitKcDjv3CBFTgtNPBHsRufsdY2yaKokjrS4MhkCp87Jfa55sJvLpgqDevP0OgRdQZ8ZcxdHN96+yXul7cbfhz67egBBwsfm1qdfA8LplWFpXrNqiMf1b1242INEUS98qFOXCitCLunW55WHu0azT9tcCmId3uJGvIDWfh0w2FqPVoiRZ/BwWHBV1KFgjYcSNHB4vOuI3kvxBqo0qu5C0+AvJRbOrRR2uTtrVDR1CzME0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(36840700001)(46966006)(336012)(356005)(81166007)(82740400003)(53546011)(70586007)(70206006)(86362001)(83380400001)(82310400003)(4326008)(966005)(26005)(6506007)(186003)(33656002)(7696005)(5660300002)(52536014)(8676002)(316002)(47076005)(9686003)(54906003)(8936002)(478600001)(55016002)(36860700001)(2906002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 04:06:52.9418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e3d666-1f06-431d-9f73-08d9110d8bed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5603

SGkgSnVsaWVuLA0KDQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IE9u
IDI4LzA0LzIwMjEgMTA6MjgsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuLA0KPiAN
Cj4gSGkgSGVucnksDQo+IA0KPiA+DQo+ID4gSSd2ZSBkb25lIHNvbWUgdGVzdCBhYm91dCB0aGUg
cGF0Y2ggc2VyaWVzIGluDQo+ID4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBl
b3BsZS9qdWxpZW5nL3hlbi0NCj4gdW5zdGFibGUuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRz
L3B0L3JmYy12Mg0KPiA+DQo+IA0KPiBUaGFua3MgeW91IGZvciB0aGUgdGVzdGluZy4gU29tZSBx
dWVzdGlvbnMgYmVsb3cuDQo+IA0KPiBJIGFtIGEgYml0IGNvbmZ1c2VkIHdpdGggdGhlIG91dHB1
dCB3aXRoIGFuZCB3aXRob3V0IG15IHBhdGNoZXMuIEJvdGggb2YNCj4gdGhlbSBhcmUgc2hvd2lu
ZyBhIGRhdGEgYWJvcnQgaW4gY2xlYXJfcGFnZSgpLg0KPiANCj4gQWJvdmUsIHlvdSBzdWdnZXN0
ZWQgdGhhdCB0aGVyZSBpcyBhIGJpZyBnYXAgYmV0d2VlbiB0aGUgdHdvIG1lbW9yeQ0KPiBiYW5r
cy4gQXJlIHRoZSBiYW5rcyBzdGlsbCBwb2ludCB0byBhY3R1YWwgUkFNPw0KDQpBbm90aGVyIHNv
cnJ5IGZvciB0aGUgdmVyeSBsYXRlIHJlcGx5LCB3ZSBoYWQgYSA1IGRheSBwdWJsaWMgaG9saWRh
eSBpbiANCkNoaW5hIGFuZCBpdCBhbHNvIHRvb2sgbWUgc29tZSB0aW1lIHRvIGZpZ3VyZSBvdXQg
aG93IHRvIGNvbmZpZ3VyZSB0aGUgDQpGVlAgKGl0IHR1cm5lZCBvdXQgSSBoYXZlIHRvIHNldCAt
QyBicC5zZWN1cmVfbWVtb3J5PWZhbHNlIHRvIGFjY2VzcyANCnNvbWUgcGFydHMgb2YgbWVtb3J5
IGhpZ2hlciB0aGFuIDRHKS4NCg0KWWVzIHlvdSBhcmUgYWJzb2x1dGVseSByaWdodC4gSW4gbXkg
cHJldmlvdXMgdGVzdCwgdGhlIGhpZ2hlciBtZW1vcnkgaXMgDQpub3QgdmFsaWQuIEJ5IHR1cm5p
bmcgb2ZmIEZWUCBzZWN1cmUgbWVtb3J5LCB0aGlzIHRpbWUgSSB0cmllZCAyIHRlc3QgY2FzZXM6
DQoNCjEuIFVzaW5nIHJlZyA9IDwweDAwIDB4ODAwMDAwMDAgMHgwMCAweDdmMDAwMDAwIDB4Zjgg
MHgwMDAwMDAwMCAweDAwIDB4ODAwMDAwMDA+Ow0KDQpJbiB0aGlzIGNhc2UsIHRoZSBndWVzdCBj
YW4gYmUgc3VjY2Vzc2Z1bGx5IGJvb3RlZC4NCg0KMi4gVXNpbmcgcmVnID0gPDB4MDAgMHg4MDAw
MDAwMCAweDAwIDB4N2YwMDAwMDAgMHhmOSAweDAwMDAwMDAwIDB4MDAgMHg4MDAwMDAwMD47DQoN
CkZpcnN0bHkgSSBjb25maXJtZWQgdGhlIG1lbW9yeSBpcyB2YWxpZCBieSB1c2luZyBtZCBjb21t
YW5kIGluIHUtYm9vdCBjb21tYW5kIGxpbmU6DQoNClZFeHByZXNzNjQjIG1kIDB4ZjkwMDAwMDAw
MA0KZjkwMDAwMDAwMDogZGZkZmRmY2YgY2ZkZmRmZGYgZGZkZmRmY2YgY2ZkZmRmZGYgICAgLi4u
Li4uLi4uLi4uLi4uLg0KVkV4cHJlc3M2NCMgbWQgMHhmOTgwMDAwMDAwDQpmOTgwMDAwMDAwOiBk
ZmRmZGZjZiBjZmRmZGZkZiBkZmRmZGZjZiBjZmRmZGZkZiAgICAuLi4uLi4uLi4uLi4uLi4uDQoN
CndoZW4gSSBjb250aW51ZSBib290aW5nIFhlbiwgSSBnb3QgZm9sbG93aW5nIGVycm9yIGxvZzoN
Cg0KKFhFTikgQ1BVOiAgICAwDQooWEVOKSBQQzogICAgIDAwMDAwMDAwMDAyYjVhNWMgYWxsb2Nf
Ym9vdF9wYWdlcysweDk0LzB4OTgNCihYRU4pIExSOiAgICAgMDAwMDAwMDAwMDJjYTNiYw0KKFhF
TikgU1A6ICAgICAwMDAwMDAwMDAwMmZmZGUwDQooWEVOKSBDUFNSOiAgIDYwMDAwM2M5IE1PREU6
NjQtYml0IEVMMmggKEh5cGVydmlzb3IsIGhhbmRsZXIpDQooWEVOKQ0KKFhFTikgICBWVENSX0VM
MjogODAwMDAwMDANCihYRU4pICBWVFRCUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCihYRU4pDQoo
WEVOKSAgU0NUTFJfRUwyOiAzMGNkMTgzZA0KKFhFTikgICAgSENSX0VMMjogMDAwMDAwMDAwMDAw
MDAzOA0KKFhFTikgIFRUQlIwX0VMMjogMDAwMDAwMDA4NDEzYzAwMA0KKFhFTikNCihYRU4pICAg
IEVTUl9FTDI6IGYyMDAwMDAxDQooWEVOKSAgSFBGQVJfRUwyOiAwMDAwMDAwMDAwMDAwMDAwDQoo
WEVOKSAgICBGQVJfRUwyOiAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKQ0KKFhFTikgWGVuIGNhbGwg
dHJhY2U6DQooWEVOKSAgICBbPDAwMDAwMDAwMDAyYjVhNWM+XSBhbGxvY19ib290X3BhZ2VzKzB4
OTQvMHg5OCAoUEMpDQooWEVOKSAgICBbPDAwMDAwMDAwMDAyY2EzYmM+XSBzZXR1cF9mcmFtZXRh
YmxlX21hcHBpbmdzKzB4YTQvMHgxMDggKExSKQ0KKFhFTikgICAgWzwwMDAwMDAwMDAwMmNhM2Jj
Pl0gc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncysweGE0LzB4MTA4DQooWEVOKSAgICBbPDAwMDAw
MDAwMDAyY2I5ODg+XSBzdGFydF94ZW4rMHgzNDQvMHhiY2MNCihYRU4pICAgIFs8MDAwMDAwMDAw
MDIwMDFjMD5dIGFybTY0L2hlYWQubyNwcmltYXJ5X3N3aXRjaGVkKzB4MTAvMHgzMA0KKFhFTikN
CihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCihYRU4pIFBh
bmljIG9uIENQVSAwOg0KKFhFTikgWGVuIEJVRyBhdCBwYWdlX2FsbG9jLmM6NDMyDQooWEVOKSAq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQoNCldlIGNhbiBjb250aW51
ZSBvdXIgZGlzY3Vzc2lvbiBmcm9tIGhlcmUuIFRoYW5rcyBeXg0KDQpLaW5kIHJlZ2FyZHMsDQoN
CkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

