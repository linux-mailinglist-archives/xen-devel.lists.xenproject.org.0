Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC32B89C
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 17:52:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVHrY-0008FM-CM; Mon, 27 May 2019 15:48:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BTdu=T3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVHrX-0008FH-6J
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 15:48:35 +0000
X-Inumbo-ID: e1b8a1c2-8096-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1b8a1c2-8096-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 15:48:33 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: rWKpo8zNCn28wED7JPRYDa86HK/wPRbPAVhwe7Ujf2FZsZFIc3a8669XH4ZOjW0Zk30gJ0PUcz
 SJN8zPVa+Ff4E60DQxjxXIev4yYzMhahqrUnwom765qlR8TcFi1XXC9txzlgM2Uprt2iUE3EwZ
 yyfY0GGi6sSELsEhFWZy8Fch6gq0CUSJXK4/JozVkW1CwCg44j1p4bR/5vWYDyzdincoZOqvvM
 81DCpEfhIPVU9EQkrfJVuuJbymtOgW8N4wheMy4Omv/L+4SPwpWDPwbOxfVgch/j8VIPy3yzmW
 cAU=
X-SBRS: 2.7
X-MesageID: 951584
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,519,1549947600"; 
   d="scan'208";a="951584"
Date: Mon, 27 May 2019 17:48:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190527154819.e4mp2uh4i32j3auq@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-5-roger.pau@citrix.com>
 <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CE7C93A0200007800231F24@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/5] print: introduce a format specifier for
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MzY6NDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVGhlIG5ldyBmb3JtYXQgc3BlY2lmaWVyIGlzICclcHAnLCBhbmQgcHJpbnRzIGEg
cGNpX3NiZGZfdCB1c2luZyB0aGUKPiA+IHNlZzpidXM6ZGV2LmZ1bmMgZm9ybWF0LiBSZXBsYWNl
IGFsbCBTQkRGcyBwcmludGVkIHVzaW5nCj4gPiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0
aGUgbmV3IGZvcm1hdCBzcGVjaWZpZXIuCj4gCj4gU28gb24gdGhlIHBvc2l0aXZlIHNpZGUgTGlu
dXggZG9lc24ndCB1c2UgJ3AnIHlldCwgc28gd2UncmUgb25seSBhdCByaXNrCj4gb2YgYSBmdXR1
cmUgY29uZmxpY3QuIEhvd2V2ZXIsIGhhdmluZyB0byBwYXNzIGEgNjQtYml0IHBvaW50ZXIganVz
dAo+IHRvIHByaW50IGEgMzItYml0IGVudGl0eSBzZWVtcyByYXRoZXIgd2FzdGVmdWwgdG8gbWUu
CgpJIHRoaW5rIHRoZXJlIGFyZSB0d28gaXNzdWVzIGhlcmUsIG9uZSB0aGF0IHlvdSBtZW50aW9u
IGlzIHRoZSB3YXN0ZQpvZiB1c2luZyBhIDY0Yml0IHBvaW50ZXIgdG8gcGFzcyBhIDMyYml0IHZh
bHVlLCB0aGUgb3RoZXIgb25lIHdvdWxkCmJlIHRoZSB1bm5lZWRlZCBwb2ludGVyIGluZGlyZWN0
aW9uLgoKSSd2ZSB0aG91Z2h0IGFib3V0IHRoZSBzYW1lLCBidXQgdGhlbiByZWFsaXplZCB0aGF0
IHRoaXMgaXMgdXNlZAooYWx3YXlzPykgdG8gb3V0cHV0IG1lc3NhZ2VzLCB3aGljaCBpcyBpbiBp
dHNlbGYgYSBzbG93IG9wZXJhdGlvbiwgYW5kCnRoZSBwb2ludGVyIGluZGlyZWN0aW9uIGlzIGxp
a2VseSBuZWdsaWdpYmxlIGNvbXBhcmVkIHRvIHRoZSBjb3N0IG9mCnRoZSByZXN0IG9mIHRoZSBv
cGVyYXRpb24uIFRoZSB1c2FnZSBvZiA2NGJpdCBpcyBhbHNvIHdhc3RlZnVsLCBidXQKYWdhaW4g
dGhpcyBzaG91bGRuJ3QgYmUgYSBob3RwYXRoIGFueXdheSwgYW5kIHRoaXMgY29kZSByZXBsYWNl
cyB0aGUKdXNhZ2Ugb2YgZm91ciBwYXJhbWV0ZXJzIHRvIHByaW50IGEgU0JERiBpbnRvIGEgc2lu
Z2xlIG9uZS4KCj4gU2luY2Ugd2UgY2FuJ3QKPiB1c2UgZW50aXJlbHkgbmV3IGZvcm1hdCBzcGVj
aWZpZXJzLCBkaWQgeW91IGNvbnNpZGVyIChhYil1c2luZyBvbmUKPiB3ZSByYXJlbHkgdXNlLCBs
aWtlICVvLCBzdWZmaXhlZCBzaW1pbGFybHkgbGlrZSB3ZSBkbyBmb3IgJXA/IFRoZQo+IGV4dGVu
c2lvbiBjb3VsZCBiZSByZXN0cmljdGVkIHRvIGFwcGx5IG9ubHkgd2hlbiBuZWl0aGVyIGZpZWxk
IHdpZHRoCj4gbm9yIHByZWNpc2lvbiBub3IgYW55IGZsYWdzIHdlcmUgc3BlY2lmaWVkLCBpLmUu
IG9ubHkgdG8gcGxhaW4gJW8gKGF0Cj4gbGVhc3QgaW5pdGlhbGx5KS4KPiAKPiBXZSdkIHRoZW4g
aGF2ZSBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mCj4gCj4gI2RlZmluZSBQUklfc2JkZiAi
b3AiCj4gI2RlZmluZSBQUklfU0JERih2KSAoKHYpLnNiZGYpCj4gCj4gYW5kCj4gCj4gICAgIHBy
aW50aygiJSIgUFJJX3NiZGYgIjogLi4uXG4iLCBQUklfU0JERihwZGV2LT5zYmRmKSwgLi4uKTsK
CkkgaGF2ZSB0byBhZG1pdCB0aGlzIGxvb2tzIG1vcmUgaGFja3kgdGhhbiBteSBjdXJyZW50IHN1
Z2dlc3Rpb24gSU1PLgpUaGUgJXAgZm9ybWF0dGVyIG92ZXJsb2FkaW5nIHNlZW1zIG1vcmUgc3Rh
bmRhcmQgYW5kIGV4cGVjdGVkIHJhdGhlcgp0aGFuIG92ZXJsb2FkaW5nICVvLgoKUGx1cywgb25l
IHRoaW5nIEkgZGlkbid0IHJlYWxpemUsIEkgdGhpbmsgWGVuIGNvdWxkIGV2ZW4gdXNlICVwY2kg
dG8KcHJpbnQgYW5kIFNCREYsIHdoaWNoIHdpbGwgbWFrZSBpdCBldmVuIGNsZWFyZXIuCgo+ID4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYwo+ID4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2FjcGkuYwo+ID4gQEAgLTcxNyw5ICs3
MTcsOCBAQCBzdGF0aWMgdTE2IF9faW5pdCBwYXJzZV9pdmhkX2RldmljZV9zcGVjaWFsKAo+ID4g
ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgICAgIH0KPiA+ICAKPiA+IC0gICAgQU1EX0lPTU1VX0RF
QlVHKCJJVkhEIFNwZWNpYWw6ICUwNHg6JTAyeDolMDJ4LiV1IHZhcmlldHkgJSN4IGhhbmRsZSAl
I3hcbiIsCj4gPiAtICAgICAgICAgICAgICAgICAgICBzZWcsIFBDSV9CVVMoYmRmKSwgUENJX1NM
T1QoYmRmKSwgUENJX0ZVTkMoYmRmKSwKPiA+IC0gICAgICAgICAgICAgICAgICAgIHNwZWNpYWwt
PnZhcmlldHksIHNwZWNpYWwtPmhhbmRsZSk7Cj4gPiArICAgIEFNRF9JT01NVV9ERUJVRygiSVZI
RCBTcGVjaWFsOiAlcHAgdmFyaWV0eSAlI3ggaGFuZGxlICUjeFxuIiwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICZQQ0lfU0JERjJfVChzZWcsIGJkZiksIHNwZWNpYWwtPnZhcmlldHksIHNwZWNp
YWwtPmhhbmRsZSk7Cj4gCj4gVGhlIGluZWZmaWNpZW5jeSBvZiB0aGUlcC1iYXNlZCBhcHByb2Fj
aCBpcyBwZXJoYXBzIGJlc3Qgc2VlbiB3aXRoIGFuCj4gZXhhbXBsZSBsaWtlIHRoaXM6IFRoZSBj
b21waWxlciB3aWxsIGhhdmUgdG8gaW5zdGFudGlhdGUgYW4gdW5uYW1lZCB2YXJpYWJsZQo+IG9u
IHRoZSBzdGFjayB0byBob2xkIHRoZSB2YWx1ZSBvZiB0aGUgY29tcG91bmQgbGl0ZXJhbCwganVz
dCB0byBiZSBhYmxlIHRvCj4gdGFrZSBpdHMgYWRkcmVzcy4KClJpZ2h0LCBhbmQgc3VjaCBpb21t
dSBkZWJ1ZyBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGF0IHJ1bnRpbWUsIHNvCnJlZ2FyZGxlc3Mg
b2Ygd2hldGhlciBpb21tdSBkZWJ1ZyBpcyBlbmFibGVkIG9yIG5vdCB5b3Ugd2lsbCBlbmQgdXAK
d2l0aCBzdWNoIHN0YWNrIHZhcmlhYmxlIHBvaW50ZXIuCgpJbiB0aGlzIHNwZWNpZmljIGV4YW1w
bGUgc3VjaCB1c2FnZSBpcyBub3QgdGhhdCBiYWQgYmVjYXVzZSB0aGF0J3MgYQpib290IHRpbWUg
b25seSBtZXNzYWdlLCBidXQgSSdtIHN1cmUgdGhlcmUgYXJlIG90aGVycyB3aGljaCBhcmUgbm90
CmJvb3QgdGltZSBvbmx5LiBUaGUgdmFzdCBtYWpvcml0eSBvZiBtZXNzYWdlcyBob3dldmVyIGRv
bid0IHJlcXVpcmUKdGhlIHVzYWdlIG9mIGEgbGl0ZXJhbC4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
