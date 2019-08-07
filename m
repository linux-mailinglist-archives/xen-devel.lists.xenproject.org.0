Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595F84B53
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 14:21:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvKtJ-0005ky-Ga; Wed, 07 Aug 2019 12:18:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvKtI-0005kr-7J
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 12:18:04 +0000
X-Inumbo-ID: 66539aec-b90d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 66539aec-b90d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 12:18:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0470AE42;
 Wed,  7 Aug 2019 12:18:00 +0000 (UTC)
To: "Woodhouse, David" <dwmw@amazon.co.uk>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <0aaa7b3b-fc94-d3fb-7afc-2f670511fea0@citrix.com>
 <48bf4b7991aa1bafb96dd30093e07593ce2b8d1f.camel@amazon.co.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfdcb185-07f1-c99a-b231-8ec1e3074ebb@suse.com>
Date: Wed, 7 Aug 2019 14:18:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <48bf4b7991aa1bafb96dd30093e07593ce2b8d1f.camel@amazon.co.uk>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, "tim@xen.org" <tim@xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNDowNCwgIFdvb2Rob3VzZSwgRGF2aWQgIHdyb3RlOgo+IE9uIFdlZCwg
MjAxOS0wOC0wNyBhdCAxMjo0MCArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDcv
MDgvMjAxOSAxMjoyMCwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+PiBBZGRpbmcgc3VwcG9ydCBm
b3IgRklGTyBldmVudCBjaGFubmVsIEFCSSB3YXMgZmlyc3QgaW50cm9kdWNlZCBpbiBYZW4gNC40
Cj4+PiAoc2VlIDg4OTEwMDYxZWM2KS4gTWFrZSB0aGlzIHN1cHBvcnQgdHVuYWJsZSwgc2luY2Ug
dGhlIGNob2ljZSBvZiB3aGljaAo+Pj4gZXZlbnQgY2hhbm5lbCBBQkkgaGFzIGltcGxpY2F0aW9u
cyBmb3IgaGliZXJuYXRpb24uIENvbnNpZGVyIHJlc3VtaW5nIGEKPj4+IHByZSBYZW4gNC40IGhp
YmVybmF0ZWQgTGludXggZ3Vlc3QuIFRoZSBndWVzdCBib290IGtlcm5lbCBkZWZhdWx0cyB0byBG
SUZPCj4+PiBBQkksIHdoZXJlYXMgdGhlIHJlc3VtZSBrZXJuZWwgYXNzdW1lcyAyTC4gVGhpcywg
aW4gdHVybiwgcmVzdWx0cyBpbiBYZW4KPj4+IGFuZCB0aGUgcmVzdW1lZCBrZXJuZWwgdGFsa2lu
ZyBwYXN0IGVhY2ggb3RoZXIgKGR1ZSB0byBkaWZmZXJlbnQgcHJvdG9jb2xzCj4+PiBGSUZPIHZz
IDJMKS4KPj4KPj4gSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdy4KPj4KPj4gV2UgaGF2ZSBhIExp
bnV4IGtlcm5lbCB3aGljaCBrbm93cyBhYm91dCBGSUZPLCB3aGljaCB3YXMgZmlyc3QgYm9vdGVk
IG9uCj4+IFhlbiA8IDQuNCwgc28gY29uZmlndXJlZCAyTCBtb2RlLgo+Pgo+PiBJdCBpcyB0aGVu
IHN1c3BlbmRlZCwgYW5kIHJlc3VtZWQgb24gYSBuZXdlciBYZW4gPj0gNC40LiAgVGhlIGd1ZXN0
IG5vdwo+PiBoYXMgYSBjaG9pY2UgYmV0d2VlbiAyTCBtb2RlLCBhbmQgRklGTyBtb2RlLgo+Pgo+
PiBXaGF0IGlzIHRoZSBwcm9ibGVtPwo+Pgo+PiBXaGVuIHJlc3VtaW5nLCB0aGUgZ3Vlc3QgaW4g
cXVlc3Rpb24gc2hvdWxkIGNvbnRpbnVlIHRvIHVzZSAyTCBtb2RlLAo+PiBiZWNhdXNlIHRoYXQg
aXMgd2hhdCBpdCB3YXMgdXNpbmcgcHJldmlvdXNseS4KPiAKPiBPbiByZXN1bWUsIHRoZSBndWVz
dCBmaXJzdCBib290cyBhIExpbnV4IGtlcm5lbCAodGhlICdib290JyBrZXJuZWwpLgo+IFRoYXQg
a2VybmVsIHRoZW4gbG9hZHMgdGhlIHByZXZpb3VzIHN0YXRlICh0aGUgJ3Jlc3VtZWQnIGtlcm5l
bCkgZnJvbQo+IGRpc2sgYW5kIHRoZW4gdHJhbnNmZXJzIGNvbnRyb2wgdG8gaXQuCj4gCj4gSSBi
ZWxpZXZlIHRoZSBwcm9ibGVtIG9jY3VycyB3aGVuIHRoZSBib290IGtlcm5lbCBzZWVzIGFuZCBl
bmFibGVzIEZJRk8KPiBtb2RlLCB0aGVuIHRyYW5zZmVycyBjb250cm9sIHRvIHRoZSByZXN1bWVk
IGtlcm5lbCB3aGljaCBpcyBleHBlY3RpbmcKPiAyTC4KPiAKPiBJIHdvbmRlciBpZiB0cmVhdGlu
ZyBpdCBtb3JlIGxpa2UgYSBrZXhlYyBhbmQgZG9pbmcgU0hVVERPV05fc29mdF9yZXNldAo+IGlu
IHRoZSBoYW5kb3ZlciBtaWdodCBiZSBhIHZpYWJsZSBsb25nLXRlcm0gYXBwcm9hY2ggKGFuZCBk
ZWFsIHdpdGgKPiBvdGhlciBLQVNMUi1yZWxhdGVkIHByb2JsZW1zKS4gTm90IHRoYXQgc29mdCBy
ZXNldCBjdXJyZW50bHkgcmVzZXRzCj4gdGhpcyBBRkFJQ1QgYXQgYSBxdWljayBnbGFuY2UsIGJ1
dCBtYXliZSBpdCBzaG91bGQ/CgpPaCwgZGVmaW5pdGVseSwgaWYgaXQgZG9lc24ndCBhbHJlYWR5
LiBTb2Z0LXJlc2V0IHNob3VsZCByZWFsbHkgZG8gd2hhdAppdHMgbmFtZSBzYXlzIGFuZCBwdXQg
c3RhdGUgYmFjayB0byB3aGF0IGl0IHdhcyBpbml0aWFsbHkuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
