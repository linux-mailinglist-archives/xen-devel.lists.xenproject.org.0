Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA56B993
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 11:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hngYN-0004xF-Jg; Wed, 17 Jul 2019 09:48:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/A+M=VO=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1hngYL-0004x7-CM
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 09:48:49 +0000
X-Inumbo-ID: 113e94dc-a878-11e9-8980-bc764e045a96
Received: from syrinx.knorrie.org (unknown [82.94.188.77])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 113e94dc-a878-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 09:48:45 +0000 (UTC)
Received: from [IPv6:2001:980:4a41:fb::12] (unknown
 [IPv6:2001:980:4a41:fb::12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id A0E774C0B29BB;
 Wed, 17 Jul 2019 11:48:44 +0200 (CEST)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <e6e0512b-d508-b637-9fd3-96739d5385c1@citrix.com>
 <86244630-aeb9-07a3-95f9-53d998b768ea@suse.com>
 <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
From: Hans van Kranenburg <hans@knorrie.org>
Openpgp: preference=signencrypt
Autocrypt: addr=hans@knorrie.org; keydata=
 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
Message-ID: <e417b72a-5ff3-1951-17c7-68a346eb8838@knorrie.org>
Date: Wed, 17 Jul 2019 11:48:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dd744df-dcd8-552b-c8e4-a0d05abc7eeb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Design session report: Xen on Distros
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzE1LzE5IDQ6NDIgUE0sIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNy8xNS8x
OSAzOjIzIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTUuMDcuMjAxOSAxNjoxMSwgR2Vv
cmdlIER1bmxhcCB3cm90ZToKPj4+IFRoZXJlIHdhcyBhIGxvbmcgZGlzY3Vzc2lvbiBhYm91dCBz
ZWN1cml0eSBwYXRjaGVzLCB3aXRoIHRoZSBnZW5lcmFsCj4+PiBwcm9wb3NhbCBiZWluZyB0aGF0
IHdlIHNob3VsZCBjdXQgYSBwb2ludCByZWxlYXNlIGZvciBldmVyeSBzZWN1cml0eSBpc3N1ZS4K
Pj4KPj4gSW50ZXJlc3RpbmcuIExvb2tzIGxpa2UgaW4gcG9saXRpY3MgdGhhdCB1bnRpbCBhIGRl
Y2lzaW9uIGZpdHMgcGVvcGxlCj4+IHRoZXkga2VlcCByZS1yYWlzaW5nIHRoZSBwb2ludC4gSWly
YyBvbiBhIHByaW9yIG1lZXRpbmcgKEJ1ZGFwZXN0PykKPj4gd2UgaGFkIHNldHRsZWQgb24gY29u
dGludWluZyB3aXRoIHRoZSBjdXJyZW50IHNjaGVtZS4gV2VyZSB0aGVyZSBhbnkKPj4gbmV3IGFy
Z3VtZW50cyB0b3dhcmRzIHRoaXMgYWx0ZXJuYXRpdmUgbW9kZWw/Cj4gCj4gV2VsbCBJIGRvbid0
IGtub3cgaWYgdGhlcmUgd2VyZSBhbnkgbmV3IGFyZ3VtZW50cyBiZWNhdXNlIEkgZG9uJ3QKPiBp
bW1lZGlhdGVseSByZW1lbWJlciB0aGUgb2xkIGRpc2N1c3Npb24uICBEbyB3ZSBoYXZlIGEgc3Vt
bWFyeSBvZiB0aGUKPiBkaXNjdXNzaW9uIGluIEJ1ZGFwZXN0LCB3aXRoIGl0cyBjb25jbHVzaW9u
cywgYW55d2hlcmU/Cj4gCj4gVGhlIGJhc2ljIGlkZWEgd2FzIHRoYXQ6Cj4gCj4gMS4gTW9zdCBk
aXN0cm9zIC8gcGFja2FnZXJzIGFyZSBnb2luZyB0byB3YW50IHRvIGRvIGFuIGltbWVkaWF0ZSBy
ZWxlYXNlCj4gYW55d2F5Lgo+IAo+IDIuIERpc3Ryb3MgZ2VuZXJhbGx5IHNlZW1lZCB0byBiZSBy
ZWJhc2luZyBvbiB0b3Agb2Ygc3RhZ2luZyBhcyBzb29uIGFzCj4gdGhlIFhTQSB3ZW50IG91dCBh
bnl3YXkgKGFuZCBJU1RSIHRoaXMgYmVpbmcgdGhlIHJlY29tbWVuZWRlZCBjb3Vyc2Ugb2YKPiBh
Y3Rpb24pCgpGWUksIEluIERlYmlhbiwgd2Ugb25seSBzaGlwIHRoZSBzdGFibGUgYnJhbmNoLCBu
b3QgdGhlIHN0YWdpbmcgYnJhbmNoLgpCZXR0ZXIgc2FmZSB0aGFuIHNvcnJ5LgoKQW5kIHllcywg
dGhpcyBtZWFucyB0aGVyZSdzIGEgZGVsYXksIGFuZCBpdCdzIG5vdCBpbW1lZGlhdGUsIGV0Yy4K
CldlbGwsIGF0IGxlYXN0IHNpbmNlIEkgaGF2ZSBiZWVuIGludm9sdmVkLiBJbiB0aGUgcGFzdCBz
ZWN1cml0eSB1cGRhdGUKcGFja2FnZXMgd2VyZSBtYWRlIGJ5IGFwcGx5aW5nIHBhdGNoZXMgbWFu
dWFsbHkgb24gdG9wIG9mIG9sZGVyIChsaWtlLAo0LjQuMSBpbnN0ZWFkIG9mIDQuNC54KSBmcm96
ZW4gdmVyc2lvbnMsIGJ1dCB3ZSBkZWNpZGVkIHRoYXQgInRyeWluZyB0bwphc3NlbWJsZSBvdXIg
b3duIHN1YnNldCBvZiB0aGUgcGF0Y2hlcyBpcyByaXNraWVyIHRoYW4gdGFraW5nIHVwc3RyZWFt
J3MKY29sbGVjdGlvbiIuCgpUaGUgRGViaWFuIFJlbGVhc2UgVGVhbSBhbGxvd3MgdXMgdG8gdXBs
b2FkIG5ld2VyIHVwc3RyZWFtIHZlcnNpb25zCmR1cmluZyBhIHNlY3VyaXR5IHVwbG9hZCBmb3Ig
WGVuLCB3aGljaCBpcyBvZmZpY2lhbGx5IG5vdCBhbGxvd2VkIGluCkRlYmlhbiBzdGFibGUuIE9u
ZSBvZiB0aGUgdGhpbmdzIHRoYXQgb2J2aW91c2x5IGhlbHAgd2l0aCBiZWluZyBhYmxlIHRvCmtl
ZXAgZG9pbmcgdGhpcyBpcyB0aGUgInRyYWNrIHJlY29yZCIgb2YgdGhlIHF1YWxpdHkgKGV4cGVj
aWFsbHkKcmVncmVzc2lvbiB0ZXN0aW5nKSBvZiB0aGUgc3RhYmxlLTQueCBicmFuY2hlcy4KCkN1
cnJlbnRseSwgb3VyIHBhY2thZ2UgdmVyc2lvbnMgbW9zdGx5IGxvb2sgbGlrZSBlLmcuCjQuMTEu
MSs5Mi1nNmMzMzMwOGE4ZC0xLCBpbnN0ZWFkIG9mIGEgbmljZSBzaW1wbGUgdmVyc2lvbiBudW1i
ZXIuIEZvciBtZQp0aGlzIGlzIGZpbmUsIGJ1dCBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgZm9yIGFu
IGVuZCB1c2VyIGl0IHdvdWxkIGp1c3QKbG9vayBuaWNlciAoYW5kIGZlZWwgYmV0dGVyIHBlcmNl
cHRpb24td2lzZSkgdG8gZ2V0IGEgNC4xMS54IHBhY2thZ2UuCgpTbyBqdXN0IGZvciB0aGF0IHJl
YXNvbiBJIHdvdWxkIGJlIGFsbCArMSBmb3IgbW9yZSB0YWdnZWQgcmVsZWFzZXMuCgo+IFNvIGZv
ciBhbGwgaW50ZW50cyBhbmQgcHVycG9zZXMsIHdlIGhhdmUgc29tZXRoaW5nIHdoaWNoIGlzLCBp
biBmYWN0LCBhCj4gcmVsZWFzZTsgYWxsIGl0J3MgbWlzc2luZyBpcyBhIHNpZ25lZCB0YWcgYW5k
IGEgdGFyYmFsbC4KPiAKPiBPYnZpb3VzbHkgdGhlcmUgYXJlIHRlc3RpbmcgaW1wbGljYXRpb25z
IHRoYXQgd291bGQgbmVlZCB0byBiZSBzb3J0ZWQKPiBvdXQgYmVmb3JlIHRoaXMgY291bGQgYmVj
b21lIGEgcmVhbGl0eS4KPiAKPiBJbiBhbnkgY2FzZSwgdGhlIGJhbGwgaXMgaW4gdGhlIGNvdXJ0
IG9mICJWT0xVTlRFRVIiIHRvIHdyaXRlIHVwIGEKPiBjb25jcmV0ZSBwcm9wb3NhbCB3aGljaCBj
b3VsZCBiZSBkaXNjdXNzZWQuICBZb3UnbGwgYmUgYWJsZSB0byByYWlzZSBhbGwKPiB5b3VyIGNv
bmNlcm5zIGF0IHRoYXQgcG9pbnQgaWYgeW91IHdhbnQgKGFsdGhvdWdoIGhhdmluZyBhIHNrZXRj
aCB3b3VsZAo+IG9mIGNvdXJzZSBiZSBoZWxwZnVsIGZvciB3aG9ldmVyIGlzIHdyaXRpbmcgc3Vj
aCBhIHByb3Bvc2FsKS4KCkhhbnMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
