Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4EE4BB7B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:30:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdbYb-0004pE-JA; Wed, 19 Jun 2019 14:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uR8K=US=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hdbYZ-0004p9-RF
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:27:23 +0000
X-Inumbo-ID: 51b5c134-929e-11e9-97a0-af5f14788ffe
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51b5c134-929e-11e9-97a0-af5f14788ffe;
 Wed, 19 Jun 2019 14:27:09 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JEJnSt019625;
 Wed, 19 Jun 2019 14:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=yttiPRpSZZrH5iMOgXU87rDYVYrhNSlNRuXPD3dcjrE=;
 b=ee01PXdUFHKCRVZQBbEAuCNZzx/GyLgDcSp/TKtQkXY2DMJxqiwBR1/8P0+sL4K7a7B5
 XBiVILXz095aw8/e6KKqFdA92dOWJ9NRuqgr3rzp/z5XdzYzghRlSDmatpVrzRNszK9L
 IA7sytloqzLGbCju3v6Y+DAtd1dkwMsoJy+qeIbqYkrDQau5vE+Tq1tbXa/ZUbqGM6T2
 vRv1dnJOcHl5uvsyOSEbxBMlJSVlD+OWu8UlPgmk5QI2J8Fq5K95dgsj/UPmz39xrdUU
 uM1ORIHpFA675tloJYNLnO0fWJkls2vhwdz7OkpFgWmyaSZBm9OfHBVa/rC2fGJjLrA+ PQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t7809btkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 14:26:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JEQTAe194064;
 Wed, 19 Jun 2019 14:26:57 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2t77ynvp68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 14:26:57 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JEQm9v015046;
 Wed, 19 Jun 2019 14:26:48 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 07:26:47 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 434C96A0136; Wed, 19 Jun 2019 10:28:12 -0400 (EDT)
Date: Wed, 19 Jun 2019 10:28:12 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20190619142812.GM10432@char.us.oracle.com>
References: <20190617132946.2817440-1-arnd@arndb.de>
 <alpine.DEB.2.21.1906170913080.2072@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906170913080.2072@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9292
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190118
Subject: Re: [Xen-devel] [PATCH] swiotlb: fix phys_addr_t overflow warning
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
Cc: Juergen Gross <jgross@suse.com>, Joerg Roedel <jroedel@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 iommu@lists.linux-foundation.org, Jesper Dangaard Brouer <brouer@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDk6MTM6MTZBTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIE1vbiwgMTcgSnVuIDIwMTksIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4g
PiBPbiBhcmNoaXRlY3R1cmVzIHRoYXQgaGF2ZSBhIGxhcmdlciBkbWFfYWRkcl90IHRoYW4gcGh5
c19hZGRyX3QsCj4gPiB0aGUgc3dpb3RsYl90YmxfbWFwX3NpbmdsZSgpIGZ1bmN0aW9uIHRydW5j
YXRlcyBpdHMgcmV0dXJuIGNvZGUKPiA+IGluIHRoZSBmYWlsdXJlIHBhdGgsIG1ha2luZyBpdCBp
bXBvc3NpYmxlIHRvIGlkZW50aWZ5IHRoZSBlcnJvcgo+ID4gbGF0ZXIsIGFzIHdlIGNvbXBhcmUg
dG8gdGhlIG9yaWdpbmFsIHZhbHVlOgo+ID4gCj4gPiBrZXJuZWwvZG1hL3N3aW90bGIuYzo1NTE6
OTogZXJyb3I6IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSAnZG1hX2FkZHJfdCcgKGFrYSAndW5z
aWduZWQgbG9uZyBsb25nJykgdG8gJ3BoeXNfYWRkcl90JyAoYWthICd1bnNpZ25lZCBpbnQnKSBj
aGFuZ2VzIHZhbHVlIGZyb20gMTg0NDY3NDQwNzM3MDk1NTE2MTUgdG8gNDI5NDk2NzI5NSBbLVdl
cnJvciwtV2NvbnN0YW50LWNvbnZlcnNpb25dCj4gPiAgICAgICAgIHJldHVybiBETUFfTUFQUElO
R19FUlJPUjsKPiA+IAo+ID4gVXNlIGFuIGV4cGxpY2l0IHR5cGVjYXN0IGhlcmUgdG8gY29udmVy
dCBpdCB0byB0aGUgbmFycm93ZXIgdHlwZSwKPiA+IGFuZCB1c2UgdGhlIHNhbWUgZXhwcmVzc2lv
biBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgbGF0ZXIuCj4gPiAKPiA+IEZpeGVzOiBiOTA3ZTIwNTA4
ZDAgKCJzd2lvdGxiOiByZW1vdmUgU1dJT1RMQl9NQVBfRVJST1IiKQo+ID4gU2lnbmVkLW9mZi1i
eTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKcXVldWVkLgo+IAo+IAo+ID4gLS0t
Cj4gPiBJIHN0aWxsIHRoaW5rIHRoYXQgcmV2ZXJ0aW5nIHRoZSBvcmlnaW5hbCBjb21taXQgd291
bGQgaGF2ZQo+ID4gcHJvdmlkZWQgY2xlYXJlciBzZW1hbnRpY3MgZm9yIHRoaXMgY29ybmVyIGNh
c2UsIGJ1dCBhdCBsZWFzdAo+ID4gdGhpcyBwYXRjaCByZXN0b3JlcyB0aGUgY29ycmVjdCBiZWhh
dmlvci4KPiA+IC0tLQo+ID4gIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCAyICstCj4gPiAg
a2VybmVsL2RtYS9zd2lvdGxiLmMgICAgICB8IDQgKystLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKPiA+IGlu
ZGV4IGQ1M2YzNDkzYTZiOS4uY2ZiZTQ2Nzg1YTNiIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy94
ZW4vc3dpb3RsYi14ZW4uYwo+ID4gKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+ID4g
QEAgLTQwMiw3ICs0MDIsNyBAQCBzdGF0aWMgZG1hX2FkZHJfdCB4ZW5fc3dpb3RsYl9tYXBfcGFn
ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwYWdlICpwYWdlLAo+ID4gIAo+ID4gIAltYXAg
PSBzd2lvdGxiX3RibF9tYXBfc2luZ2xlKGRldiwgc3RhcnRfZG1hX2FkZHIsIHBoeXMsIHNpemUs
IGRpciwKPiA+ICAJCQkJICAgICBhdHRycyk7Cj4gPiAtCWlmIChtYXAgPT0gRE1BX01BUFBJTkdf
RVJST1IpCj4gPiArCWlmIChtYXAgPT0gKHBoeXNfYWRkcl90KURNQV9NQVBQSU5HX0VSUk9SKQo+
ID4gIAkJcmV0dXJuIERNQV9NQVBQSU5HX0VSUk9SOwo+ID4gIAo+ID4gIAlkZXZfYWRkciA9IHhl
bl9waHlzX3RvX2J1cyhtYXApOwo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9kbWEvc3dpb3RsYi5j
IGIva2VybmVsL2RtYS9zd2lvdGxiLmMKPiA+IGluZGV4IGU5MDZlZjJlNjMxNS4uYTNiZTY1MTk3
M2FkIDEwMDY0NAo+ID4gLS0tIGEva2VybmVsL2RtYS9zd2lvdGxiLmMKPiA+ICsrKyBiL2tlcm5l
bC9kbWEvc3dpb3RsYi5jCj4gPiBAQCAtNTQ4LDcgKzU0OCw3IEBAIHBoeXNfYWRkcl90IHN3aW90
bGJfdGJsX21hcF9zaW5nbGUoc3RydWN0IGRldmljZSAqaHdkZXYsCj4gPiAgCWlmICghKGF0dHJz
ICYgRE1BX0FUVFJfTk9fV0FSTikgJiYgcHJpbnRrX3JhdGVsaW1pdCgpKQo+ID4gIAkJZGV2X3dh
cm4oaHdkZXYsICJzd2lvdGxiIGJ1ZmZlciBpcyBmdWxsIChzejogJXpkIGJ5dGVzKSwgdG90YWwg
JWx1IChzbG90cyksIHVzZWQgJWx1IChzbG90cylcbiIsCj4gPiAgCQkJIHNpemUsIGlvX3RsYl9u
c2xhYnMsIHRtcF9pb190bGJfdXNlZCk7Cj4gPiAtCXJldHVybiBETUFfTUFQUElOR19FUlJPUjsK
PiA+ICsJcmV0dXJuIChwaHlzX2FkZHJfdClETUFfTUFQUElOR19FUlJPUjsKPiA+ICBmb3VuZDoK
PiA+ICAJaW9fdGxiX3VzZWQgKz0gbnNsb3RzOwo+ID4gIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZpb190bGJfbG9jaywgZmxhZ3MpOwo+ID4gQEAgLTY2Niw3ICs2NjYsNyBAQCBib29sIHN3aW90
bGJfbWFwKHN0cnVjdCBkZXZpY2UgKmRldiwgcGh5c19hZGRyX3QgKnBoeXMsIGRtYV9hZGRyX3Qg
KmRtYV9hZGRyLAo+ID4gIAkvKiBPaCB3ZWxsLCBoYXZlIHRvIGFsbG9jYXRlIGFuZCBtYXAgYSBi
b3VuY2UgYnVmZmVyLiAqLwo+ID4gIAkqcGh5cyA9IHN3aW90bGJfdGJsX21hcF9zaW5nbGUoZGV2
LCBfX3BoeXNfdG9fZG1hKGRldiwgaW9fdGxiX3N0YXJ0KSwKPiA+ICAJCQkqcGh5cywgc2l6ZSwg
ZGlyLCBhdHRycyk7Cj4gPiAtCWlmICgqcGh5cyA9PSBETUFfTUFQUElOR19FUlJPUikKPiA+ICsJ
aWYgKCpwaHlzID09IChwaHlzX2FkZHJfdClETUFfTUFQUElOR19FUlJPUikKPiA+ICAJCXJldHVy
biBmYWxzZTsKPiA+ICAKPiA+ICAJLyogRW5zdXJlIHRoYXQgdGhlIGFkZHJlc3MgcmV0dXJuZWQg
aXMgRE1BJ2JsZSAqLwo+ID4gLS0gCj4gPiAyLjIwLjAKPiA+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
