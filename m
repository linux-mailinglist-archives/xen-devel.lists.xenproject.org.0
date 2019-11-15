Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F5FE0F6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:13:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdF7-0002nO-T5; Fri, 15 Nov 2019 15:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jkvn=ZH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iVdF6-0002nJ-M6
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:10:36 +0000
X-Inumbo-ID: 1309635a-07ba-11ea-a271-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1309635a-07ba-11ea-a271-12813bfff9fa;
 Fri, 15 Nov 2019 15:10:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0A72B175;
 Fri, 15 Nov 2019 15:10:34 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, Steven Haigh <netwiz@crc.id.au>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <1573828317.2460.0@crc.id.au>
 <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <98e13c5d-fdc9-3805-3081-9a001d69898a@suse.com>
Date: Fri, 15 Nov 2019 16:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTY6MDUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gRlRSLCBwbGVhc2UgYXZv
aWQgdG9wLXBvc3RpbmcuIDotKQo+IAo+IE9uIDExLzE1LzE5IDI6MzEgUE0sIFN0ZXZlbiBIYWln
aCB3cm90ZToKPj4gSnVzdCByZWdhcmRpbmcgdGhlIHVzZSBvZiBhIHN5c3RlbSBlbnZpcm9ubWVu
dCB2YXJpYWJsZSB0byB0dXJuIHRoaXMKPj4gZmVhdHVyZSAvIGJ1Z2ZpeCAvIGhhY2sgb24gYW5k
IG9mZiAtIHRoaXMgd291bGQgcHJvYmFibHkgYnJlYWsgc3RhcnRpbmcKPj4gdGhlIFZNIHZpYSB0
aGUgeGVuZG9tYWlucyBzY3JpcHQuCj4+Cj4+IElmIHRoZSBWTSBkZWZpbml0aW9uIGlzIGluIC9l
dGMveGVuL2F1dG8vLCB0aGVuIHRoZXJlIHdvdWxkIGJlIG5vdGhpbmcKPj4gdG8gc2V0IHRoZSBl
bnZpcm9ubWVudCB2YXJpYWJsZSBiZWZvcmUgdGhlIFZNIGlzIGxhdW5jaGVkIC0gaGVuY2UgaXQK
Pj4gd291bGQgbm90IGJlIGFwcGxpZWQgYW5kIGEgZ3Vlc3QgY3Jhc2ggd291bGQgb2NjdXIuLi4K
Pj4KPj4gRGVwZW5kaW5nIG9uIHRoZSBWTSdzIHNldHRpbmdzLCB0aGlzIHdvdWxkIGVpdGhlciBj
b250aW51ZSB0byBzdGFydCAmCj4+IGNyYXNoIC0gb3IganVzdCBzdG9wIGFnYWluIHVudGlsIGl0
IGNvdWxkIGJlIHN0YXJ0ZWQgd2l0aCB0aGUgRU5WIHZhcmlhYmxlLgo+IAo+IFJpZ2h0LiAgU28g
YSBjb3VwbGUgb2Ygb3B0aW9uczoKPiAKPiAxLiBVc2VycyBvZiB4ZW5kb21haW5zIGNvdWxkIHNl
dCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgaW4gdGhlaXIKPiB4ZW5kb21haW5zIHNjcmlwdAo+
IAo+IDIuIFdlIGNvdWxkIGFkZCBhIHhsLmNmZyBvcHRpb24uICBVbmtub3duIHhsLmNmZyBlbnRy
aWVzIGFyZSBpZ25vcmVkCj4gKGZvciBiZXR0ZXIgb3IgZm9yIHdvcnNlKTsgaW4gdGhlIGZ1dHVy
ZSwgd2hlbiB0aGUgImZha2UgaHQiIHRoaW5nIGlzCj4gcmVwbGFjZWQsIHdlIGNhbiBlaXRoZXIg
Y29udGludWUgaWdub3JpbmcgaXQsIG9yIGdpdmUgYSB1c2VmdWwgZXJyb3IKPiBtZXNzYWdlIHNh
eWluZyBob3cgaXQgc2hvdWxkIGJlIGNoYW5nZWQuCj4gCj4gMmEuICBXZSBjb3VsZCBoYXZlIHRo
ZSBjb25maWcgb3B0aW9uICpyZXBsYWNlKiB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGU7Cj4gaW4g
d2hpY2ggY2FzZSB3ZSdkIGxlYXZlIGxpYnZpcnQgdXNlcnMgaGlnaCBhbmQgZHJ5Cj4gCj4gMmIu
IFdlIGNvdWxkIGhhdmUgdGhlIGNvbmZpZyBvcHRpb24gY2F1c2UgeGwgdG8gKnNldCogdGhlIGVu
dmlyb25tZW50Cj4gdmFyaWFibGUsIHdoaWNoIHNob3VsZCBjb250aW51ZSB0byBhbGxvdyBvdGhl
ciB0b29sc3RhY2tzIChldmVuIHRob3NlCj4gbm90IHVzaW5nIGxpYnhsKSB0byBwb3RlbnRpYWxs
eSB3b3JrIGFyb3VuZCB0aGUgaXNzdWUuCj4gCj4gUmlnaHQgbm93IEknbSBsZWFuaW5nIHRvd2Fy
ZHMgMmIsIGFuZCBoYXZpbmcgaXQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KCkluIHdoaWNoIGNh
c2Ugd2Ugc2hvdWxkIGNvbnNpZGVyIGhhdmluZyBhIHdheSB0byBzZXQgYXJiaXRyYXJ5CmVudmly
b25tZW50IHZhcmlhYmxlcyBmcm9tIHRoZSBjb25maWcgZmlsZSBpbiBvcmRlciB0byBhdm9pZCB0
aGlzIGtpbmQKb2YgZGlzY3Vzc2lvbiBpbiBmdXR1cmUgc2ltaWxhciBjYXNlcy4KCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
