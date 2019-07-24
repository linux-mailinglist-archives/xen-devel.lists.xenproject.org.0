Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460F572733
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 07:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hq9Tn-0008MC-Hd; Wed, 24 Jul 2019 05:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hq9Tl-0008M6-DG
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 05:06:17 +0000
X-Inumbo-ID: c1810e90-add0-11e9-8079-d31c1363a97c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1810e90-add0-11e9-8079-d31c1363a97c;
 Wed, 24 Jul 2019 05:06:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00210ACFE;
 Wed, 24 Jul 2019 05:06:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190723182530.24087-1-jgross@suse.com>
 <20190723182530.24087-2-jgross@suse.com>
 <714dad88-baa2-3200-60ff-68b9dd1673cb@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <de4f7529-6723-2274-1951-b38c5b30082a@suse.com>
Date: Wed, 24 Jul 2019 07:06:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <714dad88-baa2-3200-60ff-68b9dd1673cb@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/x86: cleanup unused NMI/MCE code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMjA6NDgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjMvMDcvMjAxOSAx
OToyNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gcHZfcmFpc2VfaW50ZXJydXB0KCkgaXMgb25s
eSBjYWxsZWQgZm9yIE5NSXMgdGhlc2UgZGF5cywgc28gdGhlIE1DRQo+PiBzcGVjaWZpYyBwYXJ0
IGNhbiBiZSByZW1vdmVkLiBSZW5hbWUgcHZfcmFpc2VfaW50ZXJydXB0KCkgdG8KPj4gcHZfcmFp
c2Vfbm1pKCkgYW5kIE5NSV9NQ0VfU09GVElSUSB0byBOTUlfU09GVElSUS4KPiAKPiBGb3IgcG9z
dGVyaXR5LCBpdCB3b3VsZCBiZSBoZWxwZnVsIHRvIGV4cGxpY2l0bHkgaWRlbnRpZnkgMzU1YjA0
NjlhOAo+IHdoaWNoIGludHJvZHVjZWQgTk1JIGFuZCBNQ0UgcGlubmluZyAod2hlcmUgcHJldmlv
dXNseSB0aGVyZSB3YXMgbm8gTk1JCj4gcGlubmluZyBiZWZvcmVoYW5kIEFGQUlDVCksIGFuZCB0
aGVuIDNhOTE3NjlkNmUgd2hpY2ggcmVtb3ZlZCB0aGUgTUNFCj4gcGlubmluZy4KCk9rYXkuCgo+
IAo+IFN0YXRlZCBsaWtlIHRoYXQsIEkgZG91YnQgdGhlIE5NSSBwaW5uaW5nIHdhcyBldmVyIHJl
bGV2YW50IGluIHByYWN0aWNlLgoKSW5kZWVkLgoKPiAKPj4KPj4gQWRkaXRpb25hbGx5IHRoZXJl
IGlzIG5vIG5lZWQgdG8gcGluIHRoZSB2Y3B1IHRoZSBOTUkgaXMgZGVsaXZlcmVkCj4+IHRvLCB0
aGF0IGlzIGEgbGVmdG92ZXIgb2YgKGFscmVhZHkgcmVtb3ZlZCkgTUNFIGhhbmRsaW5nLiBTbyBy
ZW1vdmUKPj4gdGhlIHBpbm5pbmcsIHRvby4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IEV2ZXJ5dGhpbmcgTEdUTS7CoCBBIGZldyB0cml2
aWFsIG5vdGVzLgo+IAo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3RyYXBzLmMgYi94
ZW4vYXJjaC94ODYvcHYvdHJhcHMuYwo+PiBpbmRleCAxNzQwNzg0ZmYyLi45NDM2YzgwMDQ3IDEw
MDY0NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvdHJhcHMuYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvcHYvdHJhcHMuYwo+PiBAQCAtMTM2LDQ3ICsxMzYsMjEgQEAgYm9vbCBzZXRfZ3Vlc3Rfbm1p
X3RyYXBib3VuY2Uodm9pZCkKPj4gICAgICAgcmV0dXJuICFudWxsX3RyYXBfYm91bmNlKGN1cnIs
IHRiKTsKPj4gICB9Cj4+ICAgCj4+IC1zdHJ1Y3Qgc29mdGlycV90cmFwIHsKPj4gLSAgICBzdHJ1
Y3QgZG9tYWluICpkb21haW47ICAgLyogZG9tYWluIHRvIGluamVjdCB0cmFwICovCj4+IC0gICAg
c3RydWN0IHZjcHUgKnZjcHU7ICAgICAgIC8qIHZjcHUgdG8gaW5qZWN0IHRyYXAgKi8KPj4gLSAg
ICB1bnNpZ25lZCBpbnQgcHJvY2Vzc29yOyAgLyogcGh5c2ljYWwgY3B1IHRvIGluamVjdCB0cmFw
ICovCj4+IC19Owo+PiArc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIHNvZnRp
cnFfbm1pX3ZjcHUpOwo+PiAgIAo+PiAtc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzb2Z0
aXJxX3RyYXAsIHNvZnRpcnFfdHJhcCk7Cj4+IC0KPj4gLXN0YXRpYyB2b2lkIG5taV9tY2Vfc29m
dGlycSh2b2lkKQo+PiArc3RhdGljIHZvaWQgbm1pX3NvZnRpcnEodm9pZCkKPj4gICB7Cj4+ICAg
ICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7Cj4+IC0gICAgc3RydWN0
IHNvZnRpcnFfdHJhcCAqc3QgPSAmcGVyX2NwdShzb2Z0aXJxX3RyYXAsIGNwdSk7Cj4+IC0KPj4g
LSAgICBCVUdfT04oc3QtPnZjcHUgPT0gTlVMTCk7Cj4+IC0KPj4gLSAgICAvKgo+PiAtICAgICAq
IFNldCB0aGUgdG1wIHZhbHVlIHVuY29uZGl0aW9uYWxseSwgc28gdGhhdCB0aGUgY2hlY2sgaW4g
dGhlIGlyZXQKPj4gLSAgICAgKiBoeXBlcmNhbGwgd29ya3MuCj4+IC0gICAgICovCj4+IC0gICAg
Y3B1bWFza19jb3B5KHN0LT52Y3B1LT5jcHVfaGFyZF9hZmZpbml0eV90bXAsCj4+IC0gICAgICAg
ICAgICAgICAgIHN0LT52Y3B1LT5jcHVfaGFyZF9hZmZpbml0eSk7Cj4+ICsgICAgc3RydWN0IHZj
cHUgKip2X3B0ciA9ICZwZXJfY3B1KHNvZnRpcnFfbm1pX3ZjcHUsIGNwdSk7Cj4gCj4gVGhlcmUg
aXMgb25seSBhIHNpbmdsZSB1c2Ugb2YgJ2NwdScgaGVyZSwgc28geW91IGNhbiBkcm9wIHRoYXQg
YW5kIHVzZQo+IHRoaXNfY3B1KHNvZnRpcnFfbm1pX3ZjcHUpIGluc3RlYWQuCgpPa2F5LgoKPiAK
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcHYvdHJhcHMuaCBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvcHYvdHJhcHMuaAo+PiBpbmRleCBmY2M3NWY1ZTlhLi40N2Q2Y2Y1ZmM0IDEw
MDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3B2L3RyYXBzLmgKPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wdi90cmFwcy5oCj4+IEBAIC0yNyw4ICsyNyw4IEBACj4+ICAgCj4+
ICAgdm9pZCBwdl90cmFwX2luaXQodm9pZCk7Cj4+ICAgCj4+IC0vKiBEZWxpdmVyIGludGVycnVw
dCB0byBQViBndWVzdC4gUmV0dXJuIDAgb24gc3VjY2Vzcy4gKi8KPj4gLWludCBwdl9yYWlzZV9p
bnRlcnJ1cHQoc3RydWN0IHZjcHUgKnYsIHVpbnQ4X3QgdmVjdG9yKTsKPj4gKy8qIERlbGl2ZXIg
Tk1JIHRvIFBWIGd1ZXN0LiBSZXR1cm4gMCBvbiBzdWNjZXNzLiAqLwo+PiAraW50IHB2X3JhaXNl
X25taShzdHJ1Y3QgdmNwdSAqdik7Cj4+ICAgCj4+ICAgaW50IHB2X2VtdWxhdGVfcHJpdmlsZWdl
ZF9vcChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7Cj4+ICAgdm9pZCBwdl9lbXVsYXRlX2dh
dGVfb3Aoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOwo+PiBAQCAtNDYsOCArNDYsOCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcHZfdHJhcF9jYWxsYmFja19yZWdpc3RlcmVkKGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LAo+PiAgIAo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBwdl90cmFwX2luaXQodm9p
ZCkge30KPj4gICAKPj4gLS8qIERlbGl2ZXIgaW50ZXJydXB0IHRvIFBWIGd1ZXN0LiBSZXR1cm4g
MCBvbiBzdWNjZXNzLiAqLwo+PiAtc3RhdGljIGlubGluZSBpbnQgcHZfcmFpc2VfaW50ZXJydXB0
KHN0cnVjdCB2Y3B1ICp2LCB1aW50OF90IHZlY3RvcikgeyByZXR1cm4gLUVPUE5PVFNVUFA7IH0K
Pj4gKy8qIERlbGl2ZXIgTk1JIHRvIFBWIGd1ZXN0LiBSZXR1cm4gMCBvbiBzdWNjZXNzLiAqLwo+
PiArc3RhdGljIGlubGluZSBpbnQgcHZfcmFpc2Vfbm1pKHN0cnVjdCB2Y3B1ICp2KSB7IHJldHVy
biAtRU9QTk9UU1VQUDsgfQo+IAo+IEkgZG9uJ3QgdGhpbmsgZHVwbGljYXRpbmcgdGhlIGZ1bmN0
aW9uIGRlc2NyaXB0aW9uIGhlcmUgaXMgdXNlZnVsLgo+IEluc3RlYWQsIEknZCByZWNvbW1lbmQg
ZHJvcHBpbmcgdGhlc2UgbGluZXMsIGFuZCBjb21tZW50aW5nIGl0IG9uY2UgaW4KPiBwdi90cmFw
cy5jLsKgIFRoYXQgc2hvdWxkIGluY2x1ZGUgdGhlIGZhY3QgdGhhdCBpdCBpcyBleHBlY3RlZCB0
byBiZSB1c2VkCj4gTk1JIGNvbnRleHQsIHdoaWNoIG1lYW5zIGl0cyBub3Qgc2FmZSB0byB1c2Ug
cHJpbnRrKCkgZXRjIGluIHRoZXJlLgoKV2lsbCBkby4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
