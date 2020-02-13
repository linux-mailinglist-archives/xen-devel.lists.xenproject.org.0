Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E89A15CD40
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 22:30:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2M27-0000ZC-IZ; Thu, 13 Feb 2020 21:28:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LyC/=4B=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1j2M25-0000Z7-Qc
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 21:28:25 +0000
X-Inumbo-ID: c3e59c47-4ea7-11ea-b960-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e59c47-4ea7-11ea-b960-12813bfff9fa;
 Thu, 13 Feb 2020 21:28:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C7B220848;
 Thu, 13 Feb 2020 21:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581629304;
 bh=dQ9AcyKBRod6MZ1H5m/OvNlhH/Ws6YLXw96bRPjr31E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=vpaNfRU8DWDOHaOl6oRRO5kL60Q6zVM9OwqgTw1GBJXjZbdUf287sv81LQIDB4ApO
 LK9ob9EGRxnWVpL/q0ziq8OkftG3nXHnWQ3k6m+1spCaUqWKQ8MetjE668iOgTP3lV
 m/mut8hN6Ox5MGDEs/VaUe3Gc+15XZfjTDdpbIk8=
Date: Thu, 13 Feb 2020 13:28:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
In-Reply-To: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2002131327360.1018@sstabellini-ThinkPad-T480s>
References: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBGZWIgMjAyMCwgQW5kcmVpIENoZXJlY2hlc3Ugd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gSSB1c2VkIHRoZSBYZW4gZnJvbSBTdGVmYW5vJ3MgdHJlZSBhbmQgbWFkZSB0aGUgdXBkYXRl
cyB0byB0aGUgcGFydGlhbAo+IGR0YiB0aGF0IGhlIHNwZWNpZmllZC4KPiAKPiA+IFRoaXMgaXMg
bW9zdGx5IGxpa2VseSBiZWNhdXNlIExpbnV4IGlzIHRyeWluZyB0byBhY2Nlc3MgYSByZWdpb24K
PiA+IHRoYXQgaXMgbm90IG1hcHBlZCBpbiBzdGFnZS0yLiBZb3UgY2FuIHJlYnVpbGQgWGVuIHdp
dGggZGVidWcgZW5hYmxlZAo+ID4gYW5kIHlvdSBzaG91bGQgc2VlIGEgbWVzc2FnZSAidHJhcHMu
YzouLi4iIHRlbGxpbmcgdGhlIGV4YWN0IHBoeXNpY2FsCj4gPiBhZGRyZXNzIGFjY2Vzc2VkLgo+
ID4gCj4gPiBJbiBnZW5lcmFsIEkgd291bGQgcmVjb21tZW5kIHRvIGJ1aWxkIFhlbiB3aXRoIGRl
YnVnIGVuYWJsZWQgZHVyaW5nIGRldmVsb3BtZW50IGFzIHRoZSBoeXBlcnZpc29yIHdpbGwgZ2l2
ZSB5b3UgbW9yZSBpbmZvcm1hdGlvbiBvZiB3aGF0J3MgZ29pbmcgb24uCj4gPiAKPiA+IENoZWVy
cywKPiA+IAo+ID4gLS0KPiA+IEp1bGllbiBHcmFsbAo+IAo+IEkgZW5hYmxlZCBkZWJ1ZyBjb25m
aWcgYW5kIGdhdmUgaXQgYW5vdGhlciB0cnkuIEJ1dCBJJ20gc3RpbGwKPiBnZXR0aW5nIHRoZSBz
YW1lIHVuaGFuZGxlZCBmYXVsdCBlcnJvciwgdGhhdCBzZWVtcyB0byBtYXRjaCB3aGF0Cj4gSnVs
aWVuIGRlc2NyaWJlZCBhYm92ZS4KPiAKPiBJdCBpcyBpbmRlZWQgYSBzdGFnZS0yIGFib3J0IGNh
dXNlZCBieSB0aGUgZ3Vlc3QuCj4gCj4gSSBhdHRhY2hlZCB0aGUgRG9tVTEgY3Jhc2ggbG9nIGF0
IFswXS4KPiAKPiBbMF0gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vQlNIVkZRaUsKPiAKPiBIb3cgc2hv
dWxkIEkgcHJvY2VlZCBpbiB0aGlzIGNhc2U/CgpMb29raW5nIGF0IHRoZSBsb2dzLCB5b3UgY2Fu
IHNlZToKCihYRU4pIHRyYXBzLmM6MTk3MzpkMXYwIEhTUj0weDkzOWYwMDQ2IHBjPTB4ZmZmZmZm
ODAwODNhYzg2NCBndmE9MHhmZmZmZmY4MDA4MDBkMDQ4IGdwYT0weDAwMDAwMDQwMmYwMDQ4CgpT
byB0aGUgZ3Vlc3Qgd2FzIGFjY2Vzc2luZyBhZGRyZXNzIDB4NDAyZjAwNDgsIGhvd2V2ZXIsIHRo
ZSBNTUlPIGFkZHJlc3MKcmFuZ2Ugb2YgdGhlIGRldmljZSB0aGF0IHlvdSBhcmUgcmVtYXBwaW5n
IChsb29raW5nIGF0Cmh0dHBzOi8vcGFzdGViaW4uY29tL2owTlM0eDVaKSBpcyAweDQwMDJmMDAw
LTB4NDAwMzAwMDAuCgpJIHNwb3R0ZWQgdGhlIG1pc3Rha2Ugbm93OiBsb29raW5nIGF0IHRoZSBw
YXJ0aWFsIERUQiBhZ2FpbiwgdGhlCmFkZHJlc3Mgb2YgdGhlIGRldmljZSBpczoKCiAgcmVnID0g
PDB4MCAweDQwMmYwMDAwIDB4MTAwMD47CgpidXQgdGhlIGFkZHJlc3MgdGhhdCB5b3UgYXJlIHJl
bWFwcGluZyBpczoKCiAgeGVuLHJlZyA9IDwweDAgMHg0MDAyZjAwMCAweDEwMDAgMHgwIDB4NDAw
MmYwMDA+OwoKVGhleSBhcmUgbm90IHRoZSBzYW1lISA6LSkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
