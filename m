Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B60536D4C8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119133.225502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgV7-00011x-Cb; Wed, 28 Apr 2021 09:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119133.225502; Wed, 28 Apr 2021 09:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbgV7-00011Y-8w; Wed, 28 Apr 2021 09:28:57 +0000
Received: by outflank-mailman (input) for mailman id 119133;
 Wed, 28 Apr 2021 09:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eWUI=JZ=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lbgV4-00011T-Rf
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:28:54 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e19::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7862fab0-ec0b-42ba-8237-2b9d87b15eed;
 Wed, 28 Apr 2021 09:28:51 +0000 (UTC)
Received: from DB6PR0601CA0017.eurprd06.prod.outlook.com (2603:10a6:4:7b::27)
 by PR2PR08MB4811.eurprd08.prod.outlook.com (2603:10a6:101:21::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Wed, 28 Apr
 2021 09:28:48 +0000
Received: from DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::9a) by DB6PR0601CA0017.outlook.office365.com
 (2603:10a6:4:7b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Wed, 28 Apr 2021 09:28:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT054.mail.protection.outlook.com (10.152.20.248) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Wed, 28 Apr 2021 09:28:48 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Wed, 28 Apr 2021 09:28:48 +0000
Received: from b02969fec33d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 57AC1C00-D421-4BD7-84AB-D97C9117B6FA.1; 
 Wed, 28 Apr 2021 09:28:37 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b02969fec33d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Apr 2021 09:28:37 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 09:28:28 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 09:28:28 +0000
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
X-Inumbo-ID: 7862fab0-ec0b-42ba-8237-2b9d87b15eed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M4zHgC/qRDgYyAz+PrKmEWGRjCoFfjajhnzFhc75zM=;
 b=XBfwi3HcP672njKH4z5uSNJSDyWYZoRJE0os7TUq7cdzogmNXo8/ozkbUcZiFhpMeqbF0x1PTKZ/7TeJbo6CSthC6RPHiIycdfGOFhBINN95o0vUeDEcM9/ah+48agGMzMvzD2JKg/XJv/RYRtSGBh+AjyyGnvJdUKpo7rITiOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXTRWKjLh5ay9jpENMpv0BAfFia6aho3N3P9lwekT3hg4OL54JGM7HAcVn1xHEhYXGDJcuRRilm2sgcEL8vR3iz5WuW4gytFf7IqfJlDDrexEil5u8ZnVK0rslgHWXoiPlKcJj5zFqNi/jZzwGMQNLr6aJvlhB+061stkcpg9CJK+M5ztmxmuqXeC0jXJHXdE5C5rGMeTn4fWAx2htiQbfMscVEghU/hM+vsrFMM4PGg7yDOTBYJSowARWsLwAAWVPnEpqrYxrE8xs6PIgHN6jS6tNrzyjOAhC7e1KdbWhn86KrBrUPUE+eUzs8LwNi2IT05tA54FbyvcNAx87t2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M4zHgC/qRDgYyAz+PrKmEWGRjCoFfjajhnzFhc75zM=;
 b=Nt9jiAqirSrWM0UsJrDEJmD+uomoxU8nrUbkY+jvPhO+s97tFQ4QMYaxdM3un98rlYEsMiBrVWZ1uSLPiAMrHfRE9DzolPGKv3q/9TB1eV59XJ4qkayPJU2zJuePJdREtlbSZbCSpxZCMAxPx6ZMLIjTw+f5vmgSuxtZ517CBeFNWfg9zqGUI/Ekd1XPAjPNg3OR/uhXT/DOKR27TZO/OZPDKKPeupbwIk6gtHmaJLvK/pmHm+znWq8UYEtFYHyfQODZDehHW88CXdoyTMtHhT8hkHXz2cO0/4tUlnd+oSK/GyTB7W0IRAkgShxVPVpprt2vQnpSgdjMCKOh7GWIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7M4zHgC/qRDgYyAz+PrKmEWGRjCoFfjajhnzFhc75zM=;
 b=XBfwi3HcP672njKH4z5uSNJSDyWYZoRJE0os7TUq7cdzogmNXo8/ozkbUcZiFhpMeqbF0x1PTKZ/7TeJbo6CSthC6RPHiIycdfGOFhBINN95o0vUeDEcM9/ah+48agGMzMvzD2JKg/XJv/RYRtSGBh+AjyyGnvJdUKpo7rITiOA=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index: Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyAADhcqlA=
Date: Wed, 28 Apr 2021 09:28:28 +0000
Message-ID:
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
In-Reply-To:
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 837C46BA11711642B4732B2F1D2B72EC.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1d547103-b813-4731-ff24-08d90a280735
x-ms-traffictypediagnostic: PAXPR08MB6365:|PR2PR08MB4811:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB48118171CCBEDDB35A2F925092409@PR2PR08MB4811.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jbsQIHjRRJ2TCIER0nt+mH40LtW9NsbPLD1A4bnsMg3s++WNnwTdhzdskxrBO3gYg0IQta9GKTbWf5fB1BIpA/0MvJoJ4hw1UsYKSrtFTFhoZLqVru/dPi5uHua6iQeSRl3r21V2LpiAyJSfeFNJiiBHqVCT4OIb0ZnT8rdVjBBKqd+n3Wf5z+WA5rLCyjJHeC++8uXzetDSRQ3iWMkhvIJhYceWlWtD8xIHfRpurzF6FDNUjzxyb6YXQs3gQc3ybEMEnf5xd8r94KnfYuAFXU0QTkyS+SInvVpSmb/PNVT4EtCshXXHmCAqcHdMJTjkR/UNQ8KIMR3fBwIsA0YNLtp1BuaXFnehu+8u+SHNz5ADWESErTzb3tNFhdDbXIYY5kEGttwgGvakEO1kokT02tze80ZyFI/UafJ7mbLLx+vNdsoN4f3kM0EAB+1pLR4z3TLsoQnTlDj1YDafibKo/JYvjupKlCgjzKGz1FduPepgyhGYjf8sOZhfzApCNrb06KHnIh92uVuy+vx5WfKQBjCa9puLiQtVkAflPnZsX2+2yyy1nrpShB91s62+tDkGooPq6oCTRdF8CIOokRr4CVBgxwHmyipA3fGrCM68T5bZxZyVRexX53LduPQG6IsPFOkynvsU8oynz6u87Huv3xbtQYPdUEiBOGT4QzQy9QPvnS7PLoBicEAo9a+05vs2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(366004)(396003)(8936002)(8676002)(76116006)(19627235002)(122000001)(55016002)(66946007)(4326008)(6506007)(478600001)(2906002)(9686003)(38100700002)(66446008)(66476007)(66556008)(83380400001)(64756008)(5660300002)(52536014)(316002)(54906003)(110136005)(7696005)(86362001)(33656002)(26005)(186003)(71200400001)(53546011)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WlgwU1E0ak00N0kwN20rQ3lJdXRpeVNUY0g5UVhjcjlrWnpycmhxZEd4NEhD?=
 =?utf-8?B?S1ZJZ2hEK0k1cnFEQjBUNkM2MG10MXZxZDhISnc3bkc5TzJGY0Y2b1F1dzRO?=
 =?utf-8?B?RkxLdmpFVEFsK2h1bU9Sald2ZTRpT2hpT2hOS05rTFo4VjY5WnFpYTBTaUFa?=
 =?utf-8?B?YmR1WSt1OHZKcTJHT1JIaFNZSFB0aEdZem8yZXVRdUJtT2ZZcTd2dTJqOGhD?=
 =?utf-8?B?NUc0Zk81RVY3ZGUrYjdDM0hOYldtdGNoT2xRRm9oNjYrN05vU0Z2OXZrSEZF?=
 =?utf-8?B?Q0VaaS9wUXQ4U2RnS1psRlBHTGs3TlZYOVdrNmwzTHV2ZjBURnd3Tm93aXIr?=
 =?utf-8?B?ZUpsSWNBdlZNQXZxVU50OTBTVnUxaHZFU0VHYzJnQVFDOWxpUUEwYnloNEpv?=
 =?utf-8?B?Q3Btc0xxbmFGV2pQM1NXZTJpSXRZZkE1TVB3ZW1yWXpuL29VK1BoVFRNWk04?=
 =?utf-8?B?UU5PZXVyM2R5OXJSNXJpNjk1VjdJdk5wcVNuYVBnRm9tSG94a09teEIvR1ZV?=
 =?utf-8?B?THhyTExjcmJHQThQY3JXVjg3TTFZbjAwVlIxelVTUlJDWEVoNWllRnY1cGht?=
 =?utf-8?B?SzZTajdmOWlCazdLQVpBeWNCRkFlS2lQRjZ2cU5VQVFhZ2VXM0tER1BvRXRx?=
 =?utf-8?B?eG5HS2xqVkVjdG51WUREMHZUcEFNZkNuL01qUGxNaTRLYzZmdzdMblNKTWpD?=
 =?utf-8?B?c3oyb0V6MnNQajUrdUFpRHZETE9qcm1BaGhlblM4NjUySnRnOVNseWRUNW03?=
 =?utf-8?B?NWVYWFVtZEt4bS9FOFhDMW9YS2dUWW5ZTkhQcVpEUmdRSzM1YTM5TDlIRVBj?=
 =?utf-8?B?ekxPZ3FzS0lNbEFXMERTQVVKVnl2cSs3aklLelNFYWVleC9QM3k2YUp0dnQy?=
 =?utf-8?B?T2ZXcmk0NUFGc0Y0UGhXSWtvOGdnaVhGdkdJNll3czBNVUhRSHYzaEdlYmox?=
 =?utf-8?B?dGhtUVA4WHBkQmUvWC9zOVVTRVhVeW9JQTEyNjZjSkx0SFp1anpTWER1QUk5?=
 =?utf-8?B?eU1RckRjbnQzaHlKRG10ZmkwNUZ6RkNZVlgxOHc3NjBMb0pOSFg2T3JzU2Vw?=
 =?utf-8?B?STduSGFtNmFBVjRzb1dMSWoybzBoUmRyc0grMlZpb0FLc1J2TDNuN2J0ZWxl?=
 =?utf-8?B?LzdWNHhhNWR5d2tSRzdlMGFOdkR0WHhFdXBwSVZCdEpJV0JkVXBIUHkyNGpR?=
 =?utf-8?B?MG1oeFJCTzFoZ29IK2VKOC9HSkFlVzJlRndEcmRnb1k0UWtZVE83YUoxKzZn?=
 =?utf-8?B?WDgxVlJjd2RJcW5nM05zclhRNlNxZ0VqQXFJQjl1OTJ2MEpyWmJieFppbUZw?=
 =?utf-8?B?dEVDcStjVStoMXUrZFRoYmYvZ3hIR1hOejd0elJNdHVUWHAzZjlyTENBaHZO?=
 =?utf-8?B?UXg0U0o5TXhsZU51RGRza3Fkc0NmZWMvTkoxNlArTlNieFlvRk1aTmxLYXE0?=
 =?utf-8?B?Qnk1ZWdFeHo4WThnZ2ZRb2hxNnJqdElpTWR6R2VXZExpdXVBMWdQZEF5VEJK?=
 =?utf-8?B?UUkrQ01SUnN5QzRsL1dqczZCblJUcldqdlZVZEg4TzZwVHBsMDNIT1BJQjlT?=
 =?utf-8?B?NDVBVmg1Yy9acWViUm9pWklXcnZEZis5T0JFSlpZNW16R1NqU042V3lMMVZJ?=
 =?utf-8?B?WTluRWtBY3VnTTNHSTBPSjRIRDVqeTBDU2VreUNtZkE1cDYvaHhhOUl4SmE3?=
 =?utf-8?B?cjgvdjExaVo3ODhGSVk0N01YNUloM3NmNERlaHVnRXR6SjVkMi9SQ3p0dWxZ?=
 =?utf-8?Q?gVwl97UZ9PF1Lygk0eU7uJ0tCDiuceNRG6fXi3d?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	100af014-2b2d-4bcd-a643-08d90a27fb48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zvuaI/eizERyrnmeWAfOym3f5I5zEq/qARf/hjbdMcrP2r60ayf/5c8MtOEDVMDuZEpQrEcKC2noSKphZ/+UihbEBDvVAjcNrYBrN67WSTLWHf8PhIhFCHCOFzsnEgJVjeF5X28sJSdGxwCUaoN5Sc3cxWU8LECXMj70hBHll3nshPDNJJWYGym42TT4CCPPDrZpCUhFtsRt+7WzhfGAi4FpbBT2ft10mIPo9rSOjQnY3FscYqrY2/1tlP8WOVK/RMwtVsL1xehohx9ibRyBGu/v2D64MhN58Y7mIYVWNnOHPmV0V+QzUSS1XD7v8TnNJ1wBiZsDTeNOBjIOoAMMjECt51deRiJLXHyPLu1PavSHMJM33MudDcU+opCHH1j5Q/o0yNnVEGGKr8D7MWC7ulJV23jzU3i956H4pZ+jwXeL9LoUYmrwj5/QNOrDDza4WXVYXc94DH1P1FrbLZ8DfLG3wk0YlQuQ57ONM8bhH1+LAXp4V2471smQiYCv/ze0JFWsu0aoMt5u4E4it4SCgJikdt2Tr1hTeLAtya1Ucnw8qelR5R3qt7BtcHj7VxOBWXFXUctgFT0QpaTh6oIiMsokbKlIolAB0xS5QGpp0MlD4KwJYnjWEa2DaA8w8NL3HE+Rymnma/3H3wexnu4QnE1isjVGPg27BCsy/0odRaj8if11xkP3aSTBRkj2gUzfEx0sJAsuuNSsn+icNPood4Jk6Soi844OLVGyax8/CyflF5KaMclhh1OoDYdj/iV2DXYf7gAsi3fpNDccrjjgIg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(336012)(54906003)(110136005)(8676002)(4326008)(47076005)(70206006)(26005)(8936002)(86362001)(70586007)(7696005)(83380400001)(316002)(81166007)(36860700001)(19627235002)(186003)(2906002)(34020700004)(6506007)(356005)(33656002)(52536014)(53546011)(966005)(5660300002)(478600001)(9686003)(82740400003)(82310400003)(55016002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 09:28:48.5474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d547103-b813-4731-ff24-08d90a280735
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4811

SGkgSnVsaWVuLA0KDQpJJ3ZlIGRvbmUgc29tZSB0ZXN0IGFib3V0IHRoZSBwYXRjaCBzZXJpZXMg
aW4NCmh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvanVsaWVuZy94ZW4t
dW5zdGFibGUuZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3B0L3JmYy12Mg0KDQpJZiB5b3Ug
aGF2ZSB0aW1lLCBjb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29rIGF0IHRoZSBpbmxpbmUgdGVz
dCByZXN1bHQgYW5kDQpraW5kbHkgaW5mb3JtIGlmIEkgdGVzdGVkIHRoZSBwYXRjaCBzZXJpZXMg
Y29ycmVjdGx5PyBUaGFua3MhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSGVucnkgV2FuZw0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAyNywgMjAyMSAyOjI5IFBNDQo+
IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgc3N0YWJlbGxpbmlAa2VybmVsLm9y
ZzsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA8UGVubnkuWmhlbmdAYXJtLmNvbT47IEJl
cnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDogUkU6
IERpc2N1c3Npb24gb2YgWGVuaGVhcCBwcm9ibGVtcyBvbiBBQXJjaDY0DQo+IA0KPiBIaSBKdWxp
ZW4sDQo+IA0KPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksIEkga2luZGEgbWlzc2VkIHRoaXMg
ZW1haWwgc29tZWhvdy4uLi4NCj4gDQo+IFBsZWFzZSBzZWUgbXkgaW5saW5lIHJlcGx5IF5eDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogWGVuLWRldmVsIDx4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mDQo+ID4g
SnVsaWVuIEdyYWxsDQo+ID4gU2VudDogTW9uZGF5LCBBcHJpbCAyNiwgMjAyMSA0OjIwIEFNDQo+
ID4gVG86IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT47IHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc7IHhlbi0NCj4gPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IFBlbm55IFpoZW5nDQo+ID4gPFBlbm55LlpoZW5nQGFy
bS5jb20+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+
ID4gU3ViamVjdDogUmU6IERpc2N1c3Npb24gb2YgWGVuaGVhcCBwcm9ibGVtcyBvbiBBQXJjaDY0
DQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gMjEvMDQvMjAyMSAxMDozMiwgSGVucnkgV2FuZyB3cm90
ZToNCj4gPiA+IEhpIEp1bGllbiwNCj4gPg0KPiA+IEhpIEhlbnJ5LA0KPiA+DQo+ID4gPj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPg0KPiA+ID4+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjEsIDIwMjEgNTowNCBQ
TQ0KPiA+ID4+IFRvOiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+OyBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOyB4ZW4tDQo+ID4gPj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4g
PiA+PiBDYzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBQZW5ueSBaaGVuZw0KPiA+ID4+
IDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgQmVydHJhbmQgTWFycXVpcw0KPiA+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+DQo+ID4gPj4gU3ViamVjdDogUmU6IERpc2N1c3Npb24gb2YgWGVuaGVh
cCBwcm9ibGVtcyBvbiBBQXJjaDY0DQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+DQo+ID4gPj4gT24g
MjEvMDQvMjAyMSAwNzoyOCwgSGVucnkgV2FuZyB3cm90ZToNCj4gPiA+Pj4gSGksDQo+ID4gPj4N
Cj4gPiA+PiBIaSBIZW5yeSwNCj4gPiA+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBXZSBhcmUgdHJ5aW5n
IHRvIGltcGxlbWVudCB0aGUgc3RhdGljIG1lbW9yeSBhbGxvY2F0aW9uIG9uIEFBcmNoNjQuDQo+
ID4gUGFydA0KPiA+ID4+IG9mDQo+ID4gPj4+IHRoaXMgZmVhdHVyZSBpcyB0aGUgcmVzZXJ2ZWQg
aGVhcCBtZW1vcnkgYWxsb2NhdGlvbiwgd2hlcmUgYSBzcGVjaWZpYw0KPiA+IHJhbmdlDQo+ID4g
Pj4gb2YNCj4gPiA+Pj4gbWVtb3J5IGlzIHJlc2VydmVkIG9ubHkgZm9yIGhlYXAuIEluIHRoZSBk
ZXZlbG9wbWVudCBwcm9jZXNzLCB3ZQ0KPiA+IGZvdW5kIGENCj4gPiA+Pj4gcGl0ZmFsbCBpbiBj
dXJyZW50IEFBcmNoNjQgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygpIGZ1bmN0aW9uLg0KPiA+ID4+
Pg0KPiA+ID4+PiBBY2NvcmRpbmcgdG8gYSBwcmV2aW91cyBkaXNjdXNzaW9uIGluIGNvbW11bml0
eQ0KPiA+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxOTAyMTYxMzQ0
NTYuMTA2ODEtMS0NCj4gPiA+PiBwZW5nLmZhbkBueHAuY29tLywNCj4gPiA+Pj4gb24gQUFyY2g2
NCwgYm9vdG1lbSBpcyBpbml0aWFsaXplZCBhZnRlciBzZXR1cF94ZW5oZWFwX21hcHBpbmdzKCks
DQo+ID4gPj4+IHNldHVwX3hlbmhlYXBfbWFwcGluZ3MoKSBtYXkgdHJ5IHRvIGFsbG9jYXRlIG1l
bW9yeSBiZWZvcmUNCj4gbWVtb3J5DQo+ID4gPj4gaGFzIGJlZW4NCj4gPiA+Pj4gaGFuZGVkIG92
ZXIgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLiBJZiB0aGUgcmVzZXJ2ZWQgaGVhcCBtZW1vcnkNCj4g
PiBhbGxvY2F0aW9uDQo+ID4gPj4gaXMNCj4gPiA+Pj4gaW50cm9kdWNlZCwgZWl0aGVyIG9mIGJl
bG93IDIgY2FzZXMgd2lsbCB0cmlnZ2VyIGEgY3Jhc2g6DQo+ID4gPj4+DQo+ID4gPj4+IDEuIElm
IHRoZSByZXNlcnZlZCBoZWFwIG1lbW9yeSBpcyBhdCB0aGUgZW5kIG9mIHRoZSBtZW1vcnkgYmxv
Y2sgbGlzdA0KPiA+IGFuZA0KPiA+ID4+IHRoZQ0KPiA+ID4+PiBnYXAgYmV0d2VlbiByZXNlcnZl
ZCBhbmQgdW5yZXNlcnZlZCBtZW1vcnkgaXMgYmlnZ2VyIHRoYW4gNTEyR0IsDQo+ID4gd2hlbg0K
PiA+ID4+IHdlIHNldHVwDQo+ID4gPj4+IG1hcHBpbmdzIGZyb20gdGhlIGJlZ2lubmluZyBvZiB0
aGUgbWVtb3J5IGJsb2NrIGxpc3QsIHdlIHdpbGwgZ2V0DQo+IE9PTQ0KPiA+ID4+IGNhdXNlZA0K
PiA+ID4+PiBieSBsYWNrIG9mIHBhZ2VzIGluIGJvb3QgYWxsb2NhdG9yLiBUaGlzIGlzIGJlY2F1
c2UgdGhlIG1lbW9yeSB0aGF0IGlzDQo+ID4gPj4gcmVzZXJ2ZWQNCj4gPiA+Pj4gZm9yIGhlYXAg
aGFzIG5vdCBiZWVuIG1hcHBlZCBhbmQgYWRkZWQgdG8gdGhlIGJvb3QgYWxsb2NhdG9yLg0KPiA+
ID4+Pg0KPiA+ID4+PiAyLiBJZiB3ZSBhZGQgdGhlIG1lbW9yeSB0aGF0IGlzIHJlc2VydmVkIGZv
ciBoZWFwIHRvIGJvb3QgYWxsb2NhdG9yIGZpcnN0LA0KPiA+ID4+IGFuZA0KPiA+ID4+PiB0aGVu
IHNldHVwIG1hcHBpbmdzIGZvciBiYW5rcyBpbiB0aGUgbWVtb3J5IGJsb2NrIGxpc3QsIHdlIG1h
eSBnZXQgYQ0KPiA+IHBhZ2UNCj4gPiA+PiB3aGljaA0KPiA+ID4+PiBoYXMgbm90IGJlZW4gc2V0
dXAgbWFwcGluZywgY2F1c2luZyBhIGRhdGEgYWJvcnQuDQo+ID4gPj4NCj4gPiA+PiBUaGVyZSBh
cmUgYSBmZXcgaXNzdWVzIHdpdGggc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygpLiBJIGhhdmUgYmVl
bg0KPiA+ID4+IHJld29ya2luZyB0aGUgY29kZSBvbiBteSBzcGFyZSB0aW1lIGFuZCBzdGFydGVk
IHRvIHVwc3RyZWFtIGJpdHMgb2YgaXQuDQo+ID4gPj4gQSBQb0MgY2FuIGJlIGZvdW5kIGhlcmU6
DQo+ID4gPj4NCj4gPiA+PiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVvcGxl
L2p1bGllbmcveGVuLQ0KPiA+ID4+IHVuc3RhYmxlLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFk
cy9wdC9kZXYNCj4gPiA+Pg0KPiA+ID4NCj4gPiA+IFJlYWxseSBncmVhdCBuZXdzISBUaGFua3Mg
eW91IHZlcnkgbXVjaCBmb3IgdGhlIGluZm9ybWF0aW9uIGFuZCB5b3VyDQo+ID4gaGFyZA0KPiA+
ID4gd29yayBvbiB0aGUgUG9DIDopIEkgd2lsbCBzdGFydCB0byBnbyB0aHJvdWdoIHlvdXIgUG9D
IGNvZGUgdGhlbi4NCj4gPg0KPiA+IEkgc3BlbnQgc29tZXRpbWVzIHRvZGF5IHRvIGNsZWFuLXVw
IHRoZSBQb0MgYW5kIHNlbnQgYSBzZXJpZXMgb24gdGhlIE1MDQo+ID4gKHNlZSBbMV0pLiBUaGlz
IGhhcyBiZWVuIGxpZ2h0bHkgdGVzdGVkIHNvIGZhci4NCj4gPg0KPiA+IFdvdWxkIHlvdSBiZSBh
YmxlIHRvIGdpdmUgYSB0cnkgYW5kIGxldCBtZSBrbm93IGlmIGl0IGhlbHBzIHlvdXIgcHJvYmxl
bT8NCj4gDQo+IFllcyBvZiBjb3Vyc2UhIEkgd2lsbCBzdGFydCB0byB0ZXN0IHRoaXMgc2VyaWVz
IF5eIFRoYW5rIHlvdSBmb3IgeW91ciB3b3JrIQ0KPiANCg0KVGVzdCBwbGF0Zm9ybTogRlZQX0Jh
c2VfUmV2Q18yeEFFTXZBICh3aXRoIC1DIGJwLmRyYW1fc2l6ZT0xMDI0KQ0KDQpEZWZhdWx0IG1l
bW9yeSBjb25maWd1cmF0aW9uICh3b3JrcyB3ZWxsKToNCm1lbW9yeUA4MDAwMDAwMCB7DQogICAg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCiAgICAgICAgICAgICAgICByZWcg
PSA8MHgwMCAweDgwMDAwMDAwIDB4MDAgMHg3ZjAwMDAwMCAweDA4IDB4ODAwMDAwMDAgMHgwMCAw
eDgwMDAwMDAwPjsNCn07DQoNCkFzIHRoZSBsb3dlc3QgcGFydCBvZiBEUkFNIHJhbmdlIG9ubHkg
aGFzIDJHQiBSQU0gDQooaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uLzEw
MDk2NC8xMTE0L0Jhc2UtUGxhdGZvcm0vQmFzZS0tLW1lbW9yeS9CYXNlLVBsYXRmb3JtLW1lbW9y
eS1tYXApLA0KSSBvbmx5IHRlc3RlZCB0d28gbWVtb3J5IGJhbmtzIHdpdGggYSBiaWcgZ2FwIGNh
c2UuDQoNCjEuIFdpdGhvdXQgcGF0Y2ggKGNvbW1pdCBiZWE2NWEyMTJjMDU4MTUyMDIwM2I2YWQw
ZDA3NjE1NjkzZjQyZjczKQ0KYW5kIHVzZSB0d28gbWVtb3J5IGJhbmtzIHdoaWNoIGhhdmUgYSBi
aWcgZ2FwOg0KDQpNZW1vcnkgbm9kZToNCm1lbW9yeUA4MDAwMDAwMCB7DQogICAgICAgICAgICAg
ICAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCiAgICAgICAgICAgICAgICByZWcgPSA8MHgwMCAw
eDgwMDAwMDAwIDB4MDAgMHg3ZjAwMDAwMCAweDg4MDAgMHgwMDAwMDAwMCAweDAwIDB4ODAwMDAw
MDA+Ow0KfTsNCg0KTG9nOg0KKFhFTikgICBWVENSX0VMMjogODAwMDAwMDANCihYRU4pICBWVFRC
Ul9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCihYRU4pDQooWEVOKSAgU0NUTFJfRUwyOiAzMGNkMTgz
ZA0KKFhFTikgICAgSENSX0VMMjogMDAwMDAwMDAwMDAwMDAzOA0KKFhFTikgIFRUQlIwX0VMMjog
MDAwMDAwMDA4NDEzZDAwMA0KKFhFTikNCihYRU4pICAgIEVTUl9FTDI6IDk2MDAwMDQxDQooWEVO
KSAgSFBGQVJfRUwyOiAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKSAgICBGQVJfRUwyOiAwMDAwODAx
MGMzZmZmMDAwDQooWEVOKSBYZW4gY2FsbCB0cmFjZToNCihYRU4pICAgIFs8MDAwMDAwMDAwMDI1
YzdhMD5dIGNsZWFyX3BhZ2UrMHgxMC8weDJjIChQQykNCihYRU4pICAgIFs8MDAwMDAwMDAwMDJj
YWEzMD5dIHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MrMHgxYWMvMHgyZTAgKExSKQ0KKFhFTikg
ICAgWzwwMDAwMDAwMDAwMmNiZjM0Pl0gc3RhcnRfeGVuKzB4MzQ4LzB4YmM0DQooWEVOKSAgICBb
PDAwMDAwMDAwMDAyMDAxYzA+XSBhcm02NC9oZWFkLm8jcHJpbWFyeV9zd2l0Y2hlZCsweDEwLzB4
MzANCihYRU4pDQooWEVOKQ0KKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKg0KKFhFTikgUGFuaWMgb24gQ1BVIDA6DQooWEVOKSBDUFUwOiBVbmV4cGVjdGVkIFRy
YXA6IERhdGEgQWJvcnQNCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioNCg0KMi4gQXBwbHkgcGF0Y2ggYW5kIHVzZSB0d28gbWVtb3J5IGJhbmtzIHdoaWNoIGhh
dmUgYSBiaWcgZ2FwOg0KTWVtb3J5IG5vZGU6DQptZW1vcnlAODAwMDAwMDAgew0KICAgICAgICAg
ICAgICAgIGRldmljZV90eXBlID0gIm1lbW9yeSI7DQogICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAgMHg4MDAwMDAwMCAweDAwIDB4N2YwMDAwMDAgMHg4ODAwIDB4MDAwMDAwMDAgMHgwMCAweDgw
MDAwMDAwPjsNCn07DQoNCkxvZzoNCihYRU4pICAgVlRDUl9FTDI6IDgwMDAwMDAwDQooWEVOKSAg
VlRUQlJfRUwyOiAwMDAwMDAwMDAwMDAwMDAwDQooWEVOKQ0KKFhFTikgIFNDVExSX0VMMjogMzBj
ZDE4M2QNCihYRU4pICAgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzgNCihYRU4pICBUVEJSMF9F
TDI6IDAwMDAwMDAwODQxM2MwMDANCihYRU4pDQooWEVOKSAgICBFU1JfRUwyOiA5NjAwMDA0Mw0K
KFhFTikgIEhQRkFSX0VMMjogMDAwMDAwMDAwMDAwMDAwMA0KKFhFTikgICAgRkFSX0VMMjogMDAw
MDAwMDAwMDQ0MzAwMA0KKFhFTikNCihYRU4pIFhlbiBjYWxsIHRyYWNlOg0KKFhFTikgICAgWzww
MDAwMDAwMDAwMjVjN2EwPl0gY2xlYXJfcGFnZSsweDEwLzB4MmMgKFBDKQ0KKFhFTikgICAgWzww
MDAwMDAwMDAwMjZjZjljPl0gbW0uYyN4ZW5fcHRfdXBkYXRlKzB4MWI4LzB4N2IwIChMUikNCihY
RU4pICAgIFs8MDAwMDAwMDAwMDJjYTI5OD5dIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MrMHhiNC8w
eDEzNA0KKFhFTikgICAgWzwwMDAwMDAwMDAwMmNjMWIwPl0gc3RhcnRfeGVuKzB4YjZjLzB4YmNj
DQooWEVOKSAgICBbPDAwMDAwMDAwMDAyMDAxYzA+XSBhcm02NC9oZWFkLm8jcHJpbWFyeV9zd2l0
Y2hlZCsweDEwLzB4MzANCihYRU4pDQooWEVOKQ0KKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KKFhFTikgUGFuaWMgb24gQ1BVIDA6DQooWEVOKSBDUFUwOiBV
bmV4cGVjdGVkIFRyYXA6IERhdGEgQWJvcnQNCihYRU4pICoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiA+DQo+ID4gRm9y
IGNvbnZlbmllbmNlLCBJIGhhdmUgcHVzaGVkIGEgYnJhbmNoIHdpdGggdGhlIHNlcmllcyBhcHBs
aWVkIGhlcmU6DQo+ID4NCj4gPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cGVv
cGxlL2p1bGllbmcveGVuLQ0KPiA+IHVuc3RhYmxlLmdpdDthPXNob3J0bG9nO2g9cmVmcy9oZWFk
cy9wdC9yZmMtdjINCj4gPg0KPiANCj4gR3JlYXQsIHRoYW5rcyENCj4gDQo+ID4gQ2hlZXJzLA0K
PiA+DQo+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDIxMDQyNTIw
MTMxOC4xNTQ0Ny0xLQ0KPiA+IGp1bGllbkB4ZW4ub3JnLw0KPiA+DQo+ID4gLS0NCj4gPiBKdWxp
ZW4gR3JhbGwNCg0K

