Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446587C9A6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:00:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrvy-0004Az-Vv; Wed, 31 Jul 2019 16:58:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hsrvy-0004Au-6Z
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:58:38 +0000
X-Inumbo-ID: 6fd535a8-b3b4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fd535a8-b3b4-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 16:58:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D32BDAE12;
 Wed, 31 Jul 2019 16:58:35 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2019 18:58:35 +0200
Message-ID: <156458463216.7075.10552410480716651842.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/3] automation: build Xen in openSUSE Tumbleweed
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9wZW5TVVNFIGRpc3RyaWJ1dGlvbiBjb21lcyBpbiB0d28gZmxhdm91cnM6IExlYXAsIHdo
aWNoIGlzCm5vbi1yb2xsaW5nLCBhbmQgcmVsZWFzZWQgYW5udWFseSwgYW5kIFR1bWJsZXdlZWQs
IHdoaWNoIGlzIHJvbGxpbmcuCgpJbiBnZW5lcmFsLCB0aGV5IGFyZSBxdWl0ZSBzaW1pbGFyLCBi
dXQgdGhlIHZlcnNpb25zIG9mIHRoZSBzb2Z0d2FyZQp0aGV5IHNoaXAgY2FuIGJlIHNpZ25pZmlj
YW50bHkgZGlmZmVyZW50LiBBcyBpdCBpcyBlYXN5IHRvIGltYWdpbmUsClR1bWJsZXdlZWQsIGJl
aW5nIHJvbGxpbmcsIGhhcyBtdWNoIG1vcmUgcmVjZW50IGFuZCB1cGRhdGVkIHBhY2thZ2VzLgoK
QWN0dWFsbHksIFR1bWJsZXdlZWQgb2Z0ZW4gc2hpcHMgdGhlIG1vc3QgdXBkYXRlZCByZWxlYXNl
cyBvZiB2YXJpb3VzCnNvZnR3YXJlIGFuZCBwcm9qZWN0cywgYW1vbmcgbWFueSBkaXN0cmlidXRp
b24gYXJvdW5kLgoKRm9yIGluc3RhbmNlLCByaWdodCBub3csIFR1bWJsZXdlZWQgaGFzIGdjYyA5
LjEuMS4gRmVkb3JhIFJhd2hpZGUgYWxzbwpzZWVtcyB0byBoYXZlIDkuMS4xLCB3aGlsZSBGZWRv
cmEgMzAgaGFzIDkuMC4xLiBEZWJpYW4gVW5zdGFibGUgYW5kClVidW50dSBEaXNjbyBib3RoIGhh
dmUgOC4zLjAsIEFGQUlDVC4KCk9mIGNvdXJzZSwgaXQncyBub3QgYXQgYWxsIGxpa2UgInRoZSBt
b3JlIHVwZGF0ZWQgdGhlIGJldHRlciIsIG9yCmFueXRoaW5nIGxpa2UgdGhhdCEgSXQncyBqdXN0
IHRoYXQgSSBzZWUgc29tZSB2YWx1ZSBpbiBoYXZpbmcsIGFzIGEgcGFydApvZiBvdXIgQ0k6Ci0g
bW9yZSBkaXZlcnNpdHksIGluIHRlcm1zIG9mIHZlcnNpb25zIG9mIHRoZSBwYWNrYWdlcy9zb2Z0
d2FyZSB3ZSB0cnkKICB0byBidWlsZCBYZW4gd2l0aCBhbmQgYWdhaW5zdDsKLSBhICJibGVlZGlu
ZyBlZGdlIiBlbnZpcm9ubWVudCwgaW4gb3JkZXIgdG8gY2F0Y2gsIG9yIGF0IGxlYXN0IGJlCiAg
YXdhcmUgb2YsIGJ1aWxkIGlzc3VlcyB3aXRoIGxhdGVzdCBjb21waWxlcnMgYW5kL29yIHdoZW4g
bGlua2luZwogIGFnYWluc3QgdGhlIGxhdGVzdCB2ZXJzaW9uIG9mIHRoaXMgYW5kIHRoYXQgbGli
cmFyeS4KCkludGVyZXN0aW5nbHksIGluIHRoZSBwYXN0IGNvdXBsZSBvZiBkYXlzLCBhIGZldyBi
dWlsZCBpc3N1ZXMgb2YgWGVuLApxZW11LXhlbiBhbmQgaXB4ZSAoYXQgdGhlIGNvbW1pdCB0aGF0
IHdlIHdlcmUgY2hlY2tpbmcgb3V0KSB3aXRoIGdjYwo5LjEuMSB3aGVyZSBkaXNjb3ZlcmVkIGFu
ZCBmaXhlZC4gQW5kIC0tYXQgbGVhc3QgYXMgZmFyIGFzIHRoZSBvbmVzCkkndmUgcmVwb3J0ZWQv
Zml4ZWQtLSBJIGZvdW5kIGFib3V0IHRoZW0gd2hpbGUgYnVpbGRpbmcgWGVuIGluCm9wZW5TVVNF
IFR1bWJsZXdlZWQgKHdoaWxlIHdvcmtpbmcgb24gdGhpcyBwYXRjaCBzZXJpZXMgOi1EICkuCgpI
YXBweSB0byBoZWFyIHdoYXQgcGVvcGxlIHRoaW5rIGFib3V0IGFsbCB0aGlzLiA6LSkKCk9oLCBC
VFcsIGFwYXJ0IGZyb20gYWRkaW5nIHRoZSBUdW1ibGV3ZWVkIGRvY2tlcmZpbGUgYW5kIENJIGpv
YnMsIHRoZQpzZXJpZXMgYWxzbyBkb2VzIHNvbWUgbWlub3IgdHdlYWtpbmcgb2YgdGhlIGFscmVh
ZHkgcHJlc2VudCBvcGVuU1VTRQpMZWFwIGRvY2tlcmZpbGUgKGluIHBhdGNoIDEpLgoKVGhhbmtz
IGFuZCBSZWdhcmRzLgotLS0KRGFyaW8gRmFnZ2lvbGkgKDMpOgogICAgICBhdXRvbWF0aW9uOiB0
cnkgdG8ga2VlcCBvcGVuU1VTRSBMZWFwIGltYWdlIGEgbGl0dGxlIHNtYWxsZXIKICAgICAgYXV0
b21hdGlvbjogYWRkIG9wZW5TVVNFIFR1bWJsZXdlZWQgQ0kgaW1hZ2UKICAgICAgYXV0b21hdGlv
bjogYnVpbGQgaW4gb3BlblNVU0UgVHVtYmxld2VlZAoKIGF1dG9tYXRpb24vYnVpbGQvc3VzZS9v
cGVuc3VzZS1sZWFwLmRvY2tlcmZpbGUgICAgIHwgICAgNiArLQogLi4uL2J1aWxkL3N1c2Uvb3Bl
bnN1c2UtdHVtYmxld2VlZC5kb2NrZXJmaWxlICAgICAgfCAgIDY4ICsrKysrKysrKysrKysrKysr
KysrCiBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sICAgICAgICAgICAgICAgICAgICB8
ICAgMjAgKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXV0b21hdGlvbi9idWlsZC9zdXNlL29wZW5zdXNl
LXR1bWJsZXdlZWQuZG9ja2VyZmlsZQotLQpEYXJpbyBGYWdnaW9saSwgUGguRApodHRwOi8vYWJv
dXQubWUvZGFyaW8uZmFnZ2lvbGkKVmlydHVhbGl6YXRpb24gU29mdHdhcmUgRW5naW5lZXIKU1VT
RSBMYWJzLCBTVVNFIGh0dHBzOi8vd3d3LnN1c2UuY29tLwotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCjw8VGhpcyBoYXBw
ZW5zIGJlY2F1c2UgX0lfIGNob29zZSBpdCB0byBoYXBwZW4hPj4gKFJhaXN0bGluIE1hamVyZSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
