Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2A610400A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 16:53:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSFL-0006nZ-BN; Wed, 20 Nov 2019 15:50:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXSFK-0006nR-0w
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 15:50:22 +0000
X-Inumbo-ID: 746de926-0bad-11ea-a31a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 746de926-0bad-11ea-a31a-12813bfff9fa;
 Wed, 20 Nov 2019 15:50:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9189AB2A99;
 Wed, 20 Nov 2019 15:50:19 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20191119165809.GE1425@perard.uk.xensource.com>
 <20191119175855.1716278-1-anthony.perard@citrix.com>
 <b28ae29d-74d5-757d-b78a-ade4bba5dfb6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5ef641cb-55e1-37a4-1346-cba5c42918c0@suse.com>
Date: Wed, 20 Nov 2019 16:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <b28ae29d-74d5-757d-b78a-ade4bba5dfb6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH] xen/arch/x86/Makefile: Remove $(guard)
 use from $(TARGET).efi target
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMTkgMDg6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE5LjExLjIwMTkgMTg6
NTgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+PiBGb2xsb3dpbmcgdGhlIHBhdGNoIDY1ZDEwNDk4
NGMwNCAoIng4NjogZml4IHJhY2UgdG8gYnVpbGQKPj4gYXJjaC94ODYvZWZpL3JlbG9jcy1kdW1t
eS5vIiksIHRoZSBlcnJvciBtZXNzYWdlCj4+ICAgIG5tOiAnZWZpL3JlbG9jcy1kdW1teS5vJzog
Tm8gc3VjaCBmaWxlIgo+PiBzdGFydGVkIHRvIGFwcGVhciBvbiBzeXN0ZW0gd2hpY2ggY2FuJ3Qg
YnVpbGQgdGhlIC5lZmkgdGFyZ2V0LiBUaGlzIGlzCj4+IGJlY2F1c2UgcmVsb2NzLWR1bW15Lm8g
aXNuJ3QgYnVpbHQgYW55bW9yZS4KPj4gVGhlIGVycm9yIGlzIHByaW50ZWQgYnkgdGhlIGV2YWx1
YXRpb24gb2YgVklSVF9CQVNFIGFuZCBBTFRfQkFTRSB3aGljaAo+PiBhcmVuJ3QgdXNlIGFueXdh
eS4KPj4KPj4gQnV0LCB3ZSBkb24ndCBuZWVkIHRoYXQgZmlsZSBhcyB3ZSBkb24ndCB3YW50IHRv
IGJ1aWxkIGAkKFRBUkdFVCkuZWZpJwo+PiBhbnl3YXkuICBPbiBzdWNoIHN5c3RlbSwgJChndWFy
ZCkgZXZhbHVhdGUgdG8gdGhlIHNoZWxsIGJ1aWx0aW4gJzonLAo+PiB3aGljaCBwcmV2ZW50IGFu
eSBvZiB0aGUgc2hlbGwgY29tbWFuZHMgaW4gYCQoVEFSR0VUKS5lZmknIGZyb20gYmVlbgo+PiBl
eGVjdXRlZC4KPj4KPj4gRXZlbiBpZiAkKGd1YXJkKSBpcyBldmFsdWF0ZWQgb3BvbiB1c2UsIGl0
IGRlcGVuZHMgb24gJChYRU5fQlVJTERfUEUpCj4+IHdoaWNoIGlzIGV2YWx1YXRlZCBhdCB0aGUg
YXNzaWdubWVudC4gU28sIHdlIGNhbiByZXBsYWNlICQoZ3VhcmQpIGluCj4+ICQoVEFSR0VUKS5l
ZmkgYnkgaGF2aW5nIHR3byBkaWZmZXJlbnQgcnVsZXMgZGVwZW5kaW5nIG9uCj4+ICQoWEVOX0JV
SUxEX1BFKSBpbnN0ZWFkLgo+Pgo+PiBUaGUgY2hhbmdlIHdpdGggdGhpcyBwYXRjaCBpcyB0aGF0
IG5vbmUgb2YgdGhlIGRlcGVuZGVuY3kgb2YKPj4gJChUQVJHRVQpLmVmaSB3aWxsIGJlIGJ1aWx0
IGlmIHRoZSBsaW5rZXIgZG9lc24ndCBzdXBwb3J0IFBFCj4+IGFuZCBWSVJUX0JBU0UgYW5kIEFM
VF9CQVNFIGRvbid0IGdldCBldmFsdWF0ZWQgYW55bW9yZSwgc28gbm0gd2lsbCBub3QKPj4gY29t
cGxhaW4gYWJvdXQgdGhlIG1pc3NpbmcgcmVsb2NzLWR1bW15Lm8gZmlsZSBhbnltb3JlLgo+Pgo+
PiBTaW5jZSBwcmVsaW5rLWVmaS5vIGlzbid0IGJ1aWx0IG9uIHN5c3RlbSB0aGF0IGNhbid0IGJ1
aWxkCj4+ICQoVEFSR0VUKS5lZmkgYW55bW9yZSwgd2UgY2FuIHJlbW92ZSB0aGUgJChndWFyZCkg
dmFyaWFibGUgZXZlcnl3aGVyZS4KPiAKPiBBbmQgaW5kZWVkIHRoZSBuZWVkIGZvciBpdCBoYWQg
ZGlzYXBwZWFyZWQgd2l0aCAxOGNkNDk5N2QyICgieDg2L2VmaToKPiBtb3ZlIHRoZSBsb2dpYyB0
byBkZXRlY3QgUEUgYnVpbGQgc3VwcG9ydCIpLgo+IAo+PiBSZXBvcnRlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFsc28gQ2MtaW5nIErDvHJnZW4sIGFzIHRoaXMgYWRk
cmVzc2VzIGEgKGNvc21ldGljKSByZWdyZXNzaW9uIGZyb20KPiA2NWQxMDQ5ODRjICgieDg2OiBm
aXggcmFjZSB0byBidWlsZCBhcmNoL3g4Ni9lZmkvcmVsb2NzLWR1bW15Lm8iKS4KClJlbGVhc2Ut
YWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
