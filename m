Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4885C945D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 00:32:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFn8Z-0002ru-Cz; Wed, 02 Oct 2019 22:30:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFn8X-0002rn-RP
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 22:30:21 +0000
X-Inumbo-ID: 37b8d41a-e564-11e9-b588-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 37b8d41a-e564-11e9-b588-bc764e2007e4;
 Wed, 02 Oct 2019 22:30:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAB142133F;
 Wed,  2 Oct 2019 22:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570055420;
 bh=zr/PxmWpmynfx/A2GxHzVF2JvFZlIqbFkUnRUKm2wRM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dZ1Z8sDEsugI6hx9e22VP3ootiev/d+C5vv43oAWM7ZpP7Bt4Ku6m5GqfO8k80pWg
 uqnWU6tAnAoMNyAzmLUagIh7QkA5fnY6CebR6fcEVC9+TE/01UV/ibiZwf9npivbGM
 Pcu44wCM/1nf5Ia0SpJEuVjFhXIWYUa0Iw9H7xbE=
Date: Wed, 2 Oct 2019 15:30:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <75c8d8f0-e44b-154f-b3f1-3980313c5ac0@arm.com>
Message-ID: <alpine.DEB.2.21.1910021514110.2691@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-8-sstabellini@kernel.org>
 <75c8d8f0-e44b-154f-b3f1-3980313c5ac0@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7b 8/8] xen/arm: add dom0-less device
 assignment info to docs
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyIE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgU3RlZmFubywKPiAK
PiBPbiAxMC8xLzE5IDEyOjMwIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiArLSB4
ZW4scmVnCj4gPiArCj4gPiArICBUaGUgeGVuLHJlZyBwcm9wZXJ0eSBpcyBhbiBhcnJheSBvZjoK
PiA+ICsKPiA+ICsgICAgPHBoeXNfYWRkciBzaXplIGd1ZXN0X2FkZHI+Cj4gPiArCj4gPiArICBU
aGV5IHNwZWNpZnkgdGhlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIGRldmljZSBt
ZW1vcnkKPiA+ICsgIHJhbmdlcyB0b2dldGhlciB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIGd1ZXN0
IGFkZHJlc3MgdG8gbWFwIHRoZW0gdG8uCj4gPiArICBUaGUgc2l6ZSBvZiBgcGh5c19hZGRyJyBh
bmQgYGd1ZXN0X2FkZHInIGlzIGRldGVybWluZWQgYnkKPiA+ICsgICNhZGRyZXNzLWNlbGxzLCB0
aGUgc2l6ZSBvZiBgc2l6ZScgaXMgZGV0ZXJtaW5lZCBieSAjc2l6ZS1jZWxscywgb2YKPiA+ICsg
IHRoZSBwYXJ0aWFsIGRldmljZSB0cmVlLgo+ID4gKyAgVGhlIG1lbW9yeSB3aWxsIGJlIG1hcHBl
ZCBhcyBkZXZpY2UgbWVtb3J5IGluIHRoZSBndWVzdCAoRGV2aWNlLW5HblJFKS4KPiA+ICsKPiA+
ICstIHhlbixwYXRoCj4gPiArCj4gPiArICBBIHN0cmluZyBwcm9wZXJ0eSByZXByZXNlbnRpbmcg
dGhlIHBhdGggaW4gdGhlIGhvc3QgZGV2aWNlIHRyZWUgdG8gdGhlCj4gPiArICBjb3JyZXNwb25k
aW5nIGRldmljZSBub2RlLgo+ID4gKwo+ID4gKy0geGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlv
bW11Cj4gPiArICBJZiBwcmVzZW50LCB4ZW4scGF0aCBpcyBvcHRpb25hbCAob3RoZXJ3aXNlIGl0
IGlzIGFsd2F5cyByZXF1aXJlZCkuCj4gCj4gSSBhbSBvayB3aXRoIHRoZSBpbXBsZW1lbnRhdGlv
biB0byBhbGxvdyB4ZW4scGF0aCB0byBiZSBvcHRpb25hbC4gQnV0IEkgdGhpbms6Cj4gCj4gICAx
KSBUaGlzIGlzIGEgZ29vZCBoYWJpdCB0byBoYXZlIHhlbixwYXRoIHByZXNlbnQgaW4gdGhlIERU
IGJlY2F1c2UgaXQgYWN0cwo+IGFzIGRvY3VtZW50YXRpb24gKHRoZSB1c2VyIGRpcmVjdGx5IGtu
b3cgdGhlIGFzc29jaWF0ZWQgbm9kZSBpbiB0aGUgaG9zdCBEVCkuCj4gCj4gICAyKSBJdCBpcyBl
YXNpZXIgdG8gcmVsYXggYSBiaW5kaW5nIGluIHRoZSBmdXR1cmUgb3ZlciB0aWdodGVuaW5nIGFn
YWluLgo+IAo+ICAgMykgVGhpcyBhdm9pZHMgdGhlIG11bHRpcGxlIGJlaGF2aW9yIGRlcGVuZGlu
ZyBvbiB0aGUgcHJvcGVydGllcyBwcmVzZW50Lgo+IAo+IFNvIEkgd291bGQgbXVjaCBwcmVmZXIg
aWYgdGhlIGRvY3VtZW50IGlzIG1vcmUgc3RyaWN0IHRoYW4gdGhlIGFjdHVhbAo+IGltcGxlbWVu
dGF0aW9uLgoKSSBhbSBPSyB3aXRoIHRoYXQuIEknbGwgcmVtb3ZlIHRoYXQgc2VudGVuY2UgIklm
IHByZXNlbnQsIHhlbixwYXRoIGlzCm9wdGlvbmFsIChvdGhlcndpc2UgaXQgaXMgYWx3YXlzIHJl
cXVpcmVkKS4iIGFuZCBhZGp1c3QgdGhlIGZvbGxvd2luZwpzZW50ZW5jZToKCi0geGVuLGZvcmNl
LWFzc2lnbi13aXRob3V0LWlvbW11CiAgSWYgeGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlvbW11
IGlzIHByZXNlbnQgWGVuIGNvbnRpbnVlcyBib290aW5nCiAgZXZlbiBvbiBJT01NVSBzZXR1cCBl
cnJvcnMgZm9yIHRoZSBkZXZpY2UgKGkuZS4gdGhlIGRldmljZSBpcyBub3QKICBwcm90ZWN0ZWQg
YnkgYW4gSU9NTVUpLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
