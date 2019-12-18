Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BCC12461C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:50:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXnm-0002RW-Op; Wed, 18 Dec 2019 11:47:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihXnk-0002RR-SB
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:47:36 +0000
X-Inumbo-ID: 2a4b3c28-218c-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a4b3c28-218c-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 11:47:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so1906992wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 03:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wZ3opmEP3w0e1R9p5H3HrFkUQTLpZ2G7vPmkGqx+dAo=;
 b=QL93g3677tjiaCUMz20E4/TTeTxkEh7MYU7uME1FXMg3fDpBSlxzFdnvLXm6eifiPI
 TD2Hg8hvPy01JWMr5wPetphcaTTHfFG6neZJVH3jYp46ddu9eFMaDjv7i2iQEHrp2WII
 iwxTS05SMIni5jn7brPCWb2MTfV918cpaBnH8mrGKD1rNquYtl3ptff8Wu75bZmnYF/b
 Af2ew8KgqCCvO4zPfeDfdJQxa3byjWz4gqIzx0rFdTf2fnLsRPinGWtNHLiLBGoCpfuf
 MEPg3kiz4fWyD/hgKtq0RpupnKjo9qi7FUfIt3lMQNWwG+4WB9VFiR8eOM6lZpp8gV7k
 ekYg==
X-Gm-Message-State: APjAAAX1uCA5Q69NjF/YmxVnqK2faJ3tSf60DNrLFuyuVj0QzZ67+1QU
 jay//onaXaSMzXvDJnQ8hKTae4jptEE=
X-Google-Smtp-Source: APXvYqwHywPCq9FIHoFXMsj7yR5T26Z8lcz0HjSTQEeKTVyrQoDzKT5N25cJBroFffqurhsbuw0JMg==
X-Received: by 2002:adf:e5ce:: with SMTP id a14mr2346352wrn.214.1576669647129; 
 Wed, 18 Dec 2019 03:47:27 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id 5sm2443049wrh.5.2019.12.18.03.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 03:47:26 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
References: <AM6PR04MB4246D11109EEAD278B42BD31F9500@AM6PR04MB4246.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.1912171022090.12921@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b7830713-3b3b-1414-e7ad-ed36ebafd2b9@xen.org>
Date: Wed, 18 Dec 2019 11:47:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1912171022090.12921@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] Xen ARM Dom0less passthrough without IOMMU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE3LzEyLzIwMTkgMTg6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPj4gVGhlbiBJIHRyaWVkIHRvIHBhc3N0aHJvdWdoIHRoZSBlTU1DLCBidXQgSSBnb3QgdGhl
IGZvbGxvd2luZwo+PiBlcnJvcjoKPj4gKFhFTikgRE9NMTogWyAgICAwLjg3OTE1MV0gc2RoY2kt
ZXNkaGMtaW14IDQwMDVkMDAwLnVzZGhjOiBjYW4ndCByZXF1ZXN0IHJlZ2lvbiBmb3IgcmVzb3Vy
Y2UgW21lbSAweDQwMDVkMDAwLTB4NDAwNWRmZmZdCj4+IChYRU4pIERPTTE6IFsgICAgMC44OTEx
MzddIHNkaGNpLWVzZGhjLWlteCA0MDA1ZDAwMC51c2RoYzogc2RoY2lfcGx0Zm1faW5pdCBmYWls
ZWQgLTE2Cj4+IChYRU4pIERPTTE6IFsgICAgMC45MDAyNDldIHNkaGNpLWVzZGhjLWlteDogcHJv
YmUgb2YgNDAwNWQwMDAudXNkaGMgZmFpbGVkIHdpdGggZXJyb3IgLTE2Cj4+Cj4+IFdoZXJlIDB4
NDAwNWQwMDAgaXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIHVTREhDKGVNTUMpIG5vZGUg
aW4gdGhlIERULgo+PiBJdCBzZWVtcyB0aGF0IHRoZSBEb21VMSBrZXJuZWwgZG9lcyBub3QgaGF2
ZSBhY2Nlc3MgdG8gdGhhdCBtZW1vcnkgem9uZS4KPiAKPiBJdCBsb29rcyBsaWtlIGRyaXZlcnMv
bW1jL2hvc3Qvc2RoY2ktcGx0Zm0uYzpzZGhjaV9wbHRmbV9pbml0IGZhaWxlZCwKPiBidXQgSSBj
YW5ub3Qgc2VlIGEgc2ltcGxlIHJlYXNvbiB3aHkgaXQgd291bGQuIEFzIEp1bGllbiBtZW50aW9u
ZWQgdGhlCj4gZGV2aWNlIHRyZWUgc25pcHBldCB3b3VsZCBiZSB1c2VmdWwuIEFsc28gdGhlIGRv
bVUgY29uZmlnIGFuZCB0aGUgZnVsbAo+IGRldmljZSB0cmVlIHdvdWxkIGJlIHVzZWZ1bC4gaS5l
LiBkaWQgeW91IGFkZCAieGVuLHBhc3N0aHJvdWdoOyIgdW5kZXIKPiB0aGUgcmVsYXRlZCB1U0RI
QyBub2RlIG9uIHRoZSBob3N0IGRldmljZSB0cmVlPwoKVGhlIG9ubHkgcHVycG9zZSBvZiAieGVu
LHBhc3N0aHJvdWdoIiBpcyB0byBtYXJrIHRoZSBkZXZpY2UgYXMgZGlzYWJsZWQgCmluIERvbTAg
RFQuIEl0IHdpbGwgbm90IGFmZmVjdCBob3cgZGV2aWNlIHdpbGwgYmUgcGFzc3Rocm91Z2ggdG8g
YSBndWVzdC4KCkluIHRoaXMgY2FzZSwgSSBkb24ndCBiZWxpZXZlIHRoZSBwcm9ibGVtIGlzIERU
IHJlbGF0ZWQgYmVjYXVzZSBMaW51eCBpcyAKYWJsZSB0byBmaW5kIHRoZSByZWdpb25zLiBJZiB0
aGUgcmVnaW9uIHdlcmUgbm90IG1hcHBlZCB0byB0aGUgZ3Vlc3QsIAp0aGVuIGl0IHdvdWxkIGJl
IGxpa2VseSByZXN1bHQgdG8gYSBkYXRhIGFib3J0IGxhdGVyIG9uLgoKTG9va2luZyBhdCBBbmRy
ZWkncyBlLW1haWwgYWdhaW4sIGhlIGRvZXNuJ3QgbWVudGlvbiBhbnl0aGluZyBhYm91dCB0aGUg
CjE6MSBtYXBwaW5nLiBTbyBJIGFzc3VtZSwgaGUgaXMgc3RpbGwgdXNpbmcgdGhlIGd1ZXN0IG1l
bW9yeSBsYXlvdXQuIFRoZSAKcGh5c2ljYWwgYWRkcmVzcyAweDQwMDVkMDAwIHdoaWNoIGlzIHJv
dWdobHkgMzcyS0IgaW50byB0aGUgZmlyc3QgUkFNIApiYW5rIGZvciB0aGUgZ3Vlc3QuCgo+PiBJ
J20gdHJ5aW5nIHRvIHBhc3N0aHJvdWdoIHRoZSBlTU1DIGluIG9yZGVyIHRvIG1vdW50IERvbVUx
J3Mgcm9vdAo+PiBvbiBhIFNEQ2FyZCBwYXJ0aXRpb24sIGJlY2F1c2UgSSBjb3VsZG4ndCBnZXQg
dG8gRG9tVTEncyBMaW51eCBwcm9tcHQKPj4gd2hlbiBJIHRyaWVkIHRvIGJvb3Qgd2l0aCBhIHJh
bWRpc2sgbW9kdWxlLiBJIGFsd2F5cyBnZXQgdGhpcyBlcnJvcjoKPj4gKFhFTikgRE9NMTogWyAg
ICAxLjU0NDE5OV0gUkFNRElTSzogQ291bGRuJ3QgZmluZCB2YWxpZCBSQU0gZGlzayBpbWFnZSBz
dGFydGluZyBhdCAwLgo+Pgo+PiBDb3VsZCB0aGlzIGJlIGJlY2F1c2UgdGhlIHJhbWRpc2sgaXMg
dG9vIGJpZz8gVGhlIHNtYWxsZXN0IEkndmUgdHJpZWQgd2l0aAo+PiBJcyBhcHByb3hpbWF0ZWx5
IDYwTUIgaW4gc2l6ZS4gV2hhdCBzaXplIGFyZSB0aGUgcmFtZGlza3MgdGhhdCB5b3UKPj4gYXJl
IHVzaW5nIGluIHlvdXIgZG9tMGxlc3MgYm9vdGluZyBkZW1vcz8KPiAKPiBJIGRvbid0IHRoaW5r
IHNvLCBJIGNvdWxkIGJvb3Qgd2l0aCByYW1kaXNrIDEyME1CIGluIHNpemUgb3IgZXZlbgo+IGxh
cmdlci4gSXQgaXMgcHJvYmFibHkgYW4gYWRkcmVzcyBjYWxjdWxhdGlvbiBlcnJvcjogaXQgaXMg
ZWFzeSB0byBtYWtlCj4gYSBzbWFsbCBtaXN0YWtlIGluIHRoZSBhZGRyZXNzZXMgc28gdGhhdCB0
aGV5IGVuZCB1cCBvdmVybGFwcGluZy4KPiBTb21ldGltZXMgaXQgaXMgZXZlbiBVLUJvb3QgdGhh
dCBjYXVzZXMgdGhlIG92ZXJsYXBzLgo+IAo+IEkgd291bGQgc3VnZ2VzdCB0byB1c2UgSW1hZ2VC
dWlsZGVyIHRvIGNyZWF0ZSB0aGUgVS1Cb290IGJvb3Qgc2NyaXB0IHRvCj4gbG9hZCBhbGwgdGhl
IGJpbmFyaWVzIGFuZCBib290IHRoZSBzeXN0ZW0uIEhhdmUgYSBsb29rIGF0Cj4gdWJvb3Qtc2Ny
aXB0LWdlbiBpbiBwYXJ0aWN1bGFyOgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9WaXJ5YU9TL2lt
YWdlYnVpbGRlci9ibG9iL21hc3Rlci9zY3JpcHRzL3Vib290LXNjcmlwdC1nZW4KCk5pY2Ugc2Ny
aXB0LCBidXQgaXQgc2VlbXMgdG8gY29udGFpbiBoYXJkY29kZWQgdmFsdWUgKHNlZSBvZmZzZXQg
YW5kIAptZW1hZGRyIG92ZXJyaWRlKSwgZG9lcyBub3QgdGFrZSBpbnRvIGFjY291bnQgcmVzZXJ2
ZWQgcmVnaW9uIGFuZCBhc3N1bWUgCndoZXJlIFUtYm9vdC9BVEYgbWF5IGJlIGxvYWRlZC4gU28g
aXQgbWF5IHJlcXVpcmUgc29tZSB3b3JrIGJlZm9yZSBpdCAKY2FuIGJlIHVzZWQgb24gTlhQIGJv
YXJkLi4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
