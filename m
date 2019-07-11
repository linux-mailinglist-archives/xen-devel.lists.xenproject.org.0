Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28F565EBA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2019 19:35:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlcvj-0003gT-8K; Thu, 11 Jul 2019 17:32:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sfew=VI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlcvh-0003gO-57
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2019 17:32:25 +0000
X-Inumbo-ID: d7b075cc-a401-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d7b075cc-a401-11e9-8980-bc764e045a96;
 Thu, 11 Jul 2019 17:32:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CE0F337;
 Thu, 11 Jul 2019 10:32:23 -0700 (PDT)
Received: from [10.119.48.77] (unknown [10.119.48.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D309C3F71F;
 Thu, 11 Jul 2019 10:32:22 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>,
 Hunyue Yau <hy-gsoc@hy-research.com>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
 <e7104450-54ae-6720-9d9f-f4e8889946c8@gmail.com> <520937670.d9P0eaHOQZ@acer0>
 <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d1d8514d-05e6-66f3-ef8d-95f1b48ccfd4@arm.com>
Date: Thu, 11 Jul 2019 18:32:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Iain Hunter <drhunter95@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA3LzExLzE5IDE6NTAgUE0sIERlbmlzIE9icmV6a292IHdyb3RlOgo+IEhpLAoKSGksCgo+
Pj4KPj4+IEkgYW0gaW50ZXJlc3RlZCB3aGV0aGVyIHdlIHNob3VsZCBkbyBzb21ldGhpbmcgd2l0
aCBvbWFwNS13dWdlbi1tcHUuIEkKPj4+IGZvdW5kIHRoYXQgY3Jvc3NiYXIgaXMgY29ubmVjdGVk
IHRvIEdJQy4gQW5kIG9uIHNvbWUgc2NoZW1lcyBpbiB0cm0gaXQKPj4+IGlzIGNvbm5lY3RlZCB2
aWEgb21hcDUtd3VnZW4tbXB1LiBTbywgaXQgaXMgbm90IGNsZWFyIGZvciBtZSB3aGV0aGVyIGl0
Cj4+PiBzaG91bGQgYmUgaGFuZGxlZCBpbiB4ZW4uCgpJIGRvbid0IGtub3cgbXVjaCBhYm91dCBv
bWFwNS13dWdlbi1tcHUsIHNvIEkgd2lsbCBsZWF2ZSBIdW55dWUgYW5kIElhaW4gCnRvIHByb3Zp
ZGUgZmVlZGJhY2sgaGVyZS4KCgo+Pgo+IAo+IEFsc28sIEkgYW0gaW50ZXJlc3RlZCBpbiBob3cg
dG8gYWRkIHRoZSBjcm9zc2Jhci4gSSBjYW4gc2VlIHR3byBvcHRpb25zCj4gYXMgd2UgZGlzY3Vz
c2VkIGVhcmxpZXIuIFRoZSBmaXJzdCBvcHRpb24gaXMgdG8gcmVtb3ZlIHRoZSBjcm9zc2JhciBi
dXQKPiBmb3IgbWUgaXQgbWlnaHQgY2F1c2Ugc29tZSBwcm9ibGVtcyBzaW5jZSBhIGd1ZXN0IG1p
Z2h0IHdhbnQgdG8gdXNlIGl0Lgo+IFRoZSBzZWNvbmQgb3B0aW9uIGlzIHRvIGV4cG9zZSB0aGUg
Y3Jvc3NiYXIgYW5kIGludGVyY2VwdCBhbGwgdGhlIGNhbGxzCj4gdG8gaXQuIEJ1dCB0aGUgcHJv
YmxlbSBpcyB0aGF0IG5vdyB4ZW4gc3VwcG9ydHMgb25seSBvbmUKPiBpbnRlcnJ1cHQtY29udHJv
bGxlci4gQW5kIGF0IHRoZSBzYW1lIHRpbWUgbW9zdCBvZiB0aGUgU1BJIElSUXMgYXJlCj4gbWFw
cGVkIHRvIHRoZSBjcm9zc2Jhci4gU28sIHdoZW4geGVuIGNoZWNrcyB3aGV0aGVyIHRoZSBtYWlu
Cj4gaW50ZXJydXB0LWNvbnRyb2xsZXIgaXMgdGhlIHNhbWUgYXMgdGhlIG9uZSB0byB3aG8gZXh0
ZXJuYWwgaW50ZXJydXB0cwo+IGFyZSBtYXBwZWQgaXQgZmFpbHMuCj4gKHhlbi9jb21tb24vZGV2
aWNlX3RyZWUuYzpkdF9pcnFfdHJhbnNsYXRlKCkpLgo+IEFuZCBJIGRvbid0IHRoaW5rIHRoYXQg
SSBzaG91bGQgY2hhbmdlIGludGVycnVwdC1wYXJlbnQgb3B0aW9uIG9mCj4gZGV2aWNlcyB0byBt
YXAgdGhlbSB0byB0aGUgR0lDIGJlY2F1c2UgaXQgaXMgZXNzZW50aWFsbHkgdGhlIGZpcnN0Cj4g
b3B0aW9uIG1lbnRpb25lZCBhYm92ZS4gU28sIGl0IHNlZW1zIHRoYXQgcHJvYmFibHkgaW50ZXJy
dXB0LXBhcmVudAo+IGZpbmRpbmcgZGVjaXNpb24gbG9naWMgc2hvdWxkIGJlIGNoYW5nZWQgYSBi
aXQ/IExpa2UgdG8gZmluZCBhIEdJQyBub2RlCj4gbm90IGluIGEgZGlyZWN0IGludGVycnVwdC1w
YXJlbnQgYnV0IHRyYW5zaXRpdmVseSBpbiBvbmUgb2YgYW5jZXN0b3JzOgo+IAo+IFVBUlQgLT4g
Y3Jvc3NiYXIgLT4gd3VnZW4gLT4gR0lDCj4gCj4gV2hhdCBkbyB5b3UgdGhpbms/CgpIYXZlIHlv
dSBsb29rZWQgYXQgdGhlIHNlcmllcyBJIHBvaW50ZWQgb3V0IGVhcmxpZXIgb24/IEl0IGV4dGVu
ZHMgWGVuIAp0byBzdXBwb3J0IG90aGVyIGludGVycnVwdCBjb250cm9sbGVyIHBhcmVudC4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
