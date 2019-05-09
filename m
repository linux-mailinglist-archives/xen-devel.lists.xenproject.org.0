Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE02184E3
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 07:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hObj7-0007ee-QJ; Thu, 09 May 2019 05:36:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hObj6-0007eV-5V
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:36:16 +0000
X-Inumbo-ID: 5ad901b0-721c-11e9-a662-0fe2dd087e9f
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ad901b0-721c-11e9-a662-0fe2dd087e9f;
 Thu, 09 May 2019 05:36:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB2AFABD4;
 Thu,  9 May 2019 05:36:11 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
Date: Thu, 9 May 2019 07:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
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
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDgvMDUvMjAxOSAxODozNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA1LzYvMTkgNzo1
NiBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBjb3JlLSBh
bmQgc29ja2V0LXNjaGVkdWxpbmcgdXNlIGEgbmV3IHN0cnVjdAo+PiBzY2hlZF9pdGVtIGluc3Rl
YWQgb2Ygc3RydWN0IHZjcHUgZm9yIGludGVyZmFjZXMgb2YgdGhlIGRpZmZlcmVudAo+PiBzY2hl
ZHVsZXJzLgo+Pgo+PiBSZW5hbWUgdGhlIHBlci1zY2hlZHVsZXIgZnVuY3Rpb25zIGluc2VydF92
Y3B1IGFuZCByZW1vdmVfdmNwdSB0bwo+PiBpbnNlcnRfaXRlbSBhbmQgcmVtb3ZlX2l0ZW0gdG8g
cmVmbGVjdCB0aGUgY2hhbmdlIG9mIHRoZSBwYXJhbWV0ZXIuCj4+IEluIHRoZSBzY2hlZHVsZXJz
IHJlbmFtZSBsb2NhbCBmdW5jdGlvbnMgc3dpdGNoZWQgdG8gc2NoZWRfaXRlbSwgdG9vLgo+Pgo+
PiBGb3Igbm93IHRoaXMgbmV3IHN0cnVjdCB3aWxsIGNvbnRhaW4gYSB2Y3B1IHBvaW50ZXIgb25s
eSBhbmQgaXMKPj4gYWxsb2NhdGVkIG9uIHRoZSBzdGFjay4gVGhpcyB3aWxsIGJlIGNoYW5nZWQg
bGF0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAKPiBPeSwgSSByZWFsaXplIHRoaXMgY29tbWVudCBpcyBnb2luZyB0byBiZSBzb21ld2hh
dCBwYWluZnVsLCBidXQuLi4KCkkgaG9wZSBJIGRpZG4ndCBzY3JlYW0gb3V0IHRvbyBsb3VkLi4u
IDstKQoKPiAnaXRlbScgcmVhbGx5IHNlZW1zIGxpa2UgdGhlIHdyb25nIHdvcmQgaGVyZS4gIFRv
IG1lICdpdGVtJyBhbHdheXMgbWVhbnMKPiBvbmUgdGhpbmc7IHdoZXJlYXMgd2hhdCB5b3UncmUg
cGxhbm5pbmcgb24gZG9pbmcgaXMgZ3JvdXBpbmcgdG9nZXRoZXIKPiB2Y3B1cyB0byBzY2hlZHVs
ZSB0b2dldGhlcjsgd2hpY2ggd291bGQgbWVhbiAidW5pdCIgKGFzIGluLCBhIG1pbGl0YXJ5Cj4g
dW5pdCkuCj4gCj4gSSByZWFsaXplIGNoYW5naW5nIGl0IGhlcmUgcHJvYmFibHkgbWVhbnMgYWxz
byBjaGFuZ2luZyBpdCBpbiB0aGUgbmV4dAo+IDQzIHBhdGNoZXMgYXMgd2VsbC4KCk9ubHkgYWJv
dXQgMTAwMCBsaW5lcyB0byBjaGFuZ2UuCgpUQkgsIHJlcGxhY2luZyAiaXRlbSIgd2l0aCAidW5p
dCIgaXMgZG9hYmxlIHZpYSBzZWQuIERvaW5nIHRoZSBzYW1lIHdpdGgKKGFzIERhcmlvIHN1Z2dl
c3RlZCkgImVudGl0eSIgaXMgbW9yZSBwYWluZnVsLCBhcyBJIHdvdWxkIG5lZWQgdG8gY2hlY2sK
Y29kaW5nIHN0eWxlIChsaW5lIGxlbmd0aCwgaW5kZW50YXRpb24pIG1hbnVhbGx5IGFmdGVyd2Fy
ZHMuIFNvIERhcmlvLAp3b3VsZCB5b3UgYmUgZmluZSB3aXRoICJ1bml0Ij8gVGhpcyBtaWdodCBz
YXZlIG1lIHNvbWUgaG91cnMgb2Ygd29yay4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
