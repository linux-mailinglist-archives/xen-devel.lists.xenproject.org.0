Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4A1005FE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 13:57:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWgYH-0006B7-Bt; Mon, 18 Nov 2019 12:54:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWgYG-0006B2-0N
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 12:54:44 +0000
X-Inumbo-ID: 969eb41e-0a02-11ea-a2d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 969eb41e-0a02-11ea-a2d8-12813bfff9fa;
 Mon, 18 Nov 2019 12:54:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5CAEAD6C;
 Mon, 18 Nov 2019 12:54:41 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9bb16ee-88c3-ed78-e338-81dd08020fcf@suse.com>
Date: Mon, 18 Nov 2019 13:54:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxMjozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSA1
OjA2IFBNLCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+IEhlbGxvIEFsbCwKPj4KPj4gSSBjb21w
YXJlZCB0aGUgQ1BVSUQgbGlzdGluZ3MgZnJvbSBSeXplbiAyNzAwWCAoYXR0YWNoZWQgYXMgdGFy
Lnh6KSB0bwo+PiAzNzAwWCBhbmQgZm91bmQgb25seSB2ZXJ5IGZldyBkaWZmZXJlbmNlcy4gSSBh
ZGRlZAo+Pgo+PiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAw
eHh4eHh4eHh4eHh4IiBdCj4+Cj4+IHRvIHhsLmNmZyBhbmQgdGhlbiBXaW5kb3dzIHJ1bnMgZ3Jl
YXQgd2l0aCAxNiB2Q1BVcy4gQ2luZWJlbmNoIFIxNSBzY29yZQo+PiBpcyA+MjA1MCB3aGljaCBp
cyBtb3JlIG9yIGxlc3MgdGhlIGJhcmUgbWV0YWwgdmFsdWUuCj4gCj4gU28gdGhpcyBpcyBzZXR0
aW5nIHRob3NlIGJpdHMgdG8gMDEwMCwgb3IgNC4KCk9uZSBvZiB0aGUgbWFueSBwb3NzaWJsZSBw
cm9ibGVtcyB3aXRoIG91ciBpbmNyZW1lbnRpbmcgb2YgdGhpcyBmaWVsZApjb3VsZCBiZSB0aGF0
IHRoaXMgcmVzdWx0cyBpbiBhIHZhbHVlIHRoYXQgaW4gInJlc2VydmVkIiBhcyBwZXIgQU1EJ3MK
ZG9jdW1lbnRhdGlvbi4gQXQgbGVhc3QgZm9yIHNvbWUgb2YgdGhlIEZhbTE3IG1vZGVscyB0aGV5
IGRvY3VtZW50CmV4YWN0bHkgd2hpY2ggdmFsdWVzIGFyZSAibGVnYWwiLgoKVGhpcyBtYXkgdGhl
biAoZnVydGhlcikgZ2V0IGluIHRoZSB3YXkgb2YgT1NlcyB0cnlpbmcgdG8gZnVsbHkgc3BsaXQK
QVBJQyBJRHMgaW50byB0aGUgcGFydHMgY29ycmVsYXRpbmcgd2l0aCB0aGUgdG9wb2xvZ2ljYWwg
c3ViLXVuaXRzCih0aHJlYWQsIGNvcmUsIGNvcmUgY29tcGxleCwgZGllLCBzb2NrZXQpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
