Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69AEFDAC0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 11:08:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVYUe-00006P-Mu; Fri, 15 Nov 2019 10:06:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVYUc-00006K-Ob
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 10:06:18 +0000
X-Inumbo-ID: 8feadd2a-078f-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8feadd2a-078f-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 10:06:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ABCA9B25C;
 Fri, 15 Nov 2019 10:06:15 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191114180542.1016867-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bbbd382-465b-6169-f8b3-936cd71d222f@suse.com>
Date: Fri, 15 Nov 2019 11:06:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114180542.1016867-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] xen: Fix race to build
 arch/x86/efi/relocs-dummy.o
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxOTowNSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gV2l0aCAkKFRBUkdF
VCkuZWZpIGRlcGVuZGluZyBvbiBlZmkvcmVsb2NzLWR1bW15Lm8sIGFyY2gveDg2L01ha2VmaWxl
Cj4gd2lsbCBhdHRlbXB0IHRvIGJ1aWxkIHRoYXQgb2JqZWN0LiBUaGlzIHJlc3VsdCBpbiB0aGUg
ZGVwZW5kZW5jeSBmaWxlCj4gYmVlbiBnZW5lcmF0ZWQgd2l0aCByZWxvY3MtZHVtbXkubyBkZXBl
bmRpbmcgb24gZWZpL3JlbG9jcy1kdW1teS5vLgoKSSBjYW5ub3QgY29uZmlybSB0aGlzLCB3aGF0
IEkgc2VlIGlzCgplZmkvcmVsb2NzLWR1bW15Lm86IGVmaS9yZWxvY3MtZHVtbXkuUyBcCiAuLi4K
CldoaWNoIGlzbid0IHRvIHNheSB0aGVyZSdzIG5vIGlzc3VlIGhlcmUuIElPVyB0aGUgYWN0dWFs
IGFkanVzdG1lbnQKaXMgLi4uCgo+IFRoZW4sIHdoZW4gYXJjaC94ODYvZWZpL01ha2VmaWxlIHRy
aWVzIHRvIGJ1aWxkIHJlbG9jcy1kdW1teS5vLCB3ZWxsCj4gZWZpL3JlbG9jcy1kdW1teS5TIGRv
ZXNuJ3QgZXhpc3QuCj4gCj4gSGF2ZSBvbmx5IG9uZSBtYWtlZmlsZSByZXNwb25zaWJsZSBmb3Ig
YnVpbGRpbmcgcmVsb2NzLWR1bW15Lm8uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKQnV0IEknZCBwcmVmZXIgaWYgdGhlIGRlc2NyaXB0aW9uIGFz
cGVjdCBjb3VsZCBlaXRoZXIgYmUgY2xhcmlmaWVkCihkaWZmZXJlbnQgdmVyc2lvbnMgb2YgbWFr
ZSBiZWhhdmluZyBkaWZmZXJlbnRseT8pIG9yIGFkanVzdGVkLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
