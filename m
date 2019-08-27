Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257B9EC18
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:11:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2d5e-0004YD-SQ; Tue, 27 Aug 2019 15:08:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2d5d-0004Y8-Vl
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:08:58 +0000
X-Inumbo-ID: 9709c91e-c8dc-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9709c91e-c8dc-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 15:08:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4DEDACC3;
 Tue, 27 Aug 2019 15:08:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3008be8e-a5ee-7e90-6ab0-daf44ee71d44@suse.com>
 <06684b85-6500-6066-d282-97ef4c0d1923@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da32d44d-286b-b80c-f1c0-22ccec9f627a@suse.com>
Date: Tue, 27 Aug 2019 17:08:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <06684b85-6500-6066-d282-97ef4c0d1923@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/6] x86emul: support WBNOINVD
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMjAxOSAxNjo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMS8wNy8yMDE5
IDEyOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2VtdWwt
cHJpdi1vcC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLXByaXYtb3AuYwo+PiBAQCAt
MTEyMSw3ICsxMTIxLDcgQEAgc3RhdGljIGludCB3cml0ZV9tc3IodW5zaWduZWQgaW50IHJlZywg
dQo+PiBAQCAtMTEzMCw2ICsxMTMwLDggQEAgc3RhdGljIGludCBjYWNoZV9vcChlbnVtIHg4NmVt
dWxfY2FjaGVfbwo+PiAgICAgICAgICAgICAqIG5ld2VyIGxpbnV4IHVzZXMgdGhpcyBpbiBzb21l
IHN0YXJ0LW9mLWRheSB0aW1pbmcgbG9vcHMuCj4+ICAgICAgICAgICAgICovCj4+ICAgICAgICAg
ICAgOwo+PiArICAgIGVsc2UgaWYgKCBvcCA9PSB4ODZlbXVsX3dibm9pbnZkICYmIGNwdV9oYXNf
d2Jub2ludmQgKQo+PiArICAgICAgICB3Ym5vaW52ZCgpOwo+PiAgICAgICAgZWxzZQo+PiAgICAg
ICAgICAgIHdiaW52ZCgpOwo+IAo+IFRoZSBjcHVfaGFzX3dibm9pbnZkIGNoZWNrIGlzbid0IG5l
Y2Vzc2FyeS7CoCBUaGUgZW5jb2Rpbmcgd2FzIGNob3Nlbgo+IGJlY2F1c2UgaXQgZG9lcyBnZXQg
aW50ZXJwcmV0ZWQgYXMgd2JpbnZkIG9uIG9sZGVyIHByb2Nlc3NvcnMuCgpJIGFncmVlLCBidXQg
d2FudGVkIHRvIG1ha2UgdGhlIGNvZGUgbG9vayBjb21wbGV0ZSAvIGNvbnNpc3RlbnQuCldvdWxk
IHlvdSBiZSBva2F5IHdpdGggdGhlICYmIC4uLiBiZWluZyByZXRhaW5lZCwgYnV0IGluIGEKY29t
bWVudD8KCj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmgKPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9zeXN0ZW0uaAo+PiBAQCAtMTYsNiArMTYsMTEgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHdiaW52ZCh2b2lkKQo+PiAgICAgICAgYXNtIHZvbGF0aWxlICggIndiaW52ZCIg
Ojo6ICJtZW1vcnkiICk7Cj4+ICAgIH0KPj4gICAgCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgd2Ju
b2ludmQodm9pZCkKPj4gK3sKPj4gKyAgICBhc20gdm9sYXRpbGUgKCAicmVwZTsgd2JpbnZkIiA6
IDogOiAibWVtb3J5IiApOwo+IAo+IFNlbWljb2xvbi4KCkl0IGhhcyB0byBzdGF5LCBhcyBnYXMg
cmVqZWN0cyB1c2Ugb2YgUkVQIG9uIGluc25zIGl0IGRvZXNuJ3QgdGhpbmsKcGVybWl0IHVzZSBv
ZiBSRVAuIEguSi4gYWN0dWFsbHkgcHJvcG9zZXMgZXZlbiBtb3JlIHN0cmljdCAob3Igc2hvdWxk
Ckkgc2F5IGhvc3RpbGUpIGdhcyBiZWhhdmlvciwgd2hpY2ggd291bGQgdGhlbiBhbHNvIHJlamVj
dCB0aGUgYWJvdmUKY29uc3RydWN0OgpodHRwczovL3NvdXJjZXdhcmUub3JnL21sL2JpbnV0aWxz
LzIwMTktMDcvbXNnMDAxODYuaHRtbAoKPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L2NwdWZlYXR1cmVzZXQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYv
Y3B1ZmVhdHVyZXNldC5oCj4+IEBAIC0yNDMsNiArMjQ0LDcgQEAgWEVOX0NQVUZFQVRVUkUoRUZS
TywgICAgICAgICAgNyozMisxMCkgLwo+PiAgICAKPj4gICAgLyogQU1ELWRlZmluZWQgQ1BVIGZl
YXR1cmVzLCBDUFVJRCBsZXZlbCAweDgwMDAwMDA4LmVieCwgd29yZCA4ICovCj4+ICAgIFhFTl9D
UFVGRUFUVVJFKENMWkVSTywgICAgICAgIDgqMzIrIDApIC8qQSAgQ0xaRVJPIGluc3RydWN0aW9u
ICovCj4+ICtYRU5fQ1BVRkVBVFVSRShXQk5PSU5WRCwgICAgICA4KjMyKyA5KSAvKkEgIFdCTk9J
TlZEIGluc3RydWN0aW9uICovCj4gCj4gVGhpcyBpcyBpbXBsaWNpdGx5IGxpbmtlZCB3aXRoIENQ
VUlELjgwMDAwMDFkIHdoaWNoIHdlIGRvbid0IGV4cG9zZSB5ZXQuCgpPbiBBTUQsIGJ1dCBub3Qg
KHNvIGZhciBhdCBsZWFzdCwganVkZ2luZyBmcm9tIHRoZSBTRE0pIG9uIEludGVsLgoKPiBUbyBn
ZXQgdGhlIGVtdWxhdGlvbiBzaWRlIG9mIHRoaW5ncyBzb3J0ZWQsIEknZCBiZSBoYXBweSB3aXRo
IHRoaXMgZ29pbmcKPiBpbiB3aXRob3V0IHRoZSBBIGZvciBub3csIGFuZCAiZXhwb3NpbmcgV0JO
T0lOVkQgdG8gZ3Vlc3RzIiBjYW4gYmUgYQo+IGZvbGxvd3VwIHRhc2suCgpJJ3ZlIGRyb3BwZWQg
dGhlIEEgZm9yIG5vdywgYnV0IGFzIHBlciBhYm92ZSBJJ20gbm90IGVudGlyZWx5CmNlcnRhaW4g
dGhhdCdzIGFwcHJvcHJpYXRlOyBpdCdzIGNlcnRhaW5seSB0aGUgbW9yZSBkZWZlbnNpdmUgc3Rl
cC4KTXkgdW5jZXJ0YWludHkgaXMgYWxzbyBiZWNhdXNlIHBlb3BsZSBhcmUgZnJlZSB0byB1c2Ug
dGhlIFdCTk9JTlZECmVuY29kaW5nIGV2ZW4gd2l0aG91dCB0aGUgZmVhdHVyZSBmbGFnIHNldCwg
YXMgaXQgd29uJ3QgI1VEIChhcyB5b3UKYWxzbyBzdWdnZXN0IGVsc2V3aGVyZSBpbiB5b3VyIHJl
cGx5KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
