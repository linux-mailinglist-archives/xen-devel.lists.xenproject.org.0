Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B11C607
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 11:27:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQTej-0006MG-FX; Tue, 14 May 2019 09:23:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQTei-0006MB-3w
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 09:23:28 +0000
X-Inumbo-ID: ec1c85fa-7629-11e9-a2fa-c3c05d397422
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec1c85fa-7629-11e9-a2fa-c3c05d397422;
 Tue, 14 May 2019 09:23:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="85429948"
Date: Tue, 14 May 2019 10:23:21 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190514092321.GW2798@zion.uk.xensource.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTA6NTU6MThBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNDoyODoxMlBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6MjA6MDVQTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6
NTM6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gPiA+ID4gV2hhdCBpcyB0aGUgcmVj
b21tZW5kZWQgd2F5IHRvIGRpc2FibGUgQ09ORklHX1BWX1NISU0sIHdoaWNoIGlzIHNldCBpbgo+
ID4gPiA+IHRvb2xzL2Zpcm13YXJlL01ha2VmaWxlPyBGcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhl
cmUgaXMgbm8gd2F5IHRvIGluZmx1ZW5jZQo+ID4gPiA+IGl0cyB2YWx1ZSBmcm9tIG91dHNpZGUs
IHdoaWNoIG1lYW5zIHRoZSBidWlsZCBhbHdheXMgZW50ZXJzIHhlbi1kaXIvLgo+ID4gPiAKPiA+
ID4gSSB0aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBkbyB0aGUgdHJpY2suCj4gPiA+IAo+ID4g
PiBMZXQgbWUga25vdyBpZiB0aGF0IHdvcmtzIGZvciB5b3UgYW5kIEkgd2lsbCBzdWJtaXQgaXQg
Zm9ybWFsbHkuCj4gPiA+IAo+ID4gPiBUaGFua3MhCj4gPiA+IAo+ID4gPiAtLS04PC0tLQo+ID4g
PiBkaWZmIC0tZ2l0IGEvY29uZmlnL1Rvb2xzLm1rLmluIGIvY29uZmlnL1Rvb2xzLm1rLmluCj4g
PiA+IGluZGV4IDk4MjQ1ZjYzYzkuLjg0ZGRiMWE1NDIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2NvbmZp
Zy9Ub29scy5tay5pbgo+ID4gPiArKysgYi9jb25maWcvVG9vbHMubWsuaW4KPiA+ID4gQEAgLTc1
LDMgKzc1LDUgQEAgVElORk9fTElCUyAgICAgICAgICA6PSBAVElORk9fTElCU0AKPiA+ID4gIEFS
R1BfTERGTEFHUyAgICAgICAgOj0gQGFyZ3BfbGRmbGFnc0AKPiA+ID4gIAo+ID4gPiAgRklMRV9P
RkZTRVRfQklUUyAgICA6PSBARklMRV9PRkZTRVRfQklUU0AKPiA+ID4gKwo+ID4gPiArQ09ORklH
X1BWX1NISU0gICAgICA6PSBAcHZzaGltQAo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmln
dXJlLmFjIGIvdG9vbHMvY29uZmlndXJlLmFjCj4gPiA+IGluZGV4IGM5ZmQ2OWRkZmEuLjhkZjJm
ZDYwNGIgMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+ID4gPiArKysgYi90
b29scy9jb25maWd1cmUuYWMKPiA+ID4gQEAgLTQ5Miw0ICs0OTIsMTUgQEAgQUNfQVJHX0VOQUJM
RShbOXBmc10sCj4gPiA+ICAKPiA+ID4gIEFDX1NVQlNUKG5pbmVwZnMpCj4gPiA+ICAKPiA+ID4g
K0FDX0FSR19FTkFCTEUoW3B2c2hpbV0sCj4gPiA+ICsgICAgQVNfSEVMUF9TVFJJTkcoWy0tZGlz
YWJsZS1wdnNoaW1dLCBbRGlzYWJsZSBwdnNoaW0gYnVpbGQgKHg4NiBvbmx5LCBlbmFibGVkIGJ5
IGRlZmF1bHQpXSksCj4gPiA+ICsgICAgW0FTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9wdnNoaW0iID0g
InhubyJdLCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0sIFsKPiA+ID4gKyAgICBjYXNlICIkaG9z
dF9jcHUiIGluCj4gPiA+ICsgICAgICAgIGlbWzM0NTZdXTg2fHg4Nl82NCkKPiA+ID4gKyAgICAg
ICAgICAgcHZzaGltPSJ5Ijs7Cj4gPiAKPiA+IFNpbmNlIHhlbiBkb2Vzbid0IGJ1aWxkIG9uIDMy
Yml0IGFueW1vcmUgeW91IG1heSB3YW50IHRvIGV4Y2x1ZGUKPiA+IGlbMzQ1Nl04NiBoZXJlPwo+
IAo+IE9oLCBJIGRpZG4ndCByZWFsaXplIHRoaXMuIElzIGl0IHRydWUgZm9yIGFsbCBkaXN0cm9z
PwoKRkFPRCBJIHdhcyB0aGlua2luZyBhYm91dCAzMmJpdCB4ZW4gc3VwcG9ydC4gQnV0IEkganVz
dCByZWFsaXNlIHNpbmNlCnlvdSB0ZXN0ZWQgaG9zdF9jcHUgaGVyZSwgbWF5YmUgeW91IGludGVu
ZGVkIHRvIGRvIGEgY3Jvc3MtYnVpbGQ/CgpJIGhhdmUgbmV2ZXIgdGVzdGVkIGNyb3NzLWJ1aWxk
aW5nIDY0Yml0IHhlbiBvbiBhIDMyYml0IHBsYXRmb3JtLi4uCgpXZWkuCgo+IAo+IFRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
