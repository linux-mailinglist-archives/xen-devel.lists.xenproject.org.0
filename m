Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 323ADE1D2E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:46:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGw2-0002mW-8m; Wed, 23 Oct 2019 13:44:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Og4R=YQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iNGw1-0002mH-3C
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:44:21 +0000
X-Inumbo-ID: 33f849c2-f59b-11e9-947e-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33f849c2-f59b-11e9-947e-12813bfff9fa;
 Wed, 23 Oct 2019 13:44:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C3B89B2C5;
 Wed, 23 Oct 2019 13:44:14 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-10-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <305a2732-3f91-e176-c97f-e1faf7c062c2@suse.com>
Date: Wed, 23 Oct 2019 15:44:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023130013.32382-10-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 09/11] libxl: Move
 domain_create_info_setdefault earlier
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

T24gMjMuMTAuMTkgMTU6MDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IFdlIG5lZWQgdGhpcyBiZWZv
cmUgd2Ugc3RhcnQgdG8gZmlndXJlIG91dCB0aGUgcGFzc3Rocm91Z2ggbW9kZS4KPiAKPiBJIGhh
dmUgY2hlY2tlZCB0aGF0IG5vdGhpbmcgaW4gbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRk
ZWZhdWx0Cj4gbm9yIHRoZSB0d28gaW1wbGVtZW50YXRpb25zIG9mIC4uLl9hcmNoXy4uLiBhY2Nl
c3NlcyBhbnl0aGluZyBlbHNlLAo+IG90aGVyIHRoYW4gKGkpIHRoZSBkb21haW4gdHlwZSAod2hp
Y2ggdGhpcyBmdW5jdGlvbiBpcyByZXNwb25zaWJsZSBmb3IKPiBzZXR0aW5nIGFuZCBub3RoaW5n
IGJlZm9yZSBpdCBsb29rcyBhdCkgKGlpKSBjX2luZm8tPnNzaWRyZWYgKHdoaWNoIGlzCj4gZGVm
YXVsdGVkIGJ5IGZsYXNrIGNvZGUgbmVhciB0aGUgdG9wIG9mCj4gbGlieGxfX2RvbWFpbl9jb25m
aWdfc2V0ZGVmYXVsdCBhbmQgbm90IGFjY2Vzc2VkIGFmdGVyd2FyZHMpLgo+IAo+IFNvIG5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgo+IEFja2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
