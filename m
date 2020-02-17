Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF7161C11
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 21:01:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3mXk-0000Lk-3v; Mon, 17 Feb 2020 19:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gA3l=4F=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1j3mXi-0000Le-ES
 for xen-devel@lists.xen.org; Mon, 17 Feb 2020 19:58:58 +0000
X-Inumbo-ID: ee8b5d30-51bf-11ea-aa99-bc764e2007e4
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee8b5d30-51bf-11ea-aa99-bc764e2007e4;
 Mon, 17 Feb 2020 19:58:57 +0000 (UTC)
Received: from [192.168.2.33] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id 9C728720108;
 Mon, 17 Feb 2020 20:01:14 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 9C728720108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1581987674;
 bh=LOCkT5tdSa35WqUpCP1SMatrj1Ejqw/a3PygCCHVbx0=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=Vg4gRSkfKUgkVlykMFM+ZkF2cCkHs7RgyAZjnPKNzC1MhPiLENCu53OxzQtg3pLDb
 n6oPjyhyulXdVEy6GjSah6NvwqQWW/+y8ENYOI7s8p6TATdgE63A+j/kBnOtk/WBSt
 RVPIQ73pQ2bIQdb3XgeUyKDRVWAPOJPPpR5MvAr4=
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
Date: Mon, 17 Feb 2020 11:58:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
Content-Language: en-US
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Alastair Browne <alastair.browne@memset.com>, Glen <glenbarney@gmail.com>,
 Tomas Mozes <hydrapolic@gmail.com>, PGNet Dev <pgnet.dev@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS83LzIwIDY6MjUgQU0sIEFsYXN0YWlyIEJyb3duZSB3cm90ZToKPiAKPiBDT05DTFVTSU9O
Cj4gCj4gU28gaW4gY29uY2x1c2lvbiwgdGhlIHRlc3RzIGluZGljYXRlIHRoYXQgY3JlZGl0MiBt
aWdodCBiZSB1bnN0YWJsZS4KPiAKPiBGb3IgdGhlIHRpbWUgYmVpbmcsIHdlIGFyZSB1c2luZyBj
cmVkaXQgYXMgdGhlIGNob3NlbiBzY2hlZHVsZXIuIFdlCj4gYXJlIGJvb3RpbmcgdGhlIGtlcm5l
bCB3aXRoIGEgcGFyYW1ldGVyICJzY2hlZD1jcmVkaXQiIHRvIGVuc3VyZSB0aGF0Cj4gdGhlIGNv
cnJlY3Qgc2NoZWR1bGVyIGlzIHVzZWQuCj4gCj4gQWZ0ZXIgdGhlIHRlc3RzLCB3ZSBkZWNpZGVk
IHRvIHN0aWNrIHdpdGggNC45LjAuOSBrZXJuZWwgYW5kIDQuMTIgWGVuCj4gZm9yIHByb2R1Y3Rp
b24gdXNlIHJ1bm5pbmcgY3JlZGl0MSBhcyB0aGUgZGVmYXVsdCBzY2hlZHVsZXIuCgpPbmUgcGVy
c29uIENDJ2VkIGFwcGVhcnMgdG8gYmUgaGF2aW5nIHRoZSBzYW1lIGV4cGVyaWVuY2UsIHdoZXJl
IHRoZSBjcmVkaXQyIHNjaGVkdWxlciBsZWFkcyB0byBsb2NrdXBzIChpbiB0aGlzIGNhc2UgaW4g
dGhlIGRvbVUsIG5vdCB0aGUgZG9tMCkgdW5kZXIgCnJlbGF0aXZlbHkgaGVhdnkgbG9hZC4gSXQg
c2VlbXMgcG9zc2libGUgdGhleSBtYXkgaGF2ZSB0aGUgc2FtZSByb290IGNhdXNlLgoKSSBkb24n
dCB0aGluayB0aGVyZSBhcmUsIGJ1dCBoYXZlIHRoZXJlIGJlZW4gYW55IHBhdGNoZXMgc2luY2Ug
dGhlIDQuMTMuMCByZWxlYXNlIHdoaWNoIG1pZ2h0IGhhdmUgZml4ZWQgcHJvYmxlbXMgd2l0aCBj
cmVkaXQgMiBzY2hlZHVsZXI/IElmIG5vdCwgCndoYXQgd291bGQgdGhlIG5leHQgc3RlcCBiZSB0
byBpc29sYXRpbmcgdGhlIHByb2JsZW0gLSBhIGRlYnVnIGJ1aWxkIG9mIFhlbiBvciBzb21ldGhp
bmcgZWxzZT8KCklmIHRoZXJlIGFyZSBubyBtZXJnZWQgb3IgcHJvcG9zZWQgZml4ZXMgc29vbiwg
aXQgbWF5IGJlIHdvcnRoIGNvbnNpZGVyaW5nIG1ha2luZyB0aGUgY3JlZGl0IHNjaGVkdWxlciB0
aGUgZGVmYXVsdCBhZ2FpbiB1bnRpbCBwcm9ibGVtcyB3aXRoIHRoZSAKY3JlZGl0MiBzY2hlZHVs
ZXIgYXJlIHJlc29sdmVkLgoKVGhhbmtzLCBTYXJhaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
