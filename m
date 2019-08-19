Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7579519E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 01:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzqxN-000556-Hl; Mon, 19 Aug 2019 23:20:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzqxL-000551-VF
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 23:20:55 +0000
X-Inumbo-ID: fe4397d2-c2d7-11e9-8bf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe4397d2-c2d7-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 23:20:55 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CB1C205F4;
 Mon, 19 Aug 2019 23:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566256854;
 bh=VkqC8Fs87KR2AFrW/zBjrAZfd1JbOsFqldPdoleRJAI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZM4UsIPWsvOYrP8BXQWCms5xIFZ4wq3ePSL8PjN7HD505mE5Y6zpmZPJ89lSI8VtQ
 UIS0I6q3p43g9/UnSU6/H7LN6k8aCa2LtpUdwq7SlQUaIXmhVTYTZHuKuknZfz2Lm0
 u1rOcaBEBAsEQJk5RX1+fbTT+0c4L6Dkv77lFJJo=
Date: Mon, 19 Aug 2019 16:20:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <17051895-1517-94b5-7ab9-4fb802251d8f@arm.com>
Message-ID: <alpine.DEB.2.21.1908191552270.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908081609510.22196@sstabellini-ThinkPad-T480s>
 <20190808231242.26424-3-sstabellini@kernel.org>
 <17051895-1517-94b5-7ab9-4fb802251d8f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 3/6] xen/arm: assign devices to boot
 domains
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

T24gRnJpLCA5IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiA4LzkvMTkgMTI6MTIgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IFNjYW4g
dGhlIHVzZXIgcHJvdmlkZWQgZHRiIGZyYWdtZW50IGF0IGJvb3QuIEZvciBlYWNoIGRldmljZSBu
b2RlLCBtYXAKPiA+IG1lbW9yeSB0byBndWVzdHMsIGFuZCByb3V0ZSBpbnRlcnJ1cHRzIGFuZCBz
ZXR1cCB0aGUgaW9tbXUuCj4gPiAKPiA+IFRoZSBpb21tdSBpcyBzZXR1cCBieSBwYXNzaW5nIHRo
ZSBub2RlIG9mIHRoZSBkZXZpY2UgdG8gYXNzaWduIG9uIHRoZQo+ID4gaG9zdCBkZXZpY2UgdHJl
ZS4gVGhlIHBhdGggaXMgc3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJlZSBmcmFnbWVudCBhcwo+
ID4gdGhlICJ4ZW4scGF0aCIgc3RyaW5nIHByb3BlcnR5Lgo+ID4gCj4gPiBUaGUgbWVtb3J5IHJl
Z2lvbiB0byByZW1hcCBpcyBzcGVjaWZpZWQgYnkgdGhlICJ4ZW4scmVnIiBwcm9wZXJ0eS4KPiA+
IChQZXJoYXBzIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHVzZSAicmFuZ2UiIGluc3RlYWQgb2Yg
InhlbixyZWdzIi4gVGhpcwo+IAo+IHMveGVuLHJlZ3MveGVuLHJlZy8KPiAKPiBCdXQgSSBkb24n
dCBzZWUgaG93IHlvdSBjb3VsZCB1c2UgcmFuZ2UgaGVyZS4uLiBUaGlzIGlzIGZvciB0cmFuc2xh
dGlvbgo+IGFkZHJlc3MgYmV0d2VlbiB0d28gYWRkcmVzcy1zcGFjZS4KCkknbGwgcmVtb3ZlIHRo
ZSBjb21tZW50CgoKPiA+IGlzIHNvbWV0aGluZyB0byBpbnZlc3RpZ2F0ZS4pCj4gPiAKPiA+IFRo
ZSBpbnRlcnJ1cHRzIGFyZSB0YWtlbiBmcm9tIHRoZSBob3N0IGRldmljZSB0cmVlIGNvcnJlc3Bv
bmRpbmcgbm9kZS4KPiA+IFRvIG1hcCB0aGUgaW50ZXJydXB0IGNhbGwgaGFuZGxlX2ludGVycnVw
dHMsIHdoaWNoIGlzIHNoYXJlZCB3aXRoIHRoZQo+ID4gZXhpc3RpbmcgZG9tMCBwYXRoLgo+ID4g
Cj4gPiBBZGQgYSBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGF1dG9tYXRpY2FsbHkgdG8gdGhl
IGd1ZXN0IGRldmljZSB0cmVlCj4gPiB3aGVuIHRoZSBpbnRlcnJ1cHQtcGFyZW50IHNob3VsZCBi
ZSB0aGUgR0lDLiBDb3B5IG92ZXIgdGhlIGludGVycnVwdAo+ID4gcHJvcGVydHkgZnJvbSB0aGUg
aG9zdCBkZXZpY2UgdHJlZSBub2RlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6
Cj4gPiAtIGltcHJvdmUgY29tbWl0IG1lc3NhZ2UKPiA+IC0gcmVtb3ZlIHN1cGVyZmx1b3VzIGNh
c3QKPiA+IC0gbWVyZ2UgY29kZSB3aXRoIHRoZSBjb3B5IGNvZGUKPiA+IC0gYWRkIGludGVycnVw
LXBhcmVudAo+ID4gLSBkZW1vdmUgZGVwdGggPiAyIGNoZWNrCj4gPiAtIHJldXNlIGNvZGUgZnJv
bSBoYW5kbGVfaW50ZXJydXB0cwo+ID4gLSBjb3B5IGludGVycnVwdHMgZnJvbSBob3N0IGR0Cj4g
PiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIHJlbmFtZSAicGF0aCIgdG8gInhlbixwYXRoIgo+
ID4gLSBncmFtbWFyIGZpeAo+ID4gLSB1c2UgZ2FkZHJfdG9fZ2ZuIGFuZCBtYWRkcl90b19tZm4K
PiA+IC0gcmVtb3ZlIGRlcHRoIDw9IDIgbGltaXRhdGlvbiBpbiBzY2FubmluZyB0aGUgZHRiIGZy
YWdtZW50Cj4gPiAtIGludHJvZHVjZSBhbmQgcGFyc2UgeGVuLHJlZwo+ID4gLSBjb2RlIHN0eWxl
Cj4gPiAtIHN1cHBvcnQgbW9yZSB0aGFuIG9uZSBpbnRlcnJ1cHQgcGVyIGRldmljZQo+ID4gLSBz
cGVjaWZ5IG9ubHkgdGhlIEdJQyBpcyBzdXBwb3J0ZWQKPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWlu
X2J1aWxkLmMKPiA+IGluZGV4IDcwYmNkYzQ0OWQuLjAwNTdhNTA5ZDEgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYwo+ID4gQEAgLTE3MTIsNiArMTcxMiw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGhh
bmRsZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsCj4gPiB2b2lkICpmZHQsIGNvbnN0IHZv
aWQgKnBmZAo+ID4gICB7Cj4gPiAgICAgICBpbnQgcHJvcG9mZiwgbmFtZW9mZiwgcjsKPiA+ICAg
ICAgIGNvbnN0IHN0cnVjdCBmZHRfcHJvcGVydHkgKnByb3A7Cj4gPiArICAgIHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqbm9kZTsKPiA+ICsgICAgY29uc3QgX19iZTMyICpjZWxsOwo+ID4gKyAgICBp
bnQgaSwgbGVuOwo+IAo+IEFnYWluIGFueSB2YXJpYWJsZSB0aGF0IGNhbid0IGJlIG5lZ2F0aXZl
IHNob3VsZCBiZSB1bnNpZ25lZC4KCk9LCgoKPiA+ICAgICAgICAgZm9yICggcHJvcG9mZiA9IGZk
dF9maXJzdF9wcm9wZXJ0eV9vZmZzZXQocGZkdCwgbm9kZW9mZik7Cj4gPiAgICAgICAgICAgICBw
cm9wb2ZmID49IDA7Cj4gPiBAQCAtMTcyNiw2ICsxNzI5LDY5IEBAIHN0YXRpYyBpbnQgX19pbml0
IGhhbmRsZV9wcm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsCj4gPiB2b2lkICpmZHQsIGNvbnN0
IHZvaWQgKnBmZAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvcC0+ZGF0YSwgZmR0
MzJfdG9fY3B1KHByb3AtPmxlbikpOwo+ID4gICAgICAgICAgIGlmICggciApCj4gPiAgICAgICAg
ICAgICAgIHJldHVybiByOwo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCBzdHJjbXAoInhlbixyZWci
LCBmZHRfc3RyaW5nKHBmZHQsIG5hbWVvZmYpKSA9PSAwICkKPiAKPiBUaGlzIHNob3VsZCBiZSBk
dF9wcm9wX2NtcC4gQnV0IHRoaXMgcHJvcGVydHkgc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBn
dWVzdAo+IERUQiBhZnRlcndhcmRzLgoKR29vZCBwb2ludCEKCgo+IExhc3RseSwgYSBiaXQgb2Yg
ZG9jdW1lbnRhdGlvbiB3b3VsZCBiZSBuaWNlLgoKRG8geW91IG1lYW4gYW4gaW4tY29kZSBjb21t
ZW50LCBvciBhIGRvY3VtZW50IHNvbWV3aGVyZT8KCgo+ID4gKyAgICAgICAgewo+ID4gKyAgICAg
ICAgICAgIHBhZGRyX3QgbXN0YXJ0LCBzaXplLCBnc3RhcnQ7Cj4gPiArICAgICAgICAgICAgY2Vs
bCA9IChjb25zdCBfX2JlMzIgKilwcm9wLT5kYXRhOwo+ID4gKyAgICAgICAgICAgIGxlbiA9IGZk
dDMyX3RvX2NwdShwcm9wLT5sZW4pIC8KPiA+ICsgICAgICAgICAgICAgICAgKChhZGRyZXNzX2Nl
bGxzKjIgKyBzaXplX2NlbGxzKSAqIHNpemVvZiAodTMyKSk7Cj4gPiArCj4gPiArICAgICAgICAg
ICAgZm9yICggaSA9IDA7IGkgPCBsZW47IGkrKyApCj4gPiArICAgICAgICAgICAgewo+ID4gKyAg
ICAgICAgICAgICAgICBtc3RhcnQgPSBkdF9uZXh0X2NlbGwoYWRkcmVzc19jZWxscywgJmNlbGwp
Owo+ID4gKyAgICAgICAgICAgICAgICBzaXplID0gZHRfbmV4dF9jZWxsKHNpemVfY2VsbHMsICZj
ZWxsKTsKPiAKPiBQbGVhc2UgdXNlIGRldmljZV9nZXRfcmVnIGhlcmUuCgpPSyAoZGV2aWNlX3Ry
ZWVfZ2V0X3JlZykKCgo+ID4gKyAgICAgICAgICAgICAgICBnc3RhcnQgPSBkdF9uZXh0X2NlbGwo
YWRkcmVzc19jZWxscywgJmNlbGwpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICByID0gZ3Vl
c3RfcGh5c21hcF9hZGRfZW50cnkoZCwgZ2FkZHJfdG9fZ2ZuKGdzdGFydCksCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgbWFkZHJfdG9fbWZuKG1zdGFydCksCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgZ2V0X29yZGVyX2Zyb21fYnl0ZXMoc2l6ZSksCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgcDJtX21taW9fZGlyZWN0X2Rldik7Cj4gCj4gVGhlIGluZGVudGF0aW9uIGlz
IHdyb25nLgoKSSdsbCBmaXgKCgo+ID4gKyAgICAgICAgICAgICAgICBpZiAoIHIgPCAwICkKPiA+
ICsgICAgICAgICAgICAgICAgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgZHByaW50ayhYRU5M
T0dfRVJSLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIG1hcCAl
IlBSSXBhZGRyIiB0byB0aGUgZ3Vlc3QKPiA+IGF0JSJQUklwYWRkciJcbiIsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG1zdGFydCwgZ3N0YXJ0KTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4gKyAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAg
ICAgICAgfQo+ID4gKyAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgaWYgKCBzdHJjbXAoInhl
bixwYXRoIiwgZmR0X3N0cmluZyhwZmR0LCBuYW1lb2ZmKSkgPT0gMCApCj4gCj4gU2FtZSByZW1h
cmsgYXMgZm9yICJ4ZW4scmVnIi4KCk9LCgoKPiA+ICsgICAgICAgIHsKPiA+ICsgICAgICAgICAg
ICBub2RlID0gZHRfZmluZF9ub2RlX2J5X3BhdGgocHJvcC0+ZGF0YSk7Cj4gPiArICAgICAgICAg
ICAgaWYgKCBub2RlICE9IE5VTEwgKQo+ID4gKyAgICAgICAgICAgICAgICByID0gaW9tbXVfYXNz
aWduX2R0X2RldmljZShkLCBub2RlKTsKPiA+ICsgICAgICAgICAgICBlbHNlCj4gPiArICAgICAg
ICAgICAgewo+ID4gKyAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsICJDb3VsZG4n
dCBmaW5kIG5vZGUgJXMgaW4gaG9zdF9kdCFcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgKGNoYXIgKilwcm9wLT5kYXRhKTsKPiA+ICsgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gPiArICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgIHIgPSBoYW5kbGVf
aW50ZXJydXB0cyhkLCBub2RlLCB0cnVlKTsKPiA+ICsgICAgICAgICAgICBpZiAoIHIgPCAwICkK
PiA+ICsgICAgICAgICAgICAgICAgcmV0dXJuIHI7Cj4gPiArICAgICAgICAgICAgaWYgKCByID4g
MCApCj4gPiArICAgICAgICAgICAgewo+ID4gKyAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
aW50bGVuOwo+ID4gKyAgICAgICAgICAgICAgICBjb25zdCB1MzIqIGludHNwZWM7Cj4gCj4gSSBk
b24ndCB0aGluayB0aGUgY29kZSBiZWxvdyBpcyBjb3JyZWN0LiBGb3IgYSBmaXJzdCwgeW91ciBp
bXBsZW1lbnRhdGlvbiBvZgo+IGhhbmRsZV9pbnRlcnJ1cHRzIGlzIG5vdCByaWdodCAoc2VlIG15
IGNvbW1lbnRzIG9uIHRoZSBwYXRjaCB3aGVyZSB5b3UgYWRkZWQKPiB0aGUgZnVuY3Rpb24pLiBU
aGVuIHlvdSBtYXkgYmUgaGVyZSBldmVuIGlmIG5vIGludGVycnVwdHMgcHJvcGVydHkuIFNvIHRo
ZQo+IGNvZGUgYmVsb3cgd2lsbCBmYWlsIHRvIGNvcHkgdGhvc2Ugbm9kZXMuCgpJIGRvbid0IGdl
dCB0aGUgbGFzdCBzZW50ZW5jZTogIlRoZW4geW91IG1heSBiZSBoZXJlIGV2ZW4gaWYgbm8KaW50
ZXJydXB0cyBwcm9wZXJ0eS4gU28gdGhlIGNvZGUgYmVsb3cgd2lsbCBmYWlsIHRvIGNvcHkgdGhv
c2Ugbm9kZXMuIgpXaHkgdGhlIGNvZGUgd291bGQgZmFpbCB0byBjb3B5IHRob3NlIG5vZGVzPyBX
aGljaCBub2Rlcz8KCgo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAvKiBnZW5lcmF0ZSBpbnRl
cnJ1cHQtcGFyZW50IHRvIHBvaW50IHRvIHRoZSB2aXJ0dWFsIEdJQyAqLwo+ID4gKyAgICAgICAg
ICAgICAgICByID0gZmR0X3Byb3BlcnR5X3UzMihmZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwKPiA+
IEdVRVNUX1BIQU5ETEVfR0lDKTsKPiBGcm9tIHlvdXIgaW1wbGVtZW50YXRpb24gb2YgaGFuZGxl
X2ludGVycnVwdHMoKSwgdGhlcmUgYXJlIG5vIHByb21pc2UgeW91Cj4gd291bGQgYmUgaGVyZSB3
aXRoIGp1c3QgYSBHSUMgaW50ZXJydXB0cy4gWW91IG1heSBhbHNvIG5lZWQgdG8gY29weSBhbnkK
PiBpbnRlcnJ1cHRzIHByb3BlcnR5IGZvciBub2RlIHRoYXQgZG9lcyBub3QgYmVsb25nIHRvIHRo
ZSBHSUMuCgpMZXQncyBzYXkgdGhhdCB3ZSBoYXZlIGEgbWl4IG9mIEdJQyBhbmQgbm9uLUdJQyBp
bnRlcnJ1cHRzIGF0IHRoZSBub2RlCndpdGggeGVuLHBhdGggYW5kIHhlbixyZWcuIExldCdzIGFs
c28gc2F5IHRoYXQgd2UgYXJlIGluIGEgcmVndWxhcgppbnRlcnJ1cHQtcGFyZW50L2ludGVycnVw
dHMgY29uZmlndXJhdGlvbiAobm8gaW50ZXJydXB0cy1leHRlbmRlZCwgc2VlCmJlbG93KS4gSXMg
aXQgcG9zc2libGUgd2l0aG91dCBpbnRlcnJ1cHRzLWV4dGVuZGVkPyBIb3cgd291bGQgaXQgbG9v
awpsaWtlPwoKCj4gPiArICAgICAgICAgICAgICAgIGlmICggciApCj4gPiArICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgLyogY29weSBpbnRl
cnJ1cHRzL2ludGVycnVwdHMtZXh0ZW5kZWQgZnJvbSB0aGUgaG9zdCBEVAo+ID4gbm9kZSAqLwo+
ID4gKyAgICAgICAgICAgICAgICBpbnRzcGVjID0gZHRfZ2V0X3Byb3BlcnR5KG5vZGUsICJpbnRl
cnJ1cHRzIiwgJmludGxlbik7Cj4gPiArICAgICAgICAgICAgICAgIGlmICggaW50c3BlYyA9PSBO
VUxMICkKPiA+ICsgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+IAo+IFlvdSBk
b24ndCBoYW5kbGUgaW50ZXJydXB0cy1leHRlbmRlZCBub3IgaW50ZXJydXB0LW1hcHBpbmcuCgpJ
IHdhcyB3b25kZXJpbmcgd2hhdCB0byBkbyBhYm91dCB0aGF0LiBGb3Igbm93LCBJIGFkZGVkIGEg
bm90ZSBpbiB0aGUKbGFzdCBwYXRjaCBvZiB0aGUgc2VyaWVzLCB0aGUgb25lIGFkZGluZyBpbmZv
IHRvIHRoZSBkb2MuIEFscmVhZHkgaW4KdGhpcyB2MyBzZXJpZXM6CgoiRm9yIEdJQyBpbnRlcnJ1
cHRzLCBvbmx5IHRoZSBpbnRlcnJ1cHRzIHByb3BlcnR5IGlzIGN1cnJlbnRseQpzdXBwb3J0ZWQs
IG5vdCB0aGUgbmV3ZXIgaW50ZXJydXB0cy1leHRlbmRlZCBwcm9wZXJ0eS4iCgoKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgICAgciA9IGZkdF9wcm9wZXJ0eShmZHQsICJpbnRlcnJ1cHRzIiwgaW50
c3BlYywgaW50bGVuKTsKPiA+ICsgICAgICAgICAgICAgICAgaWYgKCByICkKPiA+ICsgICAgICAg
ICAgICAgICAgICAgIHJldHVybiByOwo+ID4gKyAgICAgICAgICAgIH0KPiA+ICsgICAgICAgIH0K
PiA+ICAgICAgIH0KPiA+ICAgICAgICAgLyogRkRUX0VSUl9OT1RGT1VORCA9PiBUaGVyZSBpcyBu
byBtb3JlIHByb3BlcnRpZXMgZm9yIHRoaXMgbm9kZSAqLwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
