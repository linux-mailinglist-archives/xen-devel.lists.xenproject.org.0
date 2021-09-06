Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF84016B1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 09:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179382.325630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN8eg-0004ia-L2; Mon, 06 Sep 2021 07:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179382.325630; Mon, 06 Sep 2021 07:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN8eg-0004fw-Hp; Mon, 06 Sep 2021 07:02:58 +0000
Received: by outflank-mailman (input) for mailman id 179382;
 Mon, 06 Sep 2021 07:02:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ykgp=N4=epam.com=prvs=9883458851=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mN8ee-0004fq-Rj
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 07:02:57 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75965472-0ee0-11ec-b097-12813bfff9fa;
 Mon, 06 Sep 2021 07:02:55 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18664srY000909; 
 Mon, 6 Sep 2021 07:02:49 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3aw28ps0r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 07:02:49 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6242.eurprd03.prod.outlook.com (2603:10a6:20b:15c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 07:02:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::641e:b269:6d21:b7f8%5]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 07:02:46 +0000
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
X-Inumbo-ID: 75965472-0ee0-11ec-b097-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQk7TwGRFQCFaBgnv0VXOZWWeM6NYZTEkh6Hztv50rc03PEx21G27h6gO1VXNJ06PRc6PYxw2bwcA/TwInJbr9TJpPs3oGK5QmYR4pQLaaQjj4NoDWBZVpEZUMGkwF9a9Hlbin8gGQKkw7LeG0darT46wGL4hEoMn4U0+UHSpAtayS0fr3Hmq++4ZhkGjt3X0GKBa4XC238xuC3A2vCmlTRTE7mRFdUeOeb4XHm1bDOrcAFI+JOOGFKl5rtq4EDNHKjD5Dm2lduHAzkovIILa4T/g7/A+P0gm4co9G7MLveESpusmr8wJYe6Ltsg7StWn0xBX9w1J77CJNyc4Rq7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GDTAVpAbHwGYMZmKPNl2kjdBtJNWPwV7jhug3pQvpwE=;
 b=WswR/JJ/zS2K7staqMNNw3o7is1s+64X2SOraKIbH33BRxVZIv0IAC7Fp8fQ5aMIlzuOo3RMs/TdD69UEwHhmq7+DssjXr2M1FE2XkcPwlEZs+EMTHr5tL0rJBTWTYKGZqpx3X5i7xg8UUWh1nTe7eDAARRqd1MXUUWAekzTnUbGTBF/MjZKpqeO0PZKabr5zBNiAapDgt3oGbqkCtRgBgD7Emu+lnKu1SemlwUdH/MdkcLhOCeIsxfecz0NkRerFJLCwkA9PBHM4mIwpmAMPihfuBXt7Xieo14yG9EQg0ka6uTHWQtjIjKRLqapAzRX70FnpEkIALw821gVDx8wjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDTAVpAbHwGYMZmKPNl2kjdBtJNWPwV7jhug3pQvpwE=;
 b=4InjGgXhNRt1Td4at2b1KE54GRLJqv7kF93wP/i6v+P6g/fn6Jc7oLPilTQB1+zEn6a3G2JkP7QFXjeb8pw4dOU4A74fmY0IJhK3XwicdBWvRisoAlGaiA2FFb4ZPkmEByoPlhNZ3csVhgJI0WlNGERfR1L417gsajI1fmr29DiamF4wNZNdZ9/zANO+tGHxdwU6YUpTl//+v4v9ftSbx8cMKrNSqwz5ApY0mLH6z7fwuxEpMoLpeUN0W7FuQtnZhkU8R3bn/uByQ+bSMR5L9Rwohfs+JQ1/LqGr3ejxwXr3t0LttFI9s9uA7bwwe3TvbcOhVs6BzSePTp2Xdp02mw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Topic: [PATCH 11/11] xen/arm: Process pending vPCI map/unmap operations
Thread-Index: AQHXoJ51zxJWpxhHEEGXNqYYBqazw6uSBESAgASU4wA=
Date: Mon, 6 Sep 2021 07:02:46 +0000
Message-ID: <f8760f77-1ba7-b0ed-0562-d63527aa1cfa@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-12-andr2000@gmail.com>
 <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
In-Reply-To: <bc3bc53a-4a86-8ef3-b040-6e983f02ebf1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12ba1be1-c0e4-4060-655e-08d9710454e5
x-ms-traffictypediagnostic: AM0PR03MB6242:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6242EE81780CF4F8B3D25460E7D29@AM0PR03MB6242.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TRdmlDVjN4rVdMieKN+iJtO+wd13W06nOiyDFtHW/adnlGRDtCofvsYSIs0z1QKYoU9K0/Z86mFFK16oxZQs+49YVw/QxzSgtAYaHD0xyXsZn7vpUizZXZWHqkjZyJOlzmuub4qnOyhtS6SyatYL23U8Z8KKHAUoUncDR1fFR+0NsYvXxeb7VllURkfOgtKXTPi5mCE9ZClKqxASlbEK5BEySy3dIR9j9w7aRP5IlvTD/M1fno0NagKRRGDc9bi7AR6tQNfseJ832AhPkjRjGV5CRjvyqoFy1EbGdAID9qSYIOrnlv3oaE2GRzxeKamCnLOVyl8BuoH8EoBXKa1X5JMUJCkO2hZzO3g1DLaLeBQrXZSLkD2yl26HybfVqXgvE1uPL6MC3mvnKmqjzODDBN5ckQ3ccMo27n8MZeKHURjK9yguv4P9wB7FeFVJR8JDBLkqsfNGJ1QDHk8600bNjFEv8v81jeBWyPw1l8cy28ETXpPndGVd+sfHn1CbaRYHatL9YrAT2Bw1kxUYKDH6eyaXIWQajLfvC1lxgKcSJOBi0qG29NRZA8Fn11kROG/P2ZI76y27eYCfpuqbdcj1GdavrrYSUj1WauaCcm+2Xno/i9+iOQyWteFE1I4uWfeTWUTqUZS8neA/5cZon5onN1IK24kcPrQlVGguo1g4VZ1HFbUpJY4KDnkJapJebGsU/bTxu7eWxJ9UauI/RuA3ZE+tfDPTWD4pE+VPbzYWAopKqIFS/fL3LvqsTVHrRKsu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(66556008)(66476007)(4326008)(8936002)(64756008)(6512007)(66946007)(76116006)(66446008)(478600001)(122000001)(26005)(31686004)(71200400001)(38100700002)(54906003)(110136005)(2616005)(5660300002)(8676002)(316002)(38070700005)(36756003)(2906002)(31696002)(6506007)(53546011)(83380400001)(86362001)(186003)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SDZ2cmR2RS8xWkFlcHJWOXhnN2ltZ2pmUzNHZWd6bHVlZUJwamlyR2IvQWxt?=
 =?utf-8?B?WW1mTFRQbGUzWDZPdFdQRzNFWk1kNWdrMzZUbzhtZVB1V2tYRUZWU3VlZ1JM?=
 =?utf-8?B?TlFvV3hwWWY0azRETmFGNWFDTGl2T0JZbnQ1L0VwU0k0Ykczb29KVTRBQlFa?=
 =?utf-8?B?R3RFS3hiazgrbS9lTUY3NXZPV2EzY0RDZUpVOTcrZkRKN3FRZzM2ZGcxRmg3?=
 =?utf-8?B?NldwYWlSdGlYTWtyMWJUY2NYcHJ4bUY4Y0N3UU1PbElGUEtDWHk5eGdDNzFV?=
 =?utf-8?B?SWxubFRLVXJmcnR1WjV3WHllemZUTitoa0dNb0dYdHgreWhXbU4zR1VjMHJE?=
 =?utf-8?B?OWJZZERGWHd2US9NT1VHa05hd2loRVEwSDR1UTFGRWdvTjhHVk90c1NsSFkv?=
 =?utf-8?B?N3pJY2VnWnZiNUlzN1ovU2JqRXN4Yi9maWpRTVcwVEVJcGJyTHpKdEJ1OC9r?=
 =?utf-8?B?bHFiVzg3SWhuRGw0S2E0WU4rZkFxUUVCNWJRN29WZGJPeFFKWXFNYU4wazdV?=
 =?utf-8?B?UG9IOWIvZENHWTdYa25kQldyQTB2TFVVU2g1eEtyK1dCbkp0Z0lPOFdHbHlk?=
 =?utf-8?B?bFE4T29RaDBpNEZXSGFJQi9QRzlFaG90WTJUaU53UHhsSDBiTlJnSDBwLzVh?=
 =?utf-8?B?bVBGOWFaOGZMelp6c0RVWmZvL3VwaTNjQXhlcS9KSkx5RGZhRE9RUGp3b0c4?=
 =?utf-8?B?azJoQ2pzMnkycC9lQU5obWR2YWFuVnphOGlSRHJCcEdBOS9QUERCNnVuRTlk?=
 =?utf-8?B?K2NTRVcyYVY5NUFxeWtRWHRrTWhyUXlMc2ZrcjAxdG9ncDNKdTlPZW1iWWFV?=
 =?utf-8?B?cFQ0cmFtUFluR1VSK0xDQzZhQUxlNFBGZ2ZHUDJ1YTNLb3FRcS9PeHpxT2dL?=
 =?utf-8?B?R0N4YkFqZUpsQU5IczF5QjRaQU5MNUM2SDlWMjlYMHJUVmw0RHdnQUw3bW1F?=
 =?utf-8?B?bk83ZUF6bi8yeS96RVA3ZXJoN0RGZUVSbzZyVVZXUUpOR0k0RWF2bGZMaVJG?=
 =?utf-8?B?Vm9tR0Zac0txY3FVc08xb2M2MFZxOHh5UWJrNWQ5R2NyNjZtUHkvblBlT2c2?=
 =?utf-8?B?bzJwVEkxSHp6bFpZNHhGZ1JSZUQwSW5QdUd4RTAreE5BUXI1YzNIcFFKejhB?=
 =?utf-8?B?cElUMU1YMmJobmpGOE9waE5USk4veUs2SWhDcnBCREcyMXlMTmU0TWc0VGVp?=
 =?utf-8?B?eHQ3dXVyYllsbWVRcnA4YVc4Y2JlQ2FvNlh3L1FaQmhNMkpzOW1MUjQybGZl?=
 =?utf-8?B?QjJqQ2s4V3R2SHJFVERSWDBRNFBwMHIyTkp4MVRmRC9Qdzl4YzZwWEtDU0Zn?=
 =?utf-8?B?bm12ZXJaaGFoZVQxSE5PMm1qd2dZdlY4M3AwQThBS0Z3MnBtTWF2ZzZmRGZk?=
 =?utf-8?B?VWRaNGl0K2t3MlZOaHFaM0EwMjEremlxWDZmaDRrcUFGeVNSYkhkbm1yU0ov?=
 =?utf-8?B?YitPb0JSNUFDSm1ScWJYUHJCSC91WGRlcmlxQUtndkxrZXhjRmhLc20zWlI4?=
 =?utf-8?B?NXllZHZTOHh3YnRCNExIQ2MyQ3JvRityODc4YVR3RmtxRzJFaWFzYytBV0k5?=
 =?utf-8?B?bkd4TEZHQTQ0ZEtNL1JET1ZiTEdVNEZJbzF6Y1pBQjhMczFLNW9WaldETGs3?=
 =?utf-8?B?ZlBjQk1FNDN4ckFaVGswelROZFhFSVFQZy81dFpnTUd1QUJpejdTZTZYSG9T?=
 =?utf-8?B?MDdqUGUvMTVjL3BJK092cFVCZTdrVlVLaklrMFhmNFJPekxaWUpzb3ZlRTNY?=
 =?utf-8?Q?k3+n6lPi4pIDygo1HWkwSqfkQ/S2PYg5MZ+ZBDt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6712A4FCBCCF549864B2A4160802F56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ba1be1-c0e4-4060-655e-08d9710454e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 07:02:46.5732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NAi5LS3ymOmmbqwzhL+RJL/e7+QtFWPunQcrXqcd1AjHIZLut5SWF8x8zDXDydx4R3Wgp7of7EmB9r0cEZVvmAJhLOCYGQDuziLOhRMAn2BhzeJyMpmvKEK+BPZVW0wU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6242
X-Proofpoint-GUID: LtIWBbLKz_VVlkAk4Ee9cQ2XEUi3PdeH
X-Proofpoint-ORIG-GUID: LtIWBbLKz_VVlkAk4Ee9cQ2XEUi3PdeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-06_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060044

SGksIEp1bGllbiENCg0KT24gMDMuMDkuMjEgMTI6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiB2UENJIG1heSBtYXAgYW5kIHVubWFw
IFBDSSBkZXZpY2UgbWVtb3J5IChCQVJzKSBiZWluZyBwYXNzZWQgdGhyb3VnaCB3aGljaA0KPj4g
bWF5IHRha2UgYSBsb3Qgb2YgdGltZS4gRm9yIHRoaXMgdGhvc2Ugb3BlcmF0aW9ucyBtYXkgYmUg
ZGVmZXJyZWQgdG8gYmUNCj4+IHBlcmZvcm1lZCBsYXRlciwgc28gdGhhdCB0aGV5IGNhbiBiZSBz
YWZlbHkgcHJlZW1wdGVkLg0KPj4gUnVuIHRoZSBjb3JyZXNwb25kaW5nIHZQQ0kgY29kZSB3aGls
ZSBzd2l0Y2hpbmcgYSB2Q1BVLg0KPg0KPiBJSVVDLCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgdGhl
IGZ1bmN0aW9uIG1hcF9yYW5nZSgpIGluIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLiBUaGUgZnVu
Y3Rpb24gaGFzIHRoZSBmb2xsb3dpbmcgdG9kbyBmb3IgQXJtOg0KPg0KPiDCoMKgwqDCoMKgwqDC
oCAvKg0KPiDCoMKgwqDCoMKgwqDCoMKgICogQVJNIFRPRE9zOg0KPiDCoMKgwqDCoMKgwqDCoMKg
ICogLSBPbiBBUk0gd2hldGhlciB0aGUgbWVtb3J5IGlzIHByZWZldGNoYWJsZSBvciBub3Qgc2hv
dWxkIGJlIHBhc3NlZA0KPiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIHRvIG1hcF9tbWlvX3JlZ2lv
bnMgaW4gb3JkZXIgdG8gZGVjaWRlIHdoaWNoIG1lbW9yeSBhdHRyaWJ1dGVzDQo+IMKgwqDCoMKg
wqDCoMKgwqAgKsKgwqAgc2hvdWxkIGJlIHVzZWQuDQo+IMKgwqDCoMKgwqDCoMKgwqAgKg0KPiDC
oMKgwqDCoMKgwqDCoMKgICogLSB7dW59bWFwX21taW9fcmVnaW9ucyBkb2Vzbid0IHN1cHBvcnQg
cHJlZW1wdGlvbi4NCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPg0KPiBUaGlzIGRvZXNuJ3Qgc2Vl
bSB0byBiZSBhZGRyZXNzZWQgaW4gdGhlIHR3byBzZXJpZXMgZm9yIFBDSSBwYXNzdGhyb3VnaCBz
ZW50IHNvIGZhci4gRG8geW91IGhhdmUgYW55IHBsYW4gdG8gaGFuZGxlIGl0Pw0KDQpObyBwbGFu
IHlldC4NCg0KQWxsIHRoZSBtYXBwaW5ncyBhcmUgaGFwcGVuaW5nIHdpdGggcDJtX21taW9fZGly
ZWN0X2RldiBhcyBvZiBub3cuDQoNCj4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0N
Cj4+IMKgIHhlbi9hcmNoL2FybS90cmFwcy5jIHwgNiArKysrKysNCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Ry
YXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4gaW5kZXggMjE5YWIzYzNmYmRlLi4xNTcx
ZmI4YWZkMDMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdHJhcHMuYw0KPj4gKysrIGIv
eGVuL2FyY2gvYXJtL3RyYXBzLmMNCj4+IEBAIC0zNCw2ICszNCw3IEBADQo+PiDCoCAjaW5jbHVk
ZSA8eGVuL3N5bWJvbHMuaD4NCj4+IMKgICNpbmNsdWRlIDx4ZW4vdmVyc2lvbi5oPg0KPj4gwqAg
I2luY2x1ZGUgPHhlbi92aXJ0dWFsX3JlZ2lvbi5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vdnBjaS5o
Pg0KPj4gwqAgwqAgI2luY2x1ZGUgPHB1YmxpYy9zY2hlZC5oPg0KPj4gwqAgI2luY2x1ZGUgPHB1
YmxpYy94ZW4uaD4NCj4+IEBAIC0yMzA0LDYgKzIzMDUsMTEgQEAgc3RhdGljIGJvb2wgY2hlY2tf
Zm9yX3ZjcHVfd29yayh2b2lkKQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoCAjZW5kaWYNCj4+IMKg
ICvCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOw0KPj4gK8KgwqDCoCBpZiAoIGhhc192cGNpKHYt
PmRvbWFpbikgJiYgdnBjaV9wcm9jZXNzX3BlbmRpbmcodikgKQ0KPg0KPiBMb29raW5nIGF0IHRo
ZSBjb2RlIG9mIHZwY2lfcHJvY2Vzc19wZW5kaW5nKCksIGl0IGxvb2tzIGxpa2UgdGhlcmUgYXJl
IHNvbWUgcmV3b3JrIHRvIGRvIGZvciBndWVzdC4gRG8geW91IHBsYW4gdG8gaGFuZGxlIGl0IGFz
IHBhcnQgb2YgdGhlIHZQQ0kgc2VyaWVzPw0KWWVzLCB2UENJIGNvZGUgaXMgaGVhdmlseSB0b3Vj
aGVkIHRvIHN1cHBvcnQgZ3Vlc3Qgbm9uLWlkZW50aXR5IG1hcHBpbmdzDQo+DQo+PiArwqDCoMKg
wqDCoMKgwqAgcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKTsNCj4+ICvCoMKgwqAgbG9j
YWxfaXJxX2Rpc2FibGUoKTsNCj4+ICsNCj4NCj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIG9mIHZj
cGlfcHJvY2Vzc19wZW5kaW5nKCkuIFRoZSBmdW5jdGlvbiB3aWxsIHJldHVybiB0cnVlIGlmIHRo
ZXJlIGFyZSBtb3JlIHdvcmsgdG8gc2NoZWR1bGUuDQpZZXMNCj4gSG93ZXZlciwgaWYgY2hlY2tf
Zm9yX3ZjcHVfZm9yX3dvcmsoKSByZXR1cm4gZmFsc2UsIHRoZW4gd2Ugd2lsbCByZXR1cm4gdG8g
dGhlIGd1ZXN0IGJlZm9yZSBhbnkgd29yayBmb3IgdkNQSSBoYXMgZmluaXNoZWQuIFRoaXMgaXMg
YmVjYXVzZSBjaGVja19mb3JfdmNwdV93b3JrKCkgd2lsbCBub3QgYmUgY2FsbGVkIGFnYWluLg0K
Q29ycmVjdA0KPg0KPiBJbiB0aGlzIGNhc2UsIEkgdGhpbmsgeW91IHdhbnQgdG8gcmV0dXJuIGFz
IHNvb24gYXMgeW91IGtub3cgd2UgbmVlZCB0byByZXNjaGVkdWxlLg0KTm90IHN1cmUgSSB1bmRl
cnN0YW5kIHRoaXMNCj4NCj4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUgcmVzdCBvZiB0aGUgY29k
ZSwgd2UgYWxyZWFkeSBoYXZlIGEgY2hlY2sgZm9yIHZwY2kgaW4gdGhlIGNvbW1vbiBJT1JFUSBj
b2RlLg0KDQpXaGljaCBtYXkgbm90IGJlIGVuYWJsZWQgYXMgaXQgZGVwZW5kcyBvbiBDT05GSUdf
SU9SRVFfU0VSVkVSLg0KDQpNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgZm9yIHg4NiBpdCBpcyBh
bHdheXMgZW5hYmxlZCwgYnV0IHRoaXMgbWlnaHQgbm90IGJlIHRoZSBjYXNlIGZvciBBcm0NCg0K
PiBTbyB3ZSB3b3VsZCBlbmQgdXAgdG8gY2FsbCB0d2ljZSB2cGNpX3Byb2Nlc3NfcGVuZGluZygp
Lg0KU28sIGlmIENPTkZJR19JT1JFUV9TRVJWRVIgaXMgbm90IGVuYWJsZWQgdGhlbiB3ZSBlbmQg
dXAgd2l0aCBvbmx5IGNhbGxpbmcgaXQgZnJvbSB0cmFwcy5jIG9uIEFybQ0KPiBNYXliZSB3ZSBz
aG91bGQgbW92ZSB0aGUgY2FsbCBmcm9tIHRoZSBJT1JFUSB0byBhcmNoLWNvZGUuDQoNCkhtLiBJ
IHdvdWxkIGJldHRlciB0aGluayBvZiBtb3ZpbmcgaXQgZnJvbSBJT1JFUSB0byBzb21lIG90aGVy
IGNvbW1vbiBjb2RlOiBmb3IgeDg2IChpZg0KDQpteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3QgYWJv
dXQgQ09ORklHX0lPUkVRX1NFUlZFUikgaXQgaXMgYnkgY29pbmNpZGVuY2UgdGhhdCB3ZSBjYWxs
IHZQQ0kNCg0KY29kZSBmcm9tIHRoZXJlIGFuZCBJT1JFUSBpcyBhbHdheXMgZW5hYmxlZC4NCg0K
Pg0KPiBDaGVlcnMsDQo+DQpUaGFuayB5b3UsDQoNCk9sZWtzYW5kcg0K

