Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79B157149
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 09:58:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j14qI-0006el-HK; Mon, 10 Feb 2020 08:54:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j14qG-0006eY-UC
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 08:54:56 +0000
X-Inumbo-ID: 02261110-4be3-11ea-b493-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02261110-4be3-11ea-b493-12813bfff9fa;
 Mon, 10 Feb 2020 08:54:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA450ACCA;
 Mon, 10 Feb 2020 08:54:54 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200209230655.GA32524@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
Date: Mon, 10 Feb 2020 09:55:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200209230655.GA32524@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, zachm1996@gmail.com,
 Claudia <claudia1@disroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAwMDowNiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEhpLAo+IAo+IE11bHRpcGxlIFF1YmVzIHVzZXJzIGhhdmUgcmVwb3J0ZWQgaXNzdWVzIHdpdGgg
cmVzdW1pbmcgZnJvbSBTMyBvbiBBTUQKPiBzeXN0ZW1zIChSeXplbiAyNTAwVSwgUnl6ZW4gUHJv
IDM3MDBVLCBtYXliZSBtb3JlKS4gVGhlIGVycm9yIG1lc3NhZ2UKPiBpczoKPiAKPiAoWEVOKSBD
UFUwOiBjYXBbIDFdIGlzIDdlZDgzMjBiIChleHBlY3RlZCBmNmQ4MzIwYikKPiAKPiBJZiBJIHJl
YWQgaXQgcmlnaHQsIHRoaXMgaXM6Cj4gICAtIE9TWFNBVkU6IDAgLT4gMQo+ICAgLSBIWVBFUlZJ
U09SOiAxIC0+IDAKPiAKPiBDb21tZW50aW5nIG91dCB0aGUgcGFuaWMgb24gYSBmYWlsZWQgcmVj
aGVja19jcHVfZmVhdHVyZXMoKSBpbiBwb3dlci5jCj4gbWFrZXMgdGhlIHN5c3RlbSB3b3JrIGFm
dGVyIHJlc3VtZSwgcmVwb3J0ZWRseSBzdGFibGUuIEJ1dCB0aGF0IGRvZXNuJ3QKPiBzb3VuZHMg
bGlrZSBhIGdvb2QgaWRlYSBnZW5lcmFsbHkuCj4gCj4gSXMgdGhpcyBkaWZmZXJlbmNlIGEgWGVu
IGZhdWx0IChzb21lIG1pc3NpbmcgTVNSIC8gb3RoZXIgcmVnaXN0ZXIKPiByZXN0b3JlIG9uIHJl
c3VtZSk/IE9yIEJJT1MgdmVuZG9yIC8gQU1ELCB0aGF0IGNvdWxkIGJlIHdvcmtlZCBhcm91bmQg
aW4KPiBYZW4/CgpUaGUgdHJhbnNpdGlvbiBvZiB0aGUgSFlQRVJWSVNPUiBiaXQgaXMgZGVmaW5p
dGVseSBhIFhlbiBpc3N1ZSwKd2l0aCBBbmRyZXcgaGF2aW5nIHNlbnQgYSBwYXRjaCBhbHJlYWR5
IChpaXJjKS4gVGhlIE9TWFNBVkUgcGFydAppcyBhIGxpdHRsZSBtb3JlIHN1cnByaXNpbmcsIGFz
IEkgd291bGRuJ3QgdGhpbmsgYmVoYXZpb3IgdGhlcmUKc2hvdWxkIGRpZmZlciBiZXR3ZWVuIElu
dGVsIGFuZCBBTUQuIEkgdGFrZSB5b3VyIHJlcG9ydCB0aG91Z2gKdG8gaW1wbHkgdGhhdCB5b3Ug
c2VlIHRoZSBpc3N1ZSBvbiBBTUQgc3lzdGVtcyBvbmx5PyAoWW91IGFsc28KZG9uJ3QgbWVudGlv
biB0aGUgWGVuIHZlcnNpb24sIHdoaWNoIG1heSBtYXR0ZXIgYXMgdGhlcmUgbWF5CmhhdmUgYmVl
biBvcmRlcmluZyBjaGFuZ2VzIG9mIHdoZW4gdGhlIGZ1bGwgb3JpZ2luYWwgQ1I0IHZhbHVlCmdl
dHMgcmVzdG9yZWQuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
