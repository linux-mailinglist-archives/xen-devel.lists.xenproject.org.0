Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E4612F850
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:37:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMB8-0001MF-Qj; Fri, 03 Jan 2020 12:35:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inMB6-0001M7-K1
 for xen-devel@lists.xen.org; Fri, 03 Jan 2020 12:35:44 +0000
X-Inumbo-ID: 8ebac57a-2e25-11ea-a472-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ebac57a-2e25-11ea-a472-12813bfff9fa;
 Fri, 03 Jan 2020 12:35:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8FE77AE46;
 Fri,  3 Jan 2020 12:35:42 +0000 (UTC)
To: Pry Mar <pryorm09@gmail.com>
References: <CAHnBbQ8a3Wc1Hd0ONkR3Jtczans2-7cp7b_GyF80XSzF2J6nUw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <94765c91-a8bf-5a71-088e-732c55a55ef0@suse.com>
Date: Fri, 3 Jan 2020 13:36:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHnBbQ8a3Wc1Hd0ONkR3Jtczans2-7cp7b_GyF80XSzF2J6nUw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] recent hypervisor in recent ubuntu (19.10+)
 resets host and legacy boot never starts, EFI works
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
Cc: Stefan Bader <stefan.bader@canonical.com>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTIuMjAxOSAwMDo1NywgUHJ5IE1hciB3cm90ZToKPiBSZWZlcmVuY2luZyB0aGlzIHJl
cG9ydCBhZ2FpbnN0IGtlcm5lbC01LjMgYW5kIHhlbi00LjkuMjoKPiBodHRwczovL2J1Z3MubGF1
bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS94ZW4vK2J1Zy8xODUxMDkxCgpUaGUgcmVwb3J0IHRo
ZXJlIGludm9sdmVzIHNlZWluZyBhICJEZWNvZGluZyBmYWlsZWQiIG1lc3NhZ2UsCndoaWNoIGFj
Y29yZGluZyB0byBjb21taXQgMmQ3NTcyY2RmYTRkIHlvdSd2ZSBzdWNjZXNzZnVsbHkKdGVzdGVk
IHRvIG5vIGxvbmdlciBiZSBhbiBpc3N1ZSB3aXRoIDQuMTMuIEJvdCBhc3BlY3RzIGFyZSBpbgpj
b250cmFzdCB0byAuLi4KCj4gSSBzZWUgdGhlIHNhbWUgYmVoYXZpb3Igd2l0aCB0aGUgaHlwZXJ2
aXNvciBmcm9tIHhlbi00LjEyLnggYW5kIHhlbi00LjEzLjAuCj4gVXNpbmcgbGVnYWN5IGJpb3Ms
IGJvb3QgbmV2ZXIgc3RhcnRzIGFuZCBob3N0IHJlc2V0cy4KCi4uLiB0aGlzIHN0YXRlbWVudCwg
bm8gbWF0dGVyIGhvdyBJIGludGVycHJldCAiYm9vdCBuZXZlcgpzdGFydHMiLgoKPiBBZGRpbmcg
bW9yZToKPiBJZiBJIGNvcHkgaW50byBGb2NhbCAvYm9vdCB0aGUgaHlwZXJ2aXNvciBidWlsdCBp
biBCdXN0ZXIgb3IgdWIxOS4wNCwKPiB1c2luZyB0aGUgc2FtZSBkL3J1bGVzKiwgZXZlcnl0aGlu
ZyB3b3Jrcy4KPiAKPiBJJ3ZlIGJ1aWx0IHRoZSB4ZW4gaHlwZXJ2aXNvciB3aXRoIGdjYzggb3Ig
Z2NjOSwgd2l0aCBvciB3aXRob3V0IFBJRSwKPiBhbmQgYmVoYXZpb3IgaXMgdGhlIHNhbWUuCj4g
Cj4gSG93ZXZlciwgSSd2ZSBub3RpY2VkIHRoYXQgYWxsIGh5cGVydmlzb3JzIGhhdmUgMyBMWjQg
YmxvYnMuIFRoZSAyCj4gd29ya2luZyB2ZXJzaW9ucyBoYXZlIHRoZSBzYW1lIGZpcnN0IGJsb2Ig
c2l6ZSBhdCAoMEYgODUgNUIgMDEpLAo+IHNsaWdodGx5IHNtYWxsZXIgdGhhbiB0aGUgRm9jYWwg
YmxvYiBzaXplICgwRiA4NSA1QyAwMSkuCgpJJ20gdW5hd2FyZSBvZiBoeXBlcnZpc29yIChYZW4p
IGJpbmFyaWVzIGhhdmluZyBhbnkgTFo0IGJsb2JzCmVtYmVkZGVkIGludG8gdGhlbS4KCk9uIHRo
ZSB3aG9sZSBJJ20gYWZyYWlkIEkgY2FuJ3QgcmVhbGx5IHNlZSB3aGF0IChpZiBhbnkpIHByb2Js
ZW0KeW91IHJlcG9ydC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
