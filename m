Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E267520
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 20:36:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hm0L0-0005kh-NU; Fri, 12 Jul 2019 18:32:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vkxg=VJ=hy-research.com=hy-gsoc@srs-us1.protection.inumbo.net>)
 id 1hm0Ky-0005kc-MT
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 18:32:04 +0000
X-Inumbo-ID: 552f43fd-a4d3-11e9-8980-bc764e045a96
Received: from dragonslair2.panasol.com (unknown [66.218.47.232])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 552f43fd-a4d3-11e9-8980-bc764e045a96;
 Fri, 12 Jul 2019 18:31:59 +0000 (UTC)
Received: from acer0.localnet (IDENT:405@dragonslair.panasol.com [10.10.10.1])
 by dragonslair2.panasol.com (8.14.4/8.9.3) with ESMTP id
 x6CIVjG4028325; Fri, 12 Jul 2019 11:31:47 -0700
From: Hunyue Yau z <hy-gsoc@hy-research.com>
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Fri, 12 Jul 2019 11:32:03 -0700
Message-ID: <2537214.YZPW3Q6nNT@acer0>
User-Agent: KMail/4.14.2 (Linux/4.4.0-040400-generic; KDE/4.14.2; x86_64; ; )
In-Reply-To: <b49189f5-34a3-5846-41b3-a32d54868566@arm.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <3431405.GtiBnG5Jy9@acer0> <b49189f5-34a3-5846-41b3-a32d54868566@arm.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpZGF5LCBKdWx5IDEyLCAyMDE5IDE2OjEzOjMyIEp1bGllbiBHcmFsbCB3cm90ZToKPiBI
aSwKPiAKPiBPbiA3LzExLzE5IDc6MjkgUE0sIEh1bnl1ZSBZYXUgd3JvdGU6Cj4gPiBbVGhpcyBt
YWlsIGluY29ycG9yYXRlcyBjb21tZW50cyByYWlzZWQgb24gSVJDLiBJIGhhdmUgbWFkZSBzb21l
IG9mIHRoaXMKPiA+IG1IaSxvcmUgdmVyYm9zZSB0byBwcm92aWRlIGNvbnRleHQgdG8gcGVvcGxl
IHRoYXQgaGF2ZW4ndCBzZWVuIHRoZSBJUkMKPiA+IGNvbW1lbnRzLl0KPiBUaGFuayB5b3UgZm9y
IHRoZSBzdW1tYXJ5IQo+IAo+ID4gVGhpcyB3aWxsIGJlIGEgYnVuY2ggb2YgZmFjdHMgb24gdGhl
IGFtNS4gU29tZW9uZSBlbHNlIHdpbGwgaGF2ZSByZWxhdGUgaXQKPiA+IGJhY2sgdG8gWGVuLgo+
ID4gCj4gPiAxIC0gVGhlIFdVR2VuIGlzIGEgaGFyZHdhcmUgYmxvY2sgb24gdGhlIE1QVSBibG9j
ayB0aGF0IGNhbiB0dXJuCj4gPiBpbnRlcnJ1cHRzCj4gPiBpbnRvIHdha2UgdXAgZXZlbnRzIGlm
IHRoZSBNUFUgaXMgaW4gY2VydGFpbiBkZWVwZXIgc2xlZXAgc3RhdGVzLiBUaGlzCj4gPiBhcHBs
aWVzIG9ubHkgdG8gY2VydGFpbiBpbnRlcnJ1cHRzLiBXZSBjYW4gY29uZmlybSB0aGlzIGJ5IGxv
b2tpbmcgYXQgdGhlCj4gPiBEVCdzIHJlZ2lzdGVyIGFkZHJlc3MuIFBlciB0aGUgVFJNLCB0aGV5
IGFyZSByZWdpc3RlcnMgZm9yIHRoZSBNUFUncyBQUkNNCj4gPiAoUG93ZXIvUmVzZXQvQ2xvY2sg
TWFuYWdlbWVudCkuIEluIHNob3J0LCB0aGlzIGJsb2NrIG1ha2VzIGludGVycnVwdHMgYQo+ID4g
cG9zc2libGUgd2FrZSB1cCBzb3VyY2UuCj4gPiAKPiA+IDIgLSBFYXJsaWVyIGtlcm5lbHMgZGlk
IG5vdCBleHBvc2UgdGhhdCBIVyBibG9jay4gU2VlIHRoaXMgcGF0Y2ggdGhhdAo+ID4gaW50cm9k
dWNlZCB0aGUgV1VHZW4gLQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Nv
bW1pdC83MTM2ZDQ1N2YzNjVlY2M5M2RkZmZjZGQ0MmFiNDlhODQKPiA+IDczZjI2MGIgSSBzdXNw
ZWN0IGxvb2tpbmcgYXQgdGhlIGJlZm9yZSBwYXJ0IG9mIHRoZSBwYXRjaCBzaG91bGQgcHJvdmlk
ZQo+ID4gY2x1ZXMgb24gaG93IHRvIGhhbmRsZSB0aGUgV1VHZW4uCj4gPiAKPiA+IAo+ID4gMyAt
IFRoaXMgbWF5IGJlIHJlZHVuZGFudCBidXQgbW9yZSBkZWZpbml0aW9ucyAoaW4gdGhlIGh1bWFu
IHNlbnNlKSBoZXJlOgo+ID4gaHR0cHM6Ly93d3cubWptd2lyZWQubmV0L2tlcm5lbC9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXAKPiA+IHQtY29udHJvbGxlci90aSxv
bWFwNC13dWdlbi1tcHUKPiA+IAo+ID4gNCAtIEZvciB0aGUgVUFSVCBjYXNlLCBJIHN1c3BlY3Qg
dGhlIGZsb3cgRGVubmlzIHBvaW50ZWQgb3V0IGlzIGFib3V0Cj4gPiByaWdodC4gSG93ZXZlciwg
dGhhdCBtYXkgYmUgZGlmZmVyZW50IGRlcGVuZGluZyBvbiB0aGUgaW50ZXJydXB0IHNvdXJjZS4K
PiA+IAo+ID4gVW5rbm93bnMgZnJvbSBteSBwb2ludCBvZiB2aWV3IC0KPiA+IAo+ID4gYSAtIERv
ZXMgWGVuIHZpcnR1YWxpemUgcG93ZXIgbWFuYWdlbWVudD8gSWYgc28sIHRoaXMgbWF5IGhhdmUg
aGF2ZSBhbgo+ID4gaW1wYWN0LiBJIHdvdWxkIG5vdCByZWNvbW1lbmQgYWRkaW5nIFBNIHZpcnR1
YWxpemF0aW9uIGluIEdTb0MuIEl0IGlzCj4gPiB0dWdnaW5nIG9uIGEgdmVyeSBsb25nIHN0cmlu
Zy4KPiAKPiBYZW4gZG9lcyBub3QgdmlydHVhbGl6ZSBwb3dlciBtYW5hZ2VtZW50IGF0IHRoZSBt
b21lbnQuIEkgYWdyZWUgdGhhdAo+IHRoaXMgaXMgdG9vIGJpZyBmb3IgdGhlIHNjb3BlIG9mIHRo
ZSBHU29DLgo+IAo+ID4gYiAtIElmIFhlbiBkb2VzIG5vdCB2aXJ0dWFsaXplIHRoYXQsIHNvbWVv
bmUgbmVlZHMgdG8gZGVjaWRlIGhvdyBtdWNoIHRvCj4gPiBsZWF2ZSB0byB0aGUgZ3Vlc3MuCj4g
PiAKPiA+IGMgLSBJIHdvbmRlciBpZiB3ZSBjYW4gZG8gYSBoYWxmIHdheSBoYWNrIHdoZXJlIHRo
ZSBrZXJuZWwgc2V0cyB1cCB0aGUgUE0KPiA+IGJ1dCBYZW4gaG9va3MgdG8gZ2V0IHRoZSBpbnRl
cnJ1cHQuIFRoZSBIVyB3aWxsIGRvIGl0cyBQTSB0aGluZyBhbmQgWGVuCj4gPiBjYW4gcHJvY2Vz
cyB0aGUgaW50ZXJydXB0Lgo+IAo+IEhtbW0sIHRoZSBxdWVzdGlvbiBoZXJlIGlzIHdoZXRoZXIg
dGhlIFVBUlQgd291bGQgYmUgdXN1YWJsZSBiZWZvcmUgRG9tMAo+IGlzIHNldHRpbmcgdXAgdGhl
IFBNPyBJZiBub3QsIHRoZW4sIHdlIHdvdWxkIG5lZWQgdG8gZGVhbCB3aXRoIGl0IGluIFhlbi4K
PiAKPiA+IEd1ZXNzZXMvcG9zc2libGUgaGFja3MgLQo+ID4gLSBGb3IgdGhlIGludGVycnVwdHMg
d2UgY2FyZSBhYm91dCwgdGhlIGNyb3NzIGJhciBjYW4gcm91dGUgdGhpbmdzIHRvIHRoZQo+ID4g
TVBVIHVuY29uZGl0aW9uYWxseS4gVGhpcyB3b3VsZCBicmVhayB0aGUgb3RoZXIgSFcgYmxvY2tz
IGJ1dCBtb3N0IG9mCj4gPiB0aGVtIGFyZW4ndCBuZWVkZWQgZm9yIGJvb3QuCj4gCj4gU29ycnkg
Zm9yIG15IGlnbm9yYW5jZSwgd2hpY2ggSFcgYmxvY2tzIGFyZSB5b3UgdGFsa2luZyBhYm91dD8K
ClRoZSBIVyBibG9ja3MgSSBhbSByZWZlcnJpbmcgdG8gYXJlIHN0dWZmIGxpa2UgRVZFLCBJUFUs
IGFuZCBEU1AuIEluaXRpYWxseSwgd2UgCmNhbiBldmVuIGlnbm9yZSB0aGUgUFJVU1MuIFRoaXMg
c2hvdWxkIGxlYXZlIGp1c3Qgc2VuZGluZyBpbnRlcnJ1cHRzIHRvIHRoZSAKTVBVLiBBcyBJIHVu
ZGVyc3RhbmQgaXQsIHRoZXJlIGlzIG5vIGN1cnJlbnQgc3VwcG9ydCBmb3IgdGhvc2UgcmlnaHQg
bm93IAphbnl3YXlzLiBJIHRoaW5rIEVWRS9JUFUvRFNQIHJlcXVpcmUgYSB3b3JraW5nIGNtZW0g
ZHJpdmVyIHdoaWNoIGlzIG5vdCBmdWxseSAKdXBzdHJlYW1lZC4gQkJBSSBkb2VzIHVzZSB0aGVt
IGJ1dCB0aGF0IHJlcXVpcmVzIGEgc3BlY2lmaWMga2VybmVsLgoKUFJVU1Mgd291bGQgYmUgbmlj
ZSAoYWthIHRoZSBQUlUgc3R1ZmYpIGV2ZW50dWFsbHkgYXMgdGhlIGJpdHMgYXJlIHVwc3RyZWFt
IGJ1dCAKbm90IGNyaXRpY2FsIGZvciBub3cuCgo+IAo+IENoZWVycywKCi0tIApIdW55dWUgWWF1
Cmh0dHA6Ly93d3cuaHktcmVzZWFyY2guY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
