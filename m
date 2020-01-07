Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA13132BEC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:55:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ios67-0000bN-Ce; Tue, 07 Jan 2020 16:52:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ios65-0000bI-S1
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:52:49 +0000
X-Inumbo-ID: 225fa64c-316e-11ea-ac6f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 225fa64c-316e-11ea-ac6f-12813bfff9fa;
 Tue, 07 Jan 2020 16:52:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B265BAD29;
 Tue,  7 Jan 2020 16:52:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0a29ae9-ae4b-f6bd-ed3b-66a810cfcde6@suse.com>
Date: Tue, 7 Jan 2020 17:52:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106155423.9508-7-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] x86/boot: Drop INVALID_VCPU
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBOb3cgdGhhdCBOVUxM
IHdpbGwgZmF1bHQgYXQgYm9vdCwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgYSBzcGVjaWFsIGNvbnN0
YW50IHRvCj4gc2lnbmlmeSAiY3VycmVudCBub3Qgc2V0IHVwIHlldCIuCgpNaW5kIG1ha2luZyB0
aGlzICIuLi4gbm8gc3Ryb25nIG5lZWQgLi4uIj8gVGhlIGJlbmVmaXQgb2YgYW4gZWFzaWx5CnJl
Y29nbml6YWJsZSB2YWx1ZSBnb2VzIGF3YXksIGJ1dCBJIGd1ZXNzIHdlJ2xsIGJlIGZpbmUgd2l0
aG91dC4KSU9XIEknbSBub3QgbWVhbmluZyB0byBvYmplY3QuCgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiBAQCAtNzA1LDcgKzcwNSw3
IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3Ap
Cj4gICAgICAvKiBDcml0aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZhdWx0
IGlzIGRlYWRseSEgKi8KPiAgCj4gICAgICBzZXRfcHJvY2Vzc29yX2lkKDApOwo+IC0gICAgc2V0
X2N1cnJlbnQoSU5WQUxJRF9WQ1BVKTsgLyogZGVidWcgc2FuaXR5LiAqLwo+ICsgICAgc2V0X2N1
cnJlbnQoTlVMTCk7IC8qIGRlYnVnIHNhbml0eS4gKi8KPiAgICAgIGlkbGVfdmNwdVswXSA9IGN1
cnJlbnQ7CgpJcyBhbnkgb2YgdGhpcyBhY3R1YWxseSBjaGFuZ2luZyBhbnkgdmFsdWUgaW4gbWVt
b3J5PyBJLmUuIHdvdWxkbid0Cml0IGJlIGJldHRlciB0byBkZWxldGUgYWxsIG9mIHRoaXMsIG9y
IGxlYXZlIGl0IGluIGEgY29tbWVudCBmb3IKZG9jdW1lbnRhdGlvbiBwdXJwb3Nlcz8gKEknbSB3
aWxsaW5nIHRvIGFjayB0aGUgcGF0Y2ggYXMgaXMsIGJ1dCBJJ2QKbGlrZSB0aGlzIGFsdGVybmF0
aXZlIHRvIGF0IGxlYXN0IGJlIGNvbnNpZGVyZWQuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
