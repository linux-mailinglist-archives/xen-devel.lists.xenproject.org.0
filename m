Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F076595564
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 10:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388071.624607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNs1l-0006W6-UV; Tue, 16 Aug 2022 08:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388071.624607; Tue, 16 Aug 2022 08:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNs1l-0006Tt-Rv; Tue, 16 Aug 2022 08:34:21 +0000
Received: by outflank-mailman (input) for mailman id 388071;
 Tue, 16 Aug 2022 08:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=71JP=YU=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oNs1k-0006Tn-8j
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 08:34:20 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3854acfe-1d3e-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 10:34:19 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 3854acfe-1d3e-11ed-924f-1f966e50362f
Date: Tue, 16 Aug 2022 08:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660638858; x=1660898058;
	bh=kUmpH6jrdVouGt6SNwpQUBmpk2AzhF1Ld626dUKdipc=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=RXTz0uXh6jZkX4nQ89Wpdo7bpQGzcCp+a/xyCCOVHdsvvNQSmSIHUwk++VQfHInfj
	 bTA22PJWyIIwILUg1yOkLkh2d89IqFCmyujL06Fn2WXMiumuzfvMd3kY/ci0LU0vQQ
	 xOPoCepZWYcLnyEfjdqFDOV1/3YkU2pZ8HREY8dk4bgXQ783/C/qtVUDJa2cUA7JQo
	 vO9YZkt34ZNRfeGnebfu1kiYjtOrqb1ARng/6/vupc5XBwtc1FumtA01NvzHu1KmHN
	 hLriQwcfKzf2toZ61AIcclfS3z/oNKHvIe3k+0oZ/b1Q5wUJuoWMbhxrKlWjqQH3/x
	 Ka94ihGDu4bnA==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <2Z9txJ9x0dRfAKKDGhv-bzsLzhaGr2eIXMpUtMOqXCaXVobm_mL_fjQ87VfcB3pSc4bOntsOG_aYCmL4CBgJFqwOI23OFyZ67KiKnK-MIP4=@protonmail.com>
In-Reply-To: <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com> <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com> <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com> <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <2d844e18-c1f0-ddf3-6e6c-28b3ba09b427@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_YIhOaH8xrBRGWC3trVyV9TjI81iK1hZXAXwpossEQ0"

This is a multi-part message in MIME format.

--b1_YIhOaH8xrBRGWC3trVyV9TjI81iK1hZXAXwpossEQ0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSW5kZWVkIG5vIGRldmljZXMgYXJlIGJlaW5nIHBhc3NlZCBpbnRvIHRoZSBkb21V
LCBJJ20gc2ltcGx5IHRyeWluZyB0byBzdGFydCBhIHZhbmlsbGEgVk0gd2l0aCBubyBQQ0llIGRl
dmljZXMgYXR0YWNoZWQuCgpDb3VsZCBpdCBiZSBhIG1pc2NvbmZpZ3VyYXRpb24gd2l0aCBBQ1BJ
IHRhYmxlcz8gSSBvcmlnaW5hbGx5IHRob3VnaHQgaXQgY291bGQgYmUgQU1EJ3MgU0VWIGJ1dCBJ
IHRoaW5rIGl0IG1pZ2h0IGp1c3QgYmUgdGhhdCBYZW4gaXMgYXR0ZW1wdGluZyB0byB1c2UgYSBt
ZW1vcnkgcmVnaW9uIHRoYXQgaXQgc2hvdWxkbid0CgpDaGVlcnM=

--b1_YIhOaH8xrBRGWC3trVyV9TjI81iK1hZXAXwpossEQ0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SW5kZWVkIG5vIGRldmljZXMgYXJlIGJlaW5nIHBhc3NlZCBpbnRvIHRo
ZSBkb21VLCBJJ20gc2ltcGx5IHRyeWluZyB0byBzdGFydCBhIHZhbmlsbGEgVk0gd2l0aCBubyBQ
Q0llIGRldmljZXMgYXR0YWNoZWQuPGJyPjxicj5Db3VsZCBpdCBiZSBhIG1pc2NvbmZpZ3VyYXRp
b24gd2l0aCBBQ1BJIHRhYmxlcz8gSSBvcmlnaW5hbGx5IHRob3VnaHQgaXQgY291bGQgYmUgQU1E
J3MgU0VWIGJ1dCBJIHRoaW5rIGl0IG1pZ2h0IGp1c3QgYmUgdGhhdCBYZW4gaXMgYXR0ZW1wdGlu
ZyB0byB1c2UgYSBtZW1vcnkgcmVnaW9uIHRoYXQgaXQgc2hvdWxkbid0PGJyPjxicj5DaGVlcnM=


--b1_YIhOaH8xrBRGWC3trVyV9TjI81iK1hZXAXwpossEQ0--


