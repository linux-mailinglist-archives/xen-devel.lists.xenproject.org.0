Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676C108E28
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 13:47:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDkH-00086x-1F; Mon, 25 Nov 2019 12:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZDkF-00086s-Iv
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:45:35 +0000
X-Inumbo-ID: 77bfcc2a-0f81-11ea-a38f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77bfcc2a-0f81-11ea-a38f-12813bfff9fa;
 Mon, 25 Nov 2019 12:45:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D04DDB35B;
 Mon, 25 Nov 2019 12:45:31 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20191125123923.2000028-1-george.dunlap@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ad9b9225-0381-60b6-5f23-bacd29c1bca9@suse.com>
Date: Mon, 25 Nov 2019 13:45:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191125123923.2000028-1-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Don't increase ApicIdCoreSize past
 7
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
Cc: Steven Haigh <netwiz@crc.id.au>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMTkgMTM6MzksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gQ2hhbmdlc2V0IGNhMmVl
ZTkyZGY0NCAoIng4NiwgaHZtOiBFeHBvc2UgaG9zdCBjb3JlL0hUIHRvcG9sb2d5IHRvIEhWTQo+
IGd1ZXN0cyIpIGF0dGVtcHRlZCB0byAiZmFrZSB1cCIgYSB0b3BvbG9neSB3aGljaCB3b3VsZCBp
bmR1Y2UgZ3Vlc3QKPiBvcGVyYXRpbmcgc3lzdGVtcyB0byBub3QgdHJlYXQgdmNwdXMgYXMgc2li
bGluZyBoeXBlcnRocmVhZHMuICBUaGlzCj4gaW52b2x2ZWQgYWN0dWFsbHkgcmVwb3J0aW5nIGh5
cGVydGhyZWFkaW5nIGFzIGF2YWlsYWJsZSwgYnV0IGdpdmluZwo+IHZjcHVzIGV2ZXJ5IG90aGVy
IEFwaWNJZDsgd2hpY2ggaW4gdHVybiBsZWQgdG8gZG91YmxpbmcgdGhlIEFwaWNJZHMKPiBwZXIg
Y29yZSBieSBidW1waW5nIHRoZSBBcGljSWRDb3JlU2l6ZSBieSBvbmUuICBJbiBwYXJ0aWN1bGFy
LCBSeXplbgo+IDN4eHggc2VyaWVzIHByb2Nlc3NvcnMsIGFuZCByZXBvcnRlZGx5IEVQWUMgIlJv
bWUiIGNwdXMgLS0gaGF2ZSBhbgo+IEFwaWNJZENvcmVTaXplIG9mIDc7IHRoZSAiZmFrZSIgdG9w
b2xvZ3kgaW5jcmVhc2VzIHRoaXMgdG8gOC4KPiAKPiBVbmZvcnR1bmF0ZWx5LCBXaW5kb3dzIHJ1
bm5pbmcgb24gbW9kZXJuIEFNRCBoYXJkd2FyZSAtLSBpbmNsdWRpbmcKPiBSeXplbiAzeHh4IHNl
cmllcyBwcm9jZXNzb3JzLCBhbmQgcmVwb3J0ZWRseSBFUFlDICJSb21lIiBjcHVzIC0tCj4gZG9l
c24ndCBzZWVtIHRvIGNvcGUgd2l0aCB0aGlzIHZhbHVlIGJlaW5nIGhpZ2hlciB0aGFuIDcuICAo
TGludXgKPiBndWVzdHMgaGF2ZSBzbyBmYXIgY29udGludWVkIHRvIGNvcGUuKQo+IAo+IEEgInBy
b3BlciIgZml4IGlzIGNvbXBsaWNhdGVkIGFuZCBpdCdzIHRvbyBsYXRlIHRvIGZpeCBpdCBlaXRo
ZXIgZm9yCj4gNC4xMywgb3IgdG8gYmFja3BvcnQgdG8gc3VwcG9ydGVkIGJyYW5jaGVzLiAgQXMg
YSBzaG9ydC10ZXJtIGZpeCwKPiBsaW1pdCB0aGlzIHZhbHVlIHRvIDcuCj4gCj4gVGhpcyBkb2Vz
IG1lYW4gdGhhdCBhIExpbnV4IGd1ZXN0LCBib290ZWQgb24gc3VjaCBhIHN5c3RlbSB3aXRob3V0
Cj4gdGhpcyBjaGFuZ2UsIGFuZCB0aGVuIG1pZ3JhdGluZyB0byBhIHN5c3RlbSB3aXRoIHRoaXMg
Y2hhbmdlLCB3aXRoCj4gbW9yZSB0aGFuIDY0IHZjcHVzLCB3b3VsZCBzZWUgYW4gYXBwYXJlbnQg
dG9wb2xvZ3kgY2hhbmdlLiAgVGhpcyBpcyBhCj4gbG93IGVub3VnaCByaXNrIGluIHByYWN0aWNl
IHRoYXQgZW5hYmxpbmcgdGhpcyBsaW1pdCB1bmlsYXRlcmFsbHksIHRvCj4gYWxsb3cgb3RoZXIg
Z3Vlc3RzIHRvIGJvb3Qgd2l0aG91dCBtYW51YWwgaW50ZXJ2ZW50aW9uLCBpcyB3b3J0aCBpdC4K
PiAKPiBSZXBvcnRlZC1ieTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1Pgo+IFJlcG9y
dGVkLWJ5OiBBbmRyZWFzIEtpbnpsZXIgPGhmcEBwb3N0ZW8uZGU+Cj4gU2lnbmVkLW9mZi1ieTog
R2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
