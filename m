Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC61553AD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 09:26:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izyud-0004Zf-Fc; Fri, 07 Feb 2020 08:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izyuc-0004Za-Ku
 for xen-devel@lists.xen.org; Fri, 07 Feb 2020 08:22:54 +0000
X-Inumbo-ID: 09111586-4983-11ea-a759-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09111586-4983-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 08:22:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71A26B15D;
 Fri,  7 Feb 2020 08:22:52 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
 <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <030eac1d-85b1-fa91-135e-00462eefeb92@suse.com>
Date: Fri, 7 Feb 2020 09:23:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <38a28a9d-cc99-0776-1f8b-4103df3d3e9c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAwOTowNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNi4wMi4yMCAx
NTowMiwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMDYvMDIvMjAyMCAxMTowNSwgU2VyZ2V5
IER5YXNsaSB3cm90ZToKPj4+IE9uIDA2LzAyLzIwMjAgMDk6NTcsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4+Pj4gT24gMDUuMDIuMjAgMTc6MDMsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+Pj4+IEhl
bGxvLAo+Pj4+Pgo+Pj4+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpbmcgYSBMaXZlLVBhdGNo
IGFwcGxpY2F0aW9uIGZhaWx1cmUgaW4gY29yZS0KPj4+Pj4gc2NoZWR1bGluZyBtb2RlIGFuZCB0
aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0Ogo+Pj4+PiAoaXQncyBlYXNp
bHkgcmVwcm9kdWNpYmxlKQo+Pj4+Pgo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTI4MzA1XSBs
aXZlcGF0Y2g6IGxwOiBDUFU4IC0gSVBJaW5nIHRoZSBvdGhlciAxNSBDUFVzCj4+Pj4+ICAgICAg
IChYRU4pIFsgIDM0Mi41NTgzNDBdIGxpdmVwYXRjaDogbHA6IFRpbWVkIG91dCBvbiBzZW1hcGhv
cmUgaW4gQ1BVIHF1aWVzY2UgcGhhc2UgMTMvMTUKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1
ODM0M10gYmFkIGNwdXM6IDYgOQo+Pj4+Pgo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5Mjkz
XSBDUFU6ICAgIDYKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTU2Ml0gWGVuIGNhbGwgdHJh
Y2U6Cj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjVdICAgIFs8ZmZmZjgyZDA4MDIzZjMw
ND5dIFIgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTQvMHgy
NzAKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTU2OF0gICAgWzxmZmZmODJkMDgwMjNmOGFh
Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZHVsZSsweDE3YS8weDI2MAo+Pj4+PiAgICAgICAo
WEVOKSBbICAzNDIuNTU5NTcxXSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBGIGNvbW1vbi9zb2Z0
aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEvMHg5MAo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5
NTc0XSAgICBbPGZmZmY4MmQwODAyNzhlYzU+XSBGIGFyY2gveDg2L2RvbWFpbi5jI2d1ZXN0X2lk
bGVfbG9vcCsweDM1LzB4NjAKPj4+Pj4KPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU1OTc2MV0g
Q1BVOiAgICA5Cj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAwMjZdIFhlbiBjYWxsIHRyYWNl
Ogo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTYwMDI5XSAgICBbPGZmZmY4MmQwODAyNDE2NjE+
XSBSIF9zcGluX2xvY2tfaXJxKzB4MTEvMHg0MAo+Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTYw
MDMyXSAgICBbPGZmZmY4MmQwODAyM2YzMjM+XSBGIGNvbW1vbi9zY2hlZHVsZS5jI3NjaGVkX3dh
aXRfcmVuZGV6dm91c19pbisweGMzLzB4MjcwCj4+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAw
MzZdICAgIFs8ZmZmZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWR1bGUr
MHgxN2EvMHgyNjAKPj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU2MDAzOV0gICAgWzxmZmZmODJk
MDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAKPj4+
Pj4gICAgICAgKFhFTikgWyAgMzQyLjU2MDA0Ml0gICAgWzxmZmZmODJkMDgwMjc5ZGI1Pl0gRiBh
cmNoL3g4Ni9kb21haW4uYyNpZGxlX2xvb3ArMHg1NS8weGIwCj4+Pj4+Cj4+Pj4+IFRoZSBmaXJz
dCBIVCBzaWJsaW5nIGlzIHdhaXRpbmcgZm9yIHRoZSBzZWNvbmQgaW4gdGhlIExQLWFwcGxpY2F0
aW9uCj4+Pj4+IGNvbnRleHQgd2hpbGUgdGhlIHNlY29uZCB3YWl0cyBmb3IgdGhlIGZpcnN0IGlu
IHRoZSBzY2hlZHVsZXIgY29udGV4dC4KPj4+Pj4KPj4+Pj4gQW55IHN1Z2dlc3Rpb25zIG9uIGhv
dyB0byBpbXByb3ZlIHRoaXMgc2l0dWF0aW9uIGFyZSB3ZWxjb21lLgo+Pj4+Cj4+Pj4gQ2FuIHlv
dSB0ZXN0IHRoZSBhdHRhY2hlZCBwYXRjaCwgcGxlYXNlPyBJdCBpcyBvbmx5IHRlc3RlZCB0byBi
b290LCBzbwo+Pj4+IEkgZGlkIG5vIGxpdmVwYXRjaCB0ZXN0cyB3aXRoIGl0Lgo+Pj4KPj4+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoISBJdCBzZWVtcyB0byBmaXggdGhlIGlzc3VlIGluIG15IG1h
bnVhbCB0ZXN0aW5nLgo+Pj4gSSdtIGdvaW5nIHRvIHN1Ym1pdCBhdXRvbWF0aWMgTFAgdGVzdGlu
ZyBmb3IgYm90aCB0aHJlYWQvY29yZSBtb2Rlcy4KPj4KPj4gQW5kcmV3IHN1Z2dlc3RlZCB0byB0
ZXN0IGxhdGUgdWNvZGUgbG9hZGluZyBhcyB3ZWxsIGFuZCBzbyBJIGRpZC4KPj4gSXQgdXNlcyBz
dG9wX21hY2hpbmUoKSB0byByZW5kZXp2b3VzIGNwdXMgYW5kIGl0IGZhaWxlZCB3aXRoIGEgc2lt
aWxhcgo+PiBiYWNrdHJhY2UgZm9yIGEgcHJvYmxlbWF0aWMgQ1BVLiBCdXQgaW4gdGhpcyBjYXNl
IHRoZSBzeXN0ZW0gY3Jhc2hlZAo+PiBzaW5jZSB0aGVyZSBpcyBubyB0aW1lb3V0IGludm9sdmVk
Ogo+Pgo+PiAgICAgIChYRU4pIFsgIDE1NS4wMjUxNjhdIFhlbiBjYWxsIHRyYWNlOgo+PiAgICAg
IChYRU4pIFsgIDE1NS4wNDAwOTVdICAgIFs8ZmZmZjgyZDA4MDI0MTdmMj5dIFIgX3NwaW5fdW5s
b2NrX2lycSsweDIyLzB4MzAKPj4gICAgICAoWEVOKSBbICAxNTUuMDY5NTQ5XSAgICBbPGZmZmY4
MmQwODAyM2YzYzI+XSBTIGNvbW1vbi9zY2hlZHVsZS5jI3NjaGVkX3dhaXRfcmVuZGV6dm91c19p
bisweGEyLzB4MjcwCj4+ICAgICAgKFhFTikgWyAgMTU1LjEwOTY5Nl0gICAgWzxmZmZmODJkMDgw
MjNmNzI4Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF9zbGF2ZSsweDE5OC8weDI2MAo+PiAg
ICAgIChYRU4pIFsgIDE1NS4xNDU1MjFdICAgIFs8ZmZmZjgyZDA4MDI0MGUxYT5dIEYgY29tbW9u
L3NvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg1YS8weDkwCj4+ICAgICAgKFhFTikgWyAgMTU1LjE4
MDIyM10gICAgWzxmZmZmODJkMDgwMzcxNmY2Pl0gRiB4ODZfNjQvZW50cnkuUyNwcm9jZXNzX3Nv
ZnRpcnFzKzB4Ni8weDIwCj4+Cj4+IEl0IGxvb2tzIGxpa2UgeW91ciBwYXRjaCBwcm92aWRlcyBh
IHdvcmthcm91bmQgZm9yIExQIGNhc2UsIGJ1dCBvdGhlcgo+PiBjYXNlcyBsaWtlIHN0b3BfbWFj
aGluZSgpIHJlbWFpbiBicm9rZW4gc2luY2UgdGhlIHVuZGVybHlpbmcgaXNzdWUgd2l0aAo+PiB0
aGUgc2NoZWR1bGVyIGlzIHN0aWxsIHRoZXJlLgo+IAo+IEFuZCBoZXJlIGlzIHRoZSBmaXggZm9y
IHVjb2RlIGxvYWRpbmcgKHRoYXQgd2FzIGluIGZhY3QgdGhlIG9ubHkgY2FzZQo+IHdoZXJlIHN0
b3BfbWFjaGluZV9ydW4oKSB3YXNuJ3QgYWxyZWFkeSBjYWxsZWQgaW4gYSB0YXNrbGV0KS4KClRo
aXMgaXMgYSByYXRoZXIgb2RkIHJlc3RyaWN0aW9uLCBhbmQgaGVuY2Ugd2lsbCBuZWVkIGV4cGxh
aW5pbmcuCldpdGhvdXQgaXQgYmVpbmcgZW50aXJlbHkgY2xlYXIgdGhhdCB0aGVyZSdzIG5vIGFs
dGVybmF0aXZlIHRvCml0LCBJIGRvbid0IHRoaW5rIEknZCBiZSBmaW5lIHdpdGggcmUtaW50cm9k
dWN0aW9uIG9mCmNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwgLi4uKSBpbnRvIHVjb2RlIGxv
YWRpbmcuCgpBbHNvIHR3byByZW1hcmtzIG9uIHRoZSBwYXRjaCBpdHNlbGY6IHN0cnVjdCB1Y29k
ZV9idWYncyBsZW4KZmllbGQgY2FuIGJlIHVuc2lnbmVkIGludCwgc2VlaW5nIHRoZSB2ZXJ5IGZp
cnN0IGNoZWNrIGRvbmUgaW4KbWljcm9jb2RlX3VwZGF0ZSgpLiBBbmQgaW5zdGVhZCBvZiB4bWFs
bG9jX2J5dGVzKCkgcGxlYXNlIHNlZQp3aGV0aGVyIHlvdSBjYW4gbWFrZSB1c2Ugb2YgeG1hbGxv
Y19mbGV4X3N0cnVjdCgpIHRoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
