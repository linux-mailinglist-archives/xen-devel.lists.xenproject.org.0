Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D21CF717D9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 14:13:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hptd6-0007VQ-0G; Tue, 23 Jul 2019 12:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wlUe=VU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hptd4-0007VH-OQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 12:10:50 +0000
X-Inumbo-ID: e84ed266-ad42-11e9-95ca-4f83ece8699a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e84ed266-ad42-11e9-95ca-4f83ece8699a;
 Tue, 23 Jul 2019 12:10:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 789B9337;
 Tue, 23 Jul 2019 05:10:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AEAB3F71F;
 Tue, 23 Jul 2019 05:10:47 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190618085851.22902-1-viktor.mitin.19@gmail.com>
 <c9fd6e90-e5bc-0665-4c46-9c86ad0511a2@arm.com>
 <CAOcoXZYRAxyR93aqST4gSG12BcsiUop-4L+xNghaH9TaKG2bdw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ffaabbb1-78d6-b0e1-3c88-a8dbf8ba512d@arm.com>
Date: Tue, 23 Jul 2019 13:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYRAxyR93aqST4gSG12BcsiUop-4L+xNghaH9TaKG2bdw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove unused dt_device_node
 parameter
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDcvMjAxOSAxNDoxOCwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IEhpIEp1bGllbiwKCkhp
LAoKPiAKPiBJJ3ZlIGNoZWNrZWQgbGF0ZXN0IFhlbiBzdGFnaW5nLCB0aGUgcGF0Y2ggaGFzIG5v
dCBiZWVuIGludGVncmF0ZWQgeWV0Lgo+IFBsZWFzZSBpbnRlZ3JhdGUgdGhlIHBhdGNoIGlmIG5v
IG9iamVjdGlvbnMuCgpEb25lIG5vdy4gU29ycnkgZm9yIHRoZSBkZWxheS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
