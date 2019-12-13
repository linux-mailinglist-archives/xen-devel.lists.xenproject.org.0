Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2011E571
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:20:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflkp-00031R-BK; Fri, 13 Dec 2019 14:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iflko-00031M-3x
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:17:14 +0000
X-Inumbo-ID: 40d2abf3-1db3-11ea-8f15-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40d2abf3-1db3-11ea-8f15-12813bfff9fa;
 Fri, 13 Dec 2019 14:17:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2811AB14A;
 Fri, 13 Dec 2019 14:17:12 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20191213130316.21085-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3996087c-3b8c-f7f5-8f93-d2ec85e68b89@suse.com>
Date: Fri, 13 Dec 2019 15:17:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213130316.21085-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] public/io/netif.h: document a mechanism to
 advertise carrier state
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTQ6MDMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMg
YSBzcGVjaWZpY2F0aW9uIGZvciBhICdjYXJyaWVyJyBub2RlIGluIHhlbnN0b3JlIHRvIGFsbG93
Cj4gYSBiYWNrZW5kIHRvIG5vdGlmeSBhIGZyb250ZW5kIG9mIGl0J3MgdmlydHVhbCBjYXJyaWVy
L2xpbmsgc3RhdGUuIEUuZy4KPiBhIGJhY2tlbmQgdGhhdCBpcyB1bmFibGUgdG8gZm9yd2FyZCBw
YWNrZXRzIGZyb20gdGhlIGd1ZXN0IGJlY2F1c2UgaXQgaXMKPiBub3QgYXR0YWNoZWQgdG8gYSBi
cmlkZ2UgbWF5IHdpc2ggdG8gYWR2ZXJ0aXNlICdubyBjYXJyaWVyJy4KPiAKPiBOT1RFOiBUaGlz
IGlzIHB1cmVseSBhIGRvY3VtZW50YXRpb24gcGF0Y2guIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAt
LS0KPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+
IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gICB4ZW4vaW5jbHVk
ZS9wdWJsaWMvaW8vbmV0aWYuaCB8IDE0ICsrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMv
aW8vbmV0aWYuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oCj4gaW5kZXggMjQ1NDQ0
OGJhYS4uZTU4NzA1NWY2OCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0
aWYuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oCj4gQEAgLTE5MCw2ICsx
OTAsMjAgQEAKPiAgICAqIG9yZGVyIGFzIHJlcXVlc3RzLgo+ICAgICovCj4gICAKPiArLyoKPiAr
ICogTGluayBzdGF0ZQo+ICsgKiA9PT09PT09PT09Cj4gKyAqCj4gKyAqIFRoZSBiYWNrZW5kIGNh
biBhZHZlcnRpc2UgaXQgaXMgY3VycmVudCBsaW5rIChjYXJyaWVyKSBzdGF0ZSB0byB0aGUKCnMv
aXQgaXMvaXRzLyA/Cgo+ICsgKiBmcm9udGVuZCB1c2luZyB0aGUgL2xvY2FsL2RvbWFpbi9YL2Jh
Y2tlbmQvPGRvbWlkPi88dmlmPi9jYXJyaWVyIG5vZGUuCgpIbW0sIEkganVzdCByZWFsaXplZCB0
aGF0IHRoZSBvdGhlciBtZW50aW9uZWQgYmFja2VuZCBwYXRoIGluIHRoaXMgZmlsZQppcyB3cm9u
ZywgaXQgc2hvdWxkIGJlOiAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC92aWYvPGRvbWlkPi88dmlm
Pi8uLi4KCk1pbmQgY29ycmVjdGluZyB0aGF0IGluIHlvdXIgcGF0Y2gsIHRvbz8KCj4gKyAqIElm
IHRoaXMgbm9kZSBpcyBub3QgcHJlc2VudCwgdGhlbiB0aGUgZnJvbnRlbmQgc2hvdWxkIGFzc3Vt
ZSB0aGF0IHRoZQo+ICsgKiBsaW5rIGlzIHVwIChmb3IgY29tcGF0aWJpbGl0eSB3aXRoIGJhY2tl
bmRzIHRoYXQgZG8gbm8gaW1wbGVtZW50IHRoaXMKPiArICogZmVhdHVyZSkuIElmIHRoaXMgbm9k
ZSBpcyBwcmVzZW50LCB0aGVuIGEgdmFsdWUgb2YgIjAiIHNob3VsZCBiZQo+ICsgKiBpbnRlcnBy
ZXRlZCBieSB0aGUgZnJvbnRlbmQgYXMgdGhlIGxpbmsgYmVpbmcgZG93biAobm8gY2Fycmllcikg
YW5kIGEKPiArICogdmFsdWUgb2YgIjEiIHNob3VsZCBiZSBpbnRlcnByZXRlZCBhcyB0aGUgbGlu
ayBiZWluZyB1cCAoY2Fycmllcgo+ICsgKiBwcmVzZW50KS4KPiArICovCj4gKwoKCkp1ZXJnZW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
