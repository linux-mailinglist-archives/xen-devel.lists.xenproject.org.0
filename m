Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607ABCB6C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:32:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmlI-00076S-5F; Tue, 24 Sep 2019 15:29:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCmlG-00076K-Ad
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:29:54 +0000
X-Inumbo-ID: 2778a682-dee0-11e9-9621-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2778a682-dee0-11e9-9621-12813bfff9fa;
 Tue, 24 Sep 2019 15:29:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43380ACB4;
 Tue, 24 Sep 2019 15:29:52 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-34-jgross@suse.com>
 <084a148f-ad84-9c43-339b-cdd0a7365cde@suse.com>
 <2954afb2-8901-fd2d-14d6-5004d476e773@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbcd2289-132f-4a44-7a1d-2ee8c16b7cf6@suse.com>
Date: Tue, 24 Sep 2019 17:29:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2954afb2-8901-fd2d-14d6-5004d476e773@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxNzoyMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNC4wOS4xOSAx
MjowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPj4+ICsrKyBiL3hl
bi9jb21tb24vc2NoZWR1bGUuYwo+Pj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIHZvaWQgcG9s
bF90aW1lcl9mbih2b2lkICpkYXRhKTsKPj4+ICAgLyogVGhpcyBpcyBnbG9iYWwgZm9yIG5vdyBz
byB0aGF0IHByaXZhdGUgaW1wbGVtZW50YXRpb25zIGNhbiByZWFjaCBpdCAqLwo+Pj4gICBERUZJ
TkVfUEVSX0NQVShzdHJ1Y3Qgc2NoZWR1bGVyICosIHNjaGVkdWxlcik7Cj4+PiAgIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqLCBzY2hlZF9yZXMpOwo+
Pj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIHNjaGVk
X3Jlc19pZHgpOwo+Pgo+PiBJdCdzIG9mIGNvdXJzZSBub3QgdmVyeSBoZWxwZnVsIHRoYXQgdGhp
cyB2YXJpYWJsZSAocmlnaHQgaGVyZSkgZG9lc24ndAo+PiBldmVyIGdldCB3cml0dGVuIHRvLCBh
bmQgaGVuY2Ugb25lIGNhbid0IGp1ZGdlIHdoZXJlIC8gaG93IHRoaXMgaXMgdG8KPj4gYmUgZG9u
ZSAod2l0aG91dCBnb2luZyBsb29rIGVsc2V3aGVyZSkuIEJ1dCBJIGd1ZXNzIHRoYXQgY2FsY3Vs
YXRpb24KPj4gY2FuJ3QgYmUgbW92ZWQgaW50byB0aGlzIHBhdGNoIChhY2NlcHRpbmcgdGhhdCBp
dCB3b3VsZCBhbHdheXMgeWllbGQKPj4gemVybyBmb3Igbm93KT8KPiAKPiBOb3QgZWFzaWx5LiBJ
IGNhbiBzZXQgc2NoZWRfcmVzX2lkeCB0byAwIGV4cGxpY2l0bHkgd2hlbiBpbml0aWFsaXppbmcK
PiBhIG5ldyBjcHUgaWYgeW91IGxpa2UgdGhhdCBiZXR0ZXIuCgpObywgbm90IHJlYWxseS4gVGhl
biBiZXR0ZXIgbGVhdmUgaXQgYXMgaXMuCgo+Pj4gQEAgLTIwMDgsNyArMjAxNSw3IEBAIHN0YXRp
YyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCj4+PiAgIAo+Pj4gICAgICAgcGNwdV9zY2hlZHVsZV91
bmxvY2tfaXJxKGxvY2ssIGNwdSk7Cj4+PiAgIAo+Pj4gLSAgICBzY2hlZF9jb250ZXh0X3N3aXRj
aCh2cHJldiwgbmV4dC0+dmNwdV9saXN0LCBub3cpOwo+Pj4gKyAgICBzY2hlZF9jb250ZXh0X3N3
aXRjaCh2cHJldiwgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpLCBub3cpOwo+Pj4gICB9
Cj4+Cj4+IEJ5IHRoZSBlbmQgb2YgdGhlIHNlcmllcyB0aGlzIHdpbGwgYmUKPj4KPj4gICAgICBz
Y2hlZF9jb250ZXh0X3N3aXRjaCh2cHJldiwgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUp
LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2lkbGVfdW5pdChuZXh0KSAmJiAhaXNf
aWRsZV91bml0KHByZXYpLCBub3cpOwo+Pgo+PiBjbGFyaWZ5aW5nIChJIHRoaW5rKSB0aGF0ICJu
ZXh0IiBjYW4gaW5kZWVkIGJlIGFuIGlkbGUgdW5pdC4gSSdtIGhhdmluZwo+PiBkaWZmaWN1bHR5
IHNlZWluZyBob3cgY2FuIHByb2R1Y2UgdGhlIGNvcnJlY3QgcmVzdWx0IGluIGFsbCB0aHJlZSBj
YXNlcwo+PiAtIGFsbCB2Q1BVLXMgaW4gdGhlIHVuaXQgYmVsb25nIHRvIGEgcmVhbCBkb21haW4K
Pj4gLSBhbGwgdkNQVS1zIGluIHRoZSB1bml0IGJlbG9uZyB0byB0aGUgaWRsZSBkb21haW4KPj4g
LSB0aGVyZSdzIGEgbWl4IG9mICJyZWFsIiBhbmQgKGZpbGxlcikgImlkbGUiIHZDUFUtcwo+PiBN
eSBtYWluIHF1ZXN0aW9uIGlzIHdoYXQgIm5leHQiIGlzIGluIHRoZSBsYXN0IG9mIHRoZSAzIGNh
c2VzIGFib3ZlLgo+IAo+IG5leHQgcG9pbnRzIHRvIHRoZSByZWFsIGRvbWFpbidzIHVuaXQuCj4g
Cj4+IENvbnNpZGVyaW5nIHRoYXQgc2NoZWR1bGluZyBoYXBwZW5zIGluIHRlcm1zIG9mIHVuaXRz
LCBJJ2QgZXhwZWN0IGl0IHRvCj4+IGJlIGEgcmVhbCBkb21haW4ncyB1bml0LCB5ZXQgdGhlbiBJ
IGRvbid0IHNlZSBob3cgeW91J2QgZ2V0IGF0IHRoZQo+PiBjb3JyZWN0IChpZGxlKSB2Q1BVIHdo
ZW4gY2FsbGluZyBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSkuCj4gCj4gV2hhdCBpcyB0
aGUgcHJvYmxlbT8KPiAKPiBzY2hlZF91bml0MnZjcHVfY3B1KCkgd2lsbCBmaXJzdCBnZXQgdGhl
IHJlYWwgZG9tYWluJ3MgdmNwdSBmb3IgdGhhdCBjcHUKPiAoaWYgZXhpc2l0aW5nKSBhbmQgcmVw
bGFjZSBpdCBieSB0aGUgaWRsZSB2Y3B1IG9mIHRoYXQgY3B1IGlmIHRoZSByZWFsCj4gZG9tYWlu
J3MgdmNwdSBpcyBlaXRoZXIgbm90IGV4aXN0aW5nIG9yIHdvbid0IGJlIHJ1bm5pbmcuIFRoZSBt
YWluIHRyaWNrCj4gaXMgdGhhdCB3ZSB1c2UgaWRsZV92Y3B1W2NwdV0gKHdoaWNoIGlzIGV4aXN0
aW5nIHRvZGF5IGFscmVhZHkpLgoKWWVhaCwgSSBndWVzcyB0aGlzIGhhcyBiZWNvbWUgbW9yZSBj
bGVhciBieSBsb29raW5nIGF0IHRoZSBuZXh0CnBhdGNoLiBXaXRob3V0IHNlZWluZyB0aGUgZmlu
YWwgc2hhcGUgc2NoZWRfdW5pdDJ2Y3B1X2NwdSgpIHdpbGwKdGFrZSAoaS5lLiBpbmNsdWRpbmcg
dGhlIHRyaWNrIHlvdSB0YWxrIGFib3V0KSBpdCB3YXNuJ3QgcmVhbGx5CmNsZWFyIHRvIG1lIHdo
YXQgaXMgKHN1cHBvc2VkIHRvIGJlKSBnb2luZyBvbiBoZXJlLiAoTWFrZXMgbWUKd29uZGVyIG9u
Y2UgYWdhaW4gd2hldGhlciB0aGF0IGZ1bmN0aW9uIGNvdWxkbid0IGhhdmUgdGFrZW4gaXRzCmZp
bmFsIHNoYXBlIHJpZ2h0IGF3YXkuIEJ1dCBhbnl3YXkuKQoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
