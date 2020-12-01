Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A6A2CA414
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 14:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42048.75594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5vj-0006a8-6F; Tue, 01 Dec 2020 13:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42048.75594; Tue, 01 Dec 2020 13:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk5vj-0006Zj-2m; Tue, 01 Dec 2020 13:42:55 +0000
Received: by outflank-mailman (input) for mailman id 42048;
 Tue, 01 Dec 2020 13:42:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJqf=FF=epam.com=prvs=0604985de8=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kk5vh-0006Ze-T9
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 13:42:53 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5afeef8e-eefe-430c-b51f-df410730f552;
 Tue, 01 Dec 2020 13:42:52 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1DdXPf022735; Tue, 1 Dec 2020 13:42:51 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0a-0039f301.pphosted.com with ESMTP id 353fhjqyed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 13:42:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0302MB2660.eurprd03.prod.outlook.com (2603:10a6:200:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 13:42:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3611.022; Tue, 1 Dec 2020
 13:42:48 +0000
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
X-Inumbo-ID: 5afeef8e-eefe-430c-b51f-df410730f552
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMx8Avbfy6bnXMYo0oQP76BXvCsAs0iqEcLjLYAvRh4pICs0hnZyAtZtY2d0egU9Ds/y74PktLSbPFPNc+WpTZM7I1qK5cPpnhsKJemQdigUw3Ni1I6UGJvZZWprmvKzXzybjGaGRQpMbhV2KrJVXfOwHfvQQ2lMOCYk/dIf3nMm/4mn0DxNkhn67lJxznfPELmqGVG3hQhLLj3rmmcJT13cjGbUStmblsf4YEvWUVGeCXnzXAyqcZfG6Onw4iEkTeMWTXeTjd3SHR1odW8w72RqGUbSfdinT2RQAtyiAtWcx+8yT1n4b2RdRvb8q0DyKT5qV2NFXCPrpSBbDsKwvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSxOCYfYkjEVqYJxPEXVsqJPaZkBfbsGxaWmN8IVK1g=;
 b=kuIhiba0NgFW2aAFwXNDzmhE7jM+ju8bPXDHicSpOdNFUMjxy/FRXzrYQFxqbDHsqUkd1G/hSTBJF/9EFBXlnzpHoUozdjh/d0tT5AWfCK/21TJfLMiVo4Pzmh+FnyYMlWQ48dknwfcsI1HQM1L3ON/OEjFf/0uZNPSgWOA184KXux3nnZoBDJnQ1vzbmbURcsq+42NAaPTN+6WimI/v6N2dY5vAvPSGwGWZr/rX+11DjCiMuilSHlGrhsRU5Ig+fnFiwwZIQb/D/kDFP0vdj/qhVm+0MOLbD4Ngdq6LdoVIbUaAFAbNc6mez5C99SiEZrugKJeic90NhKtw3w+mPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSxOCYfYkjEVqYJxPEXVsqJPaZkBfbsGxaWmN8IVK1g=;
 b=uLLniChiccrOJUJz84/hkoIni93I7dpDFwptneqibmd4v06yOdNjVQtJEfDDbBJPuO60jEoqhz1O4w/l8Zcxrqg3LHr32kN89SQdUCQ2bMEeDCtXai5LNla6KxWH1TeIbDuO6nvPdupWepebN1wpGp2H22F3YlLreJeta9RM6W/zzmh1aGKpxx9dBA8KVGUkvjBFfiWntZnbhrm/E6SjVs8D49JREP5y3WYX5GfLZJnZJrwKinj+BdaoinBJuy0tNvs+uxbwqzDEWVkWT+6/kV0ocVyPJhzXFFgIkRJz9kJBS+ZRFs7m0CemloRxe5+Y0WYMoChFfRCaFpODi+UxfQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Paul Durrant <paul@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
        Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v4 07/23] libxl: stop using aodev->device_config in
 libxl__device_pci_add()...
Thread-Topic: [PATCH v4 07/23] libxl: stop using aodev->device_config in
 libxl__device_pci_add()...
Thread-Index: AQHWx+fburloX/qOnkuYutvO7j8/pg==
Date: Tue, 1 Dec 2020 13:42:48 +0000
Message-ID: <a0bcdae3-146b-5b8e-1cdd-f76c73bba715@epam.com>
References: <20201124080159.11912-1-paul@xen.org>
 <20201124080159.11912-8-paul@xen.org>
In-Reply-To: <20201124080159.11912-8-paul@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0230ffa7-34a4-44ac-4405-08d895fefdc2
x-ms-traffictypediagnostic: AM4PR0302MB2660:
x-microsoft-antispam-prvs: 
 <AM4PR0302MB26602A7C194BE6D622A551C9E7F40@AM4PR0302MB2660.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:576;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hzib3lG/r50cWDkTXKuBm0UYMZITZa6AjNTxQfl+uS0AcLVb9Gaja27g5C9B9Ygbl6hQca2s1wJczMVRDb2h7uVdWqWfpNx4PnYayM6D+YiH1XO47Ot7EgA57WCwPRpxPY7Oo1sQijuo1JDXgdPENb9fv3N3Ocv4tOB5yRLsEM0mCkeP0X9r4LhPKlKjfvN7Qj7HdeZD7L9hCt9jtMDjrSrrqWeFBT1AsSH9jM/lrhP5TGd+CSCno4H/mAK0P1RlEWSQHyvCA54uPN4c4iwrNbYOA88XXzHLeUxtUlbHLF5XCVYM8O8TZ9zV54G8dVNgeXPwl2nqHxnqBltpC0n+543T3U7coKjiuISFNGfSmobMyNK0100tMpAt27p2zHXa
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(31686004)(31696002)(8676002)(316002)(36756003)(4326008)(6506007)(53546011)(6486002)(83380400001)(54906003)(6512007)(110136005)(26005)(86362001)(186003)(2616005)(71200400001)(66946007)(66476007)(64756008)(66446008)(76116006)(5660300002)(2906002)(66556008)(478600001)(8936002)(101420200001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?ckNqWmVtTHFWanRPZ0JGNVBLbHN6UWRBaTZrVXhlRW53bEdBdDExbEhicnBZ?=
 =?utf-8?B?Skt0NGJXendSdll2cnVaU0VRYkJ3d3R1eHFyUWZNUGxaa2dZdmpLUGJHQnB4?=
 =?utf-8?B?OXFwWkk1R3NMWVNuWG4zdU81amFjdzc2emgwSjFhcENsWDNxZXc5bkxUaXF6?=
 =?utf-8?B?LzZzeEVKTE84YmljaXdoWDNwOXcrd0FVNUJoS3o5eitVT3JlQ2pTNUhkdDZS?=
 =?utf-8?B?dVRqQSsxMTIxa2dqME9zb3ZERytFL0Uxa2VybEZHeVJJMXEvb3lIZ0kwTzBJ?=
 =?utf-8?B?ZUFwcTRaNFNCRW84bWRDd3JOUWVtcU5JQnNwUGZVMlRqOWR5NWdoT0dzTytq?=
 =?utf-8?B?TjhPSzM2NUpsSm5RUHRjaTdYZW5KL3FQelhubkJzS2NxY2ZxUmp1TTBpSDNy?=
 =?utf-8?B?N3R4V04wOTkxOC9JajczYStidmRDYzdJTU5ZZ1BETmdEbHZRQ3orRnB4NkpW?=
 =?utf-8?B?WDROVS80Mkp2NmtOL21rb1FMK21DSVE1anN2WXdKQzJhMEdpWVlEaDlNZUhV?=
 =?utf-8?B?T3RlUnY5U1doblRzeUtZamtXVnpmZ2J6WlEvaXk5K3prK09OSk5iRTJnN2Zh?=
 =?utf-8?B?bE84V2FkdE42Q1M1WTVGd1FSUHRPR0hxWklLUGZuaGVSWks1SXA3em8vendD?=
 =?utf-8?B?K3JNYU5WNUlYcnN0a29kbndmYmFQSVBTZGFWR2pxeXZhbmZWYkVpUjBPTVll?=
 =?utf-8?B?MTNJRWt5SEVFbTlpeEhXd2lPejBlS3FMclZMV1NpaTd0bjZRMGl2ME5kNzdo?=
 =?utf-8?B?alVnUkRpMTlUb0VObXh0VThpQmFwb1FHTmlPTDlMeGNGbnRTUERPWjd5OVZm?=
 =?utf-8?B?TGpBbEJlTlczdlRDdVFIcmZEbG1jci9TQitzNHFhbFZuWUNjQVM1NUVkSERo?=
 =?utf-8?B?UytMeFVNakYyemlrUFlYeGlUdWtjNVk2elp2eGU1YlVqQVJlcTQ0RkhoNmNz?=
 =?utf-8?B?TU5lbDVSaTZLcE9OeWF4clMxc2lYcmt5TzRkWk92anRQTWJJTy95dnY1VGxq?=
 =?utf-8?B?SldnK0NjQzZEcExKdzhlTmZqQUZ0STN4eDlGcFpHVlMvbkdCbDhIVlBJeWt6?=
 =?utf-8?B?c0kzSUhOZCs1UUZzMEFkS3JqcktqMEN4aWZzRXFkL3Ywc21wME9uV3FQZ0JC?=
 =?utf-8?B?MjVNR25vL3pTQ1BvclVFRVFabi80SXoxa3I4eFFpTWFkRDEzdmkwQmQ1UkI3?=
 =?utf-8?B?Qys5MVJQQTBxKzQwWEs2bWpIWTcvbklxbjQvNkZoMnZJVW5qdUoxK0ExYUNy?=
 =?utf-8?B?bm4vUTZlV29vMHpLTVlUY29kUXVla3NCbDcvV21rdXhnQnRBYzhOa2NYaDZy?=
 =?utf-8?Q?W9kK8aCelAmQL+dGaVAsL9xM4BQQ33eCxo?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C92D3C574DC0A7499F8C340C1E3D0249@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0230ffa7-34a4-44ac-4405-08d895fefdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 13:42:48.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x2qawYqAM/1eUg4rbQoGibwSYsRiIpe3WDXhUHm8K0+P8V+Ih+3TgaQ0BHaPCtnaK4qnWBwUKkwg4vYuYgsDIA3yQlfURLMXSfT8vOX8EwpjFu1Gmg4Ey0a4tG8rh/rg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2660
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_05:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010088

SGksIFBhdWwhDQoNCk9uIDExLzI0LzIwIDEwOjAxIEFNLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4NCj4gLi4uIHRvIGhv
bGQgYSBwb2ludGVyIHRvIHRoZSBkZXZpY2UuDQo+DQo+IFRoZXJlIGlzIGFscmVhZHkgYSAncGNp
JyBmaWVsZCBpbiAncGNpX2FkZF9zdGF0ZScgc28gc2ltcGx5IHVzZSB0aGF0IGZyb20NCj4gdGhl
IHN0YXJ0LiBUaGlzIGFsc28gYWxsb3dzIHRoZSAncGNpJyAoIzMpIGFyZ3VtZW50IHRvIGJlIGRy
b3BwZWQgZnJvbQ0KPiBkb19wY2lfYWRkKCkuDQo+DQo+IE5PVEU6IFRoaXMgcGF0Y2ggYWxzbyBj
aGFuZ2VzIHRoZSB0eXBlIG9mIHRoZSAncGNpX2RvbWlkJyBmaWVsZCBpbg0KPiAgICAgICAgJ3Bj
aV9hZGRfc3RhdGUnIGZyb20gJ2ludCcgdG8gJ2xpYnhsX2RvbWlkJyB3aGljaCBpcyBtb3JlIGFw
cHJvcHJpYXRlDQo+ICAgICAgICBnaXZlbiB3aGF0IHRoZSBmaWVsZCBpcyB1c2VkIGZvci4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPg0KDQpS
ZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hl
bmtvQGVwYW0uY29tPg0KDQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0KDQo+IC0tLQ0KPiBDYzog
SWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+DQo+IC0tLQ0KPiAgIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgfCAxOSArKysrKysr
LS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5j
IGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPiBpbmRleCA0MWU0YjJiNTcxLi43N2Vk
ZDI3MzQ1IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+ICsr
KyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4gQEAgLTEwNzQsNyArMTA3NCw3IEBA
IHR5cGVkZWYgc3RydWN0IHBjaV9hZGRfc3RhdGUgew0KPiAgICAgICBsaWJ4bF9fZXZfcW1wIHFt
cDsNCj4gICAgICAgbGlieGxfX2V2X3RpbWUgdGltZW91dDsNCj4gICAgICAgbGlieGxfZGV2aWNl
X3BjaSAqcGNpOw0KPiAtICAgIGludCBwY2lfZG9taWQ7DQo+ICsgICAgbGlieGxfZG9taWQgcGNp
X2RvbWlkOw0KPiAgIH0gcGNpX2FkZF9zdGF0ZTsNCj4gICANCj4gICBzdGF0aWMgdm9pZCBwY2lf
YWRkX3FlbXVfdHJhZF93YXRjaF9zdGF0ZV9jYihsaWJ4bF9fZWdjICplZ2MsDQo+IEBAIC0xMDkx
LDcgKzEwOTEsNiBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqLA0K
PiAgIA0KPiAgIHN0YXRpYyB2b2lkIGRvX3BjaV9hZGQobGlieGxfX2VnYyAqZWdjLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9taWQgZG9taWQsDQo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGxpYnhsX2RldmljZV9wY2kgKnBjaSwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIHBjaV9hZGRfc3RhdGUgKnBhcykNCj4gICB7DQo+ICAgICAgIFNUQVRFX0FPX0dDKHBhcy0+
YW9kZXYtPmFvKTsNCj4gQEAgLTExMDEsNyArMTEwMCw2IEBAIHN0YXRpYyB2b2lkIGRvX3BjaV9h
ZGQobGlieGxfX2VnYyAqZWdjLA0KPiAgICAgICAvKiBpbml0IHBjaV9hZGRfc3RhdGUgKi8NCj4g
ICAgICAgbGlieGxfX3hzd2FpdF9pbml0KCZwYXMtPnhzd2FpdCk7DQo+ICAgICAgIGxpYnhsX19l
dl9xbXBfaW5pdCgmcGFzLT5xbXApOw0KPiAtICAgIHBhcy0+cGNpID0gcGNpOw0KPiAgICAgICBw
YXMtPnBjaV9kb21pZCA9IGRvbWlkOw0KPiAgICAgICBsaWJ4bF9fZXZfdGltZV9pbml0KCZwYXMt
PnRpbWVvdXQpOw0KPiAgIA0KPiBAQCAtMTU2NCwxMyArMTU2MiwxMCBAQCB2b2lkIGxpYnhsX19k
ZXZpY2VfcGNpX2FkZChsaWJ4bF9fZWdjICplZ2MsIHVpbnQzMl90IGRvbWlkLA0KPiAgICAgICBp
bnQgc3R1YmRvbWlkID0gMDsNCj4gICAgICAgcGNpX2FkZF9zdGF0ZSAqcGFzOw0KPiAgIA0KPiAt
ICAgIC8qIFN0b3JlICpwY2kgdG8gYmUgdXNlZCBieSBjYWxsYmFja3MgKi8NCj4gLSAgICBhb2Rl
di0+ZGV2aWNlX2NvbmZpZyA9IHBjaTsNCj4gLSAgICBhb2Rldi0+ZGV2aWNlX3R5cGUgPSAmbGli
eGxfX3BjaV9kZXZ0eXBlOw0KPiAtDQo+ICAgICAgIEdDTkVXKHBhcyk7DQo+ICAgICAgIHBhcy0+
YW9kZXYgPSBhb2RldjsNCj4gICAgICAgcGFzLT5kb21pZCA9IGRvbWlkOw0KPiArICAgIHBhcy0+
cGNpID0gcGNpOw0KPiAgICAgICBwYXMtPnN0YXJ0aW5nID0gc3RhcnRpbmc7DQo+ICAgICAgIHBh
cy0+Y2FsbGJhY2sgPSBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX2RvbmU7DQo+ICAgDQo+IEBAIC0x
NjI0LDkgKzE2MTksMTAgQEAgdm9pZCBsaWJ4bF9fZGV2aWNlX3BjaV9hZGQobGlieGxfX2VnYyAq
ZWdjLCB1aW50MzJfdCBkb21pZCwNCj4gICAgICAgICAgIEdDTkVXKHBjaV9zKTsNCj4gICAgICAg
ICAgIGxpYnhsX2RldmljZV9wY2lfaW5pdChwY2lfcyk7DQo+ICAgICAgICAgICBsaWJ4bF9kZXZp
Y2VfcGNpX2NvcHkoQ1RYLCBwY2lfcywgcGNpKTsNCj4gKyAgICAgICAgcGFzLT5wY2kgPSBwY2lf
czsNCj4gICAgICAgICAgIHBhcy0+Y2FsbGJhY2sgPSBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX3dh
aXQ7DQo+ICAgDQo+IC0gICAgICAgIGRvX3BjaV9hZGQoZWdjLCBzdHViZG9taWQsIHBjaV9zLCBw
YXMpOyAvKiBtdXN0IGJlIGxhc3QgKi8NCj4gKyAgICAgICAgZG9fcGNpX2FkZChlZ2MsIHN0dWJk
b21pZCwgcGFzKTsgLyogbXVzdCBiZSBsYXN0ICovDQo+ICAgICAgICAgICByZXR1cm47DQo+ICAg
ICAgIH0NCj4gICANCj4gQEAgLTE2ODEsOSArMTY3Nyw4IEBAIHN0YXRpYyB2b2lkIGRldmljZV9w
Y2lfYWRkX3N0dWJkb21fZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+ICAgICAgIGludCBpOw0KPiAg
IA0KPiAgICAgICAvKiBDb252ZW5pZW5jZSBhbGlhc2VzICovDQo+IC0gICAgbGlieGxfX2FvX2Rl
dmljZSAqYW9kZXYgPSBwYXMtPmFvZGV2Ow0KPiAgICAgICBsaWJ4bF9kb21pZCBkb21pZCA9IHBh
cy0+ZG9taWQ7DQo+IC0gICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpID0gYW9kZXYtPmRldmljZV9j
b25maWc7DQo+ICsgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpID0gcGFzLT5wY2k7DQo+ICAgDQo+
ICAgICAgIGlmIChyYykgZ290byBvdXQ7DQo+ICAgDQo+IEBAIC0xNzE4LDcgKzE3MTMsNyBAQCBz
dGF0aWMgdm9pZCBkZXZpY2VfcGNpX2FkZF9zdHViZG9tX2RvbmUobGlieGxfX2VnYyAqZWdjLA0K
PiAgICAgICAgICAgICAgICAgICBwY2ktPnZkZXZmbiA9IG9yaWdfdmRldjsNCj4gICAgICAgICAg
ICAgICB9DQo+ICAgICAgICAgICAgICAgcGFzLT5jYWxsYmFjayA9IGRldmljZV9wY2lfYWRkX2Rv
bmU7DQo+IC0gICAgICAgICAgICBkb19wY2lfYWRkKGVnYywgZG9taWQsIHBjaSwgcGFzKTsgLyog
bXVzdCBiZSBsYXN0ICovDQo+ICsgICAgICAgICAgICBkb19wY2lfYWRkKGVnYywgZG9taWQsIHBh
cyk7IC8qIG11c3QgYmUgbGFzdCAqLw0KPiAgICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAg
ICAgIH0NCj4gICAgICAgfQ0KPiBAQCAtMTczNCw3ICsxNzI5LDcgQEAgc3RhdGljIHZvaWQgZGV2
aWNlX3BjaV9hZGRfZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+ICAgICAgIEVHQ19HQzsNCj4gICAg
ICAgbGlieGxfX2FvX2RldmljZSAqYW9kZXYgPSBwYXMtPmFvZGV2Ow0KPiAgICAgICBsaWJ4bF9k
b21pZCBkb21pZCA9IHBhcy0+ZG9taWQ7DQo+IC0gICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpID0g
YW9kZXYtPmRldmljZV9jb25maWc7DQo+ICsgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpID0gcGFz
LT5wY2k7DQo+ICAgDQo+ICAgICAgIGlmIChyYykgew0KPiAgICAgICAgICAgTE9HRChFUlJPUiwg
ZG9taWQs

