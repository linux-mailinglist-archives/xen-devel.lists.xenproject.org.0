Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2804190A7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196489.349353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlqL-0004p4-Ha; Mon, 27 Sep 2021 08:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196489.349353; Mon, 27 Sep 2021 08:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlqL-0004mg-EB; Mon, 27 Sep 2021 08:18:33 +0000
Received: by outflank-mailman (input) for mailman id 196489;
 Mon, 27 Sep 2021 08:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Nw=OR=epam.com=prvs=9904516479=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mUlqK-0004lH-1S
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:18:32 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f33f8b8-1f6b-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 08:18:30 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R8EMtb022497; 
 Mon, 27 Sep 2021 08:18:27 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bba91g0dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Sep 2021 08:18:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2196.eurprd03.prod.outlook.com (2603:10a6:200:4d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Mon, 27 Sep
 2021 08:18:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:18:22 +0000
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
X-Inumbo-ID: 7f33f8b8-1f6b-11ec-bc42-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9Z8C0HWR5W67PjFtMGl2UFRK9PxwAu6zzfGitZ2TAs4OuR0OzMs8cLoImBRGone6qWnHsa2lk02ku6MYzftblQFmwu1eobXqhL9hgGPvKihZ8NLJIUzNXJvjTpbb/nvDt/giem6SDZviYoCfCSfMACbb7S++ChdHNE/P3mo10MCzLHYYEV0weE57Tib/y1/ihTOkCXhKgvywwl1ZNuSsvXd9KGCGaf7XpVyBD6Okm+jy6u1I5CzsfYvuyk0oi+O1HscFta3JMqDNpcgqarK151T0NvchhpXsAC+krsWuQ3B2CtrIZQ+jE13W1W3fcQV4SFVvbQICJJvm/q5Bvp8Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=krYohFNs8smbKXzf1DrxvP6rw7g3WhfrIED2O9IS+j8=;
 b=IbUW0QR7LcaaV6gn+bx646EB2mSjUagqBkYJeC8gWs5XuFRLAF41oGNSXd9FLwmfVOGnIjvQtvEpDNvLjkvsl8MbgJ25QbLEZl7GBqoM7rcalskKJJhIxefLgNVtPtMRC+FNh1cwuTHtGT6GmdoBcZQ58hKV+RqJMrLDit9SyuZ6LhZgwUU5yn7V1fIbG6PY6DnSmvuq20t2v2acMOGS+dDLHpQDmnRk1zTiAD+QhvA9EtglADMmstqnZmeSXRq/pe5th+HvfZCZIQmp59DQA0aA0F8G5iP4UVvpQxGPEu24nMGLNLN9ReQsdRDKxon6oCWBE/PvwLND8x4ZTn5iaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krYohFNs8smbKXzf1DrxvP6rw7g3WhfrIED2O9IS+j8=;
 b=aQHkdjZzgJMGhd4RC0O3HG/RkehhK8krYIb/NWKaRLZvDYKcfN0bOQs0xO+xRjtF/v+QYcZBPGJ/9UYcaLalPQ7hjaChTFQI/4ezPrZgS0LdGKthYuZbKbJb6u7Q8QRwOWz+cUp+wqRS+q+17S8YW1W4P3b9Y0M1+t/S2tmftMDr9Wh1KX6RiQFU5/IUtfTfYcZpjBA464i3lyV4a8BepN8PIxuoYmuX9FLDKNl2IBMhkfM7pd4PrrJfjT7hknK3niAPPZgWKG94Lc6g8q3gJlyXU8F4Yo/AqziaahZoUbQdvFWA5leyMF6iML9/02RV362gm2CjgOTNutXlUHNEJw==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 02/11] xen/arm: Add new device type for PCI
Thread-Topic: [PATCH v2 02/11] xen/arm: Add new device type for PCI
Thread-Index: AQHXsHoxl5/FGbezwky3nlX6PVRH4qu3hVeAgAAKLIA=
Date: Mon, 27 Sep 2021 08:18:22 +0000
Message-ID: <093ba27e-37a7-ac7b-9419-65cdef5e5661@epam.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-3-andr2000@gmail.com>
 <278da2e5-e55b-e36e-1210-d917bb5ede34@suse.com>
In-Reply-To: <278da2e5-e55b-e36e-1210-d917bb5ede34@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f35a75e-c709-4b13-d1cc-08d9818f5f3c
x-ms-traffictypediagnostic: AM4PR0301MB2196:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2196D2FD723B7A3830EE6DFAE7A79@AM4PR0301MB2196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ovxN54WUz4Hzt3t4BZfLIu8E7wIWKREjfzJu0o398kj3d/Fhi38xMWkaEdbjXlmjSpMeR4aUPhrBm+ahR7iJ4f5LB2FxD7w16gp8r0f/fawYjCL0S7D4zVEYapXehFBRwZyOFEaBdY6C5zqNq3w+QifK7Ww3GWNsvnmqTSGX7J899c/Ir0KVCO9ZJsnDiuTFH+oADnMfmUgnuxRfJneM9W3VMYctgBwmm1aLEp54k/1UPB7f4JD68+Efu0HEVhQkQmiHvfZyFRMklXDvFlEWSX0KOq+eNXekKAZpZMu6yTBIhYV7WR5k2lQqtWaYRAp/BBhgB8szc03EXacaq+tnEc/X+75dEg/HDh34vL3NlE43v82PPn07xfLb8W8F4l/8/oQMqpVZfI32tmY1IzvZNEcVxfXIkkT14Dc5/TYwRupY6I0T3Mmh7V5zpj+/UxLn62qZXM0dGNMCByx1jOueM/bYxJcH6h8Cj2hR3wLZO8piFjy/CdPdolBQ6RUpo+Bj50PbarlAHkrQ/jbUHayRVZsk0OAkNelp0tlZfWBdZomsGDOcVndm4T6L7yQsqybebMM3BoqDabaLhRueAFF0Lhj69wG85kTF6+zTTGFBnQroaUl/JO2ATgkh93jj95X4WxsTIZHJcyaNDCPYAYuhs0j5S0/r9plo0gLWTRNmmypH+7pHbLaxY4WvyGGJVODa3i0iLNQ53038d/gsmWVXZJm2fcdt++GvyU9AnAQdoqX3sn/sehWa99kth0UN333J
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(38100700002)(66446008)(71200400001)(2616005)(6506007)(5660300002)(31686004)(66946007)(86362001)(6486002)(6916009)(66556008)(31696002)(8676002)(64756008)(66476007)(53546011)(316002)(76116006)(4744005)(4326008)(36756003)(122000001)(2906002)(26005)(508600001)(54906003)(38070700005)(186003)(6512007)(8936002)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SWY2RnpUS0FoRmxrdkRJZFZKSVJmUTlYYW55YXAzK0pseDE0ekNNZDZ4YWsx?=
 =?utf-8?B?R3R4emNaalhDZUZIcnhkREQwcldmeVVGa2FOa1ZXdEJha0lvL1RndDU2N25t?=
 =?utf-8?B?NmpwcHFZVUdtK2NwYUFFRUlYUXRjWm1DWVlEY1VVS1lYRFhrYWoxZjVLbnJN?=
 =?utf-8?B?S044ZnFCbjliZldCL0FybDJ2NlY5L0dXQTZVMGIxcmxpYU5zd3Z0Y056cldO?=
 =?utf-8?B?R1hsMVJSOVRpa3FSakxUTVc1bGdUU3V4SXFBZExBVzMzV2F0M05GdmIrbVlx?=
 =?utf-8?B?ZGJibHQ2aDZrQkNlYVpTMUZadTFGTVVKU2s0dzhEOXZuczFmVDJQL0xQRkV5?=
 =?utf-8?B?MXlPMUM4T0JINFBEMUdHdU9tc2NaMFFLazRmakc4TlBoLytaUmNuelBPRm9h?=
 =?utf-8?B?RXY3MlBUeHNSMGxpZGxtUlU1dnpCemxUZFdkbWJCenFuZjhza3U1RTU3Qmc0?=
 =?utf-8?B?ZFYySjhJdGlKd0prOW5LYWdzUThsRU8xMDJjQUpqdFNNeXQreENpOFkwblBy?=
 =?utf-8?B?UjNNR3NEMW4yNHlpcGt1cU9oOWl5RXBmeE5KY1drRTcrc1ZBTjlaN1NZejJH?=
 =?utf-8?B?VW5TTjRKOUdQZ0xOM1hxTHQ0bDB1Ymx4a1FzZTZ0dGlFaUs2ejUxNXJvVE9Z?=
 =?utf-8?B?ZXZkV09PaitTcVNaai9PdFZkUVp3UGFvdVZYVVNrQVhZUFlKM1FzZGdGS1lN?=
 =?utf-8?B?cVNaTlJZU0FBTjJQZnlKc0JrZ2I2WGxVZWZiMUdEbzhaUjBOT3lyYkFuOXI4?=
 =?utf-8?B?NHUzaGxkRDVLVUl5dXg1di9xSjNHT1R2SENLaTBEM3Z3NTluSmE5Z1YrOFJT?=
 =?utf-8?B?dCtjNVo4UDRwdUN6S2RKVUd6UEpSQjJ2aDV0V1dCdDZnSjRHUDQ2NEw1RUdF?=
 =?utf-8?B?YXd3Mi9qUXRWRDJ2SllGelp4eGx2WTdTcnZjclltaTVxNXZYMnZHOUlpT2xM?=
 =?utf-8?B?aW9rWXRVT0xMbG5KVEFRM1hoaW1sb0oya3FpKzJjeU5XaXFWd1VsSmR6c2lx?=
 =?utf-8?B?U2J1TGd5UUpQY09EL3kvbHdaR2JhN0ZDYlhyNGZwQkgrSnpFWWhMeXpHN0Vr?=
 =?utf-8?B?NVcwYUQrNlFSeEQxelNXUGs5ZGVGUWRQNUVMZFJibm1ac3FaemxBTEtOaTNF?=
 =?utf-8?B?eXBZLzBKRXRLME93b0FDZXNvSUU2TjkwOWtnaitzMmZDTjljbDMyNStCdkxi?=
 =?utf-8?B?VlF4Vk5JNEoxMHhGcjc5WnZVZjNvT0xSRWhwVnZ2dkJFMk9abFhwQTVLYVF1?=
 =?utf-8?B?Y0kwR2N4MW8rQVhlNDdVblhFV0FiWjN2ZDFrRk42TFVqemtGU3FZZnhyUzhp?=
 =?utf-8?B?QU9DdElVTGpWNGo4VnRnL2FDeHkxZ0Vzc3VHNWV1a3ZxNURRRGc1amduWDRu?=
 =?utf-8?B?SEZMUE5CSlhEbWhpZ1luOU54ZEdMM3FBUmp0QUdweUtBVGZ3Q3JqTHBpckFC?=
 =?utf-8?B?UDk2aUlMNmtzNzMyeW16WW45d3prRjVJNWU1dENLZ0I0SkcxKzZPMU92NGsz?=
 =?utf-8?B?OE92M1ZhZ1ZzQnRvZUVXK2lEOVd5dmZNZmhmcUxmalUwYlRhRjdzTTJoQkVE?=
 =?utf-8?B?ZTV3RW1KYWY0QjVBQUN1QkowbnppMnpDMkVNanNwcVMwZ0M4U0o5K0FYb3Nr?=
 =?utf-8?B?NHpyM2crY1BHemR5RVFud1kva1NLT3RDNlBEVUNtN3djSGdieVFWeFg3L2c5?=
 =?utf-8?B?bHI1UmErNG5oNkRvSUtMeldOMFUwaGZ1ZmUvYTFydmtock44MDNoU0FLOFJJ?=
 =?utf-8?B?UldZMzlRdmZsNENNTnJCRDhHQkwxU0lIeEhUazVqYVk5aHVCTFFlZEhqUE4v?=
 =?utf-8?B?RjV1aU9mTFltZ3ZsMHFpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB6074E06B6E204EB8A1F2C711B27186@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f35a75e-c709-4b13-d1cc-08d9818f5f3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 08:18:22.6917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SHUVknaGId8XPhPm9NTFjMonLejWY0qgrUBlV9rMXWjmYwz9MgoSaKTwlCd8ArU11p0YMFXo2knjRHpLY7SYZ1C+n92TTidItr6TnjvK9TwujP+w+TnEVyOqoJ4mFQzB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2196
X-Proofpoint-ORIG-GUID: sIw-ONtog9wC-gUww8bo2OPlWQ5Gua2j
X-Proofpoint-GUID: sIw-ONtog9wC-gUww8bo2OPlWQ5Gua2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_02,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 suspectscore=0 mlxlogscore=842 adultscore=0 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270056

DQpPbiAyNy4wOS4yMSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIzLjA5LjIwMjEg
MTQ6NTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gLS0tIGEveGVuL2FyY2gv
YXJtL3BjaS9wY2kuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2kuYw0KPj4gQEAgLTI3
LDYgKzI3LDE2IEBAIGludCBhcmNoX3BjaV9jbGVhbl9waXJxcyhzdHJ1Y3QgZG9tYWluICpkKQ0K
Pj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RydWN0IHBjaV9kZXYgKmRl
dl90b19wY2koc3RydWN0IGRldmljZSAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IGFyY2hf
cGNpX2RldiAqYXJjaF9kZXY7DQo+PiArDQo+PiArICAgIEFTU0VSVChkZXYtPnR5cGUgPT0gREVW
X1BDSSk7DQo+PiArDQo+PiArICAgIGFyY2hfZGV2ID0gY29udGFpbmVyX29mKChkZXYpLCBzdHJ1
Y3QgYXJjaF9wY2lfZGV2LCBkZXYpOw0KPiBOaXQ6IFRoaXMgbm90IGJlaW5nIGEgbWFjcm8sIHRo
ZSBpbm5lciBwYXJlbnRoZXNlcyBhcmVuJ3QgbmVlZGVkLg0KPg0KPj4gKyAgICByZXR1cm4gY29u
dGFpbmVyX29mKGFyY2hfZGV2LCBzdHJ1Y3QgcGNpX2RldiwgYXJjaCk7DQo+IFR3byBzdWNjZXNz
aXZlIGNvbnRhaW5lcl9vZigpIG9uIHRoZSBzYW1lIHBvaW50ZXIgbG9vayBvZGQuIElzDQo+IHRo
ZXJlIGEgcmVhc29uIGEgc2luZ2xlIG9uZSB3b3VsZG4ndCBkbz8NCj4NCj4gICAgICByZXR1cm4g
Y29udGFpbmVyX29mKGRldiwgc3RydWN0IHBjaV9kZXYsIGFyY2guZGV2KTsNCkdvb2QgY2F0Y2gs
IHRoYW5rIHlvdSEgTm8gcmVhc29uIGF0IGFsbCwgd2lsbCBmaXgNCj4NCj4gSmFuDQo+

