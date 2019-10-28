Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E588E78B6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 19:46:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP9wR-0002SS-D1; Mon, 28 Oct 2019 18:40:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iP9wP-0002SN-Hd
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 18:40:33 +0000
X-Inumbo-ID: 6c2e839a-f9b2-11e9-8aca-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c2e839a-f9b2-11e9-8aca-bc764e2007e4;
 Mon, 28 Oct 2019 18:40:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8F90214B2;
 Mon, 28 Oct 2019 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572288032;
 bh=ElQFkRKWSf0nDLroKciIQWmFEto4Lgp2uXvv4YO7Cbw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ISVpnqjRJJtOvzuLoXG+D7YV1UxM8M1MmD6CnJ2830nL7bzfYj6otQf/QdUBKN1ZA
 ve7gmRGQbzWBC/k0iasQhh4QH+sBz/RbX5i+er8UBLT+VbB+G3GQfGDmUtE+eC7X2H
 ZrPR9zI5F0qAIDUpniLD5IjJT/qtuIhP3I4hD2GA=
Date: Mon, 28 Oct 2019 11:40:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Dario Faggioli <dfaggioli@suse.com>
In-Reply-To: <114c301a92c942208c63daa5046db4534b95da4a.camel@suse.com>
Message-ID: <alpine.DEB.2.21.1910281138370.29150@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908071119470.2451@sstabellini-ThinkPad-T480s>
 <f986544f59e1b2e9fddba5090fc3c706c38e1ad3.camel@suse.com>
 <alpine.DEB.2.21.1908091127080.7788@sstabellini-ThinkPad-T480s>
 <6bc0e21d79c4f02ad89c94fa732a32a57bdc8521.camel@suse.com>
 <alpine.DEB.2.21.1908131413200.30179@sstabellini-ThinkPad-T480s>
 <71cbab87f4929766bf4293419e50425ab62e822a.camel@suse.com>
 <alpine.DEB.2.21.1908140927100.8737@sstabellini-ThinkPad-T480s>
 <78072866796e1dedd9068e4298a13c58a30e74e7.camel@suse.com>
 <197c435e78f47b0deb376493911abdc0922863b4.camel@suse.com>
 <alpine.DEB.2.21.1908231722430.26226@sstabellini-ThinkPad-T480s>
 <114c301a92c942208c63daa5046db4534b95da4a.camel@suse.com>
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.de" <jgross@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOCBPY3QgMjAxOSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA4LTIzIGF0IDE4OjE2IC0wNzAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBPbiBX
ZWQsIDIxIEF1ZyAyMDE5LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPiA+ID4gSGV5LCBTdGVmYW5v
LCBKdWxpZW4sCj4gPiA+IAo+ID4gPiBIZXJlJ3MgYW5vdGhlciBwYXRjaC4KPiA+ID4gCj4gPiA+
IFJhdGhlciB0aGFuIGEgZGVidWcgcGF0Y2gsIHRoaXMgaXMgcmF0aGVyIGFuIGFjdHVhbCAicHJv
cG9zZWQKPiA+ID4gc29sdXRpb24iLgo+ID4gPiAKPiA+ID4gQ2FuIHlvdSBnaXZlIGl0IGEgZ28/
IElmIGl0IHdvcmtzLCBJJ2xsIHNwaW4gaXQgYXMgYSBwcm9wZXIgcGF0Y2guCj4gPiAKPiA+IFll
cywgdGhpcyBzZWVtcyB0byBzb2x2ZSB0aGUgcHJvYmxlbSwgdGhhbmsgeW91IQo+ID4gCj4gSGV5
LAo+IAo+IFNvcnJ5IHRoaXMgaXMgdGFraW5nIGEgbGl0dGxlIHdoaWxlLiBDYW4gYW55IG9mIHlv
dSBwbGVhc2UgdGVzdCB0aGUKPiBhdHRhY2hlZCwgb24gdG9wIG9mIGN1cnJlbnQgc3RhZ2luZz8K
PiAKPiBJbiBmYWN0LCBJIHJlYmFzZWQgdGhlIHBhdGNoIGluIG15IGxhc3QgZW1haWwgb24gdG9w
IG9mIHRoYXQsIGFuZCBJJ2QKPiBsaWtlIHRvIGtub3cgaWYgaXQgc3RpbGwgd29ya3MsIGV2ZW4g
bm93IHRoYXQgY29yZS1zY2hlZHVsaW5nIGlzIGluLgo+IAo+IElmIGl0IGRvZXMsIHRoZW4gYSBw
cm9wZXIgY2hhbmdlbG9nIGlzIHRoZSBvbmx5IHRoaW5nIGl0J2QgYmUgbWlzc2luZywKPiBhbmQg
SSdsbCBkbyBpdCBxdWlja2x5LCBJIHByb21pc2UgOi0pCgpUZXN0ZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
