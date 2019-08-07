Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DF84AC2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 13:41:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKG7-0002D1-VD; Wed, 07 Aug 2019 11:37:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvKG6-0002Cu-Us
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 11:37:34 +0000
X-Inumbo-ID: bf2a384e-b907-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf2a384e-b907-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 11:37:33 +0000 (UTC)
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
IronPort-SDR: v3RuB7Qa0coGRRqhvA05PzA8iIN0upCt3n63QOQkE86/Uwohc7h3OcDR7eY+v0cLo+pEzS9AaJ
 +wi1F4OHQVGArPsQdKUN8WqDP3wmjjTKYu7tOcnRkbJM6PB/V6eV3S6WSj6qODg4gGZW0CMo9o
 ZiqO/tPfVY5obFdba8p8o2QvOVKohEcbZVTHW7ukecBV6vIzm4pE/aDcd7gJYcC2eYBJZJxDMO
 6pY2QGLwYMe0V1VL5z2FPDaZsAAlwiTalng+KJpZ8w+6fOdqvIr6FIIPVIP0kVDj/JJBksFqB9
 6n8=
X-SBRS: 2.7
X-MesageID: 4101996
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4101996"
Date: Wed, 7 Aug 2019 13:37:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190807113726.7is4txa6z3onexct@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-7-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-7-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MTVQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gQWRkIGEgbmV3IGVudHJ5IHBvaW50IGZvciBYZW4gUFZIIHRoYXQgZW50ZXIgZGly
ZWN0bHkgaW4gMzJiaXRzLgo+IAo+IEluZm9ybWF0aW9uIG9uIHRoZSBleHBlY3RlZCBzdGF0ZSBv
ZiB0aGUgbWFjaGluZSB3aGVuIHRoaXMgZW50cnkgcG9pbnQKPiBpcyB1c2VkIGNhbiBiZSBmb3Vu
ZCBhdDoKPiBodHRwczovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZG9jcy91bnN0YWJsZS9taXNj
L3B2aC5odG1sCj4gCj4gQWxzbywgY29tcGFyZSB0byB0aGUgb3JpZ2luYWwgZmlsZSBbMV0sIHRo
ZSB0d28gYG5vcCcgb2YgdGhlICJyZXNldFZlY3RvciIKPiBlbnRyeSBwb2ludCBhcmUgcmVtb3Zl
ZC4gVGhlcmUgd2VyZSBpbnRyb2R1Y2VkIGJ5IDgzMzI5ODNlMmUzMwo+ICgiVWVmaUNwdVBrZzog
UmVwbGFjZSB0aGUgdW4tbmVjZXNzYXJ5IFdCSU5WRCBpbnN0cnVjdGlvbiBhdCB0aGUgcmVzZXQK
PiB2ZWN0b3Igd2l0aCB0d28gTk9QcyBpbiBWVEYwLiIsIDIwMTEtMDgtMDQpLCBidXQgZG9uJ3Qg
c2VlbXMgdG8gYmUKPiB1c2VmdWwuIFRoaXMgaXMgdGhlIGVudHJ5IHBvaW50IHVzZWQgYnkgSFZN
IGd1ZXN0IChodm1sb2FkZXIpLgo+IAo+IFsxXSBVZWZpQ3B1UGtnL1Jlc2V0VmVjdG9yL1Z0ZjAv
SWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5v
Y29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTogTGFzemxvIEVyc2Vr
IDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjQ6Cj4gICAgIC0g
cmVtb3ZlIHRoZSB0d28gbm9wIGluIHRoZSBIVk0gZW50cnkgcG9pbnQKPiAgICAgCj4gICAgIHYz
Ogo+ICAgICAtIHJlYmFzZWQsIFNQRFgKPiAgICAgLSByZW1vdmUgYGNsaScgYXMgdmlhIFBWSCB0
aGUgaW50ZXJydXB0cyBhcmUgZ3VhcmFudGVlZCB0byBiZSBvZmYKPiAgICAgLSByZXdyaXRlIHNv
bWUgY29tbWVudHMKPiAKPiAgLi4uL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYw
LmFzbSAgIHwgNzkgKysrKysrKysrKysrKysrKysrKwo+ICBPdm1mUGtnL1hlblJlc2V0VmVjdG9y
L0lhMzIvWGVuUFZITWFpbi5hc20gICAgfCA0OSArKysrKysrKysrKysKPiAgT3ZtZlBrZy9YZW5S
ZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5uYXNtYiAgIHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEyOSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL1hlblJl
c2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCj4gCj4gZGlmZiAtLWdp
dCBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9SZXNldFZlY3RvclZ0ZjAuYXNtIGIvT3Zt
ZlBrZy9YZW5SZXNldFZlY3Rvci9JYTE2L1Jlc2V0VmVjdG9yVnRmMC5hc20KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjU2NzQ5YmRiYzkKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTE2L1Jlc2V0VmVjdG9yVnRmMC5hc20K
PiBAQCAtMCwwICsxLDc5IEBACj4gKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArOyBAZmlsZQo+
ICs7IEZpcnN0IGNvZGUgZXhlY3V0ZWQgYnkgcHJvY2Vzc29yIGFmdGVyIHJlc2V0dGluZy4KPiAr
Owo+ICs7IENvcHlyaWdodCAoYykgMjAwOCAtIDIwMTQsIEludGVsIENvcnBvcmF0aW9uLiBBbGwg
cmlnaHRzIHJlc2VydmVkLjxCUj4KPiArOyBDb3B5cmlnaHQgKGMpIDIwMTksIENpdHJpeCBTeXN0
ZW1zLCBJbmMuCj4gKzsKPiArOyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNl
LVBhdGVudAo+ICs7Cj4gKzstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK0JJVFMgICAgMTYK
PiArCj4gK0FMSUdOICAgMTYKPiArCj4gKzsKPiArOyBQYWQgdGhlIGltYWdlIHNpemUgdG8gNGsg
d2hlbiBwYWdlIHRhYmxlcyBhcmUgaW4gVlRGMAo+ICs7Cj4gKzsgSWYgdGhlIFZURjAgaW1hZ2Ug
aGFzIHBhZ2UgdGFibGVzIGJ1aWx0IGluLCB0aGVuIHdlIG5lZWQgdG8gbWFrZQo+ICs7IHN1cmUg
dGhlIGVuZCBvZiBWVEYwIGlzIDRrIGFib3ZlIHdoZXJlIHRoZSBwYWdlIHRhYmxlcyBlbmQuCj4g
KzsKPiArOyBUaGlzIGlzIHJlcXVpcmVkIHNvIHRoZSBwYWdlIHRhYmxlcyB3aWxsIGJlIDRrIGFs
aWduZWQgd2hlbiBWVEYwIGlzCj4gKzsgbG9jYXRlZCBqdXN0IGJlbG93IDB4MTAwMDAwMDAwICg0
R0IpIGluIHRoZSBmaXJtd2FyZSBkZXZpY2UuCj4gKzsKPiArJWlmZGVmIEFMSUdOX1RPUF9UT180
S19GT1JfUEFHSU5HCj4gKyAgICBUSU1FUyAoMHgxMDAwIC0gKCQgLSBFbmRPZlBhZ2VUYWJsZXMp
IC0gKGZvdXJHaWdhYnl0ZXMgLSB4ZW5QVkhFbnRyeVBvaW50KSkgREIgMAo+ICslZW5kaWYKPiAr
Cj4gK0JJVFMgICAgMzIKCkkgdGhpbmsgeW91IGxpa2VseSB3YW50IGFuIEFMSUdOIDMyIGhlcmUg
aW4gY2FzZQpBTElHTl9UT1BfVE9fNEtfRk9SX1BBR0lORyBpcyBub3QgZGVmaW5lZCwgc28gdGhh
dCB4ZW5QVkhFbnRyeVBvaW50IGlzCmFsaWduZWQgdG8gYSBkb3VibGUgd29yZCBib3VuZGFyeT8K
Cihub3QgdGhhdCBpdCdzIG1hbmRhdG9yeSBmb3IgdGhpcyB0byB3b3JrKQoKVGhlIHJlc3QgTEdU
TS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
