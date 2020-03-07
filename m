Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340B17CCC9
	for <lists+xen-devel@lfdr.de>; Sat,  7 Mar 2020 09:10:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAUTQ-0004O3-S2; Sat, 07 Mar 2020 08:06:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nfZC=4Y=ravnborg.org=sam@srs-us1.protection.inumbo.net>)
 id 1jAUTP-0004Ny-Af
 for xen-devel@lists.xenproject.org; Sat, 07 Mar 2020 08:06:15 +0000
X-Inumbo-ID: 82eb123e-604a-11ea-b52f-bc764e2007e4
Received: from asavdk4.altibox.net (unknown [109.247.116.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82eb123e-604a-11ea-b52f-bc764e2007e4;
 Sat, 07 Mar 2020 08:06:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7B71B804D5;
 Sat,  7 Mar 2020 09:06:10 +0100 (CET)
Date: Sat, 7 Mar 2020 09:06:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <20200307080608.GA28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
 a=DBfv99YmAAAA:8 a=cWRNjhkoAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=LthJQcoHPxg11W9in8gA:9
 a=CjuIK1q_8ugA:10 a=c73wXdw0ADZYY2z2LwuN:22 a=sVa6W5Aao32NNC1mekxh:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
Subject: Re: [Xen-devel] [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMTE6MjU6NDRQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBJIGFsc28gZGlkIGEgZnVsbCByZXZpZXcgb2YgYWxsIGNhbGxlcnMsIGFuZCBvbmx5
IHRoZSB4ZW4gZHJpdmVyCj4gZm9yZ290IHRvIGNhbGwgZHJtX2Rldl9wdXQgaW4gdGhlIGZhaWx1
cmUgcGF0aC4gRml4IHRoYXQgdXAgdG9vLgoKU28gfjQwIGNhbGxlcnMgLSBwaGV3Li4KCj4gCj4g
djI6IEkgbm90aWNlZCB0aGF0IHhlbiBoYXMgYSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vaywgYW5k
IHVzZXMKPiBkcm1fZGV2X2FsbG9jKCkuIFdlIG5lZWQgdG8gcmVtb3ZlIHRoZSBrZnJlZSBmcm9t
Cj4geGVuX2RybV9kcnZfcmVsZWFzZSgpLgo+IAo+IGJvY2hzIGFsc28gaGFzIGEgcmVsZWFzZSBo
b29rLCBidXQgbGVha2VkIHRoZSBkcm1fZGV2aWNlIGV2ZXIgc2luY2UKPiAKPiBjb21taXQgMGE2
NjU5YmRjNWU4MjIxZGE5OWVlYmIxNzZmZDk1OTE0MzVlMzhkZQo+IEF1dGhvcjogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gRGF0ZTogICBUdWUgRGVjIDE3IDE4OjA0OjQ2IDIw
MTMgKzAxMDAKPiAKPiAgICAgZHJtL2JvY2hzOiBuZXcgZHJpdmVyCj4gCj4gVGhpcyBwYXRjaCBo
ZXJlIGZpeGVzIHRoYXQgbGVhay4KPiAKPiBTYW1lIGZvciB2aXJ0aW8sIHN0YXJ0ZWQgbGVha2lu
ZyB3aXRoCj4gCj4gY29tbWl0IGIxZGYzYTJiMjRhOTE3Zjg4NTNkNDNmZTk2ODNjMGUzNjBkMmMz
M2EKPiBBdXRob3I6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+IERhdGU6ICAg
VHVlIEZlYiAxMSAxNDo1ODowNCAyMDIwICswMTAwCj4gCj4gICAgIGRybS92aXJ0aW86IGFkZCBk
cm1fZHJpdmVyLnJlbGVhc2UgY2FsbGJhY2suCj4gCj4gQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhl
bEByZWRoYXQuY29tPgo+IENjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2Fu
ZHJ1c2hjaGVua29AZXBhbS5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwoKVGhlIGFib3ZlIHdpbGwgYmUgcGlja2VkIHVwIGJ5IHRvb2xzIGFzIHJlZ3VsYXIgQ2M6IGxp
bmVzLgpCdXQgSSBndWVzcyBpdCBpcyBmaW5lLgoKPiAKPiBSZXZpZXdlZC1ieTogT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENj
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKCkZvciB0aGUgZHJpdmVycyBJIGxvb2tl
ZCBhdCBldmVyeXRoaW5nIGxvb2tlZCBmaW5lLgoKQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAg
ICAgIHwgMyArKysKPiAgZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2Rydi5jCj4gaW5kZXggMTUzMDUwZmM5MjZjLi43Yjg0ZWU4YTVlYjUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHJ2LmMKPiBAQCAtMzksNiArMzksNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9jb2xvcl9tZ210
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9maWxl
Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1f
bW9kZV9vYmplY3QuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAgCj4gQEAgLTgx
OSw2ICs4MjAsOCBAQCBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2Rldl9hbGxvYyhzdHJ1Y3QgZHJt
X2RyaXZlciAqZHJpdmVyLAo+ICAJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4gIAl9Cj4gIAo+ICsJ
ZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBkZXYpOwo+ICsKPiAgCXJldHVybiBkZXY7Cj4gIH0K
PiAgRVhQT1JUX1NZTUJPTChkcm1fZGV2X2FsbG9jKTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1f
ZnJvbnQuYwo+IGluZGV4IDRiZTQ5YzFhZWY1MS4uZDIyYjVkYTM4OTM1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKPiBAQCAtNDYxLDcgKzQ2MSw2IEBAIHN0YXRpYyB2b2lk
IHhlbl9kcm1fZHJ2X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgCWRybV9tb2Rl
X2NvbmZpZ19jbGVhbnVwKGRldik7Cj4gIAo+ICAJZHJtX2Rldl9maW5pKGRldik7Cj4gLQlrZnJl
ZShkZXYpOwo+ICAKPiAgCWlmIChmcm9udF9pbmZvLT5jZmcuYmVfYWxsb2MpCj4gIAkJeGVuYnVz
X3N3aXRjaF9zdGF0ZShmcm9udF9pbmZvLT54Yl9kZXYsCj4gQEAgLTU2MSw2ICs1NjAsNyBAQCBz
dGF0aWMgaW50IHhlbl9kcm1fZHJ2X2luaXQoc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAqZnJv
bnRfaW5mbykKPiAgZmFpbF9tb2Rlc2V0Ogo+ICAJZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKGRy
bV9kZXYpOwo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtX2Rldik7Cj4gKwlkcm1fZGV2
X3B1dChkcm1fZGV2KTsKPiAgZmFpbDoKPiAgCWtmcmVlKGRybV9pbmZvKTsKPiAgCXJldHVybiBy
ZXQ7Cj4gLS0gCj4gMi4yNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
