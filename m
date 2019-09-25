Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81099BE12A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD94s-0004oB-Ni; Wed, 25 Sep 2019 15:19:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iD94r-0004nz-RJ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:19:37 +0000
X-Inumbo-ID: e1eb2767-dfa7-11e9-9636-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id e1eb2767-dfa7-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:19:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55BDE1570;
 Wed, 25 Sep 2019 08:19:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27AC3F59C;
 Wed, 25 Sep 2019 08:19:35 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
 <1afcf0e569f68dbfe2c79668f17e1846a7dc3a1b.camel@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <96661f8e-31e4-8557-e29b-2350a74c586f@arm.com>
Date: Wed, 25 Sep 2019 16:19:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1afcf0e569f68dbfe2c79668f17e1846a7dc3a1b.camel@suse.com>
Content-Language: en-US
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
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtKdWVyZ2VuKQoKSGkgRGFyaW8sCgpPbiAxMS8wOS8yMDE5IDE0OjUzLCBEYXJpbyBGYWdnaW9s
aSB3cm90ZToKPiBPbiBGcmksIDIwMTktMDgtMjMgYXQgMTg6MTYgLTA3MDAsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToKPj4gT24gV2VkLCAyMSBBdWcgMjAxOSwgRGFyaW8gRmFnZ2lvbGkgd3Jv
dGU6Cj4+Pgo+Pj4gSGV5LCBTdGVmYW5vLCBKdWxpZW4sCj4+Pgo+Pj4gSGVyZSdzIGFub3RoZXIg
cGF0Y2guCj4+Pgo+Pj4gUmF0aGVyIHRoYW4gYSBkZWJ1ZyBwYXRjaCwgdGhpcyBpcyByYXRoZXIg
YW4gYWN0dWFsICJwcm9wb3NlZAo+Pj4gc29sdXRpb24iLgo+Pj4KPj4+IENhbiB5b3UgZ2l2ZSBp
dCBhIGdvPyBJZiBpdCB3b3JrcywgSSdsbCBzcGluIGl0IGFzIGEgcHJvcGVyIHBhdGNoLgo+Pgo+
PiBZZXMsIHRoaXMgc2VlbXMgdG8gc29sdmUgdGhlIHByb2JsZW0sIHRoYW5rIHlvdSEKPj4KPiBP
aywgdGhhbmtzIGFnYWluIGZvciB0ZXN0aW5nLCBhbmQgZ29vZCB0byBrbm93Lgo+IAo+IEknbSBz
dGlsbCBjYXRjaGluZyB1cCBhZnRlciB2YWNhdGlvbnMsIGFuZCBJJ20gdHJhdmVsaW5nIG5leHQg
d2Vlay4gQnV0Cj4gSSdsbCBzdWJtaXQgYSBwcm9wZXIgcGF0Y2ggYXMgc29vbiBhcyBJIGZpbmQg
dGltZS4KCkp1c3Qgd2FudGVkIHRvIGZvbGxvdy11cCBvbiB0aGlzLiBEbyB5b3UgaGF2ZSBhbiB1
cGRhdGUgZm9yIHRoZSBmaXg/CgpJIHdvdWxkIHJhdGhlciBub3Qgd2FudCB0byBzZWUgWGVuIDQu
MTMgcmVsZWFzZWQgd2l0aCB0aGlzLiBTbyBJIGhhdmUgQ0NlZCAKSnVlcmdlbiB0byBtYXJrIGl0
IGFzIGEgYmxvY2tlci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
