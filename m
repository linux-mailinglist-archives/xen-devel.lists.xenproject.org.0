Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B34C1037C9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 11:44:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXNQP-00066j-Vp; Wed, 20 Nov 2019 10:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXNQN-00066e-R0
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 10:41:27 +0000
X-Inumbo-ID: 4d7a2904-0b82-11ea-a30d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d7a2904-0b82-11ea-a30d-12813bfff9fa;
 Wed, 20 Nov 2019 10:41:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A597C0C7;
 Wed, 20 Nov 2019 10:41:25 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20191115161532.1231811-1-anthony.perard@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7d61ba64-d278-ec11-bbf7-a91bcd4b50e6@suse.com>
Date: Wed, 20 Nov 2019 11:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115161532.1231811-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] configure: Fix test for python
 3.8
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMTkgMTc6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IGh0dHBzOi8vZG9jcy5w
eXRob24ub3JnLzMuOC93aGF0c25ldy8zLjguaHRtbCNkZWJ1Zy1idWlsZC11c2VzLXRoZS1zYW1l
LWFiaS1hcy1yZWxlYXNlLWJ1aWxkCj4gCj4+IFRvIGVtYmVkIFB5dGhvbiBpbnRvIGFuIGFwcGxp
Y2F0aW9uLCBhIG5ldyAtLWVtYmVkIG9wdGlvbiBtdXN0IGJlCj4+IHBhc3NlZCB0byBweXRob24z
LWNvbmZpZyAtLWxpYnMgLS1lbWJlZCB0byBnZXQgLWxweXRob24zLjggKGxpbmsgdGhlCj4+IGFw
cGxpY2F0aW9uIHRvIGxpYnB5dGhvbikuIFRvIHN1cHBvcnQgYm90aCAzLjggYW5kIG9sZGVyLCB0
cnkKPj4gcHl0aG9uMy1jb25maWcgLS1saWJzIC0tZW1iZWQgZmlyc3QgYW5kIGZhbGxiYWNrIHRv
IHB5dGhvbjMtY29uZmlnCj4+IC0tbGlicyAod2l0aG91dCAtLWVtYmVkKSBpZiB0aGUgcHJldmlv
dXMgY29tbWFuZCBmYWlscy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50
aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
