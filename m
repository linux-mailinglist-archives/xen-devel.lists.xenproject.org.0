Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAFF3BBCB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 20:23:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haOuJ-00025R-OH; Mon, 10 Jun 2019 18:20:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kwP5=UJ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1haOuH-00025M-Pf
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 18:20:33 +0000
X-Inumbo-ID: 6de65f7b-8bac-11e9-8980-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::617])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6de65f7b-8bac-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmbOPEpmn+GpG2We+cSdvxUCtAq/VSOPqjZNQlEgcjk=;
 b=lc3zr6KD6p4AljRIvAQpBIjiizd1BQtqKye5lTaJOvZHVRYLrHmqbnPxmIMR+UNoXLEHDFKPJeP8C12syBBd4ys7y1hiovwV7oH6QvBEZdnt2A7t+4bT3fMq1KCuMvJXc4lobd9gyHBzOW1ZtOe8y8i92z+AW9si3SV6sJqBMyBajtnudGJbmy/3+hYB1FIdP+25UKT+Wzn1snDlXDGRGUnZnAVuItk2TZ80jYhGI//w/avJv7NggT2x2ZFc4y6RlhUYZ8lAIrh/y97JmFFM3EYHv40orbAAFsGaL1MduznNWBYRlYOkDaZPT4I8u8dHbiYt4jR5+D841pYoBPyk5w==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB3987.eurprd03.prod.outlook.com (52.135.145.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 18:20:27 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::d09e:ef3:88b6:b1eb%7]) with mapi id 15.20.1965.011; Mon, 10 Jun 2019
 18:20:27 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v5 02/10] xen/arm: optee: add OP-TEE header files
Thread-Index: AQHVEBvBAXiZovdk50GWYhABnIROyKaJ5K+AgAttcoA=
Date: Mon, 10 Jun 2019 18:20:26 +0000
Message-ID: <87zhmp715i.fsf@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-3-volodymyr_babchuk@epam.com>
 <1908edda-cdc9-0550-1d56-0332ba91daec@arm.com>
In-Reply-To: <1908edda-cdc9-0550-1d56-0332ba91daec@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b4e76e8-9521-45dd-32b1-08d6edd0500c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM0PR03MB3987; 
x-ms-traffictypediagnostic: AM0PR03MB3987:
x-microsoft-antispam-prvs: <AM0PR03MB3987E2B03ED223D5596316F6E6130@AM0PR03MB3987.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(376002)(366004)(199004)(189003)(36756003)(5660300002)(86362001)(305945005)(99286004)(6512007)(3846002)(6486002)(256004)(66476007)(73956011)(76116006)(91956017)(66556008)(64756008)(66446008)(66946007)(6916009)(6116002)(14444005)(2906002)(54906003)(25786009)(80792005)(8676002)(55236004)(4326008)(316002)(72206003)(66066001)(53936002)(81156014)(8936002)(26005)(53546011)(102836004)(7736002)(6506007)(71200400001)(476003)(478600001)(186003)(71190400001)(76176011)(4744005)(81166006)(6246003)(68736007)(14454004)(2616005)(446003)(229853002)(486006)(11346002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB3987;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hlExExv4bLhZvhRdyDY1P/ljOno2jm2tCVTFdX5UzFnOo5vhny6HRNEkhvd7IPEMoVPoxy193fa2n9fKU5l5TB0tPeFIWdiXfWR3K2jNqgIf0jLWPcq8gFLO+seXpbIOLCe+uXaqHWzKIyORotkDAHhs+FNZW9xKcrcEeV6kdka6A/CkXmZKmEEoBaOtKRSyawc+tKlZkxxCJpRbYzuUXM3AvzwlE5quF5iJZBYvzmKMNUDyJeZ0daaxeTMrIBHkKLLPXsUUvQdgCAU/nfl5iLphPk3DibOhzu23bLMHPEWKx8z9wV8oLrJVaOpgXBuYvP8Z66BFCbRa0qxEbS/lCn/a3yu3yQ9TA49GSBV/zumtFhJw6DaKCduxo+z8LunTJrlThM8U4bJSXdvxuQMstLrPbAKsvnoYVAqlcI1UqXU=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4e76e8-9521-45dd-32b1-08d6edd0500c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 18:20:27.0021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Volodymyr_Babchuk@epam.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3987
Subject: Re: [Xen-devel] [PATCH v5 02/10] xen/arm: optee: add OP-TEE header
 files
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24gMjEvMDUvMjAx
OSAyMjoyNSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+IFRoaXMgaGVhZGVyIGZpbGVzIGRl
c2NyaWJlcyBwcm90b2NvbCBiZXR3ZWVuIE9QLVRFRSBhbmQgT1AtVEVFIGNsaWVudAo+PiBkcml2
ZXIgaW4gTGludXguIFRoZXkgYXJlIG5lZWRlZCBmb3IgdXBjb21pbmcgT1AtVEVFIG1lZGlhdG9y
LCB3aGljaAo+PiBpcyBhZGRlZCBpbiB0aGUgbmV4dCBwYXRjaC4KPj4gUmVhc29uIHRvIGFkZCB0
aG9zZSBoZWFkZXJzIGluIHNlcGFyYXRlIHBhdGNoIGlzIHRvIGVhc2UgdXAgcmV2aWV3Lgo+PiBU
aG9zZSBmaWxlcyB3ZXJlIHRha2VuIGZyb20gbGludXggdHJlZSAoZHJpdmVycy90ZWUvb3B0ZWUv
KSBhbmQgbWFuZ2xlZAo+PiBhIGJpdCB0byBjb21waWxlIHdpdGggWEVOLgo+Cj4gQ2FuIHlvdSBt
ZW50aW9uIHRoZSB2ZXJzaW9uIG9mIHRoZSBMaW51eCB0cmVlIHlvdSB1c2U/IFRoaXMgd291bGQg
aGVscAo+IHRvIHRyYWNrIGNoYW5nZSBpbiB0aGUgZnV0dXJlLgpBY3R1YWxseSB0aGlzIGNvbW1p
dCBkZXNjcmlwdGlvbiBpcyBub3QgdmFsaWQgYW55bW9yZS4gQWZ0ZXIgSSBhZGRlZApjYWxscyB0
byBpbmZvcm0gT1AtVEVFIGFib3V0IGd1ZXN0IGNyZWF0aW9uL2Rlc3RydWN0aW9uLCB0aG9zZSBm
aWxlcwpkb2VzIG5vdCBjb3JyZXNwb25kIHRvIGFueSBMaW51eCB2ZXJzaW9uIGFueW1vcmUuCgpT
bywgSSdsbCB0YWtlIHRoaXMgZmlsZXMgZnJvbSBvcHRlZV9vcyByZXBvc2l0b3J5IGluc3RlYWQg
YW5kIEknbGwKdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBhY2NvcmRpbmdseS4gQ2FuIEkga2Vl
cCB5b3VyIGFja2VkLWJ5IHRhZyBpbgpzdWNoIGNhc2U/CgotLQpCZXN0IHJlZ2FyZHMsVm9sb2R5
bXlyIEJhYmNodWsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
