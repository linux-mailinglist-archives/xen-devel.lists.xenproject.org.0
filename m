Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB8FBCB25
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:22:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmcO-0006WC-13; Tue, 24 Sep 2019 15:20:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCmcM-0006Vd-Ew
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:20:42 +0000
X-Inumbo-ID: deb653aa-dede-11e9-9621-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id deb653aa-dede-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:20:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA9A0AF13;
 Tue, 24 Sep 2019 15:20:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-34-jgross@suse.com>
 <084a148f-ad84-9c43-339b-cdd0a7365cde@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2954afb2-8901-fd2d-14d6-5004d476e773@suse.com>
Date: Tue, 24 Sep 2019 17:20:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <084a148f-ad84-9c43-339b-cdd0a7365cde@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 33/47] xen/sched: add a percpu resource
 index
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTI6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+
PiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGlj
IHZvaWQgcG9sbF90aW1lcl9mbih2b2lkICpkYXRhKTsKPj4gICAvKiBUaGlzIGlzIGdsb2JhbCBm
b3Igbm93IHNvIHRoYXQgcHJpdmF0ZSBpbXBsZW1lbnRhdGlvbnMgY2FuIHJlYWNoIGl0ICovCj4+
ICAgREVGSU5FX1BFUl9DUFUoc3RydWN0IHNjaGVkdWxlciAqLCBzY2hlZHVsZXIpOwo+PiAgIERF
RklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqLCBzY2hlZF9y
ZXMpOwo+PiArc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwg
c2NoZWRfcmVzX2lkeCk7Cj4gCj4gSXQncyBvZiBjb3Vyc2Ugbm90IHZlcnkgaGVscGZ1bCB0aGF0
IHRoaXMgdmFyaWFibGUgKHJpZ2h0IGhlcmUpIGRvZXNuJ3QKPiBldmVyIGdldCB3cml0dGVuIHRv
LCBhbmQgaGVuY2Ugb25lIGNhbid0IGp1ZGdlIHdoZXJlIC8gaG93IHRoaXMgaXMgdG8KPiBiZSBk
b25lICh3aXRob3V0IGdvaW5nIGxvb2sgZWxzZXdoZXJlKS4gQnV0IEkgZ3Vlc3MgdGhhdCBjYWxj
dWxhdGlvbgo+IGNhbid0IGJlIG1vdmVkIGludG8gdGhpcyBwYXRjaCAoYWNjZXB0aW5nIHRoYXQg
aXQgd291bGQgYWx3YXlzIHlpZWxkCj4gemVybyBmb3Igbm93KT8KCk5vdCBlYXNpbHkuIEkgY2Fu
IHNldCBzY2hlZF9yZXNfaWR4IHRvIDAgZXhwbGljaXRseSB3aGVuIGluaXRpYWxpemluZwphIG5l
dyBjcHUgaWYgeW91IGxpa2UgdGhhdCBiZXR0ZXIuCgo+IAo+PiBAQCAtMTM1LDYgKzEzNiwxMiBA
QCBzdGF0aWMgc3RydWN0IHNjaGVkdWxlciBzY2hlZF9pZGxlX29wcyA9IHsKPj4gICAgICAgLnN3
aXRjaF9zY2hlZCAgID0gc2NoZWRfaWRsZV9zd2l0Y2hfc2NoZWQsCj4+ICAgfTsKPj4gICAKPj4g
K3N0YXRpYyBpbmxpbmUgc3RydWN0IHZjcHUgKnNjaGVkX3VuaXQydmNwdV9jcHUoc3RydWN0IHNj
aGVkX3VuaXQgKnVuaXQsCj4gCj4gY29uc3QgKG9uIHRoZSBwYXJhbWV0ZXIpPwoKT2theS4KCj4g
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBjcHUpCj4+ICt7Cj4+ICsgICAgcmV0dXJuIHVuaXQtPmRvbWFpbi0+dmNwdVt1bml0
LT51bml0X2lkICsgcGVyX2NwdShzY2hlZF9yZXNfaWR4LCBjcHUpXTsKPj4gK30KPj4gKwo+PiAg
IHN0YXRpYyBpbmxpbmUgc3RydWN0IHNjaGVkdWxlciAqZG9tX3NjaGVkdWxlcihjb25zdCBzdHJ1
Y3QgZG9tYWluICpkKQo+PiAgIHsKPj4gICAgICAgaWYgKCBsaWtlbHkoZC0+Y3B1cG9vbCAhPSBO
VUxMKSApCj4+IEBAIC0yMDA4LDcgKzIwMTUsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZF9zbGF2ZSh2
b2lkKQo+PiAgIAo+PiAgICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsK
Pj4gICAKPj4gLSAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgbmV4dC0+dmNwdV9saXN0
LCBub3cpOwo+PiArICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCBzY2hlZF91bml0MnZj
cHVfY3B1KG5leHQsIGNwdSksIG5vdyk7Cj4+ICAgfQo+IAo+IEJ5IHRoZSBlbmQgb2YgdGhlIHNl
cmllcyB0aGlzIHdpbGwgYmUKPiAKPiAgICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2LCBz
Y2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBpc19pZGxlX3VuaXQobmV4dCkgJiYgIWlzX2lkbGVfdW5pdChwcmV2KSwgbm93KTsKPiAKPiBj
bGFyaWZ5aW5nIChJIHRoaW5rKSB0aGF0ICJuZXh0IiBjYW4gaW5kZWVkIGJlIGFuIGlkbGUgdW5p
dC4gSSdtIGhhdmluZwo+IGRpZmZpY3VsdHkgc2VlaW5nIGhvdyBjYW4gcHJvZHVjZSB0aGUgY29y
cmVjdCByZXN1bHQgaW4gYWxsIHRocmVlIGNhc2VzCj4gLSBhbGwgdkNQVS1zIGluIHRoZSB1bml0
IGJlbG9uZyB0byBhIHJlYWwgZG9tYWluCj4gLSBhbGwgdkNQVS1zIGluIHRoZSB1bml0IGJlbG9u
ZyB0byB0aGUgaWRsZSBkb21haW4KPiAtIHRoZXJlJ3MgYSBtaXggb2YgInJlYWwiIGFuZCAoZmls
bGVyKSAiaWRsZSIgdkNQVS1zCj4gTXkgbWFpbiBxdWVzdGlvbiBpcyB3aGF0ICJuZXh0IiBpcyBp
biB0aGUgbGFzdCBvZiB0aGUgMyBjYXNlcyBhYm92ZS4KCm5leHQgcG9pbnRzIHRvIHRoZSByZWFs
IGRvbWFpbidzIHVuaXQuCgo+IENvbnNpZGVyaW5nIHRoYXQgc2NoZWR1bGluZyBoYXBwZW5zIGlu
IHRlcm1zIG9mIHVuaXRzLCBJJ2QgZXhwZWN0IGl0IHRvCj4gYmUgYSByZWFsIGRvbWFpbidzIHVu
aXQsIHlldCB0aGVuIEkgZG9uJ3Qgc2VlIGhvdyB5b3UnZCBnZXQgYXQgdGhlCj4gY29ycmVjdCAo
aWRsZSkgdkNQVSB3aGVuIGNhbGxpbmcgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpLgoK
V2hhdCBpcyB0aGUgcHJvYmxlbT8KCnNjaGVkX3VuaXQydmNwdV9jcHUoKSB3aWxsIGZpcnN0IGdl
dCB0aGUgcmVhbCBkb21haW4ncyB2Y3B1IGZvciB0aGF0IGNwdQooaWYgZXhpc2l0aW5nKSBhbmQg
cmVwbGFjZSBpdCBieSB0aGUgaWRsZSB2Y3B1IG9mIHRoYXQgY3B1IGlmIHRoZSByZWFsCmRvbWFp
bidzIHZjcHUgaXMgZWl0aGVyIG5vdCBleGlzdGluZyBvciB3b24ndCBiZSBydW5uaW5nLiBUaGUg
bWFpbiB0cmljawppcyB0aGF0IHdlIHVzZSBpZGxlX3ZjcHVbY3B1XSAod2hpY2ggaXMgZXhpc3Rp
bmcgdG9kYXkgYWxyZWFkeSkuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
