Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F161836E9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 18:09:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCRHi-0007Zm-LC; Thu, 12 Mar 2020 17:06:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FfMj=45=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCRHh-0007Zh-5L
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 17:06:13 +0000
X-Inumbo-ID: c609a35e-6483-11ea-b1dc-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c609a35e-6483-11ea-b1dc-12813bfff9fa;
 Thu, 12 Mar 2020 17:06:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFAACAC3A;
 Thu, 12 Mar 2020 17:06:10 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <24170.26671.783256.460525@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ffd2d2c8-572d-a043-26ea-19e4a44b0fda@suse.com>
Date: Thu, 12 Mar 2020 18:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <24170.26671.783256.460525@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Stopping much Linux testing in Xen Project CI
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
Cc: xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTc6NDksIElhbiBKYWNrc29uIHdyb3RlOgo+IExpbnV4IHN0YWJsZSBicmFu
Y2hlcywgYW5kIExpbnV4IHVwc3RyZWFtIHRpcCwgYXJlIGJhZGx5IGJyb2tlbiBhbmQKPiBoYXZl
IGJlZW4gZm9yIG1vbnRocy4gIEFwcGFyZW50bHkgbm8tb25lIGlzIGFibGUgdG8gKG9yIGhhcyB0
aW1lIHRvKQo+IHRvIGludmVzdGlnYXRlIGFuZCBmaXguCj4gCj4gICAgbGludXgtNC40ICAgICAg
ICAgIDIxOCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4gICAgbGludXgtNC45ICAgICAg
ICAgIDEzNCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4gICAgbGludXgtNC4xNCAgICAg
ICAgIDEzNCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4gICAgbGludXgtNC4xOSAgICAg
ICAgIDEzNCBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCj4gICAgbGludXgtNS40ICAgICAg
ICAgICA1NSBkYXlzCj4gICAgbGludXgtYXJtLXhlbiAgICAgdXAgdG8gZGF0ZQo+ICAgIGxpbnV4
LWxpbnVzICAgICAgICAzNzIgZGF5cyAgICAgICAgIHRvIGJlIHN1c3BlbmRlZAo+IAo+IFRoZXNl
IGFyZSB0aW1lcyBzaW5jZSB0aGUgbGFzdCBwdXNoIC0gaWUsIGhvdyBsb25nIGl0IGhhcyBiZWVu
IGJyb2tlbi4KPiBFdmlkZW50bHkgbm8tb25lIGlzIHBheWluZyBhbnkgYXR0ZW50aW9uIHRvIHRo
aXMuWzFdICBJIGxvb2tlZCBhdCB0aGUKPiByZXBvcnRzIG15c2VsZiBhbmQ6Cj4gCj4gTmVzdGVk
IEhWTSBpcyBicm9rZW4gb24gSW50ZWwgaW4gYWxsIG9mIHRoZSA0LnggYnJhbmNoZXMuCgpJIHdh
cyBsb29raW5nIGludG8gdGhlIHRlc3QgZmFpbHVyZXMgbXVsdGlwbGUgdGltZXMsIGFuZCBhbHdh
eXMgZm91bmQKdGhhdCBwcm9ibGVtLiBIb25lc3RseSBJIGRvbid0IHNlZSBob3cgdGhpcyBzaG91
bGQgYmUgdGhlIGtlcm5lbCdzCmZhdWx0LCBzbyBJIHJhdGhlciBxdWljayBnYXZlIHVwIGVhY2gg
dGltZS4KCj4gQWRkaXRpb25hbGx5Ogo+IAo+IExpbnV4IDQuNCBoYXMgc29tZSBpbnRlcm1pdHRl
bnQgZ3Vlc3Qgc3RhcnQgZmFpbHVyZSBmb3IgMzItYml0IFBWLgo+IAo+IExpbnV4IDQuMTQgZG9l
cyBub3QgYm9vdCBvbiAzMi1iaXQgQVJNLiAgVGhlcmUgYXJlIGFsc28gc29tZSA2NC1iaXQKPiB4
ODYgbWlncmF0aW9uIGZhaWx1cmVzLgo+IAo+IFRoZSBtb3N0IHJlY2VudCByZXBvcnRzIChsYXN0
IHdlZWsgb3IgdHdvKSBhcmUgYWZmbGljdGVkIGJ5IHVuZGVybHlpbmcKPiBDSSBwcm9ibGVtcyAt
IHdoYXQgbG9vayBsaWtlIHN0aWNreSBQRFUgcmVsYXlzLCBvciB3aGF0IG1heSBiZQo+IHByb2Js
ZW1zIGluIHRoZSBEZWJpYW4gbWlycm9yIG5ldHdvcmsgKEkgaGF2ZSBkZWZpbml0ZWx5IHNlZW4g
cHJvYmxlbXMKPiB0aGVyZSksIHNvIHRoZSByZXBvcnRzIGFyZSByYXRoZXIgbm9pc3kuICBTb3Jy
eSBhYm91dCB0aGF0LiAgSSBhbQo+IHRyeWluZyB0byBpbXByb3ZlIHRoaXMgc2l0dWF0aW9uIGJ1
dCBpdCBpcyBxdWl0ZSBkaWZmaWN1bHQgWzJdLiAgQnV0Cj4gb3ZlcmFsbCBpdCBpcyBjbGVhciB0
aGF0IHRoZSB1bmRlcmx5aW5nIGNvZGUgaXMgYnJva2VuLgoKSSBrbm93IEkgaGF2ZSBzYWlkIHNv
IGJlZm9yZTogSSBzdGlsbCB0aGluayB0aGF0IG91ciB0ZXN0cyByZWx5aW5nIG9uCnRoZSBEZWJp
YW4gc2VydmVycyAoYW5kIHRoZWlyIG9uZ29pbmcgc3VwcG9ydCBmb3IgYSBzZWxlY3RlZCB2ZXJz
aW9uKQppcyBub3QgdGhlIG9wdGltYWwgc2V0dXAuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
