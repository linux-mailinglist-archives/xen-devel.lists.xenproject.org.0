Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A433D3705
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 03:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIjfs-00083x-9m; Fri, 11 Oct 2019 01:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5uZ=YE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iIjfq-00083s-2p
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 01:24:54 +0000
X-Inumbo-ID: ed267232-ebc5-11e9-beca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed267232-ebc5-11e9-beca-bc764e2007e4;
 Fri, 11 Oct 2019 01:24:53 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97728214E0;
 Fri, 11 Oct 2019 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570757092;
 bh=SfAAmf61MXm/mmy02bkan4+lOuGuxonboXvWIgMKzcE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=a+UpB5W37vYmcS82WvQb+2mn2swse4ofojD5Gwm200S6dCaWeqTCWLhoIiv6sf17Q
 UY4/ncGjSVYJhRGRBe9xpvTxzmb7gW1yqm0TlXjxQyO8n2YlwkA9P5obmLi6AKkkBc
 ie9+KxtlHNN2jVOAh/npzt9mBUjie38uacD9Y4mI=
Date: Thu, 10 Oct 2019 18:24:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
Message-ID: <alpine.DEB.2.21.1910101802470.9081@sstabellini-ThinkPad-T480s>
References: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
 <f5e20757-88ba-dabf-b68a-b6edc3ca1619@citrix.com>
 <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-ID: <alpine.DEB.2.21.1910101808251.9081@sstabellini-ThinkPad-T480s>
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMCBPY3QgMjAxOSwgTGFycyBLdXJ0aCB3cm90ZToKPiAqIFdvdWxkIHdlIGV2ZXIg
aW5jbHVkZSBBUEkgZG9jcyBnZW5lcmF0ZWQgZnJvbSBHUEx2MiBjb2RlPyBFLmcuIGZvciBzYWZl
dHkgdXNlLWNhc2VzPwo+IEBTdGVmYW5vLCBAQXJ0ZW06IEkgZ3Vlc3MgdGhpcyBvbmUgaXMgZm9y
IHlvdS4gCj4gSSBzdXBwb3NlIGlmIHdlIHdvdWxkIGhhdmUgYSBzaW1pbGFyIGlzc3VlIGZvciBh
IHNhZmV0eSBtYW51YWwKPiBJIGFtIGFsc28gYXNzdW1pbmcgd2Ugd291bGQgd2FudCB0byB1c2Ug
c3BoaW54IGRvY3MgYW5kIHJzdCB0byBnZW5lcmF0ZSBhIGZ1dHVyZSBzYWZldHkgbWFudWFsCgpI
aSBMYXJzLAoKVGhhbmtzIGZvciBwdXR0aW5nIHRoaXMgZW1haWwgdG9nZXRoZXIuCgpJbiB0ZXJt
cyBvZiBmb3JtYXRzLCBJIGRvbid0IGhhdmUgYSBwcmVmZXJlbmNlIGJldHdlZW4gcnN0IGFuZCBw
YW5kb2MsCmJ1dCBpZiB3ZSBhcmUgZ29pbmcgdG8gdXNlIHJzdCBnb2luZyBmb3J3YXJkLCBJJ2Qg
c2F5IHRvIHRyeSB0byB1c2UgcnN0CmZvciBldmVyeXRoaW5nLCBpbmNsdWRpbmcgY29udmVydGlu
ZyBhbGwgdGhlIG9sZCBzdHVmZi4gVGhlIGZld2VyCmRpZmZlcmVudCBmb3JtYXRzLCB0aGUgYmV0
dGVyLgoKQXMgSSBtZW50aW9uZWQgZHVyaW5nIHRoZSBGdVNhIGNhbGwsIEkgYWdyZWUgd2l0aCB5
b3UsIEFuZHJldywgYW5kCm90aGVycyB0aGF0IGl0IHdvdWxkIGJlIGJlc3QgdG8gaGF2ZSB0aGUg
ZG9jcyB1bmRlciBhIENDIGxpY2Vuc2UuIEkgZG8KZXhwZWN0IHRoYXQgd2UnbGwgZW5kIHVwIGNv
cHkvcGFzdGluZyBzbmlwcGV0cyBvZiBpbi1jb2RlIGNvbW1lbnRzIGludG8KdGhlIGRvY3MsIHNv
IEkgdGhpbmsgaXQgaXMgaW1wb3J0YW50IHRoYXQgd2UgYXJlIGFsbG93ZWQgdG8gZG8gdGhhdCBm
cm9tCmEgbGljZW5zZSBwZXJzcGVjdGl2ZS4gSXQgaXMgZ3JlYXQgdGhhdCBHUEx2MiBhbGxvd3Mg
aXQgKHdlIG5lZWQgdG8gYmUKc3VyZSBhYm91dCB0aGlzKS4KClllcywgSSBleHBlY3QgdGhhdCBz
b21lIGRvY3MgbWlnaHQgYmUgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQsIGJ1dCBmcm9tCmhlYWRl
ciBmaWxlcywgbm90IGZyb20gc291cmNlIGNvZGUuIEVzcGVjYWlsbHkgcHVibGljLyBoZWFkZXIg
ZmlsZXMsCndoaWNoIGFyZSB0eXBpY2FsbHkgQlNELCBub3QgR1BMdjIuIEkgY2Fubm90IGNvbWUg
dXAgd2l0aCBleGFtcGxlcyBvZgpkb2NzIHdlIG5lZWQgdG8gZ2VuZXJhdGVkIGZyb20gR1BMdjIt
b25seSBjb2RlIGF0IHRoZSBtb21lbnQsIGhvcGVmdWxseQp0aGVyZSB3b24ndCBiZSBhbnkuCgoK
ICAgICAKPiAgICAgSSB3YXNuJ3QgcGxhbm5pbmcgb24gcmV1c2luZyBhbnkgb2YgdGhlIG1hcmt1
cCwgYW5kIHdhc24ndCBleHBlY3RpbmcgdG8KPiAgICAgdXNlIG11Y2ggb2YgdGhlIHRleHQgZWl0
aGVyLiAgSSdtIHN0aWxsIGNvbnNpZGVyaW5nIHRoZSBvcHRpb24gb2YKPiAgICAgZGVmaW5pbmcg
dGhhdCB4ZW4vcHVibGljLyogaXNuJ3QgdGhlIGNhbm9uaWNhbCBkZXNjcmlwdGlvbiBvZiB0aGUg
QUJJLAo+ICAgICBiZWNhdXNlIEMgaXMgdGhlIHdyb25nIHRvb2wgZm9yIHRoZSBqb2IuCj4gICAg
IAo+ICAgICBJdHMgZmluZSB0byBwcm92aWRlIGEgQyBzZXQgb2YgaGVhZGVycyBpbXBsZW1lbnRp
bmcgYW4gQUJJLCBidXQgdGhlcmUgaXMKPiAgICAgYSB2ZXJ5IGRlbGliZXJhdGUgcmVhc29uIHdo
eSB0aGUgY2Fub25pY2FsIG1pZ3JhdGlvbiB2MiBzcGVjIGlzIGluIGEKPiAgICAgdGV4dCBkb2N1
bWVudC4KPiAKPiBAU3RlZmFubzogYXMgeW91IGFuZCBJIGJlbGlldmUgQnJpYW4gd2lsbCBiZSBz
cGVuZGluZyB0aW1lIG9uIGltcHJvdmluZyB0aGUKPiBBQkkgZG9jcywgSSB0aGluayB3ZSBuZWVk
IHRvIGJ1aWxkIHNvbWUgYWdyZWVtZW50IGhlcmUgb24gd2hhdC9ob3cKPiB0byBkbyBpdC4gSSB3
YXMgYXNzdW1pbmcgdGhhdCBnZW5lcmFsbHkgdGhlIGNvbnNlbnN1cyB3YXMgdG8gaGF2ZQo+IGRv
Y3MgY2xvc2UgdG8gdGhlIGNvZGUgaW4gc291cmNlLCBidXQgdGhpcyBkb2VzIG5vdCBzZWVtIHRv
IGJlIHRoZSBjYXNlLgo+IAo+IEJ1dCBpZiB3ZSBkbyBoYXZlIHN0dWZmIHNlcGFyYXRlbHksIGlk
ZWFsbHkgd2Ugd291bGQgaGF2ZSBhIHRvb2wgdGhhdCBoZWxwcwo+IHBvaW50IHBlb3BsZSBlZGl0
aW5nIGhlYWRlcnMgdG8gYWxzbyBsb29rIGF0IHRoZSByZWxldmFudCBkb2NzLiBPdGhlcndpc2Ug
aXQgd2lsbAo+IGJlIGhhcmQgdG8ga2VlcCB0aGVtIGluIHN5bmMuCgpJbiBnZW5lcmFsLCBpdCBp
cyBhIGdvb2QgaWRlYSB0byBrZWVwIHRoZSBkb2NzIGNsb3NlIHRvIHRoZSBjb2RlIHRvIG1ha2UK
aXQgZWFzaWVyIHRvIGtlZXAgdGhlbSB1cCB0byBkYXRlLiBCdXQgdGhlcmUgaXMgbm8gb25lLXNp
emUtZml0cy1hbGwKaGVyZS4gRm9yIHB1YmxpYyBBQkkgZGVzY3JpcHRpb25zLCBJIGFncmVlIHdp
dGggQW5kcmV3IHRoYXQgaWRlYWxseSB0aGV5CnNob3VsZCBub3QgYmUgZGVmaW5lZCBhcyBDIGhl
YWRlciBmaWxlcy4KCkJ1dCBpdCBpcyBub3QgYW4gaXNzdWU6IGFueSB3b3JrIHRoYXQgd2UgZG8g
aGVyZSB3b24ndCBiZSB3YXN0ZWQuIEZvcgppbnN0YW5jZSwgd2UgY291bGQgc3RhcnQgYnkgYWRk
aW5nIG1vcmUgY29tbWVudHMgdG8gdGhlIGN1cnJlbnQgaGVhZGVyCmZpbGVzLiBUaGVuLCBhcyBh
IHNlY29uZCBzdGVwLCB0YWtlIGFsbCB0aGUgY29tbWVudHMgYW5kIHR1cm4gdGhlbSBpbnRvCmEg
cHJvcGVyIEFCSSBkZXNjcmlwdGlvbiBkb2N1bWVudCB3aXRob3V0IGFueSBDIGZ1bmN0aW9uIGRl
Y2xhcmF0aW9ucy4KSXQgaXMgZWFzeSB0byBtb3ZlIEVuZ2xpc2ggdGV4dCBhcm91bmQsIGFzIGxv
bmcgYXMgdGhlIGxpY2Vuc2UgYWxsb3dzIGl0Ci0tIHRoYXQgaXMgdGhlIG9ubHkgcG90ZW50aWFs
IGJsb2NrZXIgSSBjYW4gc2VlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
