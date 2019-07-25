Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9B74A57
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 11:50:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqaLx-0005pc-Om; Thu, 25 Jul 2019 09:48:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqaLw-0005pW-92
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 09:48:00 +0000
X-Inumbo-ID: 47c2f31a-aec1-11e9-a53c-9f64d4ddd6ad
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47c2f31a-aec1-11e9-a53c-9f64d4ddd6ad;
 Thu, 25 Jul 2019 09:47:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RW3VPgiW6hM3MKEaMz/279DQQgsCm3Ol9ohtQOlaxsV+Qr+lTq9lrW+78YuUNyH9WQcYMCufHm
 8R6LACvz6FzicazEA3XBC7LWo1kSnC+aw1Anr9TlIGD4K7lJBK8UplzJ/spWCgajwa/o2FV8iL
 ZhW0AQqZ+ESCnML37NunqeBbBC+g3ewgY79a8u3Le4A9R2+5zCo6vruwgUAGE/+8AWuoxAZCdA
 5MquKHLG+W6cDDue+x6WDrxhnF25XLFOkRsk6nbdQO5+L7JEDCN4+AHIeOGebNDGJ21ryVb16N
 5jA=
X-SBRS: 2.7
X-MesageID: 3522969
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3522969"
Date: Thu, 25 Jul 2019 11:47:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190725094746.5wlsyc4h4m573qza@Air-de-Roger>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-6-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723160609.2177-6-paul.durrant@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 5/6] domain: remove the 'is_xenstore' flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDU6MDY6MDhQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIGNvbnZlbmllbmNlIG1hY3JvLCBpc194ZW5z
dG9yZV9kb21haW4oKSwgd2hpY2gKPiB0ZXN0cyB0aGUgZG9tYWluICdjcmVhdGVmbGFncycgZGly
ZWN0bHkgYW5kIHRoZW4gdXNlcyB0aGF0IGluIHBsYWNlIG9mCj4gdGhlICdpc194ZW5zdG9yZScg
ZmxhZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKSnVzdCBvbmUgcmVxdWVzdCBiZWxvdyAod2hpY2ggaXMgbm90IHJlbGF0ZWQgdG8geW91
ciBjb2RlIGFjdHVhbGx5KS4KCj4gLS0tCj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT4KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4g
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQu
d2lsa0BvcmFjbGUuY29tPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4gQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgo+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+IENjOiBEYW5pZWwgRGUgR3JhYWYgPGRnZGVncmFAdHljaG8ubnNhLmdvdj4K
PiAtLS0KPiAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgfCA1ICstLS0tCj4gIHhlbi9jb21tb24v
ZG9tY3RsLmMgICAgIHwgMiArLQo+ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDcgKysrKyst
LQo+ICB4ZW4vaW5jbHVkZS94c20vZHVtbXkuaCB8IDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gaW5kZXggNmY0MDVkMjU0MS4uNTcw
M2RhMzU3ZiAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysrIGIveGVuL2Nv
bW1vbi9kb21haW4uYwo+IEBAIC00MjksMTEgKzQyOSw4IEBAIHN0cnVjdCBkb21haW4gKmRvbWFp
bl9jcmVhdGUoZG9taWRfdCBkb21pZCwKPiAgICAgICAgICB3YXRjaGRvZ19kb21haW5faW5pdChk
KTsKPiAgICAgICAgICBpbml0X3N0YXR1cyB8PSBJTklUX3dhdGNoZG9nOwo+ICAKPiAtICAgICAg
ICBpZiAoIGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RPTUNUTF9DREZfeHNfZG9tYWluICkKPiAtICAg
ICAgICB7Cj4gLSAgICAgICAgICAgIGQtPmlzX3hlbnN0b3JlID0gMTsKPiArICAgICAgICBpZiAo
IGlzX3hlbnN0b3JlX2RvbWFpbihkKSApCj4gICAgICAgICAgICAgIGQtPmRpc2FibGVfbWlncmF0
ZSA9IDE7CgpXaGlsZSBoZXJlIGNhbiB5b3UgYWxzbyBmaXggdGhpcyBsaW5lIHRvIHVzZSB0cnVl
IGluc3RlYWQgb2YgMT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
