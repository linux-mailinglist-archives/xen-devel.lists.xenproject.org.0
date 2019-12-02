Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 468D510EB8F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 15:31:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibmgc-0000Ip-Dn; Mon, 02 Dec 2019 14:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xhDU=ZY=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1ibmgb-0000Ik-7e
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 14:28:25 +0000
X-Inumbo-ID: ff54c40e-150f-11ea-83b8-bc764e2007e4
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff54c40e-150f-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com;
 s=alpha; 
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
 bh=gM3A+L5YwADX4qeONhIZD6EOS4kXXx5rni/2OsSCE08=; 
 b=d2JCPbCBLB9C3b7a9bCYUamBZSGLGA0vjRXYAjMawYzI7ywJWw/2M8h1tJhMnTEpLYi4B5cOY3XosPrhkLPdRHqVEHKw6oo2oiR/EiS2LoLKDng2C2q8qy1u4HLWtt7/fdVvd4IKRXiXBvwdsh+iZLSY/NFGkHC7cZsJ90CGA8QoPR2acj3nGprwbYHpeJTHgwhIxcjAgV+YEahYK/jvomvWdqweascMMxQAS5bfiwd+k93BhdrxCWgEZ1IEt7+NjudmsCtNSpOvcfiBAYfSXJT25frgzepiKYO5zW+ayKovypXq5tCk+GmnqVPXi62OK9ZsaqGIb76FNYbpik9lTA==;
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>)
 id 1ibmgY-0005KM-6y; Mon, 02 Dec 2019 14:28:22 +0000
Date: Mon, 2 Dec 2019 14:28:22 +0000
From: Andy Smith <andy@strugglers.net>
To: Jeremi Piotrowski <jeremi.piotrowski@gmail.com>
Message-ID: <20191202142822.GY32576@bitfolk.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
 <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
 <20191201174714.GA13968@gentoo-tp.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191201174714.GA13968@gentoo-tp.home>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Pry Mar <pryorm09@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiBTdW4sIERlYyAwMSwgMjAxOSBhdCAwNjo0NzoxNFBNICswMTAwLCBKZXJlbWkg
UGlvdHJvd3NraSB3cm90ZToKPiBPbiBUaHUsIE9jdCAyNCwgMjAxOSBhdCAxMDoxMjoxOUFNICsw
MjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IFdvdWxkIHlvdSBwbGVhc2UgaW5jcmVhc2UgdmVy
Ym9zaXR5ICh4bCAtdnZ2IGNyZWF0ZSAuLi4pIHN1Y2ggdGhhdCB3ZQo+ID4gY2FuIHNlZSB3aGF0
IGV4YWN0bHkgdGhlIGRlY29tcHJlc3Npb24gY29kZSBkb2Vzbid0IGxpa2UgYWJvdXQgdGhpcwoK
W+KApl0KCj4gSSBzdHVtYmxlZCBhY3Jvc3MgdGhlIHNhbWUgaXNzdWUKCkluIGNhc2UgaXQgaXMg
dXNlZnVsLCBJIHdhcyByZWNlbnRseSBjaGF0dGluZyB0byBQcnkgTWFyIG9uIElSQwphYm91dCB0
aGlzIGlzc3VlLiBJdCBhbHNvIGFmZmVjdHMgdGhlIFVidW50dSAyMC4wNCBrZXJuZWxzIChib3Ro
Cmluc3RhbGxlciBhbmQgT1MgcGFja2FnZWQpIHdoaWNoIGlzIG5vIHN1cnByaXNlIHNpbmNlIGl0
IHNlZW1zIHRoZXkKc3dpdGNoZWQgdG8gTFo0IGNvbXByZXNzaW9uIGZyb20gMTkuMTAuCgpQcnkg
TWFyIHdhcyBhYmxlIHRvIG1ha2UgaXQgYm9vdCB1bmRlciBYZW4gUFYgYnkgbWFudWFsbHkKdW5j
b21wcmVzc2luZyB0aGUgdm1saW51eiBmaXJzdC4KCkkgaGF2ZSBiZWVuIG1lYW5pbmcgdG8gdGFr
ZSBhIHJlY2VudCBEZWJpYW4ga2VybmVsIG9yIG1haW5saW5lCmtlcm5lbCBhbmQgZW5hYmxlIHRo
ZSBMWjQgY29tcHJlc3Npb24gb3B0aW9ucyB0byBzZWUgaWYgaXQgaXMKcmVwcm9kdWNpYmxlIG91
dHNpZGUgb2YgVWJ1bnR1LCBidXQgaGF2ZW4ndCBmb3VuZCB0aW1lIHlldC4KClRoYW5rcywKQW5k
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
