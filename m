Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4010185086
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:01:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOLA-0001Fy-8h; Wed, 07 Aug 2019 15:59:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvOL8-0001Fs-7K
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:59:02 +0000
X-Inumbo-ID: 44da745c-b92c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 44da745c-b92c-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 15:59:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33FD6ABC7;
 Wed,  7 Aug 2019 15:58:59 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
Date: Wed, 7 Aug 2019 17:58:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807155112.GA3257@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNzo1MSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIEF1ZyAwNywgMjAxOSBhdCAwNTozMzowNVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDcuMDguMjAxOSAxNzoxNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEFjdHVhbGx5LCBJJ3ZlIGFscmVhZHkgdHJpZWQsIGJ1dCBldmVyeSBvdGhl
ciBidWlsZCBJIHRyeSwgSSBnZXQgZXZlbgo+Pj4gbGVzcyB1c2VmdWwgY2FsbCB0cmFjZSwgZm9y
IGV4YW1wbGUgZGVidWcgdW5zdGFibGUgYnVpbGQ6Cj4+Pgo+Pj4gICAgICAgWGVuIGNhbGwgdHJh
Y2U6Cj4+PiAgICAgICAgICBbPDAwMDAwMDAwN2I3NTFjMDk+XSAwMDAwMDAwMDdiNzUxYzA5Cj4+
PiAgICAgICAgICBbPDhjMmIwMzk4ZTAwMDBkYWE+XSA4YzJiMDM5OGUwMDAwZGFhCj4+PiAuLi4K
Pj4+ICAgICAgIEdFTkVSQUwgUFJPVEVDVElPTiBGQVVMVAo+Pj4gICAgICAgW2Vycm9yX2NvZGU9
MDAwMF0KPj4KPj4gQnV0IHRoaXMgbWFrZXMgcmVhc29uYWJsZSBzZW5zZTogVGhlIGZhdWx0aW5n
IGluc24gaXMgImNhbGwgKjB4MTgoJXJheCkiCj4+IGFuZCAlcmF4IGlzIDY5NTRiMmIwLCB3aGlj
aCBwb2ludHMgaW50byBhIGJsb2NrIG9mIHR5cGUKPj4gRWZpQm9vdFNlcnZpY2VzRGF0YSAoYW5k
IGhlbmNlIGxpa2VseSByZXVzZWQgYnkgdGhlIHRpbWUgb2YgdGhlIGNyYXNoCj4+IGZvciBvdGhl
ciBwdXJwb3NlcykuIEhlbmNlIHRoZSAiL21hcGJzIiBvcHRpb24gb2YgeGVuLmVmaSBtaWdodCBo
ZWxwCj4+IGhlcmUgdG9vLCBidXQgaWlyYyB0aGVyZSdzIG5vIGVxdWl2YWxlbnQgZm9yIGl0IGlu
IHRoZSBNQjIgY2FzZS4KPiAKPiBPaCwgeWVzLCBpbmRlZWQgaW4gUXViZXMgd2UgaGF2ZSAvbWFw
YnMgZW5hYmxlZCBieSBkZWZhdWx0IHdpdGggeGVuLmVmaS4KPiBJJ2QgbGlrZSB0byBhZGQgaXQg
dG8gTUIyIGNhc2UgdG9vLiBJcyBjb21tYW5kIGxpbmUgcGFyc2VkIGF0IHRoaXMgcG9pbnQKPiAo
ZWZpX2V4aXRfYm9vdCgpKSBhbHJlYWR5PwoKSSdtIHN0cnVnZ2xpbmcgYSBsaXR0bGUgaG93IHRv
IHJlcGx5LCBjb25zaWRlcmluZyB0aGF0IEkndmUgYWxyZWFkeQpzYWlkICJpaXJjIHRoZXJlJ3Mg
bm8gZXF1aXZhbGVudCBmb3IgaXQgaW4gdGhlIE1CMiBjYXNlIi4gU28gSSBndWVzcwpJJ20gc2lt
cGx5IG5vdCB1bmRlcnN0YW5kaW5nIHlvdXIgcXVlc3Rpb24sIG9yIG1vcmUgc3BlY2lmaWNhbGx5
CndoZXJlIHlvdSB3YW50IHRvIGdldCB3aXRoIGl0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
