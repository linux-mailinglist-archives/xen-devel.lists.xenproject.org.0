Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2831895D6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 07:30:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jES9y-0006N7-1R; Wed, 18 Mar 2020 06:26:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KC9J=5D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jES9w-0006N2-V9
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 06:26:32 +0000
X-Inumbo-ID: 68678bd2-68e1-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68678bd2-68e1-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 06:26:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3882DACA2;
 Wed, 18 Mar 2020 06:26:31 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200313130614.27265-1-jgross@suse.com>
 <20200313130614.27265-4-jgross@suse.com>
 <d6bad3fd-93b7-5835-4c46-dd2382dfd67e@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <388ab30a-f4ce-113a-aefd-7ad4b0124f9e@suse.com>
Date: Wed, 18 Mar 2020 07:26:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d6bad3fd-93b7-5835-4c46-dd2382dfd67e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 3/4] xen/rcu: add assertions to debug
 build
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAgMTU6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjAzLjIwMjAgMTQ6
MDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFhlbidzIFJDVSBpbXBsZW1lbnRhdGlvbiByZWxp
ZXMgb24gbm8gc29mdGlycSBoYW5kbGluZyB0YWtpbmcgcGxhY2UKPj4gd2hpbGUgYmVpbmcgaW4g
YSBSQ1UgY3JpdGljYWwgc2VjdGlvbi4gQWRkIEFTU0VSVCgpcyBpbiBkZWJ1ZyBidWlsZHMKPj4g
aW4gb3JkZXIgdG8gY2F0Y2ggYW55IHZpb2xhdGlvbnMuCj4+Cj4+IEZvciB0aGF0IHB1cnBvc2Ug
bW9kaWZ5IHJjdV9yZWFkX1t1bl1sb2NrKCkgdG8gdXNlIGEgZGVkaWNhdGVkIHBlcmNwdQo+PiBj
b3VudGVyIGFkZGl0aW9uYWwgdG8gcHJlZW1wdF9bZW58ZGlzXWFibGUoKSBhcyB0aGlzIGVuYWJs
ZXMgdG8gdGVzdAo+PiB0aGF0IGNvbmRpdGlvbiBpbiBfX2RvX3NvZnRpcnEoKSAoQVNTRVJUX05P
VF9JTl9BVE9NSUMoKSBpcyBub3QKPj4gdXNhYmxlIHRoZXJlIGR1ZSB0byBfX2NwdV91cCgpIGNh
bGxpbmcgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCkKPj4gd2hpbGUgaG9sZGluZyB0aGUgY3B1
IGhvdHBsdWcgbG9jaykuCj4+Cj4+IFdoaWxlIGF0IGl0IHN3aXRjaCB0aGUgcmN1X3JlYWRfW3Vu
XWxvY2soKSBpbXBsZW1lbnRhdGlvbiB0byBzdGF0aWMKPj4gaW5saW5lIGZ1bmN0aW9ucyBpbnN0
ZWFkIG9mIG1hY3Jvcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gd2l0aCBvbmUgcmVtYXJrOgo+IAo+PiBAQCAtOTEsMTYgKzExNCwyMyBAQCB0eXBlZGVm
IHN0cnVjdCBfcmN1X3JlYWRfbG9jayByY3VfcmVhZF9sb2NrX3Q7Cj4+ICAgICogd2lsbCBiZSBk
ZWZlcnJlZCB1bnRpbCB0aGUgb3V0ZXJtb3N0IFJDVSByZWFkLXNpZGUgY3JpdGljYWwgc2VjdGlv
bgo+PiAgICAqIGNvbXBsZXRlcy4KPj4gICAgKgo+PiAtICogSXQgaXMgaWxsZWdhbCB0byBibG9j
ayB3aGlsZSBpbiBhbiBSQ1UgcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24uCj4+ICsgKiBJdCBp
cyBpbGxlZ2FsIHRvIHByb2Nlc3Mgc29mdGlycXMgd2hpbGUgaW4gYW4gUkNVIHJlYWQtc2lkZSBj
cml0aWNhbCBzZWN0aW9uLgo+IAo+IFRoZSBsYXRlc3Qgd2l0aCB0aGUgcmUtYWRkZWQgcHJlZW1w
dF9kaXNhYmxlKCksIHdvdWxkbid0IHRoaXMgYmV0dGVyCj4gc2F5ICIuLi4gdG8gcHJvY2VzcyBz
b2Z0aXJxcyBvciBibG9jayAuLi4iPwoKSSBjYW4gYWRkIHRoaXMsIGJ1dCBPVE9IIGJsb2NraW5n
IHdpdGhvdXQgcHJvY2Vzc2luZyBzb2Z0aXJxcyBpcyBub3QKcG9zc2libGUsIGFzIHRoZXJlIGlz
IG5vIG90aGVyIChsZWdhbCkgd2F5IHRvIGVudGVyIHRoZSBzY2hlZHVsZXIuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
