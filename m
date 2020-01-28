Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11E14B3CB
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 12:54:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPMy-00038F-PF; Tue, 28 Jan 2020 11:49:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nX0u=3R=misterjones.org=maz@srs-us1.protection.inumbo.net>)
 id 1iwPME-00037s-MT
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 11:48:38 +0000
X-Inumbo-ID: 1dbefb56-41c4-11ea-868d-12813bfff9fa
Received: from disco-boy.misterjones.org (unknown [51.254.78.96])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1dbefb56-41c4-11ea-868d-12813bfff9fa;
 Tue, 28 Jan 2020 11:48:37 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@misterjones.org>)
 id 1iwPM8-001o2H-Sm; Tue, 28 Jan 2020 11:48:33 +0000
MIME-Version: 1.0
Date: Tue, 28 Jan 2020 11:48:32 +0000
From: Marc Zyngier <maz@misterjones.org>
To: Boqun Feng <boqun.feng@gmail.com>
In-Reply-To: <20200128055846.GA83200@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20191216001922.23008-1-boqun.feng@gmail.com>
 <ef6cb7ba-b448-cfa5-abbb-1d99d1396ce5@arm.com>
 <20200124063215.GA93938@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <4cdf2188-8909-4b90-ca78-92cef520b23d@arm.com>
 <20200128055846.GA83200@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
Message-ID: <58c453d060066ebaed24cd13e22de1c5@misterjones.org>
X-Sender: maz@misterjones.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: boqun.feng@gmail.com, vincenzo.frascino@arm.com,
 sashal@kernel.org, linux-hyperv@vger.kernel.org, sstabellini@kernel.org,
 sthemmin@microsoft.com, catalin.marinas@arm.com, haiyangz@microsoft.com,
 linux-kernel@vger.kernel.org, mikelley@microsoft.com,
 xen-devel@lists.xenproject.org, tglx@linutronix.de, kys@microsoft.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:49:23 +0000
Subject: Re: [Xen-devel] [RFC 0/6] vDSO support for Hyper-V guest on ARM64
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
 Michael Kelley <mikelley@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAyMC0wMS0yOCAwNTo1OCwgQm9xdW4gRmVuZyB3cm90ZToKPiBPbiBGcmksIEphbiAyNCwg
MjAyMCBhdCAxMDoyNDo0NEFNICswMDAwLCBWaW5jZW56byBGcmFzY2lubyB3cm90ZToKPj4gSGkg
Qm9xdW4gRmVuZywKPj4gCj4+IE9uIDI0LzAxLzIwMjAgMDY6MzIsIEJvcXVuIEZlbmcgd3JvdGU6
Cj4+ID4gSGkgVmluY2Vuem8sCj4+ID4KPj4gCj4+IFsuLi5dCj4+IAo+PiA+Pgo+PiA+PiBJIGhh
ZCBhIGxvb2sgdG8geW91ciBwYXRjaGVzIGFuZCBvdmVyYWxsLCBJIGNvdWxkIG5vdCB1bmRlcnN0
YW5kIHdoeSB3ZSBjYW4ndAo+PiA+PiB1c2UgdGhlIGFyY2hfdGltZXIgdG8gZG8gdGhlIHNhbWUg
dGhpbmdzIHlvdSBhcmUgZG9pbmcgd2l0aCB0aGUgb25lIHlvdQo+PiA+PiBpbnRyb2R1Y2VkIGlu
IHRoaXMgc2VyaWVzLiBXaGF0IGNvbmZ1c2VzIG1lIGlzIHRoYXQgS1ZNIHdvcmtzIGp1c3QgZmlu
ZSB3aXRoIHRoZQo+PiA+PiBhcmNoX3RpbWVyIHdoaWNoIHdhcyBkZXNpZ25lZCB3aXRoIHZpcnR1
YWxpemF0aW9uIGluIG1pbmQuIFdoeSBkbyB3ZSBuZWVkCj4+ID4+IGFub3RoZXIgb25lPyBDb3Vs
ZCB5b3UgcGxlYXNlIGV4cGxhaW4/Cj4+ID4+Cj4+ID4KPj4gPiBQbGVhc2Ugbm90ZSB0aGF0IHRo
ZSBndWVzdCBWTSBvbiBIeXBlci1WIGZvciBBUk02NCBkb2Vzbid0IHVzZQo+PiA+IGFyY2hfdGlt
ZXIgYXMgdGhlIGNsb2Nrc291cmNlLiBTZWU6Cj4+ID4KPj4gPiAJaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtYXJtLWtlcm5lbC8xNTcwMTI5MzU1LTE2MDA1LTctZ2l0LXNlbmQtZW1haWwt
bWlrZWxsZXlAbWljcm9zb2Z0LmNvbS8KPj4gPgo+PiA+ICwgIEFDUElfU0lHX0dURFQgaXMgdXNl
ZCBmb3Igc2V0dGluZyB1cCBIeXBlci1WIHN5bnRoZXRpYyBjbG9ja3NvdXJjZQo+PiA+IGFuZCBv
dGhlciBpbml0aWFsaXphdGlvbiB3b3JrLgo+PiA+Cj4+IAo+PiBJIGhhZCBhIGxvb2sgYSBsb29r
IGF0IGl0IGFuZCBteSBxdWVzdGlvbiBzdGFuZHMsIHdoeSBkbyB3ZSBuZWVkIAo+PiBhbm90aGVy
IHRpbWVyCj4+IG9uIGFybTY0Pwo+PiAKPiAKPiBTb3JyeSBmb3IgdGhlIGxhdGUgcmVzcG9uc2Uu
IEl0J3Mgd2Vla2VuZCBhbmQgQ2hpbmVzZSBOZXcgWWVhciwgc28gSSAKPiBnb3QKPiB0byBzcGVu
ZCBzb21lIHRpbWUgbWFraW5nIChhbmQgbW9zdGx5IGVhdGluZykgZHVtcGxpbmdzIDstKQoKQW5k
IHlvdSBoYXZlbid0IGJlZW4gc2hhcmluZyEgOy0pCgo+IEFmdGVyIGRpc2N1c3Npb24gd2l0aCBN
aWNoYWVsLCBoZXJlIGlzIHNvbWUgZXhwbGFuYXRpb24gd2h5IHdlIG5lZWQKPiBhbm90aGVyIHRp
bWVyOgo+IAo+IFRoZSBzeW50aGV0aWMgY2xvY2tzIHRoYXQgSHlwZXItViBwcmVzZW50cyBpbiBh
IGd1ZXN0IFZNIHdlcmUgCj4gb3JpZ2luYWxseQo+IGNyZWF0ZWQgZm9yIHRoZSB4ODYgYXJjaGl0
ZWN0dXJlLiBUaGV5IHByb3ZpZGUgYSBsZXZlbCBvZiBhYnN0cmFjdGlvbgo+IHRoYXQgc29sdmVz
IHByb2JsZW1zIGxpa2UgY29udGludWl0eSBhY3Jvc3MgbGl2ZSBtaWdyYXRpb25zIHdoZXJlIHRo
ZQo+IGhhcmR3YXJlIGNsb2NrIChpLmUuLCBUU0MgaW4gdGhlIGNhc2UgeDg2KSBmcmVxdWVuY3kg
bWF5IGJlIGRpZmZlcmVudAo+IGFjcm9zcyB0aGUgbWlncmF0aW9uLiBXaGVuIEh5cGVyLVYgd2Fz
IGJyb3VnaHQgdG8gQVJNNjQsIHRoaXMKPiBhYnN0cmFjdGlvbiB3YXMgbWFpbnRhaW5lZCB0byBw
cm92aWRlIGNvbnNpc3RlbmN5IGFjcm9zcyB0aGUgeDg2IGFuZAo+IEFSTTY0IGFyY2hpdGVjdHVy
ZXMsIGFuZCBmb3IgYm90aCBXaW5kb3dzIGFuZCBMaW51eCBndWVzdCBWTXMuICAgVGhlCj4gY29y
ZSBMaW51eCBjb2RlIGZvciB0aGUgSHlwZXItViBjbG9ja3MgKGluCj4gZHJpdmVycy9jbG9ja3Nv
dXJjZS9oeXBlcnZfdGltZXIuYykgaXMgYXJjaGl0ZWN0dXJlIG5ldXRyYWwgYW5kIHdvcmtzIAo+
IG9uCj4gYm90aCB4ODYgYW5kIEFSTTY0LiBBcyB5b3UgY2FuIHNlZSwgdGhpcyBwYXJ0IGlzIGRv
bmUgaW4gTWljaGFlbCdzCj4gcGF0Y2hzZXQuCj4gCj4gQXJndWFibHksIEh5cGVyLVYgZm9yIEFS
TTY0IHNob3VsZCBoYXZlIG9wdGltaXplZCBmb3IgY29uc2lzdGVuY3kgd2l0aAo+IHRoZSBBUk02
NCBjb21tdW5pdHkgcmF0aGVyIHdpdGggdGhlIGV4aXN0aW5nIHg4NiBpbXBsZW1lbnRhdGlvbiBh
bmQKPiBleGlzdGluZyBndWVzdCBjb2RlIGluIFdpbmRvd3MuIEJ1dCBhdCB0aGlzIHBvaW50LCBp
dCBpcyB3aGF0IGl0IGlzLAo+IGFuZCB0aGUgSHlwZXItViBjbG9ja3MgZG8gc29sdmUgcHJvYmxl
bXMgbGlrZSBtaWdyYXRpb24gdGhhdCBhcmVu4oCZdAo+IGFkZHJlc3NlZCBpbiBBUk02NCB1bnRp
bCB2OC40IG9mIHRoZSBhcmNoaXRlY3R1cmUgd2l0aCB0aGUgYWRkaXRpb24gb2YKPiB0aGUgY291
bnRlciBoYXJkd2FyZSBzY2FsaW5nIGZlYXR1cmUuIEh5cGVyLVYgZG9lc27igJl0IGN1cnJlbnRs
eSBtYXAgdGhlCj4gQVJNIGFyY2ggdGltZXIgaW50ZXJydXB0cyBpbnRvIGd1ZXN0IFZNcywgc28g
d2UgbmVlZCB0byB1c2UgdGhlIAo+IGV4aXN0aW5nCj4gSHlwZXItViBjbG9ja3MgYW5kIHRoZSBj
b21tb24gY29kZSB0aGF0IGFscmVhZHkgZXhpc3RzLgoKVGhlIG1pZ3JhdGlvbiB0aGluZyBpcyBh
IGJpdCBvZiBhIHJlZCBoZXJyaW5nLiBEbyB5b3UgcmVhbGx5IGFudGljaXBhdGUKVk0gbWlncmF0
aW9uIGFjcm9zcyBzeXN0ZW1zIHRoYXQgaGF2ZSB0aGVpciB0aW1lcnMgcnVubmluZyBhdCBkaWZm
ZXJlbnQKZnJlcXVlbmNpZXMgKnRvZGF5Kj8gQW5kIGV2ZW4gaWYgeW91IGRpZCwgdGhlcmUgYXJl
IHdheXMgdG8gZGVhbCB3aXRoIGl0CndpdGggdGhlIGFyY2ggdGltZXJzIChwYXRjaGVzIHRvIHRo
YXQgZWZmZWN0IHdlcmUgcG9zdGVkIG9uIHRoZSBsaXN0LCAKYW5kCnRoZXJlIHdhcyBldmVuIGEg
Yml0IG9mIGFuIEFSTSBzcGVjIGZvciBpdCkuCgpJIGZpbmQgaXQgb2RkIHRvIHRyeSBhbmQgbWFr
ZSBhcm02NCAianVzdCBhbm90aGVyIHg4NiIsIHdoaWxlIHRoZSAKYXJjaGl0ZWN0dXJlCmdpdmVz
IHlvdSBtb3N0IG9mIHdoYXQgeW91IG5lZWQgYWxyZWFkeS4gSSBndWVzcyBJJ20gdGFpbnRlZC4K
ClRoYW5rcywKCiAgICAgICAgIE0uCi0tIApXaG8geW91IGppdmluJyB3aXRoIHRoYXQgQ29zbWlr
IERlYnJpcz8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
