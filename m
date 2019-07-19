Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D26EB64
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 22:00:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoZ0k-0003YS-QX; Fri, 19 Jul 2019 19:57:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qxAZ=VQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hoZ0j-0003YN-H1
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 19:57:45 +0000
X-Inumbo-ID: 78b31068-aa5f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78b31068-aa5f-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 19:57:43 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2B9E2186A;
 Fri, 19 Jul 2019 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563566263;
 bh=rQUfnlOWPfoSuOWFD3ej1gTMyR4VLoATkR7jKxu+Kp4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=F1qg8nsVFRmCwCM3ZQRJypfFj+B/qL0n4A81QeLWn+qP/H0yUq0pqHKiollLMXRWy
 ISFlhvOcVnujPDeviTxJaBVYl2A6l63UCX2cS6Lu3gGnl6ujCXGbE6PBaoyuKR4ccS
 grgVmsawoppqG9+CX6x5LecF0Lw93KGXvKW0biKY=
Date: Fri, 19 Jul 2019 12:57:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906260818360.5851@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1907191256480.31177@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
 <20190626122157.GA2885@gao-cwp>
 <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
 <alpine.DEB.2.21.1906260818360.5851@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: Juergen Gross <jgross@suse.com>, wl@xen.org, andrew.cooper3@citrix.com,
 jbeulich@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 roger.pau@citrix.com, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFdlZCwg
MjYgSnVuIDIwMTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiBPbiAyNi4wNi4xOSAxNDoyMSwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA4OjE3OjUwQU0g
KzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gPiA+ID4gT24gMjQuMDYuMTkgMjA6NDcsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiA+ICsgeGVuLWRldmVsCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IE9uIE1vbiwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiA+ID4gPiA+ID4gSGkgYWxsLAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSSBtaWdodCBoYXZl
IGZvdW5kIGEgYnVnIHdpdGggUENJIHBhc3N0aHJvdWdoIHRvIGEgTGludXggSFZNIGd1ZXN0IG9u
Cj4gPiA+ID4gPiA+IHg4NiB3aXRoIFhlbiA0LjEyLiBJdCBpcyBub3QgZWFzeSBmb3IgbWUgdG8g
Z2V0IGFjY2VzcywgYW5kIGVzcGVjaWFsbHkKPiA+ID4gPiA+ID4gY2hhbmdlIGNvbXBvbmVudHMs
IG9uIHRoaXMgcGFydGljdWxhciBzeXN0ZW0sIGFuZCBJIGRvbid0IGhhdmUgYWNjZXNzCj4gPiA+
ID4gPiA+IHRvCj4gPiA+ID4gPiA+IG90aGVyIHg4NiBib3hlcyBhdCB0aGUgbW9tZW50LCBzbyBh
cG9sb2dpZXMgZm9yIHRoZSBwYXJ0aWFsCj4gPiA+ID4gPiA+IGluZm9ybWF0aW9uCj4gPiA+ID4g
PiA+IHJlcG9ydC4gVGhlIHNldHVwIGlzIGFzIGZvbGxvdzoKPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+IC0gdHdvIFBDSSBkZXZpY2VzIGhhdmUgYmVlbiBhc3NpZ25lZCB0byBhIEhWTSBndWVzdCwg
ZXZlcnl0aGluZyBpcwo+ID4gPiA+ID4gPiBmaW5lCj4gPiA+ID4gPiA+IC0gcmVib290IHRoZSBn
dWVzdCBmcm9tIGluc2lkZSwgaS5lLiBgcmVib290JyBpbiBMaW51eAo+ID4gPiA+ID4gPiAtIGFm
dGVyIHRoZSByZWJvb3QgY29tcGxldGVzLCBvbmx5IG9uZSBkZXZpY2UgaXMgYXNzaWduZWQKPiA+
ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEJlZm9yZSB0aGUgcmVib290LCBJIHNlZSBhbGwgdGhlIGFw
cHJvcHJpYXRlIHhlbnN0b3JlIGVudHJpZXMgZm9yIGJvdGgKPiA+ID4gPiA+ID4gZGV2aWNlcy4g
RXZlcnl0aGluZyBpcyBmaW5lLiBBZnRlciB0aGUgcmVib290LCBJIGNhbiBvbmx5IHNlZSB0aGUK
PiA+ID4gPiA+ID4geGVuc3RvcmUgZW50cmllcyBvZiBvbmUgZGV2aWNlLiBJdCBpcyBhcyBpZiB0
aGUgb3RoZXIgZGV2aWNlCj4gPiA+ID4gPiA+ICJkaXNhcHBlYXJlZCIgd2l0aG91dCB0aHJvd2lu
ZyBhbnkgZXJyb3JzLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gSGF2ZSB5b3Ugc2VlbiB0aGlz
IGJlZm9yZT8gRG8geW91IGtub3cgaWYgaXQgaGFzIGJlZW4gZml4ZWQgaW4KPiA+ID4gPiA+ID4g
c3RhZ2luZz8KPiA+ID4gPiA+ID4gSSBub3RpY2VkIHRoaXMgZml4IHdoaWNoIHNlZW1zIHRvIGJl
IHZlcnkgcmVsZXZhbnQ6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDE2MTYuaHRt
bAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gYnV0IGl0IGlzIGFscmVhZHkgaW5jbHVkZWQgaW4g
NC4xMi4KPiA+ID4gPiAKPiA+ID4gPiBTdGVmYW5vLCBjb3VsZCB5b3UgcGxlYXNlIHRyeSB0aGUg
YXR0YWNoZWQgcGF0Y2g/IEl0IGlzIG9ubHkgY29tcGlsZQo+ID4gPiA+IHRlc3RlZCBmb3Igbm93
Lgo+ID4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IEp1ZXJnZW4KPiA+ID4gCj4gPiA+ID4gRnJvbSBl
YTk1ZGNkZmM2MGE4OTVjYzQzYmFmMzRjOGUwZmIwODhlMTAwMDhkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ID4gPiA+IEZyb206IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+
ID4gPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiA+ID4gQ2M6IElhbiBK
YWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+ID4gPiA+IENjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ID4gPiA+IERhdGU6IFdlZCwgMjYgSnVuIDIwMTkgMDg6MTU6MjggKzAyMDAK
PiA+ID4gPiBTdWJqZWN0OiBbUEFUQ0hdIGxpYnhsOiBmaXggcGNpIGRldmljZSByZS1hc3NpZ25p
bmcgYWZ0ZXIgZG9tYWluIHJlYm9vdAo+ID4gPiA+IAo+ID4gPiA+IEFmdGVyIGEgcmVib290IG9m
IGEgZ3Vlc3Qgb25seSB0aGUgZmlyc3QgcGNpIGRldmljZSBjb25maWd1cmF0aW9uIHdpbGwKPiA+
ID4gPiBiZSByZXRyaWV2ZWQgZnJvbSBYZW5zdG9yZSByZXN1bHRpbmcgaW4gbG9zcyBvZiBhbnkg
ZnVydGhlciBhc3NpZ25lZAo+ID4gPiA+IHBhc3NlZCB0aHJvdWdoIHBjaSBkZXZpY2VzLgo+ID4g
PiA+IAo+ID4gPiA+IFRoZSBtYWluIHJlYXNvbiBpcyB0aGF0IGFsbCBwYXNzZWQgdGhyb3VnaCBw
Y2kgZGV2aWNlcyByZXNpZGUgdW5kZXIgYQo+ID4gPiA+IGNvbW1vbiByb290IGRldmljZSAiMCIg
aW4gWGVuc3RvcmUuIFNvIHdoZW4gdGhlIGRldmljZSBsaXN0IGlzIHJlYnVpbHQKPiA+ID4gPiBm
cm9tIFhlbnN0b3JlIGFmdGVyIGEgcmVib290IHRoZSBzdWItZGV2aWNlcyBiZWxvdyB0aGF0IHJv
b3QgZGV2aWNlCj4gPiA+ID4gbmVlZCB0byBiZSBzZWxlY3RlZCBpbnN0ZWFkIG9mIHVzaW5nIHRo
ZSByb290IGRldmljZSBudW1iZXIgYXMgYQo+ID4gPiA+IHNlbGVjdG9yLgo+ID4gPiA+IAo+ID4g
PiA+IEZpeCB0aGF0IGJ5IGFkZGluZyBhIG5ldyBtZW1iZXIgdG8gc3RydWN0IGxpYnhsX2Rldmlj
ZV90eXBlIHdoaWNoIHdoZW4KPiA+ID4gPiBzZXQgaXMgdXNlZCB0byBnZXQgdGhlIG51bWJlciBv
ZiBkZXZpY2VzLiBBZGQgc3VjaCBhIG1lbWJlciBmb3IgcGNpIHRvCj4gPiA+ID4gZ2V0IHRoZSBj
b3JyZWN0IG51bWJlciBvZiBwY2kgZGV2aWNlcyBpbnN0ZWFkIG9mIGltcGx5aW5nIGl0IGZyb20g
dGhlCj4gPiA+ID4gbnVtYmVyIG9mIHBjaSByb290IGRldmljZXMgKHdoaWNoIHdpbGwgYWx3YXlz
IGJlIDEpLgo+ID4gPiA+IAo+ID4gPiA+IFdoaWxlIGF0IGl0IGZpeCB0aGUgdHlwZSBvZiBsaWJ4
bF9fZGV2aWNlX3BjaV9mcm9tX3hzX2JlKCkgdG8gbWF0Y2gKPiA+ID4gPiB0aGUgb25lIG9mIHRo
ZSAuZnJvbV94ZW5zdG9yZSBtZW1iZXIgb2Ygc3RydWN0IGxpYnhsX2RldmljZV90eXBlLiBUaGlz
Cj4gPiA+ID4gZml4ZXMgYSBsYXRlbnQgYnVnIGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgb2Yg
YSBmdW5jdGlvbiByZXR1cm5pbmcKPiA+ID4gPiB2b2lkLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+ID4gCj4gPiA+IFRl
c3RlZC1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiA+IAo+ID4gVGhhbmtzIQo+
IAo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggYm90aCBvZiB5b3UhIEknbGwgbGV0IHlvdSBrbm93IGlm
IGl0IHdvcmtzLgoKVGVzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgpMZXQncyBnZXQgaXQgaW4gdGhlIHRyZWUsIHRoYW5rcyEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
