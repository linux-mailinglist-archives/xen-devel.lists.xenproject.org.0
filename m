Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD488AFB77
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 13:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i80u4-0006qk-Iu; Wed, 11 Sep 2019 11:35:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i80u2-0006qc-IR
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 11:35:14 +0000
X-Inumbo-ID: 376e0468-d488-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 376e0468-d488-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 11:35:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 955E4B0BA;
 Wed, 11 Sep 2019 11:35:11 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
 <20190911062001.25931-5-jgross@suse.com>
 <97a771af-32a3-596d-30e2-7042374d14e3@suse.com>
 <4ffa80f0-5d63-9d84-9030-9c5eaecc1541@suse.com>
 <a00f9b2a-1a2d-145f-daaf-6cd8cc4d3f25@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <21bad2b6-8487-a59c-71b3-aedf475e5170@suse.com>
Date: Wed, 11 Sep 2019 13:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a00f9b2a-1a2d-145f-daaf-6cd8cc4d3f25@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 4/5] tools: add xenfs tool
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTI6MDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjA5LjIwMTkgMTE6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDExLjA5LjE5IDExOjMwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjA5LjIwMTkgMDg6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEvdG9vbHMvbWlzYy9NYWtlZmlsZQo+Pj4+ICsrKyBiL3Rvb2xzL21pc2MvTWFrZWZp
bGUKPj4+PiBAQCAtMjQsNiArMjQsNyBAQCBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAg
Kz0geGVuLWxvd21lbWQKPj4+PiAgICBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0g
eGVuLW1mbmR1bXAKPj4+PiAgICBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVu
LXVjb2RlCj4+Pj4gICAgSU5TVEFMTF9TQklOICAgICAgICAgICAgICAgICAgICs9IHhlbmNvdgo+
Pj4+ICtJTlNUQUxMX1NCSU4gICAgICAgICAgICAgICAgICAgKz0geGVuZnMKPj4+Cj4+PiBXaHkg
U0JJTj8gSXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcgd2l0aCBhbGxvd2luZyB1bnByaXZpbGVnZWQK
Pj4+IHVzZXJzIHIvbyBhY2Nlc3M/IE9yIGlzIHRoaXMgYmVjYXVzZSBpbiBvcmRlciB0byBhY2Nl
c3MgdGhlCj4+PiBoeXBlcmNhbGwgaW50ZXJmYWNlIG9uZSBuZWVkcyB0byBiZSByb290PyBJZiBz
bywgd2UgbWF5IHdhbnQKPj4+IHRvIGNvbnNpZGVyIHJlbGF4aW5nL2F2b2lkaW5nL2J5cGFzc2lu
ZyB0aGlzIGluIHNvbWUgc2Vuc2libGUKPj4+IHdheS4KPj4KPj4gSW5zdGFsbGluZyB0byBiaW4g
aXMgZmluZSB3aXRoIG1lLCBidXQgcmVsYXhpbmcgdGhlIHJvb3QgcmVzdHJpY3Rpb24KPj4gbWln
aHQgYmUgbW9yZSBkaWZmaWN1bHQgYW5kL29yIHF1ZXN0aW9uYWJsZS4KPj4KPj4gSSB3YXMgdGhp
bmtpbmcgb2YgIm1vdW50aW5nIiB0aGUgeGVuLXN5c2ZzIHRvIGVpdGhlciBYZW5zdG9yZSBvcgo+
PiB0aGUga2VybmVsJ3Mgc3lzZnMgKHByb2JhYmx5IHRoZSBsYXR0ZXIsIGFzIFhlbnN0b3JlIGlu
IGEgc3R1YmRvbQo+PiB3b3VsZCBuZWVkIHRvIGVuYWJsZSBhY2Nlc3MgdG8geGVuLXN5c2ZzIGZv
ciB0aGF0IHN0dWJkb20gLHRvbykuCj4+Cj4+IFRoaXMgd291bGQgdGhlbiBlbmFibGUgYWNjZXNz
aW5nIHNvbWUgb3IgYWxsIGVudHJpZXMgZnJvbSBub24tcm9vdC4KPiAKPiBSaWdodCwgZ29pbmcg
dGhyb3VnaCB0aGUga2VybmVsJ3Mgc3lzZnMgaXMgd2hhdCBJIHRvbyB3YXMKPiBjb25zaWRlcmlu
ZyAoSSBkb24ndCB0aGluayB4ZW5zdG9yZSBpcyBhcHByb3ByaWF0ZSBmb3IgdGhpcykuCj4gVGhl
IG1haW4gaXNzdWUgSSdkIHNlZSB3aXRoIHRoaXMgaXMgdGhlIHNwbGl0IGJyYWluIHBlcm1pc3Np
b25zCj4gaGFuZGxpbmcuIEknZCBwcmVmZXIgZm9yIHRoZXJlIHRvIGJlIGp1c3Qgb25lIHBhcnR5
IGRldGVybWluaW5nCj4gd2hvIGlzIGFsbG93ZWQgdG8gc2VlIHdoYXQsIGJ1dCBldmVuIGlmIHRo
ZSBoeXBlcnZpc29yIHRvbGQgdGhlCj4ga2VybmVsLCB0aGVyZSB3b3VsZCBzdGlsbCBiZSBhIGRl
cGVuZGVuY3kgdXBvbiB0aGUga2VybmVsIGFsc28KPiByZXNwZWN0aW5nIHRoZSByZXF1ZXN0LiBX
aGlsZSBub3QgbXVjaCBvZiBhIHByb2JsZW0gYXMgbG9uZyBhcwo+IGFsbCBvZiB0aGlzIGlzIERv
bTAtb25seSwgd2l0aCBEb21VLXMgaW4gbWluZCB0aGlzIHdvdWxkIG5lZWQKPiB0YWtpbmcgY2Fy
ZSBvZi4KCkhtbSwgd2h5PyBJIHRoaW5rIHdlIGFncmVlIHRoYXQgRG9tVXMgc2hvdWxkIGdldCBh
Y2Nlc3Mgb25seSB0byBlaXRoZXIKZ2xvYmFsIGRhdGEgKHJlYWQtb25seSkgd2hpY2ggZG9lc24n
dCBkbyBhbnkgaGFybSwgb3IgdG8gZGF0YSByZWxhdGVkCm9ubHkgdG8gdGhlbSAoc28gcGVyLWRv
bWFpbiBkYXRhKS4gTWF5YmUgZHJpdmVyLWRvbWFpbnMgb3IgZGV2aWNlIG1vZGVsCnN0dWJkb21z
IHdvdWxkIG5lZWQgYWNjZXNzIHRvIGRhdGEgcmVsYXRlZCB0byB0aGUgZG9tYWlucyB0aGV5IGFy
ZQpzZXJ2aW5nLgoKV2hldGhlciBhIGRvbVUgbGV0cyBhIHVzZXIgYWNjZXNzIHRoYXQgZGF0YSBv
ciBub3Qgc2hvdWxkIG9ubHkgYmUKZGVjaWRlZCBieSB0aGUgZG9tVSAoYXBwbGllcyB0byBkb20w
LCB0b28pLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
