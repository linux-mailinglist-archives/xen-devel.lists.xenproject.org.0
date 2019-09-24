Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087ABBCAF4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:16:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmVC-0005XZ-D1; Tue, 24 Sep 2019 15:13:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCmVB-0005XU-Im
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:13:17 +0000
X-Inumbo-ID: d556cd86-dedd-11e9-9620-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d556cd86-dedd-11e9-9620-12813bfff9fa;
 Tue, 24 Sep 2019 15:13:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B384FAC93;
 Tue, 24 Sep 2019 15:13:15 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-33-jgross@suse.com>
 <04d23beb-5370-a538-7cc1-785086e10491@suse.com>
 <44e0610b-e089-f602-2748-f3a3c923b511@suse.com>
 <8af6ac2b-2e8b-7eee-ad2c-0c5ee56135b7@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fa187c4e-4199-c250-8ba1-6ac153367902@suse.com>
Date: Tue, 24 Sep 2019 17:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8af6ac2b-2e8b-7eee-ad2c-0c5ee56135b7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 32/47] xen/sched: support allocating
 multiple vcpus into one sched unit
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

T24gMjQuMDkuMTkgMTI6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTI6
MDYsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI0LjA5LjE5IDExOjQ2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTM2NiwxOCArMzgwLDM4IEBAIHN0YXRpYyB2b2lkIHNjaGVkX2ZyZWVfdW5pdChzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4+PiAgICAgICAgeGZyZWUodW5pdCk7Cj4+Pj4gICAgfQo+
Pj4+ICAgIAo+Pj4+ICtzdGF0aWMgdm9pZCBzY2hlZF91bml0X2FkZF92Y3B1KHN0cnVjdCBzY2hl
ZF91bml0ICp1bml0LCBzdHJ1Y3QgdmNwdSAqdikKPj4+PiArewo+Pj4+ICsgICAgdi0+c2NoZWRf
dW5pdCA9IHVuaXQ7Cj4+Pj4gKyAgICBpZiAoICF1bml0LT52Y3B1X2xpc3QgfHwgdW5pdC0+dmNw
dV9saXN0LT52Y3B1X2lkID4gdi0+dmNwdV9pZCApCj4+Pgo+Pj4gSXMgdGhlIHJpZ2h0IHNpZGUg
bmVlZGVkPyBBcmVuJ3QgdkNQVS1zIGNyZWF0ZWQgaW4gaW5jcmVhc2luZyBvcmRlcgo+Pj4gb2Yg
dGhlaXIgSURzLCBhbmQgYXJlbid0IHdlIHJlbHlpbmcgb24gdGhpcyBlbHNld2hlcmUgdG9vPwo+
Pgo+PiBJZGxlIHZjcHVzIGFyZSByYXRoZXIgc3BlY2lhbCBhbmQgdGhleSByZXF1aXJlIHRoZSBz
ZWNvbmQgdGVzdC4KPiAKPiBIb3cgYWJvdXQgYSBjb2RlIGNvbW1lbnQgdG8gdGhpcyBlZmZlY3Q/
CgpPa2F5LgoKPiAKPj4+PiArICAgIHsKPj4+PiArICAgICAgICB1bml0LT52Y3B1X2xpc3QgPSB2
Owo+Pj4+ICsgICAgICAgIHVuaXQtPnVuaXRfaWQgPSB2LT52Y3B1X2lkOwo+Pj4KPj4+IFRoaXMg
bWFrZXMgZm9yIGEgcHJldHR5IHN0cmFuZ2Ugc2V0IG9mIElEcyAobm9uLXN1Y2Nlc3NpdmUpLCBh
bmQKPj4+IGV4cGxhaW5zIHdoeSBwYXRjaCAyNCB1c2VzIGEgbG9jYWwgInVuaXRfaWR4IiBpbnN0
ZWFkIG9mIHN3aXRjaGluZwo+Pj4gZnJvbSB2LT52Y3B1X2lkIGFzIGFycmF5IGluZGV4IHRvIHVu
aXQtPnVuaXRfaWQuIElzIHRoZXJlIGEgcmVhc29uCj4+PiB5b3UgZG9uJ3QgZGl2aWRlIGJ5IHRo
ZSBncmFudWxhcml0eSBoZXJlLCBlbGltaW5hdGluZyB0aGUgZGl2aXNpb24KPj4+IGRvbmUgZS5n
LiAuLi4KPj4KPj4gQ3B1cyBub3QgaW4gYSBjcHVwb29sIGFyZSBpbiBzaW5nbGUtdmNwdSB1bml0
cywgc28gaW4gb3JkZXIgZm9yIG5vdAo+PiBoYXZpbmcgY29tcGxldGVseSB3ZWlyZCB1bml0LWlk
cyBhZnRlciBoYXZpbmcgbW92ZSBjcHVzIGEgbG90IGluIGFuZAo+PiBvdXQgb2YgY3B1cG9vbHMg
a2VlcGluZyB0aGUgY3VycmVudCBzY2hlbWUgaXMgdGhlIG9ubHkgb25lIEkgY291bGQKPj4gdGhp
bmsgb2YuCj4gCj4gQW5kIGhvdyBhYm91dCBleHRlbmRpbmcgdGhlIGRlc2NyaXB0aW9uIHRvIGlu
Y2x1ZGUgdGhpcz8KCk9rYXkuCgo+IAo+Pj4+ICsgICAgfQo+Pj4+ICsgICAgdW5pdC0+cnVuc3Rh
dGVfY250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICAgIHN0YXRp
YyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfYWxsb2NfdW5pdChzdHJ1Y3QgdmNwdSAqdikKPj4+
PiAgICB7Cj4+Pj4gICAgICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCAqKnByZXZfdW5pdDsK
Pj4+PiAgICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsKPj4+PiAgICAKPj4+PiAr
ICAgIGZvcl9lYWNoX3NjaGVkX3VuaXQgKCBkLCB1bml0ICkKPj4+PiArICAgICAgICBpZiAoIHVu
aXQtPnZjcHVfbGlzdC0+dmNwdV9pZCAvIHNjaGVkX2dyYW51bGFyaXR5ID09Cj4+Pgo+Pj4gLi4u
IGhlcmUuIChJIGFsc28gZG9uJ3Qgc2VlIHdoeSB5b3UgZG9uJ3QgdXNlIHVuaXQtPnVuaXRfaWQg
aGVyZS4pCj4gCj4gQW5kIGlzIHRoZXJlIGEgcmVhc29uIG5vdCB0byB1c2UgdW5pdC0+dW5pdF9p
ZCBoZXJlIHRoZW4sIHdoaWNoCj4gaXMgc2xpZ2h0bHkgY2hlYXBlciB0byBhY2Nlc3M/CgpSaWdo
dCwgd2lsbCBjaGFuZ2UuCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
