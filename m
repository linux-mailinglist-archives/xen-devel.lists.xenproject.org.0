Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E2C40252D
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:34:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180608.327336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWXt-0006rS-Uo; Tue, 07 Sep 2021 08:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180608.327336; Tue, 07 Sep 2021 08:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWXt-0006oc-RR; Tue, 07 Sep 2021 08:33:33 +0000
Received: by outflank-mailman (input) for mailman id 180608;
 Tue, 07 Sep 2021 08:33:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hq6o=N5=epam.com=prvs=98842be756=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNWXs-0006oW-5o
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:33:32 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e865283-6a99-4ed7-bedd-169b92d7e73d;
 Tue, 07 Sep 2021 08:33:31 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1877mgC7024165; 
 Tue, 7 Sep 2021 08:33:28 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0b-0039f301.pphosted.com with ESMTP id 3ax413r56p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 08:33:28 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com (2603:10a6:20b:13c::18)
 by AS8PR03MB6981.eurprd03.prod.outlook.com (2603:10a6:20b:299::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 08:33:26 +0000
Received: from AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44]) by AM7PR03MB6325.eurprd03.prod.outlook.com
 ([fe80::d9b7:c0ab:2c2f:5b44%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 08:33:26 +0000
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
X-Inumbo-ID: 2e865283-6a99-4ed7-bedd-169b92d7e73d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDy87PHSNQYi95Ze6iPaEQuNglrE13n+PSqy4ugqUQkDwI7OBG7DHq4700Y0H90DB9eRvMh7qxLK9N9/dgvekH88y4WcThESRdaiT5eKR/Ga+7WXxFsqAOGoFahvny42mMPbRmjX/SUqnbIkTbrd7cJhRRZgdnYgOiNdwB2DFUWfrkq2VR0Z3agQJVQ7zBfug6l4rSZEa/RXB5XSisrmo9nN27bnGwq8hZy9j5DUZ8Tw938if8CoMubDuBkwTpzNAf0KCsDuEo8SwTAL0rThOSATLzEVZJGqxkuDsh0n8xzhEgWB1Xxqdt/DAMB9G+bHXoeT8x9k2cGBeEq50JAsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rY4+RI5kbn/YbnzJ+0E6KYuPaJLPUxjFO5sxV5cpIII=;
 b=LZHIPId4CZTACxlfYQ9jjNtyuTQHhsk+v9NmfXOqK5KYTfFAbGgdWiDB2o3aj+p0Dhmm3eljWrdMF9mlqChMB3EfVpOLPFWBdlQBL3MvZZhXrbAa5HKW/y62h4A3msyZ4KuWnbnOJhjAYJVyof17arkEf7JIgAPUJsVhqa7EpUF2YrcS/g29IiGvzHmr1EfnVxRyfL5FH4SVsJfYOKvn7ipyntU23jAUw9bFAk7Ax7Xnjo0xoLPDQ9bq0p75DFPc2+TLjY3qRRim6KDdOIZK2ZJ+ZbdkQjtSSdiqErZc0vhY9C6OBIFhKW1Hu8KF9vpJKLn7B/0URPilxRT0yYQw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY4+RI5kbn/YbnzJ+0E6KYuPaJLPUxjFO5sxV5cpIII=;
 b=E4AUFXCC24F7y/pKbrN8Fvm8ivJ+SQ1l1mod79jikW8u7bimg8hGUr7TbEv5ZK1S482pIDWuUd4xkADRnxKkWA5/IpNWkXDcuL/oXSkUEtnOIIJ8Zx/40jNcpz74fSGX+rEeYaCURL2WoTnJVpKdpNtT2p2WvKjW+tXQNELww4sAcF420nwOlFc6WOZ/7c5HHVMFgS4IlxYoTid8fzxrV1cgbTLU9SzwzjbBbEMaO0WA4ULdIZGXDN/QcgY2gX2J9pLZgDHvTdK4h1apuYe9e14dXTuzKEPRecBqObTjzHPnmphmAQttFCWWxN2ybxD63ko5Cc8H9nVQdngxJCuKSA==
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
Subject: Re: [PATCH 2/9] vpci: Add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH 2/9] vpci: Add hooks for PCI device assign/de-assign
Thread-Index: AQHXoKuuObg1egaUxUKTttuKCAaWP6uXA1aAgAFBYAA=
Date: Tue, 7 Sep 2021 08:33:26 +0000
Message-ID: <c299a9fb-f84a-a042-f452-006c9d082256@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-3-andr2000@gmail.com>
 <371a403c-adec-f1e1-8887-5664a749b169@suse.com>
In-Reply-To: <371a403c-adec-f1e1-8887-5664a749b169@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b34e9d35-644b-44f9-999f-08d971da29c2
x-ms-traffictypediagnostic: AS8PR03MB6981:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB698147728B69630307AEE12DE7D39@AS8PR03MB6981.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VrFiOUWqRn48ftTr1w5Ey/OMqWTFeNzPZM0252d6VzJdFNmDYR4mtAzXYuHroK0L+vfX+jU+xxlwvsyf9itbJh+oxBEA2MxLaDHqAxFP8kBz5/rbsi136j4lAd82UYR1eWUEsw22PksFJoVrXzSV1xclBj8rrAfcnWV3F0cXzXjF2BDWuNVfgdkFWAUGeYIxUinUIOJeq3CumpMrfQuvkc3/KoMy0e0wQ75Au9kUJT9+YEn4R1PN+a9BCoiJIhslEw75RddnhKmezHDdEEVUnvoC/9poMXedJie5gVhYZNluDUkou1+ygH2La0wouV+8vQ4/js9fhl3Ofqf7gjbDI1O0Xt1Ggbms5gVzeoBnirzMDF2vUxZqkfnZFo6ZthGpIQXVXKcb2VhWDTET+zLhh+31TMpux76NNP8wuEiGOl6rjI5vSTFlM9qhNs5RrpkC4p+4OQuY2XWO+iYBm67Pa7ITFrwKT+H5Q1w4HdPoa8hjUIyLO5VRl6b5zAduR3UV0j6kd42uYnzFDHp5jF1WuxEZI/SeJLYqPHE4Mmff1B1ZdaAKx0PZ5L+wOxMFMXHrBJx2403lOpZc08VzoVe95v2i/d5sqSEtNO1BDZbIyOf6QpjehkoP6KIJRWZWzXQ61CosIKzQYwpPlGVu5RAAc3fa7Ixr/Dxq3ps3wTfm9K9dJgaNBi18U+xzkIpb6m6GprIpIuz6ly+T+2orQ/c1l32LF+okZ+GWtlIsxprcau60eq3GKgSsI5GJtZiNaYSj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6325.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(76116006)(66946007)(36756003)(66476007)(2906002)(6506007)(66446008)(110136005)(316002)(54906003)(83380400001)(31696002)(5660300002)(31686004)(86362001)(38070700005)(186003)(64756008)(91956017)(66556008)(6486002)(122000001)(38100700002)(6512007)(2616005)(478600001)(8936002)(71200400001)(4326008)(8676002)(53546011)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aDIwTS9UMS9wWHZ5SXRmUW9SU2RLbkphcWN1VVVPQ1M4LzZzQnJ1dExtVTZY?=
 =?utf-8?B?M29lNWdwRHVRYzFabEhndHhhQXNTRzNkajFaWDErbkJqMmZML0Yrdm5YT0Fr?=
 =?utf-8?B?QWFGblZxV05tRE5UUUxTUkpDcmlrU2hNWmJMT09tdEFXZEVZNEVkZnRUTzBC?=
 =?utf-8?B?aEJRQVlpa2J1RGJoWkRCNkNlMXZNZWg5dnl1L0FySVlJMlkxRW1NU3B3TUZJ?=
 =?utf-8?B?WHpiRFo1bjhlL1Rlb0x5aGF4MVEzZHI4UkFrY2V0L2R6QUFmeHlBYVZMNzRy?=
 =?utf-8?B?S0trWGRtYmJhUUJ1WVgvTnFrNk4xbkxuWUV6T1ZXZzM1bG1ibDQvQi9GZXBw?=
 =?utf-8?B?c3RJN2dzUi94UDRkc0tERW4vcUxMM1NTcFdUOE1zU1p4VTlVUitabVdjQlR4?=
 =?utf-8?B?b2ZDc29IdFZKZ1RZOEozd3Evdzd3MVU1RG9aNnJNODhkckRBeVlNYS9sa3R4?=
 =?utf-8?B?bUNvK3lETitybCtpb0hSRUd3QnJQUjJtS1dpVkJGRmdoQVRXTkhoZDI4Wld6?=
 =?utf-8?B?c0dzeUFpRnNqcGJqS0ZUb0MyNmI3eEg0bUUrc0kyYjVhc081TVg5VGpMK0Rn?=
 =?utf-8?B?WHI4MlZYa0MvdU1aRTlGQUJHMndmbjY1QjhmKzU2aDlpTFlsNnRlVTNxMzE2?=
 =?utf-8?B?RXJWUm9lUUhtMEQ2dDZoY0svRVhjN2NxdDJoaGhSOVdGbGZFUkd2NndyWWZj?=
 =?utf-8?B?d2c4SnUrUlNIZ04yNFpBNE1pUThleS8yVjJKajRyU0tiM2daZitHM3l1b3Az?=
 =?utf-8?B?bzlHMy9PSzZadVpuOTZvTWJseCtpV01lV1loKzM4TFpPOVppb0RwUGIzdXI3?=
 =?utf-8?B?VStWeEZIRVpaOWIxL1hZemY2ajlESGduTllLclc4alUwRXF6V0lJdlo4VWdp?=
 =?utf-8?B?MGp2Q2pLa0I5akJrS1hkQTZCczlOSG5GU3Y1Y0VjN1RUazhPa1d3dll6MFU5?=
 =?utf-8?B?M1NiSmxVTXNxSmVBbDFmWi9tbWFlcS9JNWxMVFlVRWl2SUNFUy9TeVBvRmRi?=
 =?utf-8?B?Qk5rSkdTUkR0YnpLekxpckNHS2JxaG1sUEs2aEdnTVVOeUx6UDlKZ3NDWnJq?=
 =?utf-8?B?eVdSVGNLNWMvMEtPOEZJTS9kRXN0U1p2c2RpT2FVMmlUUDRDV2dRQkRPditU?=
 =?utf-8?B?TjBTcjJRdW5FdDEva01FTkk5MWZFOUIzdXFZWjJRbXM2TkFDQW9GV29rZXZG?=
 =?utf-8?B?Z1pXcU1MMjhkVVJYL0F6R0Y4OFNaQjNhUW5qSklwNzErVjIzN1BsY2VjU0xs?=
 =?utf-8?B?c2IxZlBoNDY3NzRWdU1VOFpoV2psTHFhNHdHdjJ1c2RUczQ4N0tpc0Y1TW9R?=
 =?utf-8?B?SFVmdWVBWTBXQ2tlVmFxZGRpYmFBL2R5NlloZkx0ZlR3Ymc2ck5YSHc3bE5j?=
 =?utf-8?B?cHU5RGJqZHYwcVY5TXJqYUNZUmdzN1ppWnJ4VllydnJIby9RWithRWNsT21F?=
 =?utf-8?B?c2svSWNwa2JPN0g0U0VoTjk2WU9jYkRmd0krNC9YSitLYTQySDNMdkhDL0tn?=
 =?utf-8?B?Z0JUSTdNSEV5Mm1sRmpBamxLeTBEMXNLLzZyZE5xNG9zZTcvSWI3R3AyaFNo?=
 =?utf-8?B?OGpEV3RsNDArb0piakRPcVlBOW9EdHZJbXV4cHhXOEl5Z3JBR2hlTkhSakwy?=
 =?utf-8?B?Ym9RVk1IZ2pnTzRSbUNyYTN1SktFZTBWd2hxd3l2ZWhLMFN5NVd1RGg3SVBR?=
 =?utf-8?B?N0dnQlUwcGR5L2I2d2psbkI0VkNPNzlIcjFkeUd1cWhZQlgxN3ppMVBwbXJ6?=
 =?utf-8?Q?t23m5DQ1MbLQNoPWQ2Nc7W2pnr2gJQfum9nbyHc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E257E7D0E558EC4AB9FE1BD1DE22AEB3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6325.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34e9d35-644b-44f9-999f-08d971da29c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 08:33:26.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vp3q+I2AJF8IYZinVhlwMlGfbHRWvFxLPEnI/e4Mx0tOZeoMCq8Hns/WG1Wutj/Qpz9t/NtsC15XUpQHbfqw8Hp+CH/3DiXjp74qfuLnhRFqPpqu+bp6Mn60eMvoFm3m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6981
X-Proofpoint-ORIG-GUID: yzRev8ctFvb79gzde9I-IYo0tvpgGNoK
X-Proofpoint-GUID: yzRev8ctFvb79gzde9I-IYo0tvpgGNoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109070056

SGVsbG8sIEphbiENCg0KT24gMDYuMDkuMjEgMTY6MjMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBP
biAwMy4wOS4yMDIxIDEyOjA4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYw0KPj4gQEAgLTg2NCw2ICs4NjQsMTAgQEAgc3RhdGljIGludCBkZWFz
c2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdWludDE2X3Qgc2VnLCB1aW50OF90IGJ1cywN
Cj4+ICAgICAgIGlmICggcmV0ICkNCj4+ICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgDQo+PiAr
ICAgIHJldCA9IHZwY2lfZGVhc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KPj4gKyAgICBpZiAoIHJl
dCApDQo+PiArICAgICAgICBnb3RvIG91dDsNCj4+ICsNCj4+ICAgICAgIGlmICggcGRldi0+ZG9t
YWluID09IGhhcmR3YXJlX2RvbWFpbiAgKQ0KPj4gICAgICAgICAgIHBkZXYtPnF1YXJhbnRpbmUg
PSBmYWxzZTsNCj4+ICAgDQo+PiBAQCAtMTQyNSw2ICsxNDI5LDExIEBAIHN0YXRpYyBpbnQgYXNz
aWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1
MzIgZmxhZykNCj4+ICAgICAgICAgICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPmFzc2lnbl9kZXZp
Y2UoZCwgZGV2Zm4sIHBjaV90b19kZXYocGRldiksIGZsYWcpOw0KPj4gICAgICAgfQ0KPj4gICAN
Cj4+ICsgICAgaWYgKCByYyApDQo+PiArICAgICAgICBnb3RvIGRvbmU7DQo+PiArDQo+PiArICAg
IHJjID0gdnBjaV9hc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KPj4gKw0KPj4gICAgZG9uZToNCj4+
ICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICIl
cGQ6IGFzc2lnbiAoJXBwKSBmYWlsZWQgKCVkKVxuIiwNCj4gSSBoYXZlIHRvIGFkbWl0IHRoYXQg
SSdtIHdvcnJpZWQgYnkgdGhlIGZ1cnRoZXIgbGFjayBvZiB1bndpbmRpbmcgaW4NCj4gY2FzZSBv
ZiBlcnJvcjogV2UncmUgbm90IHJlYWxseSBnb29kIGF0IHRoaXMsIEkgYWdyZWUsIGJ1dCBpdCB3
b3VsZA0KPiBiZSBxdWl0ZSBuaWNlIGlmIHRoZSBwcm9ibGVtIGRpZG4ndCBnZXQgd29yc2UuIEF0
IHRoZSB2ZXJ5IGxlYXN0IGlmDQo+IHRoZSBkZXZpY2Ugd2FzIGRlLWFzc2lnbmVkIGZyb20gRG9t
MCBhbmQgYXNzaWdubWVudCB0byBhIERvbVUgZmFpbGVkLA0KPiBpbW8geW91IHdpbGwgd2FudCB0
byByZXN0b3JlIERvbTAncyBzZXR0aW5ncy4NCg0KSW4gdGhlIGN1cnJlbnQgZGVzaWduIHRoZSBl
cnJvciBwYXRoIGlzIGhhbmRsZWQgYnkgdGhlIHRvb2xzdGFjaw0KDQp2aWEgWEVOX0RPTUNUTF9h
c3NpZ25fZGV2aWNlL1hFTl9ET01DVExfZGVhc3NpZ25fZGV2aWNlLA0KDQpzbyB0aGlzIGlzIHdo
eSBpdCBpcyAib2siIHRvIGhhdmUgdGhlIGNvZGUgc3RydWN0dXJlZCBpbiB0aGUNCg0KYXNzaWdu
X2RldmljZSBhcyBpdCBpcywgZS5nLiByb2xsIGJhY2sgd2lsbCBiZSBoYW5kbGVkIG9uIGRlYXNz
aWduX2RldmljZS4NCg0KU28sIGl0IGlzIHVwIHRvIHRoZSB0b29sc3RhY2sgdG8gcmUtYXNzaWdu
IHRoZSBkZXZpY2UgdG8gRG9tMCBvciBEb21JTyg/KQ0KDQppbiBjYXNlIG9mIGVycm9yIGFuZCB3
ZSBkbyByZWx5IG9uIHRoZSB0b29sc3RhY2sgaW4gWGVuLg0KDQo+DQo+IEFsc28gaW4gdGhlIGxh
dHRlciBjYXNlIGRvbid0IHlvdSBuZWVkIHRvIGFkZGl0aW9uYWxseSBjYWxsDQo+IHZwY2lfZGVh
c3NpZ25fZGV2aWNlKCkgZm9yIHRoZSBwcmlvciBvd25lciBvZiB0aGUgZGV2aWNlPw0KDQpFdmVu
IGlmIHdlIHdhbnRlZCB0byBoZWxwIHRoZSB0b29sc3RhY2sgd2l0aCB0aGUgcm9sbC1iYWNrIGlu
IGNhc2Ugb2YgYW4gZXJyb3INCg0KdGhpcyB3b3VsZCBJTU8gbWFrZSB0aGluZ3MgZXZlbiB3b3J0
aCwgZS5nLiB3ZSB3aWxsIGRlLWFzc2lnbiBmb3IgdlBDSSwgYnV0IHdpbGwNCg0KbGVhdmUgSU9N
TVUgcGF0aCB1bnRvdWNoZWQgd2hpY2ggd291bGQgcmVzdWx0IGluIHNvbWUgbWVzcy4NCg0KU28s
IG15IG9ubHkgZ3Vlc3MgaGVyZSBpcyB0aGF0IHdlIHNob3VsZCByZWx5IG9uIHRoZSB0b29sc3Rh
Y2sgY29tcGxldGVseSBhcw0KDQppdCB3YXMgYmVmb3JlIFBDSSBwYXNzdGhyb3VnaCBvbiBBcm0u
DQoNCj4NCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYw0KPj4gQEAgLTg2LDYgKzg2LDI3IEBAIGludCBfX2h3ZG9tX2luaXQg
dnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgIA0KPj4gICAgICAg
cmV0dXJuIHJjOw0KPj4gICB9DQo+PiArDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2Ug
aXMgYXNzaWduZWQgdG8gZ3Vlc3QuICovDQo+PiAraW50IHZwY2lfYXNzaWduX2RldmljZShzdHJ1
Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgLyogSXQg
b25seSBtYWtlcyBzZW5zZSB0byBhc3NpZ24gZm9yIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8N
Cj4+ICsgICAgaWYgKCAhaGFzX3ZwY2koZCkgfHwgKGQtPmRvbWFpbl9pZCA+PSBET01JRF9GSVJT
VF9SRVNFUlZFRCkgKQ0KPiBQbGVhc2UgZG9uJ3Qgb3Blbi1jb2RlIGlzX3N5c3RlbV9kb21haW4o
KS4gSSBhbHNvIHRoaW5rIHlvdSB3YW50IHRvDQo+IGZsaXAgdGhlIHR3byBzaWRlcyBvZiB0aGUg
fHwsIHRvIGF2b2lkIGV2YWx1YXRpbmcgd2hhdGV2ZXIgaGFzX3ZjcGkoKQ0KPiBleHBhbmRzIHRv
IGZvciBzeXN0ZW0gZG9tYWlucy4gKEJvdGggYWdhaW4gYmVsb3cuKQ0KR29vZCBjYXRjaCwgSSBt
aXNzZWQgaXNfc3lzdGVtX2RvbWFpbiBjb21wbGV0ZWx5LCB0aGFuayB5b3UhDQo+DQo+PiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5o
DQo+PiBAQCAtMjYsNiArMjYsMTIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qo
c3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiAgIC8qIEFkZCB2UENJIGhhbmRsZXJzIHRvIGRldmlj
ZS4gKi8NCj4+ICAgaW50IF9fbXVzdF9jaGVjayB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNp
X2RldiAqZGV2KTsNCj4+ICAgDQo+PiArLyogTm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgYXNz
aWduZWQgdG8gZ3Vlc3QuICovDQo+PiAraW50IF9fbXVzdF9jaGVjayB2cGNpX2Fzc2lnbl9kZXZp
Y2Uoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKmRldik7DQo+PiArDQo+PiArLyog
Tm90aWZ5IHZQQ0kgdGhhdCBkZXZpY2UgaXMgZGUtYXNzaWduZWQgZnJvbSBndWVzdC4gKi8NCj4+
ICtpbnQgX19tdXN0X2NoZWNrIHZwY2lfZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBwY2lfZGV2ICpkZXYpOw0KPiBJcyB0aGUgZXhwZWN0YXRpb24gdGhhdCAiZGV2IiBt
YXkgZ2V0IGFsdGVyZWQ/IElmIG5vdCwgaXQgbWF5IHdhbnQgdG8NCj4gYmVjb21lIHBvaW50ZXIt
dG8tY29uc3QuIChGb3IgImQiIHRoZXJlIG1pZ2h0IGJlIHRoZSBuZWVkIHRvIGFjcXVpcmUNCj4g
bG9ja3MsIHNvIEkgZ3Vlc3MgaXQgbWlnaHQgbm90IGJlIGEgZ29kIGlkZWEgdG8gY29uc3RpZnkg
dGhhdCBvbmUuKQ0KSnVzdCBjaGVja2VkIHRoYXQgYW5kIGl0IGlzIGluZGVlZCBwb3NzaWJsZSB0
byBjb25zdGlmeS4gV2lsbCBkbw0KPg0KPiBJIGFsc28gdGhpbmsgdGhhdCBvbmUgY29tbWVudCBv
dWdodCB0byBiZSBlbm91Z2ggZm9yIHRoZSB0d28gZnVuY3Rpb25zLg0KU3VyZQ0KPg0KPiBKYW4N
Cj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

