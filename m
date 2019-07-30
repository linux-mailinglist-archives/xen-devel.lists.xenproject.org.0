Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5C7A8F6
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:49:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRXD-0007Rp-7J; Tue, 30 Jul 2019 12:47:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsRXC-0007Rj-4L
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:47:18 +0000
X-Inumbo-ID: 2978cadc-b2c8-11e9-a8b3-8bc203a1af6e
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2978cadc-b2c8-11e9-a8b3-8bc203a1af6e;
 Tue, 30 Jul 2019 12:47:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A1D53308338F;
 Tue, 30 Jul 2019 12:47:16 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D8BF5D6A7;
 Tue, 30 Jul 2019 12:47:15 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-33-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <365f2b95-b6c9-03cf-5346-5e1192bfa437@redhat.com>
Date: Tue, 30 Jul 2019 14:47:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-33-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 30 Jul 2019 12:47:16 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 32/35] OvmfPkg: Introduce
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEludHJvZHVjZSBQY2RY
ZW5HcmFudEZyYW1lcyB0byByZXBsYWNlIGEgZGVmaW5lIGluIFhlbkJ1c0R4ZSBhbmQgYWxsb3cK
PiB0aGUgc2FtZSB2YWx1ZSB0byBiZSB1c2VkIGluIGEgZGlmZmVyZW50IG1vZHVsZS4KPiAKPiBU
aGUgcmVhc29uIGZvciB0aGUgbnVtYmVyIG9mIHBhZ2UgdG8gYmUgNCBkb2Vzbid0IGV4aXN0IGFu
eW1vcmUsIHNvCj4gc2ltcGx5IHJlbW92ZSB0aGUgY29tbWVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAgT3Zt
ZlBrZy9Pdm1mUGtnLmRlYyAgICAgICAgICAgICB8IDMgKysrCj4gIE92bWZQa2cvWGVuQnVzRHhl
L1hlbkJ1c0R4ZS5pbmYgfCAyICsrCj4gIE92bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oICAg
fCAxICsKPiAgT3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jICB8IDMgKy0tCj4gIDQgZmls
ZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9Pdm1mUGtnL092bWZQa2cuZGVjIGIvT3ZtZlBrZy9Pdm1mUGtnLmRlYwo+IGluZGV4IDA0
ZDVlMjkyNzIuLmQ1ZmVlODA1ZWYgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYwo+
ICsrKyBiL092bWZQa2cvT3ZtZlBrZy5kZWMKPiBAQCAtMjI1LDYgKzIyNSw5IEBAIFtQY2RzRml4
ZWRBdEJ1aWxkXQo+ICAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlblB2aFN0YXJ0
T2ZEYXlTdHJ1Y3RQdHJ8MHgwfFVJTlQzMnwweDE3Cj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFj
ZUd1aWQuUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0clNpemV8MHgwfFVJTlQzMnwweDMyCj4g
IAo+ICsgICMjIE51bWJlciBvZiBwYWdlIGZyYW1lcyB0byB1c2UgZm9yIHN0b3JpbmcgZ3JhbnQg
dGFibGUgZW50cmllcy4KPiArICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5HcmFu
dEZyYW1lc3w0fFVJTlQzMnwweDMzCj4gKwo+ICBbUGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhd
Cj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkRW11VmFyaWFibGVFdmVudHwwfFVJ
TlQ2NHwyCj4gICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkT3ZtZkZsYXNoVmFyaWFi
bGVzRW5hYmxlfEZBTFNFfEJPT0xFQU58MHgxMAo+IGRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1
c0R4ZS9YZW5CdXNEeGUuaW5mIGIvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuQnVzRHhlLmluZgo+IGlu
ZGV4IDg2ZTBmYjgyMjQuLjBiNzhjZDBhZjQgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBrZy9YZW5CdXNE
eGUvWGVuQnVzRHhlLmluZgo+ICsrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5pbmYK
PiBAQCAtNTksMyArNTksNSBAQCBbUHJvdG9jb2xzXQo+ICAgIGdYZW5CdXNQcm90b2NvbEd1aWQK
PiAgICBnWGVuSW9Qcm90b2NvbEd1aWQKPiAgCj4gK1tGaXhlZFBjZF0KPiArICBnVWVmaU92bWZQ
a2dUb2tlblNwYWNlR3VpZC5QY2RYZW5HcmFudEZyYW1lcwo+IGRpZmYgLS1naXQgYS9Pdm1mUGtn
L1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCj4g
aW5kZXggODUxMDM2MWJjYS4uYjFkY2MzNTQ5YyAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlbkJ1
c0R4ZS9YZW5CdXNEeGUuaAo+ICsrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCj4g
QEAgLTIyLDYgKzIyLDcgQEAKPiAgI2luY2x1ZGUgPExpYnJhcnkvVWVmaUxpYi5oPgo+ICAjaW5j
bHVkZSA8TGlicmFyeS9EZXZpY2VQYXRoTGliLmg+Cj4gICNpbmNsdWRlIDxMaWJyYXJ5L0RlYnVn
TGliLmg+Cj4gKyNpbmNsdWRlIDxMaWJyYXJ5L1BjZExpYi5oPgo+ICAKPiAgCj4gIC8vCgpHb29k
IGNhdGNoOyBpbiBteSB2MyByZXZpZXcgYXQKPGh0dHA6Ly9taWQubWFpbC1hcmNoaXZlLmNvbS80
YmFkZDUzNS1jMjNkLWM2NGQtN2JiMy1mYjQyYmJiZjUzOGFAcmVkaGF0LmNvbT4KSSBkaWRuJ3Qg
cmVhbGl6ZSB3ZSdkIGJlIGludHJvZHVjaW5nIHRoZSBQY2RMaWIgZGVwZW5kZW5jeSBhbmV3LgoK
KDEpIEhvd2V2ZXIsIGluIHRoYXQgY2FzZSwgd2Ugc2hvdWxkIGxpc3QgUGNkTGliIGluIHRoZSBb
TGlicmFyeUNsYXNzZXNdCnNlY3Rpb24gb2YgdGhlIElORiBmaWxlIGFzIHdlbGwuCgpXaXRoICgx
KSBmaXhlZDoKClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoK
VGhlcmUgaXMgbm8gbmVlZCB0byBwb3N0IHY1IGp1c3QgYmVjYXVzZSBvZiB0aGlzIC0tIGlmIGEg
djUgaXMgb3RoZXJ3aXNlCnVubmVjZXNzYXJ5LCBJIGNhbiBmaXggdGhpcyB1cCBmb3IgeW91IGJl
Zm9yZSBwdXNoaW5nIHY0LgoKVGhhbmtzCkxhc3psbwoKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Y
ZW5CdXNEeGUvR3JhbnRUYWJsZS5jIGIvT3ZtZlBrZy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCj4g
aW5kZXggNjU3NWU5Yjg4Yy4uMTEzMDQwNGNkMSAxMDA2NDQKPiAtLS0gYS9Pdm1mUGtnL1hlbkJ1
c0R4ZS9HcmFudFRhYmxlLmMKPiArKysgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9HcmFudFRhYmxlLmMK
PiBAQCAtMjIsOCArMjIsNyBAQAo+ICAKPiAgI2RlZmluZSBOUl9SRVNFUlZFRF9FTlRSSUVTIDgK
PiAgCj4gLS8qIE5SX0dSQU5UX0ZSQU1FUyBtdXN0IGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0byB0
aGF0IGNvbmZpZ3VyZWQgaW4gWGVuICovCj4gLSNkZWZpbmUgTlJfR1JBTlRfRlJBTUVTIDQKPiAr
I2RlZmluZSBOUl9HUkFOVF9GUkFNRVMgKEZpeGVkUGNkR2V0MzIgKFBjZFhlbkdyYW50RnJhbWVz
KSkKPiAgI2RlZmluZSBOUl9HUkFOVF9FTlRSSUVTIChOUl9HUkFOVF9GUkFNRVMgKiBFRklfUEFH
RV9TSVpFIC8gc2l6ZW9mKGdyYW50X2VudHJ5X3YxX3QpKQo+ICAKPiAgU1RBVElDIGdyYW50X2Vu
dHJ5X3YxX3QgKkdyYW50VGFibGUgPSBOVUxMOwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
