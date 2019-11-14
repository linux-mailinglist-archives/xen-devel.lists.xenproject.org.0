Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5DFCAD1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 17:37:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVI5I-0004EG-5h; Thu, 14 Nov 2019 16:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVI5G-0004EB-TM
 for xen-devel@lists.xen.org; Thu, 14 Nov 2019 16:35:02 +0000
X-Inumbo-ID: b34c681d-06fc-11ea-a250-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b34c681d-06fc-11ea-a250-12813bfff9fa;
 Thu, 14 Nov 2019 16:35:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EAA8BADBB;
 Thu, 14 Nov 2019 16:34:59 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
Date: Thu, 14 Nov 2019 17:35:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxNzowNywgUmlzaGkgd3JvdGU6Cj4gSW4gc29tZSBvZiBvdXIgaG9zdHMs
IFhlbiBpcyBub3QgY29ycmVjdGx5IGV4cG9zaW5nIHByb2Nlc3NvciB0aGVybWFsCj4gY2FwYWJp
bGl0aWVzIHRvIERvbTAuCj4gUGxlYXNlIHJlZmVyOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5v
cmcvc2hvd19idWcuY2dpP2lkPTIwNTM0Nwo+IAo+IFRoZSBmbGFnCj4gLyogVGhlcm1hbCBhbmQg
UG93ZXIgTWFuYWdlbWVudCBMZWFmLCBDUFVJRCBsZXZlbCAweDAwMDAwMDA2IChFQVgpLCB3b3Jk
IDE0ICovCj4gWDg2X0ZFQVRVUkVfRFRIRVJNICgxNCozMisgMCkKPiAKPiBpcyByZXR1cm5lZCAw
IHZpYSBQVk9QX1ZDQUxMNCB2cyByZXR1cm5zIDEgdmlhIG5hdGl2ZV9jcHVpZCgpIGNhbGwgZnJv
bSBEb20wLgo+IAo+IFNhbXBsZSBvdXRwdXQgdmlhIFBWQ0FMTCB2cyBOYXRpdmUgY2FsbC4KPiBb
NjMyOTEuNjg4NzU1XSBjcHVpZF9lYXggNiA6ICBhIDAKPiBbNjMyOTEuNjg4NzU5XSBuYXRpdmVf
Y3B1aWQgOiBhIDc3Cj4gCj4gSXMgdGhpcyBhIGJ1ZyBvciBuZWVkcyBzb21lIHNwZWNpYWwgZmVh
dHVyZSB0byBiZSBlbmFibGVkIGZyb20gWGVuIGNvbW1hbmQgbGluZT8KCkV4cG9zaW5nIHRoaXMg
dG8gZ3Vlc3RzIChpbmNsdWRpbmcgRG9tMCkgd291bGQgaW1wbHkgcHJvcGVybHkKdmlydHVhbGl6
aW5nIHRoZSByZXNwZWN0aXZlIGJlaGF2aW9yLiBJbgp4ZW4vYXJjaC94ODYvY3B1aWQuYzpyZWNh
bGN1bGF0ZV9taXNjKCkgd2Ugc3BlY2lmaWNhbGx5IGhhdmUKCiAgICBwLT5iYXNpYy5yYXdbMHg2
XSA9IEVNUFRZX0xFQUY7IC8qIFRoZXJtL1Bvd2VyIG5vdCBleHBvc2VkIHRvIGd1ZXN0cy4gKi8K
CklmIHlvdSB3YW50ZWQgdGhpcyBleHBvc2VkLCB5b3UnZCBmaXJzdCBvZiBhbGwgbmVlZCB0byBj
b21lIHVwCndpdGggYSBzYW5lIHZpcnR1YWxpemF0aW9uIG1vZGVsIG9mIHRoaXMgZnVuY3Rpb25h
bGl0eS4gU2ltcGx5CmV4cG9zaW5nIHRoZSBDUFVJRCBiaXRzIGlzIG5vdCBnb2luZyB0byBiZSBh
biBvcHRpb24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
