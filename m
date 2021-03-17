Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46D633F6A9
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 18:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98765.187551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMZst-000428-I5; Wed, 17 Mar 2021 17:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98765.187551; Wed, 17 Mar 2021 17:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMZst-00041l-EW; Wed, 17 Mar 2021 17:23:03 +0000
Received: by outflank-mailman (input) for mailman id 98765;
 Wed, 17 Mar 2021 17:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c7eI=IP=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1lMZss-00041g-2F
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 17:23:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f5895e0-d597-4679-badc-e5883ad12c51;
 Wed, 17 Mar 2021 17:23:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 210CA64E0F;
 Wed, 17 Mar 2021 17:22:58 +0000 (UTC)
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
X-Inumbo-ID: 7f5895e0-d597-4679-badc-e5883ad12c51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616001779;
	bh=74/f/Wzopymb3TYHhkM3Uc2jmgW+8Uo0wBgVU5snhhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qG9K6j+XqZdFmnn7p+OgtyN64Q3HOBvZ6JUF+0I38SYZyB7TB1ikUDGIvj/6bf6bS
	 nKDfc/N0wwSZ81hNYRrZO4Rs6iiWzxsTd0R1r7AZu+otzbHNBGZC2vBGgVVulzID95
	 AGlWEBh5G6I0KVr5BYiyCJbtsI8e6OPhMuvLjKBjYh358T2wjAp+gUTqsym7F5iUap
	 RsZen7di5+xf1yYlqwFXgKAc4VqmCvE7Uk5OOSAe2KQDPXHnwNQeYgKGekUVVVd6MT
	 Znx/HnhSM/FVgDL4JPhFwWRWKa3ViwPiUl4DZ+cD2a+381kaPFG17vAXvR6TwjAAp9
	 ToOOCHfmxJ6og==
Date: Wed, 17 Mar 2021 19:22:55 +0200
From: Leon Romanovsky <leon@kernel.org>
To: "Hsu, Chiahao" <andyhsu@amazon.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
	kuba@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YFI676dumSDJvTlV@unreal>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch>
 <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch>
 <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com>

On Tue, Mar 16, 2021 at 04:22:21PM +0100, Hsu, Chiahao wrote:
>
>
> Leon Romanovsky 於 2021/3/14 11:04 寫道:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >
> >
> >
> > On Fri, Mar 12, 2021 at 09:36:59PM +0100, Andrew Lunn wrote:
> > > On Fri, Mar 12, 2021 at 04:18:02PM +0100, Hsu, Chiahao wrote:
> > > > Andrew Lunn 於 2021/3/12 15:52 寫道:
> > > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > >
> > > > >
> > > > >
> > > > > On Thu, Mar 11, 2021 at 10:59:44PM +0000, ChiaHao Hsu wrote:
> > > > > > In order to support live migration of guests between kernels
> > > > > > that do and do not support 'feature-ctrl-ring', we add a
> > > > > > module parameter that allows the feature to be disabled
> > > > > > at run time, instead of using hardcode value.
> > > > > > The default value is enable.
> > > > > Hi ChiaHao
> > > > >
> > > > > There is a general dislike for module parameters. What other mechanisms
> > > > > have you looked at? Would an ethtool private flag work?
> > > > >
> > > > >        Andrew
> > > >
> > > > Hi Andrew,
> > > >
> > > > I can survey other mechanisms, however before I start doing that,
> > > >
> > > > could you share more details about what the problem is with using module
> > > > parameters? thanks.
> > > It is not very user friendly. No two kernel modules use the same
> > > module parameters. Often you see the same name, but different
> > > meaning. There is poor documentation, you often need to read the
> > > kernel sources it figure out what it does, etc.
> > +1, It is also global parameter to whole system/devices that use this
> > module, which is rarely what users want.
> >
> > Thanks
>
> Hi,
> I think I would say the current implementation(modparams) isappropriate
> after reviewing it again.
>
> We are talking about 'feature leveling', a way to support live migrationof
> guest
> between kernels that do and do not support the features. So we want to
> refrain
> fromadding the features if guest would be migrated to the kernel which does
> not support the feature. Everythingshould be done (in probe function) before
> frontend connects, and this is why ethtool is not appropriate for this.

It wouldn't be a surprise to you that feature discovery is not supposed
to be done through module parameters. Instead of asking from user to
randomly disable some feature, the system is expected to be backward
compatible and robust enough to query the list of supported/needed
features.

Thanks

>
> Thanks
>
>

