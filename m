Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525DF8838E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 21:57:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hwAyh-0002Zm-Qi; Fri, 09 Aug 2019 19:55:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hwAyg-0002Zh-8m
 for xen-devel@lists.xen.org; Fri, 09 Aug 2019 19:55:06 +0000
X-Inumbo-ID: 94354cd4-badf-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 94354cd4-badf-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 19:55:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FBBB1596;
 Fri,  9 Aug 2019 12:55:03 -0700 (PDT)
Received: from [10.37.8.74] (unknown [10.37.8.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7A063F706;
 Fri,  9 Aug 2019 12:55:01 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d68be6b4-1b09-03b3-6797-fa0e8fcdbb69@arm.com>
Date: Fri, 9 Aug 2019 20:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808231242.26424-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/6] xen/arm: copy dtb fragment to guest
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

SGkgU3RlZmFubywKCk9uIDgvOS8xOSAxMjoxMiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFJlYWQgdGhlIGR0YiBmcmFnbWVudCBjb3JyZXNwb25kaW5nIHRvIGEgcGFzc3Rocm91Z2gg
ZGV2aWNlIGZyb20gbWVtb3J5Cj4gYXQgdGhlIGxvY2F0aW9uIHJlZmVycmVkIHRvIGJ5IHRoZSAi
bXVsdGlib290LGR0YiIgY29tcGF0aWJsZSBub2RlLgo+IAo+IENvcHkgdGhlIGZyYWdtZW50IHRv
IHRoZSBndWVzdCBkdGIuCj4gCj4gQWRkIGEgZHRiX2Jvb3Rtb2R1bGUgZmllbGQgdG8gc3RydWN0
IGtlcm5lbF9pbmZvIHRvIGZpbmQgdGhlIGR0Ygo+IGZyYWdtZW50IGZvciBhIGd1ZXN0Lgo+IAo+
IFNvbWUgb2YgdGhlIGNvZGUgYmVsb3cgaXMgdGFrZW4gZnJvbSB0b29scy9saWJ4bC9saWJ4bF9h
cm0uYy4gTm90ZSB0aGF0Cj4gaXQgaXMgT0sgdG8gdGFrZSBMR1BMIDIuMSBjb2RlIGFuZCBpbmNs
dWRpbmcgaXQgaW50byBhIEdQTHYyIGNvZGUgYmFzZS4KPiBUaGUgcmVzdWx0IGlzIEdQTHYyIGNv
ZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxp
bnguY29tPgo+IAo+IC0tLS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gc3dpdGNoIHRvIHVzaW5nIGRl
dmljZV90cmVlX2Zvcl9lYWNoX25vZGUgZm9yIHRoZSBjb3B5Cj4gCj4gQ2hhbmdlcyBpbiB2MjoK
PiAtIGFkZCBhIG5vdGUgYWJvdXQgdGhlIGNvZGUgY29taW5nIGZyb20gbGlieGwgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlCj4gLSBjb3B5IC9hbGlhc2VzCj4gLSBjb2RlIHN0eWxlCj4gLS0tCj4gICB4
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgIHwgMTAzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oIHwgICAyICstCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+IGluZGV4IDAwZGRiM2IwNWQuLjcwYmNkYzQ0OWQgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bl9idWlsZC5jCj4gQEAgLTE0LDYgKzE0LDcgQEAKPiAgICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNj
ZXNzLmg+Cj4gICAjaW5jbHVkZSA8eGVuL2lvY2FwLmg+Cj4gICAjaW5jbHVkZSA8eGVuL2FjcGku
aD4KPiArI2luY2x1ZGUgPHhlbi92bWFwLmg+Cj4gICAjaW5jbHVkZSA8eGVuL3dhcm5pbmcuaD4K
PiAgICNpbmNsdWRlIDxhY3BpL2FjdGFibGVzLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2RldmljZS5o
Pgo+IEBAIC0xNzA2LDYgKzE3MDcsMTAyIEBAIHN0YXRpYyBpbnQgX19pbml0IG1ha2VfdnBsMDEx
X3VhcnRfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpmZHQpCj4gICB9Cj4gICAj
ZW5kaWYKPiAgIAo+ICtzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcHJvcGVydGllcyhzdHJ1Y3Qg
ZG9tYWluICpkLCB2b2lkICpmZHQsIGNvbnN0IHZvaWQgKnBmZHQsIGludCBub2Rlb2ZmLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYWRkcmVzc19jZWxscywgdTMy
IHNpemVfY2VsbHMpCgpTbyBpbiB0aGlzIGZpbGUgd2UgYWxyZWFkeSBoYXZlIGEgZnVuY3Rpb24g
Y2FsbCB3cml0ZV9wcm9wZXJ0aWVzLiBIb3cgYSAKdXNlciB3aWxsIGtub3cgd2hpY2ggb25lIHRv
IHVzZT8KCkl0IGlzIGFsc28gbm90IGVudGlyZWx5IGNsZWFyIGZyb20gdGhlcmUgdmFyaWFibGUg
bmFtZSB3aGF0IGlzIHRoZSAKZGlmZmVyZW5jZSBiZXR3ZWVuIGZkdCBhbmQgcGZkdC4KCkFsc28s
IG5vIG1vcmUgdTMyIGluIHRoZSBjb2RlIHBsZWFzZS4gVGhpcyBpcyBub3cgcGFydCBvZiB0aGUg
Q09ESU5HX1NUWUxFLgoKCj4gK3sKPiArICAgIGludCBwcm9wb2ZmLCBuYW1lb2ZmLCByOwoKUGxl
YXNlIG5vIHNpbmdsZSBsZXR0ZXIgdmFyaWFibGUgdW5sZXNzIHRoaXMgaXMgb2J2aW91cyB0byB1
bmRlcnN0YW5kIAooc3VjaCBhcyBpLCBqIGZvciBpdGVyYXRpb24pLiBUaGlzIHNob3VsZCBiZSBy
ZXQsIHJjIG9yIHJlcy4KCk5vdGUgdGhhdCBzb21laG93IHlvdSBhcmUgdXNpbmcgdGhlIDMgb2Yg
dGhlbSBpbiB0aGUgc2FtZSBwYXRjaGVzLi4uIEkgCmFtIG5vdCBnb2luZyB0byBhc2sgZm9yIGNv
bnNpc3RlbmN5IHRob3VnaHQuCgoKPiArICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnBy
b3A7Cj4gKwo+ICsgICAgZm9yICggcHJvcG9mZiA9IGZkdF9maXJzdF9wcm9wZXJ0eV9vZmZzZXQo
cGZkdCwgbm9kZW9mZik7Cj4gKyAgICAgICAgICBwcm9wb2ZmID49IDA7Cj4gKyAgICAgICAgICBw
cm9wb2ZmID0gZmR0X25leHRfcHJvcGVydHlfb2Zmc2V0KHBmZHQsIHByb3BvZmYpICkKPiArICAg
IHsKPiArCj4gKyAgICAgICAgaWYgKCAhKHByb3AgPSBmZHRfZ2V0X3Byb3BlcnR5X2J5X29mZnNl
dChwZmR0LCBwcm9wb2ZmLCBOVUxMKSkgKQo+ICsgICAgICAgICAgICByZXR1cm4gLUZEVF9FUlJf
SU5URVJOQUw7Cj4gKwo+ICsgICAgICAgIG5hbWVvZmYgPSBmZHQzMl90b19jcHUocHJvcC0+bmFt
ZW9mZik7Cj4gKyAgICAgICAgciA9IGZkdF9wcm9wZXJ0eShmZHQsIGZkdF9zdHJpbmcocGZkdCwg
bmFtZW9mZiksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBwcm9wLT5kYXRhLCBmZHQzMl90
b19jcHUocHJvcC0+bGVuKSk7Cj4gKyAgICAgICAgaWYgKCByICkKPiArICAgICAgICAgICAgcmV0
dXJuIHI7Cj4gKyAgICB9Cj4gKwo+ICsgICAgLyogRkRUX0VSUl9OT1RGT1VORCA9PiBUaGVyZSBp
cyBubyBtb3JlIHByb3BlcnRpZXMgZm9yIHRoaXMgbm9kZSAqLwo+ICsgICAgcmV0dXJuICggcHJv
cG9mZiAhPSAtRkRUX0VSUl9OT1RGT1VORCApID8gcHJvcG9mZiA6IDA7Cj4gK30KPiArCj4gK3N0
YXRpYyBpbnQgX19pbml0IHNjYW5fcHRfbm9kZShjb25zdCB2b2lkICpwZmR0LAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IG5vZGVvZmYsIGNvbnN0IGNoYXIgKm5hbWUsIGlu
dCBkZXB0aCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2Nl
bGxzLCB1MzIgc2l6ZV9jZWxscywKClNhbWUgaGVyZS4KCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQo+ICt7Cj4gKyAgICBpbnQgcmM7Cj4gKyAgICBpbnQgaSwg
bnVtOwoKQW55dGhpbmcgdGhhdCBjYW4ndCBiZSBuZWdhdGl2ZSwgc2hvdWxkIGJlIHVuc2lnbmVk
LgoKPiArICAgIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8gPSBkYXRhOwo+ICsgICAgdm9pZCAq
ZmR0ID0ga2luZm8tPmZkdDsKPiArICAgIGludCBkZXB0aF9uZXh0ID0gZGVwdGg7Cj4gKyAgICBp
bnQgbm9kZV9uZXh0Owo+ICsKPiArICAgIC8qIG5vIG5lZWQgdG8gcGFyc2UgaW5pdGlhbCBub2Rl
ICovCj4gKyAgICBpZiAoICFkZXB0aCApCj4gKyAgICAgICAgcmV0dXJuIDA7CgpTbyB0aGlzIGlz
IGdvaW5nIHRvIGNvcHkgd2hhdCBldmVyIGlzIGluIHRoZSBwYXJ0aWFsIGRldmljZS10cmVlLiBJ
biAKb3RoZXIgd29yZCwgdGhlIHVzZXJzIGNhbiBvdmVycmlkZSBwcmV0dHkgbXVjaCBhbnl0aGlu
ZyB0aGF0IFhlbiAKY3JlYXRlZC4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdoYXQgd2Ugd2FudC4K
Ckluc3RlYWQsIHdlIHNob3VsZCBvbmx5IGNvcHkgbm9kZXMgdW5kZXIgL3Bhc3N0aHJvdWdoIGFu
ZCBhbHNvIHRoZSAvYWxpYXNlcy4KCj4gKwo+ICsgICAgcmMgPSBmZHRfYmVnaW5fbm9kZShmZHQs
IGZkdF9nZXRfbmFtZShwZmR0LCBub2Rlb2ZmLCBOVUxMKSk7CgpmZHRfYmVnaW5fbm9kZSBhc3N1
bWUgdGhlIHNlY29uZCBwYXJhbWV0ZXIgd2lsbCBiZSBub24tTlVMTC4gV2hhdCBpZiAKZmR0X2dl
dF9uYW1lKCkgcmV0dXJucyBOVUxMPwoKPiArICAgIGlmICggcmMgKQo+ICsgICAgICAgIHJldHVy
biByYzsKPiArCj4gKyAgICByYyA9IGhhbmRsZV9wcm9wZXJ0aWVzKGtpbmZvLT5kLCBmZHQsIHBm
ZHQsIG5vZGVvZmYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGFkZHJlc3NfY2VsbHMs
IHNpemVfY2VsbHMpOwo+ICsgICAgaWYgKCByYyApCj4gKyAgICAgICAgcmV0dXJuIHJjOwo+ICsK
PiArICAgIG5vZGVfbmV4dCA9IGZkdF9uZXh0X25vZGUocGZkdCwgbm9kZW9mZiwgJmRlcHRoX25l
eHQpOwoKV2hhdCBpZiBub2RlX25leHQgaXMgaW52YWxpZCAoaS5lIGJlY2F1c2UgaXQgaXMgbmVn
YXRpdmUpPwoKPiArCj4gKyAgICAvKgo+ICsgICAgICogSWYgdGhlIG5leHQgbm9kZSBpcyBhIHNp
YmxpbmcsIHRoZW4gd2UgbmVlZCB0byBjYWxsCj4gKyAgICAgKiBmZHRfZW5kX25vZGUgb25jZS4g
SWYgdGhlIG5leHQgbm9kZSBpcyBvbmUgbGV2ZWwgdXAsIHdlIG5lZWQgdG8KPiArICAgICAqIGNh
bGwgaXQgdHdpY2U6IG9uY2UgZm9yIHVzIGFuZCB0aGUgc2Vjb25kIHRpbWUgZm9yIG91ciBwYXJl
bnQuCj4gKyAgICAgKiBCb3RoIHRoZXNlIHR3byBjb25kaXRpb25zIGFyZSBleHByZXNzZWQgdG9n
ZXRoZXIgYnkgZGVwdGggLQo+ICsgICAgICogZGVwdGhfbmV4dCArIDEuCj4gKyAgICAgKgo+ICsg
ICAgICogSWYgd2UgcmVhY2hlZCB0aGUgZW5kIG9mIHRoZSBkZXZpY2UgdHJlZSBmcmFnbWVudCwg
dGhlbiBpdCBpcwo+ICsgICAgICogZWFzeTogd2UgbmVlZCB0byBjYWxsIGZkdF9lbmRfbm9kZSBv
bmNlIGZvciBldmVyeSBsZXZlbCBvZiBkZXB0aAo+ICsgICAgICogdG8gY2xvc2UgYWxsIG9wZW4g
bm9kZXMuCj4gKyAgICAgKi8KPiArICAgIGlmICggZGVwdGhfbmV4dCA8IDAgKQo+ICsgICAgICAg
IG51bSA9IGRlcHRoOwo+ICsgICAgZWxzZQo+ICsgICAgICAgIG51bSA9IGRlcHRoIC0gZGVwdGhf
bmV4dCArIDE7Cj4gKwo+ICsgICAgZm9yICggaSA9IDA7IGkgPCBudW07IGkrKyApCj4gKyAgICB7
Cj4gKyAgICAgICAgcmMgPSBmZHRfZW5kX25vZGUoZmR0KTsKPiArICAgICAgICBpZiAoIHJjICkK
PiArICAgICAgICAgICAgcmV0dXJuIHJjOwo+ICsgICAgfQoKQWxsIHRoaXMgY29kZSBpcyBhIGJp
dCBjb21wbGljYXRlZCBiZWNhdXNlIHlvdSBkZWNpZGVkIHRvIHVzZSAKZHRfdHJlZV9mb3JfZWFj
aF9ub2RlIHRoYXQgaXMgbm90IHJlYWxseSBzdWl0YWJsZSBoZXJlLiBJdCB3b3VsZCBiZSAKcG9z
c2libGUgdG8gdXNlIHJlY3Vyc2lvbiBhcyB3ZSBkaWQgZm9yIHRoZSBkb20wIERUIHRoYW5rcyB0
byAKZmR0X2ZpcnN0X3N1Ym5vZGUsIGZkdF9uZXh0X3N1Ym5vZGUuCgpTb21ldGhpbmcgbGlrZToK
CmhhbmRsZV9ub2RlCnsKICAgICAgZmR0X2JlZ2luX25vZGUoLi4uLik7CiAgICAgIHdyaXRlX3By
b3BlcnRpZXMoLi4uKTsKICAgICAgbm9kZSA9IGZkdF9maXJzdF9zdWJub2RlKC4uLik7CgogICAg
ICB3aGlsZSAoIG5vZGUgPiAwICkKICAgICAgewogICAgICAgICAgIGhhbmRsZV9ub2RlKG5vZGUu
Li4pOwogICAgICAgICAgIG5vZGUgPSBmZHRfbmV4dF9zdWJub2RlKC4uLik7CiAgICAgIH0KICAg
ICAgZmR0X2VuZF9ub2RlKC4uLi4pOwp9Cgo+ICsKPiArICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+
ICtzdGF0aWMgaW50IF9faW5pdCBkb21haW5faGFuZGxlX2R0Yl9ib290bW9kdWxlKHN0cnVjdCBk
b21haW4gKmQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiArewo+ICsgICAgdm9pZCAqcGZkdDsKPiAr
ICAgIGludCByZXM7Cj4gKwo+ICsgICAgcGZkdCA9IGlvcmVtYXBfY2FjaGUoa2luZm8tPmR0Yl9i
b290bW9kdWxlLT5zdGFydCwKPiArICAgICAgICAgICAga2luZm8tPmR0Yl9ib290bW9kdWxlLT5z
aXplKTsKCkluZGVudGF0aW9uLgoKPiArICAgIGlmICggcGZkdCA9PSBOVUxMICkKPiArICAgICAg
ICByZXR1cm4gLUVGQVVMVDsKPiArCj4gKyAgICByZXMgPSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9u
b2RlKHBmZHQsIHNjYW5fcHRfbm9kZSwga2luZm8pOwo+ICsKPiArICAgIGlvdW5tYXAocGZkdCk7
Cj4gKwo+ICsgICAgcmV0dXJuIHJlczsKPiArfQo+ICsKPiAgIC8qCj4gICAgKiBUaGUgbWF4IHNp
emUgZm9yIERUIGlzIDJNQi4gSG93ZXZlciwgdGhlIGdlbmVyYXRlZCBEVCBpcyBzbWFsbCwgNEtC
Cj4gICAgKiBhcmUgZW5vdWdoIGZvciBub3csIGJ1dCB3ZSBtaWdodCBoYXZlIHRvIGluY3JlYXNl
IGl0IGluIHRoZSBmdXR1cmUuCj4gQEAgLTE3NzcsNiArMTg3NCwxMiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBwcmVwYXJlX2R0Yl9kb21VKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5m
byAqa2luZm8pCj4gICAgICAgICAgICAgICBnb3RvIGVycjsKPiAgICAgICB9Cj4gICAKPiArICAg
IGlmICgga2luZm8tPmR0Yl9ib290bW9kdWxlICkgewo+ICsgICAgICAgIHJldCA9IGRvbWFpbl9o
YW5kbGVfZHRiX2Jvb3Rtb2R1bGUoZCwga2luZm8pOwo+ICsgICAgICAgIGlmICggcmV0ICkKPiAr
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgIH0KPiArCj4gICAgICAgcmV0ID0gZmR0X2Vu
ZF9ub2RlKGtpbmZvLT5mZHQpOwo+ICAgICAgIGlmICggcmV0IDwgMCApCj4gICAgICAgICAgIGdv
dG8gZXJyOwo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+IGluZGV4IDMzZjNlNzJiMTEuLjcyMGRlYzQwNzEg
MTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0va2VybmVsLmgKPiBAQCAtMjgsNyArMjgsNyBAQCBzdHJ1Y3Qga2VybmVs
X2luZm8gewo+ICAgICAgIHBhZGRyX3QgZ250dGFiX3NpemU7Cj4gICAKPiAgICAgICAvKiBib290
IGJsb2IgbG9hZCBhZGRyZXNzZXMgKi8KPiAtICAgIGNvbnN0IHN0cnVjdCBib290bW9kdWxlICpr
ZXJuZWxfYm9vdG1vZHVsZSwgKmluaXRyZF9ib290bW9kdWxlOwo+ICsgICAgY29uc3Qgc3RydWN0
IGJvb3Rtb2R1bGUgKmtlcm5lbF9ib290bW9kdWxlLCAqaW5pdHJkX2Jvb3Rtb2R1bGUsICpkdGJf
Ym9vdG1vZHVsZTsKPiAgICAgICBjb25zdCBjaGFyKiBjbWRsaW5lOwo+ICAgICAgIHBhZGRyX3Qg
ZHRiX3BhZGRyOwo+ICAgICAgIHBhZGRyX3QgaW5pdHJkX3BhZGRyOwo+IAoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
