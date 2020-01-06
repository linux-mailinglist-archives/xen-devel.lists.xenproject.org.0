Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39844131641
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 17:43:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioVQl-0002Pf-Vw; Mon, 06 Jan 2020 16:40:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioVQk-0002PZ-Bu
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 16:40:38 +0000
X-Inumbo-ID: 4477f412-30a3-11ea-ab34-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4477f412-30a3-11ea-ab34-12813bfff9fa;
 Mon, 06 Jan 2020 16:40:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E889CADE7;
 Mon,  6 Jan 2020 16:40:36 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
Message-ID: <9459d526-a971-0978-c449-b3541056ea38@suse.com>
Date: Mon, 6 Jan 2020 17:41:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6f167053-38dc-19b5-a873-321d978e9a59@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/8] x86emul: further work
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNzozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gU29tZSBvZiB0aGUgbGF0
ZXIgcGF0Y2hlcyBhcmUgUkZDLCBmb3IgdmFyeWluZyByZWFzb25zIChzZWUgdGhlcmUpLgo+IAo+
IDE6IHg4NjogZGV0ZXJtaW5lIEhBVkVfQVNfKiBqdXN0IG9uY2UKPiAyOiB4ODY6IG1vdmUgYmFj
ayBjbGFuZyBubyBpbnRlZ3JhdGVkIGFzc2VtYmxlciB0ZXN0cwo+IDM6IHg4NmVtdWw6IHN1cHBv
cnQgTU9WRElSSSBpbnNuCj4gNDogeDg2ZW11bDogc3VwcG9ydCBNT1ZESVI2NEIgaW5zbgo+IDU6
IHg4Ni9IVk06IHNjYWxlIE1QRVJGIHZhbHVlcyByZXBvcnRlZCB0byBndWVzdHMgKG9uIEFNRCkK
PiA2OiB4ODZlbXVsOiBzdXBwb3J0IFJEUFJVCj4gNzogeDg2L0hWTTogZG9uJ3QgbmVlZGxlc3Ns
eSBpbnRlcmNlcHQgQVBFUkYvTVBFUkYvVFNDIE1TUiByZWFkcwo+IDg6IHg4NmVtdWw6IHN1cHBv
cnQgTUNPTU1JVAoKQXJnaCAtIGFsbCBvZiB0aGlzIHdhcyBtZWFudCBvdCBiZSB2NCwgbm90IChh
Z2FpbikgdjMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
