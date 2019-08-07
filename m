Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77184940
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 12:17:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvIy6-0003Pd-Vy; Wed, 07 Aug 2019 10:14:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvIy5-0003PY-Um
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 10:14:53 +0000
X-Inumbo-ID: 3076b440-b8fc-11e9-84cf-6b553e59a0c7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3076b440-b8fc-11e9-84cf-6b553e59a0c7;
 Wed, 07 Aug 2019 10:14:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55D4D28;
 Wed,  7 Aug 2019 03:14:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5D23F575;
 Wed,  7 Aug 2019 03:14:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <alpine.DEB.2.21.1908061615000.2451@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6b936bd1-5345-1297-2e8a-1d6fd102336b@arm.com>
Date: Wed, 7 Aug 2019 11:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908061615000.2451@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: unbreak arm64 build
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKClBsZWFzZSB1c2UgYWRkX21haW50YWluZXJzLnBsIHRvIENDIHRoZSBjb3Jy
ZWN0IHJldmlld2Vycy4KCkl0IGlzIHF1aXRlIGNvbW1vbiB0byBzcGVjaWZ5IHRoZSBjb21waWxl
ci9iaW51dGlscyB2ZXJzaW9uIHVzZWQgd2hlbiB0aGlzIGlzIApub3QgYW4gb2J2aW91cyBjb21w
aWxlciBlcnJvciAoaS5lIG1pc3NpbmcgYnJhY2VzIG9yIHNlbWktY29sdW1uKS4KCkluIHRoaXMg
Y2FzZSwgdGhpcyBwYXNzZWQgT1NTdGVzdCBzbW9rZSBhbmQgSSBoYXZlbid0IG5vdGljZWQgYW55
IGlzc3VlcyB3aXRoIApHQ0MgOC4zLiBGdXJ0aGVybW9yZSwgdGhlIGRvY3VtZW50YXRpb24gWzFd
IHN1Z2dlc3RzIHRoYXQgbHIgaXMgYXV0b21hdGljYWxseSAKYWxpYXNlZCB0byB4MzAuCgpTbyB0
aGVyZSBpcyBzb21ldGhpbmcgZGlmZmVyZW50IHdpdGggeW91ciBzZXR1cC4gTG9va2luZyBhdCB0
aGUgYmludXRpbHMgY29kZSwgCnRoZSBhbGlhcyB3YXMgYWRkZWQgaW4gMjAxNyBbMl0sIHNvIHRo
aXMgd2FzIGZpcnN0bHkgaW50cm9kdWNlZCBpbiBiaW51dGlscyAyLjI5LgoKT24gMDcvMDgvMjAx
OSAwMDoxNywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IENvbW1pdCA0OTQxYmZiZjExZWFl
MDVjOTJhYTMyNDJlMzUzZDE3Mzk3NGNlN2JmICJ4ZW4vYXJtNjQ6IG1hY3JvczoKCk5JVDogcGxl
YXNlIHB1dCBhIHNob3J0IHZlcnNpb24gb2YgdGhlIHNoYTEgaGVyZSBpbnN0ZWFkIG9mIHRoZSBs
b25nIHZlcnNpb24uIApUaGUgdGl0bGUgd2lsbCBtYWtlIGl0IHVuaXEuCgo+IEludHJvZHVjZSBh
biBhc3NlbWJseSBtYWNybyB0byBhbGlhcyB4MzAiIG1vdmVkCj4gCj4gICAgbHIgICAgICAucmVx
ICAgIHgzMAo+IAo+IHRvIG1hY3Jvcy5oLCBhbmQgc3RhcnRlZCB0byB1c2UgImxyIiBpbiBoZWFk
LlMuIEhvd2V2ZXIsIGl0IGRpZG4ndCBhZGQKPiBhbiAjaW5jbHVkZSBtYWNyb3MuaCB0byBoZWFk
LlMuIFRoaXMgY29tbWl0IGZpeGVzIGl0LgoKQXQgdGhlIHJpc2sgb2YgYmVpbmcgcGVkYW50aWMs
IHRoZSBjb21taXQgeW91IG1lbnRpb24gZG9lcyBub3QgbWFrZSBhbnkgdXNlIG9mIAoibHIiIGlu
IGhlYWQuUy4gVGhpcyB3YXMgaW50cm9kdWNlZCBieSBhIGxhdGVyIHBhdGNoLgoKSW4gbnV0c2hl
bGwsIEkgYW0gaGFwcHkgd2l0aCB0aGUgY2hhbmdlIGJ1dCB0aGUgY29tbWl0IG1lc3NhZ2UvdGl0
bGUgbmVlZHMgbW9yZSAKZXhwbGFuYXRpb24uCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCAy
OGVmZTkyMzBjLi41MGNmZjA4NzU2IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9o
ZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTI1LDYgKzI1LDcg
QEAKPiAgICNpbmNsdWRlIDxhc20vZWFybHlfcHJpbnRrLmg+Cj4gICAjaW5jbHVkZSA8ZWZpL2Vm
aWVyci5oPgo+ICAgI2luY2x1ZGUgPGFzbS9hcm02NC9lZmliaW5kLmg+Cj4gKyNpbmNsdWRlIDxh
c20vYXJtNjQvbWFjcm9zLmg+Cj4gICAKPiAgICNkZWZpbmUgUFRfUFQgICAgIDB4ZjdmIC8qIG5H
PTEgQUY9MSBTSD0xMSBBUD0wMSBOUz0xIEFUVFI9MTExIFQ9MSBQPTEgKi8KPiAgICNkZWZpbmUg
UFRfTUVNICAgIDB4ZjdkIC8qIG5HPTEgQUY9MSBTSD0xMSBBUD0wMSBOUz0xIEFUVFI9MTExIFQ9
MCBQPTEgKi8KPiAKCkNoZWVycywKClsxXSBodHRwczovL3NvdXJjZXdhcmUub3JnL2JpbnV0aWxz
L2RvY3MvYXMvQUFyY2g2NC1EaXJlY3RpdmVzLmh0bWwKWzJdIDYyZTIwZWQ0NWUgIkFkZCBzdXBw
b3J0IGZvciBBQXJjaDY0IHN5c3RlbSByZWdpc3RlciBuYW1lcyBJUDAsIElQMSwgRlAgYW5kIExS
LiIKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
