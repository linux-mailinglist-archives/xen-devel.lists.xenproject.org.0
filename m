Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86540F8C6B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 11:04:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUSxr-0007ix-Hz; Tue, 12 Nov 2019 09:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ifzZ=ZE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUSxq-0007is-28
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 09:59:58 +0000
X-Inumbo-ID: 2de7c29a-0533-11ea-a21a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de7c29a-0533-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 09:59:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EC5CAFCB;
 Tue, 12 Nov 2019 09:59:55 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <d41313de-f95d-729d-9cdb-bb19dc45d162@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5f5c312c-b9a5-db66-9213-b47a1f6b80f8@suse.com>
Date: Tue, 12 Nov 2019 10:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <d41313de-f95d-729d-9cdb-bb19dc45d162@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] AMD/IOMMU: don't needlessly trigger
 errors/crashes when unmapping a page
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMTEuMTkgMTY6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFVubWFwcGluZyBhIHBhZ2Ug
d2hpY2ggaGFzIG5ldmVyIGJlZW4gbWFwcGVkIHNob3VsZCBiZSBhIG5vLW9wIChub3RlIGhvdwo+
IGl0IGFscmVhZHkgaXMgaW4gY2FzZSB0aGVyZSB3YXMgbm8gcm9vdCBwYWdlIHRhYmxlIGFsbG9j
YXRlZCkuIFRoZXJlJ3MKPiBpbiBwYXJ0aWN1bGFyIG5vIG5lZWQgdG8gZ3JvdyB0aGUgbnVtYmVy
IG9mIHBhZ2UgdGFibGUgbGV2ZWxzIGluIHVzZSwKPiBhbmQgdGhlcmUncyBhbHNvIG5vIG5lZWQg
dG8gYWxsb2NhdGUgaW50ZXJtZWRpYXRlIHBhZ2UgdGFibGVzIGV4Y2VwdAo+IHdoZW4gbmVlZGlu
ZyB0byBzcGxpdCBhIGxhcmdlIHBhZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
