Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B806FC9AB8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 11:29:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFxMX-0007jy-Nd; Thu, 03 Oct 2019 09:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFxMV-0007jt-9T
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 09:25:27 +0000
X-Inumbo-ID: b9d224b4-e5bf-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b9d224b4-e5bf-11e9-bf31-bc764e2007e4;
 Thu, 03 Oct 2019 09:25:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA4EB1000;
 Thu,  3 Oct 2019 02:25:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF23C3F739;
 Thu,  3 Oct 2019 02:25:21 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-5-sstabellini@kernel.org>
 <b3424309-d315-7ff8-7bd7-66782db279cd@arm.com>
 <alpine.DEB.2.21.1910021512400.2691@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910021547140.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1dfaa6dc-002b-1ddc-87d2-b4fdb95928a9@arm.com>
Date: Thu, 3 Oct 2019 10:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021547140.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7b 5/8] xen/arm: assign devices to boot
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDAyLzEwLzIwMTkgMjM6NDgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDIgT2N0IDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24g
V2VkLCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBTdGVmYW5vLAo+Pj4K
Pj4+IE9uIDEwLzEvMTkgMTI6MzAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBT
Y2FuIHRoZSB1c2VyIHByb3ZpZGVkIGR0YiBmcmFnbWVudCBhdCBib290LiBGb3IgZWFjaCBkZXZp
Y2Ugbm9kZSwgbWFwCj4+Pj4gbWVtb3J5IHRvIGd1ZXN0cywgYW5kIHJvdXRlIGludGVycnVwdHMg
YW5kIHNldHVwIHRoZSBpb21tdS4KPj4+Pgo+Pj4+IFRoZSBtZW1vcnkgcmVnaW9uIHRvIHJlbWFw
IGlzIHNwZWNpZmllZCBieSB0aGUgInhlbixyZWciIHByb3BlcnR5Lgo+Pj4+Cj4+Pj4gVGhlIGlv
bW11IGlzIHNldHVwIGJ5IHBhc3NpbmcgdGhlIG5vZGUgb2YgdGhlIGRldmljZSB0byBhc3NpZ24g
b24gdGhlCj4+Pj4gaG9zdCBkZXZpY2UgdHJlZS4gVGhlIHBhdGggaXMgc3BlY2lmaWVkIGluIHRo
ZSBkZXZpY2UgdHJlZSBmcmFnbWVudCBhcwo+Pj4+IHRoZSAieGVuLHBhdGgiIHN0cmluZyBwcm9w
ZXJ0eS4KPj4+Pgo+Pj4+IFRoZSBpbnRlcnJ1cHRzIGFyZSByZW1hcHBlZCBiYXNlZCBvbiB0aGUg
aW5mb3JtYXRpb24gZnJvbSB0aGUKPj4+PiBjb3JyZXNwb25kaW5nIG5vZGUgb24gdGhlIGhvc3Qg
ZGV2aWNlIHRyZWUuIENhbGwKPj4+PiBoYW5kbGVfZGV2aWNlX2ludGVycnVwdHMgdG8gcmVtYXAg
aW50ZXJydXB0cy4gSW50ZXJydXB0cyByZWxhdGVkIGRldmljZQo+Pj4+IHRyZWUgcHJvcGVydGll
cyBhcmUgY29waWVkIGZyb20gdGhlIGRldmljZSB0cmVlIGZyYWdtZW50LCBzYW1lIGFzIGFsbAo+
Pj4+IHRoZSBvdGhlciBwcm9wZXJ0aWVzLgo+Pj4+Cj4+Pj4gUmVxdWlyZSBib3RoIHhlbixyZWcg
YW5kIHhlbixwYXRoIHRvIGJlIHByZXNlbnQsIHVubGVzcwo+Pj4+IHhlbixmb3JjZS1hc3NpZ24t
d2l0aG91dC1pb21tdSBpcyBhbHNvIHNldC4gSW4gdGhhdCBjYXNlLCB0b2xlcmF0ZSBhCj4+Pj4g
bWlzc2luZyB4ZW4scGF0aCwgYWxzbyB0b2xlcmF0ZSBpb21tdSBzZXR1cCBmYWlsdXJlIGZvciB0
aGUgcGFzc3Rocm91Z2gKPj4+PiBkZXZpY2UuCj4+Pj4KPj4+PiBBbHNvIHNldCBhZGQgdGhlIG5l
dyBmbGFnIFhFTl9ET01DVExfQ0RGX2lvbW11IHNvIHRoYXQgZG9tMGxlc3MgZG9tVQo+Pj4+IGNh
biB1c2UgdGhlIElPTU1VIGlmIGEgcGFydGlhbCBkdGIgaXMgc3BlY2lmaWVkLgo+Pj4KPj4+IFRo
ZSBwYXRjaCBsb29rcyBnb29kIGEgZmV3IGNvbW1lbnRzIGJlbG93Lgo+Pgo+PiBUaGFua3MKPj4K
Pj4KPj4+IFsuLi5dCj4+Pgo+Pj4+ICAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDEz
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4+Pj4gaW5kZXggODRiNjViOGYyNS4uNDdmOWJiMzFkZiAxMDA2NDQKPj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMKPj4+PiBAQCAtMTcxNCw2ICsxNzE0LDg4IEBAIHN0YXRpYyBpbnQgX19pbml0
IG1ha2VfdnBsMDExX3VhcnRfbm9kZShzdHJ1Y3QKPj4+PiBrZXJuZWxfaW5mbyAqa2luZm8pCj4+
Pj4gICAgfQo+Pj4+ICAgICNlbmRpZgo+Pj4+ICAgICsvKgo+Pj4+ICsgKiBTY2FuIGRldmljZSB0
cmVlIHByb3BlcnRpZXMgZm9yIHBhc3N0aHJvdWdoIHNwZWNpZmljIGluZm9ybWF0aW9uLgo+Pj4+
ICsgKiBSZXR1cm5zIDwgMCBvbiBlcnJvcgo+Pj4+ICsgKiAgICAgICAgIDAgb24gc3VjY2Vzcwo+
Pj4+ICsgKi8KPj4+PiArc3RhdGljIGludCBfX2luaXQgaGFuZGxlX3Bhc3N0aHJvdWdoX3Byb3Ao
c3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZkdF9wcm9wZXJ0eQo+Pj4+ICp4ZW5fcmVn
LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZmR0X3Byb3BlcnR5Cj4+Pj4gKnhlbl9wYXRoLAo+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHhlbl9mb3JjZSwKPj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgYWRkcmVzc19jZWxscywg
dWludDMyX3QKPj4+PiBzaXplX2NlbGxzKQo+Pj4+ICt7Cj4+Pj4gKyAgICBjb25zdCBfX2JlMzIg
KmNlbGw7Cj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaSwgbGVuOwo+Pj4+ICsgICAgc3RydWN0IGR0
X2RldmljZV9ub2RlICpub2RlOwo+Pj4+ICsgICAgaW50IHJlczsKPj4+PiArICAgIHBhZGRyX3Qg
bXN0YXJ0LCBzaXplLCBnc3RhcnQ7Cj4+Pj4gKwo+Pj4+ICsgICAgLyogeGVuLHJlZyBzcGVjaWZp
ZXMgd2hlcmUgdG8gbWFwIHRoZSBNTUlPIHJlZ2lvbiAqLwo+Pj4+ICsgICAgY2VsbCA9IChjb25z
dCBfX2JlMzIgKil4ZW5fcmVnLT5kYXRhOwo+Pj4+ICsgICAgbGVuID0gZmR0MzJfdG9fY3B1KHhl
bl9yZWctPmxlbikgLwo+Pj4+ICsgICAgICAgICAgKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVf
Y2VsbHMpICogc2l6ZW9mKHVpbnQzMl90KSk7Cj4+Pgo+Pj4gQ29kaW5nIHN0eWxlIGFnYWluLiBJ
IHdhcyBraW5kIG9mIGV4cGVjdGluZyB5b3UgY29uZmlndXJlZCB5b3VyIGVkaXRvcgo+Pj4gcHJv
cGVybHkgYWZ0ZXIgdGhlIGxhc3QgZGlzY3Vzc2lvbi4uLgo+Pgo+PiBBY3R1YWxseSBJIGZhaWwg
dG8gc2VlIHRoZSBjb2Rpbmcgc3R5bGUgaXNzdWUgb24gdGhpcyBvbmUuIElzIGl0IHN0aWxsCj4+
IGFuIGFsaWdubWVudCBpc3N1ZSB5b3UgYXJlIHRhbGtpbmcgYWJvdXQ/Cj4gCj4gSXMgaXQgYmVj
YXVzZSB5b3Ugd291bGQgbGlrZSBpdCB0byBsb29rIGxpa2UgdGhpcz8KPiAKPiAgICAgIGxlbiA9
IGZkdDMyX3RvX2NwdSh4ZW5fcmVnLT5sZW4pIC8gKChhZGRyZXNzX2NlbGxzICogMiArIHNpemVf
Y2VsbHMpICoKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVv
Zih1aW50MzJfdCkpOwoKTm8sIEkgY29tcGxldGVseSBtaXNyZWFkIHRoZSBsaW5lIGFuZCB0aG91
Z2h0IHRoZSBkaXZpc2lvbiB3YXMgcGFydCBvZiB0aGUgCmZkdDMyX3RvX2NwdSBhcmd1bWVudC4g
QXBvbG9naWVzIGZvciB0aGUgbm9pc2UgOiguCgpUaGlzIGlzIGZpeGFibGUgb24gY29tbWl0LgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
