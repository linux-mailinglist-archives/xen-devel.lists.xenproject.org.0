Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4997714795
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 11:27:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNZqH-0005LP-PE; Mon, 06 May 2019 09:23:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNZqH-0005LK-1b
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 09:23:25 +0000
X-Inumbo-ID: 92b7cd48-6fe0-11e9-a52b-e71e9bc586a9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92b7cd48-6fe0-11e9-a52b-e71e9bc586a9;
 Mon, 06 May 2019 09:23:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1193CAE28;
 Mon,  6 May 2019 09:23:13 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-46-jgross@suse.com> <5CCFF6F1020000780022C12B@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ac57c420-a72e-7570-db8f-27e4693c2755@suse.com>
Date: Mon, 6 May 2019 11:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCFF6F1020000780022C12B@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 45/45] xen/sched: add scheduling
 granularity enum
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMDUvMjAxOSAxMDo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+PiBAQCAtMTcwMSw2ICsxNzAx
LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKPj4gICAgICAgICAgcHJpbnRrKFhFTkxPR19JTkZPICJQYXJrZWQgJXUgQ1BVc1xuIiwgbnVt
X3BhcmtlZCk7Cj4+ICAgICAgc21wX2NwdXNfZG9uZSgpOwo+PiAgCj4+ICsgICAgc2NoZWR1bGVy
X3NtcF9pbml0KCk7Cj4+ICsKPj4gICAgICBkb19pbml0Y2FsbHMoKTsKPiAKPiBUaGlzIHBsYWNl
bWVudCBhbmQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZnVuY3Rpb24gbWFrZQo+
IG1lIHdvbmRlcjogV2h5IGRpZG4ndCB5b3UgbWFrZSB0aGlzIGFuIGluaXRjYWxsLCB0aHVzIHRh
a2luZyBjYXJlIG9mCj4gQXJtIChhdCBsZWFzdCBpbiBhbiBhYnN0cmFjdCB3YXkpIGF0IHRoZSBz
YW1lIHRpbWU/CgpIbW0sIHRydWUuIFdpbGwgY2hhbmdlLgoKPiAKPj4gIHZvaWQgc2NoZWR1bGVy
X3BlcmNwdV9pbml0KHVuc2lnbmVkIGludCBjcHUpCj4+ICB7Cj4+ICAgICAgc3RydWN0IHNjaGVk
dWxlciAqc2NoZWQgPSBwZXJfY3B1KHNjaGVkdWxlciwgY3B1KTsKPj4gICAgICBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgKnNkID0gcGVyX2NwdShzY2hlZF9yZXMsIGNwdSk7Cj4+ICsgICAgY29uc3Qg
Y3B1bWFza190ICptYXNrOwo+PiArICAgIHVuc2lnbmVkIGludCBtYXN0ZXJfY3B1Owo+PiArICAg
IHNwaW5sb2NrX3QgKmxvY2s7Cj4+ICsgICAgc3RydWN0IHNjaGVkX2l0ZW0gKm9sZF9pdGVtLCAq
bWFzdGVyX2l0ZW07Cj4+ICsKPj4gKyAgICBpZiAoIHN5c3RlbV9zdGF0ZSA9PSBTWVNfU1RBVEVf
cmVzdW1lICkKPj4gKyAgICAgICAgcmV0dXJuOwo+PiArCj4+ICsgICAgc3dpdGNoICggb3B0X3Nj
aGVkX2dyYW51bGFyaXR5ICkKPj4gKyAgICB7Cj4+ICsgICAgY2FzZSBTQ0hFRF9HUkFOX2NwdToK
Pj4gKyAgICAgICAgbWFzayA9IGNwdW1hc2tfb2YoY3B1KTsKPj4gKyAgICAgICAgYnJlYWs7Cj4+
ICsgICAgY2FzZSBTQ0hFRF9HUkFOX2NvcmU6Cj4+ICsgICAgICAgIG1hc2sgPSBwZXJfY3B1KGNw
dV9zaWJsaW5nX21hc2ssIGNwdSk7Cj4+ICsgICAgICAgIGJyZWFrOwo+PiArICAgIGNhc2UgU0NI
RURfR1JBTl9zb2NrZXQ6Cj4+ICsgICAgICAgIG1hc2sgPSBwZXJfY3B1KGNwdV9jb3JlX21hc2ss
IGNwdSk7Cj4+ICsgICAgICAgIGJyZWFrOwo+PiArICAgIGRlZmF1bHQ6Cj4+ICsgICAgICAgIEFT
U0VSVF9VTlJFQUNIQUJMRSgpOwo+PiArICAgICAgICByZXR1cm47Cj4+ICsgICAgfQo+PiAgCj4+
IC0gICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRFX3Jlc3VtZSApCj4+ICsgICAgaWYg
KCBjcHUgPT0gMCB8fCBjcHVtYXNrX3dlaWdodChtYXNrKSA9PSAxICkKPiAKPiBBdCBsZWFzdCBv
dXRzaWRlIG9mIHg4NiBzcGVjaWZpYyBjb2RlIEkgdGhpbmsgd2Ugc2hvdWxkIGF2b2lkCj4gaW50
cm9kdWNpbmcgKGZ1cnRoZXI/KSBhc3N1bXB0aW9ucyB0aGF0IHNlZWluZyBDUFUgMCBvbiBhCj4g
Q1BVIGluaXRpYWxpemF0aW9uIHBhdGggaW1wbGllcyB0aGlzIGJlaW5nIHdoaWxlIGJvb3Rpbmcg
dGhlCj4gc3lzdGVtLiBJIHdvbmRlciBhbnl3YXkgd2hldGhlciB0aGUgcmlnaHQgc2lkZSBvZiB0
aGUgfHwKPiBkb2Vzbid0IHJlbmRlciB0aGUgbGVmdCBzaWRlIHJlZHVuZGFudC4KCk9uIHRoZSBi
b290IGNwdSB0aGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBiZWZvcmUgZS5nLiBjcHVfc2libGluZ19t
YXNrCmlzIGluaXRpYWxpemVkLiBJIGNhbiBoYXZlIGEgdHJ5IHVzaW5nOgoKaWYgKCBjcHVtYXNr
X3dlaWdodChtYXNrKSA8PSAxICkKCj4gCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdCBz
Y2hlZF9jaGVja19ncmFudWxhcml0eSh2b2lkKQo+PiArewo+PiArICAgIHVuc2lnbmVkIGludCBj
cHU7Cj4+ICsgICAgdW5zaWduZWQgaW50IHNpYmxpbmdzLCBncmFuID0gMDsKPj4gKwo+PiArICAg
IGZvcl9lYWNoX29ubGluZV9jcHUoIGNwdSApCj4gCj4gWW91IHdhbnQgdG8gZGVjaWRlIGZvciBv
bmUgb2YgdHdvIHBvc3NpYmxlIHN0eWxlcywgYnV0IG5vdCBhIG1peHR1cmUKPiBvZiBib3RoOgo+
IAo+ICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1ICggY3B1ICkKPiAKPiBvcgo+IAo+ICAgICBmb3Jf
ZWFjaF9vbmxpbmVfY3B1KGNwdSkKClNvcnJ5LCB3aWxsIGNvcnJlY3QuCgo+IAo+IC4gWWV0IHRo
ZW4gSSdtIGEgbGl0dGxlIHB1enpsZWQgYnkgaXRzIHVzZSBoZXJlIGluIHRoZSBmaXJzdCBwbGFj
ZS4KPiBHZW5lcmFsbHkgSSB0aGluayBmb3JfZWFjaF9jcHUoKSB1c2VzIGluIF9faW5pdCBmdW5j
dGlvbnMgYXJlCj4gcHJvYmxlbWF0aWMsIGFzIHRoZXkgdGhlbiByZXF1aXJlIGZ1cnRoZXIgY29k
ZSBlbHNld2hlcmUgdG8KPiBkZWFsIHdpdGggaG90LW9ubGluaW5nLiBBIHByZS1TTVAtaW5pdGNh
bGwgcGx1cyB1c2Ugb2YgQ1BVCj4gbm90aWZpZXJzIGlzIHR5cGljYWxseSBtb3JlIGFwcHJvcHJp
YXRlLgoKQW5kIHRoYXQgd2FzIG1lbnRpb25lZCBpbiB0aGUgY292ZXIgbGV0dGVyOiBjcHUgaG90
cGx1ZyBpcyBub3QgeWV0CmhhbmRsZWQgKGhlbmNlIHRoZSBSRkMgc3RhdHVzIG9mIHRoZSBzZXJp
ZXMpLgoKV2hlbiBjcHUgaG90cGx1ZyBpcyBiZWluZyBhZGRlZCBpdCBtaWdodCBiZSBhcHByb3By
aWF0ZSB0byBzd2l0Y2ggdGhlCnNjaGVtZSBhcyB5b3Ugc3VnZ2VzdGVkLiBSaWdodCBub3cgdGhl
IGN1cnJlbnQgc29sdXRpb24gaXMgbXVjaCBtb3JlCnNpbXBsZS4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
