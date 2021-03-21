Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F11A33434A3
	for <lists+xen-devel@lfdr.de>; Sun, 21 Mar 2021 21:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99858.189950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO4he-0000dR-K1; Sun, 21 Mar 2021 20:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99858.189950; Sun, 21 Mar 2021 20:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lO4he-0000d2-Gx; Sun, 21 Mar 2021 20:29:38 +0000
Received: by outflank-mailman (input) for mailman id 99858;
 Sun, 21 Mar 2021 20:29:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vi5j=IT=lunn.ch=andrew@srs-us1.protection.inumbo.net>)
 id 1lO4hd-0000cx-FV
 for xen-devel@lists.xenproject.org; Sun, 21 Mar 2021 20:29:37 +0000
Received: from vps0.lunn.ch (unknown [185.16.172.187])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd132347-0223-4639-83af-40d68505389b;
 Sun, 21 Mar 2021 20:29:35 +0000 (UTC)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lO4hP-00CIAJ-Ab; Sun, 21 Mar 2021 21:29:23 +0100
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
X-Inumbo-ID: dd132347-0223-4639-83af-40d68505389b
Date: Sun, 21 Mar 2021 21:29:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Hsu, Chiahao" <andyhsu@amazon.com>
Cc: Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org,
	wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
	kuba@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <YFeso1fr1hLxi3lR@lunn.ch>
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch>
 <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch>
 <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com>
 <YFI676dumSDJvTlV@unreal>
 <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com>
 <YFeAzfJsHAqPvPuY@unreal>
 <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com>

> > At the end, it will be more granular module parameter that user still
> > will need to guess.
> I believe users always need to know any parameter or any tool's flag before
> they use it.
> For example, before user try to set/clear this ctrl_ring_enabled, they
> should already have basic knowledge about this feature,
> or else they shouldn't use it (the default value is same as before), and
> that's also why we use the 'ctrl_ring_enabled' as parameter name.

To me, it seems you are fixing this problem in the wrong place. As a
VM user in the cloud, i have no idea how the cloud provider needs the
VM configured to allow the cloud provider to migrate the VM to
somewhere else in the bitbarn. As the VM user, it should not be my
problem. I would expect the cloud provider to configure the VM host to
only expose facilities to the VM which allows it to be migrated.

This is a VM host problem, not a VM problem.

     Andrew

