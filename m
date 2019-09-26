Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7947BF522
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:36:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUqS-0000uJ-HE; Thu, 26 Sep 2019 14:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDUqQ-0000uE-N5
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:34:10 +0000
X-Inumbo-ID: b333e139-e06a-11e9-9657-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b333e139-e06a-11e9-9657-12813bfff9fa;
 Thu, 26 Sep 2019 14:34:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E37D8AE3F;
 Thu, 26 Sep 2019 14:34:08 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1569496834-7796-1-git-send-email-olekstysh@gmail.com>
 <1569496834-7796-8-git-send-email-olekstysh@gmail.com>
 <55a32546-9a54-c326-f4ae-83c0dc5fb69d@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <533737e0-ff60-c6a3-f38d-f4b7ffb1581b@suse.com>
Date: Thu, 26 Sep 2019 16:34:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <55a32546-9a54-c326-f4ae-83c0dc5fb69d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 volodymyr_babchuk@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNDo1MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDkvMjYvMTkgMTI6
MjAgUE0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+PiBGcm9tOiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Cj4+IFRoZSBtYWluIHB1
cHJvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBhZGQgYSB3YXkgdG8gcmVnaXN0ZXIgRFQgZGV2aWNl
Cj4+ICh3aGljaCBpcyBiZWhpbmQgdGhlIElPTU1VKSB1c2luZyB0aGUgZ2VuZXJpYyBJT01NVSBE
VCBiaW5kaW5ncyBbMV0KPj4gYmVmb3JlIGFzc2lnbmluZyB0aGF0IGRldmljZSB0byBhIGRvbWFp
bi4KPj4KPj4gU28sIHRoaXMgcGF0Y2ggYWRkcyBuZXcgImlvbW11X2FkZF9kdF9kZXZpY2UiIEFQ
SSBmb3IgYWRkaW5nIERUIGRldmljZQo+PiB0byB0aGUgSU9NTVUgdXNpbmcgZ2VuZXJpYyBJT01N
VSBEVCBiaW5kaW5ncyBhbmQgcHJldmlvdXNseSBhZGRlZAo+PiAiaW9tbXVfZndzcGVjIiBzdXBw
b3J0LiBBcyBkZXZpY2VzIGNhbiBiZSBhc3NpZ25lZCB0byB0aGUgaGFyZHdhcmUgZG9tYWluCj4+
IGFuZCBvdGhlciBkb21haW5zIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkIGZyb20gdHdvIHBsYWNl
czogaGFuZGxlX2RldmljZSgpCj4+IGFuZCBpb21tdV9kb19kdF9kb21jdGwoKS4KPj4KPj4gQmVz
aWRlcyB0aGF0LCB0aGlzIHBhdGNoIGFkZHMgbmV3ICJkdF94bGF0ZSIgY2FsbGJhY2sgKGJvcnJv
d2VkIGZyb20KPj4gTGludXggIm9mX3hsYXRlIikgZm9yIHByb3ZpZGluZyB0aGUgZHJpdmVyIHdp
dGggRFQgSU9NTVUgc3BlY2lmaWVyCj4+IHdoaWNoIGRlc2NyaWJlcyB0aGUgSU9NTVUgbWFzdGVy
IGludGVyZmFjZXMgb2YgdGhhdCBkZXZpY2UgKGRldmljZSBJRHMsIGV0YykuCj4+IEFjY29yZGlu
ZyB0byB0aGUgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncyB0aGUgY29udGV4dCBvZiByZXF1aXJl
ZAo+PiBwcm9wZXJ0aWVzIGZvciBJT01NVSBkZXZpY2UvbWFzdGVyIG5vZGUgKCNpb21tdS1jZWxs
cywgaW9tbXVzKSBkZXBlbmRzCj4+IG9uIG1hbnkgZmFjdG9ycyBhbmQgaXMgcmVhbGx5IGRyaXZl
ciBkZXBlbmRlZCB0aGluZy4KPj4KPj4gUGxlYXNlIG5vdGUsIGFsbCBJT01NVSBkcml2ZXJzIHdo
aWNoIHN1cHBvcnQgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncwo+PiBzaG91bGQgdXNlICJkdF94
bGF0ZSIgYW5kICJhZGRfZGV2aWNlIiBjYWxsYmFja3MuCj4+Cj4+IFsxXSBodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvaW9t
bXUudHh0Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPiAKPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
