Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EFC8E88B
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyCKF-0005fQ-Gu; Thu, 15 Aug 2019 09:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pfC1=WL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hyCKE-0005fI-1D
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:45:42 +0000
X-Inumbo-ID: 71acdea8-bf41-11e9-8b99-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71acdea8-bf41-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 09:45:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 00B7E30832E1;
 Thu, 15 Aug 2019 09:45:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-57.ams2.redhat.com
 [10.36.117.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ABA31000321;
 Thu, 15 Aug 2019 09:45:39 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190813113119.14804-1-anthony.perard@citrix.com>
 <20190813113119.14804-33-anthony.perard@citrix.com>
 <2fdb7299-ad4c-787e-3dd3-ea18f269aefa@redhat.com>
Message-ID: <1edc44c2-9b8f-a10a-c341-d16e81d59d56@redhat.com>
Date: Thu, 15 Aug 2019 11:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2fdb7299-ad4c-787e-3dd3-ea18f269aefa@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 09:45:41 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v5 32/35] OvmfPkg: Introduce
 PcdXenGrantFrames
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMTUvMTkgMTE6NDAsIExhc3psbyBFcnNlayB3cm90ZToKPiBPbiAwOC8xMy8xOSAxMzoz
MSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IEludHJvZHVjZSBQY2RYZW5HcmFudEZyYW1lcyB0
byByZXBsYWNlIGEgZGVmaW5lIGluIFhlbkJ1c0R4ZSBhbmQgYWxsb3cKPj4gdGhlIHNhbWUgdmFs
dWUgdG8gYmUgdXNlZCBpbiBhIGRpZmZlcmVudCBtb2R1bGUuCj4+Cj4+IFRoZSByZWFzb24gZm9y
IHRoZSBudW1iZXIgb2YgcGFnZSB0byBiZSA0IGRvZXNuJ3QgZXhpc3QgYW55bW9yZSwgc28KPj4g
c2ltcGx5IHJlbW92ZSB0aGUgY29tbWVudC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4+IFJldmlld2VkLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+PiAtLS0KPj4KPj4gTm90ZXM6Cj4+ICAgICB2NToK
Pj4gICAgIC0gYWRkIG1pc3NpbmcgUGNkTGliIHRvIFtMaWJyYXJ5Q2xhc3Nlc10KPiAKPiBZZXMs
IHRoYXQncyBmb3IKPiAKPiBodHRwOi8vbWlkLm1haWwtYXJjaGl2ZS5jb20vMzY1ZjJiOTUtYjZj
OS0wM2NmLTUzNDYtNWUxMTkyYmZhNDM3QHJlZGhhdC5jb20KPiBodHRwczovL2VkazIuZ3JvdXBz
LmlvL2cvZGV2ZWwvbWVzc2FnZS80NDYyMQo+IAo+IFRoYW5rcyBmb3IgaXQsCj4gTGFzemxvCj4g
Cj4+ICAgICB2NDoKPj4gICAgIC0gbmV3IHBhdGNoCgpBbHNvIHRoYW5rcyBmb3IgYWRkaW5nIHRo
ZSB2NCBub3RlIHJldHJvLWFjdGl2ZWx5LgoKVGhhbmtzCkxhc3psbwoKPj4gIE92bWZQa2cvT3Zt
ZlBrZy5kZWMgICAgICAgICAgICAgfCAzICsrKwo+PiAgT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVz
RHhlLmluZiB8IDMgKysrCj4+ICBPdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCAgIHwgMSAr
Cj4+ICBPdm1mUGtnL1hlbkJ1c0R4ZS9HcmFudFRhYmxlLmMgIHwgMyArLS0KPj4gIDQgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYyBiL092bWZQa2cvT3ZtZlBrZy5kZWMKPj4gaW5kZXggMDRk
NWUyOTI3Mi4uZDVmZWU4MDVlZiAxMDA2NDQKPj4gLS0tIGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYwo+
PiArKysgYi9Pdm1mUGtnL092bWZQa2cuZGVjCj4+IEBAIC0yMjUsNiArMjI1LDkgQEAgW1BjZHNG
aXhlZEF0QnVpbGRdCj4+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlblB2aFN0
YXJ0T2ZEYXlTdHJ1Y3RQdHJ8MHgwfFVJTlQzMnwweDE3Cj4+ICAgIGdVZWZpT3ZtZlBrZ1Rva2Vu
U3BhY2VHdWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJTaXplfDB4MHxVSU5UMzJ8MHgz
Mgo+PiAgCj4+ICsgICMjIE51bWJlciBvZiBwYWdlIGZyYW1lcyB0byB1c2UgZm9yIHN0b3Jpbmcg
Z3JhbnQgdGFibGUgZW50cmllcy4KPj4gKyAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNk
WGVuR3JhbnRGcmFtZXN8NHxVSU5UMzJ8MHgzMwo+PiArCj4+ICBbUGNkc0R5bmFtaWMsIFBjZHNE
eW5hbWljRXhdCj4+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZEVtdVZhcmlhYmxl
RXZlbnR8MHxVSU5UNjR8Mgo+PiAgICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RPdm1m
Rmxhc2hWYXJpYWJsZXNFbmFibGV8RkFMU0V8Qk9PTEVBTnwweDEwCj4+IGRpZmYgLS1naXQgYS9P
dm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVz
RHhlLmluZgo+PiBpbmRleCA4NmUwZmI4MjI0Li41MzZiNDlmYThjIDEwMDY0NAo+PiAtLS0gYS9P
dm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mCj4+ICsrKyBiL092bWZQa2cvWGVuQnVzRHhl
L1hlbkJ1c0R4ZS5pbmYKPj4gQEAgLTUxLDYgKzUxLDcgQEAgW0xpYnJhcnlDbGFzc2VzXQo+PiAg
ICBYZW5IeXBlcmNhbGxMaWIKPj4gICAgU3luY2hyb25pemF0aW9uTGliCj4+ICAgIFByaW50TGli
Cj4+ICsgIFBjZExpYgo+PiAgCj4+ICBbUHJvdG9jb2xzXQo+PiAgICBnRWZpRHJpdmVyQmluZGlu
Z1Byb3RvY29sR3VpZAo+PiBAQCAtNTksMyArNjAsNSBAQCBbUHJvdG9jb2xzXQo+PiAgICBnWGVu
QnVzUHJvdG9jb2xHdWlkCj4+ICAgIGdYZW5Jb1Byb3RvY29sR3VpZAo+PiAgCj4+ICtbRml4ZWRQ
Y2RdCj4+ICsgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlbkdyYW50RnJhbWVzCj4+
IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCBiL092bWZQa2cvWGVu
QnVzRHhlL1hlbkJ1c0R4ZS5oCj4+IGluZGV4IDg1MTAzNjFiY2EuLmIxZGNjMzU0OWMgMTAwNjQ0
Cj4+IC0tLSBhL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCj4+ICsrKyBiL092bWZQa2cv
WGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCj4+IEBAIC0yMiw2ICsyMiw3IEBACj4+ICAjaW5jbHVkZSA8
TGlicmFyeS9VZWZpTGliLmg+Cj4+ICAjaW5jbHVkZSA8TGlicmFyeS9EZXZpY2VQYXRoTGliLmg+
Cj4+ICAjaW5jbHVkZSA8TGlicmFyeS9EZWJ1Z0xpYi5oPgo+PiArI2luY2x1ZGUgPExpYnJhcnkv
UGNkTGliLmg+Cj4+ICAKPj4gIAo+PiAgLy8KPj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuQnVz
RHhlL0dyYW50VGFibGUuYyBiL092bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFibGUuYwo+PiBpbmRl
eCA2NTc1ZTliODhjLi4xMTMwNDA0Y2QxIDEwMDY0NAo+PiAtLS0gYS9Pdm1mUGtnL1hlbkJ1c0R4
ZS9HcmFudFRhYmxlLmMKPj4gKysrIGIvT3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCj4+
IEBAIC0yMiw4ICsyMiw3IEBACj4+ICAKPj4gICNkZWZpbmUgTlJfUkVTRVJWRURfRU5UUklFUyA4
Cj4+ICAKPj4gLS8qIE5SX0dSQU5UX0ZSQU1FUyBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0
byB0aGF0IGNvbmZpZ3VyZWQgaW4gWGVuICovCj4+IC0jZGVmaW5lIE5SX0dSQU5UX0ZSQU1FUyA0
Cj4+ICsjZGVmaW5lIE5SX0dSQU5UX0ZSQU1FUyAoRml4ZWRQY2RHZXQzMiAoUGNkWGVuR3JhbnRG
cmFtZXMpKQo+PiAgI2RlZmluZSBOUl9HUkFOVF9FTlRSSUVTIChOUl9HUkFOVF9GUkFNRVMgKiBF
RklfUEFHRV9TSVpFIC8gc2l6ZW9mKGdyYW50X2VudHJ5X3YxX3QpKQo+PiAgCj4+ICBTVEFUSUMg
Z3JhbnRfZW50cnlfdjFfdCAqR3JhbnRUYWJsZSA9IE5VTEw7Cj4+Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
