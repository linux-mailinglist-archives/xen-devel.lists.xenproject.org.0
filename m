Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C00B7AF9AC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 11:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zLl-0004Zo-Hj; Wed, 11 Sep 2019 09:55:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VrDL=XG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7zLj-0004Zj-WD
 for xen-devel@lists.xen.org; Wed, 11 Sep 2019 09:55:44 +0000
X-Inumbo-ID: 4ff41e22-d47a-11e9-ac26-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4ff41e22-d47a-11e9-ac26-12813bfff9fa;
 Wed, 11 Sep 2019 09:55:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A7D428;
 Wed, 11 Sep 2019 02:55:40 -0700 (PDT)
Received: from [10.37.12.223] (unknown [10.37.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 105483F71F;
 Wed, 11 Sep 2019 02:55:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-4-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e4abb88f-040b-f3e8-5227-434a2865ad83@arm.com>
Date: Wed, 11 Sep 2019 10:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821035315.12812-4-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/8] xen/arm: copy dtb fragment to guest
 dtb
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvMjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFJlYWQgdGhlIGR0YiBmcmFnbWVudCBjb3JyZXNwb25kaW5nIHRvIGEgcGFzc3Rocm91Z2gg
ZGV2aWNlIGZyb20gbWVtb3J5Cj4gYXQgdGhlIGxvY2F0aW9uIHJlZmVycmVkIHRvIGJ5IHRoZSAi
bXVsdGlib290LGRldmljZS10cmVlIiBjb21wYXRpYmxlCj4gbm9kZS4KPiAKPiBBZGQgYSBuZXcg
ZmllbGQgbmFtZWQgZHRiX2Jvb3Rtb2R1bGUgdG8gc3RydWN0IGtlcm5lbF9pbmZvIHRvIGtlZXAg
dHJhY2sKPiBvZiB0aGUgZHRiIGZyYWdtZW50IGxvY2F0aW9uLgo+IAo+IENvcHkgdGhlIGZyYWdt
ZW50IHRvIHRoZSBndWVzdCBkdGIgKG9ubHkgL2FsaWFzZXMgYW5kIC9wYXNzdGhyb3VnaCkuCj4g
Cj4gU2V0IGtpbmZvLT5ndWVzdF9waGFuZGxlX2dpYyBiYXNlZCBvbiB0aGUgcGhhbmRsZSBvZiB0
aGUgc3BlY2lhbCAiL2dpYyIKPiBub2RlIGluIHRoZSBkZXZpY2UgdHJlZSBmcmFnbWVudC4gIi9n
aWMiIGlzIGEgZHVtbXkgbm9kZSBpbiB0aGUgZHRiCj4gZnJhZ21lbnQgdGhhdCByZXByZXNlbnRz
IHRoZSBnaWMgaW50ZXJydXB0IGNvbnRyb2xsZXIuIE90aGVyIHByb3BlcnRpZXMKPiBpbiB0aGUg
ZHRiIGZyYWdtZW50IG1pZ2h0IHJlZmVyIHRvIGl0IChmb3IgaW5zdGFuY2UgaW50ZXJydXB0LXBh
cmVudCBvZgo+IGEgZGV2aWNlIG5vZGUpLiBXZSByZXVzZSB0aGUgcGhhbmRsZSBvZiAiL2dpYyIg
ZnJvbSB0aGUgZHRiIGZyYWdtZW50IGFzCj4gdGhlIHBoYW5kbGUgb2YgdGhlIGZ1bGwgR0lDIG5v
ZGUgdGhhdCB3aWxsIGJlIGNyZWF0ZWQgZm9yIHRoZSBndWVzdAo+IGRldmljZSB0cmVlLiBUaGF0
IHdheSwgd2hlbiB3ZSBjb3B5IHByb3BlcnRpZXMgZnJvbSB0aGUgZGV2aWNlIHRyZWUKPiBmcmFn
bWVudCB0byB0aGUgZG9tVSBkZXZpY2UgdHJlZSB0aGUgbGlua3MgcmVtYWluIHVuYnJva2VuLgo+
IAo+IFNvbWUgb2YgdGhlIGNvZGUgYmVsb3cgaXMgdGFrZW4gZnJvbSB0b29scy9saWJ4bC9saWJ4
bF9hcm0uYy4gTm90ZSB0aGF0Cj4gaXQgaXMgT0sgdG8gdGFrZSBMR1BMIDIuMSBjb2RlIGFuZCBp
bmNsdWRpbmcgaXQgaW50byBhIEdQTHYyIGNvZGUgYmFzZS4KPiBUaGUgcmVzdWx0IGlzIEdQTHYy
IGNvZGUuCgpJIHdvdWxkIGJlIG11Y2ggaW4gZmF2b3IgdG8ga2VlcCB0aGUgY29kZSBhcyBjbG9z
ZSBhIHBvc3NpYmxlIHRvIHRoZSAKbGlieGwgY29kZSByYXRoZXIgdGhhbiByZS1pbnZlbnRpbmcg
dGhlIHdoZWVsIGNvcHlpbmcgdGhlIHBhcnRpYWwgRFQuIEluIApvdGhlciB3b3JkcywgaWYgdGhl
cmUgYXJlIHJlYXNvbiB0byBkaXZlcmdlLCB0aGVuIEkgd291bGQgbGlrZSB0byAKdW5kZXJzdGFu
ZCB3aHkuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NA
eGlsaW54LmNvbT4KPiAKPiAtLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIHVzZSByZWN1cnNpb24g
aW4gdGhlIGltcGxlbWVudGF0aW9uCj4gLSByZW5hbWUgaGFuZGxlX3Byb3BlcnRpZXMgdG8gaGFu
ZGxlX3Byb3BfcGZkdAo+IC0gcmVuYW1lIHNjYW5fcHRfbm9kZSB0byBzY2FuX3BmZHRfbm9kZQo+
IC0gcGFzcyBraW5mbyB0byBoYW5kbGVfcHJvcGVydGllcwo+IC0gdXNlIHVpbnQzMl90IGluc3Rl
YWQgb2YgdTMyCj4gLSByZW5hbWUgciB0byByZXMKPiAtIGFkZCAicGFzc3Rocm91Z2giIGFuZCAi
YWxpYXNlcyIgY2hlY2sKPiAtIGFkZCBhIG5hbWUgPT0gTlVMTCBjaGVjawo+IC0gY29kZSBzdHls
ZQo+IC0gbW92ZSBEVEIgZnJhZ21lbnQgc2Nhbm5pbmcgZWFybGllciwgYmVmb3JlIERvbVUgR0lD
IG5vZGUgY3JlYXRpb24KPiAtIHNldCBndWVzdF9waGFuZGxlX2dpYyBiYXNlZCBvbiAiL2dpYyIK
PiAtIGluLWNvZGUgY29tbWVudAo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBzd2l0Y2ggdG8gdXNp
bmcgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSBmb3IgdGhlIGNvcHkKPiAKPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gYWRkIGEgbm90ZSBhYm91dCB0aGUgY29kZSBjb21pbmcgZnJvbSBsaWJ4bCBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UKPiAtIGNvcHkgL2FsaWFzZXMKPiAtIGNvZGUgc3R5bGUKPiAtLS0K
PiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgfCAxMTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggfCAgIDIg
Ky0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jCj4gaW5kZXggY2Q1ODVmMDVjYS4uYzcxYjlmMjg4OSAxMDA2NDQK
PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC9hcm0v
ZG9tYWluX2J1aWxkLmMKPiBAQCAtMTQsNiArMTQsNyBAQAo+ICAgI2luY2x1ZGUgPHhlbi9ndWVz
dF9hY2Nlc3MuaD4KPiAgICNpbmNsdWRlIDx4ZW4vaW9jYXAuaD4KPiAgICNpbmNsdWRlIDx4ZW4v
YWNwaS5oPgo+ICsjaW5jbHVkZSA8eGVuL3ZtYXAuaD4KPiAgICNpbmNsdWRlIDx4ZW4vd2Fybmlu
Zy5oPgo+ICAgI2luY2x1ZGUgPGFjcGkvYWN0YWJsZXMuaD4KPiAgICNpbmNsdWRlIDxhc20vZGV2
aWNlLmg+Cj4gQEAgLTE3MTMsNiArMTcxNCwxMTEgQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV92
cGwwMTFfdWFydF9ub2RlKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4gICB9Cj4gICAjZW5k
aWYKPiAgIAo+ICtzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcHJvcF9wZmR0KHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqcGZkdCwgaW50IG5vZGVvZmYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDMyX3QgYWRkcmVzc19jZWxscywgdWludDMyX3Qgc2l6ZV9jZWxscykKCldo
eSBkbyB5b3UgbmVlZCBhZGRyZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIGluIHBhcmFtZXRlcj8K
Cj4gK3sKPiArICAgIHZvaWQgKmZkdCA9IGtpbmZvLT5mZHQ7Cj4gKyAgICBpbnQgcHJvcG9mZiwg
bmFtZW9mZiwgcmVzOwo+ICsgICAgY29uc3Qgc3RydWN0IGZkdF9wcm9wZXJ0eSAqcHJvcDsKPiAr
Cj4gKyAgICBmb3IgKCBwcm9wb2ZmID0gZmR0X2ZpcnN0X3Byb3BlcnR5X29mZnNldChwZmR0LCBu
b2Rlb2ZmKTsKPiArICAgICAgICAgIHByb3BvZmYgPj0gMDsKPiArICAgICAgICAgIHByb3BvZmYg
PSBmZHRfbmV4dF9wcm9wZXJ0eV9vZmZzZXQocGZkdCwgcHJvcG9mZikgKQo+ICsgICAgewo+ICsg
ICAgICAgIGlmICggIShwcm9wID0gZmR0X2dldF9wcm9wZXJ0eV9ieV9vZmZzZXQocGZkdCwgcHJv
cG9mZiwgTlVMTCkpICkKPiArICAgICAgICAgICAgcmV0dXJuIC1GRFRfRVJSX0lOVEVSTkFMOwo+
ICsKPiArICAgICAgICBuYW1lb2ZmID0gZmR0MzJfdG9fY3B1KHByb3AtPm5hbWVvZmYpOwo+ICsg
ICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsIGZkdF9zdHJpbmcocGZkdCwgbmFtZW9mZiks
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3AtPmRhdGEsIGZkdDMyX3RvX2NwdShw
cm9wLT5sZW4pKTsKPiArICAgICAgICBpZiAoIHJlcyApCj4gKyAgICAgICAgICAgIHJldHVybiBy
ZXM7Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyogRkRUX0VSUl9OT1RGT1VORCA9PiBUaGVyZSBpcyBu
byBtb3JlIHByb3BlcnRpZXMgZm9yIHRoaXMgbm9kZSAqLwo+ICsgICAgcmV0dXJuICggcHJvcG9m
ZiAhPSAtRkRUX0VSUl9OT1RGT1VORCApID8gcHJvcG9mZiA6IDA7Cj4gK30KPiArCj4gK3N0YXRp
YyBpbnQgX19pbml0IHNjYW5fcGZkdF9ub2RlKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sIGNv
bnN0IHZvaWQgKnBmZHQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBu
b2Rlb2ZmLCBpbnQgZGVwdGgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVp
bnQzMl90IGFkZHJlc3NfY2VsbHMsIHVpbnQzMl90IHNpemVfY2VsbHMpCj4gK3sKPiArICAgIGlu
dCByYyA9IDA7Cj4gKyAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Owo+ICsgICAgaW50IG5vZGVf
bmV4dDsKPiArICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBmZHRfZ2V0X25hbWUocGZkdCwgbm9kZW9m
ZiwgTlVMTCk7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFRha2UgdGhlIEdJQyBwaGFuZGxlIHZh
bHVlIGZyb20gdGhlIHNwZWNpYWwgL2dpYyBub2RlIGluIHRoZSBEVEIKPiArICAgICAqIGZyYWdt
ZW50Lgo+ICsgICAgICovCj4gKyAgICBpZiAoIGRlcHRoID09IDEgJiYgZHRfbm9kZV9jbXAobmFt
ZSwgImdpYyIpID09IDAgKQo+ICsgICAgewo+ICsgICAgICAgIGtpbmZvLT5ndWVzdF9waGFuZGxl
X2dpYyA9IGZkdF9nZXRfcGhhbmRsZShwZmR0LCBub2Rlb2ZmKTsKPiArICAgICAgICByZXR1cm4g
MDsKPiArICAgIH0KCkkgZG9uJ3QgbGlrZSB0aGlzIHNvbHV0aW9uLiBZb3UgYXJlIGJ5cGFzc2lu
ZyBtb3N0IG9mIHRoZSBmdW5jdGlvbiBqdXN0IApmb3IgdGhlIGJlbmVmaXRzIG9mIGhhdmUgdGhl
IG5hbWUgaW4gaGFuZC4gQ2FuIHRoaXMgYmUgZG9uZSBzZXBhcmF0ZWx5PyAKVGhpcyB3b3VsZCBh
bHNvIGF2b2lkIHRvIGhhdmUgYW4gZXh0cmEgcGFyYW1ldGVyIChkZXB0aCkgZm9yIHRoZSBvbmx5
IApiZW5lZml0cyBvZiB0aGlzIGNoZWNrLgoKPiArCj4gKyAgICByYyA9IGZkdF9iZWdpbl9ub2Rl
KGZkdCwgZmR0X2dldF9uYW1lKHBmZHQsIG5vZGVvZmYsIE5VTEwpKTsKPiArICAgIGlmICggcmMg
KQo+ICsgICAgICAgIHJldHVybiByYzsKPiArCj4gKyAgICByYyA9IGhhbmRsZV9wcm9wX3BmZHQo
a2luZm8sIHBmZHQsIG5vZGVvZmYsIGFkZHJlc3NfY2VsbHMsIHNpemVfY2VsbHMpOwo+ICsgICAg
aWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsKPiArICAgIGFkZHJlc3NfY2VsbHMg
PSBkZXZpY2VfdHJlZV9nZXRfdTMyKHBmZHQsIG5vZGVvZmYsICIjYWRkcmVzcy1jZWxscyIsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2NlbGxzKTsK
PiArICAgIHNpemVfY2VsbHMgPSBkZXZpY2VfdHJlZV9nZXRfdTMyKHBmZHQsIG5vZGVvZmYsICIj
c2l6ZS1jZWxscyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
X2NlbGxzKTsKCkkgYW0gcHJldHR5IHN1cmUgSSBtZW50aW9uIGl0IGJlZm9yZSAodGhvdWdoIG5v
dCBvbiB0aGlzIHBhdGNoLi4uKSwgdGhpcyAKaXMgbm90IG1hdGNoaW5nIHRoZSBEVCBzcGVjLiBh
ZGRyZXNzX2NlbGxzIGFuZCBzaXplX2NlbGxzIGFyZSBub3QgCnByb3BhZ2F0ZWQgdG8gdGhlIG5l
eHQgbGV2ZWwuIFNvIHRoZXNlIHNob3VsZCBiZSBEVF9ST09UX05PREVfe0FERFIsIApTSVpFfV9D
RUxMU19ERUZBVUxULgoKPiArCj4gKyAgICBub2RlX25leHQgPSBmZHRfZmlyc3Rfc3Vibm9kZShw
ZmR0LCBub2Rlb2ZmKTsKPiArICAgIHdoaWxlICggbm9kZV9uZXh0ID4gMCApCj4gKyAgICB7Cj4g
KyAgICAgICAgc2Nhbl9wZmR0X25vZGUoa2luZm8sIHBmZHQsIG5vZGVfbmV4dCwgZGVwdGggKyAx
LCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsKPiArICAgICAgICBub2RlX25leHQgPSBmZHRf
bmV4dF9zdWJub2RlKHBmZHQsIG5vZGVfbmV4dCk7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0dXJu
IGZkdF9lbmRfbm9kZShmZHQpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IF9faW5pdCBkb21haW5f
aGFuZGxlX2R0Yl9ib290bW9kdWxlKHN0cnVjdCBkb21haW4gKmQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGtlcm5lbF9pbmZvICpraW5m
bykKPiArewo+ICsgICAgdm9pZCAqcGZkdDsKPiArICAgIGludCByZXMsIG5vZGVfbmV4dDsKPiAr
Cj4gKyAgICBwZmR0ID0gaW9yZW1hcF9jYWNoZShraW5mby0+ZHRiX2Jvb3Rtb2R1bGUtPnN0YXJ0
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAga2luZm8tPmR0Yl9ib290bW9kdWxlLT5zaXpl
KTsKPiArICAgIGlmICggcGZkdCA9PSBOVUxMICkKPiArICAgICAgICByZXR1cm4gLUVGQVVMVDsK
ClNob3VsZG4ndCB5b3UgY2hlY2sgeW91IGFjdHVhbGx5IGhhdmUgYSBkZXZpY2UtdHJlZSBpbiBo
YW5kIGFuZCB0aGF0IGl0IApmaXRzIGluIHRoZSBzaXplIHNwZWNpZmllZCBieSB0aGUgdXNlcj8g
U2VlIGNoZWNrX3BhcnRpYWxfZmR0KCkgaW4gCmxpYnhsX2FybS5jLgoKPiArCj4gKyAgICBub2Rl
X25leHQgPSBmZHRfZmlyc3Rfc3Vibm9kZShwZmR0LCAwKTsKPiArICAgIHdoaWxlICggbm9kZV9u
ZXh0ID4gMCApCj4gKyAgICB7CgpXaHkgZG8gd2UgaGF2ZSB0byBnbyB0aHJvdWdoIHRoZSBhbGwg
dGhlIG5vZGVzIG9mIHRoZSBmaXJzdCBsZXZlbD8gQ2FuJ3QgCndlIGp1c3QgbG9va3VwIGZvciB0
aGUgcGF0aCBhbmQgY29weSB0aGUgbm9kZSBhcyBsaWJ4bCBkb2VzPwoKPiArICAgICAgICBjb25z
dCBjaGFyICpuYW1lID0gZmR0X2dldF9uYW1lKHBmZHQsIG5vZGVfbmV4dCwgTlVMTCk7Cj4gKwo+
ICsgICAgICAgIC8qIG9ubHkgc2NhbiAvZ2ljIC9hbGlhc2VzIC9wYXNzdGhyb3VnaCwgaWdub3Jl
IHRoZSByZXN0ICovCj4gKyAgICAgICAgaWYgKCBuYW1lICE9IE5VTEwgJiYKPiArICAgICAgICAg
ICAgIChkdF9ub2RlX2NtcChuYW1lLCAicGFzc3Rocm91Z2giKSA9PSAwIHx8Cj4gKyAgICAgICAg
ICAgICAgZHRfbm9kZV9jbXAobmFtZSwgImFsaWFzZXMiKSA9PSAwIHx8Cj4gKyAgICAgICAgICAg
ICAgZHRfbm9kZV9jbXAobmFtZSwgImdpYyIpID09IDApICkKPiArICAgICAgICB7Cj4gKyAgICAg
ICAgICAgIHJlcyA9IHNjYW5fcGZkdF9ub2RlKGtpbmZvLCBwZmR0LCBub2RlX25leHQsIDEsCj4g
KyAgICAgICAgICAgICAgICAgICAgRFRfUk9PVF9OT0RFX0FERFJfQ0VMTFNfREVGQVVMVCwKPiAr
ICAgICAgICAgICAgICAgICAgICBEVF9ST09UX05PREVfU0laRV9DRUxMU19ERUZBVUxUKTsKPiAr
ICAgICAgICAgICAgaWYgKCByZXMgKQo+ICsgICAgICAgICAgICAgICAgcmV0dXJuIHJlczsKPiAr
ICAgICAgICB9Cj4gKwo+ICsgICAgICAgIG5vZGVfbmV4dCA9IGZkdF9uZXh0X3N1Ym5vZGUocGZk
dCwgbm9kZV9uZXh0KTsKPiArICAgIH0KPiArCj4gKyAgICBpb3VubWFwKHBmZHQpOwo+ICsKPiAr
ICAgIHJldHVybiByZXM7Cj4gK30KPiArCj4gICAvKgo+ICAgICogVGhlIG1heCBzaXplIGZvciBE
VCBpcyAyTUIuIEhvd2V2ZXIsIHRoZSBnZW5lcmF0ZWQgRFQgaXMgc21hbGwsIDRLQgo+ICAgICog
YXJlIGVub3VnaCBmb3Igbm93LCBidXQgd2UgbWlnaHQgaGF2ZSB0byBpbmNyZWFzZSBpdCBpbiB0
aGUgZnV0dXJlLgo+IEBAIC0xNzY4LDYgKzE4NzQsMTIgQEAgc3RhdGljIGludCBfX2luaXQgcHJl
cGFyZV9kdGJfZG9tVShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZv
KQo+ICAgICAgIGlmICggcmV0ICkKPiAgICAgICAgICAgZ290byBlcnI7Cj4gICAKPiArICAgIGlm
ICgga2luZm8tPmR0Yl9ib290bW9kdWxlICkgewoKQ29kaW5nIHN0eWxlOgoKaWYgKCAuLi4gKQp7
Cgo+ICsgICAgICAgIHJldCA9IGRvbWFpbl9oYW5kbGVfZHRiX2Jvb3Rtb2R1bGUoZCwga2luZm8p
Owo+ICsgICAgICAgIGlmICggcmV0ICkKPiArICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAg
IH0KPiArCj4gICAgICAgcmV0ID0gbWFrZV9naWNfZG9tVV9ub2RlKGtpbmZvKTsKPiAgICAgICBp
ZiAoIHJldCApCj4gICAgICAgICAgIGdvdG8gZXJyOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL2tlcm5lbC5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+IGluZGV4
IDc2MDQzNDM2OWIuLjdmNWU2NTk1NjEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9rZXJuZWwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmgKPiBAQCAtMjgs
NyArMjgsNyBAQCBzdHJ1Y3Qga2VybmVsX2luZm8gewo+ICAgICAgIHBhZGRyX3QgZ250dGFiX3Np
emU7Cj4gICAKPiAgICAgICAvKiBib290IGJsb2IgbG9hZCBhZGRyZXNzZXMgKi8KPiAtICAgIGNv
bnN0IHN0cnVjdCBib290bW9kdWxlICprZXJuZWxfYm9vdG1vZHVsZSwgKmluaXRyZF9ib290bW9k
dWxlOwo+ICsgICAgY29uc3Qgc3RydWN0IGJvb3Rtb2R1bGUgKmtlcm5lbF9ib290bW9kdWxlLCAq
aW5pdHJkX2Jvb3Rtb2R1bGUsICpkdGJfYm9vdG1vZHVsZTsKPiAgICAgICBjb25zdCBjaGFyKiBj
bWRsaW5lOwo+ICAgICAgIHBhZGRyX3QgZHRiX3BhZGRyOwo+ICAgICAgIHBhZGRyX3QgaW5pdHJk
X3BhZGRyOwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
