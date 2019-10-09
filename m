Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F9CD0DFA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:51:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIASQ-000159-MN; Wed, 09 Oct 2019 11:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIASP-000154-9E
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:48:41 +0000
X-Inumbo-ID: bc2e07da-ea8a-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc2e07da-ea8a-11e9-9bee-bc764e2007e4;
 Wed, 09 Oct 2019 11:48:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04E80B01D;
 Wed,  9 Oct 2019 11:48:38 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
Date: Wed, 9 Oct 2019 13:48:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009110051.GP8065@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMzowMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAxMjo1MDowOVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDkuMTAuMjAxOSAxMjozMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEJUVyBIb3cgcnVudGltZSBzZXJ2aWNlcyB3b3JrIGFmdGVyIGtleGVjPyBJ
IGRvbid0IHNlZSBFRkkgaGFuZGxlcwo+Pj4gaGFuZGVkIG92ZXIga2V4ZWMsIGFyZSB0aGV5IHNv
bWVob3cgcmUtZGlzY292ZXJlZD8KPj4KPj4gV2hhdCBFRkkgaGFuZGxlcyBhcmUgeW91IHRhbGtp
bmcgYWJvdXQ/IEZvciBydW50aW1lIHNlcnZpY2VzCj4+IHdoYXQgYSBjb25zdW1lciBuZWVkcyBp
cyBhIHRhYmxlIHBvaW50ZXIsIHdoaWNoIGlzIGEgZmllbGQKPj4gaW4gdGhlIHN5c3RlbSB0YWJs
ZSwgd2hpY2ggaW4gdHVybiBpcyBhbiBhcmd1bWVudCBwYXNzZWQgdG8KPj4gdGhlIEVGSSBhcHBs
aWNhdGlvbidzIGVudHJ5IHBvaW50Lgo+IAo+IFllcywgSSdtIHRhbGtpbmcgYWJvdXQgdGhvc2Ug
cG9pbnRlcnMgKHN5c3RlbSB0YWJsZSBzcGVjaWZpY2FsbHkpLgo+IAo+PiBJIGRpZG4ndCB0aGlu
ayB0aGVyZSBhcmUKPj4gcHJvdmlzaW9ucyBpbiB0aGUgc3BlYyBmb3IgZWl0aGVyIG9mIHRoZXNl
IHBvaW50ZXJzIGJlaW5nIE5VTEwuCj4gCj4gQnV0IEkgZG9uJ3Qgc2VlIGtleGVjIHVzaW5nIEVG
SSBhcHBsaWNhdGlvbiBlbnRyeSBwb2ludC4gQW0gSSBtaXNzaW5nCj4gc29tZXRoaW5nPwoKQ2Fu
IHdlIHN0b3AgdGhpbmtpbmcgYWJvdXQgYSBMaW51eCAtPiBYZW4gdHJhbnNpdGlvbiBvbiB0aGlz
CnRocmVhZCBwbGVhc2U/IEl0IG9ubHkgc2VydmVzIHRvIGNvbmZ1c2UgbWF0dGVycyBpbW8uIEtl
eGVjCl9pc18gZGlmZmVyZW50LCBhbmQgaWYgYW55b25lIHdhbnRzIHRvIGdldCB0aGF0IHRyYW5z
aXRpb24Kd29ya2luZywgdGhlbiB0aGV5J2xsIGhhdmUgdG8gcHJvcGVybHkgaW52ZXN0aWdhdGUg
d2hhdCBpdAp0YWtlcy4gSGVyZSB3ZSdyZSBjb25jZXJuZWQgb25seSBhYm91dCBub3QgYnJlYWtp
bmcga2V4ZWMtaW5nCl9mcm9tXyBYZW4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
