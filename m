Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE6E313D9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:30:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWlKl-0005sX-Vj; Fri, 31 May 2019 17:28:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IB02=T7=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hWlKk-0005sN-Em
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:28:50 +0000
X-Inumbo-ID: 8cf239dd-83c9-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8cf239dd-83c9-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 17:28:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D542A78;
 Fri, 31 May 2019 10:28:48 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C96B3F59C;
 Fri, 31 May 2019 10:28:47 -0700 (PDT)
Date: Fri, 31 May 2019 18:28:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190531182844.0cd43909@donnerap.cambridge.arm.com>
In-Reply-To: <959c8e20-705e-b654-d87c-916c2bdf29f4@arm.com>
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <ab8ec9ce-c602-fe5d-b76b-3ee096a8bf9f@gmail.com>
 <959c8e20-705e-b654-d87c-916c2bdf29f4@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Andrii Anisov <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAzMSBNYXkgMjAxOSAxODoxNjo1MiArMDEwMApKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPiB3cm90ZToKCj4gSGksCj4gCj4gT24gMzAvMDUvMjAxOSAxNzoxNCwgQW5k
cmlpIEFuaXNvdiB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAyOS4wNS4xOSAxODozMiwgSnVsaWVu
IEdyYWxsIHdyb3RlOiAgCj4gPj4+IEJUVywgZG8geW91IGhlYXIgYWJvdXQgcGxhbnMgZm9yIHRo
ZSBuZXcgdmdpYz8gU29tZSB0aW1lIGFnbyBpdCB3YXMgc2FpZCB0aGF0IAo+ID4+PiBuZXcgdmdp
YyBpbXBsZW1lbnRhdGlvbiBnb2luZyB0byByZXBsYWNlIHRoZSBvbGQgb25lLCBhbmQgb3B0aW1p
emluZyB0aGUgb2xkIAo+ID4+PiBpcyB3b3J0aGxlc3MuIEJ1dCBhcyBJIHNlZSwgdGhlcmUgYXJl
IG5vIHVwZGF0ZXMgaW50byB0aGF0IGFyZWEgeWV0LiAgCj4gPj4KPiA+PiBXZSBuZWVkIGhlbHAg
dG8gbWFrZSBpdCBoYXBwZW4uICAKPiA+IEknbSBub3Qgc3VyZSBJJ2xsIGhhdmUgc3BhcmUgdGlt
ZSBzb29uLCBidXQgd2hhdCBraW5kIG9mIGhlbHAgeW91IG5lZWQ/IERvIHlvdSAKPiA+IGhhdmUg
YSBUT0RPIGxpc3Q/ICAKPiAKPiAgRnJvbSB0aGUgdG9wIG9mIG15IGhlYWQgdGhlIG1ham9yIGJs
b2NrZXIgaXMgR0lDdjMgKCsgSVRTKSBzdXBwb3J0LiBJdCBtb3N0bHkgCj4gbmVlZCB0byBiZSBw
b3J0ZWQgZnJvbSBMaW51eC4KPiAKPiBUaGVyZSB3ZXJlIGFsc28gYSBjb3VwbGUgb2YgY29uY2Vy
biByZWdhcmRpbmcgdXNpbmcgb3JkZXJpbmcgdGhlIGxpc3Qgd2hpbGUgCj4gZm9sZGluZyAoY2Fu
J3QgcmVtZW1iZXIgaWYgdGhpcyB3YXMgYWRkcmVzc2VkIGluIExpbnV4KS4KPiAKPiBAQW5kcmUs
IEkgdGhvdWdodCB3ZSBjYXB0dXJlIHRoYXQgaW4gWGVuIFByb2plY3QgamlyYSBidXQgSSBjYW4n
dCBmaW5kIGl0LiBEaWQgCj4geW91IGtlZXAgYSBsaXN0PwoKSSB0aG91Z2h0IEppcmEgYXMgd2Vs
bCwgYnV0IGFwcGFyZW50bHkgd2UgbmV2ZXIgYWN0dWFsbHkgZGlkIHRoaXMgOi0oCgpTbyB5ZXMs
IEdJQ3YzIHN1cHBvcnQgaXMgdGhlIHNob3dzdG9wcGVyIGhlcmUsIHRoaXMgd291bGQgYWxsb3cg
dXMgdG8gbWFrZSB0aGUgbmV3IFZHSUMgdGhlIGRlZmF1bHQsIHNpbmNlIHdlIHdvdWxkIGhhdmUg
ZmVhdHVyZSBwYXJpdHkuCgpBbHNvIHdlIHdvdWxkIG5lZWQgdG8gY2hlY2sgdGhlIGdpdCBsb2cg
aW4gTGludXggZm9yIHRoZSBpbmRpdmlkdWFsIFZHSUMgZmlsZXMgdG8gcG9ydCBvdmVyIGZpeGVz
LCBpZiBhcHBsaWNhYmxlLiBEdWUgdG8gdGhlIGRpZmZlcmVudCBjb2Rpbmcgc3R5bGUgYW5kIHJl
bmFtZWQgaWRlbnRpZmllcnMsIGNvbXBhcmluZyB0aGUgZmlsZXMgZG9lcyBub3QgcmVhbGx5IGhl
bHAuCgpDaGVlcnMsCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
