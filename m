Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA51531E0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:31:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKiU-0006ag-4j; Wed, 05 Feb 2020 13:27:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKiS-0006ab-Vx
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:27:41 +0000
X-Inumbo-ID: 480a0d74-481b-11ea-90f9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 480a0d74-481b-11ea-90f9-12813bfff9fa;
 Wed, 05 Feb 2020 13:27:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52C08AC84;
 Wed,  5 Feb 2020 13:27:39 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <775b8691-068d-2af9-1b59-d66233708595@suse.com>
Date: Wed, 5 Feb 2020 14:27:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200205132144.GS4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxNDoyMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAwNSwgMjAyMCBhdCAwOTo0NjoyNUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMDIuMjAyMCAxODozNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gSW1wb3J0IHRoZSBm
dW5jdGlvbnMgYW5kIGl0J3MgZGVwZW5kZW5jaWVzLiBCYXNlZCBvbiBMaW51eCA1LjUsIGNvbW1p
dAo+Pj4gaWQgZDUyMjZmYTZkYmFlMDU2OWVlNDNlY2ZjMDhiZGNkNjc3MGZjNDc1NS4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Pj4KPj4gVGhhbmtzIGZvciBnb2luZyB0aGlzIHJvdXRlOyB0d28gcmVtYXJrcyAvIHJlcXVlc3Rz
Ogo+Pgo+Pj4gLS0tIGEveGVuL2NvbW1vbi9iaXRtYXAuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9i
aXRtYXAuYwo+Pj4gQEAgLTIxMiw2ICsyMTIsNDcgQEAgaW50IF9fYml0bWFwX3dlaWdodChjb25z
dCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIGludCBiaXRzKQo+Pj4gICNlbmRpZgo+Pj4gIEVYUE9S
VF9TWU1CT0woX19iaXRtYXBfd2VpZ2h0KTsKPj4+ICAKPj4+ICt2b2lkIF9fYml0bWFwX3NldCh1
bnNpZ25lZCBsb25nICptYXAsIHVuc2lnbmVkIGludCBzdGFydCwgaW50IGxlbikKPj4+ICt7Cj4+
PiArCXVuc2lnbmVkIGxvbmcgKnAgPSBtYXAgKyBCSVRfV09SRChzdGFydCk7Cj4+PiArCWNvbnN0
IHVuc2lnbmVkIGludCBzaXplID0gc3RhcnQgKyBsZW47Cj4+PiArCWludCBiaXRzX3RvX3NldCA9
IEJJVFNfUEVSX0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BFUl9MT05HKTsKPj4+ICsJdW5zaWduZWQg
bG9uZyBtYXNrX3RvX3NldCA9IEJJVE1BUF9GSVJTVF9XT1JEX01BU0soc3RhcnQpOwo+Pj4gKwo+
Pj4gKwl3aGlsZSAobGVuIC0gYml0c190b19zZXQgPj0gMCkgewo+Pj4gKwkJKnAgfD0gbWFza190
b19zZXQ7Cj4+PiArCQlsZW4gLT0gYml0c190b19zZXQ7Cj4+PiArCQliaXRzX3RvX3NldCA9IEJJ
VFNfUEVSX0xPTkc7Cj4+PiArCQltYXNrX3RvX3NldCA9IH4wVUw7Cj4+PiArCQlwKys7Cj4+PiAr
CX0KPj4+ICsJaWYgKGxlbikgewo+Pj4gKwkJbWFza190b19zZXQgJj0gQklUTUFQX0xBU1RfV09S
RF9NQVNLKHNpemUpOwo+Pj4gKwkJKnAgfD0gbWFza190b19zZXQ7Cj4+PiArCX0KPj4+ICt9Cj4+
PiArRVhQT1JUX1NZTUJPTChfX2JpdG1hcF9zZXQpOwo+Pj4gKwo+Pj4gK3ZvaWQgX19iaXRtYXBf
Y2xlYXIodW5zaWduZWQgbG9uZyAqbWFwLCB1bnNpZ25lZCBpbnQgc3RhcnQsIGludCBsZW4pCj4+
PiArewo+Pj4gKwl1bnNpZ25lZCBsb25nICpwID0gbWFwICsgQklUX1dPUkQoc3RhcnQpOwo+Pj4g
Kwljb25zdCB1bnNpZ25lZCBpbnQgc2l6ZSA9IHN0YXJ0ICsgbGVuOwo+Pj4gKwlpbnQgYml0c190
b19jbGVhciA9IEJJVFNfUEVSX0xPTkcgLSAoc3RhcnQgJSBCSVRTX1BFUl9MT05HKTsKPj4+ICsJ
dW5zaWduZWQgbG9uZyBtYXNrX3RvX2NsZWFyID0gQklUTUFQX0ZJUlNUX1dPUkRfTUFTSyhzdGFy
dCk7Cj4+PiArCj4+PiArCXdoaWxlIChsZW4gLSBiaXRzX3RvX2NsZWFyID49IDApIHsKPj4+ICsJ
CSpwICY9IH5tYXNrX3RvX2NsZWFyOwo+Pj4gKwkJbGVuIC09IGJpdHNfdG9fY2xlYXI7Cj4+PiAr
CQliaXRzX3RvX2NsZWFyID0gQklUU19QRVJfTE9ORzsKPj4+ICsJCW1hc2tfdG9fY2xlYXIgPSB+
MFVMOwo+Pj4gKwkJcCsrOwo+Pj4gKwl9Cj4+PiArCWlmIChsZW4pIHsKPj4+ICsJCW1hc2tfdG9f
Y2xlYXIgJj0gQklUTUFQX0xBU1RfV09SRF9NQVNLKHNpemUpOwo+Pj4gKwkJKnAgJj0gfm1hc2tf
dG9fY2xlYXI7Cj4+PiArCX0KPj4+ICt9Cj4+PiArRVhQT1JUX1NZTUJPTChfX2JpdG1hcF9jbGVh
cik7Cj4+Cj4+IERlc3BpdGUgYWxsIHRoZSBvdGhlciBFWFBPUlRfU1lNQk9MKCkgaW4gdGhpcyBm
aWxlLCBwZXJzb25hbGx5IEkKPj4gd291bGQgc3VnZ2VzdCB0byByZWZyYWluIGZyb20gYWRkaW5n
IG1vcmUuIEJ1dCBJJ20gbm90IGdvaW5nIHRvCj4+IGluc2lzdCAodW50aWwgc3VjaCB0aW1lIHRo
YXQgdGhleSBhbGwgZ2V0IGNsZWFuZWQgdXApLgo+Pgo+Pj4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9iaXRvcHMuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9iaXRvcHMuaAo+Pj4g
QEAgLTQ4MCw0ICs0ODAsNiBAQCBzdGF0aWMgaW5saW5lIGludCBmbHModW5zaWduZWQgaW50IHgp
Cj4+PiAgI2RlZmluZSBod2VpZ2h0MTYoeCkgZ2VuZXJpY19od2VpZ2h0MTYoeCkKPj4+ICAjZGVm
aW5lIGh3ZWlnaHQ4KHgpIGdlbmVyaWNfaHdlaWdodDgoeCkKPj4+ICAKPj4+ICsjZGVmaW5lIEJJ
VF9XT1JEKG5yKSAoKG5yKSAvIEJJVFNfUEVSX0xPTkcpCj4+Cj4+IEF0IGZpcnN0IEkgdGhvdWdo
dCAtIHdoeSBmb3IgeDg2IG9ubHk/IFRoZW4gSSBub3RpY2VkIEFybSBoYXMgYW4KPj4gYWxtb3N0
IGlkZW50aWNhbCAjZGVmaW5lIGFscmVhZHkuIFdoaWNoIGluIHR1cm4gbWFkZSBtZSBsb29rIGF0
Cj4+IExpbnV4LCB3aGVyZSB0aGF0ICNkZWZpbmUgbGl2ZXMgaW4gYSBjb21tb24gaGVhZGVyLiBJ
IHRoaW5rIHlvdQo+PiB3YW50IHRvIG1vdmUgdGhlIEFybSBvbmUuIE9yIHdhaXQsIG5vIC0gQXJt
J3MgaXNuJ3QgZXZlbgo+PiBjb21wYXRpYmxlIHdpdGggdGhlIGltcGxlbWVudGF0aW9ucyBvZiB0
aGUgZnVuY3Rpb25zIHlvdSBhZGQuCj4+IFRoaXMgZGVmaW5pdGVseSBuZWVkcyB0YWtpbmcgY2Fy
ZSBvZiwgcGVyaGFwcyBieSB3YXkgb2YgaWdub3JpbmcKPj4gbXkgcmVxdWVzdCB0byBnbyB0aGlz
IHJvdXRlIChhcyBnZXR0aW5nIHRvbyBpbnZvbHZlZCkuCj4gCj4gVXJnLCB5ZXMsIEkgZGlkbid0
IHJlYWxpemUgdGhhdCBCSVRfV09SRCBvbiBBUk0gaXMgb25seSBtZWFudCB0byBiZQo+IHVzZWQg
d2hlbiB0aGUgYml0bWFwIGlzIG1hcHBlZCB0byBhbiBhcnJheSBvZiAzMmJpdCB0eXBlIGVsZW1l
bnRzLgo+IAo+IEkgY291bGQgaW50cm9kdWNlIEJJVF9MT05HIHRoYXQgd291bGQgaGF2ZSB0aGUg
c2FtZSBkZWZpbml0aW9uIG9uIEFybQo+IGFuZCB4ODYsIGFuZCB0aGVuIG1vZGlmeSB0aGUgaW1w
b3J0ZWQgZnVuY3Rpb25zIHRvIHVzZSBpdCwgYnV0IElNTyB0aGUKPiByaWdodCBzb2x1dGlvbiB3
b3VsZCBiZSB0byBjaGFuZ2UgdGhlIEFybSBCSVRfV09SRCBtYWNybyB0byBhbHNvIHVzZQo+IEJJ
VFNfUEVSX0xPTkcgKGFuZCBhZGp1c3QgdGhlIGNhbGxlcnMpLgoKU28gZG8gSS4gSnVsaWVuLCBT
dGVmYW5vPwoKPiBUaGlzIHNlZW1zIHF1aXRlIGZhciBvZmYsIHNvIGlmIHlvdSBkb24ndCBtaW5k
IEkgd291bGQgcmF0aGVyIGhhdmUgdGhlCj4gb3JpZ2luYWwgdjMgMi8yIHVzaW5nIHNldF9iaXQ6
Cj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDIwLTAyL21zZzAwMTkwLmh0bWwKCkFzIHBlciBteSBwcmV2aW91cyByZXBseSAtIHllcywg
SSdtIG9rYXkgd2l0aCB0aGF0LCBhbmQgeWVzLApleHBlY3RpbmcgdGhpcyBJJ3ZlIGFsc28ga2Vw
dCB5b3VyIHBhdGNoZXMgdGhpcyB3YXkgaW4gbXkKdG8tYmUtY29tbWl0dGVkIGZvbGRlciAocGVu
ZGluZyBLZXZpbidzIGFjayBmb3IgcGF0Y2ggMSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
