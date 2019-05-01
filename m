Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D638910A94
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 18:06:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLriM-0003x7-GG; Wed, 01 May 2019 16:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kwpc=TB=citrix.com=prvs=017106e64=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hLriK-0003x2-QI
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 16:04:08 +0000
X-Inumbo-ID: bec70e3a-6c2a-11e9-bcc4-fbfecc963c32
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bec70e3a-6c2a-11e9-bcc4-fbfecc963c32;
 Wed, 01 May 2019 16:04:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,418,1549929600"; d="scan'208";a="89528327"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [VOTE] tagging for operational messages sent to xen-devel@ (was
 Re: [Xen-devel] Xen 4.13 Development Update)
Thread-Index: AQHU+4UKPwCQ4QnUTkCn60nBAT7p2aZOEl2AgAffZ4A=
Date: Wed, 1 May 2019 16:03:49 +0000
Message-ID: <F5B81D7C-0474-46B4-9419-368BAC23EEBF@citrix.com>
References: <6DD29A1E-62F8-45C3-B381-04DCEA350C02@citrix.com>
 <5CC2D45F020000780022960B@prv1-mh.provo.novell.com>
In-Reply-To: <5CC2D45F020000780022960B@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.9.190412
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C268FF4A627DA945A88448E616E7A5F0@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [VOTE] tagging for operational messages sent to
 xen-devel@ (was Re: Xen 4.13 Development Update)
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Pu Wen <puwen@hygon.cn>, Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIGFsbW9zdCBkcm9wcGVkIHRoaXM6IGFwb2xvZ2llcy4gV2l0aCB0aGUgdm90
ZXMgaW4sIHdlIGhhdmUgYSBjbGVhciB3aW5uZXIgZm9yIFtBTk5PVU5DRV0gb3ZlciB0aGUgb3Ro
ZXIgb3B0aW9ucw0KDQpBTk5PVU5DRQkxCTIJMg0KT1BFUkFUSU9OUwktMQktMQkxDQpQUk9DRVNT
CTAJMAktMg0KDQpMYXJzDQoNCu+7v09uIDI2LzA0LzIwMTksIDAzOjUwLCAiSmFuIEJldWxpY2gi
IDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjUuMDQuMTkgYXQgMTg6
MzYsIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gQWxyaWdodCwNCiAgICA+
IA0KICAgID4gdGhlcmUgd2FzIGEgbGVuZ3RoeSBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWMgb24g
SVJDIC0gbG9nIGF0dGFjaGVkLiBUaGUgDQogICAgPiBjb25zZW5zdXMgYXBwZWFycyB0byBiZSB0
byB1c2UgQ2Fub25pY2FsIG1lc3NhZ2VzIHdpdGggYSBDQVBJVEFMSVNFRCB0YWcuIA0KICAgID4g
RS5nLiAiW1RBR10gWGVuIDQuMTMgRGV2ZWxvcG1lbnQgVXBkYXRlIi4NCiAgICA+IA0KICAgID4g
VGhlIG9wdGlvbnMgd2hpY2ggc2VlbWVkIHRvIGhhdmUgbGVhc3Qgb2JqZWN0aW9ucyBhcmUNCiAg
ICA+IDE6IFtBTk5PVU5DRV0NCiAgICANCiAgICArMQ0KICAgIA0KICAgIElmIG1haWxzIHRvIHhl
bi1hbm5vdW5jZSByZWFsbHkgZ2V0IHJlZmxlY3RlZCB0byB4ZW4tZGV2ZWwgKEkgZGlkbid0DQog
ICAga25vdyB0aGlzLCBhbmQgaGVuY2Ugd291bGQgaGF2ZSBwb2ludGxlc3NseSBzZW50IHN0YWJs
ZSByZWxlYXNlDQogICAgYW5ub3VuY2VtZW50cyB0byBib3RoIGxpc3RzKSwgdGhlbiBwcmVmZXJh
Ymx5IHdpdGggdGhlIHRhZw0KICAgIGdldHRpbmcgYWRkZWQgaW4gdGhlIHByb2Nlc3Mgb2YgcmVm
bGVjdGluZy4NCiAgICANCiAgICA+IDI6IFtPUEVSQVRJT05TXSANCiAgICANCiAgICAtMQ0KICAg
IA0KICAgID4gMzogW1BST0NFU1NdDQogICAgDQogICAgMA0KICAgIA0KICAgIEphbg0KICAgIA0K
ICAgIA0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
