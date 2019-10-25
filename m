Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E111CE42E3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 07:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNs7E-0005kY-1N; Fri, 25 Oct 2019 05:26:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0Vyi=YS=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1iNs7C-0005kT-JN
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 05:26:22 +0000
X-Inumbo-ID: f6a453f6-f6e7-11e9-94b7-12813bfff9fa
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6a453f6-f6e7-11e9-94b7-12813bfff9fa;
 Fri, 25 Oct 2019 05:26:16 +0000 (UTC)
Received: from lamp.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:2840:5ef1:ad58:e57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 363312001B5;
 Fri, 25 Oct 2019 16:26:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1571981173; bh=8cPceLZ4knWZ3J4OLoz+1vTj6TpfwIm5rSX5wrTP9hs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TF+W5qbGdxrQVnViAKLb6P78gZx/nGbaD65I8GI2gTpfeccAdNIeg3E5CS6mQ1H+b
 ROmP4uPHuwvAJYJio1z7u/Yw8Lb5yPoB6daDp3W/GU4q6ryoCVGZtf7p+bb8LlnQZw
 6/okUP23CaOipFtpdyLwPXCWMdiee5LIKhlVHpek=
MIME-Version: 1.0
Date: Fri, 25 Oct 2019 16:26:10 +1100
From: Steven Haigh <netwiz@crc.id.au>
To: Paul Durrant <pdurrant@gmail.com>
In-Reply-To: <CACCGGhBUx6AHfF2wJkQ3=M2OVDuLgR+Q4WBLCJE3Rb7-r3fRRQ@mail.gmail.com>
References: <1571918276.2606.0@crc.id.au>
 <CACCGGhBUx6AHfF2wJkQ3=M2OVDuLgR+Q4WBLCJE3Rb7-r3fRRQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4-rc2
Message-ID: <0dcf51532bdcde284d42c90780f57c97@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCB0byBtYWtlIHRoaW5ncyBhbm5veWluZywgSSBhbHNvIGdldCB0aGUgZm9sbG93aW5nIG1l
c3NhZ2UgaW4gdGhlIApsb2dzIGZvciBjb3JyZWN0bHkgb3BlcmF0aW5nIExpbnV4IFBWSCBEb21V
J3M6CgooWEVOKSBBTUQtVmk6IElPX1BBR0VfRkFVTFQ6IGRvbWFpbiA9IDAsIGRldmljZSBpZCA9
IDB4MjYwMCwgZmF1bHQgCmFkZHJlc3MgPSAweGZmZmZmZmZkZjgwMDAwMDAsIGZsYWdzID0gMHg4
CgpBcyBzdWNoLCBJIHRoaW5rIHdlJ3JlIGJhY2sgdG8gemVybyBjbHVlcyBhdCB0aGUgbW9tZW50
IGFzIHRvIHdoYXQgaXMgCmdvaW5nIG9uLgoKU3VnZ2VzdGlvbnMgd2VsY29tZSA6KQoKT24gMjAx
OS0xMC0yNSAwMTo0NSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE5vdCBtdWNoIGNsdWUgaW4gdGhl
IGxvZ3MuIFRoZSBjcmFzaCBwYXJhbXMgYXJlIHdlaXJkIHRob3VnaC4uLgo+IGNlcnRhaW5seSBu
b3QgbWF0Y2hpbmcgdGhlIGRvYy4KPiAoaHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMv
d2luZG93cy1oYXJkd2FyZS9kcml2ZXJzL2RlYnVnZ2VyL2J1Zy1jaGVjay0weGFjLS1oYWwtbWVt
b3J5LWFsbG9jYXRpb24pCj4gYnV0IHRoZW4gYWdhaW4gdGhleSBhcmUgbm90IGFsd2F5cyB0byBi
ZSBiZWxpZXZlZC4KPiBUaGVyZSBhcmUgc29tZSBvZGQgbG9va2luZyBJT01NVSBmYXVsdHMgaW4g
dGhlcmUgdG9vLgo+IAo+ICBQYXVsCj4gCj4gT24gVGh1LCAyNCBPY3QgMjAxOSBhdCAxMzowMSwg
U3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1PiB3cm90ZToKPiAKPj4gSGkgYWxsLAo+PiAK
Pj4gSSd2ZSBtYW5hZ2VkIHRvIGdldCB0aGUgZ2l0IG1hc3RlciB2ZXJzaW9uIG9mIFhlbiBvbiB0
aGlzIGFmZmVjdGVkCj4+IHN5c3RlbSBhbmQgdHJpZXMgdG8gYm9vdCBhIFdpbmRvd3MgU2VydmVy
IDIwMTYgc3lzdGVtLiBJdCBjcmFzaGVzIGFzCj4+IAo+PiBwZXIgbm9ybWFsLgo+PiAKPj4gSSBt
YW5hZ2VkIHRvIGdldCB0aGVzZSBsb2dzLCBidXQgSSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgZWxz
ZSB0byBkbwo+PiB0bwo+PiBkZWJ1ZyB0aGlzIGlzc3VlIGZ1cnRoZXIuCj4+IAo+PiBTdWdnZXN0
aW9ucyB3ZWxjb21lLgo+PiAKPj4gVGhlIGJvb3QgbG9nIGluIC92YXIvbG9nL3hlbi8gc2hvd3M6
Cj4+IFdhaXRpbmcgZm9yIGRvbWFpbiBzb3RpLnZtIChkb21pZCA0KSB0byBkaWUgW3BpZCA5MTc0
XQo+PiBEb21haW4gNCBoYXMgc2h1dCBkb3duLCByZWFzb24gY29kZSAzIDB4Mwo+PiBBY3Rpb24g
Zm9yIHNodXRkb3duIHJlYXNvbiBjb2RlIDMgaXMgZGVzdHJveQo+PiBEb21haW4gNCBuZWVkcyB0
byBiZSBjbGVhbmVkIHVwOiBkZXN0cm95aW5nIHRoZSBkb21haW4KPj4gRG9uZS4gRXhpdGluZyBu
b3cKPj4gCj4+IEZvciBzb21lIHJlYXNvbiBJJ20gbm90IGdldHRpbmcgYW55IHNlcmlhbCBvdXRw
dXQgLSBzbyBJJ2xsIGhhdmUgdG8KPj4gdGFrZSBhIGxvb2sgYXQgdGhhdCB0b21vcnJvdyAtIGJ1
dCBpZiB5b3UgbmVlZCBhbnl0aGluZyBmdXJ0aGVyLAo+PiBwbGVhc2UKPj4gbGV0IG1lIGtub3cg
YW5kIEknbGwgc2VlIHdoYXQgSSBjYW4gdHVybiB1cC4KPj4gCj4+IFdpbmRvd3MgY29uZmlnIGZp
bGU6Cj4+IAo+PiB0eXBlID0gImh2bSIKPj4gbmFtZSA9ICIkdm1uYW1lLnZtIgo+PiB2aXJpZGlh
biA9IDEKPj4gI3ZpcmlkaWFuID0gWydiYXNlJ10KPj4gbWVtb3J5ID0gODE5Mgo+PiB2Y3B1cyA9
IDQKPj4gdmlmID0gWydicmlkZ2U9YnI1MSwgbWFjPTAwOjE2OjNFOjY0OkNDOkEwJ10KPj4gI2Rp
c2sgPSBbICcvZGV2L3ZnX2hvc3RpbmcvJHZtbmFtZS52bSxyYXcseHZkYSxydycsCj4+IAo+ICdm
aWxlOi9yb290L1NXX0RWRDlfTlRSTF9XaW5kb3dzX1N2cnNfMjAxNl9FbmdsaXNoXzJfU3RkX0RD
X0ZQUF9PRU1fWDIxLTIyNTY3LklTTyxoZGM6Y2Ryb20scicKPj4gCj4+IF0KPj4gZGlzayA9IFsg
Jy9kZXYvdmdfaG9zdGluZy8kdm1uYW1lLnZtLHJhdyxoZGEscncnIF0KPj4gYm9vdCA9ICdjZCcK
Pj4gdm5jID0gMgo+PiB2bmNsaXN0ZW4gPSAiMC4wLjAuMCIKPj4gI3ZuY3Bhc3N3ZCA9ICcnCj4+
IAo+PiAjIyBTZXQgdGhlIGNsb2NrIHRvIGxvY2FsdGltZSAtIG5vdCBVVEMuLi4KPj4gbG9jYWx0
aW1lID0gMQo+PiAKPj4gIyMgRml4IHRoZSBtb3VzZSBjdXJzb3IgZm9yIFZOQyB1c2FnZQo+PiB1
c2JkZXZpY2UgPSAndGFibGV0Jwo+PiAKPj4gIyMgTG93ZXIgQ1BVIHByaW8gdGhhdCBvdGhlciBW
TXMuLi4KPj4gY3B1X3dlaWdodCA9IDEyOAo+PiAKPj4gb25fcG93ZXJvZmYgPSAnZGVzdHJveScK
Pj4gb25fcmVib290ID0gJ2Rlc3Ryb3knCj4+IG9uX2NyYXNoID0gJ2Rlc3Ryb3knCj4+IAo+PiBT
dGV2ZW4gSGFpZ2gKPj4gCj4+IPCfk6cgbmV0d2l6QGNyYy5pZC5hdSAgICAg8J+SuyBodHRwczov
L3d3dy5jcmMuaWQuYXUKPj4g8J+TniArNjEzIDkwMDEgNjA5MCAgICAgICDwn5OxICs2MTQgMTI5
MyA1ODk3Cj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwo+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVsCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbAoKLS0gClN0ZXZlbiBIYWlnaAoKPyBuZXR3aXpAY3JjLmlkLmF1ICAgICA/IGh0dHA6Ly93
d3cuY3JjLmlkLmF1Cj8gKzYxICgzKSA5MDAxIDYwOTAgICAgPyAwNDEyIDkzNSA4OTcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
