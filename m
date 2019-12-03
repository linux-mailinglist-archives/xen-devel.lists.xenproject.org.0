Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525F110318
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 18:01:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBVC-0004Gh-Pq; Tue, 03 Dec 2019 16:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icBVB-0004Gc-Rd
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:58:17 +0000
X-Inumbo-ID: 19bd8a22-15ee-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19bd8a22-15ee-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 16:58:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 017C7B1EE4;
 Tue,  3 Dec 2019 16:58:15 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-8-liuwe@microsoft.com>
 <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
 <20191203163736.ssykoba43expjx3k@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4361888e-3e89-25e0-f7b8-2949a32c5c6f@suse.com>
Date: Tue, 3 Dec 2019 17:58:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203163736.ssykoba43expjx3k@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/8] x86: be more verbose when running on
 a hypervisor
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
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <liuwe@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxNzozNywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIERlYyAwMywgMjAx
OSBhdCAwMzo1NDozNVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzAuMTEuMjAx
OSAxMjo1NywgV2VpIExpdSB3cm90ZToKPj4+IEFsc28gcmVwbGFjZSByZWZlcmVuY2UgdG8geGVu
X2d1ZXN0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5j
b20+Cj4+Cj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4g
VGhhbmtzLgo+IAo+Pgo+PiBIb3dldmVyLCAuLi4KPj4KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9z
ZXR1cC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4gQEAgLTcwMCw2ICs3MDAs
NyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9w
KQo+Pj4gICAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSAtMSwKPj4+ICAgICAgICAgIC5tYXhf
bWFwdHJhY2tfZnJhbWVzID0gLTEsCj4+PiAgICAgIH07Cj4+PiArICAgIGNvbnN0IGNoYXIgKmh5
cGVydmlzb3JfbmFtZTsKPj4+ICAKPj4+ICAgICAgLyogQ3JpdGljYWwgcmVnaW9uIHdpdGhvdXQg
SURUIG9yIFRTUy4gIEFueSBmYXVsdCBpcyBkZWFkbHkhICovCj4+PiAgCj4+PiBAQCAtNzYzLDcg
Kzc2NCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcg
bWJpX3ApCj4+PiAgICAgICAqIGFsbG9jaW5nIGFueSB4ZW5oZWFwIHN0cnVjdHVyZXMgd2FudGVk
IGluIGxvd2VyIG1lbW9yeS4gKi8KPj4+ICAgICAga2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7
Cj4+PiAgCj4+PiAtICAgIGh5cGVydmlzb3JfcHJvYmUoKTsKPj4+ICsgICAgaHlwZXJ2aXNvcl9u
YW1lID0gaHlwZXJ2aXNvcl9wcm9iZSgpOwo+Pgo+PiAuLi4geW91IG5vIGxvbmdlciBjYWxsaW5n
IHRoaXMgZnVuY3Rpb24gbXVsdGlwbGUgdGltZSwgd2h5IGRvZXMKPj4gcGF0Y2ggNCBzdGlsbCBw
dXQgaW4gYSByZXNwZWN0aXZlIGd1YXJkPwo+IAo+IFJlbW5hbnQgZnJvbSBwcmV2aW91cyBpdGVy
YXRpb25zLgo+IAo+IEkgY2FuIHN1Ym1pdCBhIGZvbGxvdy11cCBwYXRjaCB0byBkcm9wIHRoYXQg
LS0gZG8gcmVhbGx5IHdhbnQgdG8KPiBpbnZhbGlkYXRlIGFsbCB0aGUgcmV2aWV3cyBhbmQgYWNr
cyBJIGdvdCBzbyBmYXIuCgpBY2NvcmRpbmcgdG8gbXkgcmVjb3JkcyBwYXRjaCA0IGhhZCBubyBh
Y2tzIGV4Y2VwdCBtaW5lLCB3aGljaCB5b3UKY291bGQga2VlcCB3aXRoIHRoaXMgY2hhbmdlIChp
biBmYWN0IEkgd2FzIHRoaW5raW5nIG9mIG1ha2luZyBpdApkZXBlbmRlbnQgdXBvbiB0aGUgZHJv
cHBpbmcgb2YgdGhpcyBsZWZ0b3ZlcikuIFN1YnNlcXVlbnQgcGF0Y2hlcwptYXkgb25seSBuZWVk
IHJlLWJhc2luZywgd2hpY2ggZG9lc24ndCBpbXBseSBkcm9wcGluZyBvZiBhbnkgYWNrcy4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
