Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFC165770
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 07:17:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4f5J-0007u8-MY; Thu, 20 Feb 2020 06:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vvQh=4I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4f5I-0007u3-6b
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 06:13:16 +0000
X-Inumbo-ID: 1434e224-53a8-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1434e224-53a8-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 06:13:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D022AD86;
 Thu, 20 Feb 2020 06:13:14 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200219081126.29534-1-jgross@suse.com>
 <20200219081126.29534-8-jgross@suse.com>
 <0a3501b3-2246-fdac-cd36-004e201d22ed@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b6957ec6-7956-92d4-4ac0-ea778d5ad30c@suse.com>
Date: Thu, 20 Feb 2020 07:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0a3501b3-2246-fdac-cd36-004e201d22ed@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/8] xen: add /buildinfo/config entry to
 hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTY6NTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE5LjAyLjIwMjAgMDk6
MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUKPj4g
KysrIGIveGVuL2NvbW1vbi9NYWtlZmlsZQo+PiBAQCAtMSw2ICsxLDcgQEAKPj4gICBvYmotJChD
T05GSUdfQVJHTykgKz0gYXJnby5vCj4+ICAgb2JqLXkgKz0gYml0bWFwLm8KPj4gICBvYmoteSAr
PSBic2VhcmNoLm8KPj4gK29iai15ICs9IGNvbmZpZ19kYXRhLm8KPiAKPiBJbiBwYXJ0aWN1bGFy
IHdpdGggZW1iZWRkZWQgdXNlcyBpbiBtaW5kLCBJIHRoaW5rIHRoaXMgd2FudHMgdG8KPiBoYXZl
IGEgS2NvbmZpZyBjb250cm9sLgoKT2theS4KCj4gCj4+IEBAIC00MTQsNiArNDIxLDkgQEAgc3Rh
dGljIGludCBfX2luaXQgYnVpbGRpbmZvX2luaXQodm9pZCkKPj4gICAgICAgaHlwZnNfYWRkX2xl
YWYoJnZlcnNpb24sICZtYWpvciwgdHJ1ZSk7Cj4+ICAgICAgIGh5cGZzX2FkZF9sZWFmKCZ2ZXJz
aW9uLCAmbWlub3IsIHRydWUpOwo+PiAgIAo+PiArICAgIGNvbmZpZy5lLnNpemUgPSB4ZW5fY29u
ZmlnX2RhdGFfc2l6ZTsKPiAKPiBUaGlzIGJlaW5nIHRoZSBvbmx5IHVzZSBvZiB4ZW5fY29uZmln
X2RhdGFfc2l6ZSwgaXQgc3VnZ2VzdHMgdGhhdAo+IGl0IGNvdWxkIGluIHByaW5jaXBsZSBsaXZl
IGluIC5pbml0LnJvZGF0YS4gSSByZWFsaXplIHRoaXMgbWF5Cj4gbWVhbiBtb3JlIGN1c3RvbWl6
YXRpb24gdG8gdGhlIGJpbmZpbGUgc2NyaXB0IHRoYW4gaXMgd2FycmFudGVkCj4gYnkgdGhlc2Ug
NCBieXRlcyBvZiBkYXRhLCBidXQgSSB3YW50ZWQgdG8gYXQgbGVhc3QgcG9pbnQgb3V0IHRoZQo+
IGFzcGVjdC4KCkluIGNhc2UgdGhpcyBwYXR0ZXJuIGlzIGNvbWluZyB1cCBhZ2FpbiB3ZSBtaWdo
dCB3YW50IHRvIGVuaGFuY2UKdGhlIHNjcmlwdCwgYnV0IHJpZ2h0IG5vdyBJIGRvbid0IHRoaW5r
IHRoaXMgaXMgbmVlZGVkLgoKPiAKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9rZXJuZWwuaAo+PiBAQCAtMTAwLDUgKzEwMCw4IEBAIGV4
dGVybiBlbnVtIHN5c3RlbV9zdGF0ZSB7Cj4+ICAgCj4+ICAgYm9vbF90IGlzX2FjdGl2ZV9rZXJu
ZWxfdGV4dCh1bnNpZ25lZCBsb25nIGFkZHIpOwo+PiAgIAo+PiArZXh0ZXJuIGNoYXIgeGVuX2Nv
bmZpZ19kYXRhOwo+PiArZXh0ZXJuIHVuc2lnbmVkIGludCB4ZW5fY29uZmlnX2RhdGFfc2l6ZTsK
PiAKPiBjb25zdCBmb3IgYm90aD8KClllcy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
