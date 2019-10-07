Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11C0CDBFA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 08:54:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHMri-0002Vr-H8; Mon, 07 Oct 2019 06:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHMrg-0002Vm-Ld
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 06:51:28 +0000
X-Inumbo-ID: e1e122b8-e8ce-11e9-97a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1e122b8-e8ce-11e9-97a3-12813bfff9fa;
 Mon, 07 Oct 2019 06:51:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4C35AB98;
 Mon,  7 Oct 2019 06:51:25 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <71fe02ae-a279-8d30-28e9-35d6c84c9a08@suse.com>
Date: Mon, 7 Oct 2019 08:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910041601170.30844@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: fix duplicate memory node
 in DT
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
Cc: julien@xen.org, oleksandr_tyshchenko@epam.com, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTAuMTkgMDE6MDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBXaGVuIHJlc2Vy
dmVkLW1lbW9yeSByZWdpb25zIGFyZSBwcmVzZW50IGluIHRoZSBob3N0IGRldmljZSB0cmVlLCBk
b20wCj4gaXMgc3RhcnRlZCB3aXRoIG11bHRpcGxlIG1lbW9yeSBub2Rlcy4gRWFjaCBtZW1vcnkg
bm9kZSBzaG91bGQgaGF2ZSBhCj4gdW5pcXVlIG5hbWUsIGJ1dCB0b2RheSB0aGV5IGFyZSBhbGwg
Y2FsbGVkICJtZW1vcnkiIGxlYWRpbmcgdG8gTGludXgKPiBwcmludGluZyB0aGUgZm9sbG93aW5n
IHdhcm5pbmcgYXQgYm9vdDoKPiAKPiAgICBPRjogRHVwbGljYXRlIG5hbWUgaW4gYmFzZSwgcmVu
YW1lZCB0byAibWVtb3J5IzEiCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieSBh
cHBlbmRpbmcgYSAiQDx1bml0LWFkZHJlc3M+IiB0byB0aGUKPiBuYW1lLCBhcyBwZXIgdGhlIERl
dmljZSBUcmVlIHNwZWNpZmljYXRpb24sIHdoZXJlIDx1bml0LWFkZHJlc3M+IG1hdGNoZXMKPiB0
aGUgYmFzZSBvZiBhZGRyZXNzIG9mIHRoZSBmaXJzdCByZWdpb24uCj4gCj4gUmVwb3J0ZWQtYnk6
IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxp
bnguY29tPgo+IAo+IC0tLQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCA5MjFiMDU0NTIwLi5h
NGMwN2RiMzgzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC02NDYsMTYgKzY0NiwyMiBAQCBz
dGF0aWMgaW50IF9faW5pdCBtYWtlX21lbW9yeV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQs
Cj4gICAgICAgaW50IHJlcywgaTsKPiAgICAgICBpbnQgcmVnX3NpemUgPSBhZGRyY2VsbHMgKyBz
aXplY2VsbHM7Cj4gICAgICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiBtZW0tPm5yX2Jhbmtz
Owo+ICsgICAgLyogUGxhY2Vob2xkZXIgZm9yIG1lbW9yeUAgKyBhIDMyLWJpdCBudW1iZXIgKyBc
MCAqLwo+ICsgICAgY2hhciBidWZbMThdOwoKWW91IGFyZSB1c2luZyBQUkl4NjQgZm9yIHByaW50
aW5nIHRoZSBudW1iZXIsIHNvIEkgZ3Vlc3MgeW91IHNob3VsZAplbmxhcmdlIGJ1ZiBieSA4IGJ5
dGVzIGFuZCBhZGp1c3QgdGhlIGNvbW1lbnQgKHMvMzIvNjQvKS4KCj4gICAgICAgX19iZTMyIHJl
Z1tOUl9NRU1fQkFOS1MgKiA0IC8qIFdvcnN0IGNhc2UgYWRkcmNlbGxzICsgc2l6ZWNlbGxzICov
XTsKPiAgICAgICBfX2JlMzIgKmNlbGxzOwo+ICAgCj4gICAgICAgQlVHX09OKG5yX2NlbGxzID49
IEFSUkFZX1NJWkUocmVnKSk7Cj4gKyAgICAvKiBOb3RoaW5nIHRvIGRvICovCj4gKyAgICBpZiAo
IG1lbS0+bnJfYmFua3MgPT0gMCApCj4gKyAgICAgICAgcmV0dXJuIDA7Cj4gICAKPiAgICAgICBk
dF9kcHJpbnRrKCJDcmVhdGUgbWVtb3J5IG5vZGUgKHJlZyBzaXplICVkLCBuciBjZWxscyAlZClc
biIsCj4gICAgICAgICAgICAgICAgICByZWdfc2l6ZSwgbnJfY2VsbHMpOwo+ICAgCj4gICAgICAg
LyogZVBBUFIgMy40ICovCj4gLSAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShmZHQsICJtZW1vcnki
KTsKPiArICAgIHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICJtZW1vcnlAJSJQUkl4NjQsIG1l
bS0+YmFua1swXS5zdGFydCk7Cj4gKyAgICByZXMgPSBmZHRfYmVnaW5fbm9kZShmZHQsIGJ1Zik7
Cj4gICAgICAgaWYgKCByZXMgKQo+ICAgICAgICAgICByZXR1cm4gcmVzOwoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
