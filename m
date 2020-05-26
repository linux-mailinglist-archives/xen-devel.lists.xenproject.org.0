Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8481D1E24A4
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 16:57:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdb0h-00028y-9e; Tue, 26 May 2020 14:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdb0g-00028t-5N
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 14:56:54 +0000
X-Inumbo-ID: 223f4440-9f61-11ea-8993-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 223f4440-9f61-11ea-8993-bc764e2007e4;
 Tue, 26 May 2020 14:56:53 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VsQLdcC/tJ4zRDV10UdsWSp1gVaeujGl3vFAN0uwJlEkTS9rBiII3Rv+yBoTKBpvyg09yJgVAk
 AkWqpy1owbL6R6ryuoU6ir1syBXI/9gJ+FgMR3YqYtZtyN0HrFeucvYF78aVx/k5R+Jp0+en93
 W2rutPnLLFPBhf6aZ9CesBf8g4QIGTEDn4HhzOFz9S2LW5WvFzeDiSh8FjWUWdGaQL6H6lo0xt
 1FnPOmHYGDdI/X4wGrKPEs0p0tAuHyTCrb+xJXr65KoeLnvXE0hOL61bZmsqc5zsyakKlE4+PP
 +hI=
X-SBRS: 2.7
X-MesageID: 18751974
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18751974"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
Thread-Topic: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
Thread-Index: AQHWMFPgaNjzBfpXokm+gPTH75vVE6i6R9yAgAARtwA=
Date: Tue, 26 May 2020 14:56:48 +0000
Message-ID: <B1814837-4E4B-4795-887E-769E3D25608A@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-4-george.dunlap@citrix.com>
 <24269.8019.97048.52370@mariner.uk.xensource.com>
In-Reply-To: <24269.8019.97048.52370@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D619586DFB76D468E064C20DB71D3E0@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI2LCAyMDIwLCBhdCAyOjUzIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRD
SCAzLzVdIGxpYnhsOiBHZW5lcmF0ZSBnb2xhbmcgYmluZGluZ3MgaW4gbGlieGwgTWFrZWZpbGUi
KToNCj4+ICsuUEhPTlk6IGlkbC1leHRlcm5hbA0KPj4gK2lkbC1leHRlcm5hbDoNCj4+ICsJJChN
QUtFKSAtQyAkKFhFTl9ST09UKS90b29scy9nb2xhbmcveGVubGlnaHQgaWRsLWdlbg0KPiANCj4g
VW5mb3J0dW5hdGVseSB0aGlzIGtpbmQgb2YgdGhpbmcgaXMgZm9yYmlkZGVuLiAgQXQgbGVhc3Qs
IHdpdGhvdXQgYQ0KPiByaWdvcm91cyBwcm9vZiB0aGF0IHRoaXMgaXNuJ3QgYSBjb25jdXJyZW5j
eSBoYXphcmQuDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHdpdGggcGFyYWxsZWwgbWFrZSwg
dGhlIGNvbmN1cnJlbmN5IGNvcnJlY3RuZXNzDQo+IHByaW5jaXBsZXMgYXJlIGFzIGZvbGxvd3M6
DQo+ICgxKSBkaWZmZXJlbnQgdGFyZ2V0cyB1c2Ugbm9ub3ZlcmxhcHBpbmcgdGVtcG9yYXJ5IGFu
ZCBvdXRwdXQgZmlsZXMNCj4gICAgKG1ha2VmaWxlIGF1dGhvcnMnIHJlc3BvbnNpYmlsaXkpDQo+
ICgyKSBvbmUgaW52b2NhdGlvbiBvZiBtYWtlIHdvbid0IG1ha2UgdGhlIHNhbWUgdGFyZ2V0IHR3
aWNlIGF0IHRoZQ0KPiAgICBzYW1lIHRpbWUgKGZ1bmRhbWVudGFsIHByaW5jaXBsZSBvZiBvcGVy
YXRpb24gZm9yIG1ha2UpDQo+ICgzKSB0aGUgc2FtZSBtYWtlZmlsZSAob3IgZGlmZmVyZW50IG1h
a2VmaWxlcyB3aXRoIG92ZXJsYXBwaW5nDQo+ICAgIHRhcmdldHMpIG1heSBub3QgYmUgZW50ZXJl
ZCBtdWx0aXBsZSB0aW1lcyBpbiBwYXJhbGxlbA0KPiAgICAoYnVpbGQgc3lzdGVtIGF1dGhvcnMn
IHJlc3BvbnNpYmlsaXR5OyBwcmVjbHVjZGVzIG1vc3QgdXNlIG9mDQo+ICAgIG1ha2UgLUMgdG8g
c2libGluZyBkaXJlY3RvcmllcyByYXRoZXIgdGhhbiB0byBjaGlsZHJlbikNCj4gDQo+IEEgY29y
cmVjdG5lc3MgcHJvb2YgdG8gbWFrZSBhbiBleGNlcHRpb24gd291bGQgaW52b2x2ZSBkZW1vbnN0
cmF0aW5nDQo+IHRoYXQgdGhlIHRvb2xzL2dvbGFuZyBkaXJlY3RvcmllcyBuZXZlciB0b3VjaCB0
aGlzIGZpbGUgd2hlbiBpbnZva2VkDQo+IGFzIHBhcnQgb2YgYSByZWN1cnNpdmUgYnVpbGQuICBO
QiwgY29uc2lkZXIgdGhlIGNsZWFuIHRhcmdldHMgdG9vLg0KDQp0b29scy9nb2xhbmcveGVubGln
aHQvTWFrZWZpbGU6Ki5nZW4uZ28gdGFyZ2V0IHdpbGwgYmUgdHJpZ2dlcmVkIGJ5IHhlbmxpZ2h0
L01ha2VmaWxlOmlkbC1nZW4gYW5kIHhlbmxpZ2h0L01ha2VmaWxlOmJ1aWxkLg0KDQp4ZW5saWdo
dC9NYWtlZmlsZTpidWlsZCBpcyBjYWxsZWQgZnJvbSB0b29scy9nb2xhbmcvTWFrZmlsZTpzdWJk
aXJzLWFsbCwgd2hpY2ggaXMgY2FsbGVkIGZyb20gdG9vbHMvTWFrZWZpbGU6c3ViZGlycy1hbGwu
DQoNCnhlbmxpZ2h0L01ha2VmaWxlOmlkbC1nZW4gaXMgY2FsbGVkIGZyb20gdG9vbHMvbGlieGwv
TWFrZWZpbGU6aWRsLWV4dGVybmFsLCB3aGljaCBpcyBjYWxsZWQgZnJvbSB0b29scy9saWJ4bC9N
YWtlZmlsZTphbGwsIHdoaWNoIGlzIGNhbGxlZCBmcm9tIHRvb2xzL01ha2VmaWxlOnN1YmRpcnMt
YWxsLg0KDQp0b29scy9NYWtlZmlsZTpzdWJkaXJzLWFsbCBpcyBpbXBsZW1lbnRlZCBhcyBhIG5v
bi1wYXJhbGxlbCBmb3IgbG9vcCBleGVjdXRpbmcgb3ZlciBTVUJESVJTLXk7IHRvb2xzL2dvbGFu
ZyBjb21lcyBhZnRlciB0b29scy9saWJ4bCBpbiB0aGF0IGxpc3QsIGFuZCBzbyB0b29scy9nb2xh
bmc6YWxsIHdpbGwgbmV2ZXIgYmUgY2FsbGVkIHVudGlsIGFmdGVyIHRvb2xzL2xpYnhsOmFsbCBo
YXMgY29tcGxldGVkLiAgVGhpcyBpbnZhcmlhbnQg4oCUIHRoYXQgdG9vbHMvZ29sYW5nL01ha2Vm
aWxlOmFsbCBtdXN0IG5vdCBiZSBjYWxsZWQgdW50aWwgdG9vbHMvbGlieGwvTWFrZWZpbGU6YWxs
IGhhcyBjb21wbGV0ZWQgbXVzdCBiZSBrZXB0IHJlZ2FyZGxlc3Mgb2YgdGhpcyBwYXRjaCwgc2lu
Y2UgeGVubGlnaHQvTWFrZWZpbGU6YnVpbGQgZGVwZW5kcyBvbiBvdGhlciBvdXRwdXQgZnJvbSB0
b29scy9saWJ4bC9NYWtlZmlsZTphbGwuDQoNClNvIGFzIGxvbmcgYXMgbm90aGluZyBlbHNlIGNh
bGxzIHRvb2xzL2xpYnhsOmFsbCBvciB0b29scy9saWJ4bDppZGwtZXh0ZXJuYWwsIHRoaXMgc2hv
dWxkIGJlIHNhZmUuICBXZSBjb3VsZCBhZGQgYSBjb21tZW50cyBuZWFyIHhlbmxpZ2h0L01ha2Vm
aWxlOmlkbC1nZW4gc2F5aW5nIGl0IG11c3Qgb25seSBiZSBjYWxsZWQgZnJvbSBsaWJ4bC9NYWtl
ZmlsZTppZGwtZXh0ZXJuYWw7IGFuZCB0byBsaWJ4bC9NYWtlZmlsZTppZGwtZXh0ZXJuYWwgc2F5
aW5nIGl0IG11c3Qgbm90IGJlIGNhbGxlZCByZWN1cnNpdmVseSBmcm9tIGFub3RoZXIgTWFrZWZp
bGUuDQoNCj4gQWx0ZXJuYXRpdmVseSwgbW92ZSB0aGUgZ2VuZXJhdGVkIGdvbGFuZyBmaWxlcyB0
byB0b29scy9saWJ4bCBtYXliZSwNCj4gYW5kIHBlcmhhcHMgbGVhdmUgc3ltbGlua3MgYmVoaW5k
Lg0KDQpXb3VsZCB0aGF0IHJlc3VsdCBpbiB0aGUgZmlsZXMgYmVpbmcgYWNjZXNzaWJsZSB0byB0
aGUgZ29sYW5nIGJ1aWxkIHRvb2xzIGF0IGh0dHBzOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9n
aXQtaHR0cC94ZW4uZ2l0L3Rvb2xzL2dvbGFuZy94ZW5saWdodCA/ICBJZiBub3QsIGl0IGRlZmVh
dHMgdGhlIHB1cnBvc2Ugb2YgaGF2aW5nIHRoZSBmaWxlcyBjaGVja2VkIGludG8gdGhlIHRyZWUu
DQoNCj4gT3IgY29udmVydCB0aGUgd2hvbGUgKG9mIHRvb2xzLywgbWF5YmUpIHRvIG5vbnJlY3Vy
c2l2ZSBtYWtlIHVzaW5nIGVnDQo+IHN1YmRpcm1rIDotKS4gIGh0dHBzOi8vZGl6aWV0LmRyZWFt
d2lkdGgub3JnLzU3NjMuaHRtbA0KDQpUaGlzIGlzbuKAmXQgcmVhbGx5IGEgcHJhY3RpY2FsIHN1
Z2dlc3Rpb246IEkgZG9u4oCZdCBoYXZlIHRpbWUgdG8gcmVmYWN0b3IgdGhlIGVudGlyZSBsaWJ4
bCBNYWtlZmlsZSB0cmVlLCBhbmQgY2VydGFpbmx5IGRvbuKAmXQgaGF2ZSB0aW1lIGJ5IEZyaWRh
eS4NCg0KIC1HZW9yZ2U=

