Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937DC393C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:38:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFKCC-0000XG-OB; Tue, 01 Oct 2019 15:36:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFKCB-0000X9-9u
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 15:36:11 +0000
X-Inumbo-ID: 31402c40-e461-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 31402c40-e461-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 15:36:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D87901000;
 Tue,  1 Oct 2019 08:36:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1306B3F71A;
 Tue,  1 Oct 2019 08:36:08 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, Andrii Anisov <andrii.anisov@gmail.com>, 
 xen-devel@lists.xenproject.org
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <1548090247-20078-3-git-send-email-andrii.anisov@gmail.com>
 <d7ee428b-6010-7f04-c412-d65f657f1518@arm.com>
 <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e9ce8c39-fa90-461d-0958-a0b2a0cf968a@arm.com>
Date: Tue, 1 Oct 2019 16:36:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1238d45f-1693-6afb-4eff-e8af3b9e4f7d@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/arm: domain_build: Don't expose
 IOMMU specific properties to the guest
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMDEvMTAvMjAxOSAxNjoyNSwgT2xla3NhbmRyIHdyb3RlOgo+IAo+
IE9uIDAxLjEwLjE5IDE4OjA0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+IAo+IEhpIEp1
bGllbgo+IAo+IAo+Pgo+PiBJIGFtIHJldml2aW5nIHRoZSB0aHJlYWQuIEkgdGhpbmsgd2UgbmVl
ZCBhIHBhdGNoIHNpbWlsYXIgdG8gdGhpcyBvbmUgZm9yIFhlbiAKPj4gNC4xMy4gVGhpcyBpcyBi
ZWNhdXNlIGdlbmVyaWMgYXJlIG5vdyB1c2VkIGJ5IFhlbiBzbyB0aGV5IHNob3VsZCBiZSBoaWRk
ZW4gCj4+IGZyb20gdGhlIGhhcmR3YXJlIGRvbWFpbi4KPj4KPj4gQW5kcmlpLCBPbGVrc2FuZHIs
IGNhbiBvbmUgb2YgeW91IGxvb2sgYXQgaXQ/Cj4gCj4gSSB3aWxsIGJlIGFibGUgdG8gbG9vayBh
dCBpdCBwcm9iYWJseSBhdCB0aGUgZW5kIG9mIHRoZSB3ZWVrIGlmIHRoZXJlIGlzIG5vIAo+IHVy
Z2VuY3kuCgpUaGF0J3MgZmluZSwgSSB0aGluayB3ZSBjYW4gbWFrZSBhIGNhc2UgdG8gYWRkIGl0
IGluIFhlbiA0LjEzLgoKPiAKPiAKPj4KPj4gQ2hlZXJzLAo+Pgo+PiBPbiAyMS8wMS8yMDE5IDE3
OjA0LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28g
PG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4KPj4+IFdlIGRvbid0IHBhc3N0aHJv
dWdoIElPTU1VIGRldmljZSB0byBET00wIGV2ZW4gaWYgaXQgaXMgbm90IHVzZWQgYnkKPj4+IFhl
bi4gVGhlcmVmb3JlIGV4cG9zaW5nIHRoZSBwcm9wZXJ0aWVzIHRoYXQgZGVzY3JpYmUgcmVsYXRp
b25zaGlwCj4+PiBiZXR3ZWVuIG1hc3RlciBkZXZpY2VzIGFuZCBJT01NVXMgZG9lcyBub3QgbWFr
ZSBhbnkgc2Vuc2UuCj4+Pgo+Pj4gQWNjb3JkaW5nIHRvIHRoZToKPj4+IDEuIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pb21tdS9pb21tdS50eHQKPj4+IDIuIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvcGNpLWlvbW11LnR4dAo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNv
bT4KPj4+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4g
LS0tCj4+PiDCoCB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxMCArKysrKysrKysrCj4+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPj4+IGluZGV4IGQyYzYzYTguLjE1YTA4ZDYgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+
Pj4gQEAgLTU0MCw2ICs1NDAsMTYgQEAgc3RhdGljIGludCBfX2luaXQgd3JpdGVfcHJvcGVydGll
cyhzdHJ1Y3QgZG9tYWluICpkLCAKPj4+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB9Cj4+PiDCoCArwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3QgZXhwb3NlIElPTU1VIHNwZWNpZmlj
IHByb3BlcnRpZXMgdG8gdGhlIGd1ZXN0ICovCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCBkdF9w
cm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJpb21tdXMiKSApCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb250aW51ZTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIGR0X3By
b3BlcnR5X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11LW1hcCIpICkKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggZHRf
cHJvcGVydHlfbmFtZV9pc19lcXVhbChwcm9wLCAiaW9tbXUtbWFwLW1hc2siKSApCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+ICsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFtZSwgcHJvcF9kYXRhLCBw
cm9wX2xlbik7Cj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQo+Pj4KPj4KPiBK
dWxpZW4sIGFyZSB5b3UgaGFwcHkgdG8gc2VlIHRoaXMgcGF0Y2ggYXMgaXMsIG9yIGRvIHlvdSBo
YXZlIHNvbWUgY29tbWVudHMgCj4gcmVnYXJkaW5nIGl0PwoKSSBoYXZlIHNvbWUgY29tbWVudHMg
b24gdGhlIGNvdmVyIGxldHRlciBmb3IgdGhpcyBwYXRjaC4gUGxlYXNlIHNlZSBbMV0uCgpUaGFu
ayB5b3UgZm9yIGhhdmluZyBhIGxvb2sgYXQgdGhlIHBhdGNoLgoKQ2hlZXJzLAoKWzFdIDxlZDA4
Nzk4MC1hMmI5LTJmZDQtN2U4NC00NDYxNDJlODE3NmJAYXJtLmNvbT4KCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
