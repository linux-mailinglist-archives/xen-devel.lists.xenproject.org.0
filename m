Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A532CF2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 11:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjIn-0002To-0V; Mon, 03 Jun 2019 09:30:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXjIm-0002Tj-8t
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:30:48 +0000
X-Inumbo-ID: 442f5c32-85e2-11e9-9117-afae5081cefe
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 442f5c32-85e2-11e9-9117-afae5081cefe;
 Mon, 03 Jun 2019 09:30:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 399D6374;
 Mon,  3 Jun 2019 02:30:46 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5633A3F690;
 Mon,  3 Jun 2019 02:30:44 -0700 (PDT)
To: chenbaodong <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
References: <9df204f9ae2cc9c80a6afde5ea82cb27@sslemail.net>
 <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
 <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3c06a4f6-b2f0-1298-b17f-a311fa4e7b67@arm.com>
Date: Mon, 3 Jun 2019 10:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wNi8yMDE5IDAyOjQ4LCBjaGVuYmFvZG9uZyB3cm90ZToKPiAKPiBPbiA1LzMx
LzE5IDE4OjUyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiA1LzMxLzE5IDQ6
MTggQU0sIEJhb2RvbmcgQ2hlbiB3cm90ZToKPj4+IFRodXMsIHNpemVvZihzdHJ1Y3QgY3B1cG9v
bCkgd2lsbCBzYXZlIDggYnl0ZXMgZm9yIDY0LWJpdCBzeXN0ZW0uCj4+Cj4+IEkgYW0gaGFwcHkg
d2l0aCB0aGUgY2hhbmdlLCBhbHRob3VnaCBBRkFJSyBjcHVwb29sIGlzIG5vdCBpbnN0YW50aWF0
ZWQgdGhhdCAKPj4gb2Z0ZW4uIEFyZSB5b3UgcGxhbm5pbmcgdG8gaGF2ZSBtb3JlIGluc3RhbnRp
YXRpb24gb2YgaXQ/Cj4+Cj4+IENoZWVycywKPj4KPiBObywgSSdtIG5vdCBwbGFubmluZyB0byBj
cmVhdGUgbG90cyBvZiBjcHVwb29sIGluc3RhbmNlLgo+IAo+IEknbSBzdHVkeWluZyB4ZW4gZm9y
IGEgZmV3IHdlZWtzIGFuZCBteSBwbGFuIGlzOgo+IAo+IHJ1biB4ZW4gZm9yIGVtYmVkZWQgYXV0
b21vdGl2ZSB1c2UgY2FzZSB3aXRoIGRvbTBsZXNzLCBudWxsIHNjaGVkdWxlciwgc21hbGwgCj4g
Y29kZSBiYXNlIGZvciBzYWZldHkgY2VydGlmaWVkIG1heWJlIGEgcGx1cyhub3Qgc3VyZSB3aGV0
aGVyIGNhbiBkbyB0aGlzKS4KCkZXSVcsIHRoZXJlIGFyZSBkaXNjdXNzaW9uIHRvIGdldCBYZW4g
c2FmZXR5IGNlcnRpZmllZC4gVGhleSBhcmUgY2FwdHVyZWQgb24gWzFdLgoKQ2hlZXJzLAoKWzFd
IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0NhdGVnb3J5OlNhZmV0eV9DZXJ0aWZp
Y2F0aW9uL0Z1U2FfU0lHCgo+IAo+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hl
biA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPj4+IC0tLQo+Pj4gwqAgeGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmggfCAyICstCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVk
LWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+Pj4gaW5kZXggOTJiYzdhMC4uZjBj
ZjIxMCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+Pj4gQEAgLTIxMyw5ICsyMTMsOSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgc2NoZWRfZnJlZV9kb21kYXRhKGNvbnN0IHN0cnVjdCAKPj4+IHNjaGVk
dWxlciAqcywKPj4+IMKgIHN0cnVjdCBjcHVwb29sCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgIGlu
dMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwdXBvb2xfaWQ7Cj4+PiArwqDCoMKgIHVuc2ln
bmVkIGludMKgwqDCoMKgIG5fZG9tOwo+Pj4gwqDCoMKgwqDCoCBjcHVtYXNrX3Zhcl90wqDCoMKg
IGNwdV92YWxpZDvCoMKgwqDCoMKgIC8qIGFsbCBjcHVzIGFzc2lnbmVkIHRvIHBvb2wgKi8KPj4+
IMKgwqDCoMKgwqAgc3RydWN0IGNwdXBvb2zCoMKgICpuZXh0Owo+Pj4gLcKgwqDCoCB1bnNpZ25l
ZCBpbnTCoMKgwqDCoCBuX2RvbTsKPj4+IMKgwqDCoMKgwqAgc3RydWN0IHNjaGVkdWxlciAqc2No
ZWQ7Cj4+PiDCoMKgwqDCoMKgIGF0b21pY190wqDCoMKgwqDCoMKgwqDCoCByZWZjbnQ7Cj4+PiDC
oCB9Owo+Pj4KPj4KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
