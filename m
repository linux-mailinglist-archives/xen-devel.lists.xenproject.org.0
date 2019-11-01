Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E52EC161
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 11:50:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQUTF-000258-F5; Fri, 01 Nov 2019 10:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ES3X=YZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iQUTE-000253-2F
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 10:47:56 +0000
X-Inumbo-ID: 0ed68eb4-fc95-11e9-8aca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ed68eb4-fc95-11e9-8aca-bc764e2007e4;
 Fri, 01 Nov 2019 10:47:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 336EDAEF8;
 Fri,  1 Nov 2019 10:47:53 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20191031150922.22938-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <75909ef5-99b9-7b7a-58c0-e5f13d530c56@suse.com>
Date: Fri, 1 Nov 2019 11:47:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031150922.22938-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 00/19] xen/arm: XSA-201 and
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMTkgMTY6MDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVGhp
cyBpcyB2NCBvZiB0aGUgc2VyaWVzLiBGb3IgdGhvc2Ugd29uZGVyaW5nIHdoeSBpdCBpcyB2NCBh
bmQgbm90IHYyLCB0aGlzCj4gc2VyaWVzIGlzIGNsb3NlbHkgcmVsYXRlZCB0byBYU0EtMzAzIFsx
XSBhbmQgcmVmcmFpbmVkIHRvIHBvc3QgYSBuZXcgdmVyc2lvbgo+IHB1YmxpY2x5LiBUbyBhdm9p
ZCBkZWxheWluZyB0aGUgc2VyaWVzIHdhcyByZXZpZXdlZCBwcml2YXRlbHkgb24gc2VjdXJpdHlA
Lgo+IAo+IFRoZSBzZXJpZXMgaXMgbm93IG5lYXJseSBmdWxseSByZXZpZXdlZC4gVGhlcmUgYXJl
IGp1c3QgYSBmZXcgbWlzc2luZyB0YWdzCj4gZm9yIHBhdGNoICMxMSwgIzEyIGFuZCAjMTkuCj4g
Cj4gVGhlIHNlcmllcyBpcyBiYXNlZCBvbiBYU0EtMzAzIHdoaWNoIGhhcyBub3QgeWV0IGJlZW4g
Y29tbWl0dGVkLiBGb3IKPiBjb252ZW5pZW5jZSwgSSBoYXZlIHB1c2hlZCBhIGJyYW5jaCBvbiBt
eSBwdWJsaWMgZ2l0Ogo+IAo+IGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3Bs
ZS9qdWxpZW5nL3hlbi11bnN0YWJsZS5naXQKPiBicmFuY2ggZW50cnktcmV3b3JrL3Y0Cj4gCj4g
QEp1ZXJnZW46IE9uIHYxLCB5b3UgYWdyZWVkIHRoaXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgYXMg
YSBibG9ja2VyIGZvciBYZW4gNC4xMy4KPiBBcmUgeW91IHN0aWxsIGhhcHB5IHRvIGNvbnNpZGVy
IHRoaXMgc2VyaWVzIHRvIGdvIGluIFhlbiA0LjEzP1RoaXMgaXMgbW9zdGx5Cj4gZml4aW5nIHVw
IHRoZSBub24tWFNBIHBhcnQgb2YgWFNBLTMwMy4gVGhpcyBzaG91bGQgYWxsb3cgdG8gaGFuZGxl
IHByb3Blcmx5Cj4gU1NCRCB3b3JrYXJvdW5kIGFuZCByZWNlaXZlIHNhZmVseSBTRXJyb3JzLgoK
WWVhaCwgc3RpbGwgZmluZSB3aXRoIG1lLCBzbyBmb3IgdGhlIHNlcmllczoKClJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
