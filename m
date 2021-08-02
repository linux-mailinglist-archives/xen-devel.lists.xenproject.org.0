Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09C3DDA2F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 16:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163108.298874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAYaF-0001Jx-4v; Mon, 02 Aug 2021 14:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163108.298874; Mon, 02 Aug 2021 14:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAYaF-0001HD-1U; Mon, 02 Aug 2021 14:06:23 +0000
Received: by outflank-mailman (input) for mailman id 163108;
 Mon, 02 Aug 2021 14:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8BG=MZ=epam.com=prvs=88488feb0f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mAYaD-0001H7-4q
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 14:06:21 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fff8bfe-ef14-434a-a90f-354b6ea2844c;
 Mon, 02 Aug 2021 14:06:19 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 172E5qr8007102; Mon, 2 Aug 2021 14:06:15 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3a6hp683vn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Aug 2021 14:06:14 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 14:06:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d8d3:ecba:8917:1baa]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d8d3:ecba:8917:1baa%9]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 14:06:07 +0000
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
X-Inumbo-ID: 6fff8bfe-ef14-434a-a90f-354b6ea2844c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kw5KuHtgQPay1jFq137aDdagf2wTe4G3BsAduIADuv2HdguSi8Chl4egyjMvBAhTurkFW6a1eN1MO1SvzE5+lFUXkwdENG3ad0EQtLJOb/9qCL277hyyUyVl2wtzOUJCMExMIC4vx6qFdXaVWRcw1clw7/zKhkmPvgfJ3gxdci3xf+ItHppePWCEIWe8Xe5HN7/STIVFouJmTYf/vGeFEgphTUIZciHeLZ/2EZE/thFhQKt6x0w+tgUPFuQETcWu93i+ONrP1Fa02O++mCL3eQOKemDvcxAoGIy4NmS6WjmV7VWYckJ1Gd5Nc9LrMxM2/lxbTRQWNHJk/IdC0V1wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXcguFnSot8XXc0tG5EG1IN+iJ1WUv7tqRfpX4JufOo=;
 b=UERGr1akvw75tI5rhJt4PgbskDWUNn97kuEjtRVdQGL8woKvwH6SxmkxKOKtMbH8J7GAyJ8/BOTe6IbxO8df/GNwyIsGp0WcD39NwFeiyHLZsngXbvekmsS2ixyYJjqaEWW/QLGHsNlS1wuRc6AdcEmQd652yxW8FngvSaKnZY5GRMeK1G0ttodSBqadjLC/eQ/GXRkQDEZA+w3sh8kxAp7t7K9cTc1VtlqYkgb/s98opcOMrR/phucTA85Mfk6+imr9KQLU0tala54a3DOr8yYQw65K28+N3iEwL8tS+0rcVZ/j+Ot6W3yyJEcJNaFCBH2zvNA0ZPD7OTfXwTi5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXcguFnSot8XXc0tG5EG1IN+iJ1WUv7tqRfpX4JufOo=;
 b=xBTeJ713gVGu2Q0+TcMmqXTRconfZ0FUYN4KTS8FA00ZMaByDUMLVJWiXTB4XhDoTI0f0Z9rTmbspmUoYmXKIfOj1Y0NROINr7RSDsUUAGW1qpwvivDMXHSGGsoKd/uUyB6fIJRIoqXNkz6QYXPSC0dK1cLpJOxSLR7ZVpGkbav+oXUdp2qLLQA8uLaXZjhyjisdIOqzLu5Dgrt0SHUe5G8DfF1wYhWiE8zKgyWR0gRlD8nVsD/Obq6LSzY5Kzay0eX9Hn2pw9pX24c+TFzVBpf6nRuwhXxHeByxIOO6huoOzx1wzchhAM5DCgxvd9A0ys70bF8ftdEVm7CWYipvwQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jens Axboe
	<axboe@kernel.dk>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v3 1/3] xen/blkfront: read response from backend only once
Thread-Topic: [PATCH v3 1/3] xen/blkfront: read response from backend only
 once
Thread-Index: AQHXh6eJ91LWa/O//ESEGVadZuHLeQ==
Date: Mon, 2 Aug 2021 14:06:06 +0000
Message-ID: <ce79a0a8-128d-1d50-d160-f612fbd52101@epam.com>
References: <20210730103854.12681-1-jgross@suse.com>
 <20210730103854.12681-2-jgross@suse.com>
In-Reply-To: <20210730103854.12681-2-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d5c9b82-f312-450b-9757-08d955beac45
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB283299DFE49E78FFB1CB7A95E7EF9@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kY1ReKTGDy4JxAebRDfo2buYwOjE4H8415+x/hOI+mFTTUrpTbh3cApEroFScxRWU3oMLqxhOhAOio4w0zD9qmvi9JrBE0vOcyUPbIBdAOfxBZFEdIBT6r01BgX1ROVSAY/I1IA7Php600QqhLp63FD0U92iabuco4Z9YukQ2fBC4Fm5tkwCrSzq6v6hkkZTrKh7NVbnumxJ2m8WMCEKTblCeH3jUR1GxxgJYUgBjvufD5QlUeqANnHJiRGwKGW2xB3E3l4uLVcIFvXJ+/U4n0BEX2RbLavC+L6ylM/oc40LXqFBwYdr7KXinO3ju4+mE72fqea9qou2vA65BmUlPHWu2yQG3ltESqsSA1aHE0uksIAap7wcQrWAOgrP7KI69hKPIRHZ8DAMFJBxKObQsBWxJSiKVMB8ulRRJAapU0/gq7YZTkfRx711IpWrBoiM+dIA61WxbBDz/EWvVnHcXcuCFZyX2Lcs9TcxPAWHO4D3MOp85TiZhkQNGjnRY4HjqP8znRSRI2oFDvDyehmFGheBr21co8daIBHH+VAfZS8fZZapZxVc2P9JwC7FPaHWaHnnnvzIrOiOHmDTj7aQc2iHFh1ivtjCFYXmsW0Zus8pq7QYAfO1TmEInUhrY/W5EFQRpwLculRnj/L2O3hYXlqHubKNVEuEx+t+6F1G04s5dwGNhxKqax74C0hS4fh7BnOK5EvFs0H6NY2RtmTZAZI2ohtBxrXPqYa2whi70Qv/Xi3CkUMcDr7MaQADM9cn
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(4326008)(66556008)(66476007)(6506007)(53546011)(2906002)(76116006)(71200400001)(66946007)(66446008)(64756008)(38070700005)(31686004)(38100700002)(122000001)(36756003)(86362001)(508600001)(26005)(7416002)(186003)(31696002)(8676002)(83380400001)(54906003)(6486002)(316002)(5660300002)(110136005)(8936002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFBEWXFabks4QXpHNlZiWWRUcDdpYSswcEt1MlUzREVYWnlSKzE3czNVMTR6?=
 =?utf-8?B?TWVzd2JOMUFJWGNjc3JGNjdYa3g4MGlhV1BpN0lDeCtOUXZ1OVBldTJ1dndZ?=
 =?utf-8?B?eWUwdFYvSllXdDNQeFZleXJMeXRuK2ZmWFdCMFYzZFZkSm91VXZUQlhuYWNq?=
 =?utf-8?B?S1A3SU9sNmpSd2VKRExIWjlzblFGbWdyWDlOdlBMQTdnR2p5NnNFclRYTDB1?=
 =?utf-8?B?Qk9FY0ZGZHlNb2orbytJRXREQUdkU2g5R3hRSlRNTWJWUUt1S3BpT3UvTkc4?=
 =?utf-8?B?UWJZMVpaNFFlNWxsaXh1UDE0Qk5pa2w5WmFOQjkvVmthK3g3am1xOW82ajdJ?=
 =?utf-8?B?U2VlNllUTUkvYkJ5Qkw3UGNqNFhlUWNXR1ZkRGN3M2c0T2JWQ3NSQzNYTGJ0?=
 =?utf-8?B?OGdZWklsZFFoVzhpNk9OeUYzQk00T2h4U01FRFJ5U3p6RXdXWE9Ic2RGdGdN?=
 =?utf-8?B?U01ZVk1taU9KRlVSZWpuNFhSUGJ6aVNodmVFc3hpcUR3R2lSbm1MaFpLelY0?=
 =?utf-8?B?U3F0S3lCbjNjNU1wbjNZeGNYRjZ6REU1WFhHZUJmQkhJYmVHSTIvZ2tieXpi?=
 =?utf-8?B?Sno2MkNEdmpQak5GSkpmRVlraXNObjdpTGJlWkpzZitLdm93WkhFWWs2dDM1?=
 =?utf-8?B?dm5RQVplKzBwZVkyeEl2bVdGUmM5TXZRY1FsZzU0OFMvSDdIY2s0cDFkOXdu?=
 =?utf-8?B?R1BFQmEvWXM2ZE5QMVZHTUJWMTVTTEV5a1BMMUZIM2lhY2IveG8rN0w0Yzdi?=
 =?utf-8?B?MXJkS20zRVFJMUFrbmFBNjdzUzBJSm5sUXZhMXpDcUNSVmFyVVBOcU1pWk1v?=
 =?utf-8?B?Qlpudmx2bUdRdFA2eWxtcGVBakZ6Qi9wZUw4Yms2TGlaMlFsR2hBWlZnWUFU?=
 =?utf-8?B?bklWTHNON1c0bWpqejU1YTRBclB6UlIvQ3luTUFlUDZULzdhbVE0dVFzSC9h?=
 =?utf-8?B?MVFDTmhPMkJKMUlWMlkzQXZpOW03cnpEN0tZMExNbzFnZDZDYktWREVxdU5j?=
 =?utf-8?B?SzVvYVRDZEdQWTZpZnBRSUE2b3MrMCtRR2U1M3IyazQ3TVdEakJXeWlGdzVS?=
 =?utf-8?B?dmdRQmRIN2ZpbkJRcWo0ZDUxMlNEem5OK0ZrRi81Vmw3SCtJRmh4UklFUE50?=
 =?utf-8?B?T3FBT2Z4U2R3R0xOOVpPdFl4Mnp5OEFzekZMUDVDTzhOVkhQVHZRb3RTSmcx?=
 =?utf-8?B?TnpQOUl0ckt0TmtObzI1akVCK2tQVkMrME1ONEJmYTd5cWQ1VHZnRVMxVk9O?=
 =?utf-8?B?cU1CUmJuUnVYanJBam1uTDBBNGNrWFR5Z0pjVVZSZkNYMjVzTkhkWjR2VDZi?=
 =?utf-8?B?MDdWN2tYZ1FPK0dCUDd5SU14WmF2bVpyTGtNaWxtNmxzL3o2bE9XQ2I1eTRX?=
 =?utf-8?B?TDlyalFHb3RpTkI4Q3EwRTBWVXNTYkp2WHIySCswQmV4aWJCenBPZUdDMmMv?=
 =?utf-8?B?TTNrTnBrdmhHdmRCcnF0VWV1QkhjMVNRa2JiVWQrOXh2ZVVFam8zVDdsZ0xD?=
 =?utf-8?B?VHBUbkNITElxcUcySE9qUm5KU2FobW5EZTdFYkVRU05zdDl0aGJudDlWQjNR?=
 =?utf-8?B?MkN2bE1iZmF0M1F4dktlYy9xMkY2YzVleFl6M1FXQm9NZ0d4dzFYOEhTU3l0?=
 =?utf-8?B?SnhSWmNIa0VKVmVpMlZ0UTI4RTNPYUtIL2ZtRjI5SkFJUTB1dFg0RG5xeEla?=
 =?utf-8?B?cnl4UVdybkFpR2dWMzlQTXd2L1o4M1NCbEJBeWdvZjhmdmZ2WVN1bjBBRGlp?=
 =?utf-8?Q?cuKYK25g0lYX+JZi5/Mafpd9MJgVJ9MbKxua1bM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0C1D4EE2EF24140BDE911AAD4A60F03@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5c9b82-f312-450b-9757-08d955beac45
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 14:06:07.0302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vF4tt9JhEsaQrZ5obsuYz7PYaqp2/a1WxUd7VlKnSqHeVDiuLg2yhi5g6JeixUtcJ1piB4GU9OViCkAOosL6dY8rUuOlCVzEXeelapu/BSogA94x0WyV4cnuI+0LXU+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-GUID: tW_q82qA-5msBzN8YASYSXUzsFJa3cjW
X-Proofpoint-ORIG-GUID: tW_q82qA-5msBzN8YASYSXUzsFJa3cjW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-02_05:2021-08-02,2021-08-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108020093

SGksIEp1ZXJnZW4hDQoNCk9uIDMwLjA3LjIxIDEzOjM4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
PiBJbiBvcmRlciB0byBhdm9pZCBwcm9ibGVtcyBpbiBjYXNlIHRoZSBiYWNrZW5kIGlzIG1vZGlm
eWluZyBhIHJlc3BvbnNlDQo+IG9uIHRoZSByaW5nIHBhZ2Ugd2hpbGUgdGhlIGZyb250ZW5kIGhh
cyBhbHJlYWR5IHNlZW4gaXQsIGp1c3QgcmVhZCB0aGUNCj4gcmVzcG9uc2UgaW50byBhIGxvY2Fs
IGJ1ZmZlciBpbiBvbmUgZ28gYW5kIHRoZW4gb3BlcmF0ZSBvbiB0aGF0IGJ1ZmZlcg0KPiBvbmx5
Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+
IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IEFja2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gLS0tDQo+ICAgZHJp
dmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8IDM1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMNCj4gaW5kZXggZDgzZmVlMjFmNmM1Li4xNWU4
NDAyODc3MzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMNCj4g
KysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYw0KPiBAQCAtMTQ5Niw3ICsxNDk2LDcg
QEAgc3RhdGljIGJvb2wgYmxraWZfY29tcGxldGlvbih1bnNpZ25lZCBsb25nICppZCwNCj4gICBz
dGF0aWMgaXJxcmV0dXJuX3QgYmxraWZfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldl9pZCkN
Cj4gICB7DQo+ICAgCXN0cnVjdCByZXF1ZXN0ICpyZXE7DQo+IC0Jc3RydWN0IGJsa2lmX3Jlc3Bv
bnNlICpicmV0Ow0KPiArCXN0cnVjdCBibGtpZl9yZXNwb25zZSBicmV0Ow0KPiAgIAlSSU5HX0lE
WCBpLCBycDsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gICAJc3RydWN0IGJsa2Zyb250
X3JpbmdfaW5mbyAqcmluZm8gPSAoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqKWRldl9pZDsN
Cj4gQEAgLTE1MTMsOCArMTUxMyw5IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBibGtpZl9pbnRlcnJ1
cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgIAlmb3IgKGkgPSByaW5mby0+cmluZy5yc3Bf
Y29uczsgaSAhPSBycDsgaSsrKSB7DQo+ICAgCQl1bnNpZ25lZCBsb25nIGlkOw0KPiAgIA0KPiAt
CQlicmV0ID0gUklOR19HRVRfUkVTUE9OU0UoJnJpbmZvLT5yaW5nLCBpKTsNCj4gLQkJaWQgICA9
IGJyZXQtPmlkOw0KPiArCQlSSU5HX0NPUFlfUkVTUE9OU0UoJnJpbmZvLT5yaW5nLCBpLCAmYnJl
dCk7DQoNCkFzIHBlciBteSB1bmRlcnN0YW5kaW5nIGNvcHlpbmcgaXMgc3RpbGwgbm90IGFuIGF0
b21pYyBvcGVyYXRpb24gYXMgdGhlIHJlcXVlc3QvcmVzcG9uc2UNCg0KYXJlIG11bHRpLWJ5dGUg
c3RydWN0dXJlcyBpbiBnZW5lcmFsLiBJT1csIHdoYXQgcHJldmVudHMgdGhlIGJhY2tlbmQgZnJv
bSBtb2RpZnlpbmcgdGhlIHJpbmcgd2hpbGUNCg0Kd2UgYXJlIGNvcHlpbmc/DQoNClRoYW5rcywN
Cg0KT2xla3NhbmRyDQoNCj4gKwkJaWQgPSBicmV0LmlkOw0KPiArDQo+ICAgCQkvKg0KPiAgIAkJ
ICogVGhlIGJhY2tlbmQgaGFzIG1lc3NlZCB1cCBhbmQgZ2l2ZW4gdXMgYW4gaWQgdGhhdCB3ZSB3
b3VsZA0KPiAgIAkJICogbmV2ZXIgaGF2ZSBnaXZlbiB0byBpdCAod2Ugc3RhbXAgaXQgdXAgdG8g
QkxLX1JJTkdfU0laRSAtDQo+IEBAIC0xNTIyLDM5ICsxNTIzLDM5IEBAIHN0YXRpYyBpcnFyZXR1
cm5fdCBibGtpZl9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgIAkJICovDQo+
ICAgCQlpZiAoaWQgPj0gQkxLX1JJTkdfU0laRShpbmZvKSkgew0KPiAgIAkJCVdBUk4oMSwgIiVz
OiByZXNwb25zZSB0byAlcyBoYXMgaW5jb3JyZWN0IGlkICglbGQpXG4iLA0KPiAtCQkJICAgICBp
bmZvLT5nZC0+ZGlza19uYW1lLCBvcF9uYW1lKGJyZXQtPm9wZXJhdGlvbiksIGlkKTsNCj4gKwkJ
CSAgICAgaW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0Lm9wZXJhdGlvbiksIGlkKTsN
Cj4gICAJCQkvKiBXZSBjYW4ndCBzYWZlbHkgZ2V0IHRoZSAnc3RydWN0IHJlcXVlc3QnIGFzDQo+
ICAgCQkJICogdGhlIGlkIGlzIGJ1c3RlZC4gKi8NCj4gICAJCQljb250aW51ZTsNCj4gICAJCX0N
Cj4gICAJCXJlcSAgPSByaW5mby0+c2hhZG93W2lkXS5yZXF1ZXN0Ow0KPiAgIA0KPiAtCQlpZiAo
YnJldC0+b3BlcmF0aW9uICE9IEJMS0lGX09QX0RJU0NBUkQpIHsNCj4gKwkJaWYgKGJyZXQub3Bl
cmF0aW9uICE9IEJMS0lGX09QX0RJU0NBUkQpIHsNCj4gICAJCQkvKg0KPiAgIAkJCSAqIFdlIG1h
eSBuZWVkIHRvIHdhaXQgZm9yIGFuIGV4dHJhIHJlc3BvbnNlIGlmIHRoZQ0KPiAgIAkJCSAqIEkv
TyByZXF1ZXN0IGlzIHNwbGl0IGluIDINCj4gICAJCQkgKi8NCj4gLQkJCWlmICghYmxraWZfY29t
cGxldGlvbigmaWQsIHJpbmZvLCBicmV0KSkNCj4gKwkJCWlmICghYmxraWZfY29tcGxldGlvbigm
aWQsIHJpbmZvLCAmYnJldCkpDQo+ICAgCQkJCWNvbnRpbnVlOw0KPiAgIAkJfQ0KPiAgIA0KPiAg
IAkJaWYgKGFkZF9pZF90b19mcmVlbGlzdChyaW5mbywgaWQpKSB7DQo+ICAgCQkJV0FSTigxLCAi
JXM6IHJlc3BvbnNlIHRvICVzIChpZCAlbGQpIGNvdWxkbid0IGJlIHJlY3ljbGVkIVxuIiwNCj4g
LQkJCSAgICAgaW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0LT5vcGVyYXRpb24pLCBp
ZCk7DQo+ICsJCQkgICAgIGluZm8tPmdkLT5kaXNrX25hbWUsIG9wX25hbWUoYnJldC5vcGVyYXRp
b24pLCBpZCk7DQo+ICAgCQkJY29udGludWU7DQo+ICAgCQl9DQo+ICAgDQo+IC0JCWlmIChicmV0
LT5zdGF0dXMgPT0gQkxLSUZfUlNQX09LQVkpDQo+ICsJCWlmIChicmV0LnN0YXR1cyA9PSBCTEtJ
Rl9SU1BfT0tBWSkNCj4gICAJCQlibGtpZl9yZXEocmVxKS0+ZXJyb3IgPSBCTEtfU1RTX09LOw0K
PiAgIAkJZWxzZQ0KPiAgIAkJCWJsa2lmX3JlcShyZXEpLT5lcnJvciA9IEJMS19TVFNfSU9FUlI7
DQo+ICAgDQo+IC0JCXN3aXRjaCAoYnJldC0+b3BlcmF0aW9uKSB7DQo+ICsJCXN3aXRjaCAoYnJl
dC5vcGVyYXRpb24pIHsNCj4gICAJCWNhc2UgQkxLSUZfT1BfRElTQ0FSRDoNCj4gLQkJCWlmICh1
bmxpa2VseShicmV0LT5zdGF0dXMgPT0gQkxLSUZfUlNQX0VPUE5PVFNVUFApKSB7DQo+ICsJCQlp
ZiAodW5saWtlbHkoYnJldC5zdGF0dXMgPT0gQkxLSUZfUlNQX0VPUE5PVFNVUFApKSB7DQo+ICAg
CQkJCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpycSA9IGluZm8tPnJxOw0KPiAgIAkJCQlwcmludGso
S0VSTl9XQVJOSU5HICJibGtmcm9udDogJXM6ICVzIG9wIGZhaWxlZFxuIiwNCj4gLQkJCQkJICAg
aW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0LT5vcGVyYXRpb24pKTsNCj4gKwkJCQkJ
ICAgaW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0Lm9wZXJhdGlvbikpOw0KPiAgIAkJ
CQlibGtpZl9yZXEocmVxKS0+ZXJyb3IgPSBCTEtfU1RTX05PVFNVUFA7DQo+ICAgCQkJCWluZm8t
PmZlYXR1cmVfZGlzY2FyZCA9IDA7DQo+ICAgCQkJCWluZm8tPmZlYXR1cmVfc2VjZGlzY2FyZCA9
IDA7DQo+IEBAIC0xNTY0LDE1ICsxNTY1LDE1IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBibGtpZl9p
bnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2X2lkKQ0KPiAgIAkJCWJyZWFrOw0KPiAgIAkJY2Fz
ZSBCTEtJRl9PUF9GTFVTSF9ESVNLQ0FDSEU6DQo+ICAgCQljYXNlIEJMS0lGX09QX1dSSVRFX0JB
UlJJRVI6DQo+IC0JCQlpZiAodW5saWtlbHkoYnJldC0+c3RhdHVzID09IEJMS0lGX1JTUF9FT1BO
T1RTVVBQKSkgew0KPiArCQkJaWYgKHVubGlrZWx5KGJyZXQuc3RhdHVzID09IEJMS0lGX1JTUF9F
T1BOT1RTVVBQKSkgew0KPiAgIAkJCQlwcmludGsoS0VSTl9XQVJOSU5HICJibGtmcm9udDogJXM6
ICVzIG9wIGZhaWxlZFxuIiwNCj4gLQkJCQkgICAgICAgaW5mby0+Z2QtPmRpc2tfbmFtZSwgb3Bf
bmFtZShicmV0LT5vcGVyYXRpb24pKTsNCj4gKwkJCQkgICAgICAgaW5mby0+Z2QtPmRpc2tfbmFt
ZSwgb3BfbmFtZShicmV0Lm9wZXJhdGlvbikpOw0KPiAgIAkJCQlibGtpZl9yZXEocmVxKS0+ZXJy
b3IgPSBCTEtfU1RTX05PVFNVUFA7DQo+ICAgCQkJfQ0KPiAtCQkJaWYgKHVubGlrZWx5KGJyZXQt
PnN0YXR1cyA9PSBCTEtJRl9SU1BfRVJST1IgJiYNCj4gKwkJCWlmICh1bmxpa2VseShicmV0LnN0
YXR1cyA9PSBCTEtJRl9SU1BfRVJST1IgJiYNCj4gICAJCQkJICAgICByaW5mby0+c2hhZG93W2lk
XS5yZXEudS5ydy5ucl9zZWdtZW50cyA9PSAwKSkgew0KPiAgIAkJCQlwcmludGsoS0VSTl9XQVJO
SU5HICJibGtmcm9udDogJXM6IGVtcHR5ICVzIG9wIGZhaWxlZFxuIiwNCj4gLQkJCQkgICAgICAg
aW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0LT5vcGVyYXRpb24pKTsNCj4gKwkJCQkg
ICAgICAgaW5mby0+Z2QtPmRpc2tfbmFtZSwgb3BfbmFtZShicmV0Lm9wZXJhdGlvbikpOw0KPiAg
IAkJCQlibGtpZl9yZXEocmVxKS0+ZXJyb3IgPSBCTEtfU1RTX05PVFNVUFA7DQo+ICAgCQkJfQ0K
PiAgIAkJCWlmICh1bmxpa2VseShibGtpZl9yZXEocmVxKS0+ZXJyb3IpKSB7DQo+IEBAIC0xNTg1
LDkgKzE1ODYsOSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYmxraWZfaW50ZXJydXB0KGludCBpcnEs
IHZvaWQgKmRldl9pZCkNCj4gICAJCQlmYWxsdGhyb3VnaDsNCj4gICAJCWNhc2UgQkxLSUZfT1Bf
UkVBRDoNCj4gICAJCWNhc2UgQkxLSUZfT1BfV1JJVEU6DQo+IC0JCQlpZiAodW5saWtlbHkoYnJl
dC0+c3RhdHVzICE9IEJMS0lGX1JTUF9PS0FZKSkNCj4gKwkJCWlmICh1bmxpa2VseShicmV0LnN0
YXR1cyAhPSBCTEtJRl9SU1BfT0tBWSkpDQo+ICAgCQkJCWRldl9kYmcoJmluZm8tPnhiZGV2LT5k
ZXYsICJCYWQgcmV0dXJuIGZyb20gYmxrZGV2IGRhdGEgIg0KPiAtCQkJCQkicmVxdWVzdDogJXhc
biIsIGJyZXQtPnN0YXR1cyk7DQo+ICsJCQkJCSJyZXF1ZXN0OiAleFxuIiwgYnJldC5zdGF0dXMp
Ow0KPiAgIA0KPiAgIAkJCWJyZWFrOw0KPiAgIAkJZGVmYXVsdDo=

