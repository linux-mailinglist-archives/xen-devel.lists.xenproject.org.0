Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A828BAF6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Oct 2020 16:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5961.15553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRyxk-0006SA-QI; Mon, 12 Oct 2020 14:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5961.15553; Mon, 12 Oct 2020 14:38:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRyxk-0006Rl-MX; Mon, 12 Oct 2020 14:38:08 +0000
Received: by outflank-mailman (input) for mailman id 5961;
 Mon, 12 Oct 2020 14:38:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHVd=DT=epam.com=prvs=855414846c=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
 id 1kRyxj-0006Rg-6s
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:38:07 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29412c70-d056-4969-be6b-ad689cb23386;
 Mon, 12 Oct 2020 14:38:05 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09CEavic016322; Mon, 12 Oct 2020 14:38:02 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
 by mx0a-0039f301.pphosted.com with ESMTP id 344ktthqdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Oct 2020 14:38:02 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM6PR03MB4726.eurprd03.prod.outlook.com (2603:10a6:20b:d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Mon, 12 Oct
 2020 14:37:59 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 14:37:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IHVd=DT=epam.com=prvs=855414846c=anastasiia_lukianenko@srs-us1.protection.inumbo.net>)
	id 1kRyxj-0006Rg-6s
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:38:07 +0000
X-Inumbo-ID: 29412c70-d056-4969-be6b-ad689cb23386
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 29412c70-d056-4969-be6b-ad689cb23386;
	Mon, 12 Oct 2020 14:38:05 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
	by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09CEavic016322;
	Mon, 12 Oct 2020 14:38:02 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55])
	by mx0a-0039f301.pphosted.com with ESMTP id 344ktthqdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2020 14:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itiyESxEjlTiJPNUa0OkRLxBsz3gq31G322uoyWowW8zKpp1ifN1ufAyYvKi8ez3aok87DVsT9TWDY1IdxYGJbtPIEmXStdD9gfXvu2/ru7uPZK4cqLp/yI1C2U0epBygcFlGZlXZNiduSd4avFTDTiDlV/EhrtKrnCsLFmhlwJomt8tL+RZaNsGJ7p8mh90ZEueWPEECw1kSvCqnZPpRKmc8H6NGXNxgnmE5PpuSHiO7F+z0DX4y3FgeloSlsnnhzRftaSTVsd4X3glDDlEQg205RzP1vjj1hKxN1Xep0in4TIHIegJMt+3pnirMSp6xqNYNY9pQ6RuPUYf+H+78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX3IZ+BX9MUB9mUwmLhy1WSZc8H8kV7aXxWovIdiUf4=;
 b=OopyCgnRCQ5fggPNMuCIP0D2mkjxay6bePUzcgqQWypQYEuhJ2s7GckVAzsUS4aXZaYhq5NJ3nk9VCVjERmIn31yR+iPIOQtQLgzdNs4bf3CySdOhN9Ive82+z3XsO1rOZo5wVcgmcJn+gDP6a5jqKn8quESuhJVMuGUtTEKnEYPviyWMHsB7PANaCtTPkzz6Vlt9fJpFmdyJRh10EdkyfWX/fAgprsCoYf9yj6k89sdHgn/EjNXPOgbX62d+dYTqdELqf7ECJUnnUPeYjRGYgjgpFonnvW4ZxGcEYZ1xaJeXjLajzqWsPNECNQW+xLr35vx8ReE7VHKcz/hkIe/GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX3IZ+BX9MUB9mUwmLhy1WSZc8H8kV7aXxWovIdiUf4=;
 b=YuWhwbhMrB3lqEfdd9Mb2abGQ3cSUeH6T9PMl/YaiHTfOgSdADPbxgJe9ALXhG9nivXj5JkLIC7nEftz/RO89JfC72kIHygUoG42vKd6fCgCZaYbMTwjEJLWoFO3Wz4vbjnvH9sIo93CLY7lELY5m7sPhex/aZxwgxURSVMkX+9++EtQbHaqbh+CgtLOfXQXvfAp6bIhuVnY/FqQJRtpo2+qn1E6YfYxOtVFnaVjsMgF8xyTvoV5e3PIK+aQutR9gOh8eQDXzurz40fIjlpygjbtVAhda/0tptx1OUE05UPWmqZMadUrA5Av3snPdXBGBQGfGOJN7hSy7isMF9I2Ag==
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com (2603:10a6:20b:1c2::6)
 by AM6PR03MB4726.eurprd03.prod.outlook.com (2603:10a6:20b:d::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Mon, 12 Oct
 2020 14:37:59 +0000
Received: from AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8]) by AM7PR03MB6531.eurprd03.prod.outlook.com
 ([fe80::9439:23f1:1063:ad8%5]) with mapi id 15.20.3455.030; Mon, 12 Oct 2020
 14:37:59 +0000
From: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>
CC: "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
        "vicooodin@gmail.com" <vicooodin@gmail.com>,
        "julien@xen.org"
	<julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Artem
 Mygaiev <Artem_Mygaiev@epam.com>,
        "committers@xenproject.org"
	<committers@xenproject.org>,
        "George.Dunlap@citrix.com"
	<George.Dunlap@citrix.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen Coding style and clang-format
Thread-Topic: Xen Coding style and clang-format
Thread-Index: 
 AQHWlwq4nKYEhMN38U+xmvwRsutq+amA8joAgAAHUgCAAXyKAIAAENkAgAlxpgCAAPgwAIAHK7QA
Date: Mon, 12 Oct 2020 14:37:58 +0000
Message-ID: <c391abc7b03b90496dea307ef9a8a08d94a862a9.camel@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
	  <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
	  <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
	  <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
	  <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
	 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
	 <alpine.DEB.2.21.2010071750360.23978@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2010071750360.23978@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.213.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5638ae55-bb32-4748-af3a-08d86ebc6a61
x-ms-traffictypediagnostic: AM6PR03MB4726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM6PR03MB47266C6604CE3DF5F8AE88D6F2070@AM6PR03MB4726.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YJxOKBVoxzQZZq67WYf6Dyd/C6c5S4hPEfFDG9Fi19zLpkbXqH7gXVtTUvr9BY7uQEgfMFimP/a4EhPVQ6G/SIJF3JTTW9p/WydBhpKWICpVTG8TI2+/KhKx8VUYtPfejshd3uAbcFCJF3mZqrKjZHHnHXuHWKhZKs6urRymf8CNjN7cprauL+JzZ6He75sdZuZK9gRa6Q+jsUe88H/8PNWR3TxksPGaNLlC5sKNDDGw6VMRdPnrCTehiaf3q1WGfbk7zV+ua2yJWgB24Uy4AuFg7vge3sV0KdYmw+c0KaRgwrWnDjOS1cZGrWzPrGJF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR03MB6531.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(6512007)(5660300002)(64756008)(478600001)(66446008)(186003)(36756003)(66946007)(2616005)(91956017)(76116006)(66556008)(66476007)(54906003)(316002)(6486002)(55236004)(86362001)(6916009)(4326008)(71200400001)(8676002)(6506007)(53546011)(26005)(8936002)(83380400001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 7xIH4csoY4iQGoiqTRz7wg79MJyMt+1lTz1QrO67BT/IfnExRjnmaMBpG2cz2ihXkGgCnTGzKypjYaFQ18V8+ALdtiAfCRNiWjdUVinEJ1t2bEqiXbgPFUns36DBLRLIRUy/A6pVCx+p2S/5IAwxgcJdmlHf8VeTmMhh1CPnJky4FenFmh1CYGXOq6LZhHgP/0zhfLfklPFkd9gSL6AIMDacGpPEfS4ogXb2xakPiebyEUh61kfknVCIY9F7aJpYceTC40W+mUXmHR645AQ1NM+eDY3JQuOsPrGKjuUcHnNAAmtf93hjdQdWIbqLWKd5x09MzVHTATqK2R/I28hBsPLExijF8BO0VNjIRpOHgUg4KF3jFTiuAmQt0YB8uZV3Drbccie5W8I3vEE/dlN3iS/3Zx6g+TC2tTRoqVaDnV5Y8CzC8qKIvIaOnO702otv4tPdqcSBdOjbHdqDSfu7rCxgDmVHAUGSsUp10hpVLgmDH0AErTNhi82KcBOj3taWzbZYVQDWQ4P1uZlpO1Y/v2XWRhrMQjCfjC2zHYCxX+MZ8rjCuwxx272Axzo1pNL4DQsEiZmUHA32hLDArvOvkGVIPmV4rFrOrEqF1kWMFthWBPkOsWG2IoPa4YbJrObpU1YgtPZf+Dpl6Xs/PuV3zw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <79899CFBF5C3374BAF6504613618A6BE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR03MB6531.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5638ae55-bb32-4748-af3a-08d86ebc6a61
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 14:37:58.9095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CR5/my7QflEltxp6qGobCY7sVXxhJSbEXa6YVO4ocq3FuxMpzYSX2HVAYiUhaK4yO+f2ql6URLJ/wITEafyaJwEiwU4Qew73LT+Cnrz3NUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4726
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-12_12:2020-10-12,2020-10-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010120118

SGkgYWxsLA0KDQpPbiBXZWQsIDIwMjAtMTAtMDcgYXQgMTg6MDcgLTA3MDAsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToNCj4gT24gV2VkLCA3IE9jdCAyMDIwLCBBbmFzdGFzaWlhIEx1a2lhbmVu
a28gd3JvdGU6DQo+ID4gT24gVGh1LCAyMDIwLTEwLTAxIGF0IDEwOjA2ICswMDAwLCBHZW9yZ2Ug
RHVubGFwIHdyb3RlOg0KPiA+ID4gPiBPbiBPY3QgMSwgMjAyMCwgYXQgMTA6MDYgQU0sIEFuYXN0
YXNpaWEgTHVraWFuZW5rbyA8DQo+ID4gPiA+IEFuYXN0YXNpaWFfTHVraWFuZW5rb0BlcGFtLmNv
bT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBIaSwNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIFdl
ZCwgMjAyMC0wOS0zMCBhdCAxMDoyNCArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gPiA+
ID4gPiA+IE9uIFNlcCAzMCwgMjAyMCwgYXQgMTA6NTcgQU0sIEphbiBCZXVsaWNoIDwNCj4gPiA+
ID4gPiA+IGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IE9uIDMwLjA5LjIwMjAgMTE6MTgsIEFuYXN0YXNpaWEgTHVraWFuZW5r
byB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSSB3b3VsZCBsaWtlIHRvIGtub3cgeW91ciBvcGluaW9u
IG9uIHRoZSBmb2xsb3dpbmcgY29kaW5nDQo+ID4gPiA+ID4gPiA+IHN0eWxlDQo+ID4gPiA+ID4g
PiA+IGNhc2VzLg0KPiA+ID4gPiA+ID4gPiBXaGljaCBvcHRpb24gZG8geW91IHRoaW5rIGlzIGNv
cnJlY3Q/DQo+ID4gPiA+ID4gPiA+IDEpIEZ1bmN0aW9uIHByb3RvdHlwZSB3aGVuIHRoZSBzdHJp
bmcgbGVuZ3RoIGlzIGxvbmdlcg0KPiA+ID4gPiA+ID4gPiB0aGFuDQo+ID4gPiA+ID4gPiA+IHRo
ZQ0KPiA+ID4gPiA+ID4gPiBhbGxvd2VkDQo+ID4gPiA+ID4gPiA+IG9uZQ0KPiA+ID4gPiA+ID4g
PiAtc3RhdGljIGludCBfX2luaXQNCj4gPiA+ID4gPiA+ID4gLWFjcGlfcGFyc2VfZ2ljX2NwdV9p
bnRlcmZhY2Uoc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyDQo+ID4gPiA+ID4gPiA+ICpoZWFk
ZXIsDQo+ID4gPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVu
c2lnbmVkIGxvbmcgZW5kKQ0KPiA+ID4gPiA+ID4gPiArc3RhdGljIGludCBfX2luaXQgYWNwaV9w
YXJzZV9naWNfY3B1X2ludGVyZmFjZSgNCj4gPiA+ID4gPiA+ID4gKyAgICBzdHJ1Y3QgYWNwaV9z
dWJ0YWJsZV9oZWFkZXIgKmhlYWRlciwgY29uc3QgdW5zaWduZWQNCj4gPiA+ID4gPiA+ID4gbG9u
Zw0KPiA+ID4gPiA+ID4gPiBlbmQpDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IEJvdGggdmFy
aWFudHMgYXJlIGRlZW1lZCB2YWxpZCBzdHlsZSwgSSB0aGluayAoc2FtZSBhbHNvDQo+ID4gPiA+
ID4gPiBnb2VzDQo+ID4gPiA+ID4gPiBmb3INCj4gPiA+ID4gPiA+IGZ1bmN0aW9uIGNhbGxzIHdp
dGggdGhpcyBzYW1lIHByb2JsZW0pLiBJbiBmYWN0IHlvdSBtaXggdHdvDQo+ID4gPiA+ID4gPiBk
aWZmZXJlbnQgc3R5bGUgYXNwZWN0cyB0b2dldGhlciAocGxhY2VtZW50IG9mIHBhcmFtZXRlcg0K
PiA+ID4gPiA+ID4gZGVjbGFyYXRpb25zIGFuZCBwbGFjZW1lbnQgb2YgcmV0dXJuIHR5cGUgZXRj
KSAtIGZvciBlYWNoDQo+ID4gPiA+ID4gPiBpbmRpdmlkdWFsbHkgYm90aCBmb3JtcyBhcmUgZGVl
bWVkIGFjY2VwdGFibGUsIEkgdGhpbmsuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSWYgd2XigJly
ZSBnb2luZyB0byBoYXZlIGEgdG9vbCBnbyB0aHJvdWdoIGFuZCByZXBvcnQNCj4gPiA+ID4gPiAo
Y29ycmVjdD8pDQo+ID4gPiA+ID4gYWxsDQo+ID4gPiA+ID4gdGhlc2UgY29kaW5nIHN0eWxlIHRo
aW5ncywgaXTigJlzIGFuIG9wcG9ydHVuaXR5IHRvIHRoaW5rIGlmIHdlDQo+ID4gPiA+ID4gd2Fu
dCB0bw0KPiA+ID4gPiA+IGFkZCBuZXcgY29kaW5nIHN0eWxlIHJlcXVpcmVtZW50cyAob3IgY2hh
bmdlIGV4aXN0aW5nDQo+ID4gPiA+ID4gcmVxdWlyZW1lbnRzKS4NCj4gPiA+ID4gPiANCj4gPiA+
ID4gDQo+ID4gPiA+IEkgYW0gcmVhZHkgdG8gZGlzY3VzcyBuZXcgcmVxdWlyZW1lbnRzIGFuZCBp
bXBsZW1lbnQgdGhlbSBpbg0KPiA+ID4gPiBydWxlcw0KPiA+ID4gPiBvZg0KPiA+ID4gPiB0aGUg
WGVuIENvZGluZyBzdHlsZSBjaGVja2VyLg0KPiA+ID4gDQo+ID4gPiBUaGFuayB5b3UuIDotKSAg
QnV0IHdoYXQgSSBtZWFudCB3YXM6IFJpZ2h0IG5vdyB3ZSBkb27igJl0IHJlcXVpcmUNCj4gPiA+
IG9uZQ0KPiA+ID4gYXBwcm9hY2ggb3IgdGhlIG90aGVyIGZvciB0aGlzIHNwZWNpZmljIGluc3Rh
bmNlLiAgRG8gd2Ugd2FudCB0bw0KPiA+ID4gY2hvb3NlIG9uZT8NCj4gPiA+IA0KPiA+ID4gSSB0
aGluayBpbiB0aGlzIGNhc2UgaXQgbWFrZXMgc2Vuc2UgdG8gZG8gdGhlIGVhc2llc3QgdGhpbmcu
ICBJZg0KPiA+ID4gaXTigJlzDQo+ID4gPiBlYXN5IHRvIG1ha2UgdGhlIGN1cnJlbnQgdG9vbCBh
Y2NlcHQgYm90aCBzdHlsZXMsIGxldOKAmXMganVzdCBkbw0KPiA+ID4gdGhhdA0KPiA+ID4gZm9y
IG5vdy4gIElmIHRoZSB0b29sIGN1cnJlbnRseSBmb3JjZXMgeW91IHRvIGNob29zZSBvbmUgb2Yg
dGhlDQo+ID4gPiB0d28NCj4gPiA+IHN0eWxlcywgbGV04oCZcyBjaG9vc2Ugb25lLg0KPiA+ID4g
DQo+ID4gPiAgLUdlb3JnZQ0KPiA+IA0KPiA+IER1cmluZyB0aGUgZGV0YWlsZWQgc3R1ZHkgb2Yg
dGhlIFhlbiBjaGVja2VyIGFuZCB0aGUgQ2xhbmctRm9ybWF0DQo+ID4gU3R5bGUNCj4gPiBPcHRp
b25zLCBpdCB3YXMgZm91bmQgdGhhdCB0aGlzIHRvb2wsIHVuZm9ydHVuYXRlbHksIGlzIG5vdCBz
bw0KPiA+IGZsZXhpYmxlDQo+ID4gdG8gYWxsb3cgdGhlIGF1dGhvciB0byBpbmRlcGVuZGVudGx5
IGNob29zZSB0aGUgZm9ybWF0dGluZyBzdHlsZSBpbg0KPiA+IHNpdHVhdGlvbnMgdGhhdCBJIGRl
c2NyaWJlZCBpbiB0aGUgbGFzdCBsZXR0ZXIuIEZvciBleGFtcGxlIGRlZmluZQ0KPiA+IGNvZGUN
Cj4gPiBzdHlsZToNCj4gPiAtI2RlZmluZSBBTExSRUdTIFwNCj4gPiAtICAgIEMocjAsIHIwX3Vz
cik7ICAgQyhyMSwgcjFfdXNyKTsgICBDKHIyLCByMl91c3IpOyAgIEMocjMsDQo+ID4gcjNfdXNy
KTsgICBcDQo+ID4gLSAgICBDKGNwc3IsIGNwc3IpDQo+ID4gKyNkZWZpbmUgQUxMUkVHUyAgICAg
ICAgICAgIFwNCj4gPiArICAgIEMocjAsIHIwX3Vzcik7ICAgICAgICAgXA0KPiA+ICsgICAgQyhy
MSwgcjFfdXNyKTsgICAgICAgICBcDQo+ID4gKyAgICBDKHIyLCByMl91c3IpOyAgICAgICAgIFwN
Cj4gPiBUaGVyZSBhcmUgYWxzbyBzb21lIGluY29uc2lzdGVuY2llcyBpbiB0aGUgZm9ybWF0dGlu
ZyBvZiB0aGUgdG9vbA0KPiA+IGFuZA0KPiA+IHdoYXQgaXMgd3JpdHRlbiBpbiB0aGUgaHl1bmcg
Y29kaW5nIHN0eWxlIHJ1bGVzLiBGb3IgZXhhbXBsZSwgdGhlDQo+ID4gY29tbWVudCBmb3JtYXQ6
DQo+ID4gLSAgICAvKiBQQyBzaG91bGQgYmUgYWx3YXlzIGEgbXVsdGlwbGUgb2YgNCwgYXMgWGVu
IGlzIHVzaW5nIEFSTQ0KPiA+IGluc3RydWN0aW9uIHNldCAqLw0KPiA+ICsgICAgLyogUEMgc2hv
dWxkIGJlIGFsd2F5cyBhIG11bHRpcGxlIG9mIDQsIGFzIFhlbiBpcyB1c2luZyBBUk0NCj4gPiBp
bnN0cnVjdGlvbiBzZXQNCj4gPiArICAgICAqLw0KPiA+IEkgd291bGQgbGlrZSB0byBkcmF3IHlv
dXIgYXR0ZW50aW9uIHRvIHRoZSBmYWN0IHRoYXQgdGhlIGNvbW1lbnQNCj4gPiBiZWhhdmVzIGlu
IHRoaXMgd2F5LCBzaW5jZSB0aGUgbGluZSBsZW5ndGggZXhjZWVkcyB0aGUgYWxsb3dhYmxlDQo+
ID4gb25lLg0KPiA+IFRoZSBSZWZsb3dDb21tZW50cyBvcHRpb24gaXMgcmVzcG9uc2libGUgZm9y
IHRoaXMgZm9ybWF0LiBJdCBjYW4gYmUNCj4gPiB0dXJuZWQgb2ZmLCBidXQgdGhlbiB0aGUgcmVz
dWx0IHdpbGwgYmU6DQo+ID4gUmVmbG93Q29tbWVudHM9ZmFsc2U6DQo+ID4gLyogc2Vjb25kIHZl
cnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5TG9uZ0NvbW1lbnQNCj4g
PiB3aXRoDQo+ID4gcGxlbnR5IG9mIGluZm9ybWF0aW9uICovDQo+ID4gDQo+ID4gUmVmbG93Q29t
bWVudHM9dHJ1ZToNCj4gPiAvKiBzZWNvbmQgdmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZl
cnlWZXJ5VmVyeVZlcnlMb25nQ29tbWVudA0KPiA+IHdpdGgNCj4gPiBwbGVudHkgb2YNCj4gPiAg
KiBpbmZvcm1hdGlvbiAqLw0KPiANCj4gVG8gbWUsIHRoZSBwcmluY2lwYWwgZ29hbCBvZiB0aGUg
dG9vbCBpcyB0byBpZGVudGlmeSBjb2RlIHN0eWxlDQo+IHZpb2xhdGlvbnMuIFN1Z2dlc3Rpbmcg
aG93IHRvIGZpeCBhIHZpb2xhdGlvbiBpcyBhbiBhZGRlZCBib251cyBidXQNCj4gbm90DQo+IHN0
cmljdGx5IG5lY2Vzc2FyeS4NCj4gDQo+IFNvLCBJIHRoaW5rIHdlIGRlZmluaXRlbHkgd2FudCB0
aGUgdG9vbCB0byByZXBvcnQgdGhlIGZvbGxvd2luZyBsaW5lDQo+IGFzDQo+IGFuIGVycm9yLCBi
ZWNhdXNlIHRoZSBsaW5lIGlzIHRvbyBsb25nOg0KPiANCj4gLyogc2Vjb25kIHZlcnlWZXJ5VmVy
eVZlcnlWZXJ5VmVyeVZlcnlWZXJ5VmVyeVZlcnlWZXJ5TG9uZ0NvbW1lbnQNCj4gd2l0aCBwbGVu
dHkgb2YgaW5mb3JtYXRpb24gKi8NCj4gDQo+IFRoZSBzdWdnZXN0aW9uIG9uIGhvdyB0byBmaXgg
aXQgaXMgbGVzcyBpbXBvcnRhbnQuIERvIHdlIG5lZWQgdG8gc2V0DQo+IFJlZmxvd0NvbW1lbnRz
PXRydWUgaWYgd2Ugd2FudCB0byB0aGUgdG9vbCB0byByZXBvcnQgdGhlIGxpbmUgYXMNCj4gZXJy
b25lb3VzPyBJIHRha2UgdGhhdCB0aGUgYW5zd2VyIGlzICJ5ZXMiPw0KPiANCj4gDQo+ID4gU28g
SSB3YW50IHRvIGtub3cgaWYgdGhlIGNvbW11bml0eSBpcyByZWFkeSB0byBhZGQgbmV3IGZvcm1h
dHRpbmcNCj4gPiBvcHRpb25zIGFuZCBlZGl0IG9sZCBvbmVzLiBCZWxvdyBJIHdpbGwgZ2l2ZSBl
eGFtcGxlcyBvZiB3aGF0DQo+ID4gY29ycmVjdGlvbnMgdGhlIGNoZWNrZXIgaXMgY3VycmVudGx5
IG1ha2luZyAodGhlIGZpcnN0IHZhcmlhbnQgaW4NCj4gPiBlYWNoDQo+ID4gY2FzZSBpcyBleGlz
dGluZyBjb2RlIGFuZCB0aGUgc2Vjb25kIHZhcmlhbnQgaXMgZm9ybWF0dGVkIGJ5DQo+ID4gY2hl
Y2tlcikuDQo+ID4gSWYgdGhleSBmaXQgdGhlIHN0YW5kYXJkcywgdGhlbiBJIGNhbiBkb2N1bWVu
dCB0aGVtIGluIHRoZSBjb2RpbmcNCj4gPiBzdHlsZS4gSWYgbm90LCB0aGVuIEkgdHJ5IHRvIGNv
bmZpZ3VyZSB0aGUgY2hlY2tlci4gQnV0IHRoZSBpZGVhIGlzDQo+ID4gdGhhdCB3ZSBuZWVkIHRv
IGNob29zZSBvbmUgb3B0aW9uIHRoYXQgd2lsbCBiZSBjb25zaWRlcmVkIGNvcnJlY3QuDQo+ID4g
DQo+ID4gMSkgRnVuY3Rpb24gcHJvdG90eXBlIHdoZW4gdGhlIHN0cmluZyBsZW5ndGggaXMgbG9u
Z2VyIHRoYW4gdGhlDQo+ID4gYWxsb3dlZA0KPiA+IC1zdGF0aWMgaW50IF9faW5pdA0KPiA+IC1h
Y3BpX3BhcnNlX2dpY19jcHVfaW50ZXJmYWNlKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRlciAq
aGVhZGVyLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVk
IGxvbmcgZW5kKQ0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2dpY19jcHVfaW50
ZXJmYWNlKA0KPiA+ICsgICAgc3RydWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICpoZWFkZXIsIGNv
bnN0IHVuc2lnbmVkIGxvbmcgZW5kKQ0KPiA+IDIpIFdyYXBwaW5nIGFuIG9wZXJhdGlvbiB0byBh
IG5ldyBsaW5lIHdoZW4gdGhlIHN0cmluZyBsZW5ndGggaXMNCj4gPiBsb25nZXINCj4gPiB0aGFu
IHRoZSBhbGxvd2VkDQo+ID4gLSAgICBzdGF0dXMgPSBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19T
UENSLCAwLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgKHN0cnVjdCBhY3BpX3Rh
YmxlX2hlYWRlciAqKikmc3Bjcik7DQo+ID4gKyAgICBzdGF0dXMgPQ0KPiA+ICsgICAgICAgIGFj
cGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1IsIDAsIChzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIN
Cj4gPiAqKikmc3Bjcik7DQo+ID4gMykgU3BhY2UgYWZ0ZXIgYnJhY2tldHMNCj4gPiAtICAgIHJl
dHVybiAoKGNoYXIgKikgYmFzZSArIG9mZnNldCk7DQo+ID4gKyAgICByZXR1cm4gKChjaGFyICop
YmFzZSArIG9mZnNldCk7DQo+ID4gNCkgU3BhY2VzIGluIGJyYWNrZXRzIGluIHN3aXRjaCBjb25k
aXRpb24NCj4gPiAtICAgIHN3aXRjaCAoIGRvbWN0bC0+Y21kICkNCj4gPiArICAgIHN3aXRjaCAo
ZG9tY3RsLT5jbWQpDQo+ID4gNSkgU3BhY2VzIGluIGJyYWNrZXRzIGluIG9wZXJhdGlvbg0KPiA+
IC0gICAgaW1tID0gKCBpbnNuID4+IEJSQU5DSF9JTlNOX0lNTV9TSElGVCApICYNCj4gPiBCUkFO
Q0hfSU5TTl9JTU1fTUFTSzsNCj4gPiArICAgIGltbSA9IChpbnNuID4+IEJSQU5DSF9JTlNOX0lN
TV9TSElGVCkgJiBCUkFOQ0hfSU5TTl9JTU1fTUFTSzsNCj4gPiA2KSBTcGFjZXMgaW4gYnJhY2tl
dHMgaW4gcmV0dXJuDQo+ID4gLSAgICAgICAgcmV0dXJuICggIXN5bS0+bmFtZVsyXSB8fCBzeW0t
Pm5hbWVbMl0gPT0gJy4nICk7DQo+ID4gKyAgICAgICAgcmV0dXJuICghc3ltLT5uYW1lWzJdIHx8
IHN5bS0+bmFtZVsyXSA9PSAnLicpOw0KPiA+IDcpIFNwYWNlIGFmdGVyIHNpemVvZg0KPiA+IC0g
ICAgY2xlYW5fYW5kX2ludmFsaWRhdGVfZGNhY2hlX3ZhX3JhbmdlKG5ld19wdHIsIHNpemVvZg0K
PiA+ICgqbmV3X3B0cikgKg0KPiA+IGxlbik7DQo+ID4gKyAgICBjbGVhbl9hbmRfaW52YWxpZGF0
ZV9kY2FjaGVfdmFfcmFuZ2UobmV3X3B0ciwgc2l6ZW9mKCpuZXdfcHRyKQ0KPiA+ICoNCj4gPiBs
ZW4pOw0KPiA+IDgpIFNwYWNlcyBiZWZvcmUgY29tbWVudCBpZiBpdOKAmXMgb24gdGhlIHNhbWUg
bGluZQ0KPiA+IC0gICAgY2FzZSBSX0FSTV9NT1ZUX0FCUzogLyogUyArIEEgKi8NCj4gPiArICAg
IGNhc2UgUl9BUk1fTU9WVF9BQlM6ICAgIC8qIFMgKyBBICovDQo+ID4gDQo+ID4gLSAgICBpZiAo
IHRtcCA9PSAwVUwgKSAgICAgICAvKiBBcmUgYW55IGJpdHMgc2V0PyAqLw0KPiA+IC0gICAgICAg
IHJldHVybiByZXN1bHQgKyBzaXplOyAgIC8qIE5vcGUuICovDQo+ID4gKyAgICBpZiAoIHRtcCA9
PSAwVUwgKSAgICAgICAgIC8qIEFyZSBhbnkgYml0cyBzZXQ/ICovDQo+ID4gKyAgICAgICAgcmV0
dXJuIHJlc3VsdCArIHNpemU7IC8qIE5vcGUuICovDQo+ID4gDQo+ID4gOSkgU3BhY2UgYWZ0ZXIg
Zm9yX2VhY2hfdmNwdQ0KPiA+IC0gICAgICAgIGZvcl9lYWNoX3ZjcHUoZCwgdikNCj4gPiArICAg
ICAgICBmb3JfZWFjaF92Y3B1IChkLCB2KQ0KPiA+IDEwKSBTcGFjZXMgaW4gZGVjbGFyYXRpb24N
Cj4gPiAtICAgIHVuaW9uIGhzciBoc3IgPSB7IC5iaXRzID0gcmVncy0+aHNyIH07DQo+ID4gKyAg
ICB1bmlvbiBoc3IgaHNyID0gey5iaXRzID0gcmVncy0+aHNyfTsNCj4gDQo+IE5vbmUgb2YgdGhl
c2UgcG9pbnRzIGFyZSBwYXJ0aWN1bGFybHkgcHJvYmxlbWF0aWMgdG8gbWUuIEkgdGhpbmsgdGhh
dA0KPiBzb21lIG9mIHRoZW0gYXJlIGdvb2QgdG8gaGF2ZSBhbnl3YXksIGxpa2UgMykgYW5kIDgp
LiBTb21lIG90aGVycyBhcmUNCj4gbm90IGdyZWF0LCBpbiBwYXJ0aWN1bGFyIDEpIGFuZCAyKSwg
YW5kIEkgd291bGQgcHJlZmVyIHRvIGtlZXAgdGhlDQo+IGN1cnJlbnQgY29kaW5nIHN0eWxlIGZv
ciB0aG9zZSwgYnV0IEknZCBiZSBjZXJ0YWlubHkgaGFwcHkgdG8gbWFrZQ0KPiB0aG9zZQ0KPiBj
aGFuZ2VzIGFueXdheSBpZiB3ZSBnZXQgYSBnb29kIGNvZGUgc3R5bGUgY2hlY2tlciBpbiBleGNo
YW5nZSA6LSkNCg0KVGhhbmsgeW91IGZvciBjb21tZW50cyA6KQ0KDQpJZiBubyBvbmUgb2JqZWN0
cywgSSB3aWxsIHNvb24gcHJlcGFyZSBhIHZlcnNpb24gb2YgdGhlIGNoZWNrZXIgd2l0aA0KbWlu
b3IgY2hhbmdlcyBhbmQgYWRkaXRpb25zIHRvIHRoZSBjb2Rpbmcgc3R5bGUgZG9jdW1lbnQuDQoN
ClJlZ2FyZHMsDQpBbmFzdGFzaWlhDQo=

