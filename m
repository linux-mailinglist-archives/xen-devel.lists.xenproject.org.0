Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C63F11E281
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:07:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifikf-0000af-S7; Fri, 13 Dec 2019 11:04:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifikd-0000aa-UW
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:04:51 +0000
X-Inumbo-ID: 61cd64e8-1d98-11ea-8ed9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61cd64e8-1d98-11ea-8ed9-12813bfff9fa;
 Fri, 13 Dec 2019 11:04:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C1D5B0B6;
 Fri, 13 Dec 2019 11:04:49 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
Date: Fri, 13 Dec 2019 12:05:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212182740.2190199-4-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVzdCB0d28gbWlub3IgcmVtYXJrczoKCk9uIDEyLjEyLjIwMTkgMTk6MjcsIEFudGhvbnkgUEVS
QVJEIHdyb3RlOgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kb2NzL21pc2Mva2NvbmZpZy1tYWNy
by1sYW5ndWFnZS5yc3QKPiBAQCAtMCwwICsxLDI0NyBAQAo+ICs9PT09PT09PT09PT09PT09PT09
PT09Cj4gK0tjb25maWcgbWFjcm8gbGFuZ3VhZ2UKPiArPT09PT09PT09PT09PT09PT09PT09PQo+
ICsKPiArQ29uY2VwdAo+ICstLS0tLS0tCj4gKwo+ICtUaGUgYmFzaWMgaWRlYSB3YXMgaW5zcGly
ZWQgYnkgTWFrZS4gV2hlbiB3ZSBsb29rIGF0IE1ha2UsIHdlIG5vdGljZSBzb3J0IG9mCj4gK3R3
byBsYW5ndWFnZXMgaW4gb25lLiBPbmUgbGFuZ3VhZ2UgZGVzY3JpYmVzIGRlcGVuZGVuY3kgZ3Jh
cGhzIGNvbnNpc3Rpbmcgb2YKPiArdGFyZ2V0cyBhbmQgcHJlcmVxdWlzaXRlcy4gVGhlIG90aGVy
IGlzIGEgbWFjcm8gbGFuZ3VhZ2UgZm9yIHBlcmZvcm1pbmcgdGV4dHVhbAo+ICtzdWJzdGl0dXRp
b24uCj4gKwo+ICtUaGVyZSBpcyBjbGVhciBkaXN0aW5jdGlvbiBiZXR3ZWVuIHRoZSB0d28gbGFu
Z3VhZ2Ugc3RhZ2VzLiBGb3IgZXhhbXBsZSwgeW91Cj4gK2NhbiB3cml0ZSBhIG1ha2VmaWxlIGxp
a2UgZm9sbG93czo6Cj4gKwo+ICsgICAgQVBQIDo9IGZvbwo+ICsgICAgU1JDIDo9IGZvby5jCj4g
KyAgICBDQyA6PSBnY2MKPiArCj4gKyAgICAkKEFQUCk6ICQoU1JDKQo+ICsgICAgICAgICAgICAk
KENDKSAtbyAkKEFQUCkgJChTUkMpCj4gKwo+ICtUaGUgbWFjcm8gbGFuZ3VhZ2UgcmVwbGFjZXMg
dGhlIHZhcmlhYmxlIHJlZmVyZW5jZXMgd2l0aCB0aGVpciBleHBhbmRlZCBmb3JtLAo+ICthbmQg
aGFuZGxlcyBhcyBpZiB0aGUgc291cmNlIGZpbGUgd2VyZSBpbnB1dCBsaWtlIGZvbGxvd3M6Ogo+
ICsKPiArICAgIGZvbzogZm9vLmMKPiArICAgICAgICAgICAgZ2NjIC1vIGZvbyBmb28uYwo+ICsK
PiArVGhlbiwgTWFrZSBhbmFseXplcyB0aGUgZGVwZW5kZW5jeSBncmFwaCBhbmQgZGV0ZXJtaW5l
cyB0aGUgdGFyZ2V0cyB0byBiZQo+ICt1cGRhdGVkLgo+ICsKPiArVGhlIGlkZWEgaXMgcXVpdGUg
c2ltaWxhciBpbiBLY29uZmlnIC0gaXQgaXMgcG9zc2libGUgdG8gZGVzY3JpYmUgYSBLY29uZmln
Cj4gK2ZpbGUgbGlrZSB0aGlzOjoKPiArCj4gKyAgICBDQyA6PSBnY2MKPiArCj4gKyAgICBjb25m
aWcgQ0NfSEFTX0ZPTwo+ICsgICAgICAgICAgICBkZWZfYm9vbCAkKHNoZWxsLCAkKHNyY3RyZWUp
L3NjcmlwdHMvZ2NjLWNoZWNrLWZvby5zaCAkKENDKSkKPiArCj4gK1RoZSBtYWNybyBsYW5ndWFn
ZSBpbiBLY29uZmlnIHByb2Nlc3NlcyB0aGUgc291cmNlIGZpbGUgaW50byB0aGUgZm9sbG93aW5n
Cj4gK2ludGVybWVkaWF0ZTo6Cj4gKwo+ICsgICAgY29uZmlnIENDX0hBU19GT08KPiArICAgICAg
ICAgICAgZGVmX2Jvb2wgeQo+ICsKPiArVGhlbiwgS2NvbmZpZyBtb3ZlcyBvbnRvIHRoZSBldmFs
dWF0aW9uIHN0YWdlIHRvIHJlc29sdmUgaW50ZXItc3ltYm9sCj4gK2RlcGVuZGVuY3kgYXMgZXhw
bGFpbmVkIGluIGtjb25maWctbGFuZ3VhZ2UudHh0LgoKLnJzdCA/CgoKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuLy5naXRpZ25vcmUKPiBAQCAtMCwwICsxLDIgQEAKPiArKi5sZXguYwo+ICsq
LnRhYi5bY2hdCgpXaHkgZG8gdGhlc2UgZ2V0IG1vdmVkIGhlcmUgZnJvbSAuLi4KCj4gLS0tIGEv
eGVuL3Rvb2xzL2tjb25maWcvLmdpdGlnbm9yZQo+ICsrKyBiL3hlbi90b29scy9rY29uZmlnLy5n
aXRpZ25vcmUKPiBAQCAtMSwxMiArMSw4IEBACj4gICMKPiAgIyBHZW5lcmF0ZWQgZmlsZXMKPiAg
Iwo+IC1jb25maWcqCj4gLSoubGV4LmMKPiAtKi50YWIuYwo+IC0qLnRhYi5oCj4gLXpjb25mLmhh
c2guYwo+ICAqLm1vYwo+ICsqY29uZi1jZmcKCmhlcmU/CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
