Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E80B189FF
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 14:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOiPN-0000gZ-8z; Thu, 09 May 2019 12:44:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOiPL-0000gU-9a
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 12:44:19 +0000
X-Inumbo-ID: 2717a516-7258-11e9-9339-b37b7d24a2c4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2717a516-7258-11e9-9339-b37b7d24a2c4;
 Thu, 09 May 2019 12:44:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 83E84AB92;
 Thu,  9 May 2019 12:44:12 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: =?UTF-8?B?PDIwMTkwNTA2MDY1NjQ0Ljc0MTXvv70x77+9amdyb3NzQHN1c2Uu?=
 =?UTF-8?B?Y29tPiA8MjAxOTA1MDYwNjU2NDQuNzQxNe+/vTLvv71qZ3Jvc3NAc3VzZS5jb20+?=
 =?UTF-8?B?IDwxZDVmN2IzNe+/vTMwNGPvv702YTg277+9NWYyNO+/vTY3Yjc5ZGU0NDdkY0Bj?=
 =?UTF-8?B?aXRyaXguY29tPiA8MmNhMjIxOTXvv705YmRi77+9YjA0MO+/vWNlMTLvv71kZjVi?=
 =?UTF-8?B?YjI0MTYwMzhAc3VzZS5jb20+IDwwZWQ4MmE2NO+/vTU4ZTfvv703Y2U077+9YWZk?=
 =?UTF-8?B?Me+/vTIyZjYyMWMwZDU2ZEBjaXRyaXguY29tPiA8YTNlMzM3MGLvv71hNGE577+9?=
 =?UTF-8?B?OTY1NO+/vTM2OGLvv71mOGMxM2I3Zjk3NDJAc3VzZS5jb20+IDw1Q0Q0MTQxRDAy?=
 =?UTF-8?B?MDAwMDc4MDAyMkQxRjVAcHJ2Me+/vW1oLnByb3ZvLm5vdmVsbC5jb20+IDw1ZmJh?=
 =?UTF-8?Q?2297-128c-5015-abb3-7dedd768b8d2=40suse=2ecom=3e_=3c5CD41D9C02000?=
 =?UTF-8?Q?0780022D259=40suse=2ecom=3e?=
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <99a2f5be-ac4e-5a2a-dc55-918e312b40e7@suse.com>
Date: Thu, 9 May 2019 14:44:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC V2 01/45] xen/sched: add inline wrappers
 for calling per-scheduler functions
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAxNDozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDkuMDUuMTkg
YXQgMTQ6MDMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAwOS8wNS8yMDE5IDEzOjUw
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA5LjA1LjE5IGF0IDEyOjU2LCA8amdyb3Nz
QHN1c2UuY29tPiB3cm90ZToKPj4+PiBPbiAwOS8wNS8yMDE5IDEyOjA0LCBHZW9yZ2UgRHVubGFw
IHdyb3RlOgo+Pj4+PiBPbiA1LzkvMTkgNjozMiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+
Pj4+IE9uIDA4LzA1LzIwMTkgMTg6MjQsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4+Pj4gT24g
NS82LzE5IDc6NTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+IEluc3RlYWQgb2Yg
dXNpbmcgdGhlIFNDSEVEX09QKCkgbWFjcm8gdG8gY2FsbCB0aGUgZGlmZmVyZW50IHNjaGVkdWxl
cgo+Pj4+Pj4+PiBzcGVjaWZpYyBmdW5jdGlvbnMgYWRkIGlubGluZSB3cmFwcGVycyBmb3IgdGhh
dCBwdXJwb3NlLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIHNlZW1zIGxpa2UgYSBncmVh
dCBpZGVhLiAgT25lIG1pbm9yIGNvbW1lbnQuLi4KPj4+Pj4+Pgo+Pj4+Pj4+PiArc3RhdGljIGlu
bGluZSBpbnQgc2NoZWRfaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpzKQo+Pj4+Pj4+PiArewo+Pj4+
Pj4+PiArICAgIEFTU0VSVChzLT5pbml0KTsKPj4+Pj4+Pj4gKyAgICByZXR1cm4gcy0+aW5pdChz
KTsKPj4+Pj4+Pj4gK30KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiArc3RhdGljIGlubGluZSB2b2lkIHNj
aGVkX2RlaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpzKQo+Pj4+Pj4+PiArewo+Pj4+Pj4+PiArICAg
IEFTU0VSVChzLT5kZWluaXQpOwo+Pj4+Pj4+PiArICAgIHMtPmRlaW5pdChzKTsKPj4+Pj4+Pj4g
K30KPj4+Pj4+Pgo+Pj4+Pj4+IEkgdGhpbmsgdGhlc2Ugd291bGQgYmV0dGVyIGFzIEJVR19PTigp
cy4gIFRoZXNlIGFyZW4ndCBob3QgcGF0aHMsIGFuZCBpZgo+Pj4+Pj4+IHdlIGRvIHNvbWVob3cg
aGl0IHRoaXMgc2l0dWF0aW9uIGluIHByb2R1Y3Rpb24sIDEpIGl0J3Mgc2FmZXIgdG8KPj4+Pj4+
PiBCVUdfT04oKSB0aGFuIGRlcmVmZXJlbmNpbmcgTlVMTCwgYW5kIDIpIHlvdSdsbCBnZXQgYSBt
b3JlIGhlbHBmdWwgZXJyb3IKPj4+Pj4+PiBtZXNzYWdlLgo+Pj4+Pj4KPj4+Pj4+IE9ubHkgZm9y
IHRob3NlIDIgaW5zdGFuY2VzIGFib3ZlPyBPciB3b3VsZCB5b3UgbGlrZSBCVUdfT04oKSBpbnN0
ZWFkIG9mCj4+Pj4+PiBBU1NFUlQoKSBpbiB0aGUgb3RoZXIgYWRkZWQgaW5saW5lcywgdG9vICht
YXliZSBub3QgZm9yIHBpY2tfY3B1LCBidXQKPj4+Pj4+IGUuZy4gdGhlIG9uZXMgaW4gZnJlZV8q
KSA/Cj4+Pj4+Cj4+Pj4+IFdoeSBub3QgZm9yIHBpY2tfY3B1KCk/ICBJdCdzIHRoZSBzYW1lIGJh
c2ljIGxvZ2ljIC0tIGluIHByb2R1Y3Rpb24sIGlmCj4+Pj4+IGl0ICppcyogTlVMTCwgdGhlbiB5
b3UnbGwgZWl0aGVyIGNyYXNoIHdpdGggYSBzZWdmYXVsdCwgb3Igc3RhcnQKPj4+Pj4gZXhlY3V0
aW5nIGFuIGV4cGxvaXQuICBNdWNoIGJldHRlciB0byBCVUdfT04oKS4KPj4+Pgo+Pj4+IHBpY2tf
Y3B1IGlzIGNhbGxlZCByYXRoZXIgb2Z0ZW4sIHNvIG1heWJlIHdlIHNob3VsZCBhdm9pZCBhZGRp
dGlvbmFsCj4+Pj4gdGVzdHMuCj4+Pj4KPj4+PiBIbW0sIHRoaW5raW5nIG1vcmUgYWJvdXQgaXQ6
IHdoeSBkb24ndCB3ZSBqdXN0IGRyb3AgdGhvc2UgQVNTRVJUL0JVR19PTgo+Pj4+IGZvciBtYW5k
YXRvcnkgZnVuY3Rpb25zIGFuZCB0ZXN0IHRoZW0gd2hlbiBkb2luZyB0aGUgZ2xvYmFsX2luaXQo
KSBsb29wCj4+Pj4gb3ZlciBhbGwgc2NoZWR1bGVycy4gV2UgY291bGQganVzdCByZWplY3Qgc2No
ZWR1bGVycyB3aXRoIG1pc3NpbmcKPj4+PiBmdW5jdGlvbnMuCj4+Pgo+Pj4gVGhpcyB3b3VsZCBp
bXBseSBwb2ludGVycyBjYW4ndCBiZSB6YXBwZWQgb2ZmIHRoZSBzdHJ1Y3R1cmVzLgo+Pj4gSU1P
IHRoaXMgd291bGQgcmVxdWlyZSwgYXMgbWluaW1hbCAobGFuZ3VhZ2UgbGV2ZWwpIHByb3RlY3Rp
b24sCj4+PiB0aGF0IGFsbCBpbnN0YW5jZXMgb2Ygc3RydWN0IHNjaGVkdWxlciBiZSBjb25zdCwg
d2hpY2ggZG9lc24ndAo+Pj4gbG9vayBkb2FibGUgd2l0aG91dCBzb21lIGZ1cnRoZXIgcmV3b3Jr
Cj4+Cj4+IFRoZXkgYXJlIGNvbnN0IGFscmVhZHkuCj4+Cj4+IFRoZSBkZWZhdWx0IHNjaGVkdWxl
cidzIHN0cnVjdCBpcyBjb3BpZWQgdG8gYSBub24tY29uc3Qgc3RydWN0IHNjaGVkdWxlcgo+PiBp
biBzY2hlZHVsZXJfaW5pdCgpLgo+IAo+IEV4YWN0bHksIGFuZCB0aGVuIHdlIGhhdmUgdGhpbmdz
IGxpa2UKPiAKPiBzdGF0aWMgaW50Cj4gcnRfaW5pdChzdHJ1Y3Qgc2NoZWR1bGVyICpvcHMpCj4g
ewo+ICAgICAuLi4KPiAgICAgb3BzLT5zY2hlZF9kYXRhID0gcHJ2Owo+IAo+IEkuZS4gaXQgd291
bGQgYmUgcXVpdGUgZWFzeSBmb3IgYSBzcGVjaWZpYyBzY2hlZHVsZXIgdG8gemFwIG9uZSBvciBt
b3JlCj4gb2YgaXRzIHBvaW50ZXJzLgoKU28geW91IHN1Z2dlc3QgdG8gQVNTRVJUIGFsbCBwb2lu
dGVycyBiZWZvcmUgZGVyZWZlcmVuY2luZyB0aGVtPyBXaHkKZG9uJ3Qgd2UgaGF2ZSBzdWNoIEFT
U0VSVHMgaW4gcGxhY2VzIHdoZXJlIHdlIHVzZSBmdW5jdGlvbiB2ZWN0b3JzCmhvb2tlZCB0byBk
eW5hbWljIGRhdGEgKGFuZCBJIGRvbid0IG1lYW4gdGhlIHNpbmdsZSBmdW5jdGlvbnMsIGJ1dCB0
aGUKcG9pbnRlcnMgdG8gdGhlIHZlY3RvciwgZS5nLiBkb21haW4tPmFyY2guY3R4dF9zd2l0Y2gp
PwoKU2VyaW91c2x5LCB0aGF0IHdvdWxkIGJlIGEgbWFqb3IgcHJvZ3JhbW1pbmcgYnVnIGFuZCBJ
IGRvbid0IHRoaW5rCndlIG5lZWQgdG8gY2F0Y2ggdGhhdCBieSBkZWJ1ZyBjb2RlIHNwcmlua2xl
ZCBhcm91bmQgZXZlcnl3aGVyZS4KCkFmdGVyIG15IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMgaXMg
ZmluaXNoZWQgSSdkIGxpa2UgdG8gZG8gYSBtYWpvcgpzY2hlZHVsZXIgY2xlYW51cCBzZXJpZXMu
IE9uZSBhY3Rpb24gaXRlbSB3aWxsIGJlIHRvIGhhdmUgYSBzaW5nbGUKaW5zdGFuY2UgY29uc3Qg
c2NoZWR1bGVyX2Z1bmNzIHN0cnVjdHVyZSBmb3IgZWFjaCBzY2hlZHVsZXIgYW5kIGEKcGVyLWNw
dXBvb2wgc2NoZWR1bGVyX2RhdGEgcG9pbnRlci4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
