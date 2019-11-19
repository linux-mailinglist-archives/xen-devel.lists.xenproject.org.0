Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690631029B0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 17:47:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX6bv-0004Mu-8o; Tue, 19 Nov 2019 16:44:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX6bt-0004Mp-Ea
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 16:44:13 +0000
X-Inumbo-ID: d06960a6-0aeb-11ea-a2ff-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d06960a6-0aeb-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 16:44:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 497BCAC53;
 Tue, 19 Nov 2019 16:44:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
 <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
 <0776abb4-fbf7-d3e7-67ea-c1516fa3894c@suse.com>
 <b5c38b70-b8c9-8435-2dd8-3632a77170c3@citrix.com>
 <54628e08-fa04-ed20-9255-9de58b219184@suse.com>
 <646c50cb-a54d-694a-b081-adc50e3700ca@citrix.com>
 <629f8acb-4777-2fcb-a903-e53b735a6c48@suse.com>
 <2de7bf63-1f9f-3e4c-e2ed-c757bf98ad53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6aca5fc8-b769-0e2f-2fb6-f5f52afc8f8e@suse.com>
Date: Tue, 19 Nov 2019 17:44:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2de7bf63-1f9f-3e4c-e2ed-c757bf98ad53@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxNjoxNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8xMS8yMDE5
IDEzOjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMTEuMjAxOSAxNDoyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEkgYW0gbm90IGNvbnZpbmNlZCB0aGUgYmVoYXZpb3VyIGlzIHdv
cnRoIGNoYW5naW5nLCBhbmQgSSBkb24ndCBoYXZlCj4+PiB0aW1lIGZvciB0aGlzIHNjb3BlIGNy
ZWVwLgo+PiBUaGVyZSdzIG5vIHNjb3BlIGNyZWVwIGhlcmUgYXQgYWxsLgo+IAo+IFllcyAtIGl0
IHJlYWxseSBpcyBzY29wZSBjcmVlcC4KPiAKPiBUaGlzIHBhdGNoIGRvZXMgbm90IGNoYW5nZSB0
aGUgYmVoYXZpb3VyIG9mIFhlbiBpbiB0aGUgY2FzZSBvZiBwb29yCj4gdmlydHVhbGlzYXRpb24g
b2YgdGhlIGJpdC7CoCBYZW4gd2lsbCBzdGlsbCBjcmFzaCBlaXRoZXIgd2F5LgoKU28gSSBoYXZl
IHRvIGFwb2xvZ2l6ZS4gV2hhdCBJIGRpZG4ndCBub3RpY2UgaXMKCglpZiAoZGlzYWJsZSAmIE1T
Ul9JQTMyX01JU0NfRU5BQkxFX1hEX0RJU0FCTEUpIHsKCQl3cml0ZV9lZmVyKHJlYWRfZWZlcigp
IHwgRUZFUl9OWCk7CgkJcHJpbnRrKEtFUk5fSU5GTwoJCSAgICAgICAicmUtZW5hYmxlZCBOWCAo
RXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uXG4iKTsKCX0KCmluIGVhcmx5X2luaXRfaW50ZWwo
KS4gSSBzaW1wbHkgZGlkbid0IGV4cGVjdCB3ZSdkIGFscmVhZHkgaGF2ZQpzdWNoIGEgYmxpbmQg
RUZFUiB3cml0ZS4gSSB0aGVyZWZvcmUgYWdyZWUgbm93IHRoYXQgdGhpcyBpcyBhCnByZS1leGlz
dGluZyBidWcgdGhhdCB5b3UgZG9uJ3QgbWFrZSBhbnkgd29yc2UuCgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKPiBJIGhhdmUgZXhwbGFpbmVkLCByZXBlYXRl
ZGx5IG5vdywgd2h5IEkgYW0gbm90IGluY2xpbmVkIHRvIGZpeCB0aGlzLiBJdAo+IGlzIGEgYnVn
IHdoaWNoIGRvZXNuJ3QgZXhpc3QgaW4gcHJhY3RpY2UuCgpJIHNob3VsZCBoYXZlIGJlZW4gbG9v
a2luZyBtb3JlIGNsb3NlbHk7IHRoZSBsYWNrIG9mIHN1ZmZpY2llbnQKY29udGV4dCBkaWQgbWlz
Z3VpZGUgbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
