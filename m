Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39D488F3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:30:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuUS-0005TP-Ck; Mon, 17 Jun 2019 16:28:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcuUR-0005TK-E0
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:28:15 +0000
X-Inumbo-ID: e6f8fbac-911c-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6f8fbac-911c-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:28:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A0C42084D;
 Mon, 17 Jun 2019 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560788892;
 bh=p/iZBGfyUcEC3ZJpZLiu1VX3wSWrBnbW2NIADmvKk+8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TSwC33mVPF0bp82sYl45oEVUuROCP22hDHn1fItKcozy2SGdLGKhunw/Gb7YAfHOE
 Ss8u5+khUeLVeOoAOjQqngTkoTDtDmK/Gln5VaMK4cktr/poqH0tnEFhr0zjUJz4px
 9uLqlhZOEj14V9xkJaWCbKYCbkJ6quidIwLmqS9k=
Date: Mon, 17 Jun 2019 09:28:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
Message-ID: <alpine.DEB.2.21.1906170926150.2072@sstabellini-ThinkPad-T480s>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-3-volodymyr_babchuk@epam.com>
 <686a7564-5c8b-937f-1e14-671e7b08a18b@arm.com>
 <1a81a53d-91e3-37e0-79df-8f59a0dc6a2a@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 02/10] xen/arm: optee: add OP-TEE header
 files
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "lars.kurth@citrix.com" <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TG9va2luZyBhdCBodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL2xpY2Vuc2UtbGlzdC5lbi5o
dG1sIGFuZCBhbHNvCmxvb2tpbmcgYXQgdGhlIHVzYWdlIGluIHRoZSBMaW51eCBrZXJuZWwsIEkg
YW0gcHJldHR5IHN1cmUgaXQgaXMKY29tcGF0aWJsZS4gSG93ZXZlciwgZ2l2ZW4gdGhhdCB0aGUg
WGVuIGh5cGVydmlzb3IgYXMgYSB3aG9sZSBpcyBHUEx2MiwKSSB0aGluayBpdCB3b3VsZCBiZSBt
b3JlIHByZWNpc2UgdG8gc2F5OgoKU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9u
bHkgT1IgQlNELTItQ2xhdXNlKQoKCk9uIE1vbiwgMTcgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3
cm90ZToKPiBobW0sIEkgZm9yZ290IHRvIENDIGxhcnMuIFNvcnJ5IGZvciB0aGF0Lgo+IAo+IENo
ZWVycywKPiAKPiBPbiAxNS8wNi8yMDE5IDE5OjM5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiAo
KyBMYXJzKQo+ID4gCj4gPiBIaSwKPiA+IAo+ID4gT24gNi8xMS8xOSA3OjQ2IFBNLCBWb2xvZHlt
eXIgQmFiY2h1ayB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0v
dGVlL29wdGVlX21zZy5oCj4gPiA+IGIveGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvb3B0ZWVfbXNn
LmgKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMC4uZmU3
NDNkYmRlMwo+ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vdGVlL29wdGVlX21zZy5oCj4gPiA+IEBAIC0wLDAgKzEsMzEwIEBACj4gPiA+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlICovCj4gPiAKPiA+IEhtbW0sIHNvcnJ5
IEkgaGF2ZW4ndCBub3RpY2VkIGl0IHVudGlsIG5vdyAoU0RQWCBpcyBtb3JlIGV4cGxpY2l0IHRo
YXQgdGhlCj4gPiBmdWxsLWJsb3duIGxpY2Vuc2UpLiBJIHN1c3BlY3QgdGhpcyBpcyBmaW5lIHRv
IGhhdmUgQlNELTIgQ2xhdXNlIGxpY2Vuc2UgaW4KPiA+IFhlbiBidXQgSSB3YW50IHRvIGNvbmZp
cm1hdGlvbiBmcm9tIHNvbWVvbmUga25vd2luZyBtb3JlIHRoYW4gbWUgYWJvdXQKPiA+IGxpY2Vu
c2UgY29tcGF0aWJpbGl0eS4gTGFycz8KPiA+IAo+ID4gSWYgdGhpcyBpcyBmaW5lLCB0aGVuIEkg
d291bGQgbGlrZSB0byBhZGQgYSB3b3JkIGluIHRoZSBjb21taXQgbWVzc2FnZSAoSSBhbQo+ID4g
aGFwcHkgdG8gZG8gdGhhdCBvbiBjb21taXQpLgo+ID4gCj4gPiBDaGVlcnMsCj4gPiAKPiAKPiAt
LSAKPiBKdWxpZW4gR3JhbGwKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
