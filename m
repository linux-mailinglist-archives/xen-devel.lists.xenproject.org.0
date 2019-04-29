Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24952E4CC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:32:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7IY-0001Gl-1M; Mon, 29 Apr 2019 14:30:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL7IW-0001Gd-60
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:30:24 +0000
X-Inumbo-ID: 523aeb13-6a8b-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 523aeb13-6a8b-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 14:30:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C04EA78;
 Mon, 29 Apr 2019 07:30:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2B13F5C1;
 Mon, 29 Apr 2019 07:30:21 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-6-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c7ac1368-a3cc-0eb2-76ca-195665db5fff@arm.com>
Date: Mon, 29 Apr 2019 15:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555513175-7596-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTcvMDQvMjAxOSAxNTo1OSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IFRoaXMgcGF0Y2ggbWFrZXMgcG9zc2libGUgdG8gdXNlIGV4aXN0aW5n
IGVhcmx5IHByaW5rIGNvZGUKPiBmb3IgUmVuZXNhcyAiU3RvdXQiIGJvYXJkIGJhc2VkIG9uIFIt
Q2FyIEgyIFNvQyAoU0NJRkEpLgo+IAo+IFRoZSAiRUFSTFlfUFJJTlRLX1ZFUlNJT04iIGZvciB0
aGF0IGJvYXJkIHNob3VsZCBiZSAnQSc6Cj4gQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZj
NDAwMDAsQQo+IAo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPiAKPiAtLS0KPiAgICAgIENoYW5nZXMgaW4gdjM6Cj4gICAgICAgICAgLSBJdCB3
YXMgZGVjaWRlZCBub3QgdG8gaW50cm9kdWNlIG5ldyBkZWJ1Zy1zY2lmYS5pbmMKPiAgICAgICAg
ICAgIGZvciBoYW5kbGluZyBTQ0lGQSBpbnRlcmZhY2UsIGJ1dCB0byBleHRlbmQgZXhpc3RpbmcK
PiAgICAgICAgICAgIGRlYnVnLXNjaWYuaW5jIGZvciBoYW5kbGluZyBib3RoIGludGVyZmFjZXMu
Cj4gICAgICAgICAgICBUaGlzIHBhdGNoIGlzIGEgcmVzdWx0IG9mIHNwbGl0dGluZyBhbiBpbml0
aWFsIHBhdGNoCj4gICAgICAgICAgICAieGVuL2FybTogQWRkIFNDSUZBIFVBUlQgc3VwcG9ydCBm
b3IgZWFybHkgcHJpbnRrIgo+ICAgICAgICAgICAgYW5kIG9ubHkgYWRkcyBhIHN1cHBvcnQuCj4g
Cj4gICAgICBDaGFuZ2VzIGluIHY0Ogo+ICAgICAgICAgIC0gRHJvcCBTQ0lGKEEpIGZyb20gY29t
bWVudHMKPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8IDkgKysr
KysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgYi94
ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMKPiBpbmRleCBhOGQyZWFlLi4zZjAxYzkw
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+ICsrKyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+IEBAIC0xLDcgKzEsNyBAQAo+ICAg
LyoKPiAgICAqIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+ICAgICoKPiAtICog
U0NJRiBzcGVjaWZpYyBkZWJ1ZyBjb2RlCj4gKyAqIFNDSUYoQSkgc3BlY2lmaWMgZGVidWcgY29k
ZQo+ICAgICoKPiAgICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHIudHlzaGNoZW5r
b0BnbG9iYWxsb2dpYy5jb20+Cj4gICAgKiBDb3B5cmlnaHQgKEMpIDIwMTQsIEdsb2JhbGxvZ2lj
Lgo+IEBAIC0yMiwxMCArMjIsMTMgQEAKPiAgICNpZmRlZiBFQVJMWV9QUklOVEtfVkVSU0lPTl9O
T05FCj4gICAjZGVmaW5lIFNUQVRVU19SRUcgICAgU0NJRl9TQ0ZTUgo+ICAgI2RlZmluZSBUWF9G
SUZPX1JFRyAgIFNDSUZfU0NGVERSCj4gKyNlbGlmIEVBUkxZX1BSSU5US19WRVJTSU9OX0EKPiAr
I2RlZmluZSBTVEFUVVNfUkVHICAgIFNDSUZBX1NDQVNTUgo+ICsjZGVmaW5lIFRYX0ZJRk9fUkVH
ICAgU0NJRkFfU0NBRlREUgo+ICAgI2VuZGlmCj4gICAKPiAgIC8qCj4gLSAqIFNDSUYgVUFSVCB3
YWl0IFVBUlQgdG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKPiArICogV2FpdCBVQVJUIHRvIGJlIHJl
YWR5IHRvIHRyYW5zbWl0CgpUaGlzIGNoYW5nZSBhbmQgLi4uCgo+ICAgICogcmI6IHJlZ2lzdGVy
IHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRkcmVzcwo+ICAgICogcmM6IHNjcmF0Y2gg
cmVnaXN0ZXIKPiAgICAqLwo+IEBAIC0zNyw3ICs0MCw3IEBACj4gICAuZW5kbQo+ICAgCj4gICAv
Kgo+IC0gKiBTQ0lGIFVBUlQgdHJhbnNtaXQgY2hhcmFjdGVyCj4gKyAqIFVBUlQgdHJhbnNtaXQg
Y2hhcmFjdGVyCgouLi4gdGhpcyBvbmUgbG9vayBsaWtlIG1vcmUgYSBjaGFuZ2UgZm9yIHRoZSBw
cmV2aW91cyB0aGFuIHRoaXMgb25lLgoKPiAgICAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlu
cyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MKPiAgICAqIHJ0OiByZWdpc3RlciB3aGljaCBjb250YWlu
cyB0aGUgY2hhcmFjdGVyIHRvIHRyYW5zbWl0Cj4gICAgKi8KPiAKCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
