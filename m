Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC9D27826
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 10:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTjD4-0003JM-Jj; Thu, 23 May 2019 08:36:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTjD2-0003JE-JN
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:36:20 +0000
X-Inumbo-ID: d40466b4-7d35-11e9-8a19-abfd0ff5e430
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d40466b4-7d35-11e9-8a19-abfd0ff5e430;
 Thu, 23 May 2019 08:36:16 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 02:36:15 -0600
Message-Id: <5CE65B7D02000078002319AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 02:36:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE927002000078002300BA@prv1-mh.provo.novell.com>
 <20190520140449.5ihqctltaeiegqiz@Air-de-Roger>
 <5CE2C72D0200007800230AD1@prv1-mh.provo.novell.com>
 <20190522164214.mptkeyojhulxbjww@Air-de-Roger>
In-Reply-To: <20190522164214.mptkeyojhulxbjww@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 13/15] x86/IRQ: tighten vector checks
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDE4OjQyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDIwLCAyMDE5IGF0IDA5OjI2OjM3QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjAuMDUuMTkgYXQgMTY6MDQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTI6MzJBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+IEBAIC00NTIsMTUgKzQ1MiwxOCBAQCBzdGF0aWMgdm1hc2tf
dCAqaXJxX2dldF91c2VkX3ZlY3Rvcl9tYXNrCj4+ID4+ICAgICAgICAgICAgICBpbnQgdmVjdG9y
Owo+PiA+PiAgICAgICAgICAgICAgCj4+ID4+ICAgICAgICAgICAgICB2ZWN0b3IgPSBpcnFfdG9f
dmVjdG9yKGlycSk7Cj4+ID4+IC0gICAgICAgICAgICBpZiAoIHZlY3RvciA+IDAgKQo+PiA+PiAr
ICAgICAgICAgICAgaWYgKCB2YWxpZF9pcnFfdmVjdG9yKHZlY3RvcikgKQo+PiA+PiAgICAgICAg
ICAgICAgewo+PiA+PiAtICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfSU5GTyAiSVJRICVk
IGFscmVhZHkgYXNzaWduZWQgdmVjdG9yICVkXG4iLAo+PiA+PiArICAgICAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfSU5GTyAiSVJRJWQgYWxyZWFkeSBhc3NpZ25lZCB2ZWN0b3IgJTAyeFxuIiwK
Pj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgaXJxLCB2ZWN0b3IpOwo+PiA+PiAgICAgICAg
ICAgICAgICAgIAo+PiA+PiAgICAgICAgICAgICAgICAgIEFTU0VSVCghdGVzdF9iaXQodmVjdG9y
LCByZXQpKTsKPj4gPj4gIAo+PiA+PiAgICAgICAgICAgICAgICAgIHNldF9iaXQodmVjdG9yLCBy
ZXQpOwo+PiA+PiAgICAgICAgICAgICAgfQo+PiA+PiArICAgICAgICAgICAgZWxzZSBpZiAoIHZl
Y3RvciAhPSBJUlFfVkVDVE9SX1VOQVNTSUdORUQgKQo+PiA+PiArICAgICAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfV0FSTklORyAiSVJRJWQgbWFwcGVkIHRvIGJvZ3VzIHZlY3RvciAlMDJ4XG4i
LAo+PiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpcnEsIHZlY3Rvcik7Cj4+ID4gCj4+ID4g
TWF5YmUgYWRkIGFuIGFzc2VydF91bnJlYWNoYWJsZSBoZXJlPyBJdCBzZWVtcyByZWFsbHkgYm9n
dXMgdG8gY2FsbAo+PiA+IGlycV9nZXRfdXNlZF92ZWN0b3JfbWFzayB3aXRoIGFuIHVuYXNzaWdu
ZWQgdmVjdG9yLgo+PiAKPj4gSG93IHRoYXQ/IFRoaXMgd291bGQgZS5nLiBnZXQgY2FsbGVkIHRo
ZSB2ZXJ5IGZpcnN0IHRpbWUgYSB2ZWN0b3IKPj4gaXMgdG8gYmUgYXNzaWduZWQuIEJ1dCBJJ20g
YWZyYWlkIEknbSBhIGxpdHRsZSBjb25mdXNlZCBhbnl3YXkgYnkKPj4gdGhlIHdvcmRpbmcgeW91
IHVzZSAtIGFmdGVyIGFsbCB0aGlzIGlzIHRoZSBjb2RlIHBhdGggZGVhbGluZyB3aXRoCj4+IGFu
IElSUSBfbm90XyBiZWluZyBtYXJrZWQgYXMgaGF2aW5nIG5vIHZlY3RvciBhc3NpZ25lZCwgYnV0
Cj4+IGFsc28gbm90IGhhdmluZyBhIHZhbGlkIHZlY3Rvci4KPiAKPiBUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9uLCBieSB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gSSBhc3N1bWVkIGl0Cj4g
bXVzdCBiZSBjYWxsZWQgd2l0aCBhbiBpcnEgdGhhdCBoYXMgYSB2ZWN0b3IgYXNzaWduZWQsIGlm
IHRoYXQncyBub3QKPiB0aGUgY2FzZSB0aGVuIEkgdGhpbmsgaXQncyBmaW5lLgo+IAo+IFJvZ2Vy
LgoKV2VsbCwgdGhlIG5hbWVzIG1lYW5zICJnZXQgdGhlIG9iamVjdCB3aGVyZSB1c2VkIHZlY3Rv
cnMgYXJlIHRvCmJlIHRyYWNrZWQgZm9yIHRoaXMgSVJRIiwgd2hpY2ggaGFzIG5vIGltcGxpY2F0
aW9uIG9uIHdoZXRoZXIgYQp2ZWN0b3Igd2FzIGFscmVhZHkgYXNzaWduZWQuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
