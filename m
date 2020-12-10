Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ACF2D617C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49526.87599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOdF-0001Pb-Qm; Thu, 10 Dec 2020 16:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49526.87599; Thu, 10 Dec 2020 16:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOdF-0001PC-NN; Thu, 10 Dec 2020 16:17:29 +0000
Received: by outflank-mailman (input) for mailman id 49526;
 Thu, 10 Dec 2020 16:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOdD-0001P7-Ek
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:17:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 776f7c9e-6fd0-448b-bc1c-61c3dd88898f;
 Thu, 10 Dec 2020 16:17:25 +0000 (UTC)
Received: from DB6PR0402CA0014.eurprd04.prod.outlook.com (2603:10a6:4:91::24)
 by VE1PR08MB5183.eurprd08.prod.outlook.com (2603:10a6:803:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 16:17:23 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::d9) by DB6PR0402CA0014.outlook.office365.com
 (2603:10a6:4:91::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 16:17:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 16:17:23 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Thu, 10 Dec 2020 16:17:23 +0000
Received: from 896aca465ec3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CE9C1BF-CD22-49D3-AE7F-AED0556FF670.1; 
 Thu, 10 Dec 2020 16:17:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 896aca465ec3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 16:17:06 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB8PR08MB5369.eurprd08.prod.outlook.com (2603:10a6:10:11c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 16:17:04 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 16:17:04 +0000
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
X-Inumbo-ID: 776f7c9e-6fd0-448b-bc1c-61c3dd88898f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHRqENzcbnT8NZL9P8ZfWgaZCvF+rDpKye35Gl8bMWk=;
 b=ERfUTed3nb7m1z2WuIvIZoRkKW6vsPVznmRfmzdE10TT1/xf5/7BBK5pL1lZWyrR1Hg9XmFaQ6/XOs6LeszeZNwznKoOw73iUh5k2X+XT4JonxC7/yjXe4WF/YLtDph8ATnMgsF5KZalwcStAdL4r6J5n/i1wR7sUhw1aNFERM8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a36779677410a91
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cCrOEKjT4nhoWz+LqQCXmLHyZ0wGKGi4EGWRed5bYLIOfnfN6PlzDmAV6zxwp6Rii/RhN84sPvNHvms1l3kD6DfNHJ4O6CVsBU0B0ratXaM68LZLr+4G+uWKJQCZ4tycu2qJpTMgpyTYFEXtoP6158CUmlOiqlLe36Z5ztGrY9ndHNC22FL5a/kVMgaYnWk6PA1tYZWVP+sb98lLy9buMpz5yPL4VCdBUBGcQwjqFI6WxYn5kxDXMqsm/sEzKMC1U7eHD/bxYQyKi6rpPpKvTMWEHpWWk0l5HU/6j4xZz/ZQePPeQAT7XzsTNa7hghi/fr4DkyR1ao2wlFxJkrJYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHRqENzcbnT8NZL9P8ZfWgaZCvF+rDpKye35Gl8bMWk=;
 b=IJU8AwXlq9zzW1iDplB1W3CYyr3JdKsiivyVxZKHrQLIM7c1Zc8PQe5k6/a/HHWP2q6uKu8YKuvh/1eWw+84NOyOqoid/DZC44TAGanvKmGBF19aV10EgrKnXD1dk1mJ4Xgp1lRkeSE3xb12RBjGBKFKu7NYdxEkZp2127TdTVmsgmlkdW/aT2OaVIop4ZVNkBGruQEf2iM2ofK+ehHT8RwaKdnB7Oqkuep+mG/awuynncHipJdyKTzJmIXoceKB6yhkTuS3qW8WUbuOUsA3UEtTzb+a9KsazWkbtjMUfGY7Jd0nGDu8IUlKZI4ey0NcdK2Z2w1CXzT8qXynvvjceA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHRqENzcbnT8NZL9P8ZfWgaZCvF+rDpKye35Gl8bMWk=;
 b=ERfUTed3nb7m1z2WuIvIZoRkKW6vsPVznmRfmzdE10TT1/xf5/7BBK5pL1lZWyrR1Hg9XmFaQ6/XOs6LeszeZNwznKoOw73iUh5k2X+XT4JonxC7/yjXe4WF/YLtDph8ATnMgsF5KZalwcStAdL4r6J5n/i1wR7sUhw1aNFERM8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v3 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWzklW+4XymezDRUeCGhvhzW8UY6nvZCkAgAEXL4CAAAS6AIAAAyYA
Date: Thu, 10 Dec 2020 16:17:04 +0000
Message-ID: <FA121B9D-0B9F-4636-A7FC-0548C05E31F0@arm.com>
References: <cover.1607524536.git.bertrand.marquis@arm.com>
 <33f39e7f521e6f73a0dba57a8be9fb50656e1807.1607524536.git.bertrand.marquis@arm.com>
 <61b2677c-bc0d-af0b-95f8-f8de76a20856@xen.org>
 <BD35BA39-FE40-4752-9B21-CCD0F0D963B0@arm.com>
 <0ad1c0d0-a3f2-da98-0a0f-b90736cc11dc@xen.org>
In-Reply-To: <0ad1c0d0-a3f2-da98-0a0f-b90736cc11dc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0775541a-6155-45d8-39e6-08d89d271397
x-ms-traffictypediagnostic: DB8PR08MB5369:|VE1PR08MB5183:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB51835CFE2E9E92C4AD9C63D69DCB0@VE1PR08MB5183.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oLHmChfLsNU4xNgbFm1DynoJiUtJIV9J5lql/y+UV4zWLHqIcZZ0HokHCjDJaGM+89EAqqWkB/yTWVsAiy3feTsDSndEswXptfQEm/xuMH5v+Y1OHuyrVUnOYxHTYk+M2MIfDH5MEHl1yS9Zj10rH2vcLdiyl9yKWwJ5qNQKKV/IF1fecbbYTc/Qm+3NFDfT1aRKIROXe8g2xoMNzRib1CaBbmcwewYvyl3tUTvHX1LU4l7DV18L/6xAJ29r+TGgiY1e6DIhdbmZvuzC2L+KQkXGtATQAW3U1i93YF0xf4TWwMcsAW9e/8u6PwK9CLJ+diCVhRnHkqp3wkKkLDABPwyTwPeGBupSsx4ampJg6dM8M+TQSZbDRu+2TMe4Iibo
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(186003)(33656002)(54906003)(83380400001)(4326008)(36756003)(26005)(2906002)(66476007)(316002)(64756008)(2616005)(478600001)(8676002)(66946007)(66556008)(53546011)(6512007)(6506007)(86362001)(5660300002)(8936002)(6486002)(66446008)(71200400001)(6916009)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?eTU3bVg0YWZ3b05DZkgwaXZoaU1SbitzSHF6T0RrMG8zT3ZGZ2xHWlBmT3Nr?=
 =?utf-8?B?K0lMQWVnaTgwc2pYTU5mbGRDUGZPUitwZHJTUTNnY1JaVmlNNHVFaWZoWWtB?=
 =?utf-8?B?YmFkc2JlV284b1ZpTXJpUS9wU0pMVWhNNzlOcG5XYUxxQ3pIdnBzN2lHK3Vk?=
 =?utf-8?B?Q0t1cnhGY043WmJPcDZMSGpvQ28vMXFjWVBCZjJhYTdYOUI3cEVjQlFqRTNs?=
 =?utf-8?B?elRWK0FEckR5UFhrWTVnbHhWcXplbncxd255NnduN0ZsdElZZERHOVVnb2Fw?=
 =?utf-8?B?Y0pZT2paYWY4NHcvdUZNanIrRDZWOVV1RnNNaVQ1MUEwOTNLVHU3bHBMbHd0?=
 =?utf-8?B?bE44RjNSYjV0SSt3aEoxRXMyTHBkd1FyZmQwcVFSSG9Fem9QMVR2a3pZdmgw?=
 =?utf-8?B?TjNuYkdabWdjR0RTRytTc2tVek12WTE5a2JKbVN1dmFCN0NsQXJwRXFRcVFF?=
 =?utf-8?B?Snp5bXJJZnFIQUVpV29NeUVJeVBjb05xZ3BNSHZYMEJyaTE5OE1aTlNrVXh5?=
 =?utf-8?B?RjlacG84Y2FZOGIvTTdBYmc1V0ViTU5RSVEyTVdvQitUUGs4OVZqbUlVTG1M?=
 =?utf-8?B?TmdCWkpJWkRwZVNWaURuSFZueUF2RDNwVVdhbmRKOWcrQzZiaVRDd0cvajhp?=
 =?utf-8?B?ZHJDN29KeC9FR2dyd1hEK3RMNW9qTHJFWC9wSUlJbUt0enhuV25WVmpoWEE0?=
 =?utf-8?B?SWlabGc0dEtJSXpqeExjTkQ2ZGN4N1h1T3pudzhPOEJKQ05rY0RxR2dOemg3?=
 =?utf-8?B?YXFxbnJodXM3bVR4ZXNMSlEwazNUWDhIT21HVnNFTFBGZlRiQjFVR3FGRDVU?=
 =?utf-8?B?d2tBSDRGa0FxS0NzSHRIemFadDFUdklaZFh4T3hBdFhMUjRhVUkwUWdJeE0w?=
 =?utf-8?B?anhvb1ZvRGdrWnpaVjFNNlVZenlENndaZGpXV0Y3ZlpWRkEwTFBweTlROWVx?=
 =?utf-8?B?clpBYVdvVnkyTnNRZE8vNE1sOWF4Uk50YjVSbG9IS2V2dTYyYWZoZmhWTW5m?=
 =?utf-8?B?ZzEraWZMVlFWZ2lSeUtMVUthUWNiMjliSkxLQ3MvbUFFbXJ6c3Z5a3hoQUov?=
 =?utf-8?B?WEpQa2NBeXpXa2xyZ2tnaUtYbXhpUkNRNDRka29zR083cDlYeE4xdDg2UVN1?=
 =?utf-8?B?MFBlSmxrQlNtRzQzbDZkL015UEtNbDRVdGlSazdENCtmSlA0a0NHejR0Q2lo?=
 =?utf-8?B?MkV6TFROcHZMa2JDelBZbmJ6OWNucnFwcCtMbHNGaFVMUzZ6QUpaZDBiN3lP?=
 =?utf-8?B?UDcwaUZyTnFzaHFmaCtkNVZqUk9kQ2Fqb08vbFNuOG1Db1V0K2RnaGEvZ3V1?=
 =?utf-8?Q?TCEoXqZ/R9rulLybU0GCpyuILYIlnIsXJa?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A13CFFE71D7E514E82BE7472D7C7499B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5369
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86b9d766-a69c-4a29-78f2-08d89d2708c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j/UaSBCIwHMoboMJr0SYJudjlnGY/JnZGsEFPDkcx0cAwqja149s+vcbPFzmk7GhoTkC4bhior0xqQgxCg9oLEnIKC8jPtmR3gqh4PVRx9dfqQKPyc62Q8poUUnAUbTI8rpnYzddfEtq6iv9FQR8eBt3WKDgtPkZUzGQ2hjaXkHl/GDOELm8foqZ1hNL+Eg6nPT+TAM21K0rhw+lkm5FK/SXZ1aZJQDwvOOefCSY29kGow1x92J9BrCrG0PEOekqJcnBbX1hewW1o9vTFbSUYi2o4TCRbKer3vaOHpWyLL42IDLKjnJMA/6xMwpPimFn5nXnIpf+5qtd+OqKDjWnQFBOBEYHZTvhFG05amP9pBUxvVCqmST+QOXgzdaU5DI4G5qE4M3lWfh+FgjMtZQu6w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(46966005)(316002)(6486002)(107886003)(6862004)(8936002)(336012)(478600001)(186003)(82740400003)(83380400001)(82310400003)(356005)(8676002)(2906002)(47076004)(70586007)(70206006)(4326008)(54906003)(2616005)(86362001)(6506007)(5660300002)(26005)(6512007)(36756003)(53546011)(81166007)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 16:17:23.0818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0775541a-6155-45d8-39e6-08d89d271397
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5183

SGkgSnVsaWVuLA0KDQo+IE9uIDEwIERlYyAyMDIwLCBhdCAxNjowNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDEwLzEyLzIwMjAgMTU6NDgs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+Pj4gT24gOSBEZWMgMjAy
MCwgYXQgMjM6MDksIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0K
Pj4+IEhpIEJlcnRhbmQsDQo+Pj4gDQo+Pj4gT24gMDkvMTIvMjAyMCAxNjozMCwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+Pj4gQ3JlYXRlIGEgY3B1aW5mbyBzdHJ1Y3R1cmUgZm9yIGd1ZXN0
IGFuZCBtYXNrIGludG8gaXQgdGhlIGZlYXR1cmVzIHRoYXQNCj4+Pj4gd2UgZG8gbm90IHN1cHBv
cnQgaW4gWGVuIG9yIHRoYXQgd2UgZG8gbm90IHdhbnQgdG8gcHVibGlzaCB0byBndWVzdHMuDQo+
Pj4+IE1vZGlmeSBzb21lIHZhbHVlcyBpbiB0aGUgY3B1aW5mbyBzdHJ1Y3R1cmUgZm9yIGd1ZXN0
cyB0byBtYXNrIHNvbWUNCj4+Pj4gZmVhdHVyZXMgd2hpY2ggd2UgZG8gbm90IHdhbnQgdG8gYWxs
b3cgdG8gZ3Vlc3RzIChsaWtlIEFNVSkgb3Igd2UgZG8gbm90DQo+Pj4+IHN1cHBvcnQgKGxpa2Ug
U1ZFKS4NCj4+Pj4gVGhlIGNvZGUgaXMgdHJ5aW5nIHRvIGdyb3VwIHRvZ2V0aGVyIHJlZ2lzdGVy
cyBtb2RpZmljYXRpb25zIGZvciB0aGUNCj4+Pj4gc2FtZSBmZWF0dXJlIHRvIGJlIGFibGUgaW4g
dGhlIGxvbmcgdGVybSB0byBlYXNpbHkgZW5hYmxlL2Rpc2FibGUgYQ0KPj4+PiBmZWF0dXJlIGRl
cGVuZGluZyBvbiB1c2VyIHBhcmFtZXRlcnMgb3IgYWRkIG90aGVyIHJlZ2lzdGVycyBtb2RpZmlj
YXRpb24NCj4+Pj4gaW4gdGhlIHNhbWUgcGxhY2UgKGxpa2UgZW5hYmxpbmcvZGlzYWJsaW5nIEhD
UiBiaXRzKS4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQu
bWFycXVpc0Bhcm0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gQ2hhbmdlcyBpbiBWMjogUmViYXNlDQo+
Pj4+IENoYW5nZXMgaW4gVjM6DQo+Pj4+ICAgVXNlIGN1cnJlbnRfY3B1X2RhdGEgaW5mbyBpbnN0
ZWFkIG9mIHJlY2FsbGluZyBpZGVudGlmeV9jcHUNCj4+Pj4gLS0tDQo+Pj4+ICB4ZW4vYXJjaC9h
cm0vY3B1ZmVhdHVyZS5jICAgICAgICB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrDQo+Pj4+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2NwdWZlYXR1cmUuaCB8ICAyICsrDQo+Pj4+
ICAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykNCj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9jcHVmZWF0dXJlLmMgYi94ZW4vYXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQo+Pj4+
IGluZGV4IGJjN2VlNWFjOTUuLjcyNTUzODM1MDQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9jcHVmZWF0dXJlLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0K
Pj4+PiBAQCAtMjQsNiArMjQsOCBAQA0KPj4+PiAgICBERUNMQVJFX0JJVE1BUChjcHVfaHdjYXBz
LCBBUk1fTkNBUFMpOw0KPj4+PiAgK3N0cnVjdCBjcHVpbmZvX2FybSBfX3JlYWRfbW9zdGx5IGd1
ZXN0X2NwdWluZm87DQo+Pj4+ICsNCj4+Pj4gIHZvaWQgdXBkYXRlX2NwdV9jYXBhYmlsaXRpZXMo
Y29uc3Qgc3RydWN0IGFybV9jcHVfY2FwYWJpbGl0aWVzICpjYXBzLA0KPj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICppbmZvKQ0KPj4+PiAgew0KPj4+PiBAQCAt
MTU3LDYgKzE1OSw1NSBAQCB2b2lkIGlkZW50aWZ5X2NwdShzdHJ1Y3QgY3B1aW5mb19hcm0gKmMp
DQo+Pj4+ICAjZW5kaWYNCj4+Pj4gIH0NCj4+Pj4gICsvKg0KPj4+PiArICogVGhpcyBmdW5jdGlv
biBpcyBjcmVhdGluZyBhIGNwdWluZm8gc3RydWN0dXJlIHdpdGggdmFsdWVzIG1vZGlmaWVkIHRv
IG1hc2sNCj4+Pj4gKyAqIGFsbCBjcHUgZmVhdHVyZXMgdGhhdCBzaG91bGQgbm90IGJlIHB1Ymxp
c2hlZCB0byBndWVzdC4NCj4+Pj4gKyAqIFRoZSBjcmVhdGVkIHN0cnVjdHVyZSBpcyB0aGVuIHVz
ZWQgdG8gcHJvdmlkZSBJRCByZWdpc3RlcnMgdmFsdWVzIHRvIGd1ZXN0cy4NCj4+Pj4gKyAqLw0K
Pj4+PiArc3RhdGljIGludCBfX2luaXQgY3JlYXRlX2d1ZXN0X2NwdWluZm8odm9pZCkNCj4+Pj4g
K3sNCj4+Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIFRPRE86IFRoZSBjb2RlIGlzIGN1cnJlbnRs
eSB1c2luZyBvbmx5IHRoZSBmZWF0dXJlcyBkZXRlY3RlZCBvbiB0aGUgYm9vdA0KPj4+PiArICAg
ICAqIGNvcmUuIEluIHRoZSBsb25nIHRlcm0gd2Ugc2hvdWxkIHRyeSB0byBjb21wdXRlIHZhbHVl
cyBjb250YWluaW5nIG9ubHkNCj4+Pj4gKyAgICAgKiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgYWxs
IGNvcmVzLg0KPj4+PiArICAgICAqLw0KPj4+PiArICAgIGd1ZXN0X2NwdWluZm8gPSBjdXJyZW50
X2NwdV9kYXRhOw0KPj4+IA0KPj4+IEl0IHdvdWxkIGJlIG1vcmUgbG9naWNhbCB0byB1c2UgYm9v
dF9jcHVfZGF0YSBhcyB0aGlzIHdvdWxkIGJlIGVhc2llciB0byBtYXRjaCB3aXRoIHlvdXIgY29t
bWVudC4NCj4+IEFncmVlLCBJIHdpbGwgZml4IHRoYXQgaW4gVjQuDQo+Pj4gDQo+Pj4+ICsNCj4+
Pj4gKyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+Pj4+ICsgICAgLyogRGlzYWJsZSBNUEFNIGFzIHhl
biBkb2VzIG5vdCBzdXBwb3J0IGl0ICovDQo+Pj4+ICsgICAgZ3Vlc3RfY3B1aW5mby5wZnI2NC5t
cGFtID0gMDsNCj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjY0Lm1wYW1fZnJhYyA9IDA7DQo+
Pj4+ICsNCj4+Pj4gKyAgICAvKiBEaXNhYmxlIFNWRSBhcyBYZW4gZG9lcyBub3Qgc3VwcG9ydCBp
dCAqLw0KPj4+PiArICAgIGd1ZXN0X2NwdWluZm8ucGZyNjQuc3ZlID0gMDsNCj4+Pj4gKyAgICBn
dWVzdF9jcHVpbmZvLnpmcjY0LmJpdHNbMF0gPSAwOw0KPj4+PiArDQo+Pj4+ICsgICAgLyogRGlz
YWJsZSBNVEUgYXMgWGVuIGRvZXMgbm90IHN1cHBvcnQgaXQgKi8NCj4+Pj4gKyAgICBndWVzdF9j
cHVpbmZvLnBmcjY0Lm10ZSA9IDA7DQo+Pj4+ICsjZW5kaWYNCj4+Pj4gKw0KPj4+PiArICAgIC8q
IERpc2FibGUgQU1VICovDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTV82NA0KPj4+PiArICAgIGd1
ZXN0X2NwdWluZm8ucGZyNjQuYW11ID0gMDsNCj4+Pj4gKyNlbmRpZg0KPj4+PiArICAgIGd1ZXN0
X2NwdWluZm8ucGZyMzIuYW11ID0gMDsNCj4+Pj4gKw0KPj4+PiArICAgIC8qIERpc2FibGUgUkFT
IGFzIFhlbiBkb2VzIG5vdCBzdXBwb3J0IGl0ICovDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0FSTV82
NA0KPj4+PiArICAgIGd1ZXN0X2NwdWluZm8ucGZyNjQucmFzID0gMDsNCj4+Pj4gKyAgICBndWVz
dF9jcHVpbmZvLnBmcjY0LnJhc19mcmFjID0gMDsNCj4+Pj4gKyNlbmRpZg0KPj4+PiArICAgIGd1
ZXN0X2NwdWluZm8ucGZyMzIucmFzID0gMDsNCj4+Pj4gKyAgICBndWVzdF9jcHVpbmZvLnBmcjMy
LnJhc19mcmFjID0gMDsNCj4+PiANCj4+PiBIb3cgYWJvdXQgYWxsIHRoZSBmaWVsZHMgdGhhdCBh
cmUgY3VycmVudGx5IG1hcmtlZCBhcyBSRVMwL1JFUzE/IFNob3VsZG4ndCB3ZSBtYWtlIHN1cmUg
dGhleSB3aWxsIHN0YXkgbGlrZSB0aGF0IGV2ZW4gaWYgbmV3ZXIgYXJjaGl0ZWN0dXJlIHVzZSB0
aGVtPw0KPj4gRGVmaW5pdGVseSB3ZSBjYW4gZG8gbW9yZSB0aGVuIHRoaXMgaGVyZSAoaW5jbHVk
aW5nIGFsbG93aW5nIHRvIGVuYWJsZSBzb21lIHRoaW5ncyBmb3IgZG9tMCBvciBmb3IgdGVzdCBy
ZWFzb25zKS4NCj4+IFRoaXMgaXMgYSBmaXJzdCB0cnkgdG8gc29sdmUgY3VycmVudCBpc3N1ZXMg
d2l0aCBNUEFNIGFuZCBTVkUgYW5kIEkgcGxhbiB0byBjb250aW51ZSB0byBlbmhhbmNlIHRoaXMg
aW4gdGhlIGZ1dHVyZQ0KPj4gdG8gZW5hYmxlIG1vcmUgY3VzdG9taXNhdGlvbiBoZXJlLg0KPj4g
SSBkbyB0aGluayB3ZSBjb3VsZCBkbyBhIGJpdCBtb3JlIGhlcmUgdG8gaGF2ZSBzb21lIGZlYXR1
cmVzIGNvbnRyb2xsZWQgYnkgdGhlIHVzZXIgYnV0IHRoaXMgd2lsbCBuZWVkIGEgYml0IG9mDQo+
PiBkaXNjdXNzaW9uIHRvIGFncmVlIG9uIGEgc3RyYXRlZ3kuDQo+IA0KPiBJIHRoaW5rIHlvdSBt
aXN1bmRlcnN0b29kIG15IGNvbW1lbnQuIEkgYW0gbm90IGFza2luZyB3aGV0aGVyIHdlIHdhbnQg
dG8gY3VzdG9taXplIHRoZSB2YWx1ZSBwZXIgZG9tYWluLiBJbnN0ZWFkLCBJIGFtIHJhaXNpbmcg
cXVlc3Rpb25zIGZvciB0aGUgc3RyYXRlZ3kgdGFrZW4gaW4gdGhpcyBwYXRjaC4NCj4gDQo+IEkg
YW0gZ29pbmcgdG8gbGVhdmUgdGhlIHNhZmV0eSBhc2lkZSwgYmVjYXVzZSBJIHRoaW5rIHRoaXMg
aXMgb3J0aG9nb25hbCB0byB0aGlzIHBhdGNoLg0KPiANCj4gVGhpcyBwYXRjaCBpcyBpbnRyb2R1
Y2luZyBhIGRlbnkgbGlzdC4gVGhpcyBtZWFucyB0aGF0IGFsbCB0aGUgZmVhdHVyZXMgd2lsbCBi
ZSBleHBvc2VkIHRvIGEgZG9tYWluIHVubGVzcyBzb21lb25lIGRldGVybWluZSB0aGF0IHRoaXMg
aXMgbm90DQo+IHN1cHBvcnRlZCBieSBYZW4uDQo+IA0KPiBUaGlzIG1lYW5zIHdlIHdpbGwgYWx3
YXlzIHRyeSB0byBjYXRjaCB1cCB3aXRoIHdoYXQgQXJtIGRlY2lkZWQgdG8gaW52ZW50IGFuZCBh
dHRlbXB0IHRvIGZpeCBpdCBiZWZvcmUgdGhlIHNpbGljb24gaXMgb3V0Lg0KPiANCj4gSW5zdGVh
ZCwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIGFuIGFsbG93IGxpc3QuIFdlIHNo
b3VsZCBvbmx5IGV4cG9zZSBmZWF0dXJlcyB0byB0aGUgZ3Vlc3Qgd2Uga25vdyB3b3JrcyAodGhp
cyBjb3VsZCBwb3NzaWJseSBiZSBqdXN0IHRoZSBBcm12OC4wIG9uZSkuDQoNCkkgdW5kZXJzdG9v
ZCB0aGF0IGFuZCBJIGZ1bGx5IGFncmVlIHRoYXQgdGhpcyBpcyB3aGF0IHdlIHNob3VsZCBkbzog
b25seSBleHBvc2Ugd2hhdCB3ZSBzdXBwb3J0IGFuZCBrbm93IGFuZCBsZXQgZXZlcnl0aGluZyBl
bHNlIGFzIOKAnGRpc2FibGVk4oCdLg0KQW5kIEkgZGVmaW5pdGVseSB3YW50IHRvIGRvIHRoYXQg
YW5kIEkgdGhpbmsgd2l0aCB0aGlzIHNlcmllIHdlIGhhdmUgdGhlIHJlcXVpcmVkIHN1cHBvcnQg
dG8gZG8gdGhhdCwgd2Ugd2lsbCBuZWVkIHRvIHJld29yayBob3cgd2UgaW5pdGlhbGlzZSB0aGUN
Cmd1ZXN0X2NwdWluZm8gc3RydWN0dXJlLg0KDQpJIGp1c3Qgd2FudCB0byBsZWF2ZSB0aGlzIGRp
c2N1c3Npb24gZm9yIGFmdGVyIHNvIHRoYXQgd2UgY2FuIGF0IGxlYXN0IHJpZ2h0IG5vdyBoYXZl
IGEgY3VycmVudCBsaW51eCBib290aW5nIHdpdGhvdXQgdGhlIG5lZWQgdG8gbW9kaWZ5IHRoZSBs
aW51eA0Ka2VybmVsIGJpbmFyeSB0byByZW1vdmUgdGhpbmdzIGxpa2UgU1ZFLg0KDQpSZWdhcmRz
DQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

