Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 842608E87A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyCEt-0005HL-0t; Thu, 15 Aug 2019 09:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pfC1=WL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hyCEr-0005HG-Lz
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:40:09 +0000
X-Inumbo-ID: aa9a4922-bf40-11e9-96f7-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa9a4922-bf40-11e9-96f7-bc764e2007e4;
 Thu, 15 Aug 2019 09:40:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0EB2B3084212;
 Thu, 15 Aug 2019 09:40:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-57.ams2.redhat.com
 [10.36.117.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A13D442421;
 Thu, 15 Aug 2019 09:40:05 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190813113119.14804-1-anthony.perard@citrix.com>
 <20190813113119.14804-33-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2fdb7299-ad4c-787e-3dd3-ea18f269aefa@redhat.com>
Date: Thu, 15 Aug 2019 11:40:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190813113119.14804-33-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 15 Aug 2019 09:40:07 +0000 (UTC)
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

T24gMDgvMTMvMTkgMTM6MzEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEludHJvZHVjZSBQY2RY
ZW5HcmFudEZyYW1lcyB0byByZXBsYWNlIGEgZGVmaW5lIGluIFhlbkJ1c0R4ZSBhbmQgYWxsb3cK
PiB0aGUgc2FtZSB2YWx1ZSB0byBiZSB1c2VkIGluIGEgZGlmZmVyZW50IG1vZHVsZS4KPiAKPiBU
aGUgcmVhc29uIGZvciB0aGUgbnVtYmVyIG9mIHBhZ2UgdG8gYmUgNCBkb2Vzbid0IGV4aXN0IGFu
eW1vcmUsIHNvCj4gc2ltcGx5IHJlbW92ZSB0aGUgY29tbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAg
ICAgdjU6Cj4gICAgIC0gYWRkIG1pc3NpbmcgUGNkTGliIHRvIFtMaWJyYXJ5Q2xhc3Nlc10KClll
cywgdGhhdCdzIGZvcgoKaHR0cDovL21pZC5tYWlsLWFyY2hpdmUuY29tLzM2NWYyYjk1LWI2Yzkt
MDNjZi01MzQ2LTVlMTE5MmJmYTQzN0ByZWRoYXQuY29tCmh0dHBzOi8vZWRrMi5ncm91cHMuaW8v
Zy9kZXZlbC9tZXNzYWdlLzQ0NjIxCgpUaGFua3MgZm9yIGl0LApMYXN6bG8KCj4gICAgIHY0Ogo+
ICAgICAtIG5ldyBwYXRjaAo+IAo+ICBPdm1mUGtnL092bWZQa2cuZGVjICAgICAgICAgICAgIHwg
MyArKysKPiAgT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmluZiB8IDMgKysrCj4gIE92bWZQ
a2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oICAgfCAxICsKPiAgT3ZtZlBrZy9YZW5CdXNEeGUvR3Jh
bnRUYWJsZS5jICB8IDMgKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL092bWZQa2cuZGVjIGIvT3Zt
ZlBrZy9Pdm1mUGtnLmRlYwo+IGluZGV4IDA0ZDVlMjkyNzIuLmQ1ZmVlODA1ZWYgMTAwNjQ0Cj4g
LS0tIGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYwo+ICsrKyBiL092bWZQa2cvT3ZtZlBrZy5kZWMKPiBA
QCAtMjI1LDYgKzIyNSw5IEBAIFtQY2RzRml4ZWRBdEJ1aWxkXQo+ICAgIGdVZWZpT3ZtZlBrZ1Rv
a2VuU3BhY2VHdWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJ8MHgwfFVJTlQzMnwweDE3
Cj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVj
dFB0clNpemV8MHgwfFVJTlQzMnwweDMyCj4gIAo+ICsgICMjIE51bWJlciBvZiBwYWdlIGZyYW1l
cyB0byB1c2UgZm9yIHN0b3JpbmcgZ3JhbnQgdGFibGUgZW50cmllcy4KPiArICBnVWVmaU92bWZQ
a2dUb2tlblNwYWNlR3VpZC5QY2RYZW5HcmFudEZyYW1lc3w0fFVJTlQzMnwweDMzCj4gKwo+ICBb
UGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhdCj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1
aWQuUGNkRW11VmFyaWFibGVFdmVudHwwfFVJTlQ2NHwyCj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5T
cGFjZUd1aWQuUGNkT3ZtZkZsYXNoVmFyaWFibGVzRW5hYmxlfEZBTFNFfEJPT0xFQU58MHgxMAo+
IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mIGIvT3ZtZlBrZy9Y
ZW5CdXNEeGUvWGVuQnVzRHhlLmluZgo+IGluZGV4IDg2ZTBmYjgyMjQuLjUzNmI0OWZhOGMgMTAw
NjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmluZgo+ICsrKyBiL092bWZQ
a2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5pbmYKPiBAQCAtNTEsNiArNTEsNyBAQCBbTGlicmFyeUNs
YXNzZXNdCj4gICAgWGVuSHlwZXJjYWxsTGliCj4gICAgU3luY2hyb25pemF0aW9uTGliCj4gICAg
UHJpbnRMaWIKPiArICBQY2RMaWIKPiAgCj4gIFtQcm90b2NvbHNdCj4gICAgZ0VmaURyaXZlckJp
bmRpbmdQcm90b2NvbEd1aWQKPiBAQCAtNTksMyArNjAsNSBAQCBbUHJvdG9jb2xzXQo+ICAgIGdY
ZW5CdXNQcm90b2NvbEd1aWQKPiAgICBnWGVuSW9Qcm90b2NvbEd1aWQKPiAgCj4gK1tGaXhlZFBj
ZF0KPiArICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5HcmFudEZyYW1lcwo+IGRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCBiL092bWZQa2cvWGVuQnVz
RHhlL1hlbkJ1c0R4ZS5oCj4gaW5kZXggODUxMDM2MWJjYS4uYjFkY2MzNTQ5YyAxMDA2NDQKPiAt
LS0gYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaAo+ICsrKyBiL092bWZQa2cvWGVuQnVz
RHhlL1hlbkJ1c0R4ZS5oCj4gQEAgLTIyLDYgKzIyLDcgQEAKPiAgI2luY2x1ZGUgPExpYnJhcnkv
VWVmaUxpYi5oPgo+ICAjaW5jbHVkZSA8TGlicmFyeS9EZXZpY2VQYXRoTGliLmg+Cj4gICNpbmNs
dWRlIDxMaWJyYXJ5L0RlYnVnTGliLmg+Cj4gKyNpbmNsdWRlIDxMaWJyYXJ5L1BjZExpYi5oPgo+
ICAKPiAgCj4gIC8vCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFibGUu
YyBiL092bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFibGUuYwo+IGluZGV4IDY1NzVlOWI4OGMuLjEx
MzA0MDRjZDEgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCj4g
KysrIGIvT3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCj4gQEAgLTIyLDggKzIyLDcgQEAK
PiAgCj4gICNkZWZpbmUgTlJfUkVTRVJWRURfRU5UUklFUyA4Cj4gIAo+IC0vKiBOUl9HUkFOVF9G
UkFNRVMgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gdGhhdCBjb25maWd1cmVkIGluIFhl
biAqLwo+IC0jZGVmaW5lIE5SX0dSQU5UX0ZSQU1FUyA0Cj4gKyNkZWZpbmUgTlJfR1JBTlRfRlJB
TUVTIChGaXhlZFBjZEdldDMyIChQY2RYZW5HcmFudEZyYW1lcykpCj4gICNkZWZpbmUgTlJfR1JB
TlRfRU5UUklFUyAoTlJfR1JBTlRfRlJBTUVTICogRUZJX1BBR0VfU0laRSAvIHNpemVvZihncmFu
dF9lbnRyeV92MV90KSkKPiAgCj4gIFNUQVRJQyBncmFudF9lbnRyeV92MV90ICpHcmFudFRhYmxl
ID0gTlVMTDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
