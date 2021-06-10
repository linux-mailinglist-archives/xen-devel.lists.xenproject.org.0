Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB53A2B77
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 14:25:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139885.258561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJkX-0000pz-Up; Thu, 10 Jun 2021 12:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139885.258561; Thu, 10 Jun 2021 12:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJkX-0000nY-Qk; Thu, 10 Jun 2021 12:25:29 +0000
Received: by outflank-mailman (input) for mailman id 139885;
 Thu, 10 Jun 2021 12:25:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVv/=LE=epam.com=prvs=679567fbaa=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lrJkV-0000nS-QY
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 12:25:27 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d286d98-cfce-464e-b9ad-4b5eea399310;
 Thu, 10 Jun 2021 12:25:26 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ACA6br007232; Thu, 10 Jun 2021 12:25:25 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 393j8fr405-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 12:25:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 10 Jun
 2021 12:25:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%6]) with mapi id 15.20.4195.031; Thu, 10 Jun 2021
 12:25:22 +0000
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
X-Inumbo-ID: 3d286d98-cfce-464e-b9ad-4b5eea399310
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IK99l+YSQ7utnUZlX5MHTcHiwUGFdWuOCb7A3uXYFjMVi5Ks2UmSOCJCSaMa0EnHPTyFalBpJ80gs1e5h3E5KtqdRrJqqSunXv5OoYzLquehhtlvZcLBQXzNYfwnsnXdR2WNxpaUyfKZiF3LfFPtAOhD6K34K834TTsB41d1g/i7ai38tTVW37/TD1nRo6QKlBy/NJO/CLdiqmr+NYdA3+hKelcxYsqZW36dj+lgVNAXbMRUsNpGfrSH44NqUM1eEvRaBgE2caD3+e/SFHB7FD1qk0FmtEfR5OKGFGaxS1gvr5kfZh4DAJBFrhPqQdUAolUiajxEChbh13bpxRMQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD3e62QSq06Qs6mZwDP6esjNvXLbwMv7H7AFGC4dZJI=;
 b=g0/BpcPtLTB86HgLxpSdXgDoTLKgjH0Ss17qpJtYFwAy7hsMiUXyoi3GX3sYr7SXEOrXWjMhN5R3V+LJtnwRHUOObV4Put/DSmMvyohxPLUZ/xmyg5VJ0xm5Sh91COG/KhwehjI9slagVVP2mxJ5yBzUvdbHKE4ULYuBu4OHH0RGfSQTmAncgS0DoLD6msyqxqRMOBAoEboYp5i+uV8C3aTUDkYGpMMawpKClBhK/ojgexeU/n2Nt3m3oa3gQIuk3hzKyZfgNt8/x09uRWrClqWkCvyo2u6iRgMwU+/N0Tto0IZ7vaIUf1N0q6lTVqRi40CzZQoaXHVpDo8tI4CXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SD3e62QSq06Qs6mZwDP6esjNvXLbwMv7H7AFGC4dZJI=;
 b=XIe3bm5x7kiQ+8Urk3wDnqgvivUnpsZvCI8VAaQI9G/pByMe0zwrreZidNH/QqL6OeTm/kvW1ic/EH6e9bhDjvbg+h+jKlNGOsqzdMvTqxmLUlC73ei5ZgCaPb8TuMtUylSP+UeYvgG2JvJrFYk7tizP3tCiyosN96AqltgJ6QerSuXZLx1KhyaWP4KqN5F+ljBXpllNOqL4Wt4FGbgd0bJ9/nbX/1StZL+g+EkYBJpNUE0dNmkGomLQAXMJDpsjsGesWbYXuGvPTK2wCgT1VH8r1FtfLRwk7jHuYjEwU9jQ92ZhcGJ0tkb1Q26gfiP3S9K73nYoJyWGtM7d0FoyoQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: 
 AQHXWQwW/O3obtZgqkmpGRvt7ZNDkasM6aMAgAAjXoCAAA0jAIAAEBMAgAAEiwCAAAaCgA==
Date: Thu, 10 Jun 2021 12:25:22 +0000
Message-ID: <1bfb4b75-c70a-ea79-1cc7-f5543077c52e@epam.com>
References: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
 <YMHFQA1L61ntKNRq@Air-de-Roger>
 <30955a5b-ee46-60d7-ae56-23dc7c91008c@epam.com>
 <0aa4bf61-e08f-6da0-1cda-48e61bf876af@suse.com>
 <38cfe7b7-e5a3-2216-f52e-fdebfc7af517@epam.com>
 <6b6142fa-3dc7-cd54-a40c-d4b9ef47afad@suse.com>
In-Reply-To: <6b6142fa-3dc7-cd54-a40c-d4b9ef47afad@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e541ef1-0e48-4b90-c44b-08d92c0ad18e
x-ms-traffictypediagnostic: AM0PR03MB6324:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6324B14FBE5AD36B334FAFD5E7359@AM0PR03MB6324.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QjISlUq8xxXLYPm9asHseTWaZWstvATrLEdxLfZY1NoJkZkD/r4Y2yMT3M4j/AGXSe/QK7AoFpS6/dFCv1TF5xa6/9I2yQ9cQM/pTQjBt6ZKTxb1CX8CAUlOnqjr52CuAY079HyTiTSm3q9PkuyPGlyxrBW/fUxMDW3bTVa0gxyZ+T2T+AhSxvDOKPD25U74PkECl60NDo2ulWZ1s7AhjdUmXunnuCllh0LzYyiFr1dYO4OFuyVrBWxWKoRjR/3UmESJNH0xU4sCL6MRlrEIij9/ivJJ4VKQBcMlRiUkNWowMXPjsCz1cpzeCFybV6ElOqWwVyW4gD/3hMM60dOHKojFnAWfqRzCYK1wEGbRWh2stOoKJQvVp2tZnbJNENn67I/ES36myyFHr8eO/hC8LV+NeieRa+A/RKtT5yWRsnJLEtfGfI5RWvr0OpZGA0Bh2LKiqdnyYkjLW1C2fFZg9LwQulmIJ6oiAXHh6VdGUbf73sm2RGpB5g07s2Z3gg0+gXT/mGhDj2agS5+1SCueSbDnKIfxXvVZ7AjcKzZtX7ZGZGWd3/BeulB42stvuphmo/K2O0fD/dbI6Y8CvBBqi0b98A8r67qPIZ9r66CbaboT8zFYy7J2PVzZmltBzk4ZXGTfh7sBFRSJxwC5lvOF6mhYG7/YgIoquzujTDvkpRu0SF3M+rb5jlDcy4j7Ep6yDaskku2+cd6R+ETOQs1m4UDH/UwkNP83nwnnLQyyvIu8LxZIgEP3SFyyfxzSjggz44rGgvX9jdrKMP3QZh50xUugsTRPQFxwY/zDRZ5KWlF6pXnVq5H7h/HdrPuspxua
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(4326008)(71200400001)(2616005)(316002)(54906003)(31696002)(86362001)(36756003)(31686004)(186003)(6506007)(966005)(26005)(83380400001)(6486002)(122000001)(38100700002)(5660300002)(66476007)(6512007)(6916009)(64756008)(66556008)(66446008)(8936002)(8676002)(76116006)(66946007)(2906002)(91956017)(478600001)(53546011)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RGVWZDFldmF1WHhOZDFFMmRDUVhzeEJZdFpSYzA1aGN2eTJvanREVjlPWmt6?=
 =?utf-8?B?ZGRjc3RiODFueGVKSEFGRDRuYVJzSkk1eUhyRzhSekJoUzVQa3hHTVQrU0Y0?=
 =?utf-8?B?WS8yS3dzeENOT3A0YWRQVkEzRGN2ZHhNa2tKY3JMYnJyRHd4OHJnZjl2dGcy?=
 =?utf-8?B?R2pkK0dPT3ZkNDBBcU00cHp3OTBsRzd3cmNpdWN5ejFoUVVzZndlRElUNzVk?=
 =?utf-8?B?Zm5oOS9GT1NNUXFvenQ0WlVDN2E2M0lZZ2cybmxVUXZSOFd6ZlJjUTllR21I?=
 =?utf-8?B?YnpSOGJJUFFWTTU1RlQxWVhpWnluUWp1RGFPNjdqRlYrZldZZ2ZqVkJ0SFNK?=
 =?utf-8?B?WVc2eFkwRWRMWmZoMmp0elZmVmNickhNNGdvSjY5Yk5XWE9KT0djdDRxanYr?=
 =?utf-8?B?bW5uaWZrM2ZhK0VCMW5UUFhwOU5XRS9XSkFhbDF4SFYwNjRuQ3NzUlVaM0hn?=
 =?utf-8?B?SHlQUnNIczlycEJiQlNkMEhERXNrRzZZc2QvTjZWaHI2QWJ2QzhzcEsvcTV3?=
 =?utf-8?B?NWVUcVJ5cGRJZkt4cnhKNUdiVnNJb1YvNUdNRHpWZHZhc2NxRUtWcmtjZXZk?=
 =?utf-8?B?SFE1NkNrbW5GUnBGWnM1eXpCSlFZZXRQMVRxb0ZwcHBOTGN2azlGL1M0d0t4?=
 =?utf-8?B?Q2F2bTRNYWxxekIydzlCbXVWWlNpeFhXZVhJOFg2czhnQzNLY0NxUFhuNTh1?=
 =?utf-8?B?b1hVZ1J4UjNPNzk5ajZSbk9jUXBpUDFDY0RNSGNIaEJqWnUrdG0yOXhkaVl1?=
 =?utf-8?B?dld6MEJnaDV6dG9rUUQ3UFJ4eUYvT0lsRzZwK2N5VmhsZEFqNW90MTVXS2ty?=
 =?utf-8?B?V0RMNk85UTdzZFRKdW5HVHdxZlh6aVNIRUFPbllRRHMyWTFzalphcndjditZ?=
 =?utf-8?B?eUVRUXk0WUZDZlV2V2txVXRpS0RwVjYyMEpGK2pjSUxkdWFkN001TlY1Z2ps?=
 =?utf-8?B?Z1hLVERuMHhaU3RLVHZwNVR4RVFEVTNyb0o3R3o5MzlJd2pXVGdidlVlSm9G?=
 =?utf-8?B?UE9lSUFscnJZR2N3L0liYzIrOWV6ZnJjOWxtSlJ6Q01wM2RBTi9GMzVTU1hn?=
 =?utf-8?B?c0hIWlZRUmZhN1VBWU91SVZsYVJ4NW14WVFhMmJ0bEJlaE1ORmtXQlNUbDlG?=
 =?utf-8?B?elJiNHMxcDN6YnhwOXZ6WkdVQzRvT2UzRkhwaHhVM01JR1JQajJQakhsWlBL?=
 =?utf-8?B?OU54VzFVN1lpV1Q4ZEgrcURmUVcyLzYwVEtBOVNsUHFNL20rOEkzQzhqWUg0?=
 =?utf-8?B?SFVvV0pmSnUzaVUwUmQ5VUdHRHBSWmRPVVVkSE9kSXY5dXdrNlRwSFMxT1l3?=
 =?utf-8?B?a25nVm8xdHNHcFpsMkdiNGdQSVkycG4wQUNDdE9DREFsMEJVdm1aa3d2MVZ2?=
 =?utf-8?B?NXNqSk1oOE9ZenFXS0lSUDRXRlB2M1FWY2FaeUFLOXcxczhjYWsrbndqTkNz?=
 =?utf-8?B?cXdqWkt6Z3ZKZ0RlKzR0YmVMOW9YWEhLSGhMQXl6TS83Y1c2MWE0T0MwTkt0?=
 =?utf-8?B?aVdMd3VyS1VPVTJRZmt0RUZJb3hJdnZLZTJXbi93VUpFQ0w5QXNaYXI1U0Nh?=
 =?utf-8?B?blFkZmtFazdLMkY0UzI5cCtyZHZSd0FoQW1WbkdvWWdTOUZvMzJwcHp3ZFRM?=
 =?utf-8?B?NjlYOW9XWHkvb3VPZkNaa1hvQjZLbWRwRmpYV2tIMGVZN3JtbmNEWWdBaUND?=
 =?utf-8?B?NmY5UVRFNDJmb0dNQS96SDM3MXRLOHNuWDltMlhjUUlGc1J2L0M5clUycDZy?=
 =?utf-8?Q?MsSUsNx84DgLi9vpXq0fYf2orzcPFPudeviEeQf?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F6E985C78735CF4B9ACB739CFDC37BF4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e541ef1-0e48-4b90-c44b-08d92c0ad18e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 12:25:22.5271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0LekxDpVmRe+pK4oVAy5rO/XcC7O/xgMA1DPvnX8b60dsjm4yX2zMdE5Y88t+4sFyCZH9IoPWSzTXVemzci7YruxPqseawG8OBvyyI/L80gSciiMfd12q9qGwo32GPZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6324
X-Proofpoint-GUID: Xk3SioopToh4-fkDcSEanYxy9BrKlgue
X-Proofpoint-ORIG-GUID: Xk3SioopToh4-fkDcSEanYxy9BrKlgue
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100080

DQpPbiAxMC4wNi4yMSAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEwLjA2LjIwMjEg
MTM6NDUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gSGksIEphbiENCj4+DQo+
PiBPbiAxMC4wNi4yMSAxMzo0OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTAuMDYuMjAy
MSAxMjowMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDEwLjA2LjIx
IDEwOjU0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT1RPSCBpZiB3ZSBwcm9wZXJs
eSB0cmFwIGFjY2Vzc2VzIHRvIHRoZSBTUi1JT1YgY2FwYWJpbGl0eSAobGlrZSBpdA0KPj4+Pj4g
d2FzIHByb3Bvc2VkIGluIFsxXSBmcm9tIHlvdXIgcmVmZXJlbmNlcykgd2Ugd29uJ3QgaGF2ZSB0
byBtb2RpZnkgT1Nlcw0KPj4+Pj4gdGhhdCB3YW50IHRvIHJ1biBhcyBoYXJkd2FyZSBkb21haW5z
IGluIG9yZGVyIHRvIGhhbmRsZSBTUi1JT1YgZGV2aWNlcy4NCj4+Pj4gT3V0IG9mIGN1cmlvc2l0
eSwgY291bGQgeW91IHBsZWFzZSBuYW1lIGEgZmV3PyBJIGRvIHVuZGVyc3RhbmQgdGhhdA0KPj4+
Pg0KPj4+PiB3ZSBkbyB3YW50IHRvIHN1cHBvcnQgdW5tb2RpZmllZCBPU2VzIGFuZCB0aGlzIGlz
IGluZGVlZCBpbXBvcnRhbnQuDQo+Pj4+DQo+Pj4+IEJ1dCwgc3RpbGwgd2hhdCBhcmUgdGhlIG90
aGVyIE9TZXMgd2hpY2ggZG8gc3VwcG9ydCBYZW4gKyBQQ0kgcGFzc3Rocm91Z2g/DQo+Pj4gSSB0
aGluayBSb2dlciBzYXlpbmcgIndhbnQiIG1lYW50IHRvIGNvdmVyIG9uZXMgd2hpY2ggY3VycmVu
dGx5IGRvbid0LA0KPj4+IGFuZCB3aGljaCB3b3VsZCBoYXZlIHRvIHVuZGVyZ28gbW9yZSBleHRl
bnNpdmUgY2hhbmdlcyBpZiB0aGV5IHdlcmUgdG8NCj4+PiBiZSBlbmFibGVkLg0KPj4gRmFpciBl
bm91Z2guIERvIHlvdSB0aGluayB3ZSB3b3VsZCBhbHNvIG5lZWQgdG8gcmUtd29yayB0aGUgZXhp
c3RpbmcgY29kZQ0KPj4NCj4+IGluIFhlbiB0byBzdXBwb3J0IG5vcm1hbCBkZXZpY2VzIChub3Qg
U1ItSU9WKSwgZS5nLiB3ZSBjdXJyZW50bHkgcmVseSBvbg0KPj4NCj4+IFBIWVNERVZPUF9YWFgg
YW5kIG90aGVyIExpbnV4IHNwZWNpZmljcy4NCj4gWWVzLCB3b3JrIGluIHRoYXQgYXJlYSB3b3Vs
ZCBhbHNvIGJlIG5lZWRlZC4gRm9yIGV4YW1wbGUgd2UnZCBuZWVkIHRvDQo+IHNjYW4gYnVzZXMg
LyBzZWdtZW50cyBhcyB0aGV5IGJlY29tZSBhY2Nlc3NpYmxlLiBSaWdodCBub3cgd2Ugb25seSBz
Y2FuDQo+IHNlZ21lbnQgMCwgYW5kIGV2ZW4gdGhhdCdzIG9ubHkgcG9zc2libGUgYmVjYXVzZSBv
biB4ODYgbW1jb25maWcgaXMgbm90DQo+IHRoZSBvbmx5IHdheSB0byBhY2Nlc3MgY29uZmlnIHNw
YWNlLg0KPg0KPj4gQW5kIGV2ZW4gaWYgU1ItSU9WIGlzIGltcGxlbWVudGVkDQo+Pg0KPj4gaW4g
WGVuIHRoaXMgd29uJ3QgYWxsb3cgdGhvc2UgT1NlcyB0byBzdGF5IHVubW9kaWZpZWQsIGluY2x1
ZGluZyBGcmVlQlNELg0KPiBPZiBjb3Vyc2UsIGl0J3MgdGhlIG5hdHVyZSBvZiBQVkggKGFzIG9w
cG9zZWQgdG8gSFZNKSB0aGF0IE9TZXMgbmVlZA0KPiBtb2RpZmljYXRpb24uIFRoZSBxdWVzdGlv
biBpcyB0aGUgc2NvcGUgdGhlcmVvZi4NCg0KT2ssIHRoZW4gaXQgc2VlbXMgSSBuZWVkIHRvIGdl
dCBbMV0gYmFjayBpbnRvIHRoZSBwaWN0dXJlLg0KDQpJIGhhdmUgbW9kaWZpZWQgdlBDSSBjb2Rl
IGEgbG90IGZvciBBUk0gc3VwcG9ydCwgc28gWzFdIHdpbGwgbm90IGFwcGx5DQoNCmFzIGlzIGFu
eW1vcmUgYW5kIG5lZWRzIHRvIGJlIHJlLXdvcmtlZC4gQnV0LCBzdGlsbCBpdCBjYW4gbW9zdGx5
IGJlIHJlLXVzZWQNCg0KDQo+IEphbg0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg0KWzFd
IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OC0wNy9tc2cwMTQ5NC5odG1sDQo=

