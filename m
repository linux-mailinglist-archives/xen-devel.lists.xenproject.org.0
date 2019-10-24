Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C257E2CC0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 11:01:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNYvn-0004Ui-1D; Thu, 24 Oct 2019 08:57:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mlJ=YR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iNYvl-0004Ud-Uz
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 08:57:17 +0000
X-Inumbo-ID: 46939f18-f63c-11e9-9498-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46939f18-f63c-11e9-9498-12813bfff9fa;
 Thu, 24 Oct 2019 08:57:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFA931F;
 Thu, 24 Oct 2019 01:57:15 -0700 (PDT)
Received: from [10.37.8.60] (unknown [10.37.8.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45EC3F718;
 Thu, 24 Oct 2019 01:57:13 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <eea875c2-5d6e-5a49-b1c5-1248d447edbb@arm.com>
Date: Thu, 24 Oct 2019 09:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: jgross@suse.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTAvMTYvMTkgMTE6MDggQU0sIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOgo+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KPiAKPiBXZSBhbHdheXMgc2tpcCB0aGUgSU9NTVUgZGV2aWNlIHdoZW4gY3Jl
YXRpbmcgRFQgZm9yIGh3ZG9tIGlmIHRoZXJlIGlzCj4gYW4gYXBwcm9wcmlhdGUgZHJpdmVyIGZv
ciBpdCBpbiBYZW4gKGRldmljZV9nZXRfY2xhc3MoaW9tbXVfbm9kZSkKPiByZXR1cm5zIERFVklD
RV9JT01NVSkuIFNvLCBldmVuIGlmIGl0IGlzIG5vdCB1c2VkIGJ5IFhlbiBpdCB3aWxsIGJlIHNr
aXBwZWQuCj4gCj4gV2Ugc2hvdWxkIGFsc28gc2tpcCB0aGUgSU9NTVUgc3BlY2lmaWMgcHJvcGVy
dGllcyBvZiB0aGUgbWFzdGVyIGRldmljZQo+IGJlaGluZCB0aGF0IElPTU1VIGluIG9yZGVyIHRv
IGF2b2lkIGV4cG9zaW5nIGFuIGhhbGYgY29tcGxldGUgSU9NTVUKPiBiaW5kaW5ncyB0byBod2Rv
bS4KPiAKPiBBY2NvcmRpbmcgdG8gdGhlIExpbnV4J3MgZG9jczoKPiAxLiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9tbXUudHh0Cj4gMi4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2ktaW9tbXUudHh0Cj4gCj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpASnVlcmdlbjogd2hp
bGUgdGhlIGRyaXZlciByZWx5aW5nIG9uIHRob3NlIGJpbmRpbmdzIGlzIGV4cGVyaW1lbnRhbCBm
b3IgClhlbiA0LjEzLCBpdCB3b3VsZCBiZSBnb29kIHRvIGF2b2lkIGV4cG9zaW5nIGhhbGYgdGhl
IGJpbmRpbmdzIG9mIElPTU1VLgoKVGhlIGJpbmRpbmdzIGFyZSBnZW5lcmljIGJ1dCBpdCBpcyBu
b3QgdXNlZCBieSB0aGUgU01NVSBkcml2ZXIgeWV0IGFuZCAKdGhlcmVmb3JlIHNob3VsZCBub3Qg
YWZmZWN0IHBsYXRmb3JtIHVzaW5nIFNNTVVzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
