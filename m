Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8620574E77
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:47:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqd6U-0003DI-EE; Thu, 25 Jul 2019 12:44:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rHZM=VW=savoirfairelinux.com=fredy.pulido@srs-us1.protection.inumbo.net>)
 id 1hqd6T-0003DD-88
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:44:13 +0000
X-Inumbo-ID: e636a952-aed9-11e9-b47c-6f0601b95176
Received: from mail.savoirfairelinux.com (unknown [208.88.110.44])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e636a952-aed9-11e9-b47c-6f0601b95176;
 Thu, 25 Jul 2019 12:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 4A1AD9C01B4;
 Thu, 25 Jul 2019 08:44:10 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CL-nFrL8qz27; Thu, 25 Jul 2019 08:44:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.savoirfairelinux.com (Postfix) with ESMTP id 88D8D9C0341;
 Thu, 25 Jul 2019 08:44:09 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id MvKCWd6tm8Go; Thu, 25 Jul 2019 08:44:09 -0400 (EDT)
Received: from thinkpad (unknown [192.168.51.254])
 by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 5E1209C01B4;
 Thu, 25 Jul 2019 08:44:09 -0400 (EDT)
Message-ID: <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
From: "Fredy P." <fredy.pulido@savoirfairelinux.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Thu, 25 Jul 2019 08:44:09 -0400
In-Reply-To: <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
Organization: Savoir-faire Linux
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTI0IGF0IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
OgoKPiA+ID4gV2hhdCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0aGVybWFsZCAob3IgdGhlIGRy
aXZlciBpbiBMaW51eCBpZgo+ID4gPiB0aGVyZSdzIG9uZSkgdXNlIHRvIGdldCB0aGUgdGVtcGVy
YXR1cmUgZGF0YT8KCkluIG91ciBpbml0aWFsIFBPQyB1c2luZyBYZW4gNC44Lnggd2Ugd2hlcmUg
dXNpbmcgTGludXggY29yZXRlbXAgZHJpdmVyCnJlYWRpbmcgYnkgZXhhbXBsZSAvY2xhc3Mvc3lz
L2h3bW9uL2h3bW9uMC90ZW1wM19pbnB1dCBidXQgaXQgZ290CmRlcHJlY2F0ZWQgYXQgY29tbWl0
IDcyZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0M2M2YzYKCk91ciBpZGVhbCBmaXgg
aXMgdG8gZ2V0IGJhY2sgdGhlIC9jbGFzcy9zeXMvaHdtb24vaHdtb24wIHRvIGZlZWQKdGhlcm1h
bGQgaW4gdGhlIHNhbWUgd2F5IHdlIGRpZCBpbiBvdXIgUE9DLiBXZSB1bmRlcnN0YW5kIHRoYXQg
anVzdApyZXZlcnRpbmcgdGhhdCBjb21taXQgaXMgbm90IHRoZSByaWdodCB3YXksIHRoZSBxdWVz
dGlvbiBpcyB3aGF0IGlzIHRoZQpyaWdodCB3YXk/Cgo+ID4gPiBJcyBpdCBleHBvc2VkIGluIGEg
bW1pbyByZWdpb24gc29tZXdoZXJlPyBPciBtYXliZSBleHBvc2VkIGFzIGEKPiA+ID4gcGNpCj4g
PiA+IGRldmljZT8KPiAKPiBZb3UgaGF2ZW4ndCBhbnN3ZXJlZCB0aGlzLCB3aGljaCBJIHRoaW5r
IGl0J3MgcXVpdGUgcmVsZXZhbnQgaW4gb3JkZXIKPiB0byBrbm93IGhvdyB0byBtb3ZlIGZvcndh
cmQuIEhvdyBpcyB0aGUgdGVtcGVyYXR1cmUgZGF0YSBleHBvc2VkIGJ5Cj4gdGhlIGhhcmR3YXJl
IHdpbGwgbGlrZWx5IGRldGVybWluZSBob3cgdG8gcmVhZCBpdCwgYW5kIHdoZXRoZXIgWGVuIG9y
Cj4gZG9tMCBzaG91bGQgYWNjZXNzIGl0LgoKSSdtIG5vdCBzdXJlIGlmIHRoaXMgaXMgdGhlIHJp
Z2h0IGFuc3dlciBmb3IgdGhhdCBxdWVzdGlvbiBidXQsIHdlIGFyZQp0YWxraW5nIGFib3V0IHRo
ZSBEVFMgKERpZ2l0YWwgVGhlcm1hbCBTZW5zb3IpIHByb3ZpZGVkIGJ5IHRoZSBJbnRlbApwcm9j
ZXNzb3JbMV0KCj4gSWYgc3VjaCBkYXRhIChvciBwYXJ0IG9mIGl0KSBjb21lcyBmcm9tIEFDUEkg
ZHluYW1pYyB0YWJsZXMgdGhlbiBpdAo+IG11c3QgYmUgZG9tMCB0aGUgb25lIHRoYXQgcmVhZHMg
aXQsIGlmIGl0IGlzIG90aGVyd2lzZSBleHBvc2VkIGFzIGEKPiBQQ0kgZGV2aWNlIG9yIG1heWJl
IGFzIGEgbW1pbyByZWdpb24gc29tZXdoZXJlIGl0IGNvdWxkIGJlIFhlbiB0aGUKPiBvbmUgdG8g
cmVhZCBzdWNoIGluZm9ybWF0aW9uLgoKSSdtIG5vdCBzdXJlIGlmIEknbGwgc2FpZCBzb21ldGhp
bmcgc3R1cGlkIGJ1dCBhZnRlciB0byBvdmVydmlldyBbMV0KYW5kIGNvbW1pdCA3MmUwMzg0NTBk
M2Q1ZGUxYTM5ZjBjZmEyZDJiMGY5YjNkNDNjNmM2IG15IGd1ZXNzIGlzIHdlCnJldHJpZXZlIERU
UyB2aWEgTW9kZWwgU3BlY2lmaWMgUmVnaXN0ZXIgKE1TUikgYW5kIGl0IGlzIHRoZSB4ODYvY3B1
aWQKbGVhZiAweDYuCgpJIHRoaW5rIGlzIGEga2luZCBvZiBncmF5IHpvbmUgYmVjYXVzZSBpcyB0
aGUgcHJvY2Vzc29yIGl0c2VsZgooc3VwcG9zZWQgdG8gYmUgaGFuZGxlZCBieSBYZW4pIGJ1dCBp
cyBhIGtpbmQgb2YgSS9PIChzdXBwb3NlZCB0byBiZQpkb20wKQoKPiA+ID4gSSB0aGluayBpdCBk
ZXBlbmRzIG9uIGhvdyB0aGlzIGRhdGEgaXMgZXhwb3NlZCBieSB0aGUgaGFyZHdhcmUuCj4gPiAK
PiA+IElzIGEgSW50ZWwoUikgQ29yZShUTSkgaTUtNTM1MFUgQ1BVIEAgMS44MEdIeiBwcm9jZXNz
b3IsIHdoZW4geW91Cj4gPiBzYXkKPiA+IHRoZSBoYXJkd2FyZSBpcyB0aGUgYm9hcmQgaXRzZWxm
PyBvciB0aGUgcHJvY2Vzc29yPwo+IAo+IFRoZSBtb2RlbCBpdHNlbGYgaXMgbm90IHRoYXQgcmVs
ZXZhbnQsIGJ1dCByYXRoZXIgaG93IGlzIHRoZQo+IHRlbXBlcmF0dXJlIGV4cG9zZWQgYnkgdGhl
IENQVSwgc2VlIG15IGNvbW1lbnQgYWJvdmUuCgpJIHRoaW5rIGNvdWxkIGJlIGJlY2F1c2UgdGhl
IERUUyBpcyBpbnNpZGUgdGhlIHByb2Nlc3NvciBpdHNlbGYgdG8gYmUKaG9uZXN0IEknbSBub3Qg
YSBzcGVjaWFsaXN0IGluIHRoZXJtYWwgc3lzdGVtcyBmb3IgcHJvY2Vzc29ycyBidXQgaXQKbG9v
a3MgSW50ZWwgaGF2ZSBnb29kIGRvY3VtZW50cyBhYm91dCB0aGUgc3ViamVjdCwgYnkgZXhhbXBs
ZSBbMl0KCj4gVGhhbmtzLCBSb2dlci4KClsxXSBQYWcgNjggCmh0dHBzOi8vd3d3LmludGVsLmNv
bS9jb250ZW50L2RhbS93d3cvcHVibGljL3VzL2VuL2RvY3VtZW50cy9kYXRhc2hlZXRzLzV0aC1n
ZW4tY29yZS1mYW1pbHktZGF0YXNoZWV0LXZvbC0xLnBkZgpbMl0gCmh0dHBzOi8vZGlnaXRhbGxp
YnJhcnkuaW50ZWwuY29tL2NvbnRlbnQvZGFtL2NjbC9wdWJsaWMvY3B1LW1vbml0b3JpbmctZHRz
LXBlY2ktcGFwZXIucGRmP3Rva2VuPWV5SmhiR2NpT2lKSVV6STFOaUlzSW5SNWNDSTZJa3BYVkNK
OS5leUpqYjI1MFpXNTBTV1FpT2lJMk1EQTBNakFpTENKbGJuUmxjbkJ5YVhObFNXUWlPaUl5TURn
dU9EZ3VNVEV3TGpRMklpd2lRVU5EVkY5T1RTSTZJaUlzSWtOT1JFRmZUa0pTSWpvaUlpd2lhV0Yw
SWpveE5UWTBNRFUxTmprd2ZRLlRCUGtTVE8xQ3RrT1oxVHF0YlZlNklsaks3aHI2aXVzMmlERGZq
X1NVRUkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
