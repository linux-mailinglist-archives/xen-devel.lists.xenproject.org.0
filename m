Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497AE45A8E5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 17:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229755.397251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYrd-00016F-MJ; Tue, 23 Nov 2021 16:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229755.397251; Tue, 23 Nov 2021 16:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpYrd-000141-Iz; Tue, 23 Nov 2021 16:41:49 +0000
Received: by outflank-mailman (input) for mailman id 229755;
 Tue, 23 Nov 2021 16:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpYrc-00013t-05
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 16:41:48 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed5d1e1-4c7c-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 17:41:46 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANFDF44020298;
 Tue, 23 Nov 2021 16:41:42 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2113.outbound.protection.outlook.com [104.47.17.113])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cgy2phck7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 16:41:42 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3876.eurprd03.prod.outlook.com (2603:10a6:208:73::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 16:41:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 16:41:40 +0000
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
X-Inumbo-ID: 3ed5d1e1-4c7c-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekY9br1HpICNgEb/p4WRtWJiiwT5ebrSJ+BNrk9GBjdxg/i87+0KCT0LeFfZL9eM9CauJ+peTsWZ++OjJWtSxy/RzRJ2FBTK5nw2TYhJbvi6qtbGyRQGS9sJN9pz3VknPfkC1cxPRUXIHvz6187pt3tJJEf+Jdbf12ZeA6HEriCIJoOAKC5TWLxnsVp11sqN2Ny/XgnRcZG8151wBgHwcR/HM2w8MbzBt3CSWD2/s/qmBIdHPQTCyFoYX0amc5+iNeih1rAsQH7mxfbmQTuZMX3lXj9JolLsFUh5TpOzJh316/i9KC4TI3GuWkPkXTCJ7GCmqN6dzGMQkaJMpmSEnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thSS4oU9iGpSNNbAd5ns9uo2k7RlCPuK+psrTPeVUPI=;
 b=I9TWAFA7WIxiagoOgjCU7vtqD5M+LVJSAsH/lnyZvIvSTxlC6+jwOv7Xz8hU3/umS+rKMkpRsdiadVYnXR4j86l6b5OivSF+uPCspm9xhbbRh4RUmavjmtqn3OSRrsoRlmXv5fnMBm62Ay8PyUoeZ/jF32Kpt1d+tVIx8SdOo5cMSofw/fGQ8jkMloal9bmfIMRxIY6MKO/6r7JtCiJkph4Mb2fILYRBR8hgZD1dU63QwwjykVCImnsYjNcRK6u8N4WbINrZLuO/fhxjIt/S2W2sur/SIGjlyF7hBIB+4tyu4PhjtCiUuqCjTlm45VbUzMF95c3tYa+D38XVZwXS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thSS4oU9iGpSNNbAd5ns9uo2k7RlCPuK+psrTPeVUPI=;
 b=G7S19Ko2o7oNxetrvMeLfbeDx+wazwxxOMkub1/FkCksXxjc6WCX/ZPkiI0MqTrn9qlI+IzS0uw3DECkjhNe67mB7waAVhwpcmbzC7jCDCYWHfBvTCLaedNCBGdfeI2AlHI1S5nIR/5TrFkX5lw1Nwas1Cu/HwPKRVUHZjzYVGKOPVPfxCujjaY1nC0H4FRXb1pG1ev70dR6giipctPsVXt9clvaCUJao86T3SArJ2vDqtqeJM2ok5xqhS8IYBPKLtkr+0Rldu4Q1AL3bxCPBj0Q/+NsiD6xbzcJRtD+WXr29vuJoO5kuB5pXiJHQxtteUNJPeOPgZCeJC3ufMvafA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHX0g8SPRoS2Ac9eEeTcWew1GI8x6wGl6aAgAJfuQCAADeUAIAGu8iAgADgLICAAJqvgIAACEQA
Date: Tue, 23 Nov 2021 16:41:39 +0000
Message-ID: <442c853a-5554-9be0-80e4-b1f34cd6adeb@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
 <2eb6b4e8-95e1-9566-3209-c28964b0d643@xen.org>
 <2f414e8f-67d5-d513-74d4-cc21a3a9ed28@epam.com>
 <9f712f79-9660-865a-3002-713950518819@epam.com>
 <117a57d1-aa4f-8153-8bba-2db47c234b81@xen.org>
 <c6232073-b59a-609f-3852-ddcac0859c2c@epam.com>
 <ef17fbe6-9768-9978-fa8f-6be757034234@xen.org>
In-Reply-To: <ef17fbe6-9768-9978-fa8f-6be757034234@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41e6d8de-96b9-4df6-f7dd-08d9aea01fdb
x-ms-traffictypediagnostic: AM0PR03MB3876:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3876B02BA2EF91CC8296BC21E7609@AM0PR03MB3876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9MCAFphM8QZ2muD3DVykCosCN1wfWjlH1YicaAjdM1uJqOj5D3vlyuIgK76bv1zcOe2YS7vkGMm13iOFkun/BiR51ML4Gb20XsndvY/q6xUvDvuEK2UxDh1HYVL3PGO7MXMnzhCk62X9l9I+2v8E/iCjSxnZLoWYXQCpvWoSw72JSOzUIy+uvwVC4hZesrrVnbQA+hO1G5KGFeNr5RvRr0TDqbjso19zR7y86d2zFH9XR3ITrhQMSjiNKrQ4x5duMM5sUaqJK+riO1CGnNnImPaOwtATG2PzyYIGiwvMs95EL8Tzo/XNm7emNblBHz/wnMsvgCVLgmQcyr8hxqIrNHCK1Xc1IhZR70fY1L48DeMWELXD8qqjF4czW8qihDYh359MmXVXskP71vdP91il+1Vj8rbwdjS5xcPABVXtai7GbAv3yQWm302NvZx4xiWZmoYkGmJcjTvDf7FmGKWnQL8MfA4MhmYbpm9hd28MkxPMxxy59d7hP0+FMmFPx1ZT12cPY8mvA0871QT3eyYABzenTN+PQ7zLDhJ4FjGD0kTLVYlGXSVMrju6PS5Tif3X0AWve+AtqQxjTHH8TVhhHJBPKwvnFFlzapi2pBWWXIm4VS/EeQVzW1sOH6jysx9kC45yzBudU0DYL+amC86nCx82pcT+lzKFsQjRMVLRajf448PE2CRWFyQ7AubKRqelyHkUW4uE1AeY/1JQsq6hLj5CeiKJVYFYBXDHElVq42VBStiEqqEO201YNTsEM9L1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8936002)(54906003)(110136005)(5660300002)(6486002)(71200400001)(66446008)(4326008)(66476007)(38100700002)(64756008)(66556008)(508600001)(86362001)(6506007)(53546011)(2616005)(7416002)(2906002)(107886003)(38070700005)(31686004)(6512007)(66946007)(316002)(8676002)(91956017)(83380400001)(76116006)(36756003)(122000001)(31696002)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWdkbC9xNUY2elRyb0pUeFFhWlBRSURrWi9DdGJHczZLeVh0TklGbnI2S0tv?=
 =?utf-8?B?b0p3U1cxNTE2MjRGL2ExTWlLbmRUMloyNGtkRm1jOExPNE50RTN5UmplYjQ4?=
 =?utf-8?B?eXVrTkY5UUhUMjk4bFBiMWxqdjRsZHNrejVNS3h1djFwaVhNMUZ5Z3BGaVVM?=
 =?utf-8?B?TEFmS1U4YUs4YXUwbC9LcllmaWt3UklkRlRqREhQUEpnQkI0ekQwUzNiUHpE?=
 =?utf-8?B?ZVdqT3pJYlRWVER4SXcyUlRXRE5XSXhGQ0JzMi9zRDBOSG0rRTVmVGoycy9D?=
 =?utf-8?B?ejdlK3ZWYkFacEtoZHo1ZlR3L3luR3RrOUJuMi94dm9YZW5MRSttb296YjRW?=
 =?utf-8?B?dkVNREUrZFpFYUpoejdQQ21kNlhMR0xzZXU0SElFWFg0OFVuZURDeTdlR2J3?=
 =?utf-8?B?bngvK1ZvUVltRDhkZXd4QTdlcm9xK1kvV2ZzU2ZCdzFyamliZnB1NDJGRW9O?=
 =?utf-8?B?MndwS2hNenpVZW9ZSnp0dzRGL1A4bE9NN1JabHN5QzZHL0VlVGlBK3g2eVBQ?=
 =?utf-8?B?Sjg5T0FZQlN4ZjRZMno0YUFhTUx5RVRES3hqWGdvL2o4Vm1DTzZBYXA5WFhJ?=
 =?utf-8?B?NjFXZjFXU0llNWpaZEZMWEhydHROUzlvRTg2R0FUYkFGQXNxMTVodys2dFRD?=
 =?utf-8?B?NUtlQWpsb09FN1BqbnpCS3NxVmVQeWllMDYra1VQbDhtN0FEK0pNd0ZDOXpH?=
 =?utf-8?B?QkVwQ0x1RTJ0SFEzK3RwSW16SGw5WnNpdVhWV2NjdmZhTmtnTkVtYk85blN3?=
 =?utf-8?B?QVlSL0ZiSGcyMEo5dmhFQlBkMS9oZzdnQmNLSVI1TXdUdDhib3FxREpscXVt?=
 =?utf-8?B?eFNMaVVwL2JCWXB1OFNZcXNHR0o3QU84NlZHb3ZrZkhvc3BJK0NMK3hwbW9S?=
 =?utf-8?B?Mm85YklqMENRODQ3UXB4R2xjeklmcmk0QnhrMUNhRVE0ZHE5T2VTZEUzbHYv?=
 =?utf-8?B?YTVZbUxmTWhiRDFMdjhKbUpiTGM4bDZDeWZ0SjRmK21YVlQ5K0tKTDNLSlVU?=
 =?utf-8?B?aVNScVF5aGd4YVdqWTFmYzlVMEJhSlNYOEVLd2Q4RzU4SlIrV29MYXhDczJV?=
 =?utf-8?B?b1hTd3pUcmE2Q0VWSHA3TGluZ040R2p0MG0xZXZZdWN3NSszcFdDT3VxYlMr?=
 =?utf-8?B?MkxPZjZjRTlJa1pFRlBWWnZVbmZQZ2piSXo0ZzVIWElBTjBLdzRDUVNVQVBx?=
 =?utf-8?B?Slh3WDZmSGYzdWZYY2RjS0tJOTV3dWw3eGJpQkN2OXFMdjBNeWRld2Fob3U3?=
 =?utf-8?B?c0xTc201NGdSRHJmQjNVQjVSdjFXUm9yNi9BV0xGOVI1MDZTQ2NjMHNZZmZX?=
 =?utf-8?B?djIzbFNLalB2cnUwd2VJYkREM0NSWHp3SUpKcHNabGlVQ3JlWHR6aWl4SUdi?=
 =?utf-8?B?bThpWEpkbHAyNmU0MWllOU5jZWZQVXhaVlpVWWR1NWpDZk03SEc1RXN1ZUlE?=
 =?utf-8?B?T3NmeEtXblVtZ3NHRkpBSmRmSEVmSlZPZS94YVczV0EyYWtRTVdheFh0ZExR?=
 =?utf-8?B?SHVmeWVqanZSYmJ3andFUVZDNTFRZ05idHhEb01Kb0k4Z1IxM1VxSGtPM1pi?=
 =?utf-8?B?ZzJTRVkzY1VKdDdmcVF1b0pYZHJsTE90aFJyUU5yVkh5YUh1Z2RJUUJyWjNk?=
 =?utf-8?B?bWJjalVjTU1ZUG9lY0RSajNiWkEyaEJFdXg3Q3MybldORW0xMkFVZitjMGdK?=
 =?utf-8?B?MHhiWjdrUGUzNlFVMmJhUlRNVDhUNTUxZ0tFYy9KdzhoYzdCdktTR1Yrbjh2?=
 =?utf-8?B?RGphb1BNU1J2bFhnQmtiY3hhZmNWRDdVSjM1bTd5OENZNVdjSnc5STVqRExJ?=
 =?utf-8?B?djA3ODBHQzllaE1MMkZqTnowSlpNNzkzSmh6SDBqT1ZLajhVWmJ0NmpsOFpa?=
 =?utf-8?B?NzFYVm9wNDFLMWYzNURUd1NjcmZ2YUxoM2hncnd2cVhpMUUzTkIrTU1oYnR6?=
 =?utf-8?B?SGFHSkRIWnl6cEN2dW1QazNvbzB3Mjh6di9RVnRFSTNDeGtQYlNJQUkrZk1m?=
 =?utf-8?B?aG83QnkwZVFOS3Y3QkNQamVoY29haFJ3Vy9ySDBVR0NnTklIRVQzT1paR0Y1?=
 =?utf-8?B?TGNYUUFyVUJnbGQ2QStwNmVKTnJBSGd5M01FbTdXZk9sWFFzR1hRLzNzQTJm?=
 =?utf-8?B?d2UreGtKN3NQZjc1VGVka3FuVHIzeTZzc3JoeEFybHc5WXVRVHFRVVQ1WW1F?=
 =?utf-8?B?eWJTYitQZTB1bjZTalFLQ2JDaERwRGhWZm5yTjltMkw5anJyaGJTZ1poamg1?=
 =?utf-8?B?Q3doVFRhUklGRWRWMkNBN1BCVUJ6blYzc2piSEpYamlBbEpGd0pOVC8ybEpY?=
 =?utf-8?B?Z0xwbVBCeTZORGVoaHkrdkZ5dVZzRzhQN0VmZmNicFdnVzBvZW9jZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E6E39B31F93C4498E288410C70F9241@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e6d8de-96b9-4df6-f7dd-08d9aea01fdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 16:41:40.0612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xLlh58zMTfWzyaC6PHQBlWxTK3hDE6nG/6MjgD0Fo+a2nMVGdtVbL8fBn3MFp8a1W5vOsQ2/ggTkvyjmpX9m4QuKQQ7wgp9wWWFL/vtVZmpjuyPdQvbNML4b/RSzK4DH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3876
X-Proofpoint-ORIG-GUID: Y_K2YXv9XAqwYxPsUuZtmaNEyyVRixUJ
X-Proofpoint-GUID: Y_K2YXv9XAqwYxPsUuZtmaNEyyVRixUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_06,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230084

SGksIEp1bGllbiENCg0KT24gMjMuMTEuMjEgMTg6MTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4N
Cj4NCj4gT24gMjMvMTEvMjAyMSAwNjo1OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
DQo+PiBIaSwgSnVsaWVuIQ0KPg0KPiBIaSBPbGVrc2FuZHIsDQo+DQo+PiBPbiAyMi4xMS4yMSAx
OTozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDE4LzExLzIwMjEgMTA6NDYsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxOC4xMS4yMSAwOToyNywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGNv
dW50Ow0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4o
ZCkgKQ0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogRm9yIGVhY2ggUENJIGhvc3QgYnJpZGdl
J3MgY29uZmlndXJhdGlvbiBzcGFjZS4gKi8NCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvdW50
ID0gcGNpX2hvc3RfZ2V0X251bV9icmlkZ2VzKCk7DQo+Pj4+Pj4gVGhpcyBmaXJzdCBwYXJ0IG1h
a2VzIHNlbnNlIHRvIG1lLiBCdXQuLi4NCj4+Pj4+Pg0KPj4+Pj4+PiArwqDCoMKgIGVsc2UNCj4+
Pj4+PiAuLi4gSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0aGUgZWxzZSBpcyByZWxhdGVkIHRvIHRo
aXMgY29tbWl0LiBDYW4geW91IGNsYXJpZnkgaXQ/DQo+Pj4+Pj4NCj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIC8qDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVGhlcmUncyBhIHNpbmdsZSBN
U0ktWCBNTUlPIGhhbmRsZXIgdGhhdCBkZWFscyB3aXRoIGJvdGggUEJBDQo+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogYW5kIE1TSS1YIHRhYmxlcyBwZXIgZWFjaCBQQ0kgZGV2aWNlIGJlaW5n
IHBhc3NlZCB0aHJvdWdoLg0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIE1heGltdW0gbnVt
YmVyIG9mIHN1cHBvcnRlZCBkZXZpY2VzIGlzIDMyIGFzIHZpcnR1YWwgYnVzDQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogdG9wb2xvZ3kgZW11bGF0ZXMgdGhlIGRldmljZXMgYXMgZW1iZWRk
ZWQgZW5kcG9pbnRzLg0KPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqICsxIGZvciBhIHNpbmds
ZSBlbXVsYXRlZCBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24gc3BhY2UuDQo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgICovDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjb3VudCA9IDE7DQo+
Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBjb3VudCArPSAzMjsNCj4+Pj4+PiBTdXJlbHksIHRoaXMgaXMgYSBkZWNpc2lvbiB0aGF0IGlz
IGJhc2VkIG9uIG90aGVyIGZhY3RvciBpbiB0aGUgdlBDSSBjb2RlLiBTbyBjYW4gdXNlIGEgZGVm
aW5lIGFuZCBhdm9pZCBoYXJkY29kaW5nIHRoZSBudW1iZXI/DQo+Pj4+PiBXZWxsLCBpbiB0aGUg
bGF0ZXIgc2VyaWVzIFsxXSB0aGlzIGlzIGRlZmluZWQgdmlhIFBDSV9TTE9UKH4wKSArIDEgYW5k
IHRoZXJlIGlzIG5vIGRlZGljYXRlZA0KPj4+Pj4gY29uc3RhbnQgZm9yIHRoYXQuIEkgY2FuIHVz
ZSB0aGUgc2FtZSBoZXJlLCBlLmcuIHMvMzIvUENJX1NMT1QofjApICsgMQ0KPj4+DQo+Pj4gSSB3
b3VsZCBwcmVmZXIgaWYgd2UgaW50cm9kdWNlIGEgbmV3IGNvbnN0YW50IGZvciB0aGF0LiBUaGlz
IG1ha2VzIGVhc2llciB0byB1cGRhdGUgdGhlIGNvZGUgaWYgd2UgZGVjaWRlIHRvIGluY3JlYXNl
IHRoZSBudW1iZXIgb2YgdmlydHVhbCBkZXZpY2VzLg0KPj4+DQo+Pj4gSG93ZXZlciwgSSBhbSBz
dGlsbCBub3Qgc3VyZSBob3cgdGhlICdlbHNlJyBwYXJ0IGlzIHJlbGF0ZWQgdG8gdGhpcyBjb21t
aXQuIENhbiB5b3UgcGxlYXNlIGNsYXJpZnkgaXQ/DQo+PiBXZWxsLCB5ZXMsIHRoaXMgaXMgdG9v
IGVhcmx5IGZvciB0aGlzIHBhdGNoIHRvIGludHJvZHVjZSBzb21lIGZ1dHVyZSBrbm93bGVkZ2Us
IHNvIEknbGwgaW5zdGVhZCBoYXZlOg0KPj4NCj4+IHVuc2lnbmVkIGludCBkb21haW5fdnBjaV9n
ZXRfbnVtX21taW9faGFuZGxlcnMoc3RydWN0IGRvbWFpbiAqZCkNCj4+IHsNCj4+IMKgIMKgwqDC
oCBpZiAoICFoYXNfdnBjaShkKSApDQo+PiDCoCDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+
DQo+PiDCoCDCoMKgwqAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4gwqAgwqDCoMKg
IHsNCj4+IMKgIMKgwqDCoMKgwqDCoMKgIGludCByZXQgPSBwY2lfaG9zdF9pdGVyYXRlX2JyaWRn
ZXNfYW5kX2NvdW50KGQsIHZwY2lfZ2V0X251bV9oYW5kbGVyc19jYik7DQo+Pg0KPj4gwqAgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldCA8IDAgPyAwIDogcmV0Ow0KPj4gwqAgwqDCoMKgIH0NCj4+
DQo+PiDCoCDCoMKgwqAgLyoNCj4+IMKgIMKgwqDCoMKgICogVGhpcyBpcyBhIGd1ZXN0IGRvbWFp
bjoNCj4+IMKgIMKgwqDCoMKgICoNCj4+IMKgIMKgwqDCoMKgICogMSBmb3IgYSBzaW5nbGUgZW11
bGF0ZWQgaG9zdCBicmlkZ2UncyBjb25maWd1cmF0aW9uIHNwYWNlLg0KPj4gwqAgwqDCoMKgwqAg
Ki8NCj4+IMKgIMKgwqDCoCByZXR1cm4gMTsNCj4NCj4gSSBhbSBhZnJhaWQgdGhhdCBteSBxdWVz
dGlvbiBzdGFuZHMgZXZlbiB3aXRoIHRoaXMgYXBwcm9hY2guIFRoaXMgcGF0Y2ggaXMgb25seSBt
ZWFudCB0byBoYW5kbGUgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlcmVmb3JlIHRoZSBjaGFuZ2Ug
c2VlbXMgdG8gYmUgb3V0IG9mIGNvbnRleHQuDQo+DQo+IEkgd291bGQgcHJlZmVyIGlmIHRoaXMg
Y2hhbmdlIGlzIGRvbmUgc2VwYXJhdGVseS4NCldoaWxlIEkgZG8gYWdyZWUgdGhhdCBNU0kgcGFy
dCBhbmQgdmlydHVhbCBidXMgdG9wb2xvZ3kgYXJlIG5vdCBiZWxvbmdpbmcgdG8gdGhpcw0KcGF0
Y2ggSSBjYW4ndCBhZ3JlZSB3aXRoIHRoZSByZXN0OiB3ZSBhbHJlYWR5IGhhdmUgTU1JTyBoYW5k
bGVycyBmb3IgZ3Vlc3QgZG9tYWlucw0KYW5kIHdlIGludHJvZHVjZSBkb21haW5fdnBjaV9nZXRf
bnVtX21taW9faGFuZGxlcnMgd2hpY2ggbXVzdCBhbHNvIGFjY291bnQNCm9uIGd1ZXN0cyBhbmQg
c3RheSBjb25zaXN0ZW50Lg0KU28sIGRlc3BpdGUgdGhlIHBhdGNoIGhhcyAiaGFyZHdhcmUgZG9t
YWluIiBpbiBpdHMgbmFtZSBpdCBkb2Vzbid0IG1lYW4gd2Ugc2hvdWxkDQpicmVhayBndWVzdHMg
aGVyZS4NClRodXMgSSBkbyB0aGluayB0aGUgYWJvdmUgaXMgc3RpbGwgY29ycmVjdCB3cnQgdGhp
cyBwYXRjaC4NCj4NCj4gQ2hlZXJzLA0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

