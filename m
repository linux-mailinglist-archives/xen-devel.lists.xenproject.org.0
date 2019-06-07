Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECE39180
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 18:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZHEz-0003Z8-Bg; Fri, 07 Jun 2019 15:57:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J39r=UG=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hZHEy-0003Z3-A5
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 15:57:16 +0000
X-Inumbo-ID: e6b2741e-893c-11e9-a68b-338db0e72e3a
Received: from spam2.hygon.cn (unknown [110.188.70.11])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6b2741e-893c-11e9-a68b-338db0e72e3a;
 Fri, 07 Jun 2019 15:57:10 +0000 (UTC)
Received: from MK-DB.hygon.cn ([172.23.18.60])
 by spam2.hygon.cn with ESMTP id x57Fsglc053669;
 Fri, 7 Jun 2019 23:54:42 +0800 (GMT-8) (envelope-from puwen@hygon.cn)
Received: from cncheex01.Hygon.cn ([172.23.18.10])
 by MK-DB.hygon.cn with ESMTP id x57FsJnJ020132;
 Fri, 7 Jun 2019 23:54:19 +0800 (GMT-8) (envelope-from puwen@hygon.cn)
Received: from [192.168.1.193] (172.23.18.44) by cncheex01.Hygon.cn
 (172.23.18.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1466.3; Fri, 7 Jun 2019
 23:54:38 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <cover.1554382869.git.puwen@hygon.cn>
 <201906070115.x571Fd9j014046@spam1.hygon.cn>
From: Pu Wen <puwen@hygon.cn>
Message-ID: <2082a3c4-4df4-0c29-0181-4630ccaa5f4b@hygon.cn>
Date: Fri, 7 Jun 2019 23:54:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <201906070115.x571Fd9j014046@spam1.hygon.cn>
Content-Language: en-US
X-Originating-IP: [172.23.18.44]
X-ClientProxiedBy: cncheex02.Hygon.cn (172.23.18.12) To cncheex01.Hygon.cn
 (172.23.18.10)
X-MAIL: spam2.hygon.cn x57Fsglc053669
X-DNSRBL: 
Subject: Re: [Xen-devel] [PATCH v5 00/15] Add support for Hygon Dhyana
 Family 18h processor
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS82LzcgMDozMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJJ3ZlIHJlYmFzZWQgdGhl
IHBhdGNoZXMgb3ZlciBteSBDUFVJRCB3b3JrLCBhbmQgcHVzaGVkIHRoZSBvbmVzIHdoaWNoCj4g
c3RpbGwgYXBwbHkgY2xlYW5seSB0byBzdGFnaW5nLsKgIEhvd2V2ZXIsIHNvbWUgZG9uJ3QgYXBw
bHkgY2xlYW5seSBhbnkKClRoYW5rcyBhIGxvdC4KCj4gbW9yZSwgc28gSSBsZWZ0IHRob3NlIGFs
b25lLgo+IAo+IFBsZWFzZSBjb3VsZCB5b3UgY2hlY2sgdGhlIGN1cnJlbnQgc3RhZ2luZyBidWls
ZCAoYW5kIGluIHBhcnRpY3VsYXIsCj4gdGhhdCBJIGRpZG4ndCBhY2NpZGVudGFsbHkgYnJlYWsg
YW55dGhpbmcgd2l0aCB0aGUgcmViYXNlKSwgYW5kIHJlYmFzZQoKWWVzLCB0aGUgY3VycmVudCBz
dGFnaW5nIGJ1aWxkIGlzIE9LIGFuZCB3b3JrcyBvbiBIeWdvbiBwbGF0Zm9ybS4KSSdsbCBjaGVj
ayB0aGUgZnVuY3Rpb25hbGl0aWVzIG1vcmUgY2FyZWZ1bGx5LgoKPiB0aGUgcmVtYWluZGVyIG9m
IHRoZSBzZXJpZXMgb250byBzdGFnaW5nLgoKSSdsbCBkbyB0aGlzIGxhdGVyIG9uLgoKLS0KUmVn
YXJkcywKUHUgV2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
