Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62055619D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 07:09:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg086-0006GJ-LP; Wed, 26 Jun 2019 05:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg084-0006GE-U7
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 05:05:56 +0000
X-Inumbo-ID: 11e98040-97d0-11e9-991e-bb4e559236a1
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11e98040-97d0-11e9-991e-bb4e559236a1;
 Wed, 26 Jun 2019 05:05:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A32BAC4E;
 Wed, 26 Jun 2019 05:05:51 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <f1b992ab-9e1d-0e37-ebb4-37fc609cfb5d@suse.com>
 <alpine.DEB.2.21.1906251427440.5851@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Message-ID: <378129c8-e351-1ead-de85-56c304a90b2d@suse.com>
Date: Wed, 26 Jun 2019 07:05:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251427440.5851@sstabellini-ThinkPad-T480s>
Content-Language: de-DE
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: wl@xen.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com,
 chao.gao@intel.com, roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDYuMTkgMDA6MTAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUdWUsIDI1
IEp1biAyMDE5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyNC4wNi4xOSAyMDo0NSwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IEkgbWlnaHQgaGF2ZSBm
b3VuZCBhIGJ1ZyB3aXRoIFBDSSBwYXNzdGhyb3VnaCB0byBhIExpbnV4IEhWTSBndWVzdCBvbgo+
Pj4geDg2IHdpdGggWGVuIDQuMTIuIEl0IGlzIG5vdCBlYXN5IGZvciBtZSB0byBnZXQgYWNjZXNz
LCBhbmQgZXNwZWNpYWxseQo+Pj4gY2hhbmdlIGNvbXBvbmVudHMsIG9uIHRoaXMgcGFydGljdWxh
ciBzeXN0ZW0sIGFuZCBJIGRvbid0IGhhdmUgYWNjZXNzIHRvCj4+PiBvdGhlciB4ODYgYm94ZXMg
YXQgdGhlIG1vbWVudCwgc28gYXBvbG9naWVzIGZvciB0aGUgcGFydGlhbCBpbmZvcm1hdGlvbgo+
Pj4gcmVwb3J0LiBUaGUgc2V0dXAgaXMgYXMgZm9sbG93Ogo+Pj4KPj4+IC0gdHdvIFBDSSBkZXZp
Y2VzIGhhdmUgYmVlbiBhc3NpZ25lZCB0byBhIEhWTSBndWVzdCwgZXZlcnl0aGluZyBpcyBmaW5l
Cj4+PiAtIHJlYm9vdCB0aGUgZ3Vlc3QgZnJvbSBpbnNpZGUsIGkuZS4gYHJlYm9vdCcgaW4gTGlu
dXgKPj4+IC0gYWZ0ZXIgdGhlIHJlYm9vdCBjb21wbGV0ZXMsIG9ubHkgb25lIGRldmljZSBpcyBh
c3NpZ25lZAo+Pj4KPj4+IEJlZm9yZSB0aGUgcmVib290LCBJIHNlZSBhbGwgdGhlIGFwcHJvcHJp
YXRlIHhlbnN0b3JlIGVudHJpZXMgZm9yIGJvdGgKPj4+IGRldmljZXMuIEV2ZXJ5dGhpbmcgaXMg
ZmluZS4gQWZ0ZXIgdGhlIHJlYm9vdCwgSSBjYW4gb25seSBzZWUgdGhlCj4+PiB4ZW5zdG9yZSBl
bnRyaWVzIG9mIG9uZSBkZXZpY2UuIEl0IGlzIGFzIGlmIHRoZSBvdGhlciBkZXZpY2UKPj4+ICJk
aXNhcHBlYXJlZCIgd2l0aG91dCB0aHJvd2luZyBhbnkgZXJyb3JzLgo+Pgo+PiBDYW4geW91IHBs
ZWFzZSBwb3N0IHRoZSBYZW5zdG9yZSBlbnRyaWVzIGJlZm9yZSB0aGUgcmVib290Pwo+Pgo+PiBJ
IHRoaW5rIHRoZSBudW1iZXJpbmcgc2NoZW1lIG9mIFBDSSBkZXZpY2VzIGluIFhlbnN0b3JlIGlz
bid0IGxpa2UgdGhhdAo+PiBvZiBvdGhlciBkZXZpY2VzLi4uCj4gCj4gU2VlIGF0dGFjaGVkLiBU
aGUgZG9taWQgZ29lcyBmcm9tIDMgdG8gNSwgYmVjYXVzZSBJIHNodXRkb3duIGRvbWlkIDMKPiBu
b3JtYWxseSB0aGUgZmlyc3QgdGltZSBhcm91bmQsIGluc3RlYWQgb2YgcmVib290aW5nLgo+IAoK
QXMgSSB0aG91Z2h0LiBXb3JraW5nIG9uIGEgcGF0Y2guCgoKSnVlcmdlbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
