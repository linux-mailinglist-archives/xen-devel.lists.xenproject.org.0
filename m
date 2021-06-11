Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108703A3C57
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 08:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140212.259117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrb2t-0007Rp-VJ; Fri, 11 Jun 2021 06:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140212.259117; Fri, 11 Jun 2021 06:53:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrb2t-0007Py-SB; Fri, 11 Jun 2021 06:53:35 +0000
Received: by outflank-mailman (input) for mailman id 140212;
 Fri, 11 Jun 2021 06:53:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sBsJ=LF=epam.com=prvs=6796b971c3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lrb2r-0007Ps-Kb
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 06:53:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087b4d57-2ac5-4eba-8f58-e4fa0894278f;
 Fri, 11 Jun 2021 06:53:32 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15B6pg8Q020717; Fri, 11 Jun 2021 06:53:31 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3942dm03ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 06:53:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 06:53:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 06:53:26 +0000
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
X-Inumbo-ID: 087b4d57-2ac5-4eba-8f58-e4fa0894278f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeipfMNk9Io0KE34PwOxvslfYi0KJ4pNxUWXh+vpODlR0CsTEoNEVgtEgbmGufjhXvyGmG1Nk7eldUhGvWUTQ1ZFfDVyXWRW8XorFvICyln7GhhgOShl32mXdqZ3YT6mBjfITifbw38JJ9EESQlRLRR3LaxdptVsisp6roojS8VslkknFSdZmx+u7ztQ7n2BgpAUszU1f2uk89nGdG8J327kjWrlPVHzfGBTaNdduuLepF4R0O9db/QrQW4Z1SD/0rGbyyiyuo/iLTrvakdArxuq5fadTrna84MkQIB3iWSzeLeIi++tOYlI8vcs3YoaGYZgwJyU0Mk+ePxPYHLVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTOpmOIDaR981wQQoovjRFppx1CKxP5ikGvnwSG0umU=;
 b=iEitRxcS8ONyrO+81aBfJYS9PGc4RFlG7p4qnD30mAgUs5Je9sIgBRFqTN7Xqek5R8rzIJ1a08aSJKDwtr4AaC4DlGZ2jhoRH1OXy/gWMrqDvY4Ta7yLk4XmFyj78MZIKnH6UCi0CjaPq5/Evb4Ho9xuxKWUV1CeTeaDvHxLxwGmnQfWI78s4jympXIZXR2PZlDX2hNjm7UnQL1L2OJ2r/OryKAgRK+u+3xXeJNX2P85+B/XruIOCA+v/LbeFyfgUaqJR4GGca4wNh7VkYw6bIDunz1rsSnr387u9BcWhd00HPKZdK0H9IvunFFFLqGxxSvU7m/xOxs1C6tnRjVjug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTOpmOIDaR981wQQoovjRFppx1CKxP5ikGvnwSG0umU=;
 b=Fiy4kEtVyMJTQzsRXZwi2zUFYUotq4Z3+GNq1EZ0eogP4BsvfKgCYWU0TYa86slExdhuEkCL9RcAnZD6XZK6W3/Zj9s1S7wu0e6FcZQ8otk1o1jV6nlWTEOGJr5Hg2+yPSfe4XQlqITiK5giINxKZ2DP02s3oSoFdsz8cTO2a/gN65W6wWfkcTkgf7kHDDEVsgyc116QMj6rXTmQNf1SvbU6F+hzhHDFbjaf0tQaNvxFLQD15grqLqXbmvis8Qv/Wvg4omxB3w7loflJgyJIHht7vj4lmQLplgf2LWt6KYPzgRwqsfDg2TNmYfI7v2olYdH3dp9dfN0k5A1i9E9PTw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <julien@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: 
 AQHXWQwW/O3obtZgqkmpGRvt7ZNDkasM6aMAgAAjXoCAAEW+AIAAFw0AgAD+3oCAAAIxgA==
Date: Fri, 11 Jun 2021 06:53:25 +0000
Message-ID: <bd8522b5-c126-3d54-b85b-eba46afc30c1@epam.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <YMIdbGCpFGZGwLoN@Air-de-Roger>
 <e0f73a05-b027-d0b6-8f8d-a1078dedccf7@epam.com>
 <632d72e8-e794-2637-d5fe-acc52b530875@suse.com>
In-Reply-To: <632d72e8-e794-2637-d5fe-acc52b530875@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b508bdc-8e3b-481c-1d9f-08d92ca59cbb
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6068B25241173C9F062A97B0E7349@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2qEoxPjreEWWro8Rg2JctDPzy7xBeygeK7aHxlwddGX5GICoqv6MqhDjvSGZrvFK6PHwKPUlkZnLEQOemyHSNMlkyaSTezKJ0Mugz/rq+wc5f6wAP8BAQ1dAOEf/N3yx9+5E1d/Bd+JASrwltE+daSeNXsrfKNXWqeCN5FIIO03I63rRiBBjbZZ5t74Td8LTAe2gmHKe1LQ3X8jFHpNulxxTc8PmU53N0VZ5Q1clnPPaAUETJ3nx/tf8/00IWH23XN5FcF8s4rYkZp1uWjkjxxsovOQIAMWsvPQPsSu6ZhNohzyVCq4xh7qWka2KBcAE58ZI2V3Zg4OwsO/x8a4HI8VZmXqIqI/D7zO7Y88toUsGET3TME+ICnXOf7vXG+JT/suVQ4VhuarYk1myfHkxFDrEVJIuv+JMimOnBXTzPijLcR7Q0l3LFOeY0wW9FChe+huCW5qOJP21fsKceXFevOWl/sHBuDVD4XMrRiEur6B/JSSryrOiQcHraZ6Ssd8oghnRGh1OEhnV9GQMbjig1Agea42gDXUeVNKzACRn0iWb6u68dDCGM1Wao388kBLPxw3G91CscCyAxLoHfltgDLPckqkBIORqwxM3cyvesBTkkNp5BCgllk+sf/FDkL7+9c7cV0sMjaBYzEUwVV0qdzWbhzl+FBInj5t5Xh+8jtDzGoRzCMBYwdix6BGOHXL1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(76116006)(66446008)(66946007)(66476007)(8676002)(2906002)(6506007)(91956017)(6916009)(5660300002)(54906003)(66556008)(64756008)(53546011)(8936002)(4326008)(6486002)(316002)(2616005)(83380400001)(31686004)(26005)(478600001)(186003)(31696002)(36756003)(122000001)(71200400001)(6512007)(86362001)(38100700002)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFh5UDd0bWdzMUg2dUZtZjZ2a09pVVQ3alVrem0ybzNOdzZubkF4MEFMZFRW?=
 =?utf-8?B?N0lHQmxXRVlxcE9DYXBPVTRsclE1cG9pZ0cvUitRM214ZE54VGxScmRKY3or?=
 =?utf-8?B?aUxQaThncFhsSHo5SDdtQ0Fna25MKzlROWMwS1h1MjFkdWNkOFJCTUhoU0lz?=
 =?utf-8?B?UHB2ZXM5RW1Mb290MzUxQlhrN254MTB5anJhU2M1VTB5OHJWNVBxcjBIazJV?=
 =?utf-8?B?WHF4Y05XUnpLR3AxVXR4dGR0U0NPTkJNbURIampLUm5wN3RydXpubWYzS0VS?=
 =?utf-8?B?SG1kY3RJYURvbWlVQStDL2NMR2h6WmRmRjhjenhsTEVlekNBWnlFWGhYTTNW?=
 =?utf-8?B?ZGJWODRoVFQzb0ZqbEdmYzl1ZXdhSlljb29VMjIyZkdkYmVuSkhuL2pVY1BC?=
 =?utf-8?B?UjhYZE5ONUgwOGtPTU9EWEJZTnZXTktLcnJEZGVXK21VYjhZejVTZlFQSzl5?=
 =?utf-8?B?ZTI4OVZteVJ6d3cvU0t6N0xxeGNPeTJUZzVveG9zYkVMVmZkekl0TklCVEE4?=
 =?utf-8?B?RWJMaEtidEp3MGVjRzhDbk4zR3VueHZRUG04aTNsd1N6OTg4eS9yaks5eEo5?=
 =?utf-8?B?N0w5Yk1HOGxJY3JBYUx0Y1ZjNGFFNkVXK25ONjMvb0dUcWt3Z2xsWTZzdGVa?=
 =?utf-8?B?Rk1KVy96ZUVRclB2UWZPMmtTbTF1amo3dmxTWGdaRC8zNnJBSDNGYlZzb2F4?=
 =?utf-8?B?Q285YjlURU5ZYk5WRUNLdisrWk54UTZHTndjQWdiOHBDV05Nd0lIS0pxUmQ1?=
 =?utf-8?B?VFFQY0QvRXcvd2trMDFSbG1DTlowamozdzR2c3VjOS9tSUxwMkIyL3hzOW8z?=
 =?utf-8?B?Kys4K1E1VUdyOUoxeEJBWmZyajZmR0Y3MHhoZmM5ZkM1bVFNZHdMa3ZObzNS?=
 =?utf-8?B?UUc5RUFuazBtQm1lVmFlZ24xdWRNOGhCUWtIcVFmRllzRWozejhYTCt6RFZG?=
 =?utf-8?B?MFVGNHNyVU1WVkhHN29PMzN6ZnhzdUY4ZWQrb2tiejdwWndVTWd2dUdaYzNk?=
 =?utf-8?B?NFlaclQrTTdrS2o2QzJkNUhBTnJkMEJaUnJtVEUrUHp5NE0xV0FkK241a0U4?=
 =?utf-8?B?akQ0MzM1WFJXZU1DSCtrYi84bmJBOUJ1bzNvb2FTV1p0eXFkQzVZaW05Y0R3?=
 =?utf-8?B?SVRxMEsxenpLNlhJZmlKZVNDeEplRUdYRzYxU2xLcExYMTlvOVZEMGhLM3Qz?=
 =?utf-8?B?OXBIL2JVRXY3SjQrejRVZGhVSUJrNDZzSTRia0gwNENtcnlvcUYzQ1VMaGVL?=
 =?utf-8?B?QUtRNlA5QXkwbVhFalRpMTBsbUliRGdOb1h0cVVuV3B3WG5YcjlJQW5vRFBi?=
 =?utf-8?B?RmE5M3RHSm5USWVRNDR5SU05RGI4Z21xS0J6SWJSRDJMSzlLWXF4NWU1UFN0?=
 =?utf-8?B?S1hYU3oreFBFY0FweGNIMzdTbnUyZWtIdDNtOWYxSXc5Tm45aWRuYlFxOXB4?=
 =?utf-8?B?Z2FFb1gxTU1pb1VQMnNhc0JKTUpoOTdDNXpzS1BidzI1R3hvRXMrY3QrUU1x?=
 =?utf-8?B?WnhSaXlaYkt1S3lpL2t2eFp6cTRkTWt2VC9Id01WQXZDTDJ4aXhGZ2dMQWVB?=
 =?utf-8?B?dWNCYWwyS3orbmtCUVpHNm9KV250WUk5WG5kUmU4TnRXUTlrU2VKekxpajVm?=
 =?utf-8?B?SzdpTjc0ZnVyRnRCQ0krbzZ4VU5JN1lBaWxrNkNnbXFMWUpObDhqbXhJcmov?=
 =?utf-8?B?TUVENDM0NDhZL3dUQ2wzRWg4UFl0SlloYi9GaHkzWjhoQ0Y3TXY0dzZ0bDVo?=
 =?utf-8?Q?Lim3JBgitW7cS/NnT6B+5wJcGQxTO10Ow6n1QPY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B19702064797BE4693FD24DFCD35AEF4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b508bdc-8e3b-481c-1d9f-08d92ca59cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 06:53:25.9295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRAxKfFL1HHz06uVgvhYbtvwQ4QIieFUAHrK34iNM9tsAG9yc8qUUuCgYirGTt7uhf0lIb3WGpyAttWFybbnAZPud2G1irzpryCi416lTxQJNIR7PbuM5i2ltt2CduOw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-ORIG-GUID: V6mfsDIo8iop4S9C5WAv2BEczOKoWLQK
X-Proofpoint-GUID: V6mfsDIo8iop4S9C5WAv2BEczOKoWLQK
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=625 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110044

DQpPbiAxMS4wNi4yMSAwOTo0NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjA2LjIwMjEg
MTc6MzMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTAuMDYuMjEgMTc6
MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBKdW4gMTAsIDIwMjEgYXQg
MTA6MDE6MTZBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9u
IDEwLjA2LjIxIDEwOjU0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gRnJpLCBK
dW4gMDQsIDIwMjEgYXQgMDY6Mzc6MjdBTSArMDAwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+Pj4+Pj4gSGksIGFsbCENCj4+Pj4+Pg0KPj4+Pj4+IFdoaWxlIHdvcmtpbmcgb24g
UENJIFNSLUlPViBzdXBwb3J0IGZvciBBUk0gSSBzdGFydGVkIHBvcnRpbmcgWzFdIG9uIHRvcA0K
Pj4+Pj4+IG9mIGN1cnJlbnQgUENJIG9uIEFSTSBzdXBwb3J0IFsyXS4gVGhlIHF1ZXN0aW9uIEkg
aGF2ZSBmb3IgdGhpcyBzZXJpZXMNCj4+Pj4+PiBpcyBpZiB3ZSByZWFsbHkgbmVlZCBlbXVsYXRp
bmcgU1ItSU9WIGNvZGUgaW4gWGVuPw0KPj4+Pj4+DQo+Pj4+Pj4gSSBoYXZlIGltcGxlbWVudGVk
IGEgUG9DIGZvciBTUi1JT1Ygb24gQVJNIFszXSAocGxlYXNlIHNlZSB0aGUgdG9wIDINCj4+Pj4+
PiBwYXRjaGVzKQ0KPj4+Pj4+IGFuZCBpdCAid29ya3MgZm9yIG1lIjogTVNJIHN1cHBvcnQgaXMg
c3RpbGwgV0lQLCBidXQgSSB3YXMgYWJsZSB0byBzZWUgdGhhdA0KPj4+Pj4+IFZGcyBhcmUgcHJv
cGVybHkgc2VlbiBpbiB0aGUgZ3Vlc3QgYW5kIEJBUnMgYXJlIHByb3Blcmx5IHByb2dyYW1tZWQg
aW4gcDJtLg0KPj4+Pj4+DQo+Pj4+Pj4gV2hhdCBJIGNhbid0IGZ1bGx5IHVuZGVyc3RhbmQgaXMg
aWYgd2UgY2FuIGxpdmUgd2l0aCB0aGlzIGFwcHJvYWNoIG9yIHRoZXJlDQo+Pj4+Pj4gYXJlIHVz
ZS1jYXNlcyBJIGNhbid0IHNlZS4NCj4+Pj4+Pg0KPj4+Pj4+IFByZXZpb3VzbHkgSSd2ZSBiZWVu
IHRvbGQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IG5vdCB3b3JrIG9uIEZyZWVCU0QNCj4+Pj4+
PiBydW5uaW5nDQo+Pj4+Pj4gYXMgRG9tYWluLTAsIGJ1dCBpcyBzZWVtcyB0aGF0ICJQQ0kgUGFz
c3Rocm91Z2ggaXMgbm90IHN1cHBvcnRlZA0KPj4+Pj4+IChYZW4vRnJlZUJTRCkiDQo+Pj4+Pj4g
YW55d2F5cyBbNF0uDQo+Pj4+PiBQQ0kgcGFzc3Rob3JnaCBpcyBub3Qgc3VwcG9ydGVkIG9uIEZy
ZWVCU0QgZG9tMCBiZWNhdXNlIFBDSQ0KPj4+Pj4gcGFzc3Rocm91Z2ggaXMgbm90IHN1cHBvcnRl
ZCBieSBYZW4gaXRzZWxmIHdoZW4gdXNpbmcgYSBQVkggZG9tMCwgYW5kDQo+Pj4+PiB0aGF0J3Mg
dGhlIG9ubHkgbW9kZSBGcmVlQlNEIGRvbTAgY2FuIHVzZS4NCj4+Pj4gU28sIGl0IGlzIHN0aWxs
IG5vdCBjbGVhciB0byBtZTogaG93IGFuZCBpZiBQQ0kgcGFzc3Rocm91Z2ggaXMgc3VwcG9ydGVk
DQo+Pj4+DQo+Pj4+IG9uIEZyZWVCU0QsIHdoYXQgYXJlIHRoZSBzY2VuYXJpb3MgYW5kIHJlcXVp
cmVtZW50cyBmb3IgdGhhdD8NCj4+Pj4NCj4+Pj4+IFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCBj
YW4gYmUgYWRkZWQgdG8gRnJlZUJTRCwgc28gaXQgY291bGQgYmUgbWFkZQ0KPj4+Pj4gdG8gd29y
ay4gSSBob3dldmVyIHRoaW5rIHRoaXMgaXMgbm90IHRoZSBwcm9wZXIgd2F5IHRvIGltcGxlbWVu
dA0KPj4+Pj4gU1ItSU9WIHN1cHBvcnQuDQo+Pj4+IEkgd2FzIG5vdCBhYmxlIHRvIGZpbmQgYW55
IHN1cHBvcnQgZm9yIFBIWVNERVZPUF9YWFggaW4gRnJlZUJTRCBjb2RlLA0KPj4+Pg0KPj4+PiBj
b3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lIHRvIHdoZXJlIGFyZSB0aGVzZSB1c2VkPw0KPj4+IFRo
b3NlIGFyZSBub3QgdXNlZCBvbiBGcmVlQlNELCBiZWNhdXNlIHg4NiBQVkh2MiBkb20wIGRvZXNu
J3QNCj4+PiBpbXBsZW1lbnQgdGhlbSBhbnltb3JlLiBUaGV5IGFyZSBpbXBsZW1lbnRlZCBvbiBM
aW51eCBmb3IgeDg2IFBWIGRvbTAsDQo+Pj4gQUZBSUsgQXJtIGRvZXNuJ3QgdXNlIHRoZW0gZWl0
aGVyLg0KPj4gV2VsbCwgQVJNIGRpZG4ndCB1bnRpbCB3ZSBzdGFydGVkIGltcGxlbWVudGluZyBQ
Q0kgcGFzc3Rocm91Z2ggWzFdLg0KPj4NCj4+IEl0IHdhcyBwcmV2aW91c2x5IGRpc2N1c3NlZCBb
Ml0sICIjIERpc2NvdmVyaW5nIFBDSSBkZXZpY2VzOiIgYW5kIHByb3Bvc2VkDQo+Pg0KPj4gdG8g
dXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZC4NCj4+DQo+PiBMb25nIHN0b3J5IHNob3J0LCBp
dCBpcyBub3QgZWFzeSBmb3IgQVJNIHRvIGVudW1lcmF0ZSBQQ0kgZGV2aWNlcyBpbiBYZW4gYXMg
dGhlcmUgaXMNCj4+DQo+PiBubyB1bmlmaWVkIHdheSBvZiBkb2luZyBzbzogZGlmZmVyZW50IHBs
YXRmb3JtcyBpbXBsZW1lbnQgZGlmZmVyZW50IFBDSSBob3N0IGJyaWRnZXMNCj4+DQo+PiB3aGlj
aCByZXF1aXJlIGNvbXBsZXggaW5pdGlhbGl6YXRpb24gaW5jbHVkaW5nIGNsb2NrcywgcG93ZXIg
ZG9tYWlucyBldGMuDQo+IEp1c3QgZm9yIG15IG93biB1bmRlcnN0YW5kaW5nOiBJZiB0aGlzIGlz
bid0IGRvbmUgYnkgZmlybXdhcmUsIGRvZXNuJ3QNCj4gdGhpcyBtZWFuIHlvdSBjYW4ndCBib290
IGFuIEFybSBzeXN0ZW0gZnJvbSBlLmcuIGEgZGlzayBjb25uZWN0ZWQgdGhyb3VnaA0KPiBhIFBD
SS1iYXNlZCBjb250cm9sbGVyPyBIb3N0IGJyaWRnZSBzZXR1cCBpcyBkZWZpbml0ZWx5IGZpcm13
YXJlJ3Mgam9iIG9uDQo+IHg4NiAuLi4NCg0KT24gdGhlIHBsYXRmb3JtcyBJIHdvcmsgd2l0aDog
bm8sIHlvdSBjYW4ndC4gV2VsbCwgaXQgaXMgcG9zc2libGUgdG8gYWRkIFBDSQ0KDQpzdXBwb3J0
IHRvIHRoZSBmaXJtd2FyZSwgYnV0IHdlIG5vcm1hbGx5IGJvb3Qgb3V0IG9mIGVNTUMsIFNELCBu
ZXR3b3JrIGFuZA0KDQphbGwgdGhvc2UgYXJlIHR5cGljYWxseSBOT1QgUENJIGRldmljZXMuDQoN
CkV2ZW4gbW9yZS4gSW4gbXkgZXZlcnlkYXkgd29yayBJIGRvbid0IHVzZSAobmVlZCkgYW55IFBD
SSBkZXZpY2UgdG8gcnVuDQoNCnRoZSBzeXN0ZW0gYXQgYWxsLg0KDQoNCj4gSmFuDQo+DQpUaGFu
ayB5b3UsDQoNCk9sZWtzYW5kcg0K

