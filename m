Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC1369FD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 04:29:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYi68-0000HG-KX; Thu, 06 Jun 2019 02:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QT08=UF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hYi67-0000H9-0L
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 02:25:47 +0000
X-Inumbo-ID: 61708538-8802-11e9-9733-cb14bec415b0
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61708538-8802-11e9-9733-cb14bec415b0;
 Thu, 06 Jun 2019 02:25:42 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 19:25:41 -0700
X-ExtLoop1: 1
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 05 Jun 2019 19:25:39 -0700
Date: Thu, 6 Jun 2019 10:29:53 +0800
From: Chao Gao <chao.gao@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190606022951.GA8859@gao-cwp>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-2-git-send-email-chao.gao@intel.com>
 <e3507e72-00c4-0e00-b2d3-3d11b4a54a59@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3507e72-00c4-0e00-b2d3-3d11b4a54a59@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v7 01/10] misc/xen-ucode: Upload a microcode
 blob to the hypervisor
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDU6MTQ6MTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPk9uIDI3LzA1LzIwMTkgMDk6MzEsIENoYW8gR2FvIHdyb3RlOgo+PiBUaGlzIHBhdGNo
IHByb3ZpZGVzIGEgdG9vbCBmb3IgbGF0ZSBtaWNyb2NvZGUgdXBkYXRlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+Cj4+IC0tLQo+PiBD
aGFuZ2VzIGluIHY3Ogo+PiAgLSBpbnRyb2R1Y2UgeGNfbWljcm9jb2RlX3VwZGF0ZSgpIHJhdGhl
ciB0aGFuIHhjX3BsYXRmb3JtX29wKCkKPj4gIC0gYXZvaWQgY3JlYXRpbmcgYm91bmNlIGJ1ZmZl
ciB0d2ljZQo+PiAgLSByZW5hbWUgeGVubWljcm9jb2RlIHRvIHhlbi11Y29kZSwgZm9sbG93aW5n
IG5hbWluZyB0cmFkaXRpb24KPj4gIG9mIG90aGVyIHRvb2xzIHRoZXJlLgo+Pgo+PiAtLS0KPj4g
IHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oIHwgIDEgKwo+PiAgdG9vbHMvbGlieGMveGNf
bWlzYy5jICAgICAgICAgfCAyMyArKysrKysrKysrKysrCj4+ICB0b29scy9taXNjL01ha2VmaWxl
ICAgICAgICAgICB8ICA0ICsrKwo+PiAgdG9vbHMvbWlzYy94ZW4tdWNvZGUuYyAgICAgICAgfCA3
OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICA0IGZpbGVz
IGNoYW5nZWQsIDEwNiBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMv
bWlzYy94ZW4tdWNvZGUuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94
ZW5jdHJsLmggYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAo+PiBpbmRleCA1MzgwMDdh
Li42ZDgwYWU1IDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAo+
PiArKysgYi90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAo+PiBAQCAtMTI0NCw2ICsxMjQ0
LDcgQEAgdHlwZWRlZiB1aW50MzJfdCB4Y19ub2RlX3RvX25vZGVfZGlzdF90Owo+PiAgaW50IHhj
X3BoeXNpbmZvKHhjX2ludGVyZmFjZSAqeGNoLCB4Y19waHlzaW5mb190ICppbmZvKTsKPj4gIGlu
dCB4Y19jcHV0b3BvaW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgKm1heF9jcHVzLAo+
PiAgICAgICAgICAgICAgICAgICAgIHhjX2NwdXRvcG9fdCAqY3B1dG9wbyk7Cj4+ICtpbnQgeGNf
bWljcm9jb2RlX3VwZGF0ZSh4Y19pbnRlcmZhY2UgKnhjaCwgY29uc3Qgdm9pZCAqYnVmLCBzaXpl
X3QgbGVuKTsKPj4gIGludCB4Y19udW1haW5mbyh4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQg
Km1heF9ub2RlcywKPj4gICAgICAgICAgICAgICAgICB4Y19tZW1pbmZvX3QgKm1lbWluZm8sIHVp
bnQzMl90ICpkaXN0YW5jZSk7Cj4+ICBpbnQgeGNfcGNpdG9wb2luZm8oeGNfaW50ZXJmYWNlICp4
Y2gsIHVuc2lnbmVkIG51bV9kZXZzLAo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfbWlz
Yy5jIGIvdG9vbHMvbGlieGMveGNfbWlzYy5jCj4+IGluZGV4IDVlNjcxNGEuLjg1NTM4ZTAgMTAw
NjQ0Cj4+IC0tLSBhL3Rvb2xzL2xpYnhjL3hjX21pc2MuYwo+PiArKysgYi90b29scy9saWJ4Yy94
Y19taXNjLmMKPj4gQEAgLTIyNiw2ICsyMjYsMjkgQEAgaW50IHhjX3BoeXNpbmZvKHhjX2ludGVy
ZmFjZSAqeGNoLAo+PiAgICAgIHJldHVybiAwOwo+PiAgfQo+PiAgCj4+ICtpbnQgeGNfbWljcm9j
b2RlX3VwZGF0ZSh4Y19pbnRlcmZhY2UgKnhjaCwgY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgbGVu
KQo+PiArewo+PiArICAgIGludCByZXQ7Cj4+ICsgICAgREVDTEFSRV9QTEFURk9STV9PUDsKPj4g
KyAgICBERUNMQVJFX0hZUEVSQ0FMTF9CVUZGRVIoc3RydWN0IHhlbnBmX21pY3JvY29kZV91cGRh
dGUsIHVjKTsKPj4gKwo+PiArICAgIHVjID0geGNfaHlwZXJjYWxsX2J1ZmZlcl9hbGxvYyh4Y2gs
IHVjLCBsZW4pOwo+PiArICAgIGlmICh1YyA9PSBOVUxMKQo+Cj5YZW4gc3R5bGUuwqAgRXh0cmEg
c3BhY2UgcGxlYXNlLgo+Cj4+ICsgICAgICAgIHJldHVybiAtMTsKPj4gKwo+PiArICAgIG1lbWNw
eSh1YywgYnVmLCBsZW4pOwo+PiArCj4+ICsgICAgcGxhdGZvcm1fb3AuY21kID0gWEVOUEZfbWlj
cm9jb2RlX3VwZGF0ZTsKPj4gKyAgICBwbGF0Zm9ybV9vcC51Lm1pY3JvY29kZS5sZW5ndGggPSBs
ZW47Cj4+ICsgICAgc2V0X3hlbl9ndWVzdF9oYW5kbGUocGxhdGZvcm1fb3AudS5taWNyb2NvZGUu
ZGF0YSwgdWMpOwo+PiArCj4+ICsgICAgcmV0ID0gZG9fcGxhdGZvcm1fb3AoeGNoLCAmcGxhdGZv
cm1fb3ApOwo+PiArCj4+ICsgICAgeGNfaHlwZXJjYWxsX2J1ZmZlcl9mcmVlKHhjaCwgdWMpOwo+
PiArCj4+ICsgICAgcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiAgaW50IHhjX2NwdXRvcG9pbmZv
KHhjX2ludGVyZmFjZSAqeGNoLCB1bnNpZ25lZCAqbWF4X2NwdXMsCj4+ICAgICAgICAgICAgICAg
ICAgICAgeGNfY3B1dG9wb190ICpjcHV0b3BvKQo+PiAgewo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bWlzYy9NYWtlZmlsZSBiL3Rvb2xzL21pc2MvTWFrZWZpbGUKPj4gaW5kZXggZDQzMjBkYy4uNjM5
NDdiZiAxMDA2NDQKPj4gLS0tIGEvdG9vbHMvbWlzYy9NYWtlZmlsZQo+PiArKysgYi90b29scy9t
aXNjL01ha2VmaWxlCj4+IEBAIC0yMiw2ICsyMiw3IEBAIElOU1RBTExfU0JJTi0kKENPTkZJR19Y
ODYpICAgICArPSB4ZW4taHZtY3Jhc2gKPj4gIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAg
ICArPSB4ZW4taHZtY3R4Cj4+ICBJTlNUQUxMX1NCSU4tJChDT05GSUdfWDg2KSAgICAgKz0geGVu
LWxvd21lbWQKPj4gIElOU1RBTExfU0JJTi0kKENPTkZJR19YODYpICAgICArPSB4ZW4tbWZuZHVt
cAo+PiArSU5TVEFMTF9TQklOLSQoQ09ORklHX1g4NikgICAgICs9IHhlbi11Y29kZQo+PiAgSU5T
VEFMTF9TQklOICAgICAgICAgICAgICAgICAgICs9IHhlbmNvdgo+PiAgSU5TVEFMTF9TQklOICAg
ICAgICAgICAgICAgICAgICs9IHhlbmxvY2twcm9mCj4+ICBJTlNUQUxMX1NCSU4gICAgICAgICAg
ICAgICAgICAgKz0geGVucGVyZgo+PiBAQCAtMTEzLDQgKzExNCw3IEBAIHhlbi1sb3dtZW1kOiB4
ZW4tbG93bWVtZC5vCj4+ICB4ZW5jb3Y6IHhlbmNvdi5vCj4+ICAJJChDQykgJChMREZMQUdTKSAt
byAkQCAkPCAkKExETElCU19saWJ4ZW5jdHJsKSAkKEFQUEVORF9MREZMQUdTKQo+PiAgCj4+ICt4
ZW4tdWNvZGU6IHhlbi11Y29kZS5vCj4+ICsJJChDQykgJChMREZMQUdTKSAtbyAkQCAkPCAkKExE
TElCU19saWJ4ZW5jdHJsKSAkKEFQUEVORF9MREZMQUdTKQo+PiArCj4+ICAtaW5jbHVkZSAkKERF
UFNfSU5DTFVERSkKPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL21pc2MveGVuLXVjb2RlLmMgYi90b29s
cy9taXNjL3hlbi11Y29kZS5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAuLmRhNjY4Y2EKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi90b29scy9taXNjL3hlbi11Y29k
ZS5jCj4+IEBAIC0wLDAgKzEsNzggQEAKPj4gKyNkZWZpbmUgX0dOVV9TT1VSQ0UKPj4gKwo+PiAr
I2luY2x1ZGUgPHN0ZGlvLmg+Cj4+ICsjaW5jbHVkZSA8c3RkbGliLmg+Cj4+ICsjaW5jbHVkZSA8
c3lzL21tYW4uaD4KPj4gKyNpbmNsdWRlIDxlcnJuby5oPgo+PiArI2luY2x1ZGUgPHN0cmluZy5o
Pgo+PiArI2luY2x1ZGUgPGludHR5cGVzLmg+Cj4+ICsjaW5jbHVkZSA8dW5pc3RkLmg+Cj4+ICsj
aW5jbHVkZSA8c3lzL3R5cGVzLmg+Cj4+ICsjaW5jbHVkZSA8c3lzL3N0YXQuaD4KPj4gKyNpbmNs
dWRlIDxmY250bC5oPgo+PiArI2luY2x1ZGUgPHhlbmN0cmwuaD4KPj4gKwo+PiArdm9pZCBzaG93
X2hlbHAodm9pZCkKPj4gK3sKPj4gKyAgICBmcHJpbnRmKHN0ZGVyciwKPj4gKyAgICAgICAgICAg
ICJ4ZW5taWNyb2NvZGU6IFhlbiBtaWNyb2NvZGUgdXBkYXRpbmcgdG9vbFxuIgo+PiArICAgICAg
ICAgICAgIlVzYWdlOiB4ZW5taWNyb2NvZGUgPG1pY3JvY29kZSBibG9iPlxuIik7Cj4KPnMveGVu
bWljcm9jb2RlL3hlbi11Y29kZS8KPgo+Qm90aCBjYW4gYmUgZml4ZWQgb24gY29tbWl0Cj4KPkFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtz
LgoKQXMgSmFuIHNhaWQsIGl0IGlzIGJldHRlciB0byB1c2UgYXJndlswXSBoZXJlLgoKQ2hhbwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
