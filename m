Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11984EC9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:32:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMxB-0000rj-02; Wed, 07 Aug 2019 14:30:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvMx9-0000rc-SU
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:30:11 +0000
X-Inumbo-ID: dc1803b2-b91f-11e9-9cd6-777e2d362d73
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc1803b2-b91f-11e9-9cd6-777e2d362d73;
 Wed, 07 Aug 2019 14:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C5EAAFA8;
 Wed,  7 Aug 2019 14:30:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d0c34b24-697e-fbc1-3d7d-741e0f37c768@suse.com>
Date: Wed, 7 Aug 2019 16:30:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33d6bbb5-cecd-a499-89f4-1592a3fb0eac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wOC8yMDE5
IDEyOjIwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+PiBpbmRleCAx
OTQ4NmQ1ZTMyLi42NTRiNGZkZDIyIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMv
ZG9tY3RsLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4+IEBAIC02NCw2
ICs2NCw5IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7Cj4+ICAgIC8qIElzIHRo
aXMgYSB4ZW5zdG9yZSBkb21haW4/ICovCj4+ICAgI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfeHNf
ZG9tYWluICAgICA0Cj4+ICAgI2RlZmluZSBYRU5fRE9NQ1RMX0NERl94c19kb21haW4gICAgICAo
MVU8PF9YRU5fRE9NQ1RMX0NERl94c19kb21haW4pCj4+ICsgLyogRGlzYWJsZSBGSUZPIGV2ZW50
IGNoYW5uZWxzPyAqLwo+PiArI2RlZmluZSBfWEVOX0RPTUNUTF9DREZfZGlzYWJsZV9maWZvICA1
Cj4+ICsjZGVmaW5lIFhFTl9ET01DVExfQ0RGX2Rpc2FibGVfZmlmbyAgICgxVTw8X1hFTl9ET01D
VExfQ0RGX2Rpc2FibGVfZmlmbykKPj4gICAgICAgdWludDMyX3QgZmxhZ3M7Cj4gCj4gT24gdGhl
IHN1YmplY3Qgb2YgdGhlIHRoZSBwYXRjaCBpdHNlbGYsIEkgdGhpbmsgdGhpcyBpcyBicm9hZGx5
IHRoZQo+IHJpZ2h0IHByaW5jaXBsZSwgYnV0IHdhbnRzIHRvIGJlIGV4cHJlc3NlZCBkaWZmZXJl
bnRseS4KPiAKPiBGaXJzdCwgeW91J2xsIHdhbnQgdG8gcmViYXNlIG9udG8gYSB2ZXJ5IHJlY2Vu
dCBtYXN0ZXIsIGFuZCBzcGVjaWZpY2FsbHkKPiBvdmVyIGMvcyBkOGYyNDkwNTYxZWIgd2hpY2gg
aGFzIGNoYW5nZWQgaG93IHRoaXMgZmllbGQgaXMgaGFuZGxlZCBpbiBYZW4uCj4gCj4gRnVydGhl
cm1vcmUsIGlmIHRoZXJlIGlzIHRoaXMgcHJvYmxlbSBmb3IgZXZlbnQgY2hhbm5lbHMsIHRoZW4g
dGhlcmUgaXMKPiBhbG1vc3QgY2VydGFpbmx5IGEgcmVsYXRlZCBwcm9ibGVtIGZvciBncmFudCB0
YWJsZXMuCj4gCj4gVGhlIGNvbnRyb2wgaW4gWGVuIHNob3VsZCBiZSBleHByZXNzZWQgaW4gYSBw
b3NpdGl2ZSBmb3JtLCBvciB0aGUgbG9naWMKPiB3aWxsIGJlY29tZSBhIHRhbmdsZS7CoCBJdCBz
aG91bGQgYmUgYSBiaXQgcGVybWl0dGluZyB0aGUgdXNlIG9mIHRoZSBGSUZPCj4gQUJJLCByYXRo
ZXIgdGhhbiBhIGJpdCBzYXlpbmcgIm9oIGFjdHVhbGx5LCB5b3UgY2FuJ3QgdXNlIHRoYXQiLgo+
IAo+IFRoYXQgc2FpZCwgaXQgbWlnaHQgYmUgZWFzaWVyIHRvIGRlY2xhcmUgRklGTyB0byBiZSAi
ZXZlbnQgY2hhbm5lbCB2MiIsCj4gYW5kIHNwZWNpZnkgbWF4X3tncmFudCxldm50Y2hufV92ZXIg
aW5zdGVhZC4KCkknbSBub3Qgc3VyZSBhc3N1bWluZyBsaW5lYXIgKG9yIGFjdHVhbGx5IGFueSkg
b3JkZXJpbmcgYmV0d2Vlbgp2YXJpYW50cyBpcyBhIGdvb2QgdGhpbmcuIFllcywgcmlnaHQgbm93
IHdlIG9ubHkgaGF2ZSBnbnR0YWIKdjEgYW5kIHYyIGFuZCBldnRjaG4gMmwgYW5kIGZpZm8sIHdo
aWNoIGNvdWxkIGJlIGNvbnNpZGVyZWQgdjEKYW5kIHYyIGFzIHlvdSBzdWdnZXN0LiBIb3dldmVy
LCBhc3N1bWluZyBhIDNyZCB2YXJpYW50IHN1cmZhY2VzLAp3aHkgd291bGQgaXQgYmUgdGhhdCBv
bmUgaGFzIHRvIGV4cG9zZSB2MiBqdXN0IHRvIG1ha2UgdjMKdXNhYmxlPyBJbiBwYXJ0aWN1bGFy
IGdudHRhYiB2MiBoYXMgdmFyaW91cyBpc3N1ZXMgKHdoaWNoIGlzIHdoeQp5b3UgaW50cm9kdWNl
ZCBhIHdheSB0byBkaXNhYmxlIGl0cyB1c2UgaW4gdGhlIGZpcnN0IHBsYWNlKSwgeWV0CkknZCBo
b3BlIHdlJ2QgZW5kIHVwIHdpdGggYSBsZXNzIHF1aXJreSB2MyBpZiBvbmUgZXZlciBiZWNvbWVz
Cm5lY2Vzc2FyeS4gQW5kIGluIHR1cm4gSSdkIGhvcGUgd2UgY291bGQgaGlkZSB2MiBmcm9tIGFu
eSB2Mwp1c2Vycy4KCklPVyBJIHRoaW5rIGEgYml0bWFwIHRvIHBlcm1pdCB1c2Ugb2YgImFkdmFu
Y2VkIiB2ZXJzaW9ucyBpcwptb3JlIGZ1dHVyZSBwcm9vZi4gKEFzIGEgc2lkZSBub3RlLCBJIGRv
bid0IHRoaW5rIHdlIHdhbnQgdG8KaW50cm9kdWNlIGEgZGlzYWJsZSBmb3IgdGhlIHJlc3BlY3Rp
dmUgdjEgaW50ZXJmYWNlcy4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
