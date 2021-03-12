Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB3339326
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 17:25:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97232.184619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkaz-0006P9-Ki; Fri, 12 Mar 2021 16:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97232.184619; Fri, 12 Mar 2021 16:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKkaz-0006Ok-HM; Fri, 12 Mar 2021 16:25:01 +0000
Received: by outflank-mailman (input) for mailman id 97232;
 Fri, 12 Mar 2021 16:24:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5fd=IK=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1lKkax-0006Of-LP
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 16:24:59 +0000
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ff54ed3-e586-44a1-be7b-be209a467974;
 Fri, 12 Mar 2021 16:24:57 +0000 (UTC)
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
X-Inumbo-ID: 6ff54ed3-e586-44a1-be7b-be209a467974
Date: Fri, 12 Mar 2021 16:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1615566295;
	bh=2ACfSekKEsr5YcE6yaI7EpKojSmgULgoHgJcvTn2nn8=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=eEIwNSrAH8GmtmhNXvUNoiQqCV27oeIKODQFsIfftDfeHz31DbRKUbMYiHfpA9n+s
	 2yInJDjp434cGGvmydRGu7aPXsnPJFFd8fHnQOyEtM32+WqFaV+mm8zI8GYIaejbmC
	 RVDCN4Hbm0JsmH5+WGoN5bXgwfL4oCXdtCa3i5xQ=
To: Marek Marczykowski-G??recki <marmarek@invisiblethingslab.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com, Olivier Lambert <olivier.lambert@vates.fr>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: Working Group for Secure Boot
Message-ID: <YEuVx0NlQ3Z4+m5a@tiny>
In-Reply-To: <YEuHxZy1daBQjGma@mail-itl>
References: <9280f0d0-e994-71c1-9482-63f97296acb7@gmail.com> <YEuHxZy1daBQjGma@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch

On Fri, Mar 12, 2021 at 04:24:53PM +0100, Marek Marczykowski-G??recki wrote=
:
> On Thu, Mar 11, 2021 at 10:34:02AM -0800, Bob Eshleman wrote:
> > We would like to start a working group for secure boot support in Xen
> > to coordinate the various interested parties and set out a plan for
> > the feature and its implications for the whole Xen system.
> [...]
> > We'd love to hear from anyone interested in such a group and how the
> > community as a whole feels about such an effort.
>=20
> Count me in too.
>=20
> Also, I'm cc-ing Trammell, who might be interested too.

Thanks for the invite, Marek.

I'm also interested in discussing how to lockdown a running Xen system.
Now that the unified EFI image patches have been merged, we can boot
with a little more integrity and hopefully transfer the chain of trust
to a trustworthy system.

--=20
Trammell


