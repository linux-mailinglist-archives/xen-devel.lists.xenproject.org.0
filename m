Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A910A013
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 15:16:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZbc5-0007wZ-R7; Tue, 26 Nov 2019 14:14:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZbc4-0007wB-F9
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 14:14:44 +0000
X-Inumbo-ID: 17ad865c-1057-11ea-a3a2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17ad865c-1057-11ea-a3a2-12813bfff9fa;
 Tue, 26 Nov 2019 14:14:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AFE38B268;
 Tue, 26 Nov 2019 14:14:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
 <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
 <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1cb5b4cb-b7a4-14a1-ea11-fbc4b5075f64@suse.com>
Date: Tue, 26 Nov 2019 15:14:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <77017c06-c383-e511-c0dc-9b49944ae967@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxMzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8xMS8yMDE5
IDA4OjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMTEuMjAxOSAyMjowNSwgSWdvciBE
cnV6aGluaW4gd3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9t
bXVfaW5pdC5jCj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jCj4+PiBAQCAtMTI3OSw3ICsxMjc5LDcgQEAgc3RhdGljIGludCBfX2luaXQgYW1kX2lvbW11
X3NldHVwX2RldmljZV90YWJsZSgKPj4+ICAgICAgICAgIGZvciAoIGJkZiA9IDAsIHNpemUgLz0g
c2l6ZW9mKCpkdCk7IGJkZiA8IHNpemU7ICsrYmRmICkKPj4+ICAgICAgICAgICAgICBkdFtiZGZd
ID0gKHN0cnVjdCBhbWRfaW9tbXVfZHRlKXsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC52ID0gdHJ1ZSwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IHRydWUsCj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAuaXYgPSBpb21tdV9pbnRyZW1hcCwKPj4gVGhp
cyB3YXMgdmVyeSBpbnRlbnRpb25hbGx5ICJ0cnVlIiwgYW5kIGlnbm9yaW5nICJpb21tdV9pbnRy
ZW1hcCI6Cj4gCj4gRGVsaWJlcmF0ZSBvciBub3QsIGl0IGlzIGEgcmVncmVzc2lvbiBmcm9tIDQu
MTIuCgpJIGFjY2VwdCBpdCdzIGEgcmVncmVzc2lvbiAod2hpY2ggd2FudHMgZml4aW5nKSwgYnV0
IEkgZG9uJ3QgdGhpbmsKdGhpcyBpcyB0aGUgd2F5IHRvIGFkZHJlc3MgaXMuIEkgY291bGQgYmUg
Y29udmluY2VkIGJ5IGdvb2QKYXJndW1lbnRzLCB0aG91Z2guCgo+IEJvb3Rpbmcgd2l0aCBpb21t
dT1uby1pbnRyZW1hcCBpcyBhIGNvbW1vbiBkZWJ1Z2dpbmcgdGVjaG5pcXVlLCBhbmQgdGhhdAo+
IG1lYW5zIG5vIGludGVycnVwdCByZW1hcHBpbmcgYW55d2hlcmUgaW4gdGhlIHN5c3RlbSwgZXZl
biBmb3IKPiBzdXBwb3NlZGx5LXVudXNlZCBEVEVzLgoKV2hldGhlciBJVj0xIG9yIElWPTAsIHRo
ZXJlJ3Mgbm8gaW50ZXJydXB0IF9yZW1hcHBpbmdfIHdpdGggdGhpcwpvcHRpb24gc3BlY2lmaWVk
LiBUaGVyZSdzIHNvbWUgaW50ZXJydXB0IF9ibG9ja2luZ18sIHllcy4gSXQncwpub3QgaW1tZWRp
YXRlbHkgY2xlYXIgdG8gbWUgd2hldGhlciB0aGlzIGlzIGEgZ29vZCBvciBhIGJhZCB0aGluZy4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
