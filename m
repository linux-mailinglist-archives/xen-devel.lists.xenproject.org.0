Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8947E9F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 11:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hco3p-0002Jj-99; Mon, 17 Jun 2019 09:36:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hco3n-0002Je-AO
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 09:36:19 +0000
X-Inumbo-ID: 59e0041c-90e3-11e9-99ba-3b215527ca49
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 59e0041c-90e3-11e9-99ba-3b215527ca49;
 Mon, 17 Jun 2019 09:36:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 96A65AF30;
 Mon, 17 Jun 2019 09:36:14 +0000 (UTC)
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <20190509172540.12398-12-ankur.a.arora@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <71d3131a-cd14-6bf6-391a-6e4b0533fb23@suse.com>
Date: Mon, 17 Jun 2019 11:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509172540.12398-12-ankur.a.arora@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 11/16] xen/grant-table: make grant-table
 xenhost aware
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
Cc: pbonzini@redhat.com, boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 joao.m.martins@oracle.com, konrad.wilk@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3JhIHdyb3RlOgo+IExhcmdlbHkgbWVjaGFuaWNh
bCBjaGFuZ2VzOiB0aGUgZXhwb3J0ZWQgZ3JhbnQgdGFibGUgc3ltYm9scyBub3cgdGFrZQo+IHhl
bmhvc3RfdCAqIGFzIGEgcGFyYW1ldGVyLiBBbHNvLCBtb3ZlIHRoZSBncmFudCB0YWJsZSBnbG9i
YWwgc3RhdGUKPiBpbnNpZGUgeGVuaG9zdF90Lgo+IAo+IElmIHRoZXJlJ3MgbW9yZSB0aGFuIG9u
ZSB4ZW5ob3N0LCB0aGVuIGluaXRpYWxpemUgYm90aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmt1
ciBBcm9yYSA8YW5rdXIuYS5hcm9yYUBvcmFjbGUuY29tPgo+IC0tLQo+ICAgYXJjaC94ODYveGVu
L2dyYW50LXRhYmxlLmMgfCAgNzEgKysrLS0KPiAgIGRyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMg
IHwgNjExICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUv
eGVuL2dyYW50X3RhYmxlLmggIHwgIDcyICsrLS0tCj4gICBpbmNsdWRlL3hlbi94ZW5ob3N0Lmgg
ICAgICB8ICAxMSArCj4gICA0IGZpbGVzIGNoYW5nZWQsIDQ0MyBpbnNlcnRpb25zKCspLCAzMjIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUveGVuL3hlbmhvc3QuaCBiL2lu
Y2x1ZGUveGVuL3hlbmhvc3QuaAo+IGluZGV4IDllMDg2MjdhOWUzZS4uYWNlZTBjNzg3MmI2IDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUveGVuL3hlbmhvc3QuaAo+ICsrKyBiL2luY2x1ZGUveGVuL3hl
bmhvc3QuaAo+IEBAIC0xMjksNiArMTI5LDE3IEBAIHR5cGVkZWYgc3RydWN0IHsKPiAgIAkJY29u
c3Qgc3RydWN0IGV2dGNobl9vcHMgKmV2dGNobl9vcHM7Cj4gICAJCWludCAqKmV2dGNobl90b19p
cnE7Cj4gICAJfTsKPiArCj4gKwkvKiBncmFudCB0YWJsZSBwcml2YXRlIHN0YXRlICovCj4gKwlz
dHJ1Y3Qgewo+ICsJCS8qIHByaXZhdGUgdG8gZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyAqLwo+
ICsJCXZvaWQgKmdudHRhYl9wcml2YXRlOwo+ICsKPiArCQkvKiB4ODYveGVuL2dyYW50LXRhYmxl
LmMgKi8KPiArCQl2b2lkICpnbnR0YWJfc2hhcmVkX3ZtX2FyZWE7Cj4gKwkJdm9pZCAqZ250dGFi
X3N0YXR1c192bV9hcmVhOwo+ICsJCXZvaWQgKmF1dG9feGxhdF9ncmFudF9mcmFtZXM7CgpQbGVh
c2UgdXNlIHByb3BlciB0eXBlcyBoZXJlIGluc3RlYWQgb2Ygdm9pZCAqLiBUaGlzIGF2b2lkcyBs
b3RzIG9mCmNhc3RzLiBJdCBpcyBva2F5IHRvIGp1c3QgYWRkIGFub255bW91cyBzdHJ1Y3QgZGVm
aW5pdGlvbnMgYW5kIGtlZXAgdGhlCnJlYWwgc3RydWN0IGxheW91dCBsb2NhbCB0byBncmFudCB0
YWJsZSBjb2RlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
