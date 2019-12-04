Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D71126D3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 10:16:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icQiZ-0000po-1M; Wed, 04 Dec 2019 09:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icQiY-0000pi-5V
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 09:13:06 +0000
X-Inumbo-ID: 4734e8aa-1676-11ea-81fb-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4734e8aa-1676-11ea-81fb-12813bfff9fa;
 Wed, 04 Dec 2019 09:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3711AAD18;
 Wed,  4 Dec 2019 09:13:04 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com
References: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5da83aae-ad4d-a6ef-c5ee-ec0b7e92daf4@suse.com>
Date: Wed, 4 Dec 2019 10:13:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575417367-12822-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/AMD: unbreak CPU hotplug on AMD
 systems without RstrFpErrPtrs
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, wl@xen.org,
 roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAwMDo1NiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSWYgdGhlIGZlYXR1
cmUgaXMgbm90IHByZXNlbnQgWGVuIHdpbGwgdHJ5IHRvIGZvcmNlIFg4Nl9CVUdfRlBVX1BUUlMK
PiBmZWF0dXJlIGF0IENQVSBpZGVudGlmaWNhdGlvbiB0aW1lLiBUaGlzIGlzIGVzcGVjaWFsbHkg
bm90aWNlYWJsZSBpbgo+IFBWLXNoaW0gdGhhdCB1c3VhbGx5IGhvdHBsdWdzIGl0cyB2Q1BVcy4g
V2UgZWl0aGVyIG5lZWQgdG8gcmVzdHJpY3QgdGhpcwo+IGFjdGlvbiBmb3IgYm9vdCBDUFUgb25s
eSBvciBhbGxvdyBzZWNvbmRhcnkgQ1BVcyB0byBtb2RpZnkKPiBmb3JjZWQgQ1BVIGNhcGFiaWxp
dGllcyBhdCBydW50aW1lLiBDaG9vc2UgdGhlIGZvcm1lciBzaW5jZSBtb2RpZnlpbmcKPiBmb3Jj
ZWQgY2FwYWJpbGl0aWVzIG91dCBvZiBib290IHBhdGggbGVhdmVzIHRoZSBzeXN0ZW0gaW4gcG90
ZW50aWFsbHkKPiBpbmNvbnNpc3RlbnQgc3RhdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKQW5kcmV3LAoKcGxlYXNlIGNsYXJpZnkgZXhwbGlj
aXRseSB3aGV0aGVyIHlvdSdyZSBva2F5IHdpdGggdGhpcyBnb2luZyBpbgpkZXNwaXRlIHlvdXIg
ZWFybGllciBvYmplY3Rpb24sIG9yIHdoZXRoZXIgeW91IHdhbnQgdXMgdG8gZm9sbG93CnRoZSBv
dXRsaW5lZCBhbHRlcm5hdGl2ZSByb3V0ZSAob3IgeWV0IHNvbWUgZGlmZmVyZW50IGFwcHJvYWNo
KS4KRkFPRCBJIGNvbnRpbnVlIHRvIGluc2lzdCB0aGF0IHRoZSBfX2luaXQgbm90IGJlIGRyb3Bw
ZWQgZnJvbSB0aGUKdHdvIGZ1bmN0aW9ucyBpbiBxdWVzdGlvbi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
