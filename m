Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54F29B02
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 17:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUC4m-0000w6-8g; Fri, 24 May 2019 15:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hUC4k-0000w1-Vz
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:25:43 +0000
X-Inumbo-ID: 2fbc6580-7e38-11e9-9514-7f2edb7d05e1
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2fbc6580-7e38-11e9-9514-7f2edb7d05e1;
 Fri, 24 May 2019 15:25:40 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 09:25:39 -0600
Message-Id: <5CE80CEE020000780023217D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 09:25:34 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558704586-829-1-git-send-email-andrew.cooper3@citrix.com>
 <5CE7FD6B0200007800232126@prv1-mh.provo.novell.com>
 <a06368e0-912f-6db9-09d9-171243965c82@citrix.com>
In-Reply-To: <a06368e0-912f-6db9-09d9-171243965c82@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: Skip building on older
 versions of GCC
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMjAxOSAxNToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI0
LjA1LjE5IGF0IDE1OjI5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAt
LS0gYS90b29scy90ZXN0cy9jcHUtcG9saWN5L01ha2VmaWxlCj4+PiArKysgYi90b29scy90ZXN0
cy9jcHUtcG9saWN5L01ha2VmaWxlCj4+PiBAQCAtMSw4ICsxLDIwIEBACj4+PiAgWEVOX1JPT1Qg
PSAkKENVUkRJUikvLi4vLi4vLi4KPj4+ICBpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVz
Lm1rCj4+PiAgCj4+PiArVEFSR0VULXkgOj0gdGVzdC1jcHUtcG9saWN5Cj4+PiArCj4+PiArIyBG
b3IgYnJldml0eSwgdGhlc2UgdGVzdHMgbWFrZSBleHRlbnNpdmUgdXNlIG9mIGRlc2lnbmF0ZWQg
aW5pdGlhbGlzZXJzLCBidXQKPj4+ICsjIEdDQ3Mgb2xkZXIgdGhhbiA0LjYgY2FuJ3QgY29wZS4g
IElnbm9yZSB0aGUgdGVzdCBpbiB0aGlzIGNhc2UuCj4+IERlc2lnbmF0ZWQgaW5pdGlhbGl6ZXJz
IGFsb25lIGFyZSBubyBwcm9ibGVtIGZvciBvbGQgZ2NjLiBUaGUgaXNzdWUgaXMKPj4gd2l0aCBv
bmVzIHVzZWQgZm9yIHN1Yi1zdHJ1Y3R1cmVzLy11bmlvbnMgd2l0aG91dCBmaWVsZCBuYW1lLgo+
PiBQZXJoYXBzIHdvcnRoIHNsaWdodGx5IGV4dGVuZGluZyB0aGUgY29tbWVudCB0byB0aGlzIGVm
ZmVjdD8KPiAKPiAiIGluIGFub255bW91cyB1bmlvbnMiID8gIEkgY2FuIG5ldmVyIHJlbWVtYmVy
IGV4YWN0bHkgd2hpY2ggYml0IGl0Cj4gY2hva2VzIG9uLCBidXQgSSB0aGluayB0aGVyZSBhcmUg
dHdvIGRpZmZlcmVudCBvbmVzIGluIHByYWN0aWNlIHdoaWNoCj4gaW50ZXJmZXJlLgoKIiBpbiBh
bm9ueW1vdXMgdW5pb25zIiBpcyBmaW5lIHdpdGggbWUuCgo+Pj4gLS0tIGEvdG9vbHMvdGVzdHMv
eDg2X2VtdWxhdG9yL01ha2VmaWxlCj4+PiArKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3Iv
TWFrZWZpbGUKPj4+IEBAIC05Nyw3ICs5Nyw3IEBAICQoZm9yZWFjaCBmbGF2b3IsJChTSU1EKSAk
KEZNQSksJChldmFsICQoY2FsbCBzaW1kLWNoZWNrLWNjLCQoZmxhdm9yKSkpKQo+Pj4gIFRBUkdF
VC0kKHNoZWxsIGVjaG8gJ2FzbSgie2V2ZXh9IHZ6ZXJvYWxsIik7JyB8ICQoQ0MpIC14IGMgLWMg
LW8gL2Rldi9udWxsID4gLSB8fCBlY2hvIHkpIDo9Cj4+PiAgCj4+PiAgaWZlcSAoJChUQVJHRVQt
eSksKQo+Pj4gLSQod2FybmluZyBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29t
cGlsZXIgdGhhbiAiJChDQykiKQo+Pj4gKyQod2FybmluZyBUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0
LCB1c2UgbmV3ZXIgY29tcGlsZXIgdGhhbiAkKENDKSAkKHNoZWxsICQoQ0MpIC1kdW1wdmVyc2lv
bikgYW5kIGFuICJ7ZXZleH0iIGNhcGFibGUgYXNzZW1ibGVyKQo+Pj4gIGVuZGlmCj4+IEkgYXBw
cmVjaWF0ZSB0aGUgaWRlYSBvZiBwcm92aWRpbmcgbW9kZSBpbmZvcm1hdGlvbiwgYnV0IEknbSBh
ZnJhaWQKPj4gdGhpcyBpcyBnb2luZyB0byBiZSBjbHVtc3kgaW4gdGhlIG90aGVyIGRpcmVjdGlv
biBub3c6Cj4+Cj4+ICJUZXN0IGhhcm5lc3Mgbm90IGJ1aWx0LCB1c2UgbmV3ZXIgY29tcGlsZXIg
dGhhbiBnY2MtNC44IDQuOCBhbmQgLi4uIgo+Pgo+PiBOYW1pbmcgdGhlIGNvbXBpbGVyIGJpbmFy
eSwgSSB0aG91Z2h0LCBhbGxvd3MgdGhlIHVzZXIgdG8gZmlndXJlCj4+IG91dCB0aGUgdmVyc2lv
biBlYXNpbHkgZW5vdWdoLiBUaGVyZWZvcmUsIHBsZWFzZSBjb25zaWRlcgo+PiBkcm9wcGluZyB0
aGF0IHBhcnQgYWdhaW4uCj4gCj4gSSdtIGFmcmFpZCB5b3UgaGF2ZSBhIHNlbGVjdGlvbiBiaWFz
IGhlcmUuICBZb3VyIGNvbXBpbGVyIGJpbmFyaWVzIG1heQo+IGhhdmUgYSB2ZXJzaW9uIHN1ZmZp
eCwgYnV0IHRoZSBvdmVyd2hlbG1pbmcgbWFqb3JpdHkgb2YgcGVvcGxlIHdobyBhcmUKPiBnb2lu
ZyB0byBoaXQgdGhhdCBlcnJvciBhbmQgbmVlZCB0byBmaWd1cmUgb3V0IHdoYXQgdG8gZG8gd2ls
bCBiZSB1c2luZwo+IHRoZWlyIHN5c3RlbS1wcm92aWRlZCBiaW5hcmllcywgYXMgcGVyIHRoZSBj
b21taXQgbWVzc2FnZS4KCldlbGwsIEkgY2FuIG9ubHkganVkZ2UgYnkgd2hhdCB0aGUgZGlzdHJv
IGRvZXMgdGhhdCBJIHVzZTsgSSB3YXNuJ3QKYXdhcmUgdGhleSBkbyBzb21ldGhpbmcgbm9uLXN0
YW5kYXJkLiBJJ3ZlIGFscmVhZHkgYXZvaWRlZAptZW50aW9uaW5nIG15IG93biBjb21waWxlciBu
YW1pbmcgc2NoZW1lLgoKPiBXaGF0IGFib3V0Ogo+IAo+ICAgLi4uIHRoYW4gIiQoQ0MpIiAodmVy
c2lvbiAkKHNoZWxsICQoQ0MpIC1kdW1wdmVyc2lvbikpIGFuZCAuLi4KPiAKPiB3aGljaCBzaG91
bGQgKGluIHlvdXIgZXhhbXBsZSkgcmVuZGVyIGFzOgo+IAo+ICAgLi4uIHRoYW4gImdjYy00Ljgi
ICh2ZXJzaW9uIDQuOCkgYW5kIC4uLgo+IAo+ID8KCkJldHRlciwgc28gbGV0J3MgZ28gd2l0aCB0
aGlzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
