Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC21640C4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 10:48:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Lvw-00013L-OY; Wed, 19 Feb 2020 09:46:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4Lvv-00013E-Hr
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 09:46:19 +0000
X-Inumbo-ID: ad52f8b2-52fc-11ea-831c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad52f8b2-52fc-11ea-831c-12813bfff9fa;
 Wed, 19 Feb 2020 09:46:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 594C6AC22;
 Wed, 19 Feb 2020 09:46:17 +0000 (UTC)
To: Thomas Gleixner <tglx@linutronix.de>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
References: <20200218154712.25490-1-jgross@suse.com>
 <87mu9fr4ky.fsf@nanos.tec.linutronix.de>
 <b0f33786-79b1-f8ee-24ae-ce9f9f4791af@suse.com>
 <8736b7q6ca.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4537af8d-e28f-1c27-53a9-e3208874037e@suse.com>
Date: Wed, 19 Feb 2020 10:46:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8736b7q6ca.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/ioperm: add new paravirt function
 update_io_bitmap
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, stable@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTA6MjIsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPiBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+IHdyaXRlczoKPj4gT24gMTguMDIuMjAgMjI6MDMsIFRob21hcyBH
bGVpeG5lciB3cm90ZToKPj4+IEJUVywgd2h5IGlzbid0IHN0dWZmIGxpa2UgdGhpcyBub3QgY2F0
Y2hlZCBkdXJpbmcgbmV4dCBvciBhdCBsZWFzdAo+Pj4gYmVmb3JlIHRoZSBmaW5hbCByZWxlYXNl
PyBJcyBub3RoaW5nIHJ1bm5pbmcgQ0kgb24gdXBzdHJlYW0gd2l0aCBhbGwKPj4+IHRoYXQgWEVO
IG11Y2sgYWN0aXZlPwo+Pgo+PiBUaGlzIHByb2JsZW0gc2hvd2VkIHVwIGJ5IG5vdCBiZWluZyBh
YmxlIHRvIHN0YXJ0IHRoZSBYIHNlcnZlciAocHJvYmFibHkKPj4gbm90IHRoZSBmcmVzaGVzdCBv
bmUpIGluIGRvbTAgb24gYSBtb2RlcmF0ZSBhZ2VkIEFNRCBzeXN0ZW0uCj4+Cj4+IE91ciBDSSB0
ZXN0cyB0ZW5kIGRvIGJlIG1vcmUgdGV4dCBjb25zb2xlIGJhc2VkIGZvciBkb20wLgo+IAo+IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3g4Ni9pb1twZXJtfHBsXSBzaG91bGQgaGF2ZSBjYXVnaHQg
dGhhdCBhcyB3ZWxsLAo+IHJpZ2h0PyBJZiBub3QsIHdlIG5lZWQgdG8gZml4IHRoZSBzZWxmdGVz
dHMuCgpIbW0sIHllcy4gVGhhbmtzIGZvciB0aGUgcG9pbnRlci4KCldpbGwgYXNrIG91ciB0ZXN0
aW5nIHNwZWNpYWxpc3Qgd2hhdCBpcyBkb25lIGluIHRoaXMgcmVnYXJkIGFuZCBob3cgaXQKY2Fu
IGJlIGVuaGFuY2VkLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
