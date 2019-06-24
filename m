Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C519451AF4
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTzl-000257-HA; Mon, 24 Jun 2019 18:47:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfTzj-000250-Mn
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:47:11 +0000
X-Inumbo-ID: 7926d29d-96b0-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7926d29d-96b0-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 18:47:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99E2B20657;
 Mon, 24 Jun 2019 18:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561402030;
 bh=lwnWltBo4qMi2MyFKenN2GzYl/6HUQQNBTAsHMdevbQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=PPZL9oyJmpIXySo3dwNVqYM34lhC3B7o+GZY6fIF1am5HFu7Iw+5TXpPZDGng/oTq
 2zzkksXqQxHi52e+aZHgJMbsIebWK3d70yndnMM8495BoouusMP9nOG/II5ZdNMD72
 CVtVpyH1RBtArG/sxdbno1SVPfwzou3fyv+4ovC0=
Date: Mon, 24 Jun 2019 11:47:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
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
Cc: jgross@suse.com, wl@xen.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 roger.pau@citrix.com, chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KyB4ZW4tZGV2ZWwKCk9uIE1vbiwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBIaSBhbGwsCj4gCj4gSSBtaWdodCBoYXZlIGZvdW5kIGEgYnVnIHdpdGggUENJIHBhc3N0
aHJvdWdoIHRvIGEgTGludXggSFZNIGd1ZXN0IG9uCj4geDg2IHdpdGggWGVuIDQuMTIuIEl0IGlz
IG5vdCBlYXN5IGZvciBtZSB0byBnZXQgYWNjZXNzLCBhbmQgZXNwZWNpYWxseQo+IGNoYW5nZSBj
b21wb25lbnRzLCBvbiB0aGlzIHBhcnRpY3VsYXIgc3lzdGVtLCBhbmQgSSBkb24ndCBoYXZlIGFj
Y2VzcyB0bwo+IG90aGVyIHg4NiBib3hlcyBhdCB0aGUgbW9tZW50LCBzbyBhcG9sb2dpZXMgZm9y
IHRoZSBwYXJ0aWFsIGluZm9ybWF0aW9uCj4gcmVwb3J0LiBUaGUgc2V0dXAgaXMgYXMgZm9sbG93
Ogo+IAo+IC0gdHdvIFBDSSBkZXZpY2VzIGhhdmUgYmVlbiBhc3NpZ25lZCB0byBhIEhWTSBndWVz
dCwgZXZlcnl0aGluZyBpcyBmaW5lCj4gLSByZWJvb3QgdGhlIGd1ZXN0IGZyb20gaW5zaWRlLCBp
LmUuIGByZWJvb3QnIGluIExpbnV4Cj4gLSBhZnRlciB0aGUgcmVib290IGNvbXBsZXRlcywgb25s
eSBvbmUgZGV2aWNlIGlzIGFzc2lnbmVkCj4gCj4gQmVmb3JlIHRoZSByZWJvb3QsIEkgc2VlIGFs
bCB0aGUgYXBwcm9wcmlhdGUgeGVuc3RvcmUgZW50cmllcyBmb3IgYm90aAo+IGRldmljZXMuIEV2
ZXJ5dGhpbmcgaXMgZmluZS4gQWZ0ZXIgdGhlIHJlYm9vdCwgSSBjYW4gb25seSBzZWUgdGhlCj4g
eGVuc3RvcmUgZW50cmllcyBvZiBvbmUgZGV2aWNlLiBJdCBpcyBhcyBpZiB0aGUgb3RoZXIgZGV2
aWNlCj4gImRpc2FwcGVhcmVkIiB3aXRob3V0IHRocm93aW5nIGFueSBlcnJvcnMuCj4gCj4gSGF2
ZSB5b3Ugc2VlbiB0aGlzIGJlZm9yZT8gRG8geW91IGtub3cgaWYgaXQgaGFzIGJlZW4gZml4ZWQg
aW4gc3RhZ2luZz8KPiBJIG5vdGljZWQgdGhpcyBmaXggd2hpY2ggc2VlbXMgdG8gYmUgdmVyeSBy
ZWxldmFudDoKPiAKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTgtMTEvbXNnMDE2MTYuaHRtbAo+IAo+IGJ1dCBpdCBpcyBhbHJlYWR5IGlu
Y2x1ZGVkIGluIDQuMTIuCj4gCj4gVGhhbmsgeW91LAo+IAo+IFN0ZWZhbm8KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
