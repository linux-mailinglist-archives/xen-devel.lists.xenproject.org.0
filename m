Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EE0A51D1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hkQ-0005Cm-UG; Mon, 02 Sep 2019 08:31:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3NRn=W5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1i4hkP-0005Ch-NA
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:31:37 +0000
X-Inumbo-ID: 12bd7578-cd5c-11e9-8980-bc764e2007e4
Received: from mail.crc.id.au (unknown [203.56.246.92])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12bd7578-cd5c-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 08:31:36 +0000 (UTC)
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id 4CD6020007F;
 Mon,  2 Sep 2019 18:31:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1567413091; bh=XZosXgCi6ps8n9EPFHhGOmRkVfUJhMexfXRL8fPk1kc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IZWuYfbW/D/jKbcaVuANkpJeONbb267FWaNZlDkolcd3Org5BUew+241OuVp8+erJ
 zIRt4U06akVR7C/hON1deOMv4EttDkEt/fmJbJJ7WEZ0HvVCvbbryj0+AMH5wUVs5i
 0JITFgQgHRPOcIL14HUSBNAwiv2iPiiBxSiBEgVk=
MIME-Version: 1.0
Date: Mon, 02 Sep 2019 18:31:31 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: Paul Durrant <Paul.Durrant@citrix.com>
In-Reply-To: <655d59e7e876a1f08637ffd52c26a6aa@crc.id.au>
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
 <1dfc79fa-acde-40af-704d-be3289fdd133@posteo.de>
 <71fad1413643be2df5f2291270b60448@crc.id.au>
 <cbbfaf3c5d4e12358c635054198bce17@crc.id.au>
 <869a473b1f7342c48f2198e46b6c8427@AMSPEX02CL03.citrite.net>
 <2d859d487c294b8d98749dccaf735c96@crc.id.au>
 <b3b0c2de1e364adea566eb961ba3d727@AMSPEX02CL03.citrite.net>
 <655d59e7e876a1f08637ffd52c26a6aa@crc.id.au>
User-Agent: Roundcube Webmail/1.4-rc1
Message-ID: <e1d0c2c4a2f88777f82eed559cc68554@crc.id.au>
X-Sender: netwiz@crc.id.au
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
 (and 3900X)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOS0wMiAxODoyNSwgU3RldmVuIEhhaWdoIHdyb3RlOgo+IE9uIDIwMTktMDktMDIg
MTg6MjAsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+PiBGcm9tOiBTdGV2ZW4gSGFpZ2ggPG5ldHdpekBjcmMuaWQuYXU+Cj4+PiBTZW50OiAwMiBT
ZXB0ZW1iZXIgMjAxOSAwOTowOQo+Pj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+Cj4+PiBDYzogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVvLmRlPjsgQW5kcmV3
IENvb3BlciAKPj4+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgeGVuLQo+Pj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKPj4+IFN1YmplY3Q6IFJlOiBXaW5kb3dzIEhWTSBubyBsb25n
ZXIgYm9vdHMgd2l0aCBBTUQgUnl6ZW4gMzcwMFggKGFuZCAKPj4+IDM5MDBYKQo+Pj4gCj4+PiBP
biAyMDE5LTA5LTAyIDE4OjA0LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+Pj4gPj4gRnVydGhlciB0byB0aGUgYWJvdmUsIEkgZGlkIHNvbWUg
ZXhwZXJpbWVudGF0aW9uLiBUaGUgZm9sbG93aW5nIGlzIGEKPj4+ID4+IGxpc3Qgb2YgYXR0ZW1w
dGVkIGJvb3QgY29uZmlndXJhdGlvbnMgYW5kIHRoZWlyIG91dGNvbWVzOgo+Pj4gPj4KPj4+ID4+
IHZpcmlkaWFuPTEKPj4+ID4+IHZjcHVzPTQKPj4+ID4+IFNUT1BDT0RFOiBIQUwgTUVNT1JZIEFM
TE9DQVRJT04KPj4+ID4+Cj4+PiA+PiB2aXJpZGlhbj0wCj4+PiA+PiB2Y3B1cz00Cj4+PiA+PiBT
VE9QQ09ERTogTVVMVElQUk9DRVNTT1JfQ09ORklHVVJBVElPTl9OT1RfU1VQUE9SVEVECj4+PiA+
Pgo+Pj4gPj4gdmlyaWRpYW49MAo+Pj4gPj4gdmNwdXM9MQo+Pj4gPj4gQm9vdCBPSyAtIGdldCB0
byBXaW5kb3dzIFNlcnZlciAyMDE2IGxvZ2luIGV0Ywo+Pj4gPj4KPj4+ID4KPj4+ID4gQW5kIHRv
IGNvbXBsZXRlIHRoZSBzZXQsIGhvdyBhYm91dCB2aXJpZGlhbj0xIHZjcHVzPTE/Cj4+PiAKPj4+
IEFueSB2Y3B1cyB2YWx1ZSB3aGVyZSB2aXJpZGlhbj0xIGlzIHVzZWQgY3JlYXRlcyBhIEhBTCBN
RU1PUlkgCj4+PiBBTExPQ0FUSU9OCj4+PiBzdG9wY29kZSB3aGVuIHRyeWluZyB0byBib290IFdp
bmRvd3MuCj4+IAo+PiBPaywgc28gSSBndWVzcyB0aGF0IGlzc3VlIGhpdHMgZmlyc3QgYW5kLCBv
bmx5IGlmIHlvdSBnZXQgYmV5b25kIHRoYXQKPj4gZG8geW91IGhpdCB0aGUgbXVsdGlwcm9jZXNz
b3IgcHJvYmxlbS4KPj4gCj4+IFRoZSB2aXJpZGlhbiBvcHRpb24gaXMgbm90IGFjdHVhbGx5IGEg
Ym9vbGVhbiBhbnkgbW9yZSAodGhhdAo+PiBpbnRlcnByZXRhdGlvbiBpcyBqdXN0IGZvciBjb21w
YXQpIHNvIGl0IHdvdWxkIGJlIGEgZ29vZCBkYXRhcG9pbnQgdG8KPj4ga25vdyB3aGljaCBvZiB0
aGUgZW5saWdodGVubWVudHMgY2F1c2VzIHRoZSBjaGFuZ2UgaW4gYmVoYXZpb3VyLiBDb3VsZAo+
PiB5b3UgdHJ5IHZpcmlkaWFuPVsnYmFzZSddIHRvIHNlZSBpZiB0aGF0J3Mgc3VmZmljaWVudCB0
byBjYXVzZSB0aGUKPj4gcHJvYmxlbT8gKEknbSBndWVzc2luZyBpdCBwcm9iYWJseSBpcyBidXQg
aXQgd291bGQgYmUgZ29vZCB0byBrbm93KS4KPiAKPiAKPiBIaSBQYXVsLAo+IAo+IEkgY2FuIGNv
bmZpcm0gdGhhdCB2aXJpZGlhbj1bJ2Jhc2UnXSBjcmFzaGVzIHdpdGggdGhlIHNhbWUgSEFMIE1F
TU9SWQo+IEFMTE9DQVRJT04gc3RvcGNvZGUgLSBldmVuIG9uIDEgdmNwdS4KCkFsc28sIGp1c3Qg
d29uZGVyaW5nLCB3ZSdyZSB1c2luZyA4LjIuMCBvZiB0aGUgV2luZG93cyBQViBkcml2ZXJzIG9u
IAp0aGlzIFZNLgoKRG9lcyB0aGlzIG1hdHRlcj8gSGFzIHRoZXJlIGJlZW4gYW55IGNoYW5nZXMg
dGhhdCB3b3VsZCBhZmZlY3QgdGhpcyBpbiAKOC4yLjEgb3IgOC4yLjI/CgotLSAKU3RldmVuIEhh
aWdoCgo/IG5ldHdpekBjcmMuaWQuYXUgICAgID8gaHR0cDovL3d3dy5jcmMuaWQuYXUKPyArNjEg
KDMpIDkwMDEgNjA5MCAgICA/IDA0MTIgOTM1IDg5NwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
