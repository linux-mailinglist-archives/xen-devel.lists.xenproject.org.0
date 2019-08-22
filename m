Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91D9983B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 17:33:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0p30-0007CY-Sc; Thu, 22 Aug 2019 15:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0p2z-0007CO-Mv
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 15:30:45 +0000
X-Inumbo-ID: ce5c10b4-c4f1-11e9-b95f-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ce5c10b4-c4f1-11e9-b95f-bc764e2007e4;
 Thu, 22 Aug 2019 15:30:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B32BE337;
 Thu, 22 Aug 2019 08:30:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A8973F718;
 Thu, 22 Aug 2019 08:30:41 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <d5aca603-3b30-e3ea-1256-51de8ca40eaf@arm.com>
 <DB27F58E-DA27-4A5D-BE23-4CDB5D9736A2@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9a2a6d52-f247-ff18-0cce-593162e33755@arm.com>
Date: Thu, 22 Aug 2019 16:30:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DB27F58E-DA27-4A5D-BE23-4CDB5D9736A2@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiAyMi8wOC8yMDE5IDEyOjAyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3Jv
dGU6Cj4+IE9uIDIyLiBBdWcgMjAxOSwgYXQgMTI6MjksIEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20gCj4+IDxtYWlsdG86anVsaWVuLmdyYWxsQGFybS5jb20+PiB3cm90ZToKPj4g
T24gMjEvMDgvMjAxOSAwOToxOSwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4+IE1vcmUg
Z2VuZXJhbGx5LCBJIGFtIG5vdCB2ZXJ5IGNvbWZvcnRhYmxlIHRvIHNlZSBwYW5pYygpIGluIHRo
ZSBtaWRkbGUgb2YgdGhlIAo+PiBjb2RlLiBDb3VsZCB5b3UgZXhwbGFpbiB3aHkgcGFuaWMgaXMg
dGhlIGJlc3Qgc29sdXRpb24gb3ZlciByZXZlcnRpbmcgdGhlIHdvcms/Cj4+Cj4gCj4gWWVzLiBQ
cm9kdWN0aW9uLXJlYWR5IGhvdHBhdGNoZXMgbXVzdCBub3QgY29udGFpbiBpbmNvbnNpc3RlbnQg
aG9va3Mgb3IgCj4gZnVuY3Rpb25zLXRvLWJlLWFwcGxpZWQvcmV2ZXJ0ZWQuCj4gVGhlIGdvYWwg
aGVyZSBpcyB0byBkZXRlY3Qgc3VjaCBob3RwYXRjaGVzIGFuZCBmYWlsIGhhcmQgaW1tZWRpYXRl
bHkgCj4gaGlnaGxpZ2h0aW5nIHRoZSBmYWN0IHRoYXQgc3VjaCBob3RwYXRjaAo+IGlzIGJyb2tl
bi4KCkFzaWRlIHRoZSBsZW4gPSAwIHRoYXQgeW91IGFyZSBnb2luZyB0byBmaXguIEhvdyB3b3Vs
ZCB0aGlzIGNvbmRpdGlvbiBoYXBwZW4/IApBcmUgeW91IGdvaW5nIHRvIGFkZCBjb2RlIHRoYXQg
d2lsbCBwb3RlbnRpYWxseSB0cmlnZ2VyIHRoZSBwYW5pYz8KCj4gCj4gVGhlIGluY29uc2lzdGVu
dCBhcHBsaWNhdGlvbiBvZiBhIGhvdHBhdGNoIChzb21lIGZ1bmN0aW9uIGFwcGxpZWQsIHNvbWUg
cmV2ZXJ0ZWQgCj4gd2hpbGUgb3RoZXIgbGVmdCBiZWhpbmVkKSBsZWF2ZXMKPiB0aGUgc3lzdGVt
IGluIGEgdmVyeSBiYWQgc3RhdGUuIEkgdGhpbmsgdGhlIGJlc3Qgd2hhdCB3ZSBjb3VsZCBkbyBo
ZXJlIGlzIAo+IHBhbmljKCkgdG8gZW5hYmxlIHBvc3QtbW9ydGVtIGFuYWx5c2lzCj4gb2Ygd2hh
dCB3ZW50IHdyb25nIGFuZCBhdm9pZCBsZWFraW5nIHN1Y2ggc3lzdGVtIGludG8gcHJvZHVjdGlv
bi4KClRoYW5rIHlvdSBmb3IgdGhlIGV4cGxhbmF0aW9uIGhlcmUgKGFuZCBvbiBJUkMpLiBNYXkg
SSBhc2sgc29tZSBkb2N1bWVudGF0aW9uIApyZWdhcmRpbmcgdGhlIHBhbmljIGluIGF0IGxlYXN0
IGNvbW1pdCBtZXNzYWdlPyBJZGVhbGx5LCB0aGlzIHdvdWxkIGV4cGxhaW4gd2h5IAp0aGUgcGFu
aWMgdGhlIG1vc3Qgc2Vuc2libGUgc29sdXRpb24uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
