Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B751BA17
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 17:30:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCsJ-0008Jx-2O; Mon, 13 May 2019 15:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQCsI-0008Js-8m
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:28:22 +0000
X-Inumbo-ID: b9f65a1a-7593-11e9-8f20-4f58c3224074
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9f65a1a-7593-11e9-8f20-4f58c3224074;
 Mon, 13 May 2019 15:28:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85395078"
Date: Mon, 13 May 2019 16:28:12 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190513152812.GC3977@zion.uk.xensource.com>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
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

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDU6MjA6MDVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE1heSAxMywgMjAxOSBhdCAwNDo1MzoyMVBNICswMjAwLCBPbGFm
IEhlcmluZyB3cm90ZToKPiA+IFdoYXQgaXMgdGhlIHJlY29tbWVuZGVkIHdheSB0byBkaXNhYmxl
IENPTkZJR19QVl9TSElNLCB3aGljaCBpcyBzZXQgaW4KPiA+IHRvb2xzL2Zpcm13YXJlL01ha2Vm
aWxlPyBGcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhlcmUgaXMgbm8gd2F5IHRvIGluZmx1ZW5jZQo+
ID4gaXRzIHZhbHVlIGZyb20gb3V0c2lkZSwgd2hpY2ggbWVhbnMgdGhlIGJ1aWxkIGFsd2F5cyBl
bnRlcnMgeGVuLWRpci8uCj4gCj4gSSB0aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBkbyB0aGUg
dHJpY2suCj4gCj4gTGV0IG1lIGtub3cgaWYgdGhhdCB3b3JrcyBmb3IgeW91IGFuZCBJIHdpbGwg
c3VibWl0IGl0IGZvcm1hbGx5Lgo+IAo+IFRoYW5rcyEKPiAKPiAtLS04PC0tLQo+IGRpZmYgLS1n
aXQgYS9jb25maWcvVG9vbHMubWsuaW4gYi9jb25maWcvVG9vbHMubWsuaW4KPiBpbmRleCA5ODI0
NWY2M2M5Li44NGRkYjFhNTQyIDEwMDY0NAo+IC0tLSBhL2NvbmZpZy9Ub29scy5tay5pbgo+ICsr
KyBiL2NvbmZpZy9Ub29scy5tay5pbgo+IEBAIC03NSwzICs3NSw1IEBAIFRJTkZPX0xJQlMgICAg
ICAgICAgOj0gQFRJTkZPX0xJQlNACj4gIEFSR1BfTERGTEFHUyAgICAgICAgOj0gQGFyZ3BfbGRm
bGFnc0AKPiAgCj4gIEZJTEVfT0ZGU0VUX0JJVFMgICAgOj0gQEZJTEVfT0ZGU0VUX0JJVFNACj4g
Kwo+ICtDT05GSUdfUFZfU0hJTSAgICAgIDo9IEBwdnNoaW1ACj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2NvbmZpZ3VyZS5hYyBiL3Rvb2xzL2NvbmZpZ3VyZS5hYwo+IGluZGV4IGM5ZmQ2OWRkZmEuLjhk
ZjJmZDYwNGIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvY29uZmlndXJlLmFjCj4gKysrIGIvdG9vbHMv
Y29uZmlndXJlLmFjCj4gQEAgLTQ5Miw0ICs0OTIsMTUgQEAgQUNfQVJHX0VOQUJMRShbOXBmc10s
Cj4gIAo+ICBBQ19TVUJTVChuaW5lcGZzKQo+ICAKPiArQUNfQVJHX0VOQUJMRShbcHZzaGltXSwK
PiArICAgIEFTX0hFTFBfU1RSSU5HKFstLWRpc2FibGUtcHZzaGltXSwgW0Rpc2FibGUgcHZzaGlt
IGJ1aWxkICh4ODYgb25seSwgZW5hYmxlZCBieSBkZWZhdWx0KV0pLAo+ICsgICAgW0FTX0lGKFt0
ZXN0ICJ4JGVuYWJsZV9wdnNoaW0iID0gInhubyJdLCBbcHZzaGltPW5dLCBbcHZzaGltPXldKV0s
IFsKPiArICAgIGNhc2UgIiRob3N0X2NwdSIgaW4KPiArICAgICAgICBpW1szNDU2XV04Nnx4ODZf
NjQpCj4gKyAgICAgICAgICAgcHZzaGltPSJ5Ijs7CgpTaW5jZSB4ZW4gZG9lc24ndCBidWlsZCBv
biAzMmJpdCBhbnltb3JlIHlvdSBtYXkgd2FudCB0byBleGNsdWRlCmlbMzQ1Nl04NiBoZXJlPwoK
V2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
