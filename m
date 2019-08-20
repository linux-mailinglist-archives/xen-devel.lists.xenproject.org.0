Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EA96AC6
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 22:40:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0ArQ-0002l8-SF; Tue, 20 Aug 2019 20:36:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YXB6=WQ=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1i0ArP-0002l3-3U
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 20:36:07 +0000
X-Inumbo-ID: 210a2fa8-c38a-11e9-adba-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 210a2fa8-c38a-11e9-adba-12813bfff9fa;
 Tue, 20 Aug 2019 20:36:04 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 06FE2160060
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 22:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1566333363; bh=kJXA1Q3sfs/ZESJp0vnnQbwk8WDjFy/LOC8kO96knX8=;
 h=Subject:To:From:Date:From;
 b=Zosrz22317RxHvHsrWnw5QT0Lhp5yEVfKwtLwbnBncMSSxAYq4GUIoYbDHX3x3PJv
 yT2eO8gWxFpCLhFGrCgBJN1LlUJbMjx/oB7xW9kew6TI7xPOkv0GiiY3LYQhftZ1LX
 k1QbC5vMin8lNUmV9EDjxk4cNDFy1nJojSEh3t1/m7WXg4vn7V1fLWfrn1In/FJ/60
 BW2vxiQKxaBf9Rv3iyJGsQeTBgEjoFedhTrgdxQcFnqWhapNByDUb8b5h6scExJ/id
 +geeOWm99N4Y/mkY7uuRcmSe+G6nAofKThc130a/OGiEjA9W+uaoJbuNBjiTCF982r
 kjQSvgw8nVZPw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46CjHP4GT6z6tmB;
 Tue, 20 Aug 2019 22:36:01 +0200 (CEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Paul.Durrant@citrix.com
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
Date: Tue, 20 Aug 2019 22:36:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAyMDoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gWGVuIHZlcnNpb24g
NC4xMC4yLiBkb20wIGtlcm5lbCA0LjEzLjE2LiBUaGUgQklPUyB2ZXJzaW9uIGlzIHVuY2hhbmdl
ZAo+PiBmcm9tIDI3MDBYICh3b3JraW5nKSB0byAzNzAwWCAoY3Jhc2hpbmcpLgo+IFNvIHlvdSd2
ZSBkb25lIGEgWmVuIHYxID0+IFplbiB2MiBDUFUgdXBncmFkZSBhbmQgYW4gZXhpc3Rpbmcgc3lz
dGVtPwoKV2l0aCAiZXhpc3Rpbmcgc3lzdGVtIiB5b3UgbWVhbiB0aGUgV2luZG93cyBpbnN0YWxs
YXRpb24/IFllcywgYnV0IGl0IGlzIApub3QgcmVsZXZhbnQuIFRoZSBzYW1lIEJTT0RzIGhhcHBl
biBpZiB5b3UgYm9vdCB0aGUgSFZNIHdpdGgganVzdCB0aGUgCmlzbyBpbnN0YWxsYXRpb24gbWVk
aXVtIGFuZCBubyBkaXNrcy4KCj4+IElzIGl0IGEga25vd24gcHJvYmxlbT8gRGlkIHNvbWVvbmUg
dGVzdCB0aGUgbmV3IEVQWUNzPwo+IFRoaXMgbG9va3MgZmFtaWxpYXIsIGFuZCBpcyBzdGlsbCBz
b21ld2hlcmUgb24gbXkgVE9ETyBsaXN0LgoKRG8geW91IGFscmVhZHkga25vdyB0aGUgcmVhc29u
IG9yIGlzIHRoYXQgc3RpbGwgdG8gaW52ZXN0aWdhdGU/Cgo+IERvZXMgYm9vdGluZyB3aXRoIGEg
c2luZ2xlIHZDUFUgd29yaz8KCk51bWJlciBvZiB2Q1BVcyBtYWtlIG5vIGRpZmZlcmVuY2UKClJl
Z2FyZHMgQW5kcmVhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
