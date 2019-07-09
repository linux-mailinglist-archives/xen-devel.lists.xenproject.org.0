Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377716306B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 08:28:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkjYo-00059U-FP; Tue, 09 Jul 2019 06:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zDY3=VG=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1hkjYn-00059P-Ml
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 06:25:05 +0000
X-Inumbo-ID: 49eac02a-a212-11e9-951e-27d7dd59883e
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49eac02a-a212-11e9-951e-27d7dd59883e;
 Tue, 09 Jul 2019 06:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49A1933027C;
 Tue,  9 Jul 2019 06:24:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECA7F5C548;
 Tue,  9 Jul 2019 06:24:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7E1A51138648; Tue,  9 Jul 2019 08:24:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190704153605.4140-1-anthony.perard@citrix.com>
Date: Tue, 09 Jul 2019 08:24:52 +0200
In-Reply-To: <20190704153605.4140-1-anthony.perard@citrix.com> (Anthony
 PERARD's message of "Thu, 4 Jul 2019 16:36:05 +0100")
Message-ID: <8736jfafnv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 09 Jul 2019 06:24:59 +0000 (UTC)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH] xen: Fix ring.h header
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gVGhl
IHhlbl9bcnddP21iKCkgbWFjcm9zIGRlZmluZWQgaW4gcmluZy5oIGNhbid0IGJlIHVzZWQgYW5k
IHRoZSBmYWN0Cj4gdGhhdCB0aGVyZSBhcmUgZ2F0ZWQgYmVoaW5kIF9fWEVOX0lOVEVSRkFDRV9W
RVJTSU9OX18gbWVhbnMgdGhhdCBpdAo+IG5lZWRzIHRvIGJlIGRlZmluZWQgc29tZXdoZXJlLiBR
RU1VIGRvZXNuJ3QgaW1wbGVtZW50IGludGVyZmFjZXMgd2l0aAo+IHRoZSBYZW4gaHlwZXJ2aXNv
ciBzbyBkZWZpbmluZyBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIGlzIHBvaW50bGVzcy4KPiBU
aGlzIGxlYWRzIHRvOgo+ICAgICBpbmNsdWRlL2h3L3hlbi9pby9yaW5nLmg6NDc6NTogZXJyb3I6
ICJfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fIgo+ICAgICAgICAgaXMgbm90IGRlZmluZWQsIGV2
YWx1YXRlcyB0byAwIFstV2Vycm9yPXVuZGVmXQo+Cj4gQ2xlYW51cCByaW5nLmguIFRoZSB4ZW5f
Km1iKCkgbWFjcm9zIGFyZSBhbHJlYWR5IGRlZmluZWQgaW4geGVuY3RybC5oCj4gd2hpY2ggaXMg
aW5jbHVkZWQgaW4geGVuX2NvbW1vbi5oLgo+Cj4gUmVwb3J0ZWQtYnk6IE1hcmt1cyBBcm1icnVz
dGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAgICBBIHNpbWls
YXIgcGF0Y2ggaGF2ZSBiZWVuIHNlbnQgdG8gdGhlIGNhbm9uaWNhbCB2ZXJzaW9uOgo+ICAgICBo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDcvbXNnMDAzNzAuaHRtbAoKVGhhdCBwYXRjaCBoYXMgYW4gYWRkaXRpb25hbCBodW5rOgoKICBA
QCAtMzMsNiArMzMsMTMgQEAKICAgICogLSBzdGFuZGFyZCBpbnRlZ2VycyB0eXBlcyAodWludDhf
dCwgdWludDE2X3QsIGV0YykKICAgICogVGhleSBhcmUgcHJvdmlkZWQgYnkgc3RkaW50Lmggb2Yg
dGhlIHN0YW5kYXJkIGhlYWRlcnMuCiAgICAqCiAgKyAqIEJlZm9yZSB1c2luZyB0aGUgZGlmZmVy
ZW50IG1hY3JvcywgeW91IG5lZWQgdG8gcHJvdmlkZSB0aGUgZm9sbG93aW5nCiAgKyAqIG1hY3Jv
czoKICArICogLSB4ZW5fbWIoKSAgYSBtZW1vcnkgYmFycmllcgogICsgKiAtIHhlbl9ybWIoKSBh
IHJlYWQgbWVtb3J5IGJhcnJpZXIKICArICogLSB4ZW5fd21iKCkgYSB3cml0ZSBtZW1vcnkgYmFy
cmllcgogICsgKiBFeGFtcGxlIG9mIHRob3NlIGNhbiBiZSBmb3VuZCBpbiB4ZW5jdHJsLmguCiAg
KyAqCiAgICAqIEluIGFkZGl0aW9uLCBpZiB5b3UgaW50ZW5kIHRvIHVzZSB0aGUgRkxFWCBtYWNy
b3MsIHlvdSBhbHNvIG5lZWQgdG8KICAgICogcHJvdmlkZSB0aGUgZm9sbG93aW5nLCBiZWZvcmUg
aW52b2tpbmcgdGhlIEZMRVggbWFjcm9zOgogICAgKiAtIHNpemVfdAoKU3VnZ2VzdCB0byBpbmNs
dWRlIGl0IGluIHRoaXMgcGF0Y2gsIGJlY2F1c2UgKDEpIGl0J3MgdXNlZnVsIChJIHRoaW5rKSwK
YW5kICgyKSBpdCByZWR1Y2VzIGRpZmZlcmVuY2VzIHRvIHVwc3RyZWFtIFhlbidzIHZlcnNpb24u
Cgo+Cj4gIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9yaW5nLmggfCA2IC0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3
L3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oIGIvaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3Jp
bmcuaAo+IGluZGV4IDFhZGFjZjA5ZjkuLjcwNDk5MGEyYzkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVk
ZS9ody94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaAo+ICsrKyBiL2luY2x1ZGUvaHcveGVuL2ludGVy
ZmFjZS9pby9yaW5nLmgKPiBAQCAtNDIsMTIgKzQyLDYgQEAKPiAgICogYW5kIGdyYW50X3RhYmxl
LmggZnJvbSB0aGUgWGVuIHB1YmxpYyBoZWFkZXJzLgo+ICAgKi8KPiAgCj4gLSNpZiBfX1hFTl9J
TlRFUkZBQ0VfVkVSU0lPTl9fIDwgMHgwMDAzMDIwOAo+IC0jZGVmaW5lIHhlbl9tYigpICBtYigp
Cj4gLSNkZWZpbmUgeGVuX3JtYigpIHJtYigpCj4gLSNkZWZpbmUgeGVuX3dtYigpIHdtYigpCj4g
LSNlbmRpZgo+IC0KPiAgdHlwZWRlZiB1bnNpZ25lZCBpbnQgUklOR19JRFg7Cj4gIAo+ICAvKiBS
b3VuZCBhIDMyLWJpdCB1bnNpZ25lZCBjb25zdGFudCBkb3duIHRvIHRoZSBuZWFyZXN0IHBvd2Vy
IG9mIHR3by4gKi8KClJlZ2FyZGxlc3Mgb2YgbXkgc3VnZ2VzdGlvbjoKUmV2aWV3ZWQtYnk6IE1h
cmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
