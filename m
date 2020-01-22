Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2851458D3
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:33:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHxb-0005TP-Db; Wed, 22 Jan 2020 15:30:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuHxa-0005TK-9d
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:30:26 +0000
X-Inumbo-ID: 175c9c0e-3d2c-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 175c9c0e-3d2c-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 15:30:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 372EBAD72;
 Wed, 22 Jan 2020 15:30:16 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <a62c17b05d8c2de1d6c2a08874092d81ab86db04.1579628566.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dba48653-b26f-98d1-7c09-12c1a3227392@suse.com>
Date: Wed, 22 Jan 2020 16:30:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <a62c17b05d8c2de1d6c2a08874092d81ab86db04.1579628566.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 11/18] x86/mem_sharing: Replace
 MEM_SHARING_DEBUG with gdprintk
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC01MzgsMjQg
KzUzNSwyNiBAQCBzdGF0aWMgaW50IGF1ZGl0KHZvaWQpCj4gICAgICAgICAgICAgIGQgPSBnZXRf
ZG9tYWluX2J5X2lkKGctPmRvbWFpbik7Cj4gICAgICAgICAgICAgIGlmICggZCA9PSBOVUxMICkK
PiAgICAgICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgTUVNX1NIQVJJTkdfREVCVUcoIlVu
a25vd24gZG9tOiAlaHUsIGZvciBQRk49JWx4LCBNRk49JWx4XG4iLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZy0+ZG9tYWluLCBnLT5nZm4sIG1mbl94KG1mbikpOwo+ICsg
ICAgICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICJVbmtub3duIGRvbTogJXBkLCBmb3IgUEZOPSVseCwgTUZOPSVseFxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgIGQsIGctPmdmbiwgbWZuX3gobWZuKSk7CgpXaXRoICJpZiAo
IGQgPT0gTlVMTCApIiBhcm91bmQgdGhpcyB5b3UgaGFyZGx5IG1lYW4gdG8gcGFzcyBkIHRvCnRo
ZSBmdW5jdGlvbiBoZXJlLiBUaGlzIGlzIGEgY2FzZSB3aGVyZSB5b3UgcmVhbGx5IG5lZWQgdG8g
c3RpY2sKdG8gbG9nZ2luZyBhIHJhdyBudW1iZXIuCgo+ICAgICAgICAgICAgICAgICAgZXJyb3Jz
Kys7Cj4gICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgICAgfQo+ICAgICAg
ICAgICAgICBvX21mbiA9IGdldF9nZm5fcXVlcnlfdW5sb2NrZWQoZCwgZy0+Z2ZuLCAmdCk7Cj4g
ICAgICAgICAgICAgIGlmICggIW1mbl9lcShvX21mbiwgbWZuKSApCj4gICAgICAgICAgICAgIHsK
PiAtICAgICAgICAgICAgICAgIE1FTV9TSEFSSU5HX0RFQlVHKCJJbmNvcnJlY3QgUDJNIGZvciBk
PSVodSwgUEZOPSVseC4iCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiRXhw
ZWN0aW5nIE1GTj0lbHgsIGdvdCAlbHhcbiIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnLT5kb21haW4sIGctPmdmbiwgbWZuX3gobWZuKSwgbWZuX3gob19tZm4pKTsKPiAr
ICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJJbmNvcnJlY3QgUDJNIGZvciBk
PSVwZCwgUEZOPSVseC4iCgpIZXJlIGFuZCBlbHNld2hlcmUgbWF5IEkgcmVjb21tZW5kIGRyb3Bw
aW5nIGQ9IChvciBkb209IGZ1cnRoZXIKZG93bik/Cgo+IEBAIC03NTcsMTAgKzc1NiwxMCBAQCBz
dGF0aWMgaW50IGRlYnVnX21mbihtZm5fdCBtZm4pCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gICAgICB9Cj4gIAo+IC0gICAgTUVNX1NIQVJJTkdfREVCVUcoCj4gLSAgICAgICAgIkRlYnVn
IHBhZ2U6IE1GTj0lbHggaXMgY2k9JWx4LCB0aT0lbHgsIG93bmVyPSVwZFxuIiwKPiAtICAgICAg
ICBtZm5feChwYWdlX3RvX21mbihwYWdlKSksIHBhZ2UtPmNvdW50X2luZm8sCj4gLSAgICAgICAg
cGFnZS0+dS5pbnVzZS50eXBlX2luZm8sIHBhZ2VfZ2V0X293bmVyKHBhZ2UpKTsKPiArICAgIGdk
cHJpbnRrKFhFTkxPR19FUlIsCj4gKyAgICAgICAgICAgICAiRGVidWcgcGFnZTogTUZOPSVseCBp
cyBjaT0lbHgsIHRpPSVseCwgb3duZXJfaWQ9JWRcbiIsCj4gKyAgICAgICAgICAgICBtZm5feChw
YWdlX3RvX21mbihwYWdlKSksIHBhZ2UtPmNvdW50X2luZm8sCj4gKyAgICAgICAgICAgICBwYWdl
LT51LmludXNlLnR5cGVfaW5mbywgcGFnZV9nZXRfb3duZXIocGFnZSktPmRvbWFpbl9pZCk7CgpB
cyBpbmRpY2F0ZWQgYmVmb3JlIChJIHRoaW5rKSwgcGxlYXNlIHByZWZlciAlcGQgYW5kIGEgc3Ry
dWN0IGRvbWFpbgpwb2ludGVyIG92ZXIgcGFzc2luZyAtPmRvbWFpbl9pZCAoYXQgbGVhc3Qgb25l
IG1vcmUgaW5zdGFuY2UgZnVydGhlcgpkb3duKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
