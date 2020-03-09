Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBD17E330
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 16:12:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBK31-0004RG-De; Mon, 09 Mar 2020 15:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBK30-0004RA-HA
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 15:10:26 +0000
X-Inumbo-ID: 1a030ad6-6218-11ea-ac53-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a030ad6-6218-11ea-ac53-12813bfff9fa;
 Mon, 09 Mar 2020 15:10:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7616AC4A;
 Mon,  9 Mar 2020 15:10:23 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
 <CABfawhnrjsGBsAEOw6p7Je-BuZrtchNSvxTyYJTQXC5G6tMgmQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83f4bde5-4494-cb0f-4204-79822bcc2e8f@suse.com>
Date: Mon, 9 Mar 2020 16:10:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnrjsGBsAEOw6p7Je-BuZrtchNSvxTyYJTQXC5G6tMgmQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxNjowNywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgTWFy
IDksIDIwMjAgYXQgNTo0OSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBUaGUgY29tbW9uIGhlYWRlciBkb2Vzbid0IGl0c2VsZiBuZWVkIHRvIGluY2x1ZGUg
cHVibGljL3ZtX2V2ZW50Lmggbm9yCj4+IHB1YmxpYy9tZW1vcnkuaC4gRHJvcCB0aGVpciBpbmNs
dXNpb24uIFRoaXMgcmVxdWlyZXMgdXNpbmcgdGhlIG5vbi0KPj4gdHlwZWRlZiBuYW1lcyBpbiB0
d28gcHJvdG90eXBlcyBhbmQgYW4gaW5saW5lIGZ1bmN0aW9uOyBieSBub3QgY2hhbmdpbmcKPj4g
dGhlIGNhbGxlcnMgYW5kIGZ1bmN0aW9uIGRlZmluaXRpb25zIGF0IHRoZSBzYW1lIHRpbWUgaXQn
bGwgcmVtYWluCj4+IGNlcnRhaW4gdGhhdCB0aGUgYnVpbGQgd291bGQgZmFpbCBpZiB0aGUgdHlw
ZWRlZiBpdHNlbGYgd2FzIGNoYW5nZWQuCj4gCj4gSnVzdCBjdXJpb3VzLCB3aGF0J3MgdGhlIGJl
bmVmaXQgb2YgZG9pbmcgdGhpcz8KCkxlc3MgZGVwZW5kZW5jaWVzIHRoYXQgKGFsbW9zdCkgZXZl
cnkgQ1UgZ2V0cywgYW5kIGhlbmNlIHN0YXRpc3RpY2FsbHkKbGVzcyByZWJ1aWxkcyBvZiAoYWxt
b3N0KSBldmVyeXRoaW5nIHdoZW4gb25seSBhIHJhdGhlciBzcGVjaWFsIHB1cnBvc2UKaGVhZGVy
IGZpbGUgY2hhbmdlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
