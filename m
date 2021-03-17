Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B733F233
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 15:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98716.187407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWnA-0001UB-F1; Wed, 17 Mar 2021 14:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98716.187407; Wed, 17 Mar 2021 14:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWnA-0001Tm-BA; Wed, 17 Mar 2021 14:04:56 +0000
Received: by outflank-mailman (input) for mailman id 98716;
 Wed, 17 Mar 2021 14:04:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MyhP=IP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lMWn8-0001Td-CN
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 14:04:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e187e55-a485-4a2a-bed9-76e15e49629f;
 Wed, 17 Mar 2021 14:04:52 +0000 (UTC)
Received: from DB6PR07CA0111.eurprd07.prod.outlook.com (2603:10a6:6:2c::25) by
 AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31; Wed, 17 Mar 2021 14:04:50 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::a2) by DB6PR07CA0111.outlook.office365.com
 (2603:10a6:6:2c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Wed, 17 Mar 2021 14:04:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Wed, 17 Mar 2021 14:04:49 +0000
Received: ("Tessian outbound eae0c21066a4:v87");
 Wed, 17 Mar 2021 14:04:49 +0000
Received: from 4fb79844b01e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F2C75CD0-BAA9-4ED4-808B-596C4E615D53.1; 
 Wed, 17 Mar 2021 14:04:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fb79844b01e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Mar 2021 14:04:43 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB4813.eurprd08.prod.outlook.com (2603:10a6:802:ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 14:04:42 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:04:42 +0000
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
X-Inumbo-ID: 7e187e55-a485-4a2a-bed9-76e15e49629f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7ti9llXCWTFMe6QSQtdT4PxC4YV4LOHHo6FuekhJxo=;
 b=kZHL82Y6Aq5ctnedH6OLmSuOXz0MjO2nMNEtiCYOe1f67RGzThZ6yyT7Ie7o6Wf+JNgxh0fwuxv2JgpLYdhUq6ngFI1imlUC3i0Ylr1e3g8Zew/efoTuoYgipX36n1kMbtaokQtuERQMew9FVaYYAYW9p6yfCUiWGPulCfnEDRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ed504178a1f7e50c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC3BH7VoHY8O2ElunVhyGHr4HQdvk/7eOEuuZQvQJuW4SMptaPpovvkAUSU7Tkwhf7Vj8xIlWT9XxnMlpOqZlV2jAbu/O0rrEmnjluPih2GgjuiAjMf9IGUngILCIgFZA6RSre2ZIBlqxwLNxyEnoP7srk9t2ift2tlHyCsdg3rw6w5upo3wY4L2eLXk+o2JIkOYfeFfoDmfV5o/+9DbzwN1vPOc7t6EPG2Te8M1sVl+osX+v4fDknmRU40T5xGONdbVyz3y7kzaq+1V2NZJZZj9f9OxYs980uFd+9nLKoqCD9AHNhQGLq34Ct/BM5/jjyuOVrkOtQmruvzoyk0Dgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7ti9llXCWTFMe6QSQtdT4PxC4YV4LOHHo6FuekhJxo=;
 b=cmZoKBUql/0i+fodMQkjEF+h1h0fpbQnqO8BnNEP+Yv9l+eNtJWihCKhXzim6J2Sk6XLZaWe9n2kaiaXhSReLKrTpJHoRWRKelbmmBXfzWmqld4y5SUWzVVbO04IDdOzHQ/goZvtV4o4tS3fHZue4UZ981usrzuM5SXb87n/jIbIg6fF05DsFZ3o6sTiXHz+dRAoCHWA2JUSOgLzmW59svXMxQCeRYngp0hwvrdugKAYWtOWsTfRixFM2Q4+hDSiO5elF2AsKulx4xfgazAkw34QrNgLPXNrDAlNgpMt/m6xoskNikOjrD65Vu3pjNN7rVz6jZKWBhO6tcA8ZA1krA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7ti9llXCWTFMe6QSQtdT4PxC4YV4LOHHo6FuekhJxo=;
 b=kZHL82Y6Aq5ctnedH6OLmSuOXz0MjO2nMNEtiCYOe1f67RGzThZ6yyT7Ie7o6Wf+JNgxh0fwuxv2JgpLYdhUq6ngFI1imlUC3i0Ylr1e3g8Zew/efoTuoYgipX36n1kMbtaokQtuERQMew9FVaYYAYW9p6yfCUiWGPulCfnEDRM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Topic: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Index: AQHXGCLVbl4hty1bX0WFvkxXr3KxFaqFDwwAgAGybICAAB5+gIABLumAgAAtzoA=
Date: Wed, 17 Mar 2021 14:04:42 +0000
Message-ID: <8E74D116-C7CC-42C3-AE70-A780F43AB1BB@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
 <119bdbc0-5400-87eb-e6ad-87b59ec4e07c@xen.org>
 <4066B6A3-2904-4800-B63A-7EAD1EFC7D16@arm.com>
 <ee09d90d-b4e6-2b11-d2ec-1878fee601b8@xen.org>
In-Reply-To: <ee09d90d-b4e6-2b11-d2ec-1878fee601b8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 91d16442-2623-4414-207f-08d8e94da11e
x-ms-traffictypediagnostic: VE1PR08MB4813:|AM6PR08MB3317:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB33177A2C5E6F94AD76E964BC9D6A9@AM6PR08MB3317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jsJ4j//1Pxo20DdWub6O1UAvPuCwqNu7PoqiUr/z52iwlehEcbpqyWsyqQHQ92OB8/IEIUDQcireUePqCmMJZt4ZNXR7Fke7N9/YNoku9sCujrXOe+NjKl612QFmN998GJ0UwShEZszv3YKekWXLFLebnTpRPYEiLsIzFAujAedS4Q8pqCSFtLg/2hcMAtKEoBnYrJ3YqQslLchxPR6FJaqXvED+sy9M06AyHXGMDVIXIXK1lKJ6Rp6aq0W65O0HgMnboUS3VBMSF2iN/F2QHzjPaWnwLu735F+xS1BdD/owmAZoamjvjzakjBEXGmD/TjIFFQnRqToFAIQ7/cVTwASxtb1CbMk6HpnvJm5ic+0wQpu4ec/lIM4gjviz2hYI5FQHDFpOkINGNxWsmT0kI4q809K9x3suysQ0kiWJzevLc6bKhx/FTfaebB4Vk9JaKmrAQaX0b9ODO9NI48L8jJNGFIRQ/Ht3Y4oZjWAi0kpsjSY5dHt0xw34OIwzmm9NqYho7+f64Ke9ifvS+jAXIOp+4EfmNqWr/tEbyv8ZHsRGJ5GJg5xAM7FE2eP1XTbzwCXqbtM+QvksEmleoUCf7XEJw1HEyaJd/TF4rU0Wr7kjGtb/7sf9l+Xjeoyfj/lFJcGTQXE3wQxJtepN19/X4Wjm6SJGU06Ih73v9ELKFnqXsWszOdevt4k1NH3HNc2ZI0zDlFFyOsFks0lPzfLmS93UPLd4KJEEE737IWHTBbw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(966005)(26005)(6916009)(5660300002)(8936002)(53546011)(54906003)(36756003)(8676002)(186003)(2616005)(316002)(66446008)(2906002)(64756008)(4326008)(6486002)(6512007)(83380400001)(478600001)(33656002)(55236004)(86362001)(6506007)(76116006)(66556008)(91956017)(71200400001)(66476007)(66946007)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?OW50RHJ0SFB2MGpFa0FqUEUrNmxOWUUySEZWRUJlR1JOb2RCZlhWbmtERFhu?=
 =?utf-8?B?WVZUWFZnTzIxR1pURzl1amtCRVBDdUU5YkdweU5CRFQweC9pS1owOVQ5UmVa?=
 =?utf-8?B?eUZNbDhsUjdDRVJQV0x6cW04ZWt6K1FtSksrdWtJeW5uZDlycTluS2NPRmM5?=
 =?utf-8?B?UzJRM0Jjd0UzYlR2aDNhMUljM0N4NCtHbUdueXFSQVVPKzVkTnB5bytQa3dB?=
 =?utf-8?B?OENieENBUDAxWTJrbmpLM1JRbXNnK1g4L1BWZmlhN3hUZzhpT01WNnZkSHZo?=
 =?utf-8?B?akdEendsNUpnQ1UvSmRlL01sRkttK1dtaFloVmZKZjRsMFNWWGI5bytjMGlj?=
 =?utf-8?B?SHNSQW5nc2RCYUxDQkdxTXNQZWRpcjlsZnVnTUkycFJZTlBablM5OGt2UXg2?=
 =?utf-8?B?YUVRbStmL3oxVDN0R21vYklaOVRyKzFFK1dPWkhEM21pWm0yek1IM3JkS1dH?=
 =?utf-8?B?VVdZRDNOWXBibFI3STU5bW1vYy9vSlVxMklOZkRKNDU5WnpWcUJ4ZDIzeW1u?=
 =?utf-8?B?K202LzJuUFUxWjhvV3oycEcwZ0l1K2o4S1hmb2p5MkZVSzd4TEFkb1NCWno3?=
 =?utf-8?B?VTlva2p1bms0WVZvYktWbEgrRkZvSHE0Q2gzdmhuaFdITVRMYy9mMjNJaWlV?=
 =?utf-8?B?bkxVQ09pTlNiMzRGQ0h1cHNLTG04OTFZQTRMcEVXQzFBVWVuUmdYSGJGa1A5?=
 =?utf-8?B?aHJabkdKdlhNTTBiWDVQSmVLZ2ltTVIxV01kVVZvRTU3aERGT0l6bEo1L0lH?=
 =?utf-8?B?UXFlWFBDZGZsNndlT3J5ZzBaMkdFK1FmbzB2S0gxSk1tWDNHbVRHSWFDbS9k?=
 =?utf-8?B?bDdNTWd4Qm1kR3JtZldhMERSejhEQkJXS0pGOHhIQ0l6bDZla1NzRFNQN0l6?=
 =?utf-8?B?WkdNZVBkbGhhNFAwZG5yWGQzR3FIOHQrVGlPQmZTcWRCRDV1YWFrS2VtZHFs?=
 =?utf-8?B?T2FDRzBuVkxxd1BPeE9vMHJiazh0dFBKaW1pNytXWTVXSmp3VGVTZ1p4UGNS?=
 =?utf-8?B?a3NUU1VCU1l0S1dtYUoybzRPd3l2VWJDd1ZUSzY4cWY5L1R0RVc5L3dmcnhX?=
 =?utf-8?B?VExUQURFZUxCMFo3WWpHM05oMjI2OVN2bWtrTm0yYXlybVlVK2g1NGVZTWEr?=
 =?utf-8?B?WU9DcDJzOEVzQmEzTkpka3paUFpZTlB6MUd6alFKZ1h5Y21qSThkMHM4UERL?=
 =?utf-8?B?eVdIYkhVb1V5S2Njc2ZvYVlyVkw2L1VWeTFFK2ZNM3pxOGpNUzluZHRXL2hy?=
 =?utf-8?B?c2tpa0xjTzBYVmllUFc1MkQzUjFFaUdoSnRkZElPVXVqVzhUUnk3eHhvTmJY?=
 =?utf-8?B?YUQ5d0ExWFVWeTRsT1RwQVdpVWpkOFNncE5VbXdDdXN2ZFpzK1gweUxYYWw5?=
 =?utf-8?B?UGJRWlVidkx5M1gxaEsrcWJZQ0xVeUFUU3FXVUl1ZlZYV3BGeXNFdnh3dkp1?=
 =?utf-8?B?VGJDVVY0NndUSUZGUjYwOWJSc2JUZWxoS2F5ZTN0RGVhdTdmS2tnU2oydWRD?=
 =?utf-8?B?YnFuTElWMXFBWk1RTGhwVzdFa04rTTBNUHZ4RU1mUnowczQ0VGh5RDR3cmdZ?=
 =?utf-8?B?eXFDb3lIcE16RWl0OFl5QllxM25JeDNZOVp2TVo1bzNNTFhxUzZFL2pQYmFC?=
 =?utf-8?B?a2orRWxEejBUK1RjQWxzRkliNjYySFdRdGQrMDVkUHp5NXgxeWkvZUROZlEr?=
 =?utf-8?B?U2kwTWg1dzJsQ0djWWVCd3BNQmV5TE1iV1ZqSmllaFJWc1k4M0JWWDVXQWRu?=
 =?utf-8?Q?Sc3CQXNvZSck3ETCOvbeZTuko6x91EjD6EEYvZ/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E658E096AB776A42AABD480E7EBA94C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4813
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fab80550-1123-4c98-ab61-08d8e94d9c8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2KP5aaqEhDGgcm6/PTvJQWxDLyL2Xc+7FU7rhaKIULNzoB0l272f/zH/tfh6kR0mN6OzBiApCXYPIRpNQolm2xPfDw7GB7DinLysJosbAfMZ8moKH1qUlTjQM8OKmPPDb4k+seS+fooyB7+jN4XpwuhISL5w/xrATyoyrrnPTmBoPNR3n/NF/35aAEJ2EFTMY8uk2yrnXkG3HJ0UdyJRbP8nNGMcGxl1/uRX6Ne4L6DYx5zKq1mpEa1UEKwg4vI8UY0k+u8WSt/mBTJJg7KOZfl9g3qoLcT5J8/4Rjj9zCZobSI4QCGCBiOet0aNT3jEi2d9MQ13Eyu3r3tTR+IcxfFffWff/A13uEKHHRR+XbAuwi9gaFzYUugS7Y960Mq/pIv+ANuw3hmZ1+KruEcKnI16yG7kUaK1AkMaL2dMGcD30ixNOpJDVWw5WYUr4X2wFZFfdPJNzNdUeCe2u8eEzjVoIXly49gqagXHW+xIvuwcLdpCepxsqqAOgDmE0xi8v3mRlWbbHDS/9iYxGyeqed3cvnWEW/V17VsF/sZsND13POChEfcINJqToutOuvEEPQxopKs16dLnJ8Ytc/p4AGzk2vj13o84oRPq9koinVvCoQkKlB3e9mIhrWONcRT+G+g1LRz3PvMeBNIFMOqV0P1RAzweB4ZyhdboHcPts5p9SWZdhZVTSI+zVyLjE9XT+kGAP1K1Kzc795fc+UbYp8sb3UTya5M2MJa0FTvTYWEYz71bB3EFZLW9i+yuYH4U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(46966006)(36840700001)(6512007)(53546011)(2616005)(82740400003)(107886003)(6506007)(6486002)(36860700001)(8676002)(186003)(8936002)(36756003)(4326008)(2906002)(81166007)(478600001)(70586007)(86362001)(316002)(966005)(83380400001)(5660300002)(55236004)(26005)(33656002)(70206006)(82310400003)(336012)(356005)(47076005)(54906003)(6862004)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:04:49.7695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d16442-2623-4414-207f-08d8e94da11e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3317

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IE1hciAyMDIxLCBhdCAxMToyMCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzAzLzIwMjEgMTc6MTYs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gMTYgTWFyIDIwMjEsIGF0IDE1OjI3LCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiANCj4+PiANCj4+PiBPbiAxNS8wMy8yMDIxIDEz
OjMyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+Pj4g
SGkgQmVydHJhbmQsDQo+Pj4gDQo+Pj4+PiBPbiAxMyBNYXIgMjAyMSwgYXQgMTY6MDYsIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiBGcm9tOiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPj4+Pj4gDQo+Pj4+PiBIaSBhbGwsDQo+Pj4+
PiANCj4+Pj4+IExhc3QgeWVhciwgQXJtIHJlbGVhc2VkIGEgd2hpdGVwYXBlciBhYm91dCBhIG5l
dyBjYXRlZ29yeSBvZiBzcGVjdWxhdGlvbi4NCj4+Pj4+IChzZWUgWzFdIGFuZCBbMl0pLiBJbiBz
aG9ydCwgYSBwcm9jZXNzb3IgbWF5IGJlIGFibGUgdG8gc3BlY3VsYXRlIHBhc3QNCj4+Pj4+IHNv
bWUgb2YgdGhlIHVuY29uZGl0aW9uYWwgY29udHJvbCBmbG93IGluc3RydWN0aW9ucyAoZS5nIGVy
ZXQsIHNtYywgYnIpLg0KPj4+Pj4gDQo+Pj4+PiBJbiBzb21lIG9mIHRoZSBjYXNlcywgdGhlIHJl
Z2lzdGVycyB3aWxsIGNvbnRhaW4gdmFsdWVzIGNvbnRyb2xsZWQgYnkNCj4+Pj4+IHRoZSBndWVz
dC4gV2hpbGUgdGhlcmUgaXMgbm8ga25vd24gZ2FkZ2V0IGFmdGVyd2FyZHMsIHdlIHN0aWxsIHdh
bnQgdG8NCj4+Pj4+IHByZXZlbnQgYW55IGxlYWthZ2UgaW4gdGhlIGZ1dHVyZS4NCj4+Pj4+IA0K
Pj4+Pj4gVGhlIG1pdGlnYXRpb24gaXMgcGxhbm5lZCBpbiB0d28gcGFydHM6DQo+Pj4+PiAgIDEp
IEFybSBwcm92aWRlZCBwYXRjaGVzIGZvciBib3RoIEdDQyBhbmQgTExWTSB0byBhZGQgc3BlY3Vs
YXRpb24gYmFycmllcg0KPj4+Pj4gICBhbmQgcmVtb3ZlIHByb2JsZW1hdGljIGNvZGUgc2VxdWVu
Y2UuDQo+Pj4+PiAgIDIpIEluc3BlY3Rpb24gb2YgYXNzZW1ibHkgY29kZSBhbmQgY2FsbCB0byBo
aWdoZXIgbGV2ZWwgKGUuZyBzbWMgaW4gb3VyIGNhc2UpLg0KPj4+Pj4gDQo+Pj4+PiBJIHN0aWxs
IGhhdmVuJ3QgbG9va2VkIGF0IDEpIGFuZCBob3cgdG8gbWl0aWdhdGUgcHJvcGVybHkgQXJtMzIg
KHNlZQ0KPj4+Pj4gcGF0Y2ggIzEpIGFuZCBTTUMgY2FsbC4gU28gdGhpcyBpc3N1ZSBpcyBub3Qg
ZnVsbHkgYWRkcmVzc2VkLg0KPj4+Pj4gDQo+Pj4+PiBOb3RlIHRoYXQgdGhlIEVSRVQgaW5zdHJ1
Y3Rpb24gd2FzIGFscmVhZHkgYWRkcmVzc2VkIGFzIHBhcnQgb2YgWFNBLTMxMi4NCj4+Pj4gT24g
bXkgdGVzdHMsIHRoaXMgc2VyaWUgaXMgYnJlYWtpbmcgdGhlIGFybTY0IGJ1aWxkOg0KPj4+PiB8
IGFhcmNoNjQtcG9reS1saW51eC1sZCAtLXN5c3Jvb3Q9L2hvbWUvYmVybWFyMDEvRGV2ZWxvcG1l
bnQveGVuLWRldi9idWlsZC9wcm9maWxlLWZ2cC1iYXNlLnByai90bXAvd29yay9mdnBfYmFzZS1w
b2t5LWxpbnV4L3hlbi80LjE1K2dpdDEtcjAvcmVjaXBlLXN5c3Jvb3QgICAgICAgICAtRUwgIC0t
Zml4LWNvcnRleC1hNTMtODQzNDE5IC0tZml4LWNvcnRleC1hNTMtODQzNDE5IC1yIC1vIGJ1aWx0
X2luLm8gbWVtY3B5Lm8gbWVtY21wLm8gbWVtbW92ZS5vIG1lbXNldC5vIG1lbWNoci5vIGNsZWFy
X3BhZ2UubyBiaXRvcHMubyBmaW5kX25leHRfYml0Lm8gc3RyY2hyLm8gc3RyY21wLm8gc3RybGVu
Lm8gc3RybmNtcC5vIHN0cm5sZW4ubyBzdHJyY2hyLm8NCj4+PiANCj4+PiBJIGNhbid0IHNlZSBh
bnkgYnVpbGQgZmFpbHVyZSB3aXRoIHRoZSBmb2xsb3dpbmcgR0NDOg0KPj4+IA0KPj4+IDQyc2g+
IGFhcmNoNjQtbGludXgtZ251LWdjYw0KPj4+IGFhcmNoNjQtbGludXgtZ251LWdjYyAoVWJ1bnR1
L0xpbmFybyA3LjUuMC0zdWJ1bnR1MX4xOC4wNCkgNy41LjANCj4+PiBDb3B5cmlnaHQgKEMpIDIw
MTcgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuDQo+Pj4gVGhpcyBpcyBmcmVlIHNvZnR3
YXJlOyBzZWUgdGhlIHNvdXJjZSBmb3IgY29weWluZyBjb25kaXRpb25zLiAgVGhlcmUgaXMgTk8N
Cj4+PiB3YXJyYW50eTsgbm90IGV2ZW4gZm9yIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4NCj4+PiANCj4+PiBBRkFJQ1QsIHRoZXJlIGlzIGFsc28g
bm8gY29tcGlsYXRpb24gaXNzdWUgcmVwb3J0ZWQgYnkgZ2l0bGFiOg0KPj4+IA0KPj4+IGh0dHBz
Oi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy8yNjk5ODk4
OTQNCj4+PiANCj4+PiBXaGF0J3MgdGhlIHZlcnNpb24gb2YgeW91ciBjb21waWxlcj8gRG8geW91
IGhhdmUgc3RlcHMgdG8gcmVwcm9kdWNlIHlvdXIgc2V0dXA/DQo+PiBZb3UgbmVlZCB0byBoYXZl
IGVhcmx5cHJpbnRrIGVuYWJsZWQNCj4+IEkgYW0gdXNpbmcgZ2NjIDcuNS4wOg0KPj4gYWFyY2g2
NC1saW51eC1nbnUtZ2NjIChVYnVudHUvTGluYXJvIDcuNS4wLTN1YnVudHUxfjE4LjA0KSA3LjUu
MA0KPj4gb25lIGNvbmZpZ3VyYXRpb24gdHJpZ2dlcmluZyB0aGUgaXNzdWUgaXMgdXNpbmcgdGhl
IGRlZmF1bHQgLmNvbmZpZyB3aXRoIHRoZSBmb2xsb3dpbmcgaXRlbXMgYWRkZWQ6DQo+PiBDT05G
SUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUz15DQo+PiBDT05GSUdfREVCVUdf
TE9DS19QUk9GSUxFPXkNCj4+IENPTkZJR19QRVJGX0NPVU5URVJTPXkNCj4+IENPTkZJR19QRVJG
X0FSUkFZUz15DQo+PiBDT05GSUdfREVWSUNFX1RSRUVfREVCVUc9eQ0KPj4gQ09ORklHX0RFQlVH
X1RSQUNFPXkNCj4+IENPTkZJR19FQVJMWV9QUklOVEtfSlVOTz15DQo+PiBDT05GSUdfRUFSTFlf
VUFSVF9QTDAxMT15DQo+PiBDT05GSUdfRUFSTFlfUFJJTlRLPXkNCj4+IENPTkZJR19FQVJMWV9V
QVJUX0JBU0VfQUREUkVTUz0weDdmZjgwMDAwDQo+PiBDT05GSUdfRUFSTFlfVUFSVF9QTDAxMV9C
QVVEX1JBVEU9MTE1MjAwDQo+PiBDT05GSUdfRUFSTFlfVUFSVF9JTklUPXkNCj4+IENPTkZJR19F
QVJMWV9QUklOVEtfSU5DPSJkZWJ1Zy1wbDAxMS5pbmPigJ0NCj4gDQo+IFRoYW5rcyBmb3IgcHJv
dmlkaW5nIHRoZSAuY29uZmlnLiBJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIGl0LiBTbyBJIHJlbW92
ZWQgImFzbV9kZWZucy5oIiBldmVyeXdoZXJlIGJ1dCBmb3Jnb3QgdG8gaW5jbHVkZSBpdCBpbiB0
aGUgImNvbmZpZy5oIiA6Ly4NCj4gDQo+IFRoaXMgc21hbGwgY2hhbmdlIGZpeGVkIHRoZSBlcnJv
cjoNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2NvbmZpZy5oIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9jb25maWcuaA0KPiBpbmRleCA1MTI3M2I5ZGIxZmMuLmM3Yjc3OTEy
MDEzZSAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9jb25maWcuaA0KPiArKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL2NvbmZpZy5oDQo+IEBAIC0xOTIsNyArMTkyLDcgQEAgZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgZnJhbWV0YWJsZV92aXJ0X2VuZDsNCj4gI2RlZmluZSB3YXRjaGRv
Z19lbmFibGUoKSAgKCh2b2lkKTApDQo+IA0KPiAjaWYgZGVmaW5lZChfX0FTU0VNQkxZX18pICYm
ICFkZWZpbmVkKF9fTElOS0VSX18pDQo+IC0jaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+DQo+
ICsjaW5jbHVkZSA8YXNtL2FzbV9kZWZucy5oPg0KPiAjaW5jbHVkZSA8YXNtL21hY3Jvcy5oPg0K
PiAjZW5kaWYNCj4gDQo+IFdvdWxkIHlvdSBzdGlsbCBiZSBoYXBweSB0byByZXZpZXcgdGhlIHNl
cmllcyBiZWZvcmUgSSBzZW5kIGEgdjM/DQoNClN1cmUsDQoNCkkgd2lsbCByZXN0YXJ0IG15IHRl
c3RzIHdpdGggdGhpcyBjaGFuZ2Ugbm93IGFuZCByZXZpZXcgdGhlIHYyIG9uY2UgcGFzc2VkLg0K
DQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4g
R3JhbGwNCg0K

