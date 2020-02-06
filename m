Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ED3154635
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 15:31:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izi9v-0000Qb-GO; Thu, 06 Feb 2020 14:29:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TqwH=32=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izi9t-0000QW-LG
 for xen-devel@lists.xen.org; Thu, 06 Feb 2020 14:29:33 +0000
X-Inumbo-ID: 16dbccba-48ed-11ea-85ce-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16dbccba-48ed-11ea-85ce-bc764e2007e4;
 Thu, 06 Feb 2020 14:29:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 32880AE2B;
 Thu,  6 Feb 2020 14:29:31 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
 <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
 <6f3a1061-fd05-91e8-54ad-666ec3984ffb@citrix.com>
 <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c2a5ce0e-213d-3e6c-df71-a3efc8e2683d@suse.com>
Date: Thu, 6 Feb 2020 15:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <c5831cef-ff27-93e5-7536-2d6092ca1ad8@citrix.com>
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAgMTU6MDIsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMDYvMDIvMjAyMCAx
MTowNSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gT24gMDYvMDIvMjAyMCAwOTo1NywgSsO8cmdl
biBHcm/DnyB3cm90ZToKPj4+IE9uIDA1LjAyLjIwIDE3OjAzLCBTZXJnZXkgRHlhc2xpIHdyb3Rl
Ogo+Pj4+IEhlbGxvLAo+Pj4+Cj4+Pj4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgTGl2
ZS1QYXRjaCBhcHBsaWNhdGlvbiBmYWlsdXJlIGluIGNvcmUtCj4+Pj4gc2NoZWR1bGluZyBtb2Rl
IGFuZCB0aGlzIGlzIGFuIGV4YW1wbGUgb2Ygd2hhdCBJIHVzdWFsbHkgZ2V0Ogo+Pj4+IChpdCdz
IGVhc2lseSByZXByb2R1Y2libGUpCj4+Pj4KPj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTI4MzA1
XSBsaXZlcGF0Y2g6IGxwOiBDUFU4IC0gSVBJaW5nIHRoZSBvdGhlciAxNSBDUFVzCj4+Pj4gICAg
ICAgKFhFTikgWyAgMzQyLjU1ODM0MF0gbGl2ZXBhdGNoOiBscDogVGltZWQgb3V0IG9uIHNlbWFw
aG9yZSBpbiBDUFUgcXVpZXNjZSBwaGFzZSAxMy8xNQo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41
NTgzNDNdIGJhZCBjcHVzOiA2IDkKPj4+Pgo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTkyOTNd
IENQVTogICAgNgo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjJdIFhlbiBjYWxsIHRyYWNl
Ogo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTk1NjVdICAgIFs8ZmZmZjgyZDA4MDIzZjMwND5d
IFIgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKzB4YTQvMHgyNzAK
Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5NTY4XSAgICBbPGZmZmY4MmQwODAyM2Y4YWE+XSBG
IGNvbW1vbi9zY2hlZHVsZS5jI3NjaGVkdWxlKzB4MTdhLzB4MjYwCj4+Pj4gICAgICAgKFhFTikg
WyAgMzQyLjU1OTU3MV0gICAgWzxmZmZmODJkMDgwMjQwZDVhPl0gRiBjb21tb24vc29mdGlycS5j
I19fZG9fc29mdGlycSsweDVhLzB4OTAKPj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTU5NTc0XSAg
ICBbPGZmZmY4MmQwODAyNzhlYzU+XSBGIGFyY2gveDg2L2RvbWFpbi5jI2d1ZXN0X2lkbGVfbG9v
cCsweDM1LzB4NjAKPj4+Pgo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NTk3NjFdIENQVTogICAg
OQo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAwMjZdIFhlbiBjYWxsIHRyYWNlOgo+Pj4+ICAg
ICAgIChYRU4pIFsgIDM0Mi41NjAwMjldICAgIFs8ZmZmZjgyZDA4MDI0MTY2MT5dIFIgX3NwaW5f
bG9ja19pcnErMHgxMS8weDQwCj4+Pj4gICAgICAgKFhFTikgWyAgMzQyLjU2MDAzMl0gICAgWzxm
ZmZmODJkMDgwMjNmMzIzPl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hlZF93YWl0X3JlbmRlenZv
dXNfaW4rMHhjMy8weDI3MAo+Pj4+ICAgICAgIChYRU4pIFsgIDM0Mi41NjAwMzZdICAgIFs8ZmZm
ZjgyZDA4MDIzZjhhYT5dIEYgY29tbW9uL3NjaGVkdWxlLmMjc2NoZWR1bGUrMHgxN2EvMHgyNjAK
Pj4+PiAgICAgICAoWEVOKSBbICAzNDIuNTYwMDM5XSAgICBbPGZmZmY4MmQwODAyNDBkNWE+XSBG
IGNvbW1vbi9zb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4NWEvMHg5MAo+Pj4+ICAgICAgIChYRU4p
IFsgIDM0Mi41NjAwNDJdICAgIFs8ZmZmZjgyZDA4MDI3OWRiNT5dIEYgYXJjaC94ODYvZG9tYWlu
LmMjaWRsZV9sb29wKzB4NTUvMHhiMAo+Pj4+Cj4+Pj4gVGhlIGZpcnN0IEhUIHNpYmxpbmcgaXMg
d2FpdGluZyBmb3IgdGhlIHNlY29uZCBpbiB0aGUgTFAtYXBwbGljYXRpb24KPj4+PiBjb250ZXh0
IHdoaWxlIHRoZSBzZWNvbmQgd2FpdHMgZm9yIHRoZSBmaXJzdCBpbiB0aGUgc2NoZWR1bGVyIGNv
bnRleHQuCj4+Pj4KPj4+PiBBbnkgc3VnZ2VzdGlvbnMgb24gaG93IHRvIGltcHJvdmUgdGhpcyBz
aXR1YXRpb24gYXJlIHdlbGNvbWUuCj4+Pgo+Pj4gQ2FuIHlvdSB0ZXN0IHRoZSBhdHRhY2hlZCBw
YXRjaCwgcGxlYXNlPyBJdCBpcyBvbmx5IHRlc3RlZCB0byBib290LCBzbwo+Pj4gSSBkaWQgbm8g
bGl2ZXBhdGNoIHRlc3RzIHdpdGggaXQuCj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBJ
dCBzZWVtcyB0byBmaXggdGhlIGlzc3VlIGluIG15IG1hbnVhbCB0ZXN0aW5nLgo+PiBJJ20gZ29p
bmcgdG8gc3VibWl0IGF1dG9tYXRpYyBMUCB0ZXN0aW5nIGZvciBib3RoIHRocmVhZC9jb3JlIG1v
ZGVzLgo+IAo+IEFuZHJldyBzdWdnZXN0ZWQgdG8gdGVzdCBsYXRlIHVjb2RlIGxvYWRpbmcgYXMg
d2VsbCBhbmQgc28gSSBkaWQuCj4gSXQgdXNlcyBzdG9wX21hY2hpbmUoKSB0byByZW5kZXp2b3Vz
IGNwdXMgYW5kIGl0IGZhaWxlZCB3aXRoIGEgc2ltaWxhcgo+IGJhY2t0cmFjZSBmb3IgYSBwcm9i
bGVtYXRpYyBDUFUuIEJ1dCBpbiB0aGlzIGNhc2UgdGhlIHN5c3RlbSBjcmFzaGVkCj4gc2luY2Ug
dGhlcmUgaXMgbm8gdGltZW91dCBpbnZvbHZlZDoKPiAKPiAgICAgIChYRU4pIFsgIDE1NS4wMjUx
NjhdIFhlbiBjYWxsIHRyYWNlOgo+ICAgICAgKFhFTikgWyAgMTU1LjA0MDA5NV0gICAgWzxmZmZm
ODJkMDgwMjQxN2YyPl0gUiBfc3Bpbl91bmxvY2tfaXJxKzB4MjIvMHgzMAo+ICAgICAgKFhFTikg
WyAgMTU1LjA2OTU0OV0gICAgWzxmZmZmODJkMDgwMjNmM2MyPl0gUyBjb21tb24vc2NoZWR1bGUu
YyNzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4rMHhhMi8weDI3MAo+ICAgICAgKFhFTikgWyAgMTU1
LjEwOTY5Nl0gICAgWzxmZmZmODJkMDgwMjNmNzI4Pl0gRiBjb21tb24vc2NoZWR1bGUuYyNzY2hl
ZF9zbGF2ZSsweDE5OC8weDI2MAo+ICAgICAgKFhFTikgWyAgMTU1LjE0NTUyMV0gICAgWzxmZmZm
ODJkMDgwMjQwZTFhPl0gRiBjb21tb24vc29mdGlycS5jI19fZG9fc29mdGlycSsweDVhLzB4OTAK
PiAgICAgIChYRU4pIFsgIDE1NS4xODAyMjNdICAgIFs8ZmZmZjgyZDA4MDM3MTZmNj5dIEYgeDg2
XzY0L2VudHJ5LlMjcHJvY2Vzc19zb2Z0aXJxcysweDYvMHgyMAo+IAo+IEl0IGxvb2tzIGxpa2Ug
eW91ciBwYXRjaCBwcm92aWRlcyBhIHdvcmthcm91bmQgZm9yIExQIGNhc2UsIGJ1dCBvdGhlcgo+
IGNhc2VzIGxpa2Ugc3RvcF9tYWNoaW5lKCkgcmVtYWluIGJyb2tlbiBzaW5jZSB0aGUgdW5kZXJs
eWluZyBpc3N1ZSB3aXRoCj4gdGhlIHNjaGVkdWxlciBpcyBzdGlsbCB0aGVyZS4KCkFoLCB0aGF0
IHdhcyBhY3R1YWxseSBhIHZlcnkgZ29vZCBoaW50IQoKV2hlbiBhbmFseXppbmcgeW91ciBpbml0
aWFsIHByb2JsZW1zIHdpdGggcmVib290IGFuZCBjcHUgb2ZmbGluaW5nIEkKbG9va2VkIGludG8g
dGhvc2UgY2FzZXMgaW4gZGV0YWlsIGFuZCBjb25jbHVkZWQgdGhhdCBzdG9wX21hY2hpbmVfcnVu
KCkKd2FzIGNhbGxlZCBpbnNpZGUgYSB0YXNrbGV0IGluIHRob3NlIGNhc2VzICh3aGljaCBpcyB0
cnVlKS4KClVuZm9ydHVuYXRlbHkgdGhlcmUgYXJlIHNvbWUgY2FzZXMgbGlrZSB1Y29kZSBsb2Fk
aW5nIHdoaWNoIGRvbid0IGRvCnRoYXQsIHNvIHRob3NlIGNhc2VzIG5lZWQgdG8gYmUgY29uc2lk
ZXJlZCBhcyB3ZWxsLgoKV3JpdGluZyBhbm90aGVyIHBhdGNoLi4uCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
