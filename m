Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC884FFD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:35:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvNw9-0006rs-0U; Wed, 07 Aug 2019 15:33:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvNw6-0006rL-I7
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:33:10 +0000
X-Inumbo-ID: a71e9492-b928-11e9-ac87-4bea284bd31a
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a71e9492-b928-11e9-ac87-4bea284bd31a;
 Wed, 07 Aug 2019 15:33:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0AE4FAECB;
 Wed,  7 Aug 2019 15:33:06 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
Date: Wed, 7 Aug 2019 17:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807151703.GA2659@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNzoxNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwNDo0NTo0M1BNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNToyNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IFhlbiA0LjEyIGNyYXNoZXMgd2hlbiBib290aW5nIG9u
IFVFRkkgKHdpdGggbXVsdGlib290MikgdW5sZXNzIEkgZGlzYWJsZQo+Pj4gcnVudGltZSBzZXJ2
aWNlcy4gVGhlIGNyYXNoIGhhcHBlbnMgc2hvcnRseSBhZnRlciBzdGFydGluZyBkb20wIGtlcm5l
bC4KPj4+IFVuZm9ydHVuYXRlbHkgSSBkb24ndCBoYXZlIHNlcmlhbCBjb25zb2xlIHRoZXJlLCBz
byB0aGUgb25seSBsb2cgSSBoYXZlCj4+PiBpcyBhIHBob3RvIG9mIFZHQSBjb25zb2xlIChhdHRh
Y2hlZCkuIEJlbG93IEkgcmV0eXBlIHBhcnQgb2YgdGhlIG1lc3NhZ2U6Cj4+Pgo+Pj4gKFhFTikg
LS0tLVsgWGVuLTQuMTIuMC0zLmZjMjkgIHg4Nl82NCAgZGVidWc9biAgIE5vdCB0YWludGVkIF0t
LS0tCj4+PiAoWEVOKSBDUFU6ICAgIDAKPj4+IChYRU4pIFJJUDogICAgZTAwODpbPDAwMDAwMDAw
MDAwMDAwZjY+XSAwMDAwMDAwMDAwMDAwMGY2Cj4+PiAoWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAw
MTAyODcgICBDT05URVhUOiBoeXBlcnZpc29yIChkMHYwKQo+Pj4gLi4uCj4+PiAoWEVOKSBYZW4g
Y2FsbCB0cmFjZToKPj4+IChYRU4pICAgIFs8MDAwMDAwMDAwMDAwMDBmNj5dIDAwMDAwMDAwMDAw
MDAwZjYKPj4+IChYRU4pICAgIFs8ZmZmZjgyZDA4MDI2YzZhZD5dIGZsdXNodGxiLmMjcHJlX2Zs
dXNoKzB4M2QvMHg4MAo+Pj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gZWZpX3J1bnRp
bWVfY2FsbCsweDQ5My8weGJkMAo+Pj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gZWZp
X3J1bnRpbWVfY2FsbCsweDQ0MS8weGJkMAo+Pj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAg
IF0gdmNwdV9yZXN0b3JlX2ZwdV9ub25sYXp5KzB4ZTcvMHgxODAKPj4+IChYRU4pICAgIFsgICAg
ICAgICAgICAgICAgICBdIGRvX3BsYXRmb3JtX29wKzAvMHgxODgwCj4+PiAoWEVOKSAgICBbICAg
ICAgICAgICAgICAgICAgXSBkb19wbGF0Zm9ybV9vcCsweGI5Yy8weDE4ODAKPj4+IChYRU4pICAg
IFsgICAgICAgICAgICAgICAgICBdIGRvX3BsYXRmb3JtX29wKzB4YjljLzB4MTg4MAo+Pj4gKFhF
TikgICAgWyAgICAgICAgICAgICAgICAgIF0gc2NoZWRfY3JlZGl0Mi5jI2NzY2hlZDJfc2NoZWR1
bGUrMHhjZDAvMHgxM2EwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rhcl9l
bnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBkb19wbGF0
Zm9ybV9vcCswLzB4MTg4MAo+Pj4gKFhFTikgICAgWyAgICAgICAgICAgICAgICAgIF0gcHZfaHlw
ZXJjYWxsKzB4MTUyLzB4MjIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGEyLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGEyLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGEyLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGEyLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGEyLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweGFlLzB4MTIwCj4+PiAoWEVOKSAgICBbICAgICAgICAgICAgICAgICAgXSBsc3Rh
cl9lbnRlcisweDEwYy8weDEyMAo+Pj4gKFhFTikKPj4+IChYRU4pCj4+PiAoWEVOKSAqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+Pj4gKFhFTikgUGFuaWMgb24gQ1BV
IDA6Cj4+PiAoWEVOKSBGQVRBTCBUUkFQOiB2ZWN0b3IgPSAwIChkaXZpZGUgZXJyb3IpCj4+PiAo
WEVOKSBbZXJyb3JfY29kZT0wMDAwXQo+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioKPj4+Cj4+PiBBbnkgaWRlYT8gTGFjayBvZiBzZXJpYWwgY29uc29s
ZSBkb2Vzbid0IGhlbHAgd2l0aCBjb2xsZWN0aW5nIGxvZ3MuLi4KPj4KPj4gTWF5IEkgc3VnZ2Vz
dCB0aGF0IHlvdSByZXBlYXQgdGhpcyB3aXRoIGEgZGVidWcgaHlwZXJ2aXNvciwgc3VjaCB0aGF0
Cj4+IHRoZSBjYWxsIHRyYWNlIGJlY29tZXMgbW9yZSB1c2FibGUvc2Vuc2libGU/Cj4gCj4gQWN0
dWFsbHksIEkndmUgYWxyZWFkeSB0cmllZCwgYnV0IGV2ZXJ5IG90aGVyIGJ1aWxkIEkgdHJ5LCBJ
IGdldCBldmVuCj4gbGVzcyB1c2VmdWwgY2FsbCB0cmFjZSwgZm9yIGV4YW1wbGUgZGVidWcgdW5z
dGFibGUgYnVpbGQ6Cj4gCj4gICAgICBYZW4gY2FsbCB0cmFjZToKPiAgICAgICAgIFs8MDAwMDAw
MDA3Yjc1MWMwOT5dIDAwMDAwMDAwN2I3NTFjMDkKPiAgICAgICAgIFs8OGMyYjAzOThlMDAwMGRh
YT5dIDhjMmIwMzk4ZTAwMDBkYWEKPiAuLi4KPiAgICAgIEdFTkVSQUwgUFJPVEVDVElPTiBGQVVM
VAo+ICAgICAgW2Vycm9yX2NvZGU9MDAwMF0KCkJ1dCB0aGlzIG1ha2VzIHJlYXNvbmFibGUgc2Vu
c2U6IFRoZSBmYXVsdGluZyBpbnNuIGlzICJjYWxsICoweDE4KCVyYXgpIgphbmQgJXJheCBpcyA2
OTU0YjJiMCwgd2hpY2ggcG9pbnRzIGludG8gYSBibG9jayBvZiB0eXBlCkVmaUJvb3RTZXJ2aWNl
c0RhdGEgKGFuZCBoZW5jZSBsaWtlbHkgcmV1c2VkIGJ5IHRoZSB0aW1lIG9mIHRoZSBjcmFzaApm
b3Igb3RoZXIgcHVycG9zZXMpLiBIZW5jZSB0aGUgIi9tYXBicyIgb3B0aW9uIG9mIHhlbi5lZmkg
bWlnaHQgaGVscApoZXJlIHRvbywgYnV0IGlpcmMgdGhlcmUncyBubyBlcXVpdmFsZW50IGZvciBp
dCBpbiB0aGUgTUIyIGNhc2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
