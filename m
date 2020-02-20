Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0550165B6D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:26:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4izG-0000nP-TP; Thu, 20 Feb 2020 10:23:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4izF-0000ms-8N
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 10:23:17 +0000
X-Inumbo-ID: 015505bc-53cb-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 015505bc-53cb-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 10:23:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 752C6B291;
 Thu, 20 Feb 2020 10:23:14 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200219091811.9689-1-aisaila@bitdefender.com>
 <6ec21fc9-a4fc-58b3-d823-8bdb291a22ac@suse.com>
 <1b42e2e2-1559-9014-1022-e5d5bf65eaa6@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a5446ffe-1215-7366-9d57-54f497e41362@suse.com>
Date: Thu, 20 Feb 2020 11:23:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1b42e2e2-1559-9014-1022-e5d5bf65eaa6@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
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

T24gMjAuMDIuMjAyMCAxMDo1OSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTkuMDIuMjAyMCAxOTowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjAyLjIwMjAgMTA6
MTgsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gQEAgLTQ4MzUsNiArNDgzNiwy
MyBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPj4+ICAgICAgICAgICBicmVhazsKPj4+ICAg
ICAgIH0KPj4+ICAgCj4+PiArICAgIGNhc2UgSFZNT1BfYWx0cDJtX3NldF92aXNpYmlsaXR5Ogo+
Pj4gKyAgICB7Cj4+PiArICAgICAgICB1aW50MTZfdCBhbHRwMm1faWR4ID0gYS51LnNldF92aXNp
YmlsaXR5LmFsdHAybV9pZHg7Cj4+PiArCj4+PiArICAgICAgICBpZiAoIGEudS5zZXRfdmlzaWJp
bGl0eS5wYWQgKQo+Pj4gKyAgICAgICAgICAgIHJjID0gLUVJTlZBTDsKPj4+ICsgICAgICAgIGVs
c2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApCj4+PiArICAgICAgICAgICAgcmMgPSAtRU9QTk9U
U1VQUDsKPj4+ICsgICAgICAgIGVsc2UgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkudmlzaWJsZSAp
Cj4+PiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2FsdHAybV9pZHhd
ID0KPj4+ICsgICAgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthbHRwMm1faWR4XTsK
Pj4+ICsgICAgICAgIGVsc2UKPj4+ICsgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV93b3JraW5n
X2VwdHBbYWx0cDJtX2lkeF0gPQo+Pj4gKyAgICAgICAgICAgICAgICBtZm5feChJTlZBTElEX01G
Tik7Cj4+Cj4+IERvbid0IHlvdSBuZWVkIHRvIGJvdW5kcyBjaGVjayB0aGUgaW5kZXggYmVmb3Jl
IGl0cyB1c2U/Cj4gCj4gVW5sZXNzIHdlIHdhbnQgYSBpbmRleCBvdXQgb2YgYm91bmRzIGZyb20g
dGhlIHVzZXIuIFNvcnJ5IGZvciBub3QgaGF2aW5nIAo+IHRoYXQsIEkgd2lsbCBhZGQgYSAiYWx0
cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIAo+IE1BWF9FUFRQKV0iIGlu
IHBsYWNlIGZvciB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+PiBBbmQKPj4gc2hvdWxkbid0IHlvdSBy
ZXR1cm4gYW4gZXJyb3IgYWxzbyBmb3IgaW4tcmFuZ2Ugb25lcyB3aGljaAo+PiBhcmVuJ3QgYWN0
dWFsbHkgdmFsaWQ/Cj4gVGhhdCBpcyBhIGdvb2QgdGhpbmcuIE1heWJlIC1FSU5WQUwgY291bGQg
Zml0IHRoaXM/CgpTdXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
