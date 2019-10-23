Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47FBE1CFB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:43:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGsT-0002CV-At; Wed, 23 Oct 2019 13:40:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGsR-0002CN-Jf
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:40:39 +0000
X-Inumbo-ID: b2b5e6d0-f59a-11e9-947e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2b5e6d0-f59a-11e9-947e-12813bfff9fa;
 Wed, 23 Oct 2019 13:40:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18ED8B948;
 Wed, 23 Oct 2019 13:40:38 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-4-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1f4e41b6-40cc-e63f-28c0-8c2f6c4c8853@suse.com>
Date: Wed, 23 Oct 2019 15:40:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-4-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 03/11] libxl:
 libxl__domain_config_setdefault: New function
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IEJyZWFrIG91dCB0aGlzIGlu
dG8gYSBuZXcgZnVuY3Rpb24uICBXZSBhcmUgZ29pbmcgdG8gd2FudCB0byBjYWxsIGl0Cj4gZnJv
bSBhIG5ldyBjYWxsIHNpdGUuCj4gCj4gVW5mb3J0dW5hdGVseSBub3QgYWxsIG9mIHRoZSBkZWZh
dWx0cyBjYW4gYmUgbW92ZWQgaW50byB0aGUgbmV3Cj4gZnVuY3Rpb24gd2l0aG91dCBjaGFuZ2lu
ZyB0aGUgb3JkZXIgaW4gd2hpY2ggdGhpbmdzIGFyZSBkb25lLiAgVGhhdAo+IGRvZXMgbm90IHNl
ZW0gd2lzZSBhdCB0aGlzIHN0YWdlIG9mIHRoZSByZWxlYXNlLiAgVGhlIGVmZmVjdCBpcyB0aGF0
Cj4gYWRkaXRpb25hbCBjYWxscyB0byBsaWJ4bF9fZG9tYWluX2NvbmZpZ19zZXRkZWZhdWx0ICh3
aGljaCBhcmUgZ29pbmcKPiB0byBiZSBpbnRyb2R1Y2VkKSBkbyBub3QgcXVpdGUgc2V0IGV2ZXJ5
dGhpbmcuICBCdXQgdGhleSB3aWxsIGRvIHdoYXQKPiBpcyBuZWVkZWQuICBBZnRlciBYZW4gNC4x
MyBpcyBkb25lLCB3ZSBzaG91bGQgbW92ZSB0aG9zZSBzZXR0aW5ncyBpbnRvCj4gdGhlIHJpZ2h0
IG9yZGVyLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
