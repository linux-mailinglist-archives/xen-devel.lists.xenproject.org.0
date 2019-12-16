Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05353120605
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:43:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpfc-0004zG-8B; Mon, 16 Dec 2019 12:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igpfa-0004zB-3I
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:40:14 +0000
X-Inumbo-ID: 33f2e12c-2001-11ea-939c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33f2e12c-2001-11ea-939c-12813bfff9fa;
 Mon, 16 Dec 2019 12:40:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 62BE0AF65;
 Mon, 16 Dec 2019 12:40:12 +0000 (UTC)
To: Jin Nan Wang <jnwang@suse.com>
References: <20191216121023.30237-1-jnwang@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df770e63-3bf5-a25d-7149-28095de14d22@suse.com>
Date: Mon, 16 Dec 2019 13:40:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216121023.30237-1-jnwang@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxMzoxMSwgSmluIE5hbiBXYW5nIHdyb3RlOgo+IEZpeCBhIGlzc3VlIHdo
ZW4gdXNlciBkaXNhYmxlIEVUUCBleGVjLXNwLCB4ZW4gbWlzc2VkIGEgcHJvbXB0Cj4gbG9nIGlu
IGRtZXNnLgo+IAo+IEF0IGRlZmF1bHQsIHhlbiB3aWxsIHRlbGwgIlZNWDogRGlzYWJsaW5nIGV4
ZWN1dGFibGUgRVBUIHN1ZXJwYWdlcwo+IGR1ZSB0byBDVkUtMjAxOC0xMjIwNyIuIFdoZW4gdXNl
ciBhZGQgJ2VwdD1leGVjLXNwPW9mZicgb24gY29tbWFuZC1saW5lLgo+IFRoZSBwcm9tcHQgaXMg
ZGlzYXBwZWFyZWQuIFRoaXMgY2FuIGdpdmUgdXNlcnMgdGhlIGlsbHVzaW9uIHRoYXQgdGhlCj4g
ZmVhdHVyZSBpcyB0dXJuZWQgb24uCgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgc3VmZmljaWVudCBy
ZWFzb24gdG8gYWx0ZXIgdGhlIGN1cnJlbnQKbG9naWMuIEFuZCBidHcgLSBtYXkgSSBhc2sgdGhh
dCB5b3UgZG9uJ3Qgc3VibWl0IHNldmVyYWwKdmVyc2lvbnMgYSBkYXkgd2l0aG91dCBldmVuIHNl
dHRsaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
