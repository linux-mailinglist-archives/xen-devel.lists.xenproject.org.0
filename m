Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BC0FDF24
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:42:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVboU-0006e3-Ep; Fri, 15 Nov 2019 13:39:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVboT-0006dx-Cr
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:39:01 +0000
X-Inumbo-ID: 46d564e9-07ad-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 46d564e9-07ad-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:39:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A0B47AFFE;
 Fri, 15 Nov 2019 13:38:59 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-4-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6b1d6f7-25c6-bbc2-4745-a91dd833afaf@suse.com>
Date: Fri, 15 Nov 2019 14:39:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191021155718.28653-4-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 3/9] x86: drop
 hypervisor_cpuid_base
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiBUaGUgb25seSB1c2VyIGlzIFhl
biBzcGVjaWZpYyBjb2RlIGluIFBWIHNoaW0uIFdlIGNhbiB0aGVyZWZvcmUgZXhwb3J0Cj4gdGhl
IHZhcmlhYmxlIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0
aCwgYXQgdGhpcyBvY2Nhc2lvbiwgLi4uCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4v
eGVuLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCj4gQEAgLTM3LDcgKzM3
LDcgQEAKPiAgCj4gIGJvb2wgX19yZWFkX21vc3RseSB4ZW5fZ3Vlc3Q7Cj4gIAo+IC1zdGF0aWMg
X19yZWFkX21vc3RseSB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKPiArX19yZWFkX21vc3RseSB1
aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKCi4uLiB0aGUgX19yZWFkX21vc3RseSBtb3ZlZCB0byBp
dHMgbW9yZSBzdGFuZGFyZCBwbGFjZSAoYW4gZXhhbXBsZQppcyBpbiBjb250ZXh0KS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
