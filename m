Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA3271B8B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 17:25:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpwcs-0005dU-TL; Tue, 23 Jul 2019 15:22:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpwcr-0005dP-FP
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 15:22:49 +0000
X-Inumbo-ID: b984c13b-ad5d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b984c13b-ad5d-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 15:22:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36A5EAFB6;
 Tue, 23 Jul 2019 15:22:46 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
 <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
 <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1ac4a860-4bde-5566-18b8-2e435ee85bb1@suse.com>
Date: Tue, 23 Jul 2019 17:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0da102f5-6f61-4a14-5c07-3ac92f4db68c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTc6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA3LjIwMTkgMTY6
MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDIzLjA3LjE5IDE2OjE0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDIzLjA3LjIwMTkgMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
IE9uIDIzLjA3LjIwMTkgMTU6NDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IE9uIDIzLjA3
LjE5IDE0OjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IHYtPnByb2Nlc3NvciBnZXRzIGxh
dGNoZWQgaW50byBzdC0+cHJvY2Vzc29yIGJlZm9yZSByYWlzaW5nIHRoZSBzb2Z0aXJxLAo+Pj4+
Pj4gYnV0IGNhbid0IHRoZSB2Q1BVIGJlIG1vdmVkIGVsc2V3aGVyZSBieSB0aGUgdGltZSB0aGUg
c29mdGlycSBoYW5kbGVyCj4+Pj4+PiBhY3R1YWxseSBnYWlucyBjb250cm9sPyBJZiB0aGF0J3Mg
bm90IHBvc3NpYmxlIChhbmQgaWYgaXQncyBub3Qgb2J2aW91cwo+Pj4+Pj4gd2h5LCBhbmQgYXMg
eW91IGNhbiBzZWUgaXQncyBub3Qgb2J2aW91cyB0byBtZSksIHRoZW4gSSB0aGluayBhIGNvZGUK
Pj4+Pj4+IGNvbW1lbnQgd2FudHMgdG8gYmUgYWRkZWQgdGhlcmUuCj4+Pj4+Cj4+Pj4+IFlvdSBh
cmUgcmlnaHQsIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIGZvciB0aGUgdmNwdSB0byBtb3ZlIGFyb3Vu
ZC4KPj4+Pj4KPj4+Pj4gT1RPSCBpcyBpdCByZWFsbHkgaW1wb3J0YW50IHRvIHJ1biB0aGUgdGFy
Z2V0IHZjcHUgZXhhY3RseSBvbiB0aGUgY3B1Cj4+Pj4+IGl0IGlzIGV4ZWN1dGluZyAob3IgaGFz
IGxhc3QgZXhlY3V0ZWQpIGF0IHRoZSB0aW1lIHRoZSBOTUkvTUNFIGlzIGJlaW5nCj4+Pj4+IHF1
ZXVlZD8gVGhpcyBpcyBpbiBubyB3YXkgcmVsYXRlZCB0byB0aGUgY3B1IHRoZSBNQ0Ugb3IgTk1J
IGhhcyBiZWVuCj4+Pj4+IGhhcHBlbmluZyBvbi4gSXQgaXMganVzdCBhIHJhbmRvbSBjcHUsIGFu
ZCBzbyBpdCB3b3VsZCBiZSBpZiB3ZSdkIGRvIHRoZQo+Pj4+PiBjcHUgc2VsZWN0aW9uIHdoZW4g
dGhlIHNvZnRpcnEgaGFuZGxlciBpcyBydW5uaW5nLgo+Pj4+Pgo+Pj4+PiBPbmUgcXVlc3Rpb24g
dG8gdW5kZXJzdGFuZCB0aGUgaWRlYSBuZWhpbmQgYWxsIHRoYXQ6IF93aHlfIGlzIHRoZSB2Y3B1
Cj4+Pj4+IHBpbm5lZCB1bnRpbCBpdCBkb2VzIGFuIGlyZXQ/IEkgY291bGQgdW5kZXJzdGFuZCBp
ZiBpdCB3b3VsZCBiZSBwaW5uZWQKPj4+Pj4gdG8gdGhlIGNwdSB3aGVyZSB0aGUgTk1JL01DRSB3
YXMgaGFwcGVuaW5nLCBidXQgdGhpcyBpcyBub3QgdGhlIGNhc2UuCj4+Pj4KPj4+PiBUaGVuIGl0
IHdhcyBuZXZlciBmaW5pc2hlZCBvciBnb3QgYnJva2VuLCBJIHdvdWxkIGd1ZXNzLgo+Pj4KPj4+
IE9oLCBuby4gVGhlICNNQyBzaWRlIHVzZSBoYXMgZ29uZSBhd2F5IGluIDNhOTE3NjlkNmUsIHdp
dGhvdXQgY2xlYW5pbmcKPj4+IHVwIG90aGVyIGNvZGUuIFNvIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0
byBiZSBhbnkgc3VjaCByZXF1aXJlbWVudCBhbnltb3JlLgo+Pgo+PiBTbyBqdXN0IHRvIGJlIHN1
cmU6IHlvdSBhcmUgZmluZSBmb3IgbWUgcmVtb3ZpbmcgdGhlIHBpbm5pbmcgZm9yIE5NSXM/Cj4g
Cj4gTm8sIG5vdCB0aGUgcGlubmluZyBhcyBhIHdob2xlLiBUaGUgZm9yY2VkIENQVTAgYWZmaW5p
dHkgc2hvdWxkIHN0aWxsCj4gcmVtYWluLiBJdCdzIGp1c3QgdGhhdCB0aGVyZSdzIG5vIGNvcnJl
bGF0aW9uIGFueW1vcmUgYmV0d2VlbiB0aGUgQ1BVCj4gYSB2Q1BVIHdhcyBydW5uaW5nIG9uIGFu
ZCB0aGUgQ1BVIGl0IGlzIHRvIGJlIHBpbm5lZCB0byAodGVtcG9yYXJpbHkpLgoKSSBkb24ndCBn
ZXQgaXQuIFRvZGF5IHZjcHUwIG9mIHRoZSBoYXJkd2FyZSBkb21haW4gaXMgcGlubmVkIHRvIHRo
ZSBjcHUKaXQgd2FzIGxhc3QgcnVubmluZyBvbiB3aGVuIHRoZSBOTUkgaGFwcGVuZWQuIFdoeSBp
cyB0aGF0IGltcG9ydGFudD8KT3IgZG8geW91IHdhbnQgdG8gY2hhbmdlIHRoZSBsb2dpYyBhbmQg
cGluIHZjcHUwIGZvciBOTUkgaGFuZGxpbmcgYWx3YXlzCnRvIENQVTA/Cgo+IFdoYXQgY2FuIGdv
IGF3YXkgaWYgdGhlICNNQyBwYXJ0IG9mIHRoZSBsb2dpYy4KCk9rYXkuCgoKSnVlcmdlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
