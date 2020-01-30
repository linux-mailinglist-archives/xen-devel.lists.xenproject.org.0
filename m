Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C114D7E2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:42:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix5MN-00010m-PF; Thu, 30 Jan 2020 08:39:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VOoA=3T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ix5MM-00010h-9X
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 08:39:34 +0000
X-Inumbo-ID: 09c697b4-433c-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09c697b4-433c-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 08:39:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53D61AAF1;
 Thu, 30 Jan 2020 08:39:32 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, pgnet.dev@gmail.com
References: <4bd83180-1b44-bcdd-bfe6-42724cda8a44@gmail.com>
 <5ac8716e-daba-9788-c362-acad18a44dfe@suse.com>
 <81d0da4b-7b8d-5659-d1cc-ba2726af0fef@gmail.com>
 <7e94b98d-5037-3e33-a29e-6f89f09714c4@gmail.com>
 <f49a0af0-afa4-5c5b-77e2-c16d89b323ee@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1d092341-15b4-e733-a7a2-7fcf3ecd30f5@suse.com>
Date: Thu, 30 Jan 2020 09:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f49a0af0-afa4-5c5b-77e2-c16d89b323ee@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] FAILED/MISSING cstate/cpufreq/cpupower support with
 Xen 4.13 + kernel 5.4.14; withOUT xen/hypervisor, WORKS. bug or config?
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAgMDk6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjAxLjIwMjAgMjA6
MjksIFBHTmV0IERldiB3cm90ZToKPj4gd2l0aCB4ZW4gY21kIGxpbmUgb3B0cyByZWR1Y2VkIHRv
Cj4+Cj4+IAlvcHRpb25zPWRvbTBfbWF4X3ZjcHVzPTQgZG9tMF9tZW09NDAxNk0sbWF4OjQwOTZN
IGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbCBub3JlYm9vdD1mYWxzZSBzeW5jX2NvbnNvbGU9
dHJ1ZSBzY2hlZF9kZWJ1ZyBpb21tdT12ZXJib3NlIGFwaWNfdmVyYm9zaXR5PXZlcmJvc2UKPj4K
Pj4gc3RpbGwgbm8gZnJlcSBkYXRhL2NvbnRyb2wKPiAKPiBTdXJlLCB0aGVyZSB3YXMgbm8gc3Vn
Z2VzdGlvbiB0aGF0IHRoZSBjb21tYW5kIGxpbmUgb3B0aW9ucyB3b3VsZAo+IGFmZmVjdCB0aGlz
LiBJdCB3YXMganVzdCB0aGF0IHRoZXJlIHdlcmUgc28gbWFueSBvcHRpb25zIHRoYXQgaXQKPiB3
YXMgaGFyZCB0byBzZWUgd2hhdCB5b3UgYWN0dWFsbHkgd2FudCB0byBhY2hpZXZlLiBUaGVyZSBh
cmUgc3RpbGwKPiBwb2ludGxlc3Mgb3B0aW9ucyBhYm92ZTogbm9yZWJvb3Q9ZmFsc2UgaXMgdGhl
IGRlZmF1bHQgYW55d2F5LiBUaGUKPiBsYXN0IHRocmVlIG9wdGlvbnMgYWxzbyBzaG91bGRuJ3Qg
YmUgc3RyaWN0bHkgbmVlZGVkLiBUaGVuIGFnYWluCj4gaXQgaXMgdW5jbGVhciAoYmVjYXVzZSBv
ZiAuLi4KPiAKPj4gYW5kLAo+Pgo+PiB4bCBkbWVzZwo+PiAJKFhFTikgIDAwMDAwMDAwOTIxMTgw
MDAgLSAwMDAwMDAwMDkyMTNjMDAwICh1c2FibGUpCj4gCj4gLi4uIHRoZSBsb2cgYmVpbmcgY3Vy
IG9mZiBhdCB0aGUgYmVnaW5uaW5nLCB3aGV0aGVyIHlvdSB1c2UgYQo+IGRlYnVnIG9yIHJlbGVh
c2UgaHlwZXJ2aXNvci4gRm9yIGZpZ3VyaW5nIG91dCBpc3N1ZXMsIGl0IGlzCj4gZ2VuZXJhbGx5
IGhlbHBmdWwgKGFkdmlzYWJsZSkgdG8gdXNlIHRoZSBkZWJ1ZyB2YXJpYW50LiBJZiB5b3UncmUK
PiB1c2luZyBvcGVuU1VTRSBhbmQgeGVuLmVmaSwgdGhpcyBtYXkgbWVhbiB5b3UgbmVlZCB0byBi
dWlsZCB5b3UKPiBvd24sIHRob3VnaC4KPiAKPiBJbiBhbnkgZXZlbnQgLSBkb2VzIHRoaXMgbG9n
IGNvdmVyIHRoZSAoZmFpbGVkKSBhdHRlbXB0IHRvCj4gbG9hZCB0aGUgeGVuLWFjcGktcHJvY2Vz
c29yIGRyaXZlcj8gSWYgbm90LCBwbGVhc2UgcHJvdmlkZSBvbmUKPiB3aGljaCBkb2VzLiBJdCBp
cyB0aGUgbG9hZGluZyBvZiB0aGF0IGRyaXZlciB3aGljaCBpcyBjcnVjaWFsCj4gZm9yIFAtc3Rh
dGUgY29udHJvbCB0byBzdGFydCB3b3JraW5nIGluIFhlbiwgYXMgLSBvdGhlciB0aGFuCj4gZm9y
IEMtc3RhdGVzIG9uIGhhbGZ3YXkgbW9kZXJuIENQVXMgLSBYZW4gZGVwZW5kcyBvbiBEb20wIHRv
Cj4gdXBsb2FkIHJlbGV2YW50IGRhdGEgb2J0YWluZWQgZnJvbSBBQ1BJIHRhYmxlcy4KCkknZCBs
aWtlIHRvIHJlcXVlc3QgeW91IGFkZGluZyB0aGUgZG9tMCBrZXJuZWwgYm9vdCBwYXJhbWV0ZXJz
LCB0b286CgpkZWJ1ZyBpbml0Y2FsbF9kZWJ1ZwoKVGhpcyBzaG91bGQgZ2l2ZSB1cyBhIGNsdWUg
d2hldGhlciB0aGVyZSB3YXMgYSB0cnkgdG8gY2FsbCB0aGUgZHJpdmVyCmF0IGFsbCBhbmQgd2hl
biB0aGlzIGRpZCBoYXBwZW4gYW5kIHdpdGggd2hhdCByZXN1bHQuCgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
