Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290955175
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 16:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfmHS-0000dG-9j; Tue, 25 Jun 2019 14:18:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfmHR-0000dB-7g
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 14:18:41 +0000
X-Inumbo-ID: 20cde19b-9754-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20cde19b-9754-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 14:18:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 08:18:39 -0600
Message-Id: <5D122D3B020000780023AFBA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 08:18:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
 <20190619150631.5dhiozx4bybqjbrl@MacBook-Air-de-Roger.local>
 <5D0C7A650200007800239F04@prv1-mh.provo.novell.com>
 <20190624112402.thhrmu7tynfnjujw@tomti.i.net-space.pl>
 <20190625081034.n7bvsd4zdcdqsfua@MacBook-Air-de-Roger.local>
 <5D11E6D6020000780023ADDF@prv1-mh.provo.novell.com>
 <20190625110849.lo7zxh3p5ico4rdd@MacBook-Air-de-Roger.local>
 <20190625124813.hnvxyvbvjfzdbfib@MacBook-Air-de-Roger.local>
In-Reply-To: <20190625124813.hnvxyvbvjfzdbfib@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
 Daniel Kiper <daniel.kiper@oracle.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE0OjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDAxOjA4OjQ5UE0gKzAyMDAsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4+IFNvcnJ5IGZvciBub3QgYmVpbmcgY2xlYXIuIEJ5IHJlbW92ZSBJIG1lYW4g
YGdpdCBybQo+PiB4ZW4vYXJjaC94ODYvZWZpL3JlbG9jcy1kdW1teS5TYCBhbmQgZml4IHRoZSBi
dWlsZCwgbGlrZSB0aGUgZGlmZgo+PiBhcHBlbmRlZCBiZWxvdy4KPiAKPiBUaGUgY2h1bmsgYmVs
b3cgd2lsbCBub3Qgd29yayBiZWNhdXNlIHJlbG9jcy1kdW1teSBpcyBhbHNvIG5lZWRlZAo+IGJ5
IHRoZSBFRkkgYnVpbGQuIEknbSBob3dldmVyIGxvc3QgYXQgd2h5IHRoaXMgaXMgcmVxdWlyZWQs
IGFuZCB0aGUKPiBjb21taXQgbWVzc2FnZSB0aGF0IGludHJvZHVjZWQgdGhlIGZpbGUgKGJmNjUw
MWE2MmUpIGRvZXNuJ3QgYWRkIGFueQo+IHJlYXNvbmluZy4KPiAKPiBJcyBtYXliZSAucmVsb2Mg
bWFuZGF0b3J5IGZvciBQRSBmb3JtYXQ/CgpZZXMsIGFsbW9zdC4gWW91IF9jYW5fIGhhdmUgb25l
IHdpdGhvdXQgLnJlbG9jLCBidXQgdGhlbiB5b3UncmUgdGllZAp0byBpdCBsb2FkaW5nIGF0IHRo
ZSBsaW5rZWQgYWRkcmVzcy4gVGhhdCdzIGZpbmUgd2l0aCBhbiBvcmRpbmFyeSBib290CmxvYWRl
ciwgYnV0IGl0J3Mgbm90IGFuIG9wdGlvbiB3aGVuIHRoaXMgaXMgdG8gZ2V0IGxvYWRlZCBqdXN0
IGxpa2UgYQpub3JtYWwgYmluYXJ5LCB3aXRob3V0IGtub3dpbmcgYXQgd2hpY2ggYWRkcmVzcyBp
dCdsbCBiZSBwbGFjZWQuClJlbWVtYmVyIHRoYXQgdGhlIEVGSSBib290IGVudmlyb25tZW50IHJ1
bnMgaW4gKHBzZXVkbylwaHlzaWNhbAptb2RlLCBpLmUuIHRoZXJlJ3MgYSAxOjEgbWFwcGluZyBi
ZXR3ZWVuIGxpbmVhciBhbmQgcGh5c2ljYWwKYWRkcmVzc2VzLiBUaGVyZWZvcmUgdGhlcmUncyBu
byB3YXkgdG8gcHJlZGljdCBhIG1lbW9yeSByYW5nZQp0aGF0J3MgYWx3YXlzIGdvaW5nIHRvIGJl
IGF2YWlsYWJsZSAoYW5kIHRoYXQgaGVuY2UgeGVuLmVmaSBjb3VsZCBiZQpsaW5rZWQgdG8gbG9h
ZCBhdCkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
