Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12B15A5D5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 22:23:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgxLO-0004QC-ID; Fri, 28 Jun 2019 20:19:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgxLM-0004Q7-Ty
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 20:19:36 +0000
X-Inumbo-ID: 0bc83112-99e2-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bc83112-99e2-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 20:19:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FA1A208C4;
 Fri, 28 Jun 2019 20:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561753174;
 bh=BbcKJUF6DfDWAQpwvywPHbqRlQJeU/LwZ69S14PxvDM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=G/nEat+l8bfWnVJ3LS034+SwicaHF7kdcw1PxQ3VFEUbwQTGoDKkPwG8EuNM7K6Jz
 FlLjs+pkJtzF8Y4xfN93ZZ/TuSxuuaufE+IJ+OAfd4yp1yHIa/9cgMwgRbv6QZgIAe
 qeHA1q+ajTsJMM6TWun5dIT6XUb71clLvp7QoR2U=
Date: Fri, 28 Jun 2019 13:19:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Denis Obrezkov <denisobrezkov@gmail.com>
In-Reply-To: <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
Message-ID: <alpine.DEB.2.21.1906281317560.5851@sstabellini-ThinkPad-T480s>
References: <ed5ec761-ec79-1c5a-0b88-f20bfb99cead@gmail.com>
 <c9cd784e-ecf3-c442-5b70-e4ca43ce6b64@gmail.com>
 <alpine.DEB.2.21.1906271730410.5851@sstabellini-ThinkPad-T480s>
 <CALC81-szbJK1xx--gqt-fDUQYN+_-WNdLeXi-Cut-wXRfFsFsQ@mail.gmail.com>
 <alpine.DEB.2.21.1906280901120.5851@sstabellini-ThinkPad-T480s>
 <CALC81-sX7Coj9Lg_zkeRxCTDvLQKc6iABtTfJQP53heCOsA85Q@mail.gmail.com>
 <0a7e9f5f-3b82-52d3-6d18-c60aa7e6e8a6@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] xen on beagleboard-x15: fails to access PRCM MPU
 register
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
Cc: Iain Hunter <drhunter95@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyOCBKdW4gMjAxOSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gSGkgSWFpbiwKPiAK
PiBPbiA2LzI4LzE5IDc6MjUgUE0sIElhaW4gSHVudGVyIHdyb3RlOgo+ID4gSGkgU3RlZmFubywK
PiA+IEl0IHdhcyBhIHBhdGNoc2V0IEknZCBjaXJjdWxhdGVkIGVhcmxpZXIgaW4gdGhlIEdTb0Mg
cHJvY2Vzcy4KPiA+IEJhc2ljYWxseSB0aGUgcGFydGlhbCBwb3J0IG9mIFhlbiBvbiBYMTUgSSdk
IGRvbmUgbGFzdCB5ZWFyLiBUaGUgYnVpbGQKPiA+IHNjcmlwdCBpcyB0aGUgcmVmZXJlbmNlIGZv
ciB3aGljaCBwYXRjaGVzIHdlcmUgYWN0dWFsbHkgdXNlZC4KPiA+IElhaW4KPiBJIGJlbGlldmUg
dGhlIHJlYXNvbiB3ZSBoYXZlbid0IHN0YXJ0ZWQgZnJvbSB0cnlpbmcgeW91ciBwYXRjaCB3YXMg
dGhhdAo+IEkgdGhvdWdodCB0aGF0IHNpbmNlIHlvdSBoYWRuJ3QgdXNlZCBzbXAgeW91ciBzb2x1
dGlvbiBtaWdodCBub3Qgd29yayBpbgo+IG91ciBjYXNlLCBzaW5jZSB3ZSB3YW50IHRvIGhhdmUg
c21wIChJIHdhcyBwcm9iYWJseSB3cm9uZykuCj4gSSB0aGluayBJIHNob3VsZCByZXByb2R1Y2Ug
YWxsIHRoZSBpc3N1ZXMgc3RlcC1ieS1zdGVwIHRoYXQgSWFpbiBmYWNlZAo+IGFuZCBhcHBseSBo
aXMgcGF0Y2hlcyB3aGVyZSB0aGV5IGFyZSByZXF1aXJlZCAob3RoZXJ3aXNlIGl0IHdvdWxkIGJl
Cj4gaGFyZCBmb3IgbWUgdG8gdW5kZXJzdGFuZCB3aGF0J3MgaGFwcGVuaW5nKS4KPiAKPiBTdGVm
YW5vLCBKdWxpZW4/CgpZZXMsIEkgdGhpbmsgeW91IHNob3VsZCByZXByb2R1Y2UgYWxsIHRoZSBp
c3N1ZXMgc3RlcCBieSBzdGVwIHRvIGtub3cKZm9yIHN1cmUgd2hhdCBpcyByZXF1aXJlZCBhbmQg
d2h5LiBJbiB0aGlzIGNhc2UsIGl0IGlzIHZlcnkgbGlrZWx5IHRoYXQKd2UnbGwgbmVlZCBJYWlu
J3MgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
