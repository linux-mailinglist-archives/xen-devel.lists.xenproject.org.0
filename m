Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55F2D0CAC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45990.81575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCY7-0005Ob-M4; Mon, 07 Dec 2020 09:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45990.81575; Mon, 07 Dec 2020 09:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCY7-0005OF-I1; Mon, 07 Dec 2020 09:11:15 +0000
Received: by outflank-mailman (input) for mailman id 45990;
 Mon, 07 Dec 2020 09:11:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYzf=FL=epam.com=prvs=0610b02f0e=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1kmCY6-0005OA-05
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:11:14 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f9a3fe4-be7a-4bc7-b736-b3176ebd0089;
 Mon, 07 Dec 2020 09:11:12 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B79B4cX027477; Mon, 7 Dec 2020 09:11:07 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com with ESMTP id 3583jdjy4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 09:11:07 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5700.eurprd03.prod.outlook.com (2603:10a6:208:16f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 09:11:04 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::501:a686:7515:465e%9]) with mapi id 15.20.3632.018; Mon, 7 Dec 2020
 09:11:04 +0000
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
X-Inumbo-ID: 0f9a3fe4-be7a-4bc7-b736-b3176ebd0089
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8bHkUR1Z6chhQi/mAE/17Y9INbtRa/Xq4V4QqEujtAYz9BqvryYFZsHuz7dnZMIVM/k0q6WjPOFnUqyE6Q7ZQOJ48vqg9hoo7aisIjc3I4ddhNdOHU6vPJS3eIXciSjdYBWC1laqS9wfTEVg70LA7bHMbEV1XYXNuNo7TGahBHxwdVij4e++q6z0xu41bIyazo0Ml6Lag+NM4cm6sG8Qi7/kiTwKiSRI6Pcne/pH4P3HPm570f3BVHxAgQq8B2KmHzUhKN64D/PzEFj17uvTVOTgvggpVEfaJVk/VT968SlyG1pGaO5uoIvpsxdh72xNeTRIKsflF8cysnl0IWl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMZ/N49DrrxhTR+8FCsgdlxamziIgd/xJSAtrvvk0nE=;
 b=iZ7f/IoY1pL7ict6ZsOaLUzYyg5DbKEZIG3qehUAAHeKYhYI8PZBL4i0NW7k9k6JpaY+9O7sYp2Q9agFO4ecLJ2aLwgl9pjSis74Ca/k/U2+nPVKTxlIPjdasanL9YT9rIP1mHcauj5Lc3Fro4UA6w2ay1TC+72tb+tPI0gqpQvkgLyiNYTH18LLjRlXhbcxmqPfhWDqkjtEuug7/U3VREmOZLyywWxPVs9cuwHEeQwh3aTHHEEAn1Bh/ZwZcePNHicOhjdezpRhShgAXqpfJCxO7ZjPouVJINIX0a2r17Vv56NiUkJTKY18w4An8JA/voW9BFZ7ZTK6hg8r/X1MFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMZ/N49DrrxhTR+8FCsgdlxamziIgd/xJSAtrvvk0nE=;
 b=ajwzJeV0/kJUbRQT7nSGj2PWi+odNz35GvIMkhubAI/QY/isBZ9arlB/9UMXe8XgvAi9Rz25wpfmu6J4VLZKlIG5UnBcOc0z4uTTem+GlVL70BWFc2TbFM3kV8oW6Ik+xEWRaYd25K/xqUCbIxasdHIQ0/p/nGYex2MuDs9bzZTX4RKGvU92QgpqH8/Neqcn6Bx0xn8PsrqNK7nfiVWQrkkm1ut5XODKdRfodNI6PXT8cHFph6VVe0NrPlxdfwvpBx6j+4SZhvOKWaLiTF5E/2swHlZDBQIPCHwDdJgFQ98oGaQfIFjf5mgcyV88pzV9SdCN8ZMc8Q6Ve6Z+KgL+9g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <andr2000@gmail.com>,
        "Rahul.Singh@arm.com"
	<Rahul.Singh@arm.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "julien.grall@arm.com" <julien.grall@arm.com>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>, "wl@xen.org" <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Topic: [PATCH 06/10] vpci: Make every domain handle its own BARs
Thread-Index: 
 AQHWtpbzyJg77SbpvkSRWLKjWy/3PanEQmgAgAA8YoCAABlOgIABCD8AgABBOQCAAAXIAIAAAS0AgAADNgCAAAlOAIAAEnYAgAAcfoCAAAKRAIAAAYQAgAABxICAAAHUgIAg/YsAgARU+oCAAAZpgA==
Date: Mon, 7 Dec 2020 09:11:03 +0000
Message-ID: <8913ce50-1b51-36f6-36b6-7e09d9553df9@epam.com>
References: <20201109125031.26409-1-andr2000@gmail.com>
 <20201109125031.26409-7-andr2000@gmail.com>
 <20201112094002.bzk6gvp4iy4dgj4s@Air-de-Roger>
 <1b3f11c2-a5a2-da5c-25b3-851ef9465ab9@epam.com>
 <20201112144643.iyy5b34qyz5zi7mc@Air-de-Roger>
 <1fe15b9a-6f5d-1209-8ff5-af7c4fc0d637@epam.com>
 <b4697fbe-6896-ed64-409d-85620c08904a@suse.com>
 <3d6e5aab-ff89-7859-09c6-5ecb0c052511@epam.com>
 <1c88fef1-8558-fde1-02c7-8a68f6ecf312@suse.com>
 <67fd5df7-2ad2-08e5-294e-b769429164f0@epam.com>
 <03e23a66-619f-e846-cf61-a33ca5d9f0b4@suse.com>
 <b151e6d2-5480-d201-432a-bece208a1fd9@epam.com>
 <c58c1393-381a-d995-6e41-fa3251f67bd7@suse.com>
 <8fc22774-7380-2de1-9c30-6649a79fdfe1@epam.com>
 <46c75ee1-758c-8a42-d8d3-8d42cce3240a@suse.com>
 <66cb04c5-5e98-6a4d-da88-230b2dbc3d98@epam.com>
 <04059ce3-7009-9e1e-8ba2-398cc993d81b@suse.com>
 <802e20d8-82b6-5755-e6e5-aadb07585a32@epam.com>
 <b631c122-554c-e26e-4fa9-56809dd5569a@suse.com>
In-Reply-To: <b631c122-554c-e26e-4fa9-56809dd5569a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cae05862-3560-460b-ebb7-08d89a90061f
x-ms-traffictypediagnostic: AM0PR03MB5700:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5700AAC7D38C98821AA6B388E7CE0@AM0PR03MB5700.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YostjL52x2sUkcauGDzbb6AGmDiiSmlMW6N1ML2ilbzazJ0EGe2lCWosxvRLWzA3JqQSmc/n5ORgwK4TYywQMHNbJ/N1e4p9Td1WTm7ZK+iBJ1uL54iqc0/b3dhy4AyLQZ/c/W+Kurr4QNvb74CzFOAjp2HFE7dZux2JMNb8IyuHRQP7khmBs0tiy6P9SylU4s2Bwzpi7E/GTrBpnlUgm0N99PxSuM1v66V345r+JWylhH6d0eFFcBA7cYU9KGcoywDGHcDADsi/gh4CQzYt313KdtEqm/OPJd+yUDi5rvby0y2u25B0Jv3FPuoySUh9rQNvwGRkrW2vCA+tUZCSSLpqtuyvOs81aa+v4YzeRiWRBuuPRlTwSh9pJYA++Teg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(6916009)(31696002)(6512007)(53546011)(5660300002)(71200400001)(478600001)(66946007)(76116006)(54906003)(6506007)(31686004)(66446008)(83380400001)(66556008)(91956017)(66476007)(64756008)(186003)(8676002)(6486002)(7416002)(4326008)(36756003)(2616005)(26005)(316002)(2906002)(8936002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?LytLSGRsYk54UXRwVTAvSWI1c0xNNW9Ea1RKMGVxbFgrb094cWxIOVQ2ckl4?=
 =?utf-8?B?TExQcGlvRXVMRzZrTlVVZzZiMFg0b21CRStQWXlkSW1HUTlpbTZEYS9mSko4?=
 =?utf-8?B?NTJ3YkttMUZacVNzSVV6ait2V1N2dy8zRWtQalQ2TFdOeVkzN3BmSjFFNlgw?=
 =?utf-8?B?aG11STVhNUtYSkxxMnBlZzl5WTdhcFJEZ0ZiemcyNXFBQ1NlWE5XNG1SY1Jv?=
 =?utf-8?B?bE5vdzRxem9NRjJXVW05RkVzVnlnaXBYeEk0MG1NTTJPNldLWUFIU3lROEgy?=
 =?utf-8?B?MGlsNjRaZm9yQ2VtSks4dENaUStPTUNQZ3ZzRFl3V0dIL1dWWkJjZVloSlV3?=
 =?utf-8?B?dENqUlRGa05Tb1ZlaGdRUnRGZXMwTXhEd1JhUUhzTWpKTW9rN0VvTWVHMFpD?=
 =?utf-8?B?ZlFLdEV1QmhBY1BPbFhXWnZFYTJvdXdIN1RaVjhzV0QxbDJzcEVYUkRRUnhX?=
 =?utf-8?B?alV1RW9UZ3VIcjE2ZTEzMzBaVWVMVTBVbUpBQThoQ0tLVHNlMHFCY0NuMUhw?=
 =?utf-8?B?R0xPbk1CMFI2SmZrazdyanhPS3cvZHBjMUFXTUgrYm5yd1ZaZ0FUcGFPMlFq?=
 =?utf-8?B?b2hQSHZiT29WS0NxZk9OM2V5RTJ3TFZ6bHVZRnhEaksxQkNyKzhlcTR1UkVa?=
 =?utf-8?B?aWptdGduK2R5cWowb0VwSHorU1ZjZW82RVFnL0NBZzlrNDZwcStkUG1zV3l0?=
 =?utf-8?B?czlPeHNhdys5UVU4dEFuUmw4UlhrSEszWXRMTE9xT0VKbTBUdEw4ZER2SHlu?=
 =?utf-8?B?c2locnE5ZURqclR0OHNXWXR6OU1IcmhhV3l2cUtvN0QxaWNUNTA1TGQyZVBI?=
 =?utf-8?B?RUVXRjhvQ2d2aTNIdkhqcEI2cUFuZjVOckVRSS9EclF6OHExSm9xNW5Iellm?=
 =?utf-8?B?TWhwOStlMUNNRDRCZGJ4OXRCNVdlbHh5S00wa3NpaG5GR3pJOWREMFo0YTR6?=
 =?utf-8?B?c3hRU2xYSHYvTCtTLzNIRURZMWpORyt1ZXVlWVY5VnBTcldldjJiYWZ2Tno0?=
 =?utf-8?B?WDh5aVAwNm42RmgwQVhuQUV4UG1yOUZSUnFHVWkxMFdZTllVbWRZUnQ1UXVa?=
 =?utf-8?B?SjNwUXM3eUZLYmlZYnd3NTdhdUw4dXRrNzRnUTNxSTlUb3VITWhQS3pxd2lu?=
 =?utf-8?B?ZVBrVnYvbGdpMGd3ci8yUHNKSXBTSmg3aEU5SG1LNjJxVFZHZjdwSXdjRzVr?=
 =?utf-8?B?d2V3Yzc3K1ErM0d0S2IrK2dvYWd0bW83cStCUnNtdGZpSkovT1Vyemd1V1Iz?=
 =?utf-8?B?azg1WklvRjlTNEIrTlIxRkdnNWxqWnVSOExRRyttc2t6OWlRZ2RQd2NrRmUx?=
 =?utf-8?Q?22ZoAOKv63OChM5Ru7KVHKp/xUa1065w/X?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AB90E9BA0159D49BDF0323C310AD727@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae05862-3560-460b-ebb7-08d89a90061f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 09:11:04.0294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GzyJR4Nf1uvLvFQoGXPsHqkV3O8JYb1ik0//73SKgBYYIfw4ZHhf0z9spiGzZUHe3Z+tPhov7Z6QQiDWB6PCU14baOHZUI5Y3urVnltf1aaiuyK/kBgnyHElRwFa5sBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5700
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-07_08:2020-12-04,2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=782
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070059

DQpPbiAxMi83LzIwIDEwOjQ4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMTIuMjAy
MCAxNTozOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMS8xMy8yMCA0
OjUxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAxMy4xMS4yMDIwIDE1OjQ0LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMTEvMTMvMjAgNDozOCBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAxMy4xMS4yMDIwIDE1OjMyLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBPbiAxMS8xMy8yMCA0OjIzIFBNLCBKYW4gQmV1bGlj
aCB3cm90ZToNCj4+Pj4+Pj4gICAgICBFYXJsaWVyIG9uIEkgZGlkbid0IHNheSB5b3Ugc2hvdWxk
IGdldCB0aGlzIHRvIHdvcmssIG9ubHkNCj4+Pj4+Pj4gdGhhdCBJIHRoaW5rIHRoZSBnZW5lcmFs
IGxvZ2ljIGFyb3VuZCB3aGF0IHlvdSBhZGQgc2hvdWxkbid0IG1ha2UNCj4+Pj4+Pj4gdGhpbmdz
IG1vcmUgYXJjaCBzcGVjaWZpYyB0aGFuIHRoZXkgcmVhbGx5IHNob3VsZCBiZS4gVGhhdCBzYWlk
LA0KPj4+Pj4+PiBzb21ldGhpbmcgc2ltaWxhciB0byB0aGUgYWJvdmUgc2hvdWxkIHN0aWxsIGJl
IGRvYWJsZSBvbiB4ODYsDQo+Pj4+Pj4+IHV0aWxpemluZyBzdHJ1Y3QgcGNpX3NlZydzIGJ1czJi
cmlkZ2VbXS4gVGhlcmUgb3VnaHQgdG8gYmUNCj4+Pj4+Pj4gREVWX1RZUEVfUENJX0hPU1RfQlJJ
REdFIGVudHJpZXMgdGhlcmUsIGFsYmVpdCBhIG51bWJlciBvZiB0aGVtDQo+Pj4+Pj4+IChwcm92
aWRlZCBieSB0aGUgQ1BVcyB0aGVtc2VsdmVzIHJhdGhlciB0aGFuIHRoZSBjaGlwc2V0KSBhcmVu
J3QNCj4+Pj4+Pj4gcmVhbGx5IGhvc3QgYnJpZGdlcyBmb3IgdGhlIHB1cnBvc2VzIHlvdSdyZSBh
ZnRlci4NCj4+Pj4+PiBZb3UgbWVhbiBJIGNhbiBzdGlsbCB1c2UgREVWX1RZUEVfUENJX0hPU1Rf
QlJJREdFIGFzIGEgbWFya2VyDQo+Pj4+Pj4NCj4+Pj4+PiB3aGlsZSB0cnlpbmcgdG8gZGV0ZWN0
IHdoYXQgSSBuZWVkPw0KPj4+Pj4gSSdtIGFmcmFpZCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCBt
YXJrZXIgeW91J3JlIHRoaW5raW5nIGFib3V0DQo+Pj4+PiBoZXJlLg0KPj4+PiBJIG1lYW4gdGhh
dCB3aGVuIEkgZ28gb3ZlciBidXMyYnJpZGdlIGVudHJpZXMsIHNob3VsZCBJIG9ubHkgd29yayB3
aXRoDQo+Pj4+DQo+Pj4+IHRob3NlIHdobyBoYXZlIERFVl9UWVBFX1BDSV9IT1NUX0JSSURHRT8N
Cj4+PiBXZWxsLCBpZiB5b3UncmUgYWZ0ZXIgaG9zdCBicmlkZ2VzIC0geWVzLg0KPj4+DQo+Pj4g
SmFuDQo+PiBTbywgSSBzdGFydGVkIGxvb2tpbmcgYXQgdGhlIGJ1czJicmlkZ2UgYW5kIGlmIGl0
IGNhbiBiZSB1c2VkIGZvciBib3RoIHg4NiAoYW5kIHBvc3NpYmxlIEFSTSkgYW5kIEkgaGF2ZSBh
bg0KPj4NCj4+IGltcHJlc3Npb24gdGhhdCB0aGUgb3JpZ2luYWwgcHVycG9zZSBvZiB0aGlzIHdh
cyB0byBpZGVudGlmeSB0aGUgZGV2aWNlcyB3aGljaCB4ODYgSU9NTVUgc2hvdWxkDQo+Pg0KPj4g
Y292ZXI6IGUuZy4gSSBhbSBsb29raW5nIGF0IHRoZSBmaW5kX3Vwc3RyZWFtX2JyaWRnZSB1c2Vy
cyBhbmQgdGhleSBhcmUgeDg2IElPTU1VIGFuZCBWR0EgZHJpdmVyLg0KPj4NCj4+IEkgdHJpZWQg
dG8gcGxheSB3aXRoIHRoaXMgb24gQVJNLCBhbmQgZm9yIHRoZSBIVyBwbGF0Zm9ybSBJIGhhdmUg
YW5kIFFFTVUgSSBnb3QgMCBlbnRyaWVzIGluIGJ1czJicmlkZ2UuLi4NCj4+DQo+PiBUaGlzIGlz
IGJlY2F1c2Ugb2YgaG93IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOmFsbG9jX3BkZXYg
aXMgaW1wbGVtZW50ZWQgKHdoaWNoIGxpdmVzIGluIHRoZQ0KPj4NCj4+IGNvbW1vbiBjb2RlIEJU
VywgYnV0IHNlZW1zIHRvIGJlIHg4NiBzcGVjaWZpYyk6IHNvLCBpdCBza2lwcyBzZXR0aW5nIHVw
IGJ1czJicmlkZ2UgZW50cmllcyBmb3IgdGhlIGJyaWRnZXMgSSBoYXZlLg0KPiBJJ20gY3VyaW91
cyB0byBsZWFybiB3aGF0J3MgeDg2LXNwZWNpZmljIGhlcmUuIEkgYWxzbyBjYW4ndCBkZWR1Y2UN
Cj4gd2h5IGJ1czJicmlkZ2Ugc2V0dXAgd291bGQgYmUgc2tpcHBlZC4NCg0KU28sIGZvciBleGFt
cGxlOg0KDQpjb21taXQgMGFmNDM4NzU3ZDQ1NWY4ZWI2YjVhNmFlOWE5OTBhZTI0NWYyMzBmZA0K
QXV0aG9yOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQu
Y29tPg0KRGF0ZTrCoMKgIEZyaSBTZXAgMjcgMTA6MTE6NDkgMjAxMyArMDIwMA0KDQogwqDCoMKg
IEFNRCBJT01NVTogZml4IERvbTAgZGV2aWNlIHNldHVwIGZhaWx1cmUgZm9yIGhvc3QgYnJpZGdl
cw0KDQogwqDCoMKgIFRoZSBob3N0IGJyaWRnZSBkZXZpY2UgKGkuZS4gMHgxOCBmb3IgQU1EKSBk
b2VzIG5vdCByZXF1aXJlIElPTU1VLCBhbmQNCiDCoMKgwqAgdGhlcmVmb3JlIGlzIG5vdCBpbmNs
dWRlZCBpbiB0aGUgSVZSUy4gVGhlIGN1cnJlbnQgbG9naWMgdHJpZXMgdG8gbWFwDQogwqDCoMKg
IGFsbCBQQ0kgZGV2aWNlcyB0byBhbiBJT01NVS4gSW4gdGhpcyBjYXNlLCAieGwgZG1lc2ciIHNo
b3dzIHRoZQ0KIMKgwqDCoCBmb2xsb3dpbmcgbWVzc2FnZSBvbiBBTUQgc3l0ZW0uDQoNCiDCoMKg
wqAgKFhFTikgc2V0dXAgMDAwMDowMDoxOC4wIGZvciBkMCBmYWlsZWQgKC0xOSkNCiDCoMKgwqAg
KFhFTikgc2V0dXAgMDAwMDowMDoxOC4xIGZvciBkMCBmYWlsZWQgKC0xOSkNCiDCoMKgwqAgKFhF
Tikgc2V0dXAgMDAwMDowMDoxOC4yIGZvciBkMCBmYWlsZWQgKC0xOSkNCiDCoMKgwqAgKFhFTikg
c2V0dXAgMDAwMDowMDoxOC4zIGZvciBkMCBmYWlsZWQgKC0xOSkNCiDCoMKgwqAgKFhFTikgc2V0
dXAgMDAwMDowMDoxOC40IGZvciBkMCBmYWlsZWQgKC0xOSkNCiDCoMKgwqAgKFhFTikgc2V0dXAg
MDAwMDowMDoxOC41IGZvciBkMCBmYWlsZWQgKC0xOSkNCg0KIMKgwqDCoCBUaGlzIHBhdGNoIGFk
ZHMgYSBuZXcgZGV2aWNlIHR5cGUgKGkuZS4gREVWX1RZUEVfUENJX0hPU1RfQlJJREdFKSB3aGlj
aA0KIMKgwqDCoCBjb3JyZXNwb25kcyB0byBQQ0kgY2xhc3MgY29kZSAweDA2IGFuZCBzdWItY2xh
c3MgMHgwMC4gVGhlbiwgaXQgdXNlcw0KIMKgwqDCoCB0aGlzIG5ldyB0eXBlIHRvIGZpbHRlciB3
aGVuIHRyeWluZyB0byBtYXAgZGV2aWNlIHRvIElPTU1VLg0KDQpPbmUgb2YgbXkgdGVzdCBzeXN0
ZW1zIGhhcyBERVZfVFlQRV9QQ0lfSE9TVF9CUklER0UsIHNvIGJ1czJicmRpZ2Ugc2V0dXAgaXMg
aWdub3JlZA0KDQo+DQo+PiBUaGVzZSBhcmUgREVWX1RZUEVfUENJZV9CUklER0UgYW5kIERFVl9U
WVBFX1BDSV9IT1NUX0JSSURHRS4gU28sIHRoZSBhc3N1bXB0aW9uIEkndmUgbWFkZSBiZWZvcmUN
Cj4+DQo+PiB0aGF0IEkgY2FuIGdvIG92ZXIgYnVzMmJyaWRnZSBhbmQgZmlsdGVyIG91dCB0aGUg
Im93bmVyIiBvciBwYXJlbnQgYnJpZGdlIGZvciBhIGdpdmVuIHNlZzpidXMgZG9lc24ndA0KPj4N
Cj4+IHNlZW0gdG8gYmUgcG9zc2libGUgbm93Lg0KPj4NCj4+IEV2ZW4gaWYgSSBmaW5kIHRoZSBw
YXJlbnQgYnJpZGdlIHdpdGggeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmM6ZmluZF91cHN0
cmVhbV9icmlkZ2UgSSBhbSBub3Qgc3VyZQ0KPj4NCj4+IEkgY2FuIGdldCBhbnkgZnVydGhlciBp
biBkZXRlY3Rpbmcgd2hpY2ggeDg2IGRvbWFpbiBvd25zIHRoaXMgYnJpZGdlOiB0aGUgd2hvbGUg
aWRlYSBpbiB0aGUgeDg2IGNvZGUgaXMNCj4+DQo+PiB0aGF0IERvbWFpbi0wIGlzIHRoZSBvbmx5
IHBvc3NpYmxlIG9uZSBoZXJlICh5b3UgbWVudGlvbmVkIHRoYXQpLg0KPiBSaWdodCAtIHlvdXIg
YXR0ZW1wdCB0byBmaW5kIHRoZSBvd25lciBzaG91bGQgX3JpZ2h0IG5vd18gcmVzdWx0IGluDQo+
IGdldHRpbmcgYmFjayBEb20wLCBvbiB4ODYuIEJ1dCB0aGVyZSBzaG91bGRuJ3QgYmUgYW55IHN1
Y2ggYXNzdW1wdGlvbg0KPiBpbiB0aGUgbmV3IGNvbnN1bWVyIG9mIHRoaXMgZGF0YSB0aGF0IHlv
dSBtZWFuIHRvIGludHJvZHVjZS4gSS5lLiBJDQo+IG9ubHkgZGlkIHN1Z2dlc3QgdGhpcyB0byBh
dm9pZCAuLi4NCj4NCj4+IFNvLCBJIGRvdWJ0IGlmIHdlIGNhbiBzdGlsbCBsaXZlIHdpdGgNCj4+
DQo+PiBpc19oYXJkd2FyZV9kb21haW4gZm9yIG5vdyBmb3IgeDg2Pw0KPiAuLi4gaGFyZC1jb2Rp
bmcgaW5mb3JtYXRpb24gd2hpY2ggY2FuIGJlIHByb3Blcmx5IGVzdGFibGlzaGVkIC8NCj4gcmV0
cmlldmVkLg0KPg0KPiBKYW4=

