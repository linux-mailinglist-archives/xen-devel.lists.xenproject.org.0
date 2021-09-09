Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4BB404831
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 12:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182934.330812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGts-0002Yb-AS; Thu, 09 Sep 2021 10:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182934.330812; Thu, 09 Sep 2021 10:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGts-0002Vk-6v; Thu, 09 Sep 2021 10:03:20 +0000
Received: by outflank-mailman (input) for mailman id 182934;
 Thu, 09 Sep 2021 10:03:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOGtq-0002Ul-6S
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 10:03:18 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 273245e4-1155-11ec-b1ab-12813bfff9fa;
 Thu, 09 Sep 2021 10:03:17 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1899XCo8002401; 
 Thu, 9 Sep 2021 10:03:14 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ayex9gdh6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 10:03:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3469.eurprd03.prod.outlook.com (2603:10a6:803:18::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25; Thu, 9 Sep
 2021 10:03:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 10:03:10 +0000
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
X-Inumbo-ID: 273245e4-1155-11ec-b1ab-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBykgXf5IhV7uSHlBLbcLr5QKlHyR9BZMBRrFqW68Ho7LpddzoRA+7iU4MxjeN0K8B/OVcUL0d9XtLvMAikfx/l1sEEnCAZIP44LHDD5TGVvtghI1evBCopU4kfceG9qaTDjFzje874Mlaj9/fSRDQRXRdmnhU7QNhlCkQgOtN6sC6L5d5j5tyktqgCn/NeWHjV6SKIyPX2tuY4CdQB+kWJ9yu8UMXa3sQPGIRQiqxRM9ls5hGjJnyqN4LjLqWK8OcYR9N3VFxUWfwVTyFn2Q5s8zfu9zOVA5Ww495qdJ9KHPfOglF/wyDPq/7HSi7LS5H5EX4/qOt+KRZBzVClKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4OVP7vzYhLS51vaJuyi4faSWKkZbprdRsiFbSk3zpaI=;
 b=CIO2QyxCT0waOT0J7ZC9lVZxQ9v3m7DsQoLQAEpcufz8ozwdqGycj1V4RPezTuGxhqF0ul8EN2dhU4LcM6Ju1Ob9tz4DH2DdwyOsrwtsQwkOzgq99vdHUme4WVTseW85Nulr4O34MdvhYc3GQiGMLg+saomx5HYcRzS4i5IxfWs/mx8P1bj3Cky2lI2COaUjFMOHS8KHNXYrqqOsIkc8bsIUjy2Dmo9gtXDlxEtgEqxLNneP2Hir5vMi2jdISwFNi09DhA2beV5nJVZMiYLNfbWDrrhjYcC6ka/TQJs3nN/UBHOO0kJuS2aOGY2ntEXrI9oQUXEJdH8CdKR5i7GR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OVP7vzYhLS51vaJuyi4faSWKkZbprdRsiFbSk3zpaI=;
 b=Pln2odSvfyZn9fh0HoX5/EOLfYJ6Rnb59B3+smGL65K5OUgiUDVp2ZGgeudofcDTcoVvfYBYuGF49MN72knGC1J+Y8f4sPhlqdGMaHHdFJ1g6FlixPf0MFHBWArNvMfnvoEeEG1aQ8/ElSf8osVpAmPUQyLo9BvMyRaIKH3FcIZTxtMOCn5e69ieT2fR65evMJ0jEB7pqdlsiKCGfsNiiyAt4W3Y9D4VkVQ+ET0jb1AlYkpbZVIW1pNTgTw57MEI9Nr7ojxDkI7xjek2pM9Fpu4Ato76Rt9XBuaZOnJHEjdjgBfaWB8N9KEhsP+cHRbOBg7W67ezA2NRZYxhBfpBTQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
Thread-Index: 
 AQHXoKxjXfke7B20QEeo6YjlfUMhlquXGvYAgAMgDgCAAAg4gIAA8L+AgAAy0wCAAA1uAIAAB6sAgAAGiIA=
Date: Thu, 9 Sep 2021 10:03:10 +0000
Message-ID: <e154e4f7-bd60-2645-1ce5-1c2b5404236f@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
 <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
 <dfb66ff2-9c9e-645f-4789-2dc6c21ff751@epam.com>
 <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
In-Reply-To: <27043082-bf9f-5bba-f5a0-bb0e10426aba@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89e91b7e-e527-4a59-b94d-08d97379077b
x-ms-traffictypediagnostic: VI1PR0302MB3469:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB3469CA5069A21C5FA1582DC0E7D59@VI1PR0302MB3469.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3FV/1jdeuAB/6Lg8yvgVXfNj/Qqia7jDPR6X+XCf/oHnWpef91raucOMmzpBXNnULlbn1yu9mx9ZYcDkYxaeeJ1Zd9F/spG0hiyAz7Gzp8ZoYOCd+xRllUEUGedjfPfTHe8USRdiIat8HNnjB/QdOjlE4PXgpRhOe2rPU+gZwu4tnxXI8UqH1o6N3Ycr3rktH08B9BYLOa+fgpgPANbwFZSTNqResOP9z6KK5u3AuPMl6hy5eWzE2oVx0s3pxotyRYeL2yenk+d3LTTUTN7UDJhgayZgIt/Uf/VXTz03FZ/MAlktb6U5+dsragPHP3Nr5NN07RMZQKO+btAPBdPkbvuRNSvOEuPBZKVz9rX/wfkyDnrt1jRxlK9N5jdaPA0+e4nrgKkUKtGw3XBdvswM7ZIxL4YjAHSfS/loQEAqkS900jBYKOmC1I54Mhuq/rerjp8XyyTGSG+Y6A+xIkwRewDcfJvjlpQhdIgfDkQ86jJaGrNbTitfTAXqFYk3QJe3qB4xq/Jdf+YeznxTRxGhVCyTGONZ598QVv0fUzws6dDpW7Q/8t/hAGIGKMJ1HA6x+kJibSHlxcwaDXM0KPb2ibtX2MsmlrWzPktfUuUf292RKaYxsU7+X6j77hTVBZAWhB8X9SCnh4SzCCf8NcJddGH67EkZ4zAosRkdvPYn+WGUQVx35bng8WXB3nLNnWLRo3vkcptVQjg/+SDXpQ7GKVYEjWKcka15HY2rY3GMfnXGtO8bN6Js7kWl5HsJK7gv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(54906003)(66476007)(66556008)(64756008)(8676002)(66946007)(38100700002)(8936002)(6486002)(5660300002)(4326008)(478600001)(2906002)(122000001)(186003)(2616005)(76116006)(316002)(31686004)(86362001)(71200400001)(6512007)(36756003)(31696002)(83380400001)(26005)(110136005)(38070700005)(66446008)(91956017)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UXllUnMvdW9NcnB6TjRndEZvUHZHdHF3ZzlzSXNyais1UHRzQU0zRmZTUUlM?=
 =?utf-8?B?UGlqelh3NnpncU5uUlBBRXR1cmVvYnlOQzlMdlFSdjg5MkhFZDZndUxQOHNz?=
 =?utf-8?B?SHpWMTlGeUp3MDZJalhLZDFRWVRlYUFncTZLZ3JGcnpnRndvOXJoL1ZSQTFE?=
 =?utf-8?B?K3FwbUcvckM2Qlk3VTZoVU52YU1uRlVBMjJKcjFJZFVCWWMvd0VHY2pnRmJC?=
 =?utf-8?B?dHNQS3dUSDlBdVNPY2FzdGYvTUZ6VDFjQWUyMURBcVU3VFZ0SlJ5RU1ONWEx?=
 =?utf-8?B?K2xYbjlYOXZ3dERlTXZBcjB6dGhwN1Yyci90dXpIaURadGU4RHlOa0VvaU1G?=
 =?utf-8?B?UGgvWVdVWm4rMXI0enRDTEx1NlNmNE9iSDgzVUpDZEVFSEwzVnVoZUxsQkh0?=
 =?utf-8?B?b0ZrK2trcEtEMGZZQ1N5WUdCZFU3OVc1b0dxdEVWZzNBYUhMWTZMemNIaEcw?=
 =?utf-8?B?L2xLbS84WXVib3g4b2Y2UHExR0xaY0tiOUhYTXgxY0FCQ2RENERJTlcrZ1FR?=
 =?utf-8?B?YXlBVlNhckRjUU03Z2JIUnRiWkh3QnBrcy9RQmtMbVU3Y08yQXU2eWJ3Y253?=
 =?utf-8?B?c0MrckpWVnJtYytaYnc0elQ0anhmSjdhN0FwZU5PNVl1ZUNzd3RCVk9vT0Ux?=
 =?utf-8?B?ck5zSHpzZnVybFpTL2FSUU9ob0FJTkJBeGs0bkVTOWw0azZnV0xaTlVLSWNn?=
 =?utf-8?B?c3NxdXA0bjBEUXIzVGJzY3BBSCtqendTeWlkQzlnS2pnR3NWTTIyK245Y3Vh?=
 =?utf-8?B?eVNXdjJzNFNNUzFXRUtuVjNxUmtIZ0QzVmpOc1pJUkc4OE9JVnd4TVk1Z2l2?=
 =?utf-8?B?NWczSHQySXVUVnI2eGFoK1dzWEo1bHpxZmxsNFU5U2JZYWFrdHNWbFA4N095?=
 =?utf-8?B?WnM3dWFhWFF1MU5qYWRhdzVadi9JYVk4UUtFcjE0blVLc2djZU96T2FGcFc5?=
 =?utf-8?B?OUhXUllnWkxGRXY0ZXNPOEhXZXdLc2wrVjk2SWo1dmlvTGFHNE1RUjBlSjEz?=
 =?utf-8?B?N2hCcVB3Y0VTRlRrYml6dW9jV0oxQjk2N0dNMytwemJjUjRRMTQrY1ZCbHF4?=
 =?utf-8?B?dVRYb2RJdThsTlphSVB0ckVqeXNQMUlIWmhtZmk3YlJwQnE4aGxtK1lSZnp6?=
 =?utf-8?B?NGhLU2VNa0NxZkI5RzFycUtoVkZLUVEwVFhoZ3hzSWhidXlEMU14MmlGekov?=
 =?utf-8?B?SGk3NVF4U2czYTdJQndFZE00dy9RVTNTYjJrK0pWSHRVaWhUaGpxSU42ZkFE?=
 =?utf-8?B?SlNaWFlXT2ZQNEpBWXdUclRTZm9vNUE4MTBnQXhGVjFLc1BtbWIyWXB3U2dt?=
 =?utf-8?B?RWJtQ0NTNGlUNGJweGU0NjVMQ2RGc1V5K1pWUXZnU2UwTDkyeXhoSHZxK0pr?=
 =?utf-8?B?Z2hVVVpSd1VMTDlmUC9jVDNiUklJSFR0dlB6TDY2Y09KSWhGSnFzdlE1ak9Z?=
 =?utf-8?B?MGRnWWh0UFZzOUFuR2VTTDg0WVNqQ1pFR09UaEpmcEFoNWhqbFBwa29YNEIz?=
 =?utf-8?B?VGVFRStmQXBOQ05tZnBQTXpiTVpQaHFhem5SbDVnWG01S3hnTjJ3VnBaa3FL?=
 =?utf-8?B?WlA4alJJTWIzSldLVWV2VnB5MEtRVG9USkVWcHFHOWQzUDg1b3hGdnNmTGw5?=
 =?utf-8?B?c0tmaWc0WlloWU1CT0xnM2RRUFQ1S09LWjRvTnpVc2h3ZVZtQ05pV1VNd2ZI?=
 =?utf-8?B?K1BpOTNBc2xTTlREMEE1NWdZdkpZdzBZUEF6Rmd6Rlg3dGVjNm5md0QzWE5Y?=
 =?utf-8?Q?3s4jIQaPHUbNqR07QxVfZXdDquNAaAGC//xRIWX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A3B563C10C5E142B2357C285BB566B1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e91b7e-e527-4a59-b94d-08d97379077b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 10:03:10.2127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 04n0sFCwWov3jdzn5J9d1GyDPtgo4FSIERLC3YsRHQOwts6sctqasBgeJQqW5ZXKU/fCpQrTfgEGV+2vMR87nbdc2aOVdwkV3YD4qXJ8p3pChTZ4C0Ar6XkXjZmZLxPF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3469
X-Proofpoint-GUID: vHwv61ZpRXIMYvEbbIc9VZBDHGVg9wDu
X-Proofpoint-ORIG-GUID: vHwv61ZpRXIMYvEbbIc9VZBDHGVg9wDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 mlxlogscore=889
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090060

DQpPbiAwOS4wOS4yMSAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTE6MTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gQW55d2F5cywgSSBhbSBv
cGVuIHRvIGFueSBkZWNpc2lvbiBvbiB3aGF0IHdvdWxkIGJlIHRoZSByaWdodCBhcHByb2FjaCBo
ZXJlOg0KPj4NCj4+IDEuIFVzZSByYW5nZSBzZXRzIHBlciBCQVIgYXMgaW4gdGhlIHBhdGNoDQo+
Pg0KPj4gMi4gUmVtb3ZlIHJhbmdlIHNldHMgY29tcGxldGVseSBhbmQgaGF2ZSBhIHBlci12Q1BV
IGxpc3Qgd2l0aCBtYXBwaW5nDQo+Pg0KPj4gZGF0YSBhcyBJIGRlc2NyaWJlZCBhYm92ZQ0KPj4N
Cj4+IDMuIEFueXRoaW5nIGVsc2U/DQo+IEEgZGVjaXNpb24gZmlyc3QgcmVxdWlyZXMgYSBwcm9w
b3NhbC4NCg0KSSBhbHJlYWR5IGhhdmUgMjogb25lIGluIHRoZSBwYXRjaCB3aXRoIHRoZSByYW5n
ZSBzZXQgcGVyIEJBUiBhbmQgb25lIGRlc2NyaWJlZA0KDQplYXJsaWVyIGluIHRoZSB0aHJlYWQg
d2l0aCBhIHNpbmdsZSByYW5nZSBzZXQgYW5kIGEgbGlzdCBmb3IgR0ZOIDwtPiBNRk4uDQoNCklm
IHlvdSBjYW4gdGVsbCB5b3VyIG9waW5pb24gSSBhbSBhbGwgZWFycy4gQnV0LCBwbGVhc2UgYmUg
c3BlY2lmaWMgYXMgY29tbW9uIHdvcmRzDQoNCmRvbid0IGNoYW5nZSBhbnl0aGluZyB0byBtZS4N
Cg0KQXQgdGhlIHNhbWUgdGltZSBJIGRvIHVuZGVyc3RhbmQgdGhhdCB0aGUgY3VycmVudCBjb2Rl
IGlzIG5vdCBzZXQgaW4gc3RvbmUsDQoNCmJ1dCB3ZSBzaG91bGQgaGF2ZSBhIGdvb2QgcmVhc29u
IGZvciBtYWpvciBjaGFuZ2VzIHRvIGl0LCBJTU8uIEkgbWVhbiB0aGF0IGJlZm9yZQ0KDQpEb21V
J3Mgd2Ugd2VyZSBmaW5lIHdpdGggdGhlIHJhbmdlIHNldHMgZXRjLCBhbmQgbm93IHdlIGFyZSBu
b3Q6DQoNCnNvIHdoYXQgaGFzIGNoYW5nZWQgc28gbXVjaD8NCg0KPiAgIEkgdGhpbmsgMyBpcyB0
aGUgd2F5IHRvIGludmVzdGlnYXRlDQo+IGZpcnN0OiBSYXRoZXIgdGhhbiBzdGFydGluZyBmcm9t
IHRoZSBjb2RlIHdlIGN1cnJlbnRseSBoYXZlLCBzdGFydCBmcm9tDQo+IHdoYXQgeW91IG5lZWQg
Zm9yIERvbVUtcyB0byB3b3JrLiBJZiB0aGVyZSdzIGVub3VnaCBvdmVybGFwIHdpdGggaG93IHdl
DQo+IGhhbmRsZSBEb20wLCBjb2RlIGNhbiBiZSBzaGFyZWQuDQoNCllvdSBjYW4gc2VlIHRoYXQg
aW4gbXkgcGF0Y2ggdGhlIHNhbWUgY29kZSBpcyB1c2VkIGJ5IGJvdGggaHdkb20gYW5kDQoNCmd1
ZXN0LiBXaGF0IGVsc2UgbmVlZHMgdG8gYmUgcHJvdmVuPyBUaGUgcGF0Y2ggc2hvd3MgdGhhdCBh
bGwgdGhlIGNvZGUNCg0KYmVzaWRlcyBndWVzdCByZWdpc3RlciBoYW5kbGVycyAod2hpY2ggaXMg
ZXhwZWN0ZWQpIGlzIGFsbCBjb21tb24uDQoNCj4gICBJZiB0aGluZ3MgYXJlIHN1ZmZpY2llbnRs
eSBkaWZmZXJlbnQsDQo+IHNlcGFyYXRlIGNvZGUgcGF0aHMgYXJlIGxpa2VseSBiZXR0ZXIuIEFz
IHNhaWQgLSB0byBtZSBhIGd1ZXN0IGFsdGVyaW5nIGENCj4gQkFSIGlzIG1lcmVseSBhIHZlcnkg
c3BlY2lhbCBmb3JtIG9mIGEgcmVxdWVzdCB0byBjaGFuZ2UgaXRzIFAyTS4gVGhlIE0NCj4gcGFy
dHMgcmVtYWlucyB1bmNoYW5nZWQgKHdoaWNoIGlzIHRoZSBtYWpvciBkaWZmZXJlbmNlIGZyb20g
RG9tMCksIHdoaWxlDQo+IHRoZSBQIHBhcnQgY2hhbmdlcy4gQXMgbG9uZyBhcyB5b3UgY2FuIGFz
c3VtZSBubyB0d28gQkFScyB0byBzaGFyZSBhIHBhZ2UsDQo+IHRoaXMgd291bGQgYXBwZWFyIHRv
IHN1Z2dlc3QgdGhhdCBpdCdzIHNpbXBseSBhIFAyTSBvcGVyYXRpb24gcGx1cyBib29rDQo+IGtl
ZXBpbmcgYXQgdGhlIHZQQ0kgbGF5ZXIuIENvbXBsZXRlbHkgZGlmZmVyZW50IGZyb20gRG9tMCBo
YW5kbGluZy4NCg0KVW5kZXJuZWF0aCwgeWVzLCBwb3NzaWJseS4gQnV0IGF0IHRoZSBsZXZlbCB2
UENJIG9wZXJhdGVzIHRoZXJlIGlzIG5vDQoNCnN1Y2ggZGlmZmVyZW5jZSBJIGNhbiBjbGVhcmx5
IHNlZSBpbiB2UENJIGNvZGUgYW5kIHRoZSBwYXRjaCBpbiBxdWVzdGlvbi4NCg0KUGxlYXNlIHBv
aW50IG1lIHRvIHRoZSB2UENJIGNvZGUgSSBmYWlsIHRvIHNlZS4NCg0KPg0KPiBBbGwgb2YgdGhp
cyBhcHBsaWVzIG9ubHkgd2l0aCBtZW1vcnkgZGVjb2RpbmcgZW5hYmxlZCwgSSBleHBlY3QuDQo+
IERpc2FibGluZyBtZW1vcnkgZGVjb2Rpbmcgb24gYSBkZXZpY2Ugb3VnaHQgdG8gYmUgYSBzaW1w
bGUgInVubWFwIGFsbA0KPiBCQVJzIiwgd2hpbGUgZW5hYmxpbmcgaXMgIm1hcCBhbGwgQkFScyIu
IFdoaWNoIGFnYWluIGlzLCBkdWUgdG8gdGhlDQo+IGFzc3VtZWQgbGFjayBvZiBzaGFyaW5nIG9m
IHBhZ2VzLCBtdWNoIHNpbXBsZXIgdGhhbiBvbiBEb20wOiBZb3Ugb25seQ0KPiBuZWVkIHRvIHN1
YnRyYWN0IHRoZSBNU0ktWCB0YWJsZSByYW5nZShzKSAoaWYgYW55LCBhbmQgcGVyaGFwcyBub3QN
Cj4gbmVjZXNzYXJ5IHdoZW4gdW5tYXBwaW5nLCBhcyB0aGVyZSdzIG5vdGhpbmcgd3JvbmcgdG8g
dW5tYXAgYSBQMk0gc2xvdA0KPiB3aGljaCB3YXNuJ3QgbWFwcGVkKTsgdGhpcyBtYXkgbm90IGV2
ZW4gcmVxdWlyZSBhbnkgcmFuZ2VzZXQgYXQgYWxsIHRvDQo+IHJlcHJlc2VudC4NCj4NCj4gQW5k
IGluIGZhY3QgSSB3b25kZXIgd2hldGhlciBmb3IgRG9tVS1zIHlvdSB3YW50IHRvIHN1cHBvcnQg
QkFSIGNoYW5nZXMNCj4gaW4gdGhlIGZpcnN0IHBsYWNlIHdoaWxlIG1lbW9yeSBkZWNvZGluZyBp
cyBlbmFibGVkLg0KDQpObywgd2h5PyBJIHdhbnQgdG8ga2VlcCB0aGUgZXhpc3RpbmcgbG9naWMs
IGUuZy4gd2l0aCBtZW1vcnkgZGVjb2RpbmcNCg0KZGlzYWJsZWQgYXMgaXQgaXMgbm93Lg0KDQo+
ICAgRGVwZW5kcyBtdWNoIG9uDQo+IGhvdyBxdWlya3kgdGhlIGd1ZXN0IE9TZXMgYXJlIHRoYXQg
b3VnaHQgdG8gcnVuIG9uIHRvcC4NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5k
cg0K

