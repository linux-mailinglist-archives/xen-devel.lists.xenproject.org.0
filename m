Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E2214D770
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:22:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix52K-0007oG-Rx; Thu, 30 Jan 2020 08:18:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ix52J-0007oB-7N
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 08:18:51 +0000
X-Inumbo-ID: 24ba4d98-4339-11ea-8a15-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24ba4d98-4339-11ea-8a15-12813bfff9fa;
 Thu, 30 Jan 2020 08:18:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53922B249;
 Thu, 30 Jan 2020 08:18:49 +0000 (UTC)
To: pgnet.dev@gmail.com
References: <4bd83180-1b44-bcdd-bfe6-42724cda8a44@gmail.com>
 <5ac8716e-daba-9788-c362-acad18a44dfe@suse.com>
 <81d0da4b-7b8d-5659-d1cc-ba2726af0fef@gmail.com>
 <7e94b98d-5037-3e33-a29e-6f89f09714c4@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f49a0af0-afa4-5c5b-77e2-c16d89b323ee@suse.com>
Date: Thu, 30 Jan 2020 09:18:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7e94b98d-5037-3e33-a29e-6f89f09714c4@gmail.com>
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAyMDoyOSwgUEdOZXQgRGV2IHdyb3RlOgo+IHdpdGggeGVuIGNtZCBsaW5l
IG9wdHMgcmVkdWNlZCB0bwo+IAo+IAlvcHRpb25zPWRvbTBfbWF4X3ZjcHVzPTQgZG9tMF9tZW09
NDAxNk0sbWF4OjQwOTZNIGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbCBub3JlYm9vdD1mYWxz
ZSBzeW5jX2NvbnNvbGU9dHJ1ZSBzY2hlZF9kZWJ1ZyBpb21tdT12ZXJib3NlIGFwaWNfdmVyYm9z
aXR5PXZlcmJvc2UKPiAKPiBzdGlsbCBubyBmcmVxIGRhdGEvY29udHJvbAoKU3VyZSwgdGhlcmUg
d2FzIG5vIHN1Z2dlc3Rpb24gdGhhdCB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbnMgd291bGQKYWZm
ZWN0IHRoaXMuIEl0IHdhcyBqdXN0IHRoYXQgdGhlcmUgd2VyZSBzbyBtYW55IG9wdGlvbnMgdGhh
dCBpdAp3YXMgaGFyZCB0byBzZWUgd2hhdCB5b3UgYWN0dWFsbHkgd2FudCB0byBhY2hpZXZlLiBU
aGVyZSBhcmUgc3RpbGwKcG9pbnRsZXNzIG9wdGlvbnMgYWJvdmU6IG5vcmVib290PWZhbHNlIGlz
IHRoZSBkZWZhdWx0IGFueXdheS4gVGhlCmxhc3QgdGhyZWUgb3B0aW9ucyBhbHNvIHNob3VsZG4n
dCBiZSBzdHJpY3RseSBuZWVkZWQuIFRoZW4gYWdhaW4KaXQgaXMgdW5jbGVhciAoYmVjYXVzZSBv
ZiAuLi4KCj4gYW5kLAo+IAo+IHhsIGRtZXNnCj4gCShYRU4pICAwMDAwMDAwMDkyMTE4MDAwIC0g
MDAwMDAwMDA5MjEzYzAwMCAodXNhYmxlKQoKLi4uIHRoZSBsb2cgYmVpbmcgY3VyIG9mZiBhdCB0
aGUgYmVnaW5uaW5nLCB3aGV0aGVyIHlvdSB1c2UgYQpkZWJ1ZyBvciByZWxlYXNlIGh5cGVydmlz
b3IuIEZvciBmaWd1cmluZyBvdXQgaXNzdWVzLCBpdCBpcwpnZW5lcmFsbHkgaGVscGZ1bCAoYWR2
aXNhYmxlKSB0byB1c2UgdGhlIGRlYnVnIHZhcmlhbnQuIElmIHlvdSdyZQp1c2luZyBvcGVuU1VT
RSBhbmQgeGVuLmVmaSwgdGhpcyBtYXkgbWVhbiB5b3UgbmVlZCB0byBidWlsZCB5b3UKb3duLCB0
aG91Z2guCgpJbiBhbnkgZXZlbnQgLSBkb2VzIHRoaXMgbG9nIGNvdmVyIHRoZSAoZmFpbGVkKSBh
dHRlbXB0IHRvCmxvYWQgdGhlIHhlbi1hY3BpLXByb2Nlc3NvciBkcml2ZXI/IElmIG5vdCwgcGxl
YXNlIHByb3ZpZGUgb25lCndoaWNoIGRvZXMuIEl0IGlzIHRoZSBsb2FkaW5nIG9mIHRoYXQgZHJp
dmVyIHdoaWNoIGlzIGNydWNpYWwKZm9yIFAtc3RhdGUgY29udHJvbCB0byBzdGFydCB3b3JraW5n
IGluIFhlbiwgYXMgLSBvdGhlciB0aGFuCmZvciBDLXN0YXRlcyBvbiBoYWxmd2F5IG1vZGVybiBD
UFVzIC0gWGVuIGRlcGVuZHMgb24gRG9tMCB0bwp1cGxvYWQgcmVsZXZhbnQgZGF0YSBvYnRhaW5l
ZCBmcm9tIEFDUEkgdGFibGVzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
