Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64D14A741
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:35:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw6Mo-0000pr-7c; Mon, 27 Jan 2020 15:31:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QvhJ=3Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iw6Mm-0000pm-M5
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:31:56 +0000
X-Inumbo-ID: 25fe13a4-411a-11ea-8569-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25fe13a4-411a-11ea-8569-12813bfff9fa;
 Mon, 27 Jan 2020 15:31:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5E6B4AD3A;
 Mon, 27 Jan 2020 15:31:54 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20200127151907.2877-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fe61fca8-4bf7-7af6-58c4-c82f1fbe27a4@suse.com>
Date: Mon, 27 Jan 2020 16:31:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200127151907.2877-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs: retrospectively add XS_DIRECTORY_PART
 to the xenstore protocol...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAgMTY6MTksIFBhdWwgRHVycmFudCB3cm90ZToKPiAuLi4gc3BlY2lmaWNhdGlv
bi4KPiAKPiBUaGlzIHdhcyBhZGRlZCBieSBjb21taXQgMGNhNjRlZDggInhlbnN0b3JlOiBhZGQg
c3VwcG9ydCBmb3IgcmVhZGluZwo+IGRpcmVjdG9yeSB3aXRoIG1hbnkgY2hpbGRyZW4iIGJ1dCBu
b3QgYWRkZWQgdG8gdGhlIHNwZWNpZmljYXRpb24gYXQgdGhhdAo+IHBvaW50LiBBIHZlcnNpb24g
b2YgeGVuc3RvcmVkIHN1cHBvcnRpbmcgdGhlIGNvbW1hbmQgd2FzIGZpcnN0IHJlbGVhc2VkCj4g
aW4gWGVuIDQuOS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+Cj4gLS0tCj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogR2Vvcmdl
IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+IENjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ2M6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KPiAtLS0KPiAgIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgfCAxMyArKysrKysrKysrKy0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3JlLnR4dCBiL2RvY3MvbWlzYy94ZW5zdG9yZS50
eHQKPiBpbmRleCBhZTFiNmE4YzZlLi5iZjQyZTllYzM3IDEwMDY0NAo+IC0tLSBhL2RvY3MvbWlz
Yy94ZW5zdG9yZS50eHQKPiArKysgYi9kb2NzL21pc2MveGVuc3RvcmUudHh0Cj4gQEAgLTEyNSw4
ICsxMjUsOSBAQCBWYWx1ZXMgY29tbW9ubHkgaW5jbHVkZWQgaW4gcGF5bG9hZHMgaW5jbHVkZToK
PiAgIAo+ICAgCj4gICAKPiAtVGhlIGZvbGxvd2luZyBhcmUgdGhlIGFjdHVhbCB0eXBlIHZhbHVl
cywgaW5jbHVkaW5nIHRoZSByZXF1ZXN0IGFuZAo+IC1yZXBseSBwYXlsb2FkcyBhcyBhcHBsaWNh
YmxlOgo+ICtUaGUgZm9sbG93aW5nIGFyZSB0aGUgYWN0dWFsIHR5cGUgdmFsdWVzIGRlZmluZWQg
aW4gaW8veHNfd2lyZS5oCj4gKyhvbWl0dGluZyB0aGUgWFNfIHByZWZpeCksIGluY2x1ZGluZyB0
aGUgcmVxdWVzdCBhbmQgcmVwbHkgcGF5bG9hZHMKPiArYXMgYXBwbGljYWJsZToKPiAgIAo+ICAg
Cj4gICAtLS0tLS0tLS0tIERhdGFiYXNlIHJlYWQsIHdyaXRlIGFuZCBwZXJtaXNzaW9ucyBvcGVy
YXRpb25zIC0tLS0tLS0tLS0KPiBAQCAtMTUyLDYgKzE1MywxNCBAQCBESVJFQ1RPUlkJCTxwYXRo
PnwJCQk8Y2hpbGQtbGVhZi1uYW1lPnwqCj4gICAJbGVhZm5hbWVzLiAgVGhlIHJlc3VsdGluZyBj
aGlsZHJlbiBhcmUgZWFjaCBuYW1lZAo+ICAgCTxwYXRoPi88Y2hpbGQtbGVhZi1uYW1lPi4KPiAg
IAo+ICtESVJFQ1RPUllfUEFSVAkJPHBhdGg+fDxpbmRleHw+CQk8Y2hpbGQtbGVhZi1uYW1lPnwq
Cj4gKwlQZXJmb3JtcyB0aGUgc2FtZSBmdW5jdGlvbiBhcyBESVJFQ1RPUlksIGJ1dCByZXR1cm5z
IGEKPiArCXN1Yi1saXN0IG9mIGNoaWxkcmVuIHN0YXJ0aW5nIGF0IDxpbmRleD4gaW4gdGhlIG92
ZXJhbGwKPiArCWNoaWxkIGxpc3QgYW5kIGxlc3MgdGhhbiBvciBlcXVhbCB0byBYRU5TVE9SRV9Q
QVlMT0FEX01BWAo+ICsJb2N0ZXRzIGluIGxlbmd0aC4gSWYgPGluZGV4PiBpcyBiZXlvbmQgdGhl
IGVuZCBvZiB0aGUKPiArCW92ZXJhbGwgY2hpbGQgbGlzdCB0aGVuIHRoZSByZXR1cm5lZCBzdWIt
bGlzdCB3aWxsIGJlCj4gKwllbXB0eS4KPiArCgpIbW0sIG5vdCBxdWl0ZS4KCkkgZGlkIHNlbmQg
dGhpcyBzb21lIHllYXJzIGFnbzoKCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE3LTA1L21zZzAwNjUwLmh0bWwKCklhbiB3YW50ZWQgdG8gc3VnZ2VzdCBz
b21ldGhpbmcgYmV0dGVyLCBidXQgaGUgbmV2ZXIgZGlkLgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
