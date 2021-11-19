Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DC456EB5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 13:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227815.394120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2ij-0002k4-R0; Fri, 19 Nov 2021 12:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227815.394120; Fri, 19 Nov 2021 12:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo2ij-0002hn-Nt; Fri, 19 Nov 2021 12:10:21 +0000
Received: by outflank-mailman (input) for mailman id 227815;
 Fri, 19 Nov 2021 12:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W8RP=QG=epam.com=prvs=19578d545c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mo2ii-0002hh-8x
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 12:10:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a876553b-4931-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 13:10:18 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJBY9on005709;
 Fri, 19 Nov 2021 12:10:15 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ceb5k84fd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 12:10:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3873.eurprd03.prod.outlook.com (2603:10a6:208:6f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 19 Nov
 2021 12:10:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 12:10:10 +0000
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
X-Inumbo-ID: a876553b-4931-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McNE8Yons9Ytetjq2LKJR6xbScTV+HIoe7ZnaeS+8vQqiV/ueRgIcL3CaYNrKbcXUJeKlPJDU+KIlt14Hv00O/pVxcrnFGj0DGkLvkx9yu02qeJBaCZJnDqJoCPhYqIWDbFB/QllyLTeC20vBSNzvmmop/tX8/CHOAP/lRHjfkQrYPa4eowFJe2O5yMrxVob/8AgfwArwkwztOAzmuQ6DDT7t/ut3ir/2bRePe3vPu4dcC3p9JUTadXgieBJA2TJg+t5gOlLuLcwKB5KRz+NbbvqX40wdlimyWAAYXJhyBNCxZEyOfPH/UgohpPknHc587MYnSS8ozv+ZzwuL97/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hRIIumfeYPKm92XBvOHtdIxTumG5d9pWi8llI0al7M=;
 b=bYU9bTQKQXHftqvhY4Vb7GviWIZfciCRUbTvcCbVb/bgku83Dzri2iu1jwnL7A9EST9UN1CMLVAruwAQGDGEcYmXXZR8ZsCi1RpMkuw6GZKyw5+5b482wpp1irYiFO4t1sDoyzedBA78v/sQUIOXrTndds5rt9maXH9ROZJdu5h1MGIfYxWd9TaTHcuiqiOANkT26pzB709FihochEH5W6J84HW1tVWqKH2lxpcamJvMA3PhaVsppWWKq6sJGcVzjenFUNxI6mYoeE3aPXXlITHmMq2EnRZMLPU+y72/dQNFmWl5X/xjPTnoMIL/8JLLbAQkvk4bBy3Ey2t3rehGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hRIIumfeYPKm92XBvOHtdIxTumG5d9pWi8llI0al7M=;
 b=b/i6Rkbq8PPxL5+bNgDOc11lGkZycH5UqJnOhP2/B8HyjJ9EocpynKIt5/UpU566qTZouW5lKpEyR9kvYRtQ59rQdS7Lx9CkGhOO2G07UL2qGA7eNvlE4Gw08UGNI5APb1HYrWLmVpS7+/yijxs8sEqb6DA4kiKpq9M++Q0CMaq1QrpdcAgu+fba4oKfzk3s77Cz1qxbiSSI9JB0T5niafZu8QFq4IFyJHt0uGSSryZs3htUG0LIMDdGyaejhUdI2tiPDCugjEn+MJOXiH/QbUEIvh8j/uY06Iu2TyhK7BY2oXdZYNmuYxXnZJyPAz6X6oXtIcxgIXxtF4SVLRirNA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v4 05/11] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX0hJK3jTao+VT7Ua3mM5UrGfltKwK1UUAgAADYYA=
Date: Fri, 19 Nov 2021 12:10:10 +0000
Message-ID: <713a0443-b2a4-3c29-7072-ba18970fe6f9@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-6-andr2000@gmail.com>
 <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
In-Reply-To: <6aa1a947-cfc8-ec05-e5a5-151d36fc432c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad45b117-2fa4-454c-5e86-08d9ab5588c0
x-ms-traffictypediagnostic: AM0PR03MB3873:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB38734F50858B8444E9EE444BE79C9@AM0PR03MB3873.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EZjkW0liyrJuRJ2ExU2BkLh3FAc1oZlZ0zSpq7a8pV5RAsRfYe+mUKihdrHC6BXpDa7MF6d57aDvr4tLnw86sYAxDj9E84rMv4s4b16inom1hh+43XTliLfCp3PdSLop3itAXfOlO0t3hqZA3s47ebt+mBpeDT8OgM2lp9hggMBjH3GN0hAsk3LKFXPbXunD3de/K8QOW2f8yzzjqPZ+RcRSFs/wxQsyE27GpGvkfIHP610sx7XRZUd3wDFyZ0uqP3jJ/F78r1tB6y1RZguP/IxKVuAtsuOdpH/OlACmskCPvRfWDpvj0MAg2X4eZAHhD5xIW7l0FzQmMd+3ITPGWDMs/4Og78AnE6n2IkDVqTyVoEeg4uoMPxtphzE0hSu7B/khNaKBkaTflVl3xhcAlRMowjd7nTvevd0RBD14+ef9uo1+b5jm8/BDDvt4/eUamDOMPF15gmnPAZreIDSq+8c5ZWKEB7N6fOZ14uD1JqUHJy6LakxRzJDwGdHqtxAPyqw8PzewMOyu7QHQGPlXfI5nhjrGRdKf7qjpCo3ugX3TDgN1dBQiJ5Wtq6ElVUbJltVVcgZ9lXRnFo4NYteog6PFT2n54P558BWeU+ReOKoTKoIC+p0cylHDybfO/4cVsBrGc85DGvrbooXmB6tKGgxpOu3BuPeOXOSlgNIQidS6uYA5PHqZoETHc8fVqFHYknqvGT1hs7iaZUqHHUBN0ZbncZKBWIb0GK1RM4IgrA8pVLObrpQpaKPA+PIc38nE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6486002)(26005)(6506007)(31696002)(66946007)(64756008)(66446008)(8676002)(8936002)(2616005)(91956017)(5660300002)(6916009)(508600001)(36756003)(54906003)(7416002)(66476007)(4326008)(53546011)(316002)(71200400001)(38070700005)(83380400001)(38100700002)(31686004)(2906002)(86362001)(122000001)(76116006)(66556008)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnhaQXBwdEVaUTFjRUIrUjJWa3Vua3Jzc25FcFhkTytDVE9IUGtqV0Yvc1dO?=
 =?utf-8?B?NWpLcHlKSzZhQU9tZnMvVDcrems1OUdQaWFRc1F6dytOcnlHWksweWdxZlRL?=
 =?utf-8?B?UVpUM3FuNGNrMmViQjNMNmpaRXVzb1pqZ3VXOTEvMjR5Ni9oS21mbVU5ZDZz?=
 =?utf-8?B?b2xxVmZoZWZwYnJhazNwWldTeU83cUVsb2ZIR29zbUtkNExLOXA2R0g1OFc3?=
 =?utf-8?B?UHZNVUF0WDdOY2dZdjhlTmpsRjV1YTRkWjhINStvWG5DN2FkTmZwa0xZNnEx?=
 =?utf-8?B?ZmZzbDFJbkdDWHVIWEpjNjZoK2lTNk9hVEZ5TGxNMGRqcmRXMEpUejZxWmNJ?=
 =?utf-8?B?UGs5ZHVoR092WE00QUVmeDZBT0JIVVdPS2xrMzNxdWhaeTgrUm8yQjdvZnJU?=
 =?utf-8?B?SlhraEJFN21XNHd2TkJFUDJoeFRtVUNEVXgwL1oyM09BekRrYjl3SnF1Vk5i?=
 =?utf-8?B?TDhVbEljV0xRVmExcnVYNG9TelFDRzNNL1dITVUwZ0c1WEtJbktKLzhYM1Z3?=
 =?utf-8?B?ekU2akFzM0RuM1dndUw3blVZSllBYzhJYk1BUFJRYkVSV0JXL2tRNVJjRkty?=
 =?utf-8?B?V1hFWEd5Uisya0Y3UXpYanJLRjNncGdEcERYOUlUdDJtN2Zkanp4bEd4NE9H?=
 =?utf-8?B?U1VDVkJiOTFpNk9yQUhZOFNBVjdBOHh6U1d0bUNBWVFhMjc1WDViNy9lazlk?=
 =?utf-8?B?K25sYnR3RXVQWkpBbFJWWWwyQlJEaXdqTTNQZEh1UTBRYzBJd216N3hyQlRS?=
 =?utf-8?B?RTYyVmJDTXdMc0xEMHNhWHZ6aXFVUlRwOGdEd0ZQSHJVc1p2TUhEQlh6NWd4?=
 =?utf-8?B?WHpaL2d1S1hkU1J0cGRSa2w1UXNFSlJNTXRWZjFHWGUzNjRINDFreFRTLzdj?=
 =?utf-8?B?TTFjOXgyQTUyUndPWGc4SkUxbVVVN3BYUUdsckVvK2NOSWlKVXM2RUtxaFV6?=
 =?utf-8?B?RXl5VUE4a3dCTzZsMllaa1c5b1cxczdjRFprV3Z5cmdKMXp0dXhhQks0amRu?=
 =?utf-8?B?VHBpUUUrMmYrVlFnSDdaR2pLWmlpYW1ZTHRQVUl4RUF4bTBYdm9BdkxHWjhY?=
 =?utf-8?B?OU8yQ3B0V2tkS2F4RG5tTis5L2tBTmRiSUxnSHQzUDMrTmE1NUtmckU4eWp5?=
 =?utf-8?B?MXovdFNseW1UNDJISUNBa3dGT2ZBZ2IySDBsS3dVbWtHSkNuS01aMUphb0Qv?=
 =?utf-8?B?ZFlxUk4vVWpUN2wzR0Ztb2FuSHMrR3lhK21pQjN4ZHp2R2ovd0FFQnJTRzRh?=
 =?utf-8?B?RWZ4MVBScUJMbk90akRyTmJZdTNFYXZ3ZXlYa01wa1RKOThPVkdKODB1SDF4?=
 =?utf-8?B?NlQ3cW8zOHVVR3pyWW91SGRqUFBjTFFXbzZRenN2S0x4WTg4bE9jNHg0QStk?=
 =?utf-8?B?MWswNG5ROGQ2K0JpV2ttaTFWenBLUUpMQzgySTd1VnY5Qm10NkxXTllhenNP?=
 =?utf-8?B?Mzl2bEdJdjFVTk5GOUthOTBxcStUQTA1aE1kaVpGdFgybE80VUtqT0hXampQ?=
 =?utf-8?B?VmZaUEhYL1hBWkVLTFhWM2JTOVdwMk91VjR2VWJvbkh4NGlCK3kvaTBFQ25a?=
 =?utf-8?B?aFVURUlUaG9MektyWU0remRaQ05CR0EybFdUenZORHQxRFlKczJ5dTBmTkNy?=
 =?utf-8?B?S2Z4eXZTekswam5MWGtwSGN2Z3A1aEsvaFdrcjNNVXB4QmppTDJpamRhZWlJ?=
 =?utf-8?B?QVJmWFpsVHBpaTFhbFpoY3BaTE8yclpBdThpajBXcjR6NGs2dDRpMW1tN0wr?=
 =?utf-8?B?SkVobnJhTVVrMzZvY0xGVVIwZ1NTTkVaeGJYWnRFN0Z3alp0Z1k2T1ZzZlhN?=
 =?utf-8?B?ZExkbUxoWnBmancwdjVOWXc1YUppVVFRUGo1eUQwMVBFTGVycDU4Y1Fqa1Ft?=
 =?utf-8?B?eVBLbFhKd011QmZDbnR6QlBtdWpHVFIvbFlGSzMwZ1h3emxkY1BTMjd5ZVA0?=
 =?utf-8?B?OGhUYzRUb1JIaUw0dHRBRU1IWjVkakovc3FpNE12Sy8rRkQ3Ri9qZVExWGFY?=
 =?utf-8?B?Q2JTT3NZUHk5dVpZcURlcmdxdEJCZi81M21PbEt2UTg0VWFLWHdyNlRpS094?=
 =?utf-8?B?Qm94a3JGUDNYR3VuSnQ1Y1lQcjl6a0h5V2tEdEQybVM0VWZ5TnRaYkQrcGp2?=
 =?utf-8?B?SkxpbjhQRnRTNm56b2FqYzdHS1duSDR2bGtTMWJPOGRGUGcrT1poK0JaMWs5?=
 =?utf-8?B?RC9TdldzNTBISTZQeCs4dXgrZng3bVRaV0hVUXRpa2oxTWhVaURLZFZWRDJ0?=
 =?utf-8?B?TlQxTmwyY0FtY2NRR1hzaXhiZmdIZnhxM1JrNHd1cDd3RktDSW94VDh5OVda?=
 =?utf-8?B?dHlLZkt6cXlWUHhXVzAxYytoYUVGYU10T1EyT05TcXpyQWZNNkU0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13989D5C3018D44AB24B2C61E1F4A972@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad45b117-2fa4-454c-5e86-08d9ab5588c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 12:10:10.3299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTBqJ1Mf1B4/vjQyzegrzdS84a1gIV7eYNehwOfUzN1VJGPFicmpclw3/7WbvPRhX/6Z1rOiLb9MuLIP8NAvpZj1odLUZaFEvoPH9DIAkqPo0CfFc4koT16KEhH2GWGM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3873
X-Proofpoint-GUID: Ttfh-DcmMACREaajI8twGDc37tMuBTq4
X-Proofpoint-ORIG-GUID: Ttfh-DcmMACREaajI8twGDc37tMuBTq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 mlxlogscore=965 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190069

DQoNCk9uIDE5LjExLjIxIDEzOjU4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDUuMTEuMjAy
MSAwNzo1NiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gQWRkIHJlbGV2YW50IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcgUENJ
IGRldmljZSB0byBhIGRvbWFpbg0KPj4gYW5kIHJlbW92ZSB0aG9zZSB3aGVuIGRlLWFzc2lnbmlu
Zy4gVGhpcyBhbGxvd3MgaGF2aW5nIGRpZmZlcmVudA0KPj4gaGFuZGxlcnMgZm9yIGRpZmZlcmVu
dCBkb21haW5zLCBlLmcuIGh3ZG9tIGFuZCBvdGhlciBndWVzdHMuDQo+Pg0KPj4gRW11bGF0ZSBn
dWVzdCBCQVIgcmVnaXN0ZXIgdmFsdWVzOiB0aGlzIGFsbG93cyBjcmVhdGluZyBhIGd1ZXN0IHZp
ZXcNCj4+IG9mIHRoZSByZWdpc3RlcnMgYW5kIGVtdWxhdGVzIHNpemUgYW5kIHByb3BlcnRpZXMg
cHJvYmUgYXMgaXQgaXMgZG9uZQ0KPj4gZHVyaW5nIFBDSSBkZXZpY2UgZW51bWVyYXRpb24gYnkg
dGhlIGd1ZXN0Lg0KPj4NCj4+IFJPTSBCQVIgaXMgb25seSBoYW5kbGVkIGZvciB0aGUgaGFyZHdh
cmUgZG9tYWluIGFuZCBmb3IgZ3Vlc3QgZG9tYWlucw0KPj4gdGhlcmUgaXMgYSBzdHViOiBhdCB0
aGUgbW9tZW50IFBDSSBleHBhbnNpb24gUk9NIGlzIHg4NiBvbmx5LCBzbyBpdA0KPj4gbWlnaHQg
bm90IGJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aXRob3V0IGVtdWxhdGluZyB4ODYu
IE90aGVyDQo+PiB1c2UtY2FzZXMgbWF5IGluY2x1ZGUgdXNpbmcgdGhhdCBleHBhbnNpb24gUk9N
IGJlZm9yZSBYZW4gYm9vdHMsIGhlbmNlDQo+PiBubyBlbXVsYXRpb24gaXMgbmVlZGVkIGluIFhl
biBpdHNlbGYuIE9yIHdoZW4gYSBndWVzdCB3YW50cyB0byB1c2UgdGhlDQo+PiBST00gY29kZSB3
aGljaCBzZWVtcyB0byBiZSByYXJlLg0KPiBBdCBsZWFzdCBpbiB0aGUgaW5pdGlhbCBkYXlzIG9m
IEVGSSB0aGVyZSB3YXMgdGhlIGNvbmNlcHQgb2YgRUZJIGJ5dGUNCj4gY29kZSwgZm9yIFJPTSBj
b2RlIHRvIGJlIGNvbXBpbGVkIHRvIHN1Y2ggdGhhdCBpdCB3b3VsZCBiZSBhcmNoLQ0KPiBpbmRl
cGVuZGVudC4gV2hpbGUgSSBkb24ndCBtZWFuIHRoaXMgdG8gYmUgYW4gYXJndW1lbnQgYWdhaW5z
dCBsZWF2aW5nDQo+IG91dCBST00gQkFSIGhhbmRsaW5nIGZvciBub3csIHRoaXMgbWF5IHdhbnQg
bWVudGlvbmluZyBoZXJlIHRvIGF2b2lkDQo+IGdpdmluZyB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0
J3Mgb25seSB4ODYgd2hpY2ggbWlnaHQgYmUgYWZmZWN0ZWQgYnkNCj4gdGhpcyBkZWxpYmVyYXRl
IG9taXNzaW9uLg0KSSBjYW4gcHV0Og0KYXQgdGhlIG1vbWVudCBQQ0kgZXhwYW5zaW9uIFJPTSBo
YW5kbGluZyBpcyBzdXBwb3J0ZWQgZm9yIHg4NiBvbmx5DQphbmQgaXQgbWlnaHQgbm90IGJlIHVz
ZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aXRob3V0IGVtdWxhdGluZyB4ODYuDQo+DQo+PiAt
LS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jDQo+PiBAQCAtNDA4LDYgKzQwOCw0OCBAQCBzdGF0aWMgdm9pZCBiYXJfd3JpdGUo
Y29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAgICAgICBw
Y2lfY29uZl93cml0ZTMyKHBkZXYtPnNiZGYsIHJlZywgdmFsKTsNCj4+ICAgfQ0KPj4gICANCj4+
ICtzdGF0aWMgdm9pZCBndWVzdF9iYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYs
IHVuc2lnbmVkIGludCByZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQz
Ml90IHZhbCwgdm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFy
ID0gZGF0YTsNCj4+ICsgICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBpZiAoIGJh
ci0+dHlwZSA9PSBWUENJX0JBUl9NRU02NF9ISSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFT
U0VSVChyZWcgPiBQQ0lfQkFTRV9BRERSRVNTXzApOw0KPj4gKyAgICAgICAgYmFyLS07DQo+PiAr
ICAgICAgICBoaSA9IHRydWU7DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICB7DQo+
PiArICAgICAgICB2YWwgJj0gUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzsNCj4+ICsgICAgICAg
IHZhbCB8PSBiYXItPnR5cGUgPT0gVlBDSV9CQVJfTUVNMzIgPyBQQ0lfQkFTRV9BRERSRVNTX01F
TV9UWVBFXzMyDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDogUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV82NDsNCj4+ICsgICAgICAgIHZhbCB8PSBiYXIt
PnByZWZldGNoYWJsZSA/IFBDSV9CQVNFX0FERFJFU1NfTUVNX1BSRUZFVENIIDogMDsNCj4+ICsg
ICAgfQ0KPj4gKw0KPj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZmZmZmZmZmdWxsIDw8
IChoaSA/IDMyIDogMCkpOw0KPj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgfD0gKHVpbnQ2NF90KXZh
bCA8PCAoaGkgPyAzMiA6IDApOw0KPj4gKw0KPj4gKyAgICBiYXItPmd1ZXN0X2FkZHIgJj0gfihi
YXItPnNpemUgLSAxKSB8IH5QQ0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KPj4gK30NCj4+ICsN
Cj4+ICtzdGF0aWMgdWludDMyX3QgZ3Vlc3RfYmFyX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYg
KnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmRhdGEpDQo+PiArew0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJh
ciA9IGRhdGE7DQo+PiArICAgIGJvb2wgaGkgPSBmYWxzZTsNCj4+ICsNCj4+ICsgICAgaWYgKCBi
YXItPnR5cGUgPT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBB
U1NFUlQocmVnID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+ICsgICAgICAgIGJhci0tOw0KPj4g
KyAgICAgICAgaGkgPSB0cnVlOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiBiYXIt
Pmd1ZXN0X2FkZHIgPj4gKGhpID8gMzIgOiAwKTsNCj4gSSdtIGFmcmFpZCAiZ3Vlc3RfYWRkciIg
dGhlbiBpc24ndCB0aGUgYmVzdCBuYW1lOyBtYXliZSAiZ3Vlc3RfdmFsIj8NCj4gVGhpcyB3b3Vs
ZCBtYWtlIG1vcmUgb2J2aW91cyB0aGF0IHRoZXJlIGlzIGEgbWVhbmluZ2Z1bCBkaWZmZXJlbmNl
DQo+IGZyb20gImFkZHIiIGJlc2lkZXMgdGhlIGd1ZXN0IHZzIGhvc3QgYXNwZWN0Lg0KSSBhbSBu
b3Qgc3VyZSBJIGNhbiBhZ3JlZSBoZXJlOg0KYmFyLT5hZGRyIGFuZCBiYXItPmd1ZXN0X2FkZHIg
bWFrZSBpdCBjbGVhciB3aGF0IGFyZSB0aGVzZSB3aGlsZQ0KYmFyLT5hZGRyIGFuZCBiYXItPmd1
ZXN0X3ZhbCB3b3VsZCBtYWtlIHNvbWVvbmUgZ28gbG9vayBmb3INCmFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24gYWJvdXQgd2hhdCB0aGF0IHZhbCBpcyBmb3IuDQo+DQo+IEphbg0KPg0KVGhhbmsgeW91
LA0KT2xla3NhbmRy

