Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6615C040
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 15:23:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2FMD-0006Ls-3k; Thu, 13 Feb 2020 14:20:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=06QY=4B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j2FMB-0006Lh-Sp
 for xen-devel@lists.xen.org; Thu, 13 Feb 2020 14:20:43 +0000
X-Inumbo-ID: 03d859b1-4e6c-11ea-b8ae-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03d859b1-4e6c-11ea-b8ae-12813bfff9fa;
 Thu, 13 Feb 2020 14:20:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E90BDAF93;
 Thu, 13 Feb 2020 14:20:41 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <26757593-2d17-a440-92b1-3f11a83a5104@citrix.com>
 <2a007257-1b8e-dda9-9228-24c2a8ea5200@suse.com>
 <2089842c-1ce5-9cbb-70c1-9b1d4055a64a@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5cc3ecf8-92af-b19e-0ed9-f277b104304e@suse.com>
Date: Thu, 13 Feb 2020 15:20:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2089842c-1ce5-9cbb-70c1-9b1d4055a64a@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Core Scheduling "lock == schedule_lock" assertion
 failure
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAgMTU6MTksIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gT24gMTIvMDIvMjAyMCAx
MjoyNCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMTIuMDIuMjAgMTI6MjEsIFNlcmdleSBE
eWFzbGkgd3JvdGU6Cj4+PiBIaSBKdWVyZ2VuLAo+Pj4KPj4+IFJlY2VudGx5IG91ciB0ZXN0aW5n
IGhhcyBmb3VuZCBhIGhvc3QgY3Jhc2ggd2hpY2ggaXMgcmVwcm9kdWNpYmxlLgo+Pj4gRG8geW91
IGhhdmUgYW55IGlkZWEgd2hhdCBtaWdodCBiZSBnb2luZyBvbiBoZXJlPwo+Pgo+PiBPaCwgbmlj
ZSBjYXRjaCEKPj4KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCBnZXRfY3B1X2lkbGVfdGltZSgpIGlz
IGNhbGxpbmcgdmNwdV9ydW5zdGF0ZV9nZXQoKQo+PiBmb3IgYW4gaWRsZSB2Y3B1LiBUaGlzIGlz
IGZyYWdpbGUgYXMgaWRsZSB2Y3B1cyBhcmUgc29tZXRpbWVzIGFzc2lnbmVkCj4+IHRlbXBvcmFy
aWx5IHRvIG5vcm1hbCBzY2hlZHVsaW5nIHVuaXRzLCB0aHVzIHRoZSBBU1NFUlQoKSBpbiB0aGUg
dW5sb2NrCj4+IGZ1bmN0aW9uIGlzIGZhaWxpbmcgd2hlbiB0aGUgYXNzaWdubWVudCBvZiB0aGUg
aWRsZSB2Y3B1IGlzIG1vZGlmaWVkCj4+IHVuZGVyIHRoZSBmZWV0IG9mIHZjcHVfcnVuc3RhdGVf
Z2V0KCkgYW5kIHRoZSB1bml0IGl0IGhhcyBiZWVuIGFzc2lnbmVkCj4+IHRvIGJlZm9yZSBpcyBh
bHJlYWR5IHNjaGVkdWxlZCBvbiBhbm90aGVyIGNwdS4KPj4KPj4gVGhlIHBhdGNoIGlzIHJhdGhl
ciBlYXN5LCB0aG91Z2guIENhbiB5b3UgdHJ5IGl0LCBwbGVhc2U/Cj4gCj4gVGhhbmsgeW91IGZv
ciB0aGUgcGF0Y2ghIEkgcHV0IGl0IGludG8gdGVzdGluZyB5ZXN0ZXJkYXkgYW5kIGl0IGxvb2tz
Cj4gZ29vZCBzbyBmYXIuIEl0IGFsc28gc2VlbXMgdGhhdCB0aGUgaXNzdWUgaXMgd2VsbCB1bmRl
cnN0b29kIGFuZCB0aGUKPiBwYXRjaCBzaG91bGQgZ28gaW50byB0aGUgbWFpbiB0cmVlLgoKSnVz
dCB3YW50ZWQgdG8gbWFrZSBzdXJlIGl0IHJlYWxseSBmaXhlcyB5b3VyIHByb2JsZW0uIDotKQoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
