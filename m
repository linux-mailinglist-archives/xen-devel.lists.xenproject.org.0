Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496D71C7A4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:16:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVLp-0008PL-CL; Tue, 14 May 2019 11:12:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O8Y9=TO=citrix.com=prvs=0309661e3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQVLo-0008PG-7M
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:12:04 +0000
X-Inumbo-ID: 1645909c-7639-11e9-9607-43dbcba1b3a7
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1645909c-7639-11e9-9607-43dbcba1b3a7;
 Tue, 14 May 2019 11:11:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,468,1549929600"; d="scan'208";a="89715233"
Date: Tue, 14 May 2019 13:11:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190514111149.5kspdvmadxerskpr@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
 <5CDA89DD020000780022E70B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDA89DD020000780022E70B@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDM6MjY6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA1LjE5IGF0IDEwOjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mjg6MTJQTSArMDEwMCwgV2VpIExp
dSB3cm90ZToKPiA+PiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNToyMDowNVBNICswMjAwLCBS
b2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6
NTM6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gPj4gPiA+IFdoYXQgaXMgdGhlIHJl
Y29tbWVuZGVkIHdheSB0byBkaXNhYmxlIENPTkZJR19QVl9TSElNLCB3aGljaCBpcyBzZXQgaW4K
PiA+PiA+ID4gdG9vbHMvZmlybXdhcmUvTWFrZWZpbGU/IEZyb20gbXkgdW5kZXJzdGFuZGluZyB0
aGVyZSBpcyBubyB3YXkgdG8gCj4gPiBpbmZsdWVuY2UKPiA+PiA+ID4gaXRzIHZhbHVlIGZyb20g
b3V0c2lkZSwgd2hpY2ggbWVhbnMgdGhlIGJ1aWxkIGFsd2F5cyBlbnRlcnMgeGVuLWRpci8uCj4g
Pj4gPiAKPiA+PiA+IEkgdGhpbmsgdGhlIGZvbGxvd2luZyBzaG91bGQgZG8gdGhlIHRyaWNrLgo+
ID4+ID4gCj4gPj4gPiBMZXQgbWUga25vdyBpZiB0aGF0IHdvcmtzIGZvciB5b3UgYW5kIEkgd2ls
bCBzdWJtaXQgaXQgZm9ybWFsbHkuCj4gPj4gPiAKPiA+PiA+IFRoYW5rcyEKPiA+PiA+IAo+ID4+
ID4gLS0tODwtLS0KPiA+PiA+IGRpZmYgLS1naXQgYS9jb25maWcvVG9vbHMubWsuaW4gYi9jb25m
aWcvVG9vbHMubWsuaW4KPiA+PiA+IGluZGV4IDk4MjQ1ZjYzYzkuLjg0ZGRiMWE1NDIgMTAwNjQ0
Cj4gPj4gPiAtLS0gYS9jb25maWcvVG9vbHMubWsuaW4KPiA+PiA+ICsrKyBiL2NvbmZpZy9Ub29s
cy5tay5pbgo+ID4+ID4gQEAgLTc1LDMgKzc1LDUgQEAgVElORk9fTElCUyAgICAgICAgICA6PSBA
VElORk9fTElCU0AKPiA+PiA+ICBBUkdQX0xERkxBR1MgICAgICAgIDo9IEBhcmdwX2xkZmxhZ3NA
Cj4gPj4gPiAgCj4gPj4gPiAgRklMRV9PRkZTRVRfQklUUyAgICA6PSBARklMRV9PRkZTRVRfQklU
U0AKPiA+PiA+ICsKPiA+PiA+ICtDT05GSUdfUFZfU0hJTSAgICAgIDo9IEBwdnNoaW1ACj4gPj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJlLmFjIGIvdG9vbHMvY29uZmlndXJlLmFjCj4g
Pj4gPiBpbmRleCBjOWZkNjlkZGZhLi44ZGYyZmQ2MDRiIDEwMDY0NAo+ID4+ID4gLS0tIGEvdG9v
bHMvY29uZmlndXJlLmFjCj4gPj4gPiArKysgYi90b29scy9jb25maWd1cmUuYWMKPiA+PiA+IEBA
IC00OTIsNCArNDkyLDE1IEBAIEFDX0FSR19FTkFCTEUoWzlwZnNdLAo+ID4+ID4gIAo+ID4+ID4g
IEFDX1NVQlNUKG5pbmVwZnMpCj4gPj4gPiAgCj4gPj4gPiArQUNfQVJHX0VOQUJMRShbcHZzaGlt
XSwKPiA+PiA+ICsgICAgQVNfSEVMUF9TVFJJTkcoWy0tZGlzYWJsZS1wdnNoaW1dLCBbRGlzYWJs
ZSBwdnNoaW0gYnVpbGQgKHg4NiBvbmx5LCAKPiA+IGVuYWJsZWQgYnkgZGVmYXVsdCldKSwKPiA+
PiA+ICsgICAgW0FTX0lGKFt0ZXN0ICJ4JGVuYWJsZV9wdnNoaW0iID0gInhubyJdLCBbcHZzaGlt
PW5dLCBbcHZzaGltPXldKV0sIFsKPiA+PiA+ICsgICAgY2FzZSAiJGhvc3RfY3B1IiBpbgo+ID4+
ID4gKyAgICAgICAgaVtbMzQ1Nl1dODZ8eDg2XzY0KQo+ID4+ID4gKyAgICAgICAgICAgcHZzaGlt
PSJ5Ijs7Cj4gPj4gCj4gPj4gU2luY2UgeGVuIGRvZXNuJ3QgYnVpbGQgb24gMzJiaXQgYW55bW9y
ZSB5b3UgbWF5IHdhbnQgdG8gZXhjbHVkZQo+ID4+IGlbMzQ1Nl04NiBoZXJlPwo+ID4gCj4gPiBP
aCwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGlzLiBJcyBpdCB0cnVlIGZvciBhbGwgZGlzdHJvcz8KPiAK
PiBJdCdzIGEgcHJvcGVydHkgb2YgdGhlIGh5cGVydmlzb3IgKG5vdGU6IG5vdCB0aGUgdG9vbCBz
dGFjayksIGFzIG9mIDQuMy4KCkJ1dCB0aGUgcHJvcGVydHkgaXMgdGhhdCB0aGUgaHlwZXJ2aXNv
ciByZXF1aXJlcyBhbiBhbWQ2NCBjb21wYXRpYmxlCkNQVSB0byBydW4sIGJ1dCBpdCBzaG91bGQg
YnVpbGQgZmluZSBvbiAzMmJpdC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
