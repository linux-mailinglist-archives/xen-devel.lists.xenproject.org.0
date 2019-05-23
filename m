Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B527AED
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTl8I-0005cA-Ad; Thu, 23 May 2019 10:39:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wok1=TX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hTl8G-0005bz-N6
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 10:39:32 +0000
X-Inumbo-ID: 0bda99c2-7d47-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bda99c2-7d47-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 10:39:30 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 94qjMrGJ3RSTzUm9wBMmQn4Zi0S1trK+UvEKZomxqmFbhMj3t+qRc2JG5SFFIvETa4JViYwqw7
 Puv5IPM7zmJ05XxiJ8xs6h5EOlxynx2RDpqyG1UISZdeAbvZ91d9cvjy44BWKuWryxVSV0pdB4
 uOIPETGMnVgIjsn6JngrrtSDnFnkNzXFyyhV+9+iYzyw2eT0Ujl1DOds2ekjAjsH2Iyc085GZ6
 zvI5eooU3O+g07UXAir48Qt7kc5zv1xCJu2Wvzu26KH3ZwT7GLWr0xozAGNEzCAjABMkJiVICX
 dFw=
X-SBRS: 2.7
X-MesageID: 821486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="821486"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23782.30785.859446.290967@mariner.uk.xensource.com>
Date: Thu, 23 May 2019 11:38:57 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190220170001.32614-6-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-6-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 5/6] osstest: introduce a script to build a
 FreeBSD package repository
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCA1LzZdIG9zc3Rlc3Q6
IGludHJvZHVjZSBhIHNjcmlwdCB0byBidWlsZCBhIEZyZWVCU0QgcGFja2FnZSByZXBvc2l0b3J5
Iik6Cj4gZGlmZiAtLWdpdCBhL21ha2UtZnJlZWJzZC1mbGlnaHQgYi9tYWtlLWZyZWVic2QtZmxp
Z2h0Cj4gaW5kZXggZDNjNDEzYjUuLmZjM2QyZDgzIDEwMDc1NQo+IC0tLSBhL21ha2UtZnJlZWJz
ZC1mbGlnaHQKPiArKysgYi9tYWtlLWZyZWVic2QtZmxpZ2h0Cj4gQEAgLTM4LDEzICszOCwxNSBA
QCBqb2JfY3JlYXRlX2J1aWxkX2ZpbHRlcl9jYWxsYmFjayAoKSB7Cj4gIAo+ICBmb3IgYXJjaCBp
biAiJGFyY2hlcyI7IGRvCj4gICAgICBzZXRfZnJlZWJzZF9ydW52YXJzCj4gLQo+ICAgICAgY3Jl
YXRlX2ZyZWVic2RfYnVpbGRfam9iIGJ1aWxkLSRhcmNoLWZyZWVic2QKPiAgCj4gLSAgICAjIENy
ZWF0ZSBhbiBpZGVudGljYWwgam9iIHRoYXQncyBnb2luZyB0byB1c2UgdGhlIGJ1aWxkIG91dHB1
dCBmcm9tCj4gLSAgICAjIHRoZSBwcmV2aW91cyBvbmUuCj4gKyAgICAjIENyZWF0ZSBhIGpvYiB0
byBidWlsZCB0aGUgcGFja2FnZXMgYWdhaW5zdCB0aGUgbmV3IHdvcmxkLgo+ICAgICAgZnJlZWJz
ZF9ydW52YXJzPSIkZnJlZWJzZF9ydW52YXJzIGZyZWVic2RidWlsZGpvYj1idWlsZC0kYXJjaC1m
cmVlYnNkIFwKPiAgICAgICAgICAgICAgICAgICAgICAgcmVjaXBlX3Rlc3RpbnN0YWxsPXRydWUi
Cj4gKyAgICBjcmVhdGVfZnJlZWJzZF9wa2dfYnVpbGRfam9iIGJ1aWxkLSRhcmNoLWZyZWVic2Qt
cGFja2FnZXMKPiArCj4gKyAgICAjIENyZWF0ZSBhbiBpZGVudGljYWwgam9iIHRoYXQncyBnb2lu
ZyB0byB1c2UgdGhlIGJ1aWxkIG91dHB1dCBmcm9tCj4gKyAgICAjIHRoZSBwcmV2aW91cyBvbmUu
Cj4gICAgICBjcmVhdGVfZnJlZWJzZF9idWlsZF9qb2IgYnVpbGQtJGFyY2gtZnJlZWJzZC1hZ2Fp
bgo+ICAKPiAgICAgICMgQ3JlYXRlIGEgWGVuIGJ1aWxkIGpvYiB0aGF0J3MgZ29pbmcgdG8gdXNl
IHRoZSBvdXRwdXQgZnJvbSB0aGUgZmlyc3QKClRoaXMgbG9va3MgT0suCgo+IEBAIC03NjgsNyAr
NzczLDkgQEAgcHJvYyBwcmVwYXJlLWJ1aWxkLWhvc3QtZnJlZWJzZCB7fSB7Cj4gICAgICBnbG9i
YWwgam9iaW5mbwo+ICAgICAgaWYge1tyZWNpcGUtZmxhZyB0ZXN0aW5zdGFsbF19IHsgc2V0IGJy
b2tlbiBmYWlsIH0geyBzZXQgYnJva2VuIGJyb2tlbiB9Cj4gICAgICBydW4tdHMgJGJyb2tlbiBo
b3N0LWluc3RhbGwoKikgdHMtZnJlZWJzZC1ob3N0LWluc3RhbGwKPiAtICAgIHJ1bi10cyAuIGhv
c3QtYnVpbGQtcHJlcCB0cy1idWlsZC1wcmVwLWZyZWVic2QKPiArICAgIGlmIHshW3JlY2lwZS1m
bGFnIHNraXBidWlsZHByZXBdfSB7Cj4gKyAgICAgICAgcnVuLXRzIC4gaG9zdC1idWlsZC1wcmVw
IHRzLWJ1aWxkLXByZXAtZnJlZWJzZAoKV2hhdCdzIHRoaXMgZm9yID8gIE9oLCBJIHNlZS4KCkkg
bm90aWNlIHRoYXQgbm9uZSBvZiB5b3VyIGZyZWVic2QgYnVpbGQgam9icyBwYXNzIGFueSBzaGFy
ZS0gaG9zdGZsYWcKc28gdGhleSBhbHdheXMgdXNlIGEgZnJlc2ggaW5zdGFsbGF0aW9uLiAgSXMg
dGhhdCBuZWNlc3NhcnkgPwoKPiAgcHJvYyBuZWVkLWhvc3RzL2NvdmVyaXR5IHt9IHsgcmV0dXJu
IEJVSUxEX0xJTlVYIH0KPiBkaWZmIC0tZ2l0IGEvdHMtZnJlZWJzZC1idWlsZC1wYWNrYWdlcyBi
L3RzLWZyZWVic2QtYnVpbGQtcGFja2FnZXMKPiBuZXcgZmlsZSBtb2RlIDEwMDc1NQo+IGluZGV4
IDAwMDAwMDAwLi45MjAyZGQ5Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi90cy1mcmVlYnNkLWJ1
aWxkLXBhY2thZ2VzCj4gQEAgLTAsMCArMSwxNDUgQEAKPiArIyEvdXNyL2Jpbi9wZXJsIC13Cj4g
KyMgVGhpcyBpcyBwYXJ0IG9mICJvc3N0ZXN0IiwgYW4gYXV0b21hdGVkIHRlc3RpbmcgZnJhbWV3
b3JrIGZvciBYZW4uCj4gKyMgQ29weXJpZ2h0IChDKSAyMDE5IENpdHJpeCBJbmMuCi4uLgo+ICsj
IENvbnN1bWVzIHRoZSBmb2xsb3dpbmcgaW5wdXQgcnVudmFyczoKPiArIyBzdm5yZXZpc2lvbl9m
cmVlYnNkcG9ydHM6IHBvcnRzIHN2biByZXZpc2lvbiBpZCB0byB1c2UuCj4gKyMgc3ZudHJlZV9m
cmVlYnNkcG9ydHMgcG9ydHMgc3ZuIHRyZWUgdG8gZmV0Y2ggdGhlIHNvdXJjZSBjb2RlIGZyb20u
CgpNb3JlIHJlZ3VsYXIgaW4gb3NzdGVzdCB0ZXJtcyB3b3VsZCBiZQogIHRyZWVfZnJlZWJzZHBv
cnRzCiAgcmV2aXNpb25fZnJlZWJzZHBvcnRzCiAgdHJlZXZjc19mcmVlYnNkcG9ydHM9c3ZuCkJ1
dCBJIGd1ZXNzIHN2biBpcyBzdWZmaWNpZW50bHkgdW5saWtlIHdoYXQgb3NzdGVzdCBleHBlY3Rz
IG91dCBvZiBhCnZjcyB0aGF0IHRoaXMgaXMgbm90IGZlYXNpYmxlLCBhbmQgaXQgaXMgYmV0dGVy
IHRvIGRvIGl0IHRoaXMgd2F5LgoKPiArc3ViIGNoZWNrb3V0ICgpIHsKPiArICAgIG15ICR1ID0g
VVJJLT5uZXcoJGN7SHR0cFByb3h5fSk7Cj4gKyAgICBteSAkaG9zdCA9ICR1LT5ob3N0Owo+ICsg
ICAgbXkgJHBvcnQgPSAkdS0+cG9ydDsKPiArICAgIHByZXBidWlsZGRpcnMoKTsKPiArCj4gKyAg
ICBsb2dtKCJDaGVja291dCBwb3J0cyB0cmVlIGZyb20gc3ZuIik7Cj4gKyAgICB0YXJnZXRfY21k
X2J1aWxkKCRobywgNDAwMCwgJGJ1aWxkZGlyLCA8PEVORCk7Cj4gK2NkICRidWlsZGRpcgo+ICty
bSAtcmYgcG9ydHMKPiArIyBzdm4gaWdub3JlcyBIVFRQX1BST1hZIGVudnZhcgo+ICtzdm5saXRl
IGNoZWNrb3V0IC0tY29uZmlnLW9wdGlvbiBzZXJ2ZXJzOmdsb2JhbDpodHRwLXByb3h5LWhvc3Q9
JGhvc3QgXFwKPiArICAgICAgICAgICAgICAgICAtLWNvbmZpZy1vcHRpb24gc2VydmVyczpnbG9i
YWw6aHR0cC1wcm94eS1wb3J0PSRwb3J0IFxcCj4gKyAgICAgICAgICAgICAgICAgLS10cnVzdC1z
ZXJ2ZXItY2VydCBcXAo+ICsgICAgICAgICAgICAgICAgICRyeyJzdm50cmVlX2ZyZWVic2Rwb3J0
cyJ9IFxcCj4gKyAgICAgICAgICAgICAgICAgLXIgJHJ7InN2bnJldmlzaW9uX2ZyZWVic2Rwb3J0
cyJ9IHBvcnRzCgpXaWxsIHRoaXMgd29yayB0byBjYWNoZSB0aGUgY2hlY2tvdXQgPyAgQWxsIG9m
IHRoaXMgc2F5cyBodHRwIGJ1dCBJCmFzc3VtZSBpdCdzIHJlYWxseSBodHRwcyA/ICBUeXBpY2Fs
bHksIGh0dHBzIGNsaWVudHMgZXhwZWN0IHRvIGRvIHRoZQpUTFMgdGhlbXNlbHZlcyBidXQgSSB0
aGluayB5b3UncmUgdXNpbmcgb3VyIHNxdWlkIG1pdG0gYW5kIHRoYXQncyB3aGF0CiItLXRydXN0
LXNlcnZlci1jZXJ0IiBpcyBkb2luZyA/CgpSYXRoZXIgdGhhbiAiLS10cnVzdC1zZXJ2ZXItY2Vy
dCIgd2hpY2ggZGlzYWJsZXMgVExTJ3Mgb3duIG1pdG0KcHJvdGVjdGlvbiBpdCB3b3VsZCBiZSBy
YXRoZXIgYmV0dGVyIHRvIGluamVjdCB0aGUgb3NzdGVzdCBtaXRtIHNxdWlkCmNlcnQgaW50byB0
aGUgdGVzdGJlZCwgYnV0IHRoYXQgbWF5IGJlIGRpZmZpY3VsdCwgYW5kIHRoZSByaXNrIGlzIG9u
bHkKZnJvbSBpbnRlcm5hbCB0aGluZ3MgYmV0d2VlbiB0aGUgYnVpbGQgKHRlc3QpIGJveCBhbmQg
dGhlIHByb3h5LgoKPiArc3ViIGNyZWF0ZV9qYWlsKCkgewo+ICsgICAgbXkgJHNyY19wcmVmaXgg
PSAkcnsiZnJlZWJzZF9kaXN0cGF0aCJ9IHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgIGdldF9z
dGFzaGVkKCJwYXRoX2ZyZWVic2RkaXN0IiwgJHJ7ImZyZWVic2RidWlsZGpvYiJ9KTsKPiArICAg
IG15ICRkc3RfcHJlZml4ID0gIi9yb290L3NldHMiOwoKRG8gd2UgbmVlZCBhIGphaWwgZm9yIHRo
aXMgPyAgV2UgaGF2ZSBhIHdob2xlIGJhcmVtZXRhbCBPUyBpbnN0YWxsCndob3NlIGVudGlyZSBw
dXJwb3NlIGlzIHRvIGRvIHRoaXMgYnVpbGQgLi4uCgo+ICtsb2dtKCJGcmVlQlNEIHBhY2thZ2Vz
IGJ1aWx0IHN1Y2Nlc3NmdWwiKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXmx5IDotKQoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
