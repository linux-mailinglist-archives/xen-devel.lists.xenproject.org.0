Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B558F11
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 02:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgesR-0005uR-1I; Fri, 28 Jun 2019 00:36:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hgesP-0005uL-Ah
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 00:36:29 +0000
X-Inumbo-ID: c4715dce-993c-11e9-9283-1b46372afbed
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4715dce-993c-11e9-9283-1b46372afbed;
 Fri, 28 Jun 2019 00:36:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0A9B208CB;
 Fri, 28 Jun 2019 00:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561682188;
 bh=HCz7npdkCU3pO4whmb315iDp2U7xFsdNzvDTyCBaL7I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FZuM+esXsCK0R5OgRV+8b1lW+kCSfN3wIgSWrXJngY48QOYsE87O34BhY5nuMGDOY
 R0969kzvsm/pwtVjkE5bXeOxSf5z5jiDlNR7bUq+SRuvhXmKIWUmkFYIj2VyhlHsfP
 DvbZDmolG0U1PI0thWgpaA3xbBf/uOL+hZD4X2hQ=
Date: Thu, 27 Jun 2019 17:36:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <12426eb9-1545-b1f7-a85a-55c9e04b8cc4@arm.com>
Message-ID: <alpine.DEB.2.21.1906271127490.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906261309000.5851@sstabellini-ThinkPad-T480s>
 <12426eb9-1545-b1f7-a85a-55c9e04b8cc4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 14/17] xen/arm64: head: Remove ID map as
 soon as it is not used
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8yNi8xOSA5OjI1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBN
b24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IFRoZSBJRCBtYXAgbWF5
IGNsYXNoIHdpdGggb3RoZXIgcGFydHMgb2YgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeSBsYXlvdXQu
Cj4gPiA+IEF0IHRoZSBtb21lbnQsIFhlbiBpcyBoYW5kbGluZyB0aGUgY2xhc2ggYnkgb25seSBj
cmVhdGluZyBhIG1hcHBpbmcgdG8KPiA+ID4gdGhlIHJ1bnRpbWUgdmlydHVhbCBhZGRyZXNzIGJl
Zm9yZSBlbmFibGluZyB0aGUgTU1VLgo+ID4gPiAKPiA+ID4gVGhlIHJlc3Qgb2YgdGhlIG1hcHBp
bmdzIChzdWNoIGFzIHRoZSBmaXhtYXApIHdpbGwgYmUgbWFwcGVkIGFmdGVyIHRoZQo+ID4gPiBN
TVUgaXMgZW5hYmxlZC4gSG93ZXZlciwgdGhlIGNvZGUgZG9pbmcgdGhlIG1hcHBpbmcgaXMgbm90
IHNhZmUgYXMgaXQKPiA+ID4gcmVwbGFjZSBtYXBwaW5nIHdpdGhvdXQgdXNpbmcgdGhlIEJyZWFr
LUJlZm9yZS1NYWtlIHNlcXVlbmNlLgo+ID4gPiAKPiA+ID4gQXMgdGhlIElEIG1hcCBjYW4gYmUg
YW55d2hlcmUgaW4gdGhlIG1lbW9yeSwgaXQgaXMgZWFzaWVyIHRvIHJlbW92ZSBhbGwKPiA+ID4g
dGhlIGVudHJpZXMgYWRkZWQgYXMgc29vbiBhcyB0aGUgSUQgbWFwIGlzIG5vdCB1c2VkIHJhdGhl
ciB0aGFuIGFkZGluZwo+ID4gPiB0aGUgQnJlYWstQmVmb3JlLU1ha2Ugc2VxdWVuY2UgZXZlcnl3
aGVyZS4KPiA+IAo+ID4gSSB0aGluayBpdCBpcyBhIGdvb2QgaWRlYSwgYnV0IEkgd291bGQgYXNr
IHlvdSB0byBtZW50aW9uIDE6MSBtYXAKPiA+IGluc3RlYWQgb2YgIklEIG1hcCIgaW4gY29tbWVu
dHMgYW5kIGNvbW1pdCBtZXNzYWdlcyBiZWNhdXNlIHRoYXQgaXMgdGhlCj4gPiB3b3JkaW5nIHdl
IHVzZWQgaW4gYWxsIGNvbW1lbnRzIHNvIGZhciAoc2VlIHRoZSBvbmUgaW4KPiA+IGNyZWF0ZV9w
YWdlX3RhYmxlcyBhbmQgbW0uYykuIEl0IGlzIGVhc2llciB0byBncmVwIGFuZCByZWZlciB0byBp
ZiB3ZQo+ID4gdXNlIHRoZSBzYW1lIG5vbWVuY2xhdHVyZS4gTm90ZSB0aGF0IEkgZG9uJ3QgY2Fy
ZSBhYm91dCB3aGljaAo+ID4gbm9tZW5jbGF0dXJlIHdlIGRlY2lkZSB0byB1c2UsIEkgYW0gb25s
eSBhc2tpbmcgZm9yIGNvbnNpc3RlbmN5Lgo+ID4gT3RoZXJ3aXNlLCBpdCB3b3VsZCBhbHNvIHdv
cmsgaWYgeW91IHNheSBpdCBib3RoIHdheSBhdCBsZWFzdCBvbmNlOgo+ID4gCj4gPiAgIFRoZSBJ
RCBtYXAgKDE6MSBtYXApIG1heSBjbGFzaCBbLi4uXQo+IAo+IEkgd291bGQgcmF0aGVyIGRyb3Ag
dGhlIHdvcmRpbmcgMToxIGFzIHRoaXMgaXMgY29uZnVzaW5nLiBJdCBpcyBhbHNvIG5vdAo+IHRy
aXZpYWwgdG8gZmluZCBhbnl0aGluZyBvbiBnb29nbGUgdHlwaW5nICIxOjEiLgoKVGhhdCdzIGZp
bmUgdG9vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
