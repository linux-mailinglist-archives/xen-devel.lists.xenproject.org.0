Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECBA7F5C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:29:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5RYV-0003Qh-T3; Wed, 04 Sep 2019 09:26:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5RYU-0003QX-Gn
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:26:22 +0000
X-Inumbo-ID: 0d879adf-cef6-11e9-abae-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d879adf-cef6-11e9-abae-12813bfff9fa;
 Wed, 04 Sep 2019 09:26:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1D55B66B;
 Wed,  4 Sep 2019 09:26:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <1fc41c75-7e6d-5a34-c500-8f769e4374bb@suse.com>
 <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <435d5ee1-23a8-576a-22dd-0ed822430c79@suse.com>
Date: Wed, 4 Sep 2019 11:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86emul: support RDPRU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNDozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2NwdWlkLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4gQEAgLTU0NSw2
ICs1NDUsMTEgQEAgdm9pZCByZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koc3RydWN0IGRvbQo+PiAg
Cj4+ICAgICAgcC0+ZXh0ZC5tYXhsaW5hZGRyID0gcC0+ZXh0ZC5sbSA/IDQ4IDogMzI7Cj4+ICAK
Pj4gKyAgICBpZiAoIHAtPmV4dGQucmRwcnUgKQo+PiArICAgICAgICBwLT5leHRkLnJkcHJ1X21h
eCA9IG1pbihwLT5leHRkLnJkcHJ1X21heCwgbWF4LT5leHRkLnJkcHJ1X21heCk7Cj4+ICsgICAg
ZWxzZQo+PiArICAgICAgICBwLT5leHRkLnJkcHJ1X21heCA9IDA7Cj4+ICsKPj4gICAgICByZWNh
bGN1bGF0ZV94c3RhdGUocCk7Cj4+ICAgICAgcmVjYWxjdWxhdGVfbWlzYyhwKTsKPiAKPiBUaGUg
Q1BVSUQgbG9naWMgbmVlZHMgcXVpdGUgYSBiaXQgbW9yZSB0aGFuIHRoaXMsIGFuZCB0byBiZSBz
YWZlIG9uCj4gbWlncmF0ZS4gIEZvciBvbmUsIHJlY2FsY3VsYXRlX3hzdGF0ZSgpIHVuaWxhdGVy
YWxseSBjbG9iYmVycyB0aGlzIHRvIDAuCgpJJ3ZlIGxvb2tlZCBhZ2FpbiAtIHJlY2FsY3VsYXRl
X21pc2MoKSBjbG9iYmVycyAuYSwgLmIsIGFuZCAuYywKYnV0IG5vdCAuZCBhZmFpY3MuIEFueXdh
eSwganVzdCBhcyBhIG5vdGUsIGFzIHlvdSd2ZSBzYWlkIHlvdSdkCnRha2UgY2FyZSBvZiB0aGlz
IGFueXdheSwgYW5kIEknbGwgcmUtYmFzZSBhZnRlcndhcmRzLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
