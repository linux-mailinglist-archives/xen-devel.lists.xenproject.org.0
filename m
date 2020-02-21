Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536A91683CC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:41:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5BKZ-00014C-8s; Fri, 21 Feb 2020 16:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j5BKX-000142-Ut
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:39:09 +0000
X-Inumbo-ID: aea7de3a-54c8-11ea-86b2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aea7de3a-54c8-11ea-86b2-12813bfff9fa;
 Fri, 21 Feb 2020 16:39:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B4DBAC35;
 Fri, 21 Feb 2020 16:39:08 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200221083014.29274-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db92db09-3f73-aa91-cac7-a1652782da95@suse.com>
Date: Fri, 21 Feb 2020 17:39:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221083014.29274-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4] x86/altp2m: Hypercall to set altp2m view
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

T24gMjEuMDIuMjAyMCAwOTozMCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTQ4MzUsNiArNDgzNiwyNiBAQCBzdGF0aWMgaW50IGRvX2FsdHAybV9vcCgKPiAgICAgICAgICBi
cmVhazsKPiAgICAgIH0KPiAgCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJpbGl0
eToKPiArICAgIHsKPiArICAgICAgICB1aW50MTZfdCBpZHggPSBhLnUuc2V0X3Zpc2liaWxpdHku
YWx0cDJtX2lkeDsKPiArCj4gKyAgICAgICAgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkIHx8
Cj4gKyAgICAgICAgICAgICBpZHggPj0gbWluKEFSUkFZX1NJWkUoZC0+YXJjaC5hbHRwMm1fcDJt
KSwgTUFYX0VQVFApIHx8CgpXaHkgbWluKCkgaGVyZT8gWW91IG9ubHkgYWNjZXNzIE1BWF9FUFRQ
LWRpbWVuc2lvbmVkIGFycmF5cyBhZmFpY3MuIElmCnRoaXMgaXMgaW50ZW50aW9uYWwsIEkgdGhp
bmsgaXQgZGVzZXJ2ZXMgYSBjb21tZW50LgoKPiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJt
X2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9PQo+ICsgICAgICAgICAg
ICAgbWZuX3goSU5WQUxJRF9NRk4pICkKPiArICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwo+ICsg
ICAgICAgIGVsc2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApCj4gKyAgICAgICAgICAgIHJjID0g
LUVPUE5PVFNVUFA7Cj4gKyAgICAgICAgZWxzZSBpZiAoIGEudS5zZXRfdmlzaWJpbGl0eS52aXNp
YmxlICkKPiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQo+ICsgICAgICAgICAgICAgICAgZC0+YXJjaC5h
bHRwMm1fZXB0cFthcnJheV9pbmRleF9ub3NwZWMoaWR4LCBNQVhfRVBUUCldOwo+ICsgICAgICAg
IGVsc2UKPiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQo+ICsgICAgICAgICAgICAgICAgbWZuX3goSU5W
QUxJRF9NRk4pOwo+ICsgICAgICAgIGJyZWFrOwoKWW91IGRvbid0IHNlZW0gdG8gYmUgaG9sZGlu
ZyBhbnkgbG9ja3MuIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgbWVhbnMKdGhlIGluLXJhbmdlLWlu
ZGV4LWlzLXZhbGlkIGNoZWNrIGZ1cnRoZXIgdXAgd2lsbCBoYXZlIGJlY29tZSBzdGFsZQpieSB0
aGUgdGltZSB5b3UgYWN0dWFsbHkgY29uc3VtZSB0aGUgc2xvdC4KCj4gQEAgLTI2MzgsNyArMjYz
OSw5IEBAIGludCBwMm1fZGVzdHJveV9hbHRwMm1fYnlfaWQoc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IGlkeCkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIHAybV9yZXNldF9hbHRw
Mm0oZCwgaWR4LCBBTFRQMk1fREVBQ1RJVkFURSk7Cj4gICAgICAgICAgICAgIGQtPmFyY2guYWx0
cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9Cj4gLSAgICAgICAg
ICAgIG1mbl94KElOVkFMSURfTUZOKTsKPiArICAgICAgICAgICAgICAgIG1mbl94KElOVkFMSURf
TUZOKTsKPiArICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fd29ya2luZ19lcHRwW2FycmF5X2lu
ZGV4X25vc3BlYyhpZHgsIE1BWF9FUFRQKV0gPQo+ICsgICAgICAgICAgICAgICAgbWZuX3goSU5W
QUxJRF9NRk4pOwoKSSBhcHByZWNpYXRlIHlvdSBhbHNvIGFkanVzdGluZyB0aGUgYm9ndXMgaW5k
ZW50YXRpb24gb2YgdGhlIHByZS0KZXhpc3RpbmcgbGluZS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
