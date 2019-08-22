Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B88D99A08
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 19:11:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0qZy-0000fz-Jq; Thu, 22 Aug 2019 17:08:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i0qZx-0000fQ-4R
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 17:08:53 +0000
X-Inumbo-ID: 8420281a-c4ff-11e9-addb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8420281a-c4ff-11e9-addb-12813bfff9fa;
 Thu, 22 Aug 2019 17:08:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF65423404;
 Thu, 22 Aug 2019 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566493732;
 bh=efyEj5kcczN0lq9spr7Cbe1fsESk6b2Jy7eUHP8Z0MU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZSMJYBpu8pB8anzpb+8ZefSREgpjCi+uIqnVplbxwlx6pg5ov2Nuf4og3YaaJjj0W
 q6O0puub7fvs8tE98LLZ9lezW2DFKToCMy21YZkFX6Jruz8tO/vbaAtLXySWiahtXM
 tnLA/B0WpVoLEIpojTnirrKmiaWelMcfV2YesKbY=
Date: Thu, 22 Aug 2019 10:08:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190812173019.11956-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1908221008420.22783@sstabellini-ThinkPad-T480s>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 07/28] xen/arm64: head: Fix typo in the
 documentation on top of init_uart()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMiBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAgIENoYW5nZXMg
aW4gdjM6Cj4gICAgICAgICAtIFBhdGNoIGFkZGVkCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm02
NC9oZWFkLlMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIGIveGVu
L2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IGNkMDMxMDExOTYuLmE2ZjNhYTRlZTUgMTAw
NjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMKPiBAQCAtODI1LDcgKzgyNSw3IEBAIEVOVFJZKHN3aXRjaF90dGJyKQo+
ICAvKgo+ICAgKiBJbml0aWFsaXplIHRoZSBVQVJULiBTaG91bGQgb25seSBiZSBjYWxsZWQgb24g
dGhlIGJvb3QgQ1BVLgo+ICAgKgo+IC0gKiBPdXB1dDoKPiArICogT3V0cHV0Ogo+ICAgKiAgeDIz
OiBFYXJseSBVQVJUIGJhc2UgcGh5c2ljYWwgYWRkcmVzcwo+ICAgKgo+ICAgKiBDbG9iYmVycyB4
MCAtIHgxCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
