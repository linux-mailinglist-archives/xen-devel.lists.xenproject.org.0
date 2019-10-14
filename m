Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27858D5D95
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 10:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJvln-0002mb-Rm; Mon, 14 Oct 2019 08:31:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TRx6=YH=kernel.org=shawnguo@srs-us1.protection.inumbo.net>)
 id 1iJvj7-00027z-KI
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 08:29:13 +0000
X-Inumbo-ID: b366c206-ee5c-11e9-a531-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b366c206-ee5c-11e9-a531-bc764e2007e4;
 Mon, 14 Oct 2019 08:29:13 +0000 (UTC)
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 975F220673;
 Mon, 14 Oct 2019 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571041752;
 bh=4xRYNc1AsGeEeRyhMqeyE0eI5lZWBeRZlGnQlsC3iT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=poW3FdOhnfzxFqeIBCD96TFK9ogf+8ey1lA8yG5SXAHL0D+X3YPBSgIrE4MospI+Z
 hb7zs1kMA8wdggiEu844GDKWPb4Rcib/9/G/2T7FwutmRJD3ym78J+PHMeoJEufODN
 RPspDY69Cl+C4TjFoM9KzAMs5IyG7dvkprUUGz3U=
Date: Mon, 14 Oct 2019 16:28:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Message-ID: <20191014082847.GH12262@dragon>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
 <20190924181244.7159-8-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924181244.7159-8-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 14 Oct 2019 08:31:58 +0000
Subject: Re: [Xen-devel] [PATCH 07/11] dts: arm64: layerscape: add
 dma-ranges property to qoric-mc node
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 mbrugger@suse.com, robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
 f.fainelli@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-tegra@vger.kernel.org, robh+dt@kernel.org,
 wahrenst@gmx.net, james.quinlan@broadcom.com, linux-pci@vger.kernel.org,
 dmaengine@vger.kernel.org, xen-devel@lists.xenproject.org,
 Li Yang <leoyang.li@nxp.com>, frowand.list@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDg6MTI6MzhQTSArMDIwMCwgTmljb2xhcyBTYWVueiBK
dWxpZW5uZSB3cm90ZToKPiBxb3JpcS1tYydzIGRwbWFjcyBETUEgY29uZmlndXJhdGlvbiBpcyBp
bmhlcml0ZWQgZnJvbSB0aGVpciBwYXJlbnQgbm9kZSwKPiB3aGljaCBhY3RzIGEgYnVzIGluIHRo
aXMgcmVnYXJkLiBTbyBmYXIgaXQgbWFrZWQgYWxsIGRldmljZXMgYXMKPiBkbWEtY29oZXJlbnQg
YnV0IG5vIGRtYS1yYW5nZXMgcmVjb21tZW5kYXRpb24gaXMgbWFkZS4KPiAKPiBUaGUgdHJ1dGgg
aXMgdGhhdCB0aGUgdW5kZXJseWluZyBpbnRlcmNvbm5lY3QgaGFzIERNQSBjb25zdHJhaW50cywg
c28KPiBhZGQgYW4gZW1wdHkgZG1hLXJhbmdlcyBpbiBxb3JpcS1tYydzIG5vZGUgaW4gb3JkZXIg
Zm9yIERUJ3MgRE1BCj4gY29uZmlndXJhdGlvbiBjb2RlIHRvIGdldCB0aGUgRE1BIGNvbnN0cmFp
bnRzIGZyb20gaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBTYWVueiBKdWxpZW5uZSA8
bnNhZW56anVsaWVubmVAc3VzZS5kZT4KClVwZGF0ZWQgc3ViamVjdCBwcmVmaXggYXMgJ2FybTY0
OiBkdHM6IC4uLicsIGFuZCBhcHBsaWVkIHRoZSBwYXRjaC4KClNoYXduCgo+IC0tLQo+IAo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpIHwgMSArCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLmR0c2kgfCAxICsKPiAgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2MGEuZHRzaSB8IDEgKwo+ICAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaQo+IGluZGV4IGM2NzZkMDc3MTc2Mi4uZjBkMGI2
MTQ1YjcyIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1s
czEwODhhLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMx
MDg4YS5kdHNpCj4gQEAgLTY5OCw2ICs2OTgsNyBAQAo+ICAJCQkgICAgICA8MHgwMDAwMDAwMCAw
eDA4MzQwMDAwIDAgMHg0MDAwMD47IC8qIE1DIGNvbnRyb2wgcmVnICovCj4gIAkJCW1zaS1wYXJl
bnQgPSA8Jml0cz47Cj4gIAkJCWlvbW11LW1hcCA9IDwwICZzbW11IDAgMD47CS8qIFRoaXMgaXMg
Zml4ZWQtdXAgYnkgdS1ib290ICovCj4gKwkJCWRtYS1yYW5nZXM7Cj4gIAkJCWRtYS1jb2hlcmVu
dDsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDE+Owo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5k
dHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMjA4eGEuZHRzaQo+IGlu
ZGV4IDdhMGJlOGVhYTg0YS4uZmQ2MDM2Yjc4NjVjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczIwOHhhLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMyMDh4YS5kdHNpCj4gQEAgLTM0MCw2ICszNDAsNyBAQAo+
ICAJCQkgICAgICA8MHgwMDAwMDAwMCAweDA4MzQwMDAwIDAgMHg0MDAwMD47IC8qIE1DIGNvbnRy
b2wgcmVnICovCj4gIAkJCW1zaS1wYXJlbnQgPSA8Jml0cz47Cj4gIAkJCWlvbW11LW1hcCA9IDww
ICZzbW11IDAgMD47CS8qIFRoaXMgaXMgZml4ZWQtdXAgYnkgdS1ib290ICovCj4gKwkJCWRtYS1y
YW5nZXM7Cj4gIAkJCWRtYS1jb2hlcmVudDsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4g
IAkJCSNzaXplLWNlbGxzID0gPDE+Owo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvZnNsLWx4MjE2MGEuZHRzaQo+IGluZGV4IDQwOGUwZWNkY2U2YS4uMzczNWJiMTM5Y2IyIDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0
c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNp
Cj4gQEAgLTg2OCw2ICs4NjgsNyBAQAo+ICAJCQltc2ktcGFyZW50ID0gPCZpdHM+Owo+ICAJCQkv
KiBpb21tdS1tYXAgcHJvcGVydHkgaXMgZml4ZWQgdXAgYnkgdS1ib290ICovCj4gIAkJCWlvbW11
LW1hcCA9IDwwICZzbW11IDAgMD47Cj4gKwkJCWRtYS1yYW5nZXM7Cj4gIAkJCWRtYS1jb2hlcmVu
dDsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDE+Owo+
IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
