Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F295126
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 00:50:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzqRS-0001oo-7k; Mon, 19 Aug 2019 22:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzqRQ-0001oj-Hh
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 22:47:56 +0000
X-Inumbo-ID: 61f94ce0-c2d3-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61f94ce0-c2d3-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 22:47:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D12D2070B;
 Mon, 19 Aug 2019 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566254874;
 bh=fIeigmeK7gyIiUD3PLHORZfBZYnWksgQscMjh0rttsM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=d2WVTKYIw2DYKTJeyOOPFxlhdDBgcPGnjLtqUSYZBlBOkv85VVF8FbQn9I/5vzjZf
 +enEYFGEvsYO7kYOPvjQlOj8Kd8sK3ERxVp51SghRJOdoPsB/kHMEMYtP9435/ZJbi
 VqEXfYnaUbznUTCKr0pG/ZtakrvGN20wAlJDj9GE=
Date: Mon, 19 Aug 2019 15:47:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <d68be6b4-1b09-03b3-6797-fa0e8fcdbb69@arm.com>
Message-ID: <alpine.DEB.2.21.1908191538000.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-2-sstabellini@kernel.org>
 <d68be6b4-1b09-03b3-6797-fa0e8fcdbb69@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gOC85LzE5IDEyOjEy
IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBSZWFkIHRoZSBkdGIgZnJhZ21lbnQg
Y29ycmVzcG9uZGluZyB0byBhIHBhc3N0aHJvdWdoIGRldmljZSBmcm9tIG1lbW9yeQo+ID4gYXQg
dGhlIGxvY2F0aW9uIHJlZmVycmVkIHRvIGJ5IHRoZSAibXVsdGlib290LGR0YiIgY29tcGF0aWJs
ZSBub2RlLgo+ID4gCj4gPiBDb3B5IHRoZSBmcmFnbWVudCB0byB0aGUgZ3Vlc3QgZHRiLgo+ID4g
Cj4gPiBBZGQgYSBkdGJfYm9vdG1vZHVsZSBmaWVsZCB0byBzdHJ1Y3Qga2VybmVsX2luZm8gdG8g
ZmluZCB0aGUgZHRiCj4gPiBmcmFnbWVudCBmb3IgYSBndWVzdC4KPiA+IAo+ID4gU29tZSBvZiB0
aGUgY29kZSBiZWxvdyBpcyB0YWtlbiBmcm9tIHRvb2xzL2xpYnhsL2xpYnhsX2FybS5jLiBOb3Rl
IHRoYXQKPiA+IGl0IGlzIE9LIHRvIHRha2UgTEdQTCAyLjEgY29kZSBhbmQgaW5jbHVkaW5nIGl0
IGludG8gYSBHUEx2MiBjb2RlIGJhc2UuCj4gPiBUaGUgcmVzdWx0IGlzIEdQTHYyIGNvZGUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54
LmNvbT4KPiA+IAo+ID4gLS0tLQo+ID4gQ2hhbmdlcyBpbiB2MzoKPiA+IC0gc3dpdGNoIHRvIHVz
aW5nIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUgZm9yIHRoZSBjb3B5Cj4gPiAKPiA+IENoYW5n
ZXMgaW4gdjI6Cj4gPiAtIGFkZCBhIG5vdGUgYWJvdXQgdGhlIGNvZGUgY29taW5nIGZyb20gbGli
eGwgaW4gdGhlIGNvbW1pdCBtZXNzYWdlCj4gPiAtIGNvcHkgL2FsaWFzZXMKPiA+IC0gY29kZSBz
dHlsZQo+ID4gLS0tCj4gPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgfCAxMDMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgeGVuL2luY2x1ZGUvYXNtLWFy
bS9rZXJuZWwuaCB8ICAgMiArLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEwNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IGluZGV4IDAwZGRi
M2IwNWQuLjcwYmNkYzQ0OWQgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ID4gQEAgLTE0LDYg
KzE0LDcgQEAKPiA+ICAgI2luY2x1ZGUgPHhlbi9ndWVzdF9hY2Nlc3MuaD4KPiA+ICAgI2luY2x1
ZGUgPHhlbi9pb2NhcC5oPgo+ID4gICAjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPiA+ICsjaW5jbHVk
ZSA8eGVuL3ZtYXAuaD4KPiA+ICAgI2luY2x1ZGUgPHhlbi93YXJuaW5nLmg+Cj4gPiAgICNpbmNs
dWRlIDxhY3BpL2FjdGFibGVzLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vZGV2aWNlLmg+Cj4gPiBA
QCAtMTcwNiw2ICsxNzA3LDEwMiBAQCBzdGF0aWMgaW50IF9faW5pdCBtYWtlX3ZwbDAxMV91YXJ0
X25vZGUoY29uc3Qgc3RydWN0Cj4gPiBkb21haW4gKmQsIHZvaWQgKmZkdCkKPiA+ICAgfQo+ID4g
ICAjZW5kaWYKPiA+ICAgK3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9wcm9wZXJ0aWVzKHN0cnVj
dCBkb21haW4gKmQsIHZvaWQgKmZkdCwgY29uc3QKPiA+IHZvaWQgKnBmZHQsIGludCBub2Rlb2Zm
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBhZGRyZXNzX2Nl
bGxzLCB1MzIgc2l6ZV9jZWxscykKPiAKPiBTbyBpbiB0aGlzIGZpbGUgd2UgYWxyZWFkeSBoYXZl
IGEgZnVuY3Rpb24gY2FsbCB3cml0ZV9wcm9wZXJ0aWVzLiBIb3cgYSB1c2VyCj4gd2lsbCBrbm93
IHdoaWNoIG9uZSB0byB1c2U/CgpJIGhhdmUgcmVuYW1lZCBoYW5kbGVfcHJvcGVydGllcyB0byBo
YW5kbGVfcHJvcF9wZmR0LCB0byBtYWtlIGl0IGNsZWFyCnRoYXQgdGhpcyBvbmUgaXMgc3BlY2lm
aWMgdG8gcGFydGlhbCBkZXZpY2UgdHJlZSBmcmFnbWVudHMuCgoKPiBJdCBpcyBhbHNvIG5vdCBl
bnRpcmVseSBjbGVhciBmcm9tIHRoZXJlIHZhcmlhYmxlIG5hbWUgd2hhdCBpcyB0aGUgZGlmZmVy
ZW5jZQo+IGJldHdlZW4gZmR0IGFuZCBwZmR0LgoKSSBoYXZlIGNsYXJpZmllZCBhbmQgcmVkdWNl
ZCB0aGUgbGlzdCBvZiBwYXJhbWV0ZXJzIGJ5IHBhc3NpbmcgYSBraW5mbwppbnN0ZWFkIG9mIGRv
bWFpbiBhbmQgZmR0IHNlcGFyYXRlbHkuCgoKPiBBbHNvLCBubyBtb3JlIHUzMiBpbiB0aGUgY29k
ZSBwbGVhc2UuIFRoaXMgaXMgbm93IHBhcnQgb2YgdGhlIENPRElOR19TVFlMRS4KCkludGVyZXN0
aW5nLCBJIGhhdmVuJ3QgYmVlbiBmb2xsb3dpbmcuIFNob3VsZCBJIHVzZSB1aW50MzJfdD8gV2hh
dCdzIHRoZQpyZWNvbW1lbmRlZCBwcmFjdGljZSBmb3IgZml4ZWQgc2l6ZWQgaW50ZWdlcnMgbm93
PwoKIAo+ID4gK3sKPiA+ICsgICAgaW50IHByb3BvZmYsIG5hbWVvZmYsIHI7Cj4gCj4gUGxlYXNl
IG5vIHNpbmdsZSBsZXR0ZXIgdmFyaWFibGUgdW5sZXNzIHRoaXMgaXMgb2J2aW91cyB0byB1bmRl
cnN0YW5kIChzdWNoIGFzCj4gaSwgaiBmb3IgaXRlcmF0aW9uKS4gVGhpcyBzaG91bGQgYmUgcmV0
LCByYyBvciByZXMuCj4gCj4gTm90ZSB0aGF0IHNvbWVob3cgeW91IGFyZSB1c2luZyB0aGUgMyBv
ZiB0aGVtIGluIHRoZSBzYW1lIHBhdGNoZXMuLi4gSSBhbSBub3QKPiBnb2luZyB0byBhc2sgZm9y
IGNvbnNpc3RlbmN5IHRob3VnaHQuCgpPSwoKIAo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZmR0X3By
b3BlcnR5ICpwcm9wOwo+ID4gKwo+ID4gKyAgICBmb3IgKCBwcm9wb2ZmID0gZmR0X2ZpcnN0X3By
b3BlcnR5X29mZnNldChwZmR0LCBub2Rlb2ZmKTsKPiA+ICsgICAgICAgICAgcHJvcG9mZiA+PSAw
Owo+ID4gKyAgICAgICAgICBwcm9wb2ZmID0gZmR0X25leHRfcHJvcGVydHlfb2Zmc2V0KHBmZHQs
IHByb3BvZmYpICkKPiA+ICsgICAgewo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCAhKHByb3AgPSBm
ZHRfZ2V0X3Byb3BlcnR5X2J5X29mZnNldChwZmR0LCBwcm9wb2ZmLCBOVUxMKSkgKQo+ID4gKyAg
ICAgICAgICAgIHJldHVybiAtRkRUX0VSUl9JTlRFUk5BTDsKPiA+ICsKPiA+ICsgICAgICAgIG5h
bWVvZmYgPSBmZHQzMl90b19jcHUocHJvcC0+bmFtZW9mZik7Cj4gPiArICAgICAgICByID0gZmR0
X3Byb3BlcnR5KGZkdCwgZmR0X3N0cmluZyhwZmR0LCBuYW1lb2ZmKSwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJvcC0+ZGF0YSwgZmR0MzJfdG9fY3B1KHByb3AtPmxlbikpOwo+ID4g
KyAgICAgICAgaWYgKCByICkKPiA+ICsgICAgICAgICAgICByZXR1cm4gcjsKPiA+ICsgICAgfQo+
ID4gKwo+ID4gKyAgICAvKiBGRFRfRVJSX05PVEZPVU5EID0+IFRoZXJlIGlzIG5vIG1vcmUgcHJv
cGVydGllcyBmb3IgdGhpcyBub2RlICovCj4gPiArICAgIHJldHVybiAoIHByb3BvZmYgIT0gLUZE
VF9FUlJfTk9URk9VTkQgKSA/IHByb3BvZmYgOiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMg
aW50IF9faW5pdCBzY2FuX3B0X25vZGUoY29uc3Qgdm9pZCAqcGZkdCwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaW50IG5vZGVvZmYsIGNvbnN0IGNoYXIgKm5hbWUsIGludCBk
ZXB0aCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGFkZHJlc3NfY2Vs
bHMsIHUzMiBzaXplX2NlbGxzLAo+IAo+IFNhbWUgaGVyZS4KPgo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+ID4gK3sKPiA+ICsgICAgaW50IHJjOwo+ID4g
KyAgICBpbnQgaSwgbnVtOwo+IAo+IEFueXRoaW5nIHRoYXQgY2FuJ3QgYmUgbmVnYXRpdmUsIHNo
b3VsZCBiZSB1bnNpZ25lZC4KCk9LCgoKPiA+ICsgICAgc3RydWN0IGtlcm5lbF9pbmZvICpraW5m
byA9IGRhdGE7Cj4gPiArICAgIHZvaWQgKmZkdCA9IGtpbmZvLT5mZHQ7Cj4gPiArICAgIGludCBk
ZXB0aF9uZXh0ID0gZGVwdGg7Cj4gPiArICAgIGludCBub2RlX25leHQ7Cj4gPiArCj4gPiArICAg
IC8qIG5vIG5lZWQgdG8gcGFyc2UgaW5pdGlhbCBub2RlICovCj4gPiArICAgIGlmICggIWRlcHRo
ICkKPiA+ICsgICAgICAgIHJldHVybiAwOwo+IAo+IFNvIHRoaXMgaXMgZ29pbmcgdG8gY29weSB3
aGF0IGV2ZXIgaXMgaW4gdGhlIHBhcnRpYWwgZGV2aWNlLXRyZWUuIEluIG90aGVyCj4gd29yZCwg
dGhlIHVzZXJzIGNhbiBvdmVycmlkZSBwcmV0dHkgbXVjaCBhbnl0aGluZyB0aGF0IFhlbiBjcmVh
dGVkLiBJIGRvbid0Cj4gdGhpbmsgdGhpcyBpcyB3aGF0IHdlIHdhbnQuCj4gCj4gSW5zdGVhZCwg
d2Ugc2hvdWxkIG9ubHkgY29weSBub2RlcyB1bmRlciAvcGFzc3Rocm91Z2ggYW5kIGFsc28gdGhl
IC9hbGlhc2VzLgoKVmVyeSBnb29kIHBvaW50ISBJJ2xsIGZpeCBpdC4KCgo+ID4gKwo+ID4gKyAg
ICByYyA9IGZkdF9iZWdpbl9ub2RlKGZkdCwgZmR0X2dldF9uYW1lKHBmZHQsIG5vZGVvZmYsIE5V
TEwpKTsKPiAKPiBmZHRfYmVnaW5fbm9kZSBhc3N1bWUgdGhlIHNlY29uZCBwYXJhbWV0ZXIgd2ls
bCBiZSBub24tTlVMTC4gV2hhdCBpZgo+IGZkdF9nZXRfbmFtZSgpIHJldHVybnMgTlVMTD8KCkkn
bGwgYWRkIGEgY2hlY2suCgoKPiA+ICsgICAgaWYgKCByYyApCj4gPiArICAgICAgICByZXR1cm4g
cmM7Cj4gPiArCj4gPiArICAgIHJjID0gaGFuZGxlX3Byb3BlcnRpZXMoa2luZm8tPmQsIGZkdCwg
cGZkdCwgbm9kZW9mZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2Nl
bGxzLCBzaXplX2NlbGxzKTsKPiA+ICsgICAgaWYgKCByYyApCj4gPiArICAgICAgICByZXR1cm4g
cmM7Cj4gPiArCj4gPiArICAgIG5vZGVfbmV4dCA9IGZkdF9uZXh0X25vZGUocGZkdCwgbm9kZW9m
ZiwgJmRlcHRoX25leHQpOwo+IAo+IFdoYXQgaWYgbm9kZV9uZXh0IGlzIGludmFsaWQgKGkuZSBi
ZWNhdXNlIGl0IGlzIG5lZ2F0aXZlKT8KClRoaXMgZ29lcyBhd2F5IHdpdGggdGhlIGNoYW5nZSBk
ZXNjcmliZWQgYmVsb3cuCgoKPiA+ICsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogSWYgdGhlIG5l
eHQgbm9kZSBpcyBhIHNpYmxpbmcsIHRoZW4gd2UgbmVlZCB0byBjYWxsCj4gPiArICAgICAqIGZk
dF9lbmRfbm9kZSBvbmNlLiBJZiB0aGUgbmV4dCBub2RlIGlzIG9uZSBsZXZlbCB1cCwgd2UgbmVl
ZCB0bwo+ID4gKyAgICAgKiBjYWxsIGl0IHR3aWNlOiBvbmNlIGZvciB1cyBhbmQgdGhlIHNlY29u
ZCB0aW1lIGZvciBvdXIgcGFyZW50Lgo+ID4gKyAgICAgKiBCb3RoIHRoZXNlIHR3byBjb25kaXRp
b25zIGFyZSBleHByZXNzZWQgdG9nZXRoZXIgYnkgZGVwdGggLQo+ID4gKyAgICAgKiBkZXB0aF9u
ZXh0ICsgMS4KPiA+ICsgICAgICoKPiA+ICsgICAgICogSWYgd2UgcmVhY2hlZCB0aGUgZW5kIG9m
IHRoZSBkZXZpY2UgdHJlZSBmcmFnbWVudCwgdGhlbiBpdCBpcwo+ID4gKyAgICAgKiBlYXN5OiB3
ZSBuZWVkIHRvIGNhbGwgZmR0X2VuZF9ub2RlIG9uY2UgZm9yIGV2ZXJ5IGxldmVsIG9mIGRlcHRo
Cj4gPiArICAgICAqIHRvIGNsb3NlIGFsbCBvcGVuIG5vZGVzLgo+ID4gKyAgICAgKi8KPiA+ICsg
ICAgaWYgKCBkZXB0aF9uZXh0IDwgMCApCj4gPiArICAgICAgICBudW0gPSBkZXB0aDsKPiA+ICsg
ICAgZWxzZQo+ID4gKyAgICAgICAgbnVtID0gZGVwdGggLSBkZXB0aF9uZXh0ICsgMTsKPiA+ICsK
PiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBudW07IGkrKyApCj4gPiArICAgIHsKPiA+ICsgICAg
ICAgIHJjID0gZmR0X2VuZF9ub2RlKGZkdCk7Cj4gPiArICAgICAgICBpZiAoIHJjICkKPiA+ICsg
ICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiArICAgIH0KPiAKPiBBbGwgdGhpcyBjb2RlIGlzIGEg
Yml0IGNvbXBsaWNhdGVkIGJlY2F1c2UgeW91IGRlY2lkZWQgdG8gdXNlCj4gZHRfdHJlZV9mb3Jf
ZWFjaF9ub2RlIHRoYXQgaXMgbm90IHJlYWxseSBzdWl0YWJsZSBoZXJlLiBJdCB3b3VsZCBiZSBw
b3NzaWJsZQo+IHRvIHVzZSByZWN1cnNpb24gYXMgd2UgZGlkIGZvciB0aGUgZG9tMCBEVCB0aGFu
a3MgdG8gZmR0X2ZpcnN0X3N1Ym5vZGUsCj4gZmR0X25leHRfc3Vibm9kZS4KPiAKPiBTb21ldGhp
bmcgbGlrZToKPiAKPiBoYW5kbGVfbm9kZQo+IHsKPiAgICAgIGZkdF9iZWdpbl9ub2RlKC4uLi4p
Owo+ICAgICAgd3JpdGVfcHJvcGVydGllcyguLi4pOwo+ICAgICAgbm9kZSA9IGZkdF9maXJzdF9z
dWJub2RlKC4uLik7Cj4gCj4gICAgICB3aGlsZSAoIG5vZGUgPiAwICkKPiAgICAgIHsKPiAgICAg
ICAgICAgaGFuZGxlX25vZGUobm9kZS4uLik7Cj4gICAgICAgICAgIG5vZGUgPSBmZHRfbmV4dF9z
dWJub2RlKC4uLik7Cj4gICAgICB9Cj4gICAgICBmZHRfZW5kX25vZGUoLi4uLik7Cj4gfQoKWWVz
LCBJIGhhdmUgZm9sbG93ZWQgeW91ciBzdWdnZXN0aW9uLCBhbmQgSSBoYXZlIG5vdyBhIHJlY3Vy
c2l2ZQppbXBsZW1lbnRhdGlvbiB3aXRob3V0IGFueSBjYWxscyB0byBkdF90cmVlX2Zvcl9lYWNo
X25vZGUsIHZlcnkgc2ltaWxhcgp0byB0aGUgb25lIHlvdSBkZXNjcmliZWQgaGVyZS4KCgo+ID4g
Kwo+ID4gKyAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBfX2luaXQg
ZG9tYWluX2hhbmRsZV9kdGJfYm9vdG1vZHVsZShzdHJ1Y3QgZG9tYWluICpkLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGtlcm5lbF9p
bmZvICpraW5mbykKPiA+ICt7Cj4gPiArICAgIHZvaWQgKnBmZHQ7Cj4gPiArICAgIGludCByZXM7
Cj4gPiArCj4gPiArICAgIHBmZHQgPSBpb3JlbWFwX2NhY2hlKGtpbmZvLT5kdGJfYm9vdG1vZHVs
ZS0+c3RhcnQsCj4gPiArICAgICAgICAgICAga2luZm8tPmR0Yl9ib290bW9kdWxlLT5zaXplKTsK
PiAKPiBJbmRlbnRhdGlvbi4KCk9LCgoKPiA+ICsgICAgaWYgKCBwZmR0ID09IE5VTEwgKQo+ID4g
KyAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4gPiArCj4gPiArICAgIHJlcyA9IGRldmljZV90cmVl
X2Zvcl9lYWNoX25vZGUocGZkdCwgc2Nhbl9wdF9ub2RlLCBraW5mbyk7Cj4gPiArCj4gPiArICAg
IGlvdW5tYXAocGZkdCk7Cj4gPiArCj4gPiArICAgIHJldHVybiByZXM7Cj4gPiArfQo+ID4gKwo+
ID4gICAvKgo+ID4gICAgKiBUaGUgbWF4IHNpemUgZm9yIERUIGlzIDJNQi4gSG93ZXZlciwgdGhl
IGdlbmVyYXRlZCBEVCBpcyBzbWFsbCwgNEtCCj4gPiAgICAqIGFyZSBlbm91Z2ggZm9yIG5vdywg
YnV0IHdlIG1pZ2h0IGhhdmUgdG8gaW5jcmVhc2UgaXQgaW4gdGhlIGZ1dHVyZS4KPiA+IEBAIC0x
Nzc3LDYgKzE4NzQsMTIgQEAgc3RhdGljIGludCBfX2luaXQgcHJlcGFyZV9kdGJfZG9tVShzdHJ1
Y3QgZG9tYWluICpkLAo+ID4gc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiA+ICAgICAgICAg
ICAgICAgZ290byBlcnI7Cj4gPiAgICAgICB9Cj4gPiAgICsgICAgaWYgKCBraW5mby0+ZHRiX2Jv
b3Rtb2R1bGUgKSB7Cj4gPiArICAgICAgICByZXQgPSBkb21haW5faGFuZGxlX2R0Yl9ib290bW9k
dWxlKGQsIGtpbmZvKTsKPiA+ICsgICAgICAgIGlmICggcmV0ICkKPiA+ICsgICAgICAgICAgICBy
ZXR1cm4gcmV0Owo+ID4gKyAgICB9Cj4gPiArCj4gPiAgICAgICByZXQgPSBmZHRfZW5kX25vZGUo
a2luZm8tPmZkdCk7Cj4gPiAgICAgICBpZiAoIHJldCA8IDAgKQo+ID4gICAgICAgICAgIGdvdG8g
ZXJyOwo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVsLmggYi94ZW4v
aW5jbHVkZS9hc20tYXJtL2tlcm5lbC5oCj4gPiBpbmRleCAzM2YzZTcyYjExLi43MjBkZWM0MDcx
IDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+ID4gKysrIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9rZXJuZWwuaAo+ID4gQEAgLTI4LDcgKzI4LDcgQEAgc3RydWN0
IGtlcm5lbF9pbmZvIHsKPiA+ICAgICAgIHBhZGRyX3QgZ250dGFiX3NpemU7Cj4gPiAgICAgICAg
IC8qIGJvb3QgYmxvYiBsb2FkIGFkZHJlc3NlcyAqLwo+ID4gLSAgICBjb25zdCBzdHJ1Y3QgYm9v
dG1vZHVsZSAqa2VybmVsX2Jvb3Rtb2R1bGUsICppbml0cmRfYm9vdG1vZHVsZTsKPiA+ICsgICAg
Y29uc3Qgc3RydWN0IGJvb3Rtb2R1bGUgKmtlcm5lbF9ib290bW9kdWxlLCAqaW5pdHJkX2Jvb3Rt
b2R1bGUsCj4gPiAqZHRiX2Jvb3Rtb2R1bGU7Cj4gPiAgICAgICBjb25zdCBjaGFyKiBjbWRsaW5l
Owo+ID4gICAgICAgcGFkZHJfdCBkdGJfcGFkZHI7Cj4gPiAgICAgICBwYWRkcl90IGluaXRyZF9w
YWRkcjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
