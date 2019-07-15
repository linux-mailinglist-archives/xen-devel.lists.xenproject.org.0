Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F069A42
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 19:55:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn59t-00053D-1X; Mon, 15 Jul 2019 17:53:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ns9=VM=infradead.org=amit@srs-us1.protection.inumbo.net>)
 id 1hn59q-000535-CI
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 17:53:02 +0000
X-Inumbo-ID: 62b606ce-a729-11e9-8980-bc764e045a96
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 62b606ce-a729-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 17:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Mime-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJASTyBnEC6LMA8OOnKtTuS4hv/rsSmjzP43EcL4kO0=; b=KANHMLwFP5sNVxwHiLy/5BsdL
 2GCbR8oIJKTWrptJlOmMibTk3q4VbibDj/zpxaNtcYC77aavUnT387/Jps/DReb1Hq8rlMLjRJXg1
 RCLlhpyPthz1matWXeSbMGxpt5uo0i3rkJ9qBvAL/JOa6i22q9N6kqWJYj14K8H/XBRmJ2X44ggv1
 QVERemq7T6sCJdm598fJlM6mkLurh6nW49g45k4PTf4ySTXbuCi6RKtCkHfmtl3/5H1JjrxTL6LHF
 FY42SZ7ANXfn/sEgmQH37MpvjswsaRAyU8li7Yv9kExVn9Ct0DvhtagU5S+nnY+XCHieZaRhrZLJ5
 tutlIBh5g==;
Received: from 72-21-196-64.amazon.com ([72.21.196.64]
 helo=vpn-10-50-67-212.iad2.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hn59j-00054M-6Y; Mon, 15 Jul 2019 17:52:55 +0000
Message-ID: <76439de5430365dda0b83694444e59fa9cfdd3d0.camel@infradead.org>
From: Amit Shah <amit@infradead.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Date: Mon, 15 Jul 2019 19:52:47 +0200
In-Reply-To: <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
 <35d77bc2-8d17-8686-c08e-211973ce49e5@suse.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMDE5LTA3LTE1IGF0IDE0OjUyICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiBP
biAxNS4wNy4yMDE5IDE2OjQyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+ID4gT24gNy8xNS8xOSAz
OjIzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gT24gMTUuMDcuMjAxOSAxNjoxMSwgR2Vv
cmdlIER1bmxhcCB3cm90ZToKPiA+ID4gPiBUaGVyZSB3YXMgYSBsb25nIGRpc2N1c3Npb24gYWJv
dXQgc2VjdXJpdHkgcGF0Y2hlcywgd2l0aCB0aGUKPiA+ID4gPiBnZW5lcmFsCj4gPiA+ID4gcHJv
cG9zYWwgYmVpbmcgdGhhdCB3ZSBzaG91bGQgY3V0IGEgcG9pbnQgcmVsZWFzZSBmb3IgZXZlcnkK
PiA+ID4gPiBzZWN1cml0eSBpc3N1ZS4KPiA+ID4gCj4gPiA+IEludGVyZXN0aW5nLiBMb29rcyBs
aWtlIGluIHBvbGl0aWNzIHRoYXQgdW50aWwgYSBkZWNpc2lvbiBmaXRzCj4gPiA+IHBlb3BsZQo+
ID4gPiB0aGV5IGtlZXAgcmUtcmFpc2luZyB0aGUgcG9pbnQuIElpcmMgb24gYSBwcmlvciBtZWV0
aW5nCj4gPiA+IChCdWRhcGVzdD8pCj4gPiA+IHdlIGhhZCBzZXR0bGVkIG9uIGNvbnRpbnVpbmcg
d2l0aCB0aGUgY3VycmVudCBzY2hlbWUuIFdlcmUgdGhlcmUKPiA+ID4gYW55Cj4gPiA+IG5ldyBh
cmd1bWVudHMgdG93YXJkcyB0aGlzIGFsdGVybmF0aXZlIG1vZGVsPwo+ID4gCj4gPiBXZWxsIEkg
ZG9uJ3Qga25vdyBpZiB0aGVyZSB3ZXJlIGFueSBuZXcgYXJndW1lbnRzIGJlY2F1c2UgSSBkb24n
dAo+ID4gaW1tZWRpYXRlbHkgcmVtZW1iZXIgdGhlIG9sZCBkaXNjdXNzaW9uLiAgRG8gd2UgaGF2
ZSBhIHN1bW1hcnkgb2YKPiA+IHRoZQo+ID4gZGlzY3Vzc2lvbiBpbiBCdWRhcGVzdCwgd2l0aCBp
dHMgY29uY2x1c2lvbnMsIGFueXdoZXJlPwo+IAo+IEkgZG9uJ3QgcmVjYWxsIGlmIHN1aXRhYmxl
IG5vdGVzIHdlcmUgdGFrZW4gYmFjayB0aGVuOyBhcyBpbmRpY2F0ZWQKPiBJJ20gbm90IGV2ZW4g
c3VyZSB3aGljaCBtZWV0aW5nIGl0IHdhcyBhdC4KPiAKPiA+IFRoZSBiYXNpYyBpZGVhIHdhcyB0
aGF0Ogo+ID4gCj4gPiAxLiBNb3N0IGRpc3Ryb3MgLyBwYWNrYWdlcnMgYXJlIGdvaW5nIHRvIHdh
bnQgdG8gZG8gYW4gaW1tZWRpYXRlCj4gPiByZWxlYXNlCj4gPiBhbnl3YXkuCj4gPiAKPiA+IDIu
IERpc3Ryb3MgZ2VuZXJhbGx5IHNlZW1lZCB0byBiZSByZWJhc2luZyBvbiB0b3Agb2Ygc3RhZ2lu
ZyBhcwo+ID4gc29vbiBhcwo+ID4gdGhlIFhTQSB3ZW50IG91dCBhbnl3YXkgKGFuZCBJU1RSIHRo
aXMgYmVpbmcgdGhlIHJlY29tbWVuZWRlZAo+ID4gY291cnNlIG9mCj4gPiBhY3Rpb24pCj4gPiAK
PiA+IFNvIGZvciBhbGwgaW50ZW50cyBhbmQgcHVycG9zZXMsIHdlIGhhdmUgc29tZXRoaW5nIHdo
aWNoIGlzLCBpbgo+ID4gZmFjdCwgYQo+ID4gcmVsZWFzZTsgYWxsIGl0J3MgbWlzc2luZyBpcyBh
IHNpZ25lZCB0YWcgYW5kIGEgdGFyYmFsbC4KPiA+IAo+ID4gT2J2aW91c2x5IHRoZXJlIGFyZSB0
ZXN0aW5nIGltcGxpY2F0aW9ucyB0aGF0IHdvdWxkIG5lZWQgdG8gYmUKPiA+IHNvcnRlZAo+ID4g
b3V0IGJlZm9yZSB0aGlzIGNvdWxkIGJlY29tZSBhIHJlYWxpdHkuCj4gPiAKPiA+IEluIGFueSBj
YXNlLCB0aGUgYmFsbCBpcyBpbiB0aGUgY291cnQgb2YgIlZPTFVOVEVFUiIgdG8gd3JpdGUgdXAg
YQo+ID4gY29uY3JldGUgcHJvcG9zYWwgd2hpY2ggY291bGQgYmUgZGlzY3Vzc2VkLiAgWW91J2xs
IGJlIGFibGUgdG8KPiA+IHJhaXNlIGFsbAo+ID4geW91ciBjb25jZXJucyBhdCB0aGF0IHBvaW50
IGlmIHlvdSB3YW50IChhbHRob3VnaCBoYXZpbmcgYSBza2V0Y2gKPiA+IHdvdWxkCj4gPiBvZiBj
b3Vyc2UgYmUgaGVscGZ1bCBmb3Igd2hvZXZlciBpcyB3cml0aW5nIHN1Y2ggYSBwcm9wb3NhbCku
Cj4gCj4gU3VyZSAtIEkgcmVhbGl6ZWQgc29vbiBhZnRlciBoYXZpbmcgc2VudCB0aGUgaW5pdGlh
bCByZXBseSB0aGF0Cj4gcGVyaGFwcwo+IHRoaXMgd2FzIHRoZSB3cm9uZyBjb250ZXh0IGluIHRo
ZSBmaXJzdCBwbGFjZSB0byByYWlzZSBteSBxdWVzdGlvbi4KCkluIGFueSBjYXNlLCBJJ2QgbGlr
ZSB0byBrbm93IHdoeSBpdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgZm9yIFhlbiB0byBoYXZlCmEgcG9p
bnQgcmVsZWFzZSBmcmVxdWVudGx5LCBhbmQgbm90IGhhdmUgYSBwb2ludCByZWxlYXNlIGFmdGVy
IGFuIFhTQQphYm92ZSBzb21lIHNldmVyaXR5IGxldmVsIChwaWNrIG9uZSAtIGhpZ2gvY3JpdGlj
YWwvaW1wb3J0YW50KS4gIEFzCkdlb3JnZSBtZW50aW9uZWQsIGRpc3Ryb3MgaGF2ZSB0byBkbyBp
dCBhbnl3YXksIGFuZCB0aGUgdXBzdHJlYW0KcHJvamVjdCBub3QgZG9pbmcgaXQgb25seSBtYWtl
cyBpdCBtb3JlIGRpZmZpY3VsdCBmb3IgYWxsIGRpc3Ryb3MKaW52b2x2ZWQuCgpOb3Qgc3VyZSBv
ZiB0aGUgcG9saXRpY3MgaW52b2x2ZWQgdGhvdWdoLCBhbmQgd2hhdCBjYW4gb2Ygd29ybXMgdGhp
cwpvcGVucy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
