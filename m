Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5DA7F54D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 12:45:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htV0W-0004q2-II; Fri, 02 Aug 2019 10:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htV0V-0004px-Ll
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 10:41:55 +0000
X-Inumbo-ID: 23079e2a-b512-11e9-92bf-1fb563024935
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23079e2a-b512-11e9-92bf-1fb563024935;
 Fri, 02 Aug 2019 10:41:51 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GGFKh7brsA8RXLjqHTUfBgU2Y/mSR/zVaDOewQVkiOzwZptJ9iIGWby3aJd+4U5pFevIFZ3Wo8
 XUDn/Omc/lYngayRrlzAgbm4tGPirJ9eWTPPoovrhuiUVSUF87x4CxeNI+J4PF98hcbEGezO6/
 1+ccDzWQQXOIsP3YjZZzsi90sfbppl+2Ti0I/5QstvakGgTzFSSWwrkqEmYXofp1xmuVVnjLd/
 N2/NrF4lVCHwHbEMW1kd90j0yJ8iKUridoykh6K946uBFmESThH+Gc6Xh7Q8pbwAE2buqr7rYM
 H+k=
X-SBRS: 2.7
X-MesageID: 3932281
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3932281"
Date: Fri, 2 Aug 2019 11:41:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190802104143.GI1242@perard.uk.xensource.com>
References: <CAMmSBy_60jh+YXMVEm0PnEnD-MP4R1A5AKEKWL62V_1bc2L5cw@mail.gmail.com>
 <20190801103019.GC5791@perard.uk.xensource.com>
 <CAMmSBy8t+ttKrVJ_aRFZxt-WCz7N0V5Of3yoZ9=8tmyySbpKAw@mail.gmail.com>
 <a4e1b6bc-2d0c-7976-a740-4bae9282434d@citrix.com>
 <CAMmSBy95MRSHfyHw+=Nf15pWPbwv2CODLR1ys0bXRZCXDNi4Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy95MRSHfyHw+=Nf15pWPbwv2CODLR1ys0bXRZCXDNi4Hg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [BUG] Assertion failed: !blk->legacy_dev
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMTE6MDA6NDJBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBHb3QgaXQhIFNvIHBsZWFzZSBiZWFyIHdpdGggbWUgZm9yIGEgbGl0dGxlIGJp
dCBsb25nZXI6IEknbSBsb29raW5nIGF0Cj4gICAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dp
dHdlYi8/cD1xZW11LXhlbi5naXQ7YT1zdW1tYXJ5Cj4gYW5kIEkgc2VlIHRoYXQgaXQgaXMgYmFz
ZWQgb24gYSBzdG9jaywgdXBzdHJlYW0gcWVtdSA0LjAuMCB3aXRoCj4ganVzdCB0d28gcGF0Y2hl
cyBvbiB0b3A6Cj4gICAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1xZW11LXhl
bi5naXQ7YT1jb21taXQ7aD05Y2NhMDJkOGZmYzIzZTk2ODhhOTcxZDg1OGU0ZmZkZmY1Mzg5YjEx
Cj4gICAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1xZW11LXhlbi5naXQ7YT1j
b21taXQ7aD0xYmNmNDg0ZmE5ZjQ1MWNjOGMyOTBmZTgwZmQwZTc2NDE5OWNhODFjCj4gCj4gU28g
aGVyZSdzIG15IHF1ZXN0aW9uOiB3aGVuIHRoZXJlJ3MgdGltZSB0byByZWxlYXNlIFhlbiA0LjEz
LCBpcyB0aGUKPiBleHBlY3RhdGlvbiBmb3IgdGhlc2UgcGF0Y2hlcyB0byBnZXQgdXBzdHJlYW1l
ZCBpbnRvIGEgcGFydGljdWxhciBwYXRjaAo+IHJlbGVhc2Ugb2YgcWVtdSA0LjAueCBvciB0aGF0
IGRpc3Ryb3MgKGxpa2Ugb3Vyc2VsdmVzKSB3aWxsIGJlIG9uIHRoZSBob29rCj4gb2YgbGlmdGlu
ZyB0aG9zZSBwYXRjaGVzIG9mZiBvZiBYZW4gdHJlZSBhbmQgbWVyZ2luZyBpbiB3aGF0ZXZlciB2
ZXJzaW9uCj4gb2YgcWVtdSA0LnkgdGhleSBzaGlwPwoKU28gdGhlIHdvcmtmbG93IGZvciBxZW11
LXhlbiBpcyB0aGF0IHBhdGNoZXMgYXJlIHVwc3RyZWFtZWQgZmlyc3QuIE9mCnRoZSB0d28gcGF0
Y2hlcyBvbiB0b3Agb2YgNC4wLCBvbmUgaXMgYSBzaW1wbGUgYnVpbGQgZml4IGNoZXJyeS1waWNr
ZWQKZnJvbSB1cHN0cmVhbS4gVGhlIG90aGVyCiAgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0
d2ViLz9wPXFlbXUteGVuLmdpdDthPWNvbW1pdDtoPTljY2EwMmQ4ZmZjMjNlOTY4OGE5NzFkODU4
ZTRmZmRmZjUzODliMTEKICBtYWluIGxvb3A6IEJpZyBoYW1tZXIgdG8gZml4IGxvZ2ZpbGUgZGlz
ayBEb1MgaW4gWGVuIHNldHVwcwppc24ndCBnb2luZyB0byBiZSB1cHN0cmVhbSwgaXQgd291bGQg
bmVlZCBhIHByb3BlciBzb2x1dGlvbiBwcm92aWRlZCBieQpYZW4sIG5vdCBRRU1VLiBYZW4gd291
bGQgbmVlZHMgc29tZSBraW5kIG9mIGRhZW1vbiB0byBzYXZlIGxvZ3MgYW5kCnJvdGF0ZSB0aGVt
IGFzIG5lZWRlZCB0byBhdm9pZCBmaWxsaW5nIHVwIHRoZSBkaXNrLiBMaWJ2aXJ0IGhhcyB0aGF0
IEkKdGhpbmsuCgo+IEFsc28sIGluIHRlcm1zIG9mIHRlc3RpbmcsIHdoYXQgZG9lcyB0aGUgbWFq
b3JpdHkgb2YgZm9sa3Mgd2hvIHdpbGwgYmUgd29ya2luZwo+IG9uIFhlbiA0LjEzIHJlbGVhc2Ug
YmUgdGVzdGluZyBpdCB3aXRoPyBxZW11IHRoYXQgY29tZXMgb3V0IG9mIHhlbmJpdHMueGVuLm9y
ZywKPiB1cHN0cmVhbSBxZW11ICsgY3VzdG9tIHBhdGNoZXMsIGRpc3RybyBRRU1VLCBzb21ldGhp
bmcgZWxzZT8KCkkgdGhpbmsgbW9zdCBkZXZlbG9wZXJzIHdvdWxkIHNpbXBseSB1c2UgcWVtdS14
ZW4gdGhhdCBjb21lcyBvdXQgb2YKeGVuYml0cyAoYW5kIG5vdCBuZWNlc3NhcmlseSB0aGUgbGFz
dCB2ZXJzaW9uIGlmIHRoZXkgZGlkbid0IHVwZGF0ZSB0aGUKcWVtdS14ZW4gY2xvbmUgYXMgdGhl
IGJ1aWxkIHN5c3RlbSBkb2Vzbid0IHVwZGF0ZSBpdCkuCkJ1dCwgb3NzdGVzdCBkb2VzIHRlc3Qg
cWVtdS14ZW4gYW5kIFFFTVUgdXBzdHJlYW0gd2l0aCBYZW4uCiAgICAtIFFFTVUgdXBzdHJlYW0g
KGNhbGxlZCBxZW11LW1haW5saW5lIGluIG9zc3Rlc3QpLCBpcyB0ZXN0ZWQKICAgICAgcmVndWxh
cnkgd2l0aCBYZW4gdW5zdGFibGUgKHRvIGJlIFhlbiA0LjEzIGN1cnJlbnRseSkuCiAgICAtIHFl
bXUteGVuIGlzIHRlc3RlZCB3aXRoIFhlbiB1bnN0YWJsZS4KICAgIC0gWGVuIHVuc3RhYmxlLXN0
YWdpbmcgaXMgdGVzdGVkIHdpdGggcWVtdS14ZW4gKHRlc3RlZCB2ZXJzaW9uKS4KCkFzIGZvciAn
ZGlzdHJvIFFFTVUnLCBJIGRvbid0IHRoaW5rIGFueSBkZXZlbG9wZXIgY2FuIHVzZSBpdC4gUUVN
VQpuZWVkcyB0byBiZSBidWlsZHMgYWdhaW5zdCB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIFhlbiwg
b3IgaXQgZG9lc24ndApzdGFydC4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
