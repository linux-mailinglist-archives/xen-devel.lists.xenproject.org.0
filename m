Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAACBC659
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:12:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCih9-0003Xi-Pi; Tue, 24 Sep 2019 11:09:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCih8-0003Wu-Ae
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:09:22 +0000
X-Inumbo-ID: f908675a-deb3-11e9-ae5c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f908675a-deb3-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 10:13:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A191DAD8C;
 Tue, 24 Sep 2019 10:13:36 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-33-jgross@suse.com>
 <04d23beb-5370-a538-7cc1-785086e10491@suse.com>
 <44e0610b-e089-f602-2748-f3a3c923b511@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8af6ac2b-2e8b-7eee-ad2c-0c5ee56135b7@suse.com>
Date: Tue, 24 Sep 2019 12:13:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <44e0610b-e089-f602-2748-f3a3c923b511@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxMjowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
MTo0NiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMzY2LDE4ICszODAsMzggQEAgc3RhdGljIHZvaWQgc2NoZWRf
ZnJlZV91bml0KHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+Pj4gICAgICAgeGZyZWUodW5pdCk7
Cj4+PiAgIH0KPj4+ICAgCj4+PiArc3RhdGljIHZvaWQgc2NoZWRfdW5pdF9hZGRfdmNwdShzdHJ1
Y3Qgc2NoZWRfdW5pdCAqdW5pdCwgc3RydWN0IHZjcHUgKnYpCj4+PiArewo+Pj4gKyAgICB2LT5z
Y2hlZF91bml0ID0gdW5pdDsKPj4+ICsgICAgaWYgKCAhdW5pdC0+dmNwdV9saXN0IHx8IHVuaXQt
PnZjcHVfbGlzdC0+dmNwdV9pZCA+IHYtPnZjcHVfaWQgKQo+Pgo+PiBJcyB0aGUgcmlnaHQgc2lk
ZSBuZWVkZWQ/IEFyZW4ndCB2Q1BVLXMgY3JlYXRlZCBpbiBpbmNyZWFzaW5nIG9yZGVyCj4+IG9m
IHRoZWlyIElEcywgYW5kIGFyZW4ndCB3ZSByZWx5aW5nIG9uIHRoaXMgZWxzZXdoZXJlIHRvbz8K
PiAKPiBJZGxlIHZjcHVzIGFyZSByYXRoZXIgc3BlY2lhbCBhbmQgdGhleSByZXF1aXJlIHRoZSBz
ZWNvbmQgdGVzdC4KCkhvdyBhYm91dCBhIGNvZGUgY29tbWVudCB0byB0aGlzIGVmZmVjdD8KCj4+
PiArICAgIHsKPj4+ICsgICAgICAgIHVuaXQtPnZjcHVfbGlzdCA9IHY7Cj4+PiArICAgICAgICB1
bml0LT51bml0X2lkID0gdi0+dmNwdV9pZDsKPj4KPj4gVGhpcyBtYWtlcyBmb3IgYSBwcmV0dHkg
c3RyYW5nZSBzZXQgb2YgSURzIChub24tc3VjY2Vzc2l2ZSksIGFuZAo+PiBleHBsYWlucyB3aHkg
cGF0Y2ggMjQgdXNlcyBhIGxvY2FsICJ1bml0X2lkeCIgaW5zdGVhZCBvZiBzd2l0Y2hpbmcKPj4g
ZnJvbSB2LT52Y3B1X2lkIGFzIGFycmF5IGluZGV4IHRvIHVuaXQtPnVuaXRfaWQuIElzIHRoZXJl
IGEgcmVhc29uCj4+IHlvdSBkb24ndCBkaXZpZGUgYnkgdGhlIGdyYW51bGFyaXR5IGhlcmUsIGVs
aW1pbmF0aW5nIHRoZSBkaXZpc2lvbgo+PiBkb25lIGUuZy4gLi4uCj4gCj4gQ3B1cyBub3QgaW4g
YSBjcHVwb29sIGFyZSBpbiBzaW5nbGUtdmNwdSB1bml0cywgc28gaW4gb3JkZXIgZm9yIG5vdAo+
IGhhdmluZyBjb21wbGV0ZWx5IHdlaXJkIHVuaXQtaWRzIGFmdGVyIGhhdmluZyBtb3ZlIGNwdXMg
YSBsb3QgaW4gYW5kCj4gb3V0IG9mIGNwdXBvb2xzIGtlZXBpbmcgdGhlIGN1cnJlbnQgc2NoZW1l
IGlzIHRoZSBvbmx5IG9uZSBJIGNvdWxkCj4gdGhpbmsgb2YuCgpBbmQgaG93IGFib3V0IGV4dGVu
ZGluZyB0aGUgZGVzY3JpcHRpb24gdG8gaW5jbHVkZSB0aGlzPwoKPj4+ICsgICAgfQo+Pj4gKyAg
ICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdKys7Cj4+PiArfQo+Pj4gKwo+
Pj4gICBzdGF0aWMgc3RydWN0IHNjaGVkX3VuaXQgKnNjaGVkX2FsbG9jX3VuaXQoc3RydWN0IHZj
cHUgKnYpCj4+PiAgIHsKPj4+ICAgICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0LCAqKnByZXZf
dW5pdDsKPj4+ICAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47Cj4+PiAgIAo+Pj4g
KyAgICBmb3JfZWFjaF9zY2hlZF91bml0ICggZCwgdW5pdCApCj4+PiArICAgICAgICBpZiAoIHVu
aXQtPnZjcHVfbGlzdC0+dmNwdV9pZCAvIHNjaGVkX2dyYW51bGFyaXR5ID09Cj4+Cj4+IC4uLiBo
ZXJlLiAoSSBhbHNvIGRvbid0IHNlZSB3aHkgeW91IGRvbid0IHVzZSB1bml0LT51bml0X2lkIGhl
cmUuKQoKQW5kIGlzIHRoZXJlIGEgcmVhc29uIG5vdCB0byB1c2UgdW5pdC0+dW5pdF9pZCBoZXJl
IHRoZW4sIHdoaWNoCmlzIHNsaWdodGx5IGNoZWFwZXIgdG8gYWNjZXNzPwoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
