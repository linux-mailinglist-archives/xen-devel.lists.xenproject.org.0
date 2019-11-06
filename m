Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5786F1AC9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 17:08:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSNoA-0000P0-Sl; Wed, 06 Nov 2019 16:05:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jMgn=Y6=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1iSNo8-0000Ov-Mj
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 16:05:20 +0000
X-Inumbo-ID: 3aef3dca-00af-11ea-9631-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aef3dca-00af-11ea-9631-bc764e2007e4;
 Wed, 06 Nov 2019 16:05:19 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l202so21451401oig.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=64hrqu/vQ7OGvSnY8/7zVhi3gVactcah6O2vkBSklxU=;
 b=d7d5Dw9nF/6TQzt9V1ffLuSjskOslEzvqNlh1RpFiAeB2bkuGo7IggeGunMLB+gfKq
 WXzLJaIgWmVGVl4v0NAO9pDw6MqnDIB9cWsdxF4cIvCD1D2vk1W74+WiSivAZ9UrTwJs
 MCEmvOwWKc3nZZgrKRkekhxpXX9XY+TbLfh0Tpi7+1TtUrxYgXnvC8JuX+8M3b09BUT8
 7dnl7QbjcmjQxw5NhA6h4JfwZf3uv7gFWd8FhQHTeYnaZKFLiOO40x1wqGtsH1VH0yNE
 40cT/+J42y9Fohw2egk+Mn2hiXtOjKjeJMIhZR1yAJEl9p/IvQXA0T3gaASxpMZnMkCJ
 21Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=64hrqu/vQ7OGvSnY8/7zVhi3gVactcah6O2vkBSklxU=;
 b=LbHtlQGaibir8Pslyy3H6wc93cKj6QpGlSDM0YYgJpVhHNhVbpcgwX8mXPnmO5w8cV
 AbEa+DZk8G5pO6o7+WNKN41JT9xk8OGWvkmBJhQzdv/JW92a2hmm1cJt+G9aXQrbHJ0L
 inya5NRuuKLT4AUU72lmUXd7c9Pb6sLo0gGNoPmKAmzX/Mbf8sNbVYWpZsidJW6DxXoi
 K4H/m98wh2pL7JnDqLOTLjH3LJd9NBgyk7b4EkpS83f/FIjL/h1+r1BKztpTLt064tUB
 i9zJLTdyU3oy6pILUpPbpwbYU3jNkPxIYkIRhnjH5KLFe7b64/WTUGxsdUclH5bjF1ad
 Bjlw==
X-Gm-Message-State: APjAAAUwz+8dsyEk25DXpM5YTpQJel+36QQVSdh+boWvA6T+4qzcsICm
 zivlOWfAbhkDWxNYnwVPNbfmj4egH2nEmc2vz0rVhg==
X-Google-Smtp-Source: APXvYqzaP+yWEF70z/KqKnujAWBTvm5aQj4wddRKM2S8f+/Ktf47uuMJ2MIJorOjYeG4oii0EHkQg647ftJDLFR3dII=
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr2762720oia.146.1573056319217; 
 Wed, 06 Nov 2019 08:05:19 -0800 (PST)
MIME-Version: 1.0
References: <157298160814.27285.16893877491189017648@37313f22b938>
 <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
In-Reply-To: <73852c81-87b7-e5f5-4041-d24f078cc7fa@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Nov 2019 16:05:08 +0000
Message-ID: <CAFEAcA8SvSGCZsYT1LmN1cP1BjVDPqLP90yW9TCbvVA=kmyqBw@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [Xen-devel] [PULL v2 0/3] Trivial branch patches
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA1IE5vdiAyMDE5IGF0IDIwOjA2LCBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZp
ZXIuZXU+IHdyb3RlOgo+Cj4gTGUgMDUvMTEvMjAxOSDDoCAyMDoyMCwgbm8tcmVwbHlAcGF0Y2hl
dy5vcmcgYSDDqWNyaXQgOgo+ID4gUGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVN
VS8yMDE5MTEwNTE3NTAxMC4yNTkxLTEtbGF1cmVudEB2aXZpZXIuZXUvCj4gPgo+ID4KPiA+Cj4g
PiBIaSwKPiA+Cj4gPiBUaGlzIHNlcmllcyBzZWVtcyB0byBoYXZlIHNvbWUgY29kaW5nIHN0eWxl
IHByb2JsZW1zLiBTZWUgb3V0cHV0IGJlbG93IGZvcgo+ID4gbW9yZSBpbmZvcm1hdGlvbjoKPiA+
Cj4gPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUFVMTCB2MiAwLzNdIFRyaXZpYWwgYnJhbmNoIHBh
dGNoZXMKPiA+IFR5cGU6IHNlcmllcwo+ID4gTWVzc2FnZS1pZDogMjAxOTExMDUxNzUwMTAuMjU5
MS0xLWxhdXJlbnRAdml2aWVyLmV1Cj4gPgo+ID4gPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQo+
ID4gIyEvYmluL2Jhc2gKPiA+IGdpdCByZXYtcGFyc2UgYmFzZSA+IC9kZXYvbnVsbCB8fCBleGl0
IDAKPiA+IGdpdCBjb25maWcgLS1sb2NhbCBkaWZmLnJlbmFtZWxpbWl0IDAKPiA+IGdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQo+ID4gZ2l0IGNvbmZpZyAtLWxvY2FsIGRpZmYu
YWxnb3JpdGhtIGhpc3RvZ3JhbQo+ID4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1tYWlsYmFj
ayBiYXNlLi4KPiA+ID09PSBURVNUIFNDUklQVCBFTkQgPT09Cj4gPgo+ID4gU3dpdGNoZWQgdG8g
YSBuZXcgYnJhbmNoICd0ZXN0Jwo+ID4gNDlhNTVmNyBnbG9iYWw6IFNxdWFzaCAndGhlIHRoZScK
PiA+IGMwYjU1MTMgaHcvbWlzYy9ncmxpYl9haGJfYXBiX3BucDogRml4IDgtYml0IGFjY2Vzc2Vz
Cj4gPiBlYjQzMzk1IGh3L21pc2MvZ3JsaWJfYWhiX2FwYl9wbnA6IEF2b2lkIGNyYXNoIHdoZW4g
d3JpdGluZyB0byBQblAgcmVnaXN0ZXJzCj4gPgo+ID4gPT09IE9VVFBVVCBCRUdJTiA9PT0KPiA+
IDEvMyBDaGVja2luZyBjb21taXQgZWI0MzM5NWJmOGYxIChody9taXNjL2dybGliX2FoYl9hcGJf
cG5wOiBBdm9pZCBjcmFzaCB3aGVuIHdyaXRpbmcgdG8gUG5QIHJlZ2lzdGVycykKPiA+IDIvMyBD
aGVja2luZyBjb21taXQgYzBiNTUxM2Y5NzFhIChody9taXNjL2dybGliX2FoYl9hcGJfcG5wOiBG
aXggOC1iaXQgYWNjZXNzZXMpCj4gPiAzLzMgQ2hlY2tpbmcgY29tbWl0IDQ5YTU1ZjdmZWIxOSAo
Z2xvYmFsOiBTcXVhc2ggJ3RoZSB0aGUnKQo+ID4gRVJST1I6IGRvIG5vdCB1c2UgQzk5IC8vIGNv
bW1lbnRzCj4gPiAjMjY6IEZJTEU6IGRpc2FzL2xpYnZpeGwvdml4bC9pbnZhbHNldC5oOjEwNToK
PiA+ICsgIC8vIE5vdGUgdGhhdCB0aGlzIGRvZXMgbm90IG1lYW4gdGhlIGJhY2tpbmcgc3RvcmFn
ZSBpcyBlbXB0eTogaXQgY2FuIHN0aWxsCj4KPiBBcyByZXBvcnRlZCBieSBEYXZpZCBHaWxiZXJ0
LCB0aGlzIGlzIGEgZmFsc2UgcG9zaXRpdmUgYXMgdGhpcyBmaWxlIGlzIGEKPiBDKysgZmlsZS4K
ClRydWUsIGJ1dCBpdCdzIGFsc28gYSB0aGlyZC1wYXJ0eSBkZXBlbmRlbmN5IHRoYXQgd2UgaGF2
ZQp0YWtlbiBhIGNvcHkgb2YuIElmIHdlIGNhcmUgYWJvdXQgZml4aW5nIGl0cyB0eXBvcyBpbiBj
b21tZW50cwp3ZSBzaG91bGQgZG8gdGhhdCBieSBzdWJtaXR0aW5nIHRoZSBmaXhlcyB1cHN0cmVh
bS4gV2Ugc2hvdWxkCmF2b2lkIG1ha2luZyBjaGFuZ2VzIHRvIG91ciBsb2NhbCBjb3B5IG9mIHRo
aXMgY29kZSBiZWNhdXNlCml0IGp1c3QgbWFrZXMgaXQgdW5uZWNlc3NhcmlseSBtb3JlIGRpZmZp
Y3VsdCB0byBkbyB1cGRhdGVzIHRvCm5ld2VyIHZlcnNpb25zLgoKQ291bGQgeW91IGRyb3AgdGhh
dCBjaGFuZ2UsIHBsZWFzZT8gKFNvcnJ5IEkgZGlkbid0IG5vdGljZQppdCBnb2luZyBieSB3aGVu
IHRoZSBwYXRjaCB3YXMgb3JpZ2luYWxseSBvbiBsaXN0LikKCnRoYW5rcwotLSBQTU0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
