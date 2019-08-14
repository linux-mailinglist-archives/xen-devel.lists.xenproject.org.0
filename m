Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C58E0E6
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 00:37:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy1rU-0002UC-TT; Wed, 14 Aug 2019 22:35:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hy1rU-0002U7-5k
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 22:35:20 +0000
X-Inumbo-ID: cb702fde-bee3-11e9-8b98-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb702fde-bee3-11e9-8b98-12813bfff9fa;
 Wed, 14 Aug 2019 22:35:19 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C968208C2;
 Wed, 14 Aug 2019 22:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822118;
 bh=6XWeS+bXb0HQPNkVNhfffr1VGo1AXTnHaJfeMMrfJSk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Tf5RKfc4EgTfTVjMfTij4+fr8b5loptvpbWD8TBSM3/sTWvBRuwn85kLeM0YtmRlU
 YcmLIbv5AqCF3IAMDHuGjmA5j6viyosayV7tZ9SeUilwFyOnEeJtMb25nFqYfkZUKq
 d7seBdzcVRERdhApRQv1F+QkY3J9z5iqOj+GlSKA=
Date: Wed, 14 Aug 2019 15:35:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87ftm5gnkc.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1908141528250.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-2-sstabellini@kernel.org> <87ftm5gnkc.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 2/7] xen/arm: make process_memory_node a
 device_tree_node_func
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
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiBAQCAtMTYy
LDYgKzE1NiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJvY2Vzc19tZW1vcnlfbm9kZShjb25z
dCB2b2lkICpmZHQsIGludCBub2RlLAo+ID4gICAgICAgICAgYm9vdGluZm8ubWVtLmJhbmtbYm9v
dGluZm8ubWVtLm5yX2JhbmtzXS5zaXplID0gc2l6ZTsKPiA+ICAgICAgICAgIGJvb3RpbmZvLm1l
bS5ucl9iYW5rcysrOwo+ID4gICAgICB9Cj4gPiArCj4gPiArICAgIGlmICggYm9vdGluZm8ubWVt
Lm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCj4gPiArICAgICAgICByZXR1cm4gLUVOT1NQQzsK
PiBBcmUgeW91IHN1cmUgdGhhdCB0aGlzIGxvZ2ljIGlzIGNvcnJlY3Q/Cj4gCj4gRm9yIGV4YW1w
bGUsIGlmIE5SX01FTV9CQU5LUyBpcyAxLCBhbmQgd2UgaGF2ZSBleGFjdGx5IG9uZSBtZW1vcnkg
bm9kZQo+IGluIGRldmljZSB0cmVlLCB0aGlzIGZ1bmN0aW9uIHdpbGwgZmFpbC4gQnV0IGl0IHNo
b3VsZCBub3QuIEkgdGhpbmsgeW91Cj4gd2FudCB0aGlzIGNvbmRpdGlvbjogYm9vdGluZm8ubWVt
Lm5yX2JhbmtzID4gTlJfTUVNX0JBTktTCgpZb3UgYXJlIHJpZ2h0LCBpZiBOUl9NRU1fQkFOS1Mg
aXMgMSBhbmQgd2UgaGF2ZSAxIG1lbW9yeSBub2RlIGluIGRldmljZQp0cmVlIHRoZSBjb2RlIHdv
dWxkIHJldHVybiBhbiBlcnJvciB3aGlsZSBhY3R1YWxseSBpdCBpcyBub3JtYWwuCgpJIHRoaW5r
IHRoZSByaWdodCBjaGVjayB3b3VsZCBiZToKCiAgaWYgKCBpIDwgYmFua3MgJiYgYm9vdGluZm8u
bWVtLm5yX2JhbmtzID09IE5SX01FTV9CQU5LUyApCiAgICAgIHJldHVybiAtRU5PU1BDOwoKKFRo
YXQncyBiZWNhdXNlIGl0IGlzIGltcG9zc2libGUgdG8gZ2V0IHRvIG5yX2JhbmtzID4gTlJfTUVN
X0JBTktTLikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
