Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A8E8BAE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 16:20:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPTFX-0004HV-9R; Tue, 29 Oct 2019 15:17:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPTFV-0004HQ-To
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 15:17:33 +0000
X-Inumbo-ID: 3a8d9ae5-fa5f-11e9-9515-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a8d9ae5-fa5f-11e9-9515-12813bfff9fa;
 Tue, 29 Oct 2019 15:17:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6644AFB0;
 Tue, 29 Oct 2019 15:17:31 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <4f0a30c7-911e-90ab-0875-83f3d4c454b5@suse.com>
 <a2ed0638-846a-fd4a-9093-0f5026eac881@gmail.com>
 <alpine.DEB.2.21.1910281144180.29150@sstabellini-ThinkPad-T480s>
 <a95dbdf3-9c71-b521-4486-7fa5b2dca4c7@gmail.com>
 <bf0bcc92-7ac9-1cc1-0440-04a2c97a7fd1@suse.com>
 <66e9d8f0-dbc4-394f-7f06-4cd05bdba7f1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c14bd1da-6afb-afcc-ef5a-4ac442e2c05e@suse.com>
Date: Tue, 29 Oct 2019 16:17:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <66e9d8f0-dbc4-394f-7f06-4cd05bdba7f1@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] getting 4.11.3 ready
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTAuMjAxOSAxNjowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI5LzEwLzIwMTkg
MTQ6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGlzIHF1aXRlIGxvbmcgYSBsaXN0IGZv
ciBhIHJlbGVhc2UgYWJvdXQgdG8gYmUgY3V0LiBMb29raW5nCj4+IGF0IHRoZSBicmFuY2ggSSBk
b24ndCBzZWUgYW55IEFybSBiYWNrcG9ydHMgb3RoZXIgdGhhbiB0aGUgb25lcwo+PiBkb25lIHll
c3RlcmRheSBwb3N0LTQuMTEuMi4gSSdtIGZpbmUgd2l0aCBiYXRjaGluZywgYnV0IG1heSBJCj4+
IGFzayBmb3Igc3VjaCBiYXRjaGVzIHRvIG5vdCBiZSBwb3N0cG9uZWQgdW50aWwgdGhlIGxhc3Qg
bWludXRlPwo+IAo+IFRoYXQncyB+MSB5ZWFyIHdvcnRoIG9mIGJhY2twb3J0IGJlY2F1c2Ugbm9i
b2R5IGxvb2tlZCBhdCBpdC4gQXBvbG9naWVzIGlmIGl0IAo+IGNvbWVzIGxhdGUgYnV0IEkgb25s
eSBub3RpY2VkIHRoZSBiYWNrcG9ydCByZXF1ZXN0IGUtbWFpbCB5ZXN0ZXJkYXkgYXMgSSBhbSBu
b3QgCj4gQ0NlZC4KPiAKPiBJIGFtIGhhcHB5IHRvIHRha2Ugb3ZlciB0aGUgYmFja3BvcnRzIGZv
ciBBcm0gaWYgdGhhdCBoZWxwcyB0byBnZXQgcGF0Y2hlcyAKPiBiYWNrcG9ydGVkIGluIGEgbW9y
ZSB0aW1lbHkgbWFubmVyLgoKTm90IHRoYXQgb24gbXkgcHJldmlvdXMgbWFpbCB5b3Ugd2VyZSBv
bmx5IENjLWVkLCBoZW5jZSB0aGUKcmVtYXJrIHdhc24ndCBkaXJlY3RlZCBhdCB5b3UgYW55d2F5
LiBBcyB0byBub3QgYmVpbmcgQ2MtZWQKb24gdGhlIG9yaWdpbmFsIHJlcXVlc3QgLSB0aGUgQ2Mg
bGlzdCB0aGVyZSBpcyBnZW5lcmFsbHkganVzdAp0aGUgcGVvcGxlIGludm9sdmVkIGluIG1ha2lu
ZyB0aGUgcmVsZWFzZS4gRXZlcnlvbmUgZWxzZQp3b3VsZCBnZXQgaXQgdmlhIHhlbi1kZXZlbC4g
SWYgSSBkaWRuJ3QgZG8gaXQgdGhhdCB3YXksIGhvdwp3b3VsZCBJIGRyYXcgdGhlIGJvdW5kYXJ5
IGJldHdlZW4gd2hvbSB0byBDYyBhbmQgd2hvbSB0byBvbWl0PwooV2l0aCB5b3VyIHJlcXVlc3Qg
b24gaXJjLCBhcyBzYWlkIHRoZXJlLCBJJ2xsIHRyeSB0byByZW1lbWJlcgpDYy1pbmcgeW91LiBJ
ZiwgYXMgcGVyIGFib3ZlLCB5b3UgdG9vayBvdmVyIGRvaW5nIHRoZQpiYWNrcG9ydHMsIEkgd291
bGQsIHRvby4gQnV0IGluIGdlbmVyYWwgdGhhdCdzIHdoYXQgd2UgaGF2ZQphIG1haWxpbmcgbGlz
dCBmb3IuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
