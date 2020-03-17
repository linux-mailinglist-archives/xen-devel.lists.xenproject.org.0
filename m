Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FAA188A74
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 17:38:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEFBZ-0001Nq-2Z; Tue, 17 Mar 2020 16:35:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEFBX-0001Nl-9U
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 16:35:19 +0000
X-Inumbo-ID: 4961e68e-686d-11ea-b986-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4961e68e-686d-11ea-b986-12813bfff9fa;
 Tue, 17 Mar 2020 16:35:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27E50AF47;
 Tue, 17 Mar 2020 16:35:17 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1582914997.git.tamas.lengyel@intel.com>
 <4d049987eab1a08607f62d0e3b51768b529e1ff5.1582914998.git.tamas.lengyel@intel.com>
 <03a3d2e4-8ab1-1a83-f4ed-a6a403524f62@suse.com>
 <CABfawhmr9fvRQ4Y_39XUE+iPjU=sG-kznG5ZP5eDAKH4XZ8bVw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f71b1b25-6cb6-3107-8c93-ad1f8f3d6fbb@suse.com>
Date: Tue, 17 Mar 2020 17:35:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmr9fvRQ4Y_39XUE+iPjU=sG-kznG5ZP5eDAKH4XZ8bVw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v11 1/3] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNzoyMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgTWFy
IDE3LCAyMDIwIGF0IDEwOjAyIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6Cj4+IE9uIDI4LjAyLjIwMjAgMTk6NDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IEBA
IC01ODgsNyArNTk0LDggQEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2Zu
KAo+Pj4gICAgICAgICAgICAgIHJldHVybiBwYWdlOwo+Pj4KPj4+ICAgICAgICAgIC8qIEVycm9y
IHBhdGg6IG5vdCBhIHN1aXRhYmxlIEdGTiBhdCBhbGwgKi8KPj4+IC0gICAgICAgIGlmICggIXAy
bV9pc19yYW0oKnQpICYmICFwMm1faXNfcGFnaW5nKCp0KSAmJiAhcDJtX2lzX3BvZCgqdCkgKQo+
Pj4gKyAgICAgICAgaWYgKCAhcDJtX2lzX3JhbSgqdCkgJiYgIXAybV9pc19wYWdpbmcoKnQpICYm
ICFwMm1faXNfcG9kKCp0KSAmJgo+Pj4gKyAgICAgICAgICAgICAhbWVtX3NoYXJpbmdfaXNfZm9y
ayhwMm0tPmRvbWFpbikgKQo+Pj4gICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+Pgo+PiBUaGlz
IGxvb2tzIHByZXR0eSBicm9hZCBhIGNvbmRpdGlvbiwgaS5lLiBhbGwgcG9zc2libGUgdHlwZXMg
d291bGQKPj4gbWFrZSBpdCB0aHJvdWdoIGhlcmUgZm9yIGEgZm9yay4gV291bGRuJ3QgaXQgbWFr
ZSBzZW5zZSB0byBsaW1pdAo+PiB0byB0byBwMm1faXNfaG9sZSgpIHBhZ2UgdHlwZXMsIGxpa2Ug
eW91IGNoZWNrIGZvciBpbgo+PiBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKT8KPiAKPiBObyBuZWVk
IHRvIHB1dCB0aGF0IGNoZWNrIGhlcmUuIEJ5IGFsbG93aW5nIHRvIGdvIGZ1cnRoZXIgd2hlbiB3
ZSBoYXZlCj4gYSBmb3JrZWQgVk0sIHRoaXMgY29kZS1wYXRoIHdpbGwgY2FsbCBnZXRfZ2ZuX3R5
cGVfYWNjZXNzLCB3aGljaCBkb2VzCj4gdGhhdCBjaGVjay4gSXQncyBiZXR0ZXIgdG8gaGF2ZSB0
aGF0IGNoZWNrIGF0IG9uZSBwbGFjZSBpbnN0ZWFkIG9mIGFsbAo+IG92ZXIgdW5uZWNlc3Nhcmls
eS4KCldlbGwsIGlmIHdvcnNlIHBlcmZvcm1hbmNlIChkdWUgdG8gbW9yZSBjYXNlcyB3aGVyZSB0
aGUgbG9jayB3aWxsCmJlIHRha2VuKSBpcyBub3Qgb2YgY29uY2VybiAtIHNvIGJlIGl0LgoKPj4+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAo+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCj4+PiBAQCAtMzksNiArMzksOSBAQCBzdHJ1Y3Qg
bWVtX3NoYXJpbmdfZG9tYWluCj4+Pgo+Pj4gICNkZWZpbmUgbWVtX3NoYXJpbmdfZW5hYmxlZChk
KSAoKGQpLT5hcmNoLmh2bS5tZW1fc2hhcmluZy5lbmFibGVkKQo+Pj4KPj4+ICsjZGVmaW5lIG1l
bV9zaGFyaW5nX2lzX2ZvcmsoZCkgXAo+Pj4gKyAgICAobWVtX3NoYXJpbmdfZW5hYmxlZChkKSAm
JiAhISgoZCktPnBhcmVudCkpCj4+Cj4+IEFnYWluIG5vdCBuZWVkIGZvciAhISAoZm9yIGEgZGlm
ZmVyZW50IHJlYXNvbikuCj4gCj4gV2hpY2ggaXM/CgpGdXJ0aGVyIHVwIHRoZSByZWFzb24gd2Fz
IHRoYXQgeW91IHBhc3MgdGhlIHZhbHVlIGFzIGFyZ3VtZW50CmZvciBhIGJvb2xlYW4gZnVuY3Rp
b24gcGFyYW1ldGVyLiBIZXJlIHRoZSByZWFzb24gaXMgdGhhdCBpcyBhbgpvcGVyYW5kIG9mICYm
LgoKPj4gQWxzbywgZG9lcyB0aGUgYnVpbGQgYnJlYWsgaWYgeW91IG1hZGUgdGhpcyBhbiBpbmxp
bmUgZnVuY3Rpb24KPj4gKGFzIHdlIGdlbmVyYWxseSBwcmVmZXIpPwo+IAo+IEFueSBwYXJ0aWN1
bGFyIHJlYXNvbiBmb3IgdGhhdCAoaW5saW5lIHZzIGRlZmluZSk/CgpJbmxpbmUgZnVuY3Rpb25z
IGFkZCB0eXBlIHNhZmV0eSBmb3IgdGhlIGFyZ3VtZW50cywgd2hpY2gKI2RlZmluZS1zIGRvbid0
IGRvLgoKPj4+IEBAIC01MzIsNiArNTMzLDEwIEBAIHN0cnVjdCB4ZW5fbWVtX3NoYXJpbmdfb3Ag
ewo+Pj4gICAgICAgICAgICAgICAgICB1aW50MzJfdCBncmVmOyAgICAgLyogSU46IGdyZWYgdG8g
ZGVidWcgICAgICAgICAqLwo+Pj4gICAgICAgICAgICAgIH0gdTsKPj4+ICAgICAgICAgIH0gZGVi
dWc7Cj4+PiArICAgICAgICBzdHJ1Y3QgbWVtX3NoYXJpbmdfb3BfZm9yayB7ICAgICAgLyogT1Bf
Rk9SSyAqLwo+Pj4gKyAgICAgICAgICAgIGRvbWlkX3QgcGFyZW50X2RvbWFpbjsgICAgICAgIC8q
IElOOiBwYXJlbnQncyBkb21haW4gaWQgKi8KPj4+ICsgICAgICAgICAgICB1aW50MTZfdCBfcGFk
WzNdOyAgICAgICAgICAgICAvKiBNdXN0IGJlIHNldCB0byAwICovCj4+Cj4+IEVzcGVjaWFsbHkg
aW4gdGhlIHB1YmxpYyBpbnRlcmZhY2UgLSBubyBuZXcgbmFtZSBzcGFjZQo+PiB2aW9sYXRpb25z
IHBsZWFzZS4gSS5lLiBwbGVhc2UgZHJvcCB0aGUgbGVhZGluZyB1bmRlcnNjb3JlLgo+PiBJIGFs
c28gc3RydWdnbGUgdG8gc2VlIHdoeSB0aGlzIGlzIGFuIGFycmF5IG9mIHRocmVlCj4+IGVsZW1l
bnRzLiBJbiBmYWN0IEkgZG9uJ3Qgc2VlIHdoeSB0aGUgcGFkZGluZyBmaWVsZCB3b3VsZCBiZQo+
PiBuZWVkZWQgYXQgYWxsIC0gb25lIG90aGVyIHVuaW9uIG1lbWJlciBvbmx5IGdldHMgcGFkZGVk
IHRvCj4+IGl0cyBhbGlnbm1lbnQgKHdoaWNoIGlzIHdoYXQgSSdkIGV4cGVjdCksIHdoaWxlIG90
aGVycwo+PiAocHJlc3VtYWJseSBvbGRlciBvbmVzKSBkb24ndCBoYXZlIGFueSBwYWRkaW5nIGF0
IGFsbC4gSGVyZQo+PiB0aGVyZSdzIG5vIGltcGxpY2l0IHN0cnVjdHVyZSdzIGFsaWdubWVudCBw
YWRkaW5nIHRoYXQgd2FudHMKPj4gbWFraW5nIGV4cGxpY2l0Lgo+IAo+IEkgZG9uJ3Qga25vdyB3
aGF0IHlvdSBhcmUgYXNraW5nLiBEcm9wIHRoZSBwYWRkaW5nPyBJIHByZWZlciBlYWNoCj4gdW5p
b24gbWVtYmVyIHRvIGJlIHBhZGRlZCB0byA2NC1iaXQsIHJlZHVjZXMgY29nbml0aXZlIGxvYWQg
dHJ5aW5nIHRvCj4gZmlndXJlIG91dCB3aGF0IHRoZSBzaXplIGFuZCBhbGdpbm1lbnQgb2YgZWFj
aCBtZW1iZXIgc3RydWN0IHdvdWxkIGJlLgoKUGVyc29uYWxseSBJJ2Qgc3VnZ2VzdCB0byBkcm9w
IHRoZSBwYWRkaW5nLCBhcyBpdCBhY3R1YWxseQpncm93cyB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0
dXJlLiBCdXQgaWYgeW91IGZlZWwgc3Ryb25nbHkKYWJvdXQga2VlcGluZyBpdCwgdGhlbiBJJ2xs
IGJlIG9rYXkgd2l0aCBqdXN0IHRoZSBmaWVsZCdzCm5hbWUgY2hhbmdlZC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
