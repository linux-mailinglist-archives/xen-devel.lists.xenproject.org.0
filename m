Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F610D583
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 13:11:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaf5m-0003Fp-2R; Fri, 29 Nov 2019 12:09:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaf5k-0003Fk-EX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 12:09:44 +0000
X-Inumbo-ID: 2080fa2e-12a1-11ea-a3e3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2080fa2e-12a1-11ea-a3e3-12813bfff9fa;
 Fri, 29 Nov 2019 12:09:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8797AD72;
 Fri, 29 Nov 2019 12:09:42 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191125172213.1904-1-roger.pau@citrix.com>
 <20191125172213.1904-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f77f970-9b3b-2878-f1e7-6b87c9dfa25e@suse.com>
Date: Fri, 29 Nov 2019 13:09:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125172213.1904-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] x86/pvshim: do not enable global pages
 in shim mode
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxODoyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
Z2xvYmFsIHBhZ2VzIGEgZnVsbCB0bGIgZmx1c2ggY2FuIG9ubHkgYmUgcGVyZm9ybWVkIGJ5Cj4g
dG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1aXRlIGV4cGVu
c2l2ZSBpbiB0ZXJtcwo+IG9mIHBlcmZvcm1hbmNlIHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZC4g
VGhpcyBpcyBzcGVjaWFsbHkgcmVsZXZhbnQgb24KPiBBTUQgaGFyZHdhcmUsIHdoaWNoIGRvZXNu
J3QgaGF2ZSB0aGUgYWJpbGl0eSB0byBkbyBzZWxlY3RpdmUgQ1I0Cj4gdHJhcHBpbmcsIGJ1dCBj
YW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwo+IGh5cGVydmlz
b3IgYWxzbyB0cmFwcyBvbiBhY2Nlc3NlcyB0byB0aGUgUEdFIENSNCBiaXQuCj4gCj4gSW4gb3Jk
ZXIgdG8gYXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBw
YWdlcwo+IHdoZW4gcnVubmluZyBpbiBzaGltIG1vZGUuIE5vdGUgdGhpcyBpcyBkb25lIHdoZW4g
cnVubmluZyBvbiBib3RoCj4gSW50ZWwgb3IgQU1EIGhhcmR3YXJlLCBzaW5jZSBvbGRlciB2ZXJz
aW9ucyBvZiBYZW4gY2FwYWJsZSBvZiBydW5uaW5nCj4gdGhlIHNoaW0gZG9uJ3QgbWFrZSB1c2Ug
b2YgSW50ZWwgc2VsZWN0aXZlIENSNCB0cmFwcGluZyBmZWF0dXJlIGFuZAo+IHdpbGwgdm1leGl0
IG9uIGV2ZXJ5IGFjY2VzcyB0byBDUjQuCgpTbyBoZXJlIHlvdSBzYXkgeW91IGRvIHRoaXMgdW5p
Zm9ybWx5IGJlY2F1c2Ugb2Ygb2xkZXIgWGVuLgpXaGF0IGFib3V0IG5ld2VyIFhlbj8gSXMgdGhp
cyBzdGlsbCBhIHdpbiAob3IgYXQgbGVhc3Qgbm90IGEKbG9zcykgdGhlcmU/IEluZGVwZW5kZW50
IG9mIHVuZGVybHlpbmcgaGFyZHdhcmU/IEluIGNhc2Ugb2YKYW55IGtpbmQgb2YgZG91YnQgSSB0
aGluayB0aGlzIHdvdWxkIHdhbnQgdG8gYmUgY29tbWFuZCBsaW5lCmNvbnRyb2xsYWJsZS4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
