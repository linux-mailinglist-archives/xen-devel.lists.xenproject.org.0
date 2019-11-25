Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A991090BA
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:08:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFwT-0005sA-Eh; Mon, 25 Nov 2019 15:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GjSA=ZR=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iZFwS-0005s3-FX
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 15:06:20 +0000
X-Inumbo-ID: 21d3ebe8-0f95-11ea-b3bd-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21d3ebe8-0f95-11ea-b3bd-bc764e2007e4;
 Mon, 25 Nov 2019 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x/4708n83DddUcb1JxBIjq+7qHsWLgMsPnkJ5bmQCcQ=; b=erxEiMF+XJJrmAlCYziB5eZWqs
 KKNR0M0ZAI/ro3CMvVgKqS/gR7UwwWqfZH4/vAlUaTOqiczMYp5ghrcetMzpYOucHapIo7pclO6g4
 wayNKv2CeSdJ/sYnE5iL+8zSNPH5pFncpYqoF1o42i7XDYpeAeEGVEP5o7aSFqfwR1Sg=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:47255
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iZFxL-000313-Uo; Mon, 25 Nov 2019 16:07:16 +0100
To: Jan Beulich <jbeulich@suse.com>
References: <070c28df-c4b4-dd49-fb9d-efb233f39b0d@eikelenboom.it>
 <e7cf3d8b-9706-b31b-6ee5-a9f8af0ad142@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <fb392b70-b916-3ed0-ba32-4f50c6dc2deb@eikelenboom.it>
Date: Mon, 25 Nov 2019 16:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e7cf3d8b-9706-b31b-6ee5-a9f8af0ad142@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable + linux 5.4.0-rc8: RIP:
 0010:xennet_poll+0x35f/0xae0
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUvMTEvMjAxOSAxNTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjUuMTEuMjAxOSAx
NToyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBMLlMuLAo+Pgo+PiBBdCBwcmVzZW50
IG9uZSBvZiBteSBQVkggVk0ncyBrZXJuZWwgY3Jhc2hlZCB3aXRoIHRoZSBzcGxhdCBiZWxvdwo+
PiAoaGF2ZW4ndCBzZWVuIGl0IGJlZm9yZSwgc28gY291bGQgYmUgc29tZXRoaW5nIHRoYXQgaGFw
cGVucyBzcG9yYWRpY2FsbHkpLgo+Pgo+PiBBbnkgaWRlYXMgPwo+Pgo+PiAtLQo+PiBTYW5kZXIK
Pj4KPj4KPj4KPj4gZGF0YWJhc2UgZGF0YWJhc2Vsb2dpbjogIGxvZ2luOiBbMTg0NTAzLjQyODgx
MV0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIE5PUFRJCj4+IFsxODQ1
MDMuNDI4ODg3XSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA1LjQu
MC1yYzgtMjAxOTExMjMtZG9mbHItbWFjODAyMTFkZWJ1ZysgIzEKPj4gWzE4NDUwMy40Mjg5MzJd
IFJJUDogMDAxMDp4ZW5uZXRfcG9sbCsweDM1Zi8weGFlMAo+PiBbMTg0NTAzLjQyODk1NV0gQ29k
ZTogYmEgMDAgMDEgMDAgMDAgNDggOGIgOGQgYzAgMDAgMDAgMDAgMGYgYjcgYjQgMjQgOTIgMDAg
MDAgMDAgNDggOGIgNWMgMjQgNzggM2QgMDAgMDEgMDAgMDAgMGYgNGUgZDAgODkgNTUgMjggOGIg
OTUgYmMgMDAgMDAgMDAgPDg5PiA3NCAxMSAzYyA0OCA4YiA4ZCBjMCAwMCAwMCAwMCA4YiA5NSBi
YyAwMCAwMCAwMCA4OSA0NCAxMSAzOCA4OQo+IAo+IFRoZSBpbnNuIGhlcmUgYmVpbmcgIm1vdiAg
ICAgJWVzaSwoJXJjeCwlcmR4LDB4M2MpIiAuLi4KPiAKPj4gWzE4NDUwMy40MjkwMjddIFJTUDog
MDAxODpmZmZmYzkwMDAwMDAzZTEwIEVGTEFHUzogMDAwMTAyODcKPj4gWzE4NDUwMy40MjkwNDld
IFJBWDogMDAwMDAwMDAwMDAwMDA0MiBSQlg6IGZmZmZjOTAwMDAwMDNlODggUkNYOiBmZmZlODg4
MDBiODY1YTgwCj4gCj4gLi4uIEkgbm90aWNlIGNvcnJ1cHRpb24gdG8gYml0IDQ4IG9mIFJDWCBo
ZXJlLiBUaGlzIGNhbiBiZSBhIHJlc3VsdCBvZgo+IG1lbW9yeSBjb3JydXB0aW9uLCBidXQgcHJp
b3IgaW5zdGFuY2VzIG9mIHN1Y2ggdGhhdCBJIGhhZCB0byBsb29rIGludG8KPiB3ZXJlIGJpdCBm
bGlwcyBpbiB0aGUgQ1BVIGluc3RlYWQuIElzIHRoaXMgYSBzZXJ2ZXIgb3IgZGVza3RvcCBjbGFz
cwo+IENQVT8KPiAKPiBKYW4KPiAKCkRlc2t0b3AgKEFNRCBwaGVub20gSUkgWDYpCgpJIGhhdmUg
aGFkIHNvbWUgb3RoZXIga2VybmVsIHNwbGF0cyBpbiBrZXJuZWwgbmV0d29ya2luZyBjb2RlIHRo
ZSBsYXN0IG1vbnRocwp0aGF0IGRpZG4ndCBtYWtlIHNlbnNlIHRvIG1haW50YWluZXJzIGFuZCB0
aGF0IHdlcmUgd3JpdHRlbiBvZmYgdG8gInNvbWUga2luZCBvZiBjb3JydXB0aW9uIi4gCgpTbyBJ
IHdpbGwgc2VlIHRvIHNjaGVkdWxlIGEgcnVuIG9mIG1lbXRlc3Q4NiBqdXN0IHRvIHRyeSB0byBy
dWxlIG91dAptZW1vcnkgZ29pbmcgYmFkLgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
