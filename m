Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3655A0136
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 20:16:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392913.631547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQuv5-0008QD-NO; Wed, 24 Aug 2022 18:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392913.631547; Wed, 24 Aug 2022 18:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQuv5-0008Ne-KO; Wed, 24 Aug 2022 18:16:03 +0000
Received: by outflank-mailman (input) for mailman id 392913;
 Wed, 24 Aug 2022 18:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3dn=Y4=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oQuv3-0008NV-Io
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 18:16:02 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce0a8582-23d8-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 20:16:00 +0200 (CEST)
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
X-Inumbo-ID: ce0a8582-23d8-11ed-9250-1f966e50362f
Date: Wed, 24 Aug 2022 18:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1661364958; x=1661624158;
	bh=/mpj7qEHeAJKaYNyyI1sDjogU+Qn85rht5EB0Ew2s4w=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=PzLJ0RPJ4bZGKwAewTeIlLnMd5v6ZtkUpTBqpfPrKnamale7pmyXe06/znTEVTQbp
	 yT421XBvRoRfR+S62B9ai/AFCxJNB0KDDoCCOU2TU4WsloxvG0TeSZh6Zvo9YAEBS6
	 SpiNZKK7n+qzU5Xbi9meWWE0GYIht6fpn2oyoJ45PaY0sA3VJEjzT50sXsZvhCSQTN
	 gnTrWqvP8BkwtrlWdE2yxWFO9DNVRg7z7/ogDd6PUg5Vwi8k0+uaGVVVRsCqxEt9x5
	 8w06YBKQqXFKf1Fsk1Dn5xna7N0O1O7EnZ34UA0+fJUoTgM7DpCjMj6IH2Eurwzsuz
	 JRDVawKhqecAQ==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <Zz_iE6KdPdkQ_TjUf-W2ODPIXo2WwXz0JxF5vgPjVuz8uWfJyto5S_nYRzSNrE0jC3r4ILhjkLH_PtW_fmIeTQIQtI6wTZxnUvOl0pr6ne4=@protonmail.com>
In-Reply-To: <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com> <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com> <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com> <c24c469a-e0e9-6162-b8d3-07c1707fc2d8@citrix.com> <ahcgeCqoQJKf6ZfqNjJzlj2HrfbP1WIHtoWUchYWvX-AYoV-eapQJzAPmjPXpOU_pfDsYjgXx3K0CzD9Z2eFHhbpBJpJBidXKBWIFSmDa14=@protonmail.com> <55eb8485-0c0d-51cd-c9b8-d517994ec6c6@suse.com> <QUNqwybRmGkA3A2mUhDhAo-9qWFOaa1hpbwQG_GhKmVTf70L7qcvpw7ekgAz1S9N1eWVhFChE8KTll9jxNrPF5r2-RC9O3ao2CXL3PHNBlc=@protonmail.com> <7807b9cf-a09e-a393-ee7a-dc220a68e56e@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_gfbjpSg081swf3rbsythQlC9EC5wpuPu2Az2qRBA8"

This is a multi-part message in MIME format.

--b1_gfbjpSg081swf3rbsythQlC9EC5wpuPu2Az2qRBA8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSSdtIHNvcnJ5IEkgZGlkbid0IGdldCB3aGVyZSBpbiAvc3lzL2Zpcm13YXJlIHlv
dSdkIGxpa2UgdG8gdGFrZSBhIGxvb2sgYXQuCgpTb21ldGltZXMgd2hlbiBJIHBvd2VyIHRoZSBs
YXB0b3Agb2ZmIEkgY2FuIHNlZSBpdCdzIGNyYXNoaW5nIHNvbWV3aGVyZSBpbiBBQ1BJL3dlaXJk
IGFkZHJlc3MgaXNzdWUKCklzIHRoZXJlIGFueW9uZSBlbHNlIHN0cnVnZ2xpbmcgd2l0aCBBTUQg
Unl6ZW4gNjAwMCBvbiBYZW4/

--b1_gfbjpSg081swf3rbsythQlC9EC5wpuPu2Az2qRBA8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SSdtIHNvcnJ5IEkgZGlkbid0IGdldCB3aGVyZSBpbiAvc3lzL2Zpcm13
YXJlIHlvdSdkIGxpa2UgdG8gdGFrZSBhIGxvb2sgYXQuPGJyPjxicj5Tb21ldGltZXMgd2hlbiBJ
IHBvd2VyIHRoZSBsYXB0b3Agb2ZmIEkgY2FuIHNlZSBpdCdzIGNyYXNoaW5nIHNvbWV3aGVyZSBp
biBBQ1BJL3dlaXJkIGFkZHJlc3MgaXNzdWU8YnI+PGJyPklzIHRoZXJlIGFueW9uZSBlbHNlIHN0
cnVnZ2xpbmcgd2l0aCBBTUQgUnl6ZW4gNjAwMCBvbiBYZW4/


--b1_gfbjpSg081swf3rbsythQlC9EC5wpuPu2Az2qRBA8--


