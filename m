Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5DDBFDF6
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 06:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDhhf-0003AT-Rs; Fri, 27 Sep 2019 04:17:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDhhe-0003AO-1H
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 04:17:58 +0000
X-Inumbo-ID: c7493a92-e0dd-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c7493a92-e0dd-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 04:17:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20178ABD0;
 Fri, 27 Sep 2019 04:17:54 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190926183808.11630-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ef4aa8a7-1af9-2dde-4ebf-ae0fd7b39b5b@suse.com>
Date: Fri, 27 Sep 2019 06:17:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926183808.11630-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 00/10] xen/arm: XSA-201 and
 XSA-263 fixes
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMTkgMjA6MzcsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVGhp
cyBwYXRjaCBzZXJpZXMgYWltcyB0byBmaXggdHdvIGJ1Z3MgaW4gdGhlIGVudHJ5IHBhdGggZnJv
bSB0aGUgZ3Vlc3Q6Cj4gICAgICAxKSBNYWtlIHN1cmUgdGhhdCBTU0JEIHdvcmthcm91bmQgaXMg
ZW5hYmxlZCBiZWZvcmUgZXhlY3V0aW5nIGFueSBoeXBlcnZpc29yIGNvZGUKPiAgICAgIDIpIEF2
b2lkIGd1ZXN0IHN0YXRlIGNvcnJ1cHRpb24gd2hlbiBhbiB2aXJ0dWFsIFNFcnJvciBpcyByZWNl
aXZlZAo+IAo+IFRoZSBmdWxsIHNlcmllcyBpcyBjYW5kaWRhdGUgZm9yIFhlbiA0LjEzLiBXaXRo
b3V0IGl0LCB0aGUgaHlwZXJ2aXNvciB3b3VsZAo+IG5vdCBiZSBwcm9wZXJseSBwcm90ZWN0ZWQg
YWdhaW5zdCBTU0IgdnVsbmVyYWJpbGl0eSBhbmQgdGhlIGd1ZXN0IHN0YXRlIG1heQo+IGdldCBj
b3JydXB0ZWQgaWYgYW4gU0Vycm9yIGlzIHJlY2VpdmVkLgo+IAo+IFRoaXMgaXMgaW4gUkZDIHN0
YXRlIGJlY2F1c2UgdGhlIGVudHJ5IGNvZGUgaXMgbm93IHF1aXRlIGRpZmZlcmVudCBhbmQKPiBh
cm0zMiBjaGFuZ2VzIGFyZSBub3QgeWV0IGltcGxlbWVudGVkLiBJIHdpbGwgbW9kaWZ5IGFybTMy
IG9uY2Ugd2UgYWdyZWVkCj4gb24gdGhlIGFwcHJvYWNoLgo+IAo+IENoZWVycywKPiAKPiBDYzog
amdyb3NzQHN1c2UuY29tCgpJIHRoaW5rIHRoZSBleHBsYW5hdGlvbiBvZiB0aGUgbW90aXZhdGlv
biBxdWFsaWZpZXMgdGhlIHNlcmllcyB0byBiZQptYXJrZWQgYXMgYSBibG9ja2VyIGZvciA0LjEz
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
