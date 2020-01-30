Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169814D755
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:12:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix4tb-0006rg-H5; Thu, 30 Jan 2020 08:09:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix4ta-0006rZ-Eu
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 08:09:50 +0000
X-Inumbo-ID: e2a7cefe-4337-11ea-8a15-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2a7cefe-4337-11ea-8a15-12813bfff9fa;
 Thu, 30 Jan 2020 08:09:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1AF2B15B;
 Thu, 30 Jan 2020 08:09:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d9fba71e-9caa-45d7-385a-b5ca7c52303c@suse.com>
 <2518e99d-5b4b-85bc-c4bc-0af909fc89e3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e67bf1d3-6f3b-a78c-578b-43a7ef6afb2d@suse.com>
Date: Thu, 30 Jan 2020 09:09:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2518e99d-5b4b-85bc-c4bc-0af909fc89e3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: undo part of "refine link time stub
 area related assertion"
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxODoxNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wMS8yMDIw
IDE3OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIG9yaWdpbmFsIGNoZWNrIHdhcyBub3Qg
dG9vIHN0cmljdDogV2hpbGUgd2UgZG9uJ3QgdXNlIG9uZSBwYWdlIG9mCj4+IG1lbW9yeSBwZXIg
Q1BVLCB3ZSBkbyB1c2Ugb25zIHBhZ2Ugb2YgVkEgc3BhY2UgcGVyIENQVS4gSXQgaXMgdGhlCj4g
Cj4gb25lLgo+IAo+PiBsYXR0ZXIgd2hpY2ggbWF0dGVycyBoZXJlLgo+Pgo+PiBVbmRvIHRoYXQg
cGFydCBvZiB0aGUgY2hhbmdlLCBidXQgbGVhdmUgZXZlcnl0aGluZyBlbHNlIGluIHBsYWNlLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4g
T2ssIGJ1dCB0aGlzIGJlZ3MgdGhlIHF1ZXN0aW9uIHdoeT/CoCBJZiB0aGUgc3R1YnMgYXJlIHRp
Z2h0bHkgcGFja2VkCj4gdG9nZXRoZXIsIGJ1dCB0aGUgbGluZWFyIHNwYWNlIGlzbid0LCB3ZSBl
bmQgdXAgaGF2aW5nIGxvYWRzIG9mIGFsaWFzZXMKPiBvZiB0aGUgc3R1YnMuCj4gCj4gVGhlcmUg
aXMgbm8gc2VjdXJpdHkgYmVuZWZpdCBmb3IgZG9pbmcgc28sIGJ1dCB0aGVyZSBpcyBhIHJlYWwK
PiBwZXJmb3JtYW5jZSBjb3N0IGZyb20gbm90IGNvbXBhY3RpbmcgdGhlIGxpbmVhciBzcGFjZS7C
oCBNb3N0IG5vdGFibHksCj4gdHdvIHRocmVhZHMgdW5hYmxlIHRvIHNoYXJlIGEgNGsgdGxiIGVu
dHJ5IGZvciB0aGVpciBvd24gc3R1YnMsIGJ1dCBhbHNvCj4gcmVkdWNlZCBjYWNoZSBsb2NhbGl0
eSBvZiByZWZlcmVuY2UgZm9yIHRoZSBwYWdldGFibGVzIHJlcXVpcmVzIHRvIG1hcAo+IHRoZSBv
dmVybHktbGFyZ2UgbGluZWFyIHNwYWNlLgoKVGhlIGlkZWEsIGlpcmMsIHdhcyB0byBtYWtlIHRo
ZSBhZGRyZXNzZXMgZXZlbiBtb3JlIGVhc2lseQpyZWNvZ25pemFibGUgdGhpcyB3YXksIGluIHBh
cnRpY3VsYXIgaW4gdGhlIGNhc2UgYSBzdHViIHdhcwpyZWZlcmVuY2VkIGZvciBhIENQVSB0aGF0
IHdhcyB0YWtlbiBvZmZsaW5lLiBCdXQgeWVzLCB0aGlzIGlzbid0CmFuIG92ZXJseSBiaWcgd2lu
IGluIHRoaXMgcmVnYXJkLCBzbyBwZXJoYXBzIHRoZSBhcnJhbmdlbWVudApjb3VsZCBiZSByZXZp
c2VkIChsb29raW5nIG92ZXIgdGhlIGNvZGUgdGhlcmUgZG9uJ3QgbG9vayB0byBiZQphbnkgb3Ro
ZXIgZGVwZW5kZW5jaWVzIG9uIHRoaXMgbGF5b3V0KS4gVW50aWwgdGhlbiB0aG91Z2ggdGhlCmFz
c2VydGlvbiBzaG91bGQgYmUgZml4ZWQsIGFzIHJpZ2h0IG5vdyBpdCBpcyBjbGVhcmx5Cmluc3Vm
ZmljaWVudC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
