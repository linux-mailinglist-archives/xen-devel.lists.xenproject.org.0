Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DD9BA0D
	for <lists+xen-devel@lfdr.de>; Sat, 24 Aug 2019 03:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1Kfl-00078n-FB; Sat, 24 Aug 2019 01:16:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i1Kfk-00078h-8y
 for xen-devel@lists.xenproject.org; Sat, 24 Aug 2019 01:16:52 +0000
X-Inumbo-ID: da1f421a-c60c-11e9-adf0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da1f421a-c60c-11e9-adf0-12813bfff9fa;
 Sat, 24 Aug 2019 01:16:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5465D2173B;
 Sat, 24 Aug 2019 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566609411;
 bh=6/s6FgnxjD3yjHSyP30Nc9vuQypxAbFVXLcTJvcU2UY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DMrw+V15LyN9uBjZ77RL8XCJrtzt5WbakmyKa7eq3SznC++qhjzmpxfK/PX/VRzch
 2l/Pmks7bAOJ2VAiXldR8TiBs8fghqnOWSxs/PYKxfAMRWUKuYO3fyiC3nz1gx5RQa
 u9SZdmoR3YmYg3+FaLO8OLgOGuWAjGS7yUz9EQf4=
Date: Fri, 23 Aug 2019 18:16:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dario Faggioli <dfaggioli@suse.com>
In-Reply-To: <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
Message-ID: <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
 <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] dom0less + sched=null => broken in staging
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
Cc: "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMSBBdWcgMjAxOSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gV2VkLCAyMDE5
LTA4LTE0IGF0IDE5OjM1ICswMjAwLCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiA+IE9uIFdlZCwg
MjAxOS0wOC0xNCBhdCAwOToyNyAtMDcwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
PiBPbiBXZWQsIDE0IEF1ZyAyMDE5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiA+ID4gPiBPbiBU
dWUsIDIwMTktMDgtMTMgYXQgMTQ6MTQgLTA3MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiA+ID4gPiBOb3csIHdoaWxlIHN0YXJpbmcgYXQgdGhlIGNvZGUgb2YgdGhhdCBsb29wLCBJJ3Zl
IHNlZW4gdGhhdAo+ID4gPiA+IHBpY2tfY3B1KCkKPiA+ID4gPiBtYXkgbWVzcyB1cCB3aXRoIHRo
ZSBzY3JhdGNoIGNwdW1hc2sgZm9yIHRoZSBDUFUsIHdoaWNoIEkgZG9uJ3QKPiA+ID4gPiB0aGlu
awo+ID4gPiA+IGlzIGEgZ29vZCB0aGluZy4KPiA+ID4gPiAKPiA+ID4gPiBTbywgY2FuIHlvdSBh
bHNvIHRyeSB0aGlzIHRoaXJkIGRlYnVnLXBhdGNoPwo+ID4gPiAKPiA+ID4gWWVwLCBzZWUgYXR0
YWNoZWQKPiA+ID4gCj4gPiBPaywgdGhhbmtzIGFnYWluLiBTbywgY3B1bWFza19zY3JhdGNoKCkg
YmVpbmcgbWlzaGFuZGxlZCB3YXMgcGFydCBvZgo+ID4gdGhlIHByb2JsZW0sIGJ1dCBub3QgdGhl
IHJvb3QtY2F1c2UuCj4gPiAKPiA+IFdlbGwsIGl0IHdhcyB3b3J0aCBhIHNob3QuIDotUAo+ID4g
Cj4gPiBJIHRoaW5rIHdlIG5lZWQgdG8gZ2V0IHJpZCBvZiB0aGUgbG9vcCBpbiB3aGljaCB3ZSdy
ZSBzdHVjay4gCj4gPgo+IEhleSwgU3RlZmFubywgSnVsaWVuLAo+IAo+IEhlcmUncyBhbm90aGVy
IHBhdGNoLgo+IAo+IFJhdGhlciB0aGFuIGEgZGVidWcgcGF0Y2gsIHRoaXMgaXMgcmF0aGVyIGFu
IGFjdHVhbCAicHJvcG9zZWQKPiBzb2x1dGlvbiIuCj4gCj4gQ2FuIHlvdSBnaXZlIGl0IGEgZ28/
IElmIGl0IHdvcmtzLCBJJ2xsIHNwaW4gaXQgYXMgYSBwcm9wZXIgcGF0Y2guCgpZZXMsIHRoaXMg
c2VlbXMgdG8gc29sdmUgdGhlIHByb2JsZW0sIHRoYW5rIHlvdSEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
