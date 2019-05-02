Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAAF117F5
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 13:07:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM9Vw-0006a9-R4; Thu, 02 May 2019 11:04:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vuKL=TC=citrix.com=prvs=018794465=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hM9Vv-0006a4-8l
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 11:04:31 +0000
X-Inumbo-ID: 0a44b7b4-6cca-11e9-bcc3-8b37b22664eb
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a44b7b4-6cca-11e9-bcc3-8b37b22664eb;
 Thu, 02 May 2019 11:04:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89564256"
Date: Thu, 2 May 2019 13:04:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190502110415.uyrfzby2ql4nkfve@Air-de-Roger>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
 <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
 <23753.27461.546649.855744@mariner.uk.xensource.com>
 <20190502094528.m7ir4xkabvndppyn@Air-de-Roger>
 <23754.51580.477282.458295@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23754.51580.477282.458295@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6NDI6MDRBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUm9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBsaW51eCA0LjE5
IHhlbnN0b3JlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgUmU6IFtsaW51eC00LjE5IHRlc3Rd
IDEzNTQyMDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gPiBPbiBXZWQsIE1heSAwMSwgMjAxOSBh
dCAxMDo0Nzo0OUFNICswMTAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ID4gV2hhdCBpZiB5b3Ug
Y2FuJ3Qgd3JpdGUgdG8geGVuc3RvcmUgPyAgQ2FuIHdlIGF0IGxlYXN0IGhhdmUgYSBjb3B5IGlu
Cj4gPiA+IHRoZSBrZXJuZWwgbG9nID8gIFRoZXJlIG1pZ2h0IGJlIG90aGVyIGVycm9ycyBiZXNp
ZGVzIHRoaXMgbWVtb3J5Cj4gPiA+IGV4aGF1c3Rpb24sIHN1cmVseS4KPiA+IAo+ID4gVGhlcmUn
cyBhIGNhbGwgdG8gZGV2X2VyciBhbHNvLCB3aGljaCBzaG91bGQgcHJpbnQgdGhlIHNhbWUgZXJy
b3IKPiA+IHRoYXQncyB3cml0dGVuIHRvIHhlbnN0b3JlIG9uIHRoZSBjb25zb2xlLiBUaGF0IGhv
d2V2ZXIgcmVxdWlyZXMgdGhlCj4gPiBtZW1vcnkgYWxsb2NhdGlvbiBvZiBwYWdlIGluIG9yZGVy
IHRvIGZvcm1hdCB0aGUgc3RyaW5nIHRvIGJlIHByaW50ZWQKPiA+IChzZWUgeGVuYnVzX3ZhX2Rl
dl9lcnJvcikuCj4gCj4gQ2FuIHdlIGFzc3VtZSB0aGF0IG1lbW9yeSBleGhhdXN0aW9uIHdpbGwg
YWx3YXlzIHJlc3VsdCBpbiBzb21lCj4gbWVzc2FnZSBmcm9tIHRoZSBtZW1vcnkgYWxsb2NhdG9y
ID8gIElmIHNvIHRoZW4gdGhpcyBuZXcgbG9nIG1lc3NhZ2UKCkknbSBub3Qgc3VyZSBJIHVuZGVy
c3RhbmQgdG8gd2hhdCBuZXcgbG9nIG1lc3NhZ2UgeW91IGFyZSByZWZlcnJpbmcKdG8uIFRoZSBk
ZXZfZXJyIGNhbGwgaXMgYWxyZWFkeSBwcmVzZW50IGluIHhlbmJ1c192YV9kZXZfZXJyb3IsIHNv
CmV2ZXJ5dGhpbmcgdGhhdCdzIGF0dGVtcHRlZCB0byB3cml0ZSB0byB4ZW5zdG9yZSBzaG91bGQg
YWxzbyBiZQpwcmludGVkIG9uIHRoZSBjb25zb2xlLgoKPiB3b3VsZCBiZSBhIHVzZWZ1bCBhZGRp
dGlvbiBmb3IgY2FzZXMgKm90aGVyKiB0aGFuIGEgY29tcGxldGUgbGFjayBvZgo+IGFueSBhdmFp
bGFibGUgZnJlZSBwYWdlLiAgRWcsIGZvb2xpc2hseSB0cnlpbmcgYSBsYXJnZSBrY2FsbG9jCj4g
YWxsb2NhdGlvbiwgb3Igc29tZSBlcnJvciBub3QgcmVsYXRlZCB0byBsYWNrIG9mIG1lbW9yeSBh
dCBhbGwuCgpJZiB0aGVyZSdzIG5vIHJlYWwgbWVtb3J5IHNob3J0YWdlIGEgZmFpbHVyZSB0byBh
dHRhY2ggYSBmcm9udGVuZApzaG91bGQgcmVzdWx0IGluIGEgbWVzc2FnZSBiZWluZyB3cml0dGVu
IHRvIGJvdGggeGVuc3RvcmUgYW5kIHRoZQpjb25zb2xlIHdpdGggdGhlIGN1cnJlbnQgTGludXgg
Y29kZSBBRkFJQ1QgcHJvdmlkZWQKeGVuYnVzX2Rldl97ZmF0YWwvZXJyb3J9IG9yIHhlbmJ1c19z
d2l0Y2hfZmF0YWwgaXMgdXNlZC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
