Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19F1C7BF
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:23:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVUk-00011k-AY; Tue, 14 May 2019 11:21:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQVUi-00011Z-6R
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:21:16 +0000
X-Inumbo-ID: 5f8b3f4e-763a-11e9-b8d6-8be70b6402f8
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f8b3f4e-763a-11e9-b8d6-8be70b6402f8;
 Tue, 14 May 2019 11:21:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 05:21:09 -0600
Message-Id: <5CDAA4A2020000780022E889@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 05:21:06 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190513152812.GC3977@zion.uk.xensource.com>
 <20190514085518.g3wdf7h3tka25cb6@Air-de-Roger>
 <5CDA89DD020000780022E70B@prv1-mh.provo.novell.com>
 <20190514111149.5kspdvmadxerskpr@Air-de-Roger>
In-Reply-To: <20190514111149.5kspdvmadxerskpr@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
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

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgTWF5IDE0LCAyMDE5IGF0IDAzOjI2OjUzQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTQuMDUuMTkgYXQgMTA6NTUsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6Mjg6MTJQTSArMDEwMCwgV2Vp
IExpdSB3cm90ZToKPj4gPj4gT24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6MjA6MDVQTSArMDIw
MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gPj4gPiBPbiBNb24sIE1heSAxMywgMjAxOSBh
dCAwNDo1MzoyMVBNICswMjAwLCBPbGFmIEhlcmluZyB3cm90ZToKPj4gPj4gPiA+IFdoYXQgaXMg
dGhlIHJlY29tbWVuZGVkIHdheSB0byBkaXNhYmxlIENPTkZJR19QVl9TSElNLCB3aGljaCBpcyBz
ZXQgaW4KPj4gPj4gPiA+IHRvb2xzL2Zpcm13YXJlL01ha2VmaWxlPyBGcm9tIG15IHVuZGVyc3Rh
bmRpbmcgdGhlcmUgaXMgbm8gd2F5IHRvIAo+PiA+IGluZmx1ZW5jZQo+PiA+PiA+ID4gaXRzIHZh
bHVlIGZyb20gb3V0c2lkZSwgd2hpY2ggbWVhbnMgdGhlIGJ1aWxkIGFsd2F5cyBlbnRlcnMgeGVu
LWRpci8uCj4+ID4+ID4gCj4+ID4+ID4gSSB0aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBkbyB0
aGUgdHJpY2suCj4+ID4+ID4gCj4+ID4+ID4gTGV0IG1lIGtub3cgaWYgdGhhdCB3b3JrcyBmb3Ig
eW91IGFuZCBJIHdpbGwgc3VibWl0IGl0IGZvcm1hbGx5Lgo+PiA+PiA+IAo+PiA+PiA+IFRoYW5r
cyEKPj4gPj4gPiAKPj4gPj4gPiAtLS04PC0tLQo+PiA+PiA+IGRpZmYgLS1naXQgYS9jb25maWcv
VG9vbHMubWsuaW4gYi9jb25maWcvVG9vbHMubWsuaW4KPj4gPj4gPiBpbmRleCA5ODI0NWY2M2M5
Li44NGRkYjFhNTQyIDEwMDY0NAo+PiA+PiA+IC0tLSBhL2NvbmZpZy9Ub29scy5tay5pbgo+PiA+
PiA+ICsrKyBiL2NvbmZpZy9Ub29scy5tay5pbgo+PiA+PiA+IEBAIC03NSwzICs3NSw1IEBAIFRJ
TkZPX0xJQlMgICAgICAgICAgOj0gQFRJTkZPX0xJQlNACj4+ID4+ID4gIEFSR1BfTERGTEFHUyAg
ICAgICAgOj0gQGFyZ3BfbGRmbGFnc0AKPj4gPj4gPiAgCj4+ID4+ID4gIEZJTEVfT0ZGU0VUX0JJ
VFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJVFNACj4+ID4+ID4gKwo+PiA+PiA+ICtDT05GSUdfUFZf
U0hJTSAgICAgIDo9IEBwdnNoaW1ACj4+ID4+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2NvbmZpZ3Vy
ZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+PiA+PiA+IGluZGV4IGM5ZmQ2OWRkZmEuLjhkZjJm
ZDYwNGIgMTAwNjQ0Cj4+ID4+ID4gLS0tIGEvdG9vbHMvY29uZmlndXJlLmFjCj4+ID4+ID4gKysr
IGIvdG9vbHMvY29uZmlndXJlLmFjCj4+ID4+ID4gQEAgLTQ5Miw0ICs0OTIsMTUgQEAgQUNfQVJH
X0VOQUJMRShbOXBmc10sCj4+ID4+ID4gIAo+PiA+PiA+ICBBQ19TVUJTVChuaW5lcGZzKQo+PiA+
PiA+ICAKPj4gPj4gPiArQUNfQVJHX0VOQUJMRShbcHZzaGltXSwKPj4gPj4gPiArICAgIEFTX0hF
TFBfU1RSSU5HKFstLWRpc2FibGUtcHZzaGltXSwgW0Rpc2FibGUgcHZzaGltIGJ1aWxkICh4ODYg
b25seSwgCj4+ID4gZW5hYmxlZCBieSBkZWZhdWx0KV0pLAo+PiA+PiA+ICsgICAgW0FTX0lGKFt0
ZXN0ICJ4JGVuYWJsZV9wdnNoaW0iID0gInhubyJdLCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0s
IFsKPj4gPj4gPiArICAgIGNhc2UgIiRob3N0X2NwdSIgaW4KPj4gPj4gPiArICAgICAgICBpW1sz
NDU2XV04Nnx4ODZfNjQpCj4+ID4+ID4gKyAgICAgICAgICAgcHZzaGltPSJ5Ijs7Cj4+ID4+IAo+
PiA+PiBTaW5jZSB4ZW4gZG9lc24ndCBidWlsZCBvbiAzMmJpdCBhbnltb3JlIHlvdSBtYXkgd2Fu
dCB0byBleGNsdWRlCj4+ID4+IGlbMzQ1Nl04NiBoZXJlPwo+PiA+IAo+PiA+IE9oLCBJIGRpZG4n
dCByZWFsaXplIHRoaXMuIElzIGl0IHRydWUgZm9yIGFsbCBkaXN0cm9zPwo+PiAKPj4gSXQncyBh
IHByb3BlcnR5IG9mIHRoZSBoeXBlcnZpc29yIChub3RlOiBub3QgdGhlIHRvb2wgc3RhY2spLCBh
cyBvZiA0LjMuCj4gCj4gQnV0IHRoZSBwcm9wZXJ0eSBpcyB0aGF0IHRoZSBoeXBlcnZpc29yIHJl
cXVpcmVzIGFuIGFtZDY0IGNvbXBhdGlibGUKPiBDUFUgdG8gcnVuLCBidXQgaXQgc2hvdWxkIGJ1
aWxkIGZpbmUgb24gMzJiaXQuCgpFeGNlcHQgdGhhdCBhIHR5cGljYWwgZ2NjIG9uIDMyLWJpdCB3
b24ndCBiZSBhYmxlIHRvIGJ1aWxkICg2NC1iaXQpClhlbiwgbm9yIHdvdWxkIHRoZXJlIGJlIGFu
eSBwbGFjZSB0byBlbmZvcmNlIHRoZSBuZWNlc3NhcnkKWEVOX1RBUkdFVF9BUkNIOj14ODZfNjQu
CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
