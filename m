Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02D194F3
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 23:52:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOqw9-0001Cz-Qh; Thu, 09 May 2019 21:50:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IWQu=TJ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hOqw8-0001Cu-K0
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 21:50:44 +0000
X-Inumbo-ID: 7df3fe5c-72a4-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7df3fe5c-72a4-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 21:50:43 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 224683031FBD; Fri, 10 May 2019 00:50:42 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.176.211])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BFB87306E4AC;
 Fri, 10 May 2019 00:50:41 +0300 (EEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
Date: Fri, 10 May 2019 00:50:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [VMI] How to add support for MOV-TO-DRx events ?
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

T24gNS8xMC8xOSAxMjozMSBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaGF0IHdlJ2xsIGhh
dmUgdG8gZG8gaXMgZW5kIHVwIGluIGEgcG9zaXRpb24gd2hlcmUgd2UgY2FuIGhhdmUgc29tZQo+
IHJlYWwgJWRyIHNldHRpbmdzIGdpdmVuIGJ5IHRoZSBWTUkgYWdlbnQsIGFuZCBzb21lIHNoYWRv
dyAlZHIgc2V0dGluZ3MKPiB3aGljaCB0aGUgZ3Vlc3QgaW50ZXJhY3RzIHdpdGguwqAgQWxzbyBJ
IHNob3VsZCB3YXJuIHlvdSBhdCB0aGlzIHBvaW50Cj4gdGhhdCwgYmVjYXVzZSBvZiBob3cgdGhl
IHJlZ2lzdGVycyB3b3JrLCBJdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBoYXZlCj4gZ3Vlc3Qt
c2hhZG93ZWQgJWRyIGZ1bmN0aW9uaW5nIGF0IHRoZSBzYW1lIHRpbWUgYXMgVk1JLXByb3ZpZGVk
ICVkcgo+IHNldHRpbmdzLgo+IAo+IEkgZ3Vlc3MgdGhlIG1haW4gdXNlY2FzZSBoZXJlIGlzIHNp
bXBseSBoaWRpbmcgZnJvbSB0aGUgZ3Vlc3Qga2VybmVsCj4gdGhhdCBkZWJ1Z2dpbmcgYWN0aXZp
dGllcyBhcmUgaW4gdXNlLCBhbmQgd2UgYXJlIG9rIHRvIGJyZWFrIHRoZSByZWFsCj4gdXNlIG9m
IGdkYi9vdGhlciBpbnNpZGUgdGhlIGd1ZXN0P8KgIFJhenZhbi9UYW1hczogQXMgeW91ciB0aGUK
PiBtYWludGFpbmVycywgaXQgaXMgeW91ciBjYWxsLCB1bHRpbWF0ZWx5LgoKV2hhdCB3b3JyaWVz
IG1lIGhlcmUgaXMgdGhhdCBpbiB0aGF0IGNhc2UgaXQgYmVjb21lcyBlYXNpZXIgZm9yIGEgcm9n
dWUKYXBwbGljYXRpb24gaW5zaWRlIHRoZSBndWVzdCB0byBmaWd1cmUgb3V0IHRoYXQgdGhlIGd1
ZXN0J3MgYmVpbmcKbW9uaXRvcmVkLCBpZiBJIHVuZGVyc3RhbmQgdGhpbmdzIGNvcnJlY3RseS4K
Ck9mIGNvdXJzZSwgYSBkb20wIGludHJvc3BlY3Rpb24gYWdlbnQgbWF5IGNob29zZSB0byBzaW1w
bHkgbm90IHN1YnNjcmliZQp0byBEUiBldmVudHMsIGFuZCB0aHVzIG5vdCBhbHRlciB0aGUgY3Vy
cmVudCBmbG93IGF0IGFsbCwgd2hpY2ggbWFrZXMKdGhpbmdzIGJldHRlci4KCgpUaGFua3MsClJh
enZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
