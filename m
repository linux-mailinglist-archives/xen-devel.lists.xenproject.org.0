Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEA177271
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 10:33:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j93tC-00056Z-AA; Tue, 03 Mar 2020 09:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j93tB-00056U-AK
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 09:30:57 +0000
X-Inumbo-ID: aefa8e70-5d31-11ea-902a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aefa8e70-5d31-11ea-902a-bc764e2007e4;
 Tue, 03 Mar 2020 09:30:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65C72AFF6;
 Tue,  3 Mar 2020 09:30:55 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200226131806.32444-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e94a2335-cd08-339f-4fb0-9d1cb72b78d3@suse.com>
Date: Tue, 3 Mar 2020 10:30:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226131806.32444-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxNDoxOCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ4NDAsNiArNDg0MSwxOSBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPiAgICAgICAgICBi
cmVhazsKPiAgICAgIH0KPiAgCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJpbGl0
eToKPiArICAgIHsKPiArICAgICAgICB1aW50MTZfdCBpZHggPSBhLnUuc2V0X3Zpc2liaWxpdHku
YWx0cDJtX2lkeDsKCldoeSBhIGZpeGVkIHdpZHRoIHR5cGUgKGFuZCBldmVuIG9uZSBpbmVmZmlj
aWVudCB0byBkZWFsIHdpdGgpPwooT25lIG1pZ2h0IGV2ZW4gYXNrIC0gd2h5IGEgbG9jYWwgdmFy
aWFibGUgaW4gdGhlIGZpcnN0IHBsYWNlLAp3aGVuIGl0J3MgdXNlZCAuLi4KCj4gKyAgICAgICAg
aWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkICkKPiArICAgICAgICAgICAgcmMgPSAtRUlOVkFM
Owo+ICsgICAgICAgIGVsc2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApCj4gKyAgICAgICAgICAg
IHJjID0gLUVPUE5PVFNVUFA7Cj4gKyAgICAgICAgZWxzZQo+ICsgICAgICAgICAgICByYyA9IHAy
bV9zZXRfYWx0cDJtX3ZpZXdfdmlzaWJpbGl0eShkLCBpZHgsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEudS5zZXRfdmlzaWJpbGl0eS52aXNpYmxl
KTsKCi4uLiBqdXN0IG9uY2UgaGVyZS4pIFRoZSBmdW5jdGlvbiB0YWtlcyAidW5zaWduZWQgaW50
IiBpbiBhbnkKZXZlbnQuCgo+IEBAIC0zMTQ1LDYgKzMxNDgsMzUgQEAgaW50IHAybV9nZXRfc3Vw
cHJlc3NfdmUoc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBib29sICpzdXBwcmVzc192ZSwK
PiAgCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiArCj4gK2ludCBwMm1fc2V0X2FsdHAybV92aWV3
X3Zpc2liaWxpdHkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGFsdHAybV9pZHgsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCB2aXNpYmxlKQo+ICt7
Cj4gKyAgICBhbHRwMm1fbGlzdF9sb2NrKGQpOwo+ICsKPiArICAgIC8qCj4gKyAgICAgKiBFcHRw
IGluZGV4IGlzIGNvcnJlbGF0ZWQgd2l0aCBhbHRwMm0gaW5kZXggYW5kIHNob3VsZCBub3QgZXhj
ZWVkCj4gKyAgICAgKiBtaW4oTUFYX0FMVFAyTSwgTUFYX0VQVFApLgo+ICsgICAgICovCj4gKyAg
ICBpZiAoIGFsdHAybV9pZHggPj0gbWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJtKSwg
TUFYX0VQVFApIHx8Cj4gKyAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhf
bm9zcGVjKGFsdHAybV9pZHgsIE1BWF9FUFRQKV0gPT0KPiArICAgICAgICAgbWZuX3goSU5WQUxJ
RF9NRk4pICkKPiArICAgIHsKPiArICAgICAgICBhbHRwMm1fbGlzdF91bmxvY2soZCk7CgpJIHRo
aW5rIGl0IHdvdWxkIGJlIG5pY2UgaWYgdGhpcyB3ZW50IHRoZSBub3JtYWwgZnVuY3Rpb24gZXhp
dCBwYXRoLgpXb3VsZCBiZSBwcmV0dHkgc2ltcGxlIHRvIGFycmFuZ2UgZm9yIGJ5IGludHJvZHVj
aW5nIGEgbG9jYWwgdmFyaWFibGUKaG9sZGluZyB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
