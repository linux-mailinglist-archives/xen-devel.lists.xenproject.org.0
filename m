Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71156592E7F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 13:51:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387325.623516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYcD-0002sc-J7; Mon, 15 Aug 2022 11:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387325.623516; Mon, 15 Aug 2022 11:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNYcD-0002pa-Fc; Mon, 15 Aug 2022 11:50:41 +0000
Received: by outflank-mailman (input) for mailman id 387325;
 Mon, 15 Aug 2022 11:50:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ks0i=YT=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oNYcC-0002pU-88
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 11:50:40 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b3e827d-1c90-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 13:50:39 +0200 (CEST)
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
X-Inumbo-ID: 7b3e827d-1c90-11ed-924f-1f966e50362f
Date: Mon, 15 Aug 2022 11:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1660564238; x=1660823438;
	bh=hRQlxPddwCf9sjX6+JyFNo/XCvoa8HfQQiAJC3fW6uc=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=LEEwrb8yPxwI5/3N424PTxM7XKRgmd5uTNcyjeWzvbhHPv8OWO36pShlkCz/BUSi+
	 hpD1V+YTxynKZXirm8MAfUP8ljO7SSFFK6YYyr4jm5CrzXWMf9KgvSdSBphtRBBbWP
	 itRSBGgocmUxMMogZq9rB8R1m4UmOxYWinCTWiPmiv1v1dmzvVZ9iwqqCXTGLt6u7W
	 lQMMVjHLlFq76YaSQ6H0o5z0DUhykN0UrkbzG/tCW0S9Xz8AoXGkAFu5ZRPBoeBdll
	 PGzSEK0Mes87eeGUdy8T76x2eFFSJyCREzEhOadf2eFXlYy9C2Uv6duS7z68LegNhr
	 Y9P0i6IgLfOeA==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew.Cooper3@citrix.com
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <hmW-sWMVRYCoU-mAfrk4S7t4r2n26KUbGH8niCwfyCgij4Xj8cur2HVqAbrwbf-slNF8JQlARIWuMpAUhNTUf4peJCMMKUO4lhl-WvC2F2g=@protonmail.com>
In-Reply-To: <2155eb83-e421-1f55-75ca-d9e828b609de@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <4c3976aa-dad4-2707-2852-9b26593692d0@citrix.com> <pDQL7BhwlO49buWymLE-VFEZJim7qNeMmAeThZgHF9qzcbNbQ6ZoSXktgD14I_HYpsdxqfCugrNoJ227u5DLCWEEXk_h9c7bf4iKdgoQbQ8=@protonmail.com> <b3e00f33-527e-e29c-87fb-0773344aa1f6@suse.com> <a485f128-6caf-4f4a-3d61-423e2ee67121@suse.com> <uGB9M0prJ1uFQ4e4SWvoe_jFXgjpBlNr1C8q90DWeR6CtiSzXBUQ1nGLD6tl1dTeYvqP6347vsu-MVKu7P17KH4QU8GFSkeuOCcQCyslSMY=@protonmail.com> <2155eb83-e421-1f55-75ca-d9e828b609de@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_bYAbNR41mPSdwCPVBcOM7UejgfDoq4vp7zlYAFbxOiU"

This is a multi-part message in MIME format.

--b1_bYAbNR41mPSdwCPVBcOM7UejgfDoq4vp7zlYAFbxOiU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLAoKSW5kZWVkIGFkZGluZyBub3JlYm9vdCBkb2VzIHJlc3VsdCBpbiB0aGUgZGV2aWNl
IGp1c3QgaGFuZ2luZyB0aGVyZSBhZnRlciBzdGFydGluZyBhIFZNLgoKSSB3b25kZXIgaWYgaXQn
cyBwb3NzaWJsZSB0byBoYXZlIFhlbiB3cml0ZSBvdXQgaXQncyBsb2cgdG8gc29tZSBtZW1vcnkg
YWRkcmVzcywgaG9waW5nIGl0J3MgZG9pbmcgYSB3YXJtIHJlc2V0IHRoZSBsb2cgbWVzc2FnZXMg
c2hvdWxkIHN0aWxsIGJlIHByZXNlbnQuCgpDaGVlcnM=

--b1_bYAbNR41mPSdwCPVBcOM7UejgfDoq4vp7zlYAFbxOiU
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGkgSmFuLDxicj48YnI+SW5kZWVkIGFkZGluZyBub3JlYm9vdCBkb2VzIHJlc3VsdCBpbiB0aGUg
ZGV2aWNlIGp1c3QgaGFuZ2luZyB0aGVyZSBhZnRlciBzdGFydGluZyBhIFZNLjxicj48YnI+SSB3
b25kZXIgaWYgaXQncyBwb3NzaWJsZSB0byBoYXZlIFhlbiB3cml0ZSBvdXQgaXQncyBsb2cgdG8g
c29tZSBtZW1vcnkgYWRkcmVzcywgaG9waW5nIGl0J3MgZG9pbmcgYSB3YXJtIHJlc2V0IHRoZSBs
b2cgbWVzc2FnZXMgc2hvdWxkIHN0aWxsIGJlIHByZXNlbnQuPGJyPjxicj5DaGVlcnM=


--b1_bYAbNR41mPSdwCPVBcOM7UejgfDoq4vp7zlYAFbxOiU--


