Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E3D2388C
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:44:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSiXO-0002gd-UQ; Mon, 20 May 2019 13:41:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nz7w=TU=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1hSiXM-0002gY-Rz
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:41:09 +0000
X-Inumbo-ID: eadbbb15-7b04-11e9-8980-bc764e045a96
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::61f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eadbbb15-7b04-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 13:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dnxndRPtQWy+kqQlsKma2PPGMA69EuiirgaTf6vkxAc=;
 b=AHL7O48/Oway1XmGPR8qquSmb42cRQ7i8Q3WGosBIKLKKpSzZdef3rrlwZAXX1hUbzKym5eMATBoKyCnJZt6cNUgylZgUzaw4QZOFidsSdOqr2VBDoRA2eXHiAHkOoA17WSWq3xLgk8sz8gOpyxn0l0Y/vSa9gWwGPipuiRyY+PfEQCGgKF98N/fYrEkFpFVaL8SJXkhrsP1TqYpZ6Gi3kqzaQSvXWYZlfavxhOOgF9Nyz6HxZVNo/9iERM8pLArRsdKu9BHbFHf+JJjRDYsssw2fnI5Ja9ymGw4vz9l37jJs94xfbgHg2Z95Y0GnN629ysw1ELG222gUw0ktDsnhw==
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com (20.176.214.210) by
 AM0PR03MB6065.eurprd03.prod.outlook.com (10.255.31.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 13:41:04 +0000
Received: from AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a]) by AM0PR03MB4148.eurprd03.prod.outlook.com
 ([fe80::55c5:599a:1f80:208a%3]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 13:41:04 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v2 2/2] arm: rename tiny64.conf to tiny64_defconfig
Thread-Index: AQHVC+yMHILNn8cZtESyMQqnzza/oKZ0AF4AgAALHoA=
Date: Mon, 20 May 2019 13:41:03 +0000
Message-ID: <87a7fh8cr4.fsf@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com>
In-Reply-To: <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Volodymyr_Babchuk@epam.com; 
x-originating-ip: [85.223.209.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fef836f-3631-4434-4794-08d6dd28cdc4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM0PR03MB6065; 
x-ms-traffictypediagnostic: AM0PR03MB6065:
x-microsoft-antispam-prvs: <AM0PR03MB6065A893F1FAC718C6BD0FE9E6060@AM0PR03MB6065.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(136003)(199004)(189003)(76116006)(66476007)(73956011)(66556008)(91956017)(66946007)(64756008)(66446008)(86362001)(4326008)(6512007)(316002)(476003)(256004)(14444005)(2616005)(6116002)(3846002)(446003)(11346002)(25786009)(6486002)(14454004)(478600001)(26005)(68736007)(36756003)(72206003)(53936002)(71190400001)(71200400001)(486006)(229853002)(6246003)(6436002)(186003)(6916009)(99286004)(7736002)(54906003)(8936002)(5660300002)(80792005)(2906002)(55236004)(53546011)(8676002)(66066001)(81156014)(81166006)(102836004)(305945005)(76176011)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR03MB6065;
 H:AM0PR03MB4148.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xCc4l4nl60R41IwPlJVGc/jAU00psH3SBA8OrHJ4vSuLOuccvCOmQEqIT8dUMkJI2U4xThHVyg+m+Nj28SIHsvyHNR2Yr3+PGYKOrkgT21tItkSzkPosdXYG8uEjJ1XpOAUeJ5ZYtDo+/kzixeIdN8JPWEXeaTDRgxH424/6MzDx+1L+0GXqNWPj0PcKGBXMLSznAQ7DIz3nxvLTxmJiRK2MvqARCzXObH2vMr6pfAGzShaTD4xJF818NckR7HF5WxkJDJlWot5StuYkrZ1PJvtNyMWG2rM8zdU3JaaUSIXfZ8kQeopuRo3xt/oNG/N8Qbe+lCbnb8wP4DdWBzwprl8qztyzHKARxA/VSmbpJBu+JYjkGxn4WcLus38cy7daA4Ouh64kwh+7quOgCF8U0wqzl4vIQW6qgeCePH1bwwk=
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fef836f-3631-4434-4794-08d6dd28cdc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 13:41:03.9417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6065
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIEp1bGllbiwKCkp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IEhpLAo+Cj4gRmlyc3Qgb2YgYWxs
LCBwbGVhc2UgYWRkIGEgY292ZXIgbGV0dGVyIHdoZW4geW91IHNlbmQgYSBzZXJpZXMuIFRoaXMK
PiBoZWxwIGZvciB0aHJlYWRpbmcgYW5kIGFsc28gYSBwbGFjZSB0byBjb21tZW5kIG9uIGdlbmVy
YWwgZmVlZGJhY2suCk9oLCBva2F5LiBUaGF0IHdhcyBxdWl0ZSBzaW1wbGUgY2hhbmdlIGFuZCBJ
IGRpZG4ndCB3YW50ZWQgdG8gc3BhbSB3aXRoCmV4dHJhIGVtYWlscy4gSSB3aWxsIGluY2x1ZGUg
Y292ZXIgbGV0dGVyIG5leHQgdGltZS4KCj4gRnVydGhlcm1vcmUsIHBsZWFzZSB1c2Ugc2NyaXB0
cy97YWRkLCBnZXR9X21haW50YWluZXJzLnBsIHRvIGZpbmQgdGhlCj4gY29ycmVjdCBtYWludGFp
bmVycy4gV2hpbGUgSSBhZ3JlZSB0aGF0IENDaW5nIFJFU1QgaXMgYSBnb29kIGlkZWEsIHlvdQo+
IGhhdmVuJ3QgQ0NlZCBhbGwgb2YgdGhlbS4KUHJvYmxlbSBpcyB0aGF0IEkgdXNlZCB0aGlzIHNj
cmlwdDoKCiQgLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIC1mIGRlZmNvbmZpZ192Mi92Mi0w
MDAyLWFybS1yZW5hbWUtdGlueTY0LmNvbmYtdG8tdGlueTY0X2RlZmNvbmZpZy5wYXRjaApBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CklhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgpKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ckp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CktvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3Jh
Y2xlLmNvbT4KU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpUaW0g
RGVlZ2FuIDx0aW1AeGVuLm9yZz4KV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgpJIHdhcyBxdWl0ZSBzdXJwcmlzZWQgYnkgcmVzdWx0
IG15c2VsZi4gSG9uZXN0bHksIEkgd2FudGVkIHRvIENDIG9ubHkKeW91IGFuZCBTdGVmYW5vLCBi
dXQgZGVjaWRlZCB0byBwbGF5IGJ5IHRoZSBydWxlcy4KCgpBbHNvLCBhZGRfbWFpbnRhaW5lcnMu
cGwganVzdCBpZ25vcmVzIHRoaXMgcGF0Y2ggYXQgYWxsOgoKJSBzY3JpcHRzL2FkZF9tYWludGFp
bmVycy5wbCAtdiAyIC1kIGRlZmNvbmZpZ192MgpQcm9jZXNzaW5nOiB2Mi0wMDAxLW1ha2VmaWxl
LWFkZC1zdXBwb3J0LWZvci1fZGVmY29uZmlnLXRhcmdldHMucGF0Y2gKUHJvY2Vzc2luZzogdjIt
MDAwMi1hcm0tcmVuYW1lLXRpbnk2NC5jb25mLXRvLXRpbnk2NF9kZWZjb25maWcucGF0Y2gKLi9z
Y3JpcHRzL2dldF9tYWludGFpbmVyLnBsOiBmaWxlICdkZWZjb25maWdfdjIvdjItMDAwMi1hcm0t
cmVuYW1lLXRpbnk2NC5jb25mLXRvLXRpbnk2NF9kZWZjb25maWcucGF0Y2gnIGRvZXNuJ3QgYXBw
ZWFyIHRvIGJlIGEgcGF0Y2guICBBZGQgLWYgdG8gb3B0aW9ucz8KCj4KPiBPbiAxNi8wNS8yMDE5
IDE0OjM3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4gQXMgYnVpbGQgc3lzdGVtIG5vdyBz
dXBwb3J0cyAqX2RlZmNvbmZpZyBydWxlcyBpdCBpcyBnb29kIHRvIGJlIGFibGUKPj4gdG8gY29u
ZmlndXJlIG1pbmltYWwgWEVOIGltYWdlIHdpdGgKPgo+IEkgYW0gYWZyYWlkIHRoaXMgaXMgbm90
IGNvcnJlY3QuIHRpbnk2NCB3aWxsIG5vdCBiZSBhYmxlIHRvIGdlbmVyYXRlIGEKPiBtaW5pbWFs
IGNvbmZpZyB0byBib290IG9uIGFueSBwbGF0Zm9ybSBzdXBwb3J0ZWQgYnkgWGVuLgo+Cj4gSXQg
aXMgbWVhbnQgdG8gYmUgdXNlZCBhcyBhIGJhc2UgZm9yIHRhaWxvcmluZyB5b3VyIHBsYXRmb3Jt
IHdoZXJlIGFsbAo+IHRoZSBvcHRpb25zIGFyZSB0dXJuZWQgb2ZmIGJ5IGRlZmF1bHQuCj4KPiBT
byBJIHRoaW5rIG9mZmVyaW5nIGEgZGlyZWN0IGFjY2VzcyBpcyBsaWtlbHkgZ29pbmcgdG8gYmUg
bWlzdXNlZCBpbgo+IG1vc3Qgb2YgdGhlIGNhc2VzIHdpdGhvdXQgcHJvcGVyIGRvY3VtZW50YXRp
b24uCgpJbiB0aGUgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgU3RlZmFubyBzdWdnZXN0ZWQgdG8g
dXNlIG9sZGRlZmNvbmZpZzoKCiIgICBBZGQgYSB0aW55IGtjb25maWcgY29uZmlndXJhdGlvbi4g
RW5hYmxlZCBvbmx5IHRoZSBjcmVkaXQgc2NoZWR1bGVyLgogICAgSXQgb25seSBjYXJyaWVzIG5v
bi1kZWZhdWx0IG9wdGlvbnMgKHVzZSBtYWtlIG1lbnVjb25maWcgb3IgbWFrZQogICAgb2xkZGVm
Y29uZmlnIHRvIHByb2R1Y2UgYSBjb21wbGV0ZSAuY29uZmlnIGZpbGUpLiAiCgpJIGRvbid0IHNl
ZSBhbnkgc2lnbmlmaWNhbnQgZGlmZmVyZW5jZSBiZXR3ZWVuCgojIGNwIHRpbnk2NC5jb25mIC5j
b25maWcgJiYgbWFrZSBvbGRkZWZjb25maWcKCmFuZAoKIyBtYWtlIHRpbnk2NF9kZWZjb25maWcK
CkFueXdheXMsIGl0IGlzIHVwIHRvIHlvdSB0byBhY2NlcHQgb3IgZGVjbGluZSB0aGlzIHBhcnRp
Y3VsYXIgcGF0Y2guIEkKbW9zdGx5IGludGVyZXN0ZWQgaW4gdGhlIGZpcnN0IHBhdGNoIGluIHRo
ZSBzZXJpZXMsIGJlY2F1c2Ugb3VyIGJ1aWxkCnN5c3RlbSBkZXBlbmRzIG9uIGl0LiBUaGlzIHZl
cnkgcGF0Y2ggSSBzZW50IG91dCBvbmx5IGJlY2F1c2UgSSB3YW50ZWQKdG8gdGlkeSB1cCB0aGlu
Z3MgYSBiaXQuIEJ1dCBpZiB5b3UgYXJlIHNheWluZyB0aGF0IGl0IGlzIGludGVuZGVkIHRvCnN0
b3JlIG1pbmltYWwgY29uZmlnIGluIHRoaXMgd2F5LCBJJ20gb2theSB3aXRoIGl0LgoKLS0KQmVz
dCByZWdhcmRzLFZvbG9keW15ciBCYWJjaHVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
