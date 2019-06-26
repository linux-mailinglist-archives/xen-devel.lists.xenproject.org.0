Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF456D90
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 17:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9j3-0006vQ-S5; Wed, 26 Jun 2019 15:20:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg9j3-0006vK-2u
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 15:20:45 +0000
X-Inumbo-ID: f672e823-9825-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f672e823-9825-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 15:20:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OxXN5w05iQdKVu+abTqJvvYjxwbh/ocvgKRkcYlP9rVqNx1jPeIjdvIx55dJ1DH/PcYgOUsaTn
 peEw8UcjKN3jFUHFvHTnAjxwQ0PKW3qqqtD/SNNtlsI0VbcH20CDt0mD5StVuWQDKaUPe0uGzU
 5uHEqnRQe44qbHUbrMoIIfW+x9HcEQGxRNPNBHOcf8XG6Xe8NZxOS1qJI7dxNkveDAk15Qe3f8
 qKBlTuITPo6lbb3o5Cu3/tUj1C5o+GsJh0WZaNIRZtI4im3zyPjzkRf3L+MekNwzv6SZftfMDI
 U+E=
X-SBRS: 2.7
X-MesageID: 2266268
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2266268"
Date: Wed, 26 Jun 2019 17:20:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190626152036.ps4ezt6xdgbu3b2e@MacBook-Air-de-Roger.local>
References: <20190626135546.50665-1-roger.pau@citrix.com>
 <20190626135546.50665-5-roger.pau@citrix.com>
 <5D138507020000780023B4C8@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D138507020000780023B4C8@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 4/5] kconfig: disable non-literal format
 string warnings
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDg6NDU6MjdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA2LjE5IGF0IDE1OjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gS2NvbmZpZyBtYWtlcyBoZWF2eSB1c2Ugb2Ygbm9uLWxpdGVyYWxzIGFzIGZvcm1h
dCBzdHJpbmdzLCBkaXNhYmxlCj4gPiBjb21waWxlciB3YXJuaW5ncyBzaW5jZSB0aGlzIGlzIGV4
cGVjdGVkIHVzYWdlLgo+IAo+IEkndmUgbmV2ZXIgc2VlbiBhbnkgd2l0aCBhbnkgdmVyc2lvbiBv
ZiBnY2MgLSBhcmUgdGhlcmUgbW9yZQo+IGFzcGVjdHMgdG8gYmUgbWVudGlvbmVkIGhlcmU/CgpP
aCwgSSd2ZSBhbHdheXMgc2VlbiB0aGVtIHdpdGggY2xhbmcuIE5vdCBzdXJlIHdoeSBnY2MgZG9l
c24ndCBzaG93CnN1Y2ggd2FybmluZ3MuCgpjbGFuZyAtV3AsLU1ELHRvb2xzL2tjb25maWcvLmNv
bmYuby5kICAgIC1EQ1VSU0VTX0xPQz0iPG5jdXJzZXMuaD4iIC1ETE9DQUxFIC1ES0JVSUxEX05P
X05MUyAgLWMgLW8gdG9vbHMva2NvbmZpZy9jb25mLm8gdG9vbHMva2NvbmZpZy9jb25mLmMKdG9v
bHMva2NvbmZpZy9jb25mLmM6Nzc6MTA6IHdhcm5pbmc6IGZvcm1hdCBzdHJpbmcgaXMgbm90IGEg
c3RyaW5nIGxpdGVyYWwgKHBvdGVudGlhbGx5IGluc2VjdXJlKQogICAgICBbLVdmb3JtYXQtc2Vj
dXJpdHldCiAgICAgICAgICAgICAgICBwcmludGYoXygiYWJvcnRlZCFcblxuIikpOwogICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+CnRvb2xzL2tjb25maWcvbGtjLmg6MzQ6
MTc6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ18nCiNkZWZpbmUgXyh0ZXh0KSBnZXR0ZXh0
KHRleHQpCiAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+CnRvb2xzL2tjb25maWcvY29uZi5j
Ojc3OjEwOiBub3RlOiB0cmVhdCB0aGUgc3RyaW5nIGFzIGFuIGFyZ3VtZW50IHRvIGF2b2lkIHRo
aXMKICAgICAgICAgICAgICAgIHByaW50ZihfKCJhYm9ydGVkIVxuXG4iKSk7CiAgICAgICAgICAg
ICAgICAgICAgICAgXgogICAgICAgICAgICAgICAgICAgICAgICIlcyIsCnRvb2xzL2tjb25maWcv
bGtjLmg6MzQ6MTc6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ18nCiNkZWZpbmUgXyh0ZXh0
KSBnZXR0ZXh0KHRleHQpCiAgICAgICAgICAgICAgICBeCnRvb2xzL2tjb25maWcvY29uZi5jOjc4
OjEwOiB3YXJuaW5nOiBmb3JtYXQgc3RyaW5nIGlzIG5vdCBhIHN0cmluZyBsaXRlcmFsIChwb3Rl
bnRpYWxseSBpbnNlY3VyZSkKICAgICAgWy1XZm9ybWF0LXNlY3VyaXR5XQogICAgICAgICAgICAg
ICAgcHJpbnRmKF8oIkNvbnNvbGUgaW5wdXQvb3V0cHV0IGlzIHJlZGlyZWN0ZWQuICIpKTsKICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgp0b29scy9rY29uZmlnL2xrYy5oOjM0OjE3OiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3Jv
ICdfJwojZGVmaW5lIF8odGV4dCkgZ2V0dGV4dCh0ZXh0KQogICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fgp0b29scy9rY29uZmlnL2NvbmYuYzo3ODoxMDogbm90ZTogdHJlYXQgdGhlIHN0cmlu
ZyBhcyBhbiBhcmd1bWVudCB0byBhdm9pZCB0aGlzCiAgICAgICAgICAgICAgICBwcmludGYoXygi
Q29uc29sZSBpbnB1dC9vdXRwdXQgaXMgcmVkaXJlY3RlZC4gIikpOwogICAgICAgICAgICAgICAg
ICAgICAgIF4KICAgICAgICAgICAgICAgICAgICAgICAiJXMiLAp0b29scy9rY29uZmlnL2xrYy5o
OjM0OjE3OiBub3RlOiBleHBhbmRlZCBmcm9tIG1hY3JvICdfJwojZGVmaW5lIF8odGV4dCkgZ2V0
dGV4dCh0ZXh0KQogICAgICAgICAgICAgICAgXgpbLi4uXQoKPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiBDYzog
RG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgo+ID4gLS0tCj4gPiAgeGVuL3Rvb2xz
L2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyB8IDUgKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4gCj4gWW91IENjIGxpc3QgbG9va3MgdG8gYmUgdG9vIHNob3J0IGZv
ciB0aGlzIGNoYW5nZS4KClRoYXQncyB3aGF0IGdldF9tYWludGFpbmVyLnBsIGhhcyBnaXZlbiBt
ZS4gTWF5YmUgdGhlIHN5bnRheCBpbgpNQUlOVEFJTkVSUyBpcyBub3QgY29ycmVjdCwgb3IgZ2V0
X21haW50YWluZXIucGwgbmVlZHMgYWRqdXN0bWVudHMuCgo+IAo+ID4gLS0tIGEveGVuL3Rvb2xz
L2tjb25maWcvTWFrZWZpbGUua2NvbmZpZwo+ID4gKysrIGIveGVuL3Rvb2xzL2tjb25maWcvTWFr
ZWZpbGUua2NvbmZpZwo+ID4gQEAgLTQzLDYgKzQzLDExIEBAIEZPUkNFOgo+ID4gICMgU2V0cyB0
b29sY2hhaW4gYmluYXJpZXMgdG8gdXNlCj4gPiAgaW5jbHVkZSAkKFhFTl9ST09UKS9jb25maWcv
JChzaGVsbCB1bmFtZSAtcykubWsKPiA+ICAKPiA+ICsjIERpc2FibGUgZm9ybWF0IHdhcm5pbmdz
LCBrY29uZmlnIG1ha2VzIGhlYXZ5IHVzZSBvZiBub24tbGl0ZXJhbCBmb3JtYXQKPiA+ICsjIHN0
cmluZ3MuCj4gPiArSE9TVENGTEFHUyArPSAtV25vLWZvcm1hdAo+ID4gK0hPU1RDWFhGTEFHUyAr
PSAtV25vLWZvcm1hdAo+IAo+IEJ1dCB0aGlzIGRpc2FibGVzIGZhciBtb3JlIHdhcm5pbmdzIHRo
YW4gb25lcyBmb3Igbm9uLWxpdGVyYWwgZm9ybWF0Cj4gc3RyaW5ncywgYXQgbGVhc3QgYWZhaWN0
LgoKU29ycnksIGl0IHNob3VsZCBiZSAtV25vLWZvcm1hdC1zZWN1cml0eS4gSSB0aGluayBJIGRy
b3BwZWQgdGhlCi1zZWN1cml0eSBwYXJ0IHdoaWxlIGNvcHlpbmcuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
