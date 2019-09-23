Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A2BB219
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLNm-0008Vg-Jy; Mon, 23 Sep 2019 10:15:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0fYd=XS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCLNk-0008VT-SD
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:15:48 +0000
X-Inumbo-ID: 1c3600f8-ddeb-11e9-95fc-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c3600f8-ddeb-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 10:15:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBC10AE68;
 Mon, 23 Sep 2019 10:15:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
 <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
 <9d1c6e2b-fc3d-ad28-580b-cbfbb83d93e1@suse.com>
 <6f14e2e9-3e8f-5a48-cd01-aec41d61be66@suse.com>
 <80cfdfb0-fd25-1f58-45e6-96a0888a7b0a@suse.com>
 <5bfce92a-8c85-28e1-53f2-daca7e35bb6a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d522cf95-06d3-3c60-19f9-e27feeca090f@suse.com>
Date: Mon, 23 Sep 2019 12:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5bfce92a-8c85-28e1-53f2-daca7e35bb6a@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Regression with vcpu runstate info and
 XEN_RUNSTATE_UPDATE
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 SergeyDyasli <sergey.dyasli@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMTkgMTI6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA5LjIwMTkgMTE6
NTYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDIzLjA5LjE5IDExOjUxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDIzLjA5LjIwMTkgMTE6NDIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMTYuMDkuMTkgMTc6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4wOS4y
MDE5IDE2OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gQWZ0ZXIgYSBjb21wbGljYXRl
ZCBpbnZlc3RpZ2F0aW9uLCBpdCB0dXJucyBvdXQgdGhhdCBjL3MgMjUyOWM4NTBlYTQ4Cj4+Pj4+
PiBicm9rZSB4Y192Y3B1X2dldGluZm8oKS4KPj4+Pj4+Cj4+Pj4+PiBUaGUgYnVnIGxvb2tzIGFz
IGlmIGl0IGlzIGluIHZjcHVfcnVuc3RhdGVfZ2V0KCksIHdoaWNoIGRvZXNuJ3QgYWNjb3VudAo+
Pj4+Pj4gZm9yIFhFTl9SVU5TVEFURV9VUERBVEUgYW5kIGNhbGN1bGF0aW5nIGEgd2lsZGx5IGlu
YXBwcm9wcmlhdGUgZGVsdGEuCj4+Pj4+PiBVbHRpbWF0ZWx5LCB0aGUgcmVzdWx0IG9mIFhFTl9E
T01DVExfZ2V0dmNwdWluZm8gZW5kcyB1cCB2ZXJ5Cj4+Pj4+PiBvY2Nhc2lvbmFsbHkgd2l0aCBv
cC0+dS5nZXR2Y3B1aW5mby5jcHVfdGltZSBiZWluZyB3cm9uZyBieSAxIDw8IDYzLgo+Pj4+Pj4K
Pj4+Pj4+IEdpdmVuIHNvbWUgb2YgdGhlIGNhbGxlcnMgb2YgdmNwdV9ydW5zdGF0ZV9nZXQoKSwg
SSBkb24ndCB0aGluayBpdCBpcwo+Pj4+Pj4gcmVhc29uYWJsZSB0byBwYXVzZSB0aGUgVkNQVSB3
aGlsZSByZWFkaW5nIHRoZSBydW5zdGF0ZSBpbmZvLsKgIEhvd2V2ZXIsCj4+Pj4+PiBpdCBpcyBh
bHNvIHVuY2xlYXIgd2hldGhlciB3YWl0aW5nIGZvciBYRU5fUlVOU1RBVEVfVVBEQVRFIHRvIGRy
b3AgaW4KPj4+Pj4+IHZjcHVfcnVuc3RhdGVfZ2V0KCkgaXMgc2FmZSBlaXRoZXIuCj4+Pj4+Cj4+
Pj4+IEZpcnN0IGFuZCBmb3JlbW9zdCBJJ20gd29uZGVyaW5nIHdoZXRoZXIgc2ltcGx5IG1hc2tp
bmcgb2ZmCj4+Pj4+IFhFTl9SVU5TVEFURV9VUERBVEUgaW4gdmNwdV9ydW5zdGF0ZV9nZXQoKSB3
b3VsZG4ndCBiZSBhbgo+Pj4+PiBvcHRpb24uIFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBmZWF0dXJl
IGFzIGEgd2hvbGUgaXMgZm9yIHRoZQo+Pj4+PiBoaWdoIGJpdCB0byBuZXZlciBiZSBzZXQgaW4g
YW4gYWN0dWFsIHRpbWUgdmFsdWUsIGFmdGVyIGFsbC4KPj4+Pj4KPj4+Pj4gVGhlIG90aGVyIG9w
dGlvbiBJJ2Qgc2VlIGlzIGZvciB2Y3B1X3J1bnN0YXRlX2dldCgpIHRvIGdhaW4KPj4+Pj4gYSBi
b29sZWFuIHJldHVybiB0eXBlIGJ5IHdoaWNoIGl0IHdvdWxkIGluZGljYXRlIHRvCj4+Pj4+IGlu
dGVyZXN0ZWQgY2FsbGVycyB3aGV0aGVyIHRoZSBsYXRjaGluZyBvZiB0aGUgdmFsdWVzCj4+Pj4+
IGhhcHBlbmVkIHdoaWxlIGFuIHVwZGF0ZSB3YXMgaW4gcHJvZ3Jlc3MgZWxzZXdoZXJlLiBDYWxs
ZXJzCj4+Pj4+IG5lZWRpbmcgdG8gY29uc3VtZSB0aGUgcG90ZW50aWFsbHkgaW5jb3JyZWN0IHJl
c3VsdCBjb3VsZAo+Pj4+PiB0aGVuIGNob29zZSB0byB3YWl0IG9yIHNjaGVkdWxlIGEgaHlwZXJj
YWxsIGNvbnRpbnVhdGlvbi4KPj4+Pj4KPj4+Pj4gVGhlIDNyZCBvcHRpb24gKGxlc3MgZGVzaXJh
YmxlIGltbyBub3QgdGhlIGxlYXN0IGJlY2F1c2UgaXQKPj4+Pj4gd291bGQgcmVxdWlyZSB0b3Vj
aGluZyBhbGwgY2FsbGVycykgd291bGQgYmUgZm9yIHRoZSBmdW5jdGlvbgo+Pj4+PiB0byBnYWlu
IGEgcGFyYW1ldGVyIHRlbGxpbmcgaXQgd2hldGhlciB0byBzcGluIHVudGlsCj4+Pj4+IFhFTl9S
VU5TVEFURV9VUERBVEUgaXMgb2JzZXJ2ZWQgY2xlYXIuCj4+Pj4KPj4+PiBBbmQgdGhlIDR0aCBv
cHRpb24gd291bGQgYmUgdG8gbGV0IHZjcHVfcnVuc3RhdGVfZ2V0KCkgb3BlcmF0ZSBvbiBhCj4+
Pj4gbG9jYWwgcnVuc3RhdGUgY29weSBpbiBvcmRlciB0byBhdm9pZCBzZXR0aW5nIFhFTl9SVU5T
VEFURV9VUERBVEUgaW4KPj4+PiB0aGUgIm9mZmljaWFsIiBydW5zdGF0ZSBpbmZvIG9mIHRoZSB2
Y3B1Lgo+Pj4KPj4+IEJ1dCBpdCBhbHJlYWR5IGRvZXMgLSBmaXJzdCB0aGluZyBpdCBkb2VzIGlz
IGEgbWVtY3B5KCkgZnJvbSB0aGUKPj4+ICJvZmZpY2lhbCIgaW5zdGFuY2UgdG8gYSBjYWxsZXIg
cHJvdmlkZWQgYnVmZmVyLiAoV2hhdCBpcwo+Pj4gY29uZnVzaW5nLCBhdCBsZWFzdCB0byBtZSwg
aXMgdGhhdCB0aGUgbG9jayBnZXRzIGRyb3BwZWQgbGFzdCwKPj4+IHdoZW4gZXZlcnl0aGluZyBh
ZnRlciB0aGUgbWVtY3B5KCkgYWxyZWFkeSBhY3RzIG9uIHRoZSBjb3B5IG9ubHkuKQo+Pgo+PiBP
aCwgdGhhdCB3YXMgbXkgZmF1bHQgaGVyZTogSSBtZWFudCB0byBsZXQgdXBkYXRlX3J1bnN0YXRl
X2FyZWEoKQo+PiBvcGVyYXRlIG9uIGEgbG9jYWwgY29weSwgb2YgY291cnNlLgo+IAo+IEFoLCBJ
IHNlZS4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBieSBzZXR0aW5nIHRoZSBmbGFnIGlu
IHRoZQo+ICJvZmZpY2lhbCIgaW5zdGFuY2UsIGludGVybmFsIGNvbnN1bWVycyBjb3VsZCAoaWYg
dGhleSBjYXJlZCkgYWxzbwo+IGF2b2lkIGFjdGluZyBvbiBpbmNvbnNpc3RlbnQgLyBpbi1mbGln
aHQgZGF0YS4gT3Igd2FzIHRoZSBjdXJyZW50Cj4gc29sdXRpb24gY2hvc2VuIGV4Y2x1c2l2ZWx5
IGJlY2F1c2UgaXQgd2FzIGVhc2llc3QgdG8gc2V0IHRoZSBmbGFnCj4gaW4gdGhlIG1hc3RlciBp
bnN0YW5jZSwgYW5kIHRoZW4gY29weSBmcm9tIHRoZXJlPwoKWWVzLiBUaGUgZmxhZyBpcyBtZWFu
dCBvbmx5IHRvIGJlIG9mIGludGVyZXN0IGZvciB0aGUgZ3Vlc3QgcmVhZGluZwp0aGUgcnVuc3Rh
dGUgYXJlYSBvZiBhbm90aGVyIHZjcHUuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
