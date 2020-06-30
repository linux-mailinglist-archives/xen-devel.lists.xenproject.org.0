Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A8F20F08B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 10:31:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqBem-00049z-FA; Tue, 30 Jun 2020 08:30:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4gHU=AL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqBek-00049u-Uc
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 08:30:18 +0000
X-Inumbo-ID: ed8e4488-baab-11ea-bb8b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed8e4488-baab-11ea-bb8b-bc764e2007e4;
 Tue, 30 Jun 2020 08:30:18 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vJWCbZ24qNBCnRa1jeMfzFihapPAEXWOb/MH/cTYYQUyip68MUIwSFss/OBbvXPJYIxsyk1cMP
 fykjYjWPPolzXUfAKEKbi8v5e6uTYPGHa6se6prvblrrjZ315fDhXE1Ldp+PwYlfxKFSuTxQzJ
 fPz8b/Ptrkeq2wV7Rn+c0mEizLc08zRTfpE0PDc/3s/85ulln/xVa/ZpKNcjFMEisNHCGoh3Sk
 yQnP6MGeMNavHGNxNXThtwWpJyX4Yohpdvq55ZlG0FcG1zCwqQ5tX3XMLY0i4aQJXKK1yVMij0
 oLM=
X-SBRS: 2.7
X-MesageID: 21593289
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,296,1589256000"; d="scan'208";a="21593289"
Date: Tue, 30 Jun 2020 10:30:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Subject: Re: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation]
Message-ID: <20200630083006.GJ735@Air-de-Roger>
References: <20200604070548.GH1195@Air-de-Roger>
 <20200616214925.GA21684@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200617083528.GW735@Air-de-Roger>
 <20200619234312.GA24846@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200622083846.GF735@Air-de-Roger>
 <20200623004314.GA28586@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200623081903.GP735@Air-de-Roger>
 <20200625183659.GA26586@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200626091239.GA735@Air-de-Roger>
 <20200629192035.GA13195@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200629192035.GA13195@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "len.brown@intel.com" <len.brown@intel.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "bp@alien8.de" <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 29, 2020 at 07:20:35PM +0000, Anchal Agarwal wrote:
> On Fri, Jun 26, 2020 at 11:12:39AM +0200, Roger Pau Monné wrote:
> > So the frontend should do:
> > 
> > - Switch to Closed state (and cleanup everything required).
> > - Wait for backend to switch to Closed state (must be done
> >   asynchronously, handled in blkback_changed).
> > - Switch frontend to XenbusStateInitialising, that will in turn force
> >   the backend to switch to XenbusStateInitWait.
> > - After that it should just follow the normal connection procedure.
> > 
> > I think the part that's missing is the frontend doing the state change
> > to XenbusStateInitialising when the backend switches to the Closed
> > state.
> > 
> > > I was of the view we may just want to mark frontend closed which should do
> > > the job of freeing resources and then following the same flow as
> > > blkfront_restore. That does not seems to work correctly 100% of the time.
> > 
> > I think the missing part is that you must wait for the backend to
> > switch to the Closed state, or else the switch to
> > XenbusStateInitialising won't be picked up correctly by the backend
> > (because it's still doing it's cleanup).
> > 
> > Using blkfront_restore might be an option, but you need to assert the
> > backend is in the initial state before using that path.
> >
> Yes, I agree and I make sure that XenbusStateInitialising only triggers
> on frontend once backend is disconnected. msleep in a loop not that graceful but
> works.
> Frontend only switches to XenbusStateInitialising once it sees backend
> as Closed. The issue here is and may require more debugging is:
> 1. Hibernate instance->Closing failed, artificially created situation by not
> marking frontend Closed in the first place during freezing.
> 2. System comes back up fine restored to 'backend connected'.

I'm not sure I'm following what is happening here, what should happen
IMO is that the backend will eventually reach the Closed state? Ie:
the frontend has initiated the disconnection from the backend by
setting the Closing state, and the backend will have to eventually
reach the Closed state.

At that point the frontend can initiate a reconnection by switching to
the Initialising state.

> 3. Re-run (1) again without reboot
> 4. (4) fails to recover basically freezing does not fail at all which is weird
>    because it should timeout as it passes through same path. It hits a BUG in
>    talk_to_blkback() and instance crashes.

It's hard to tell exactly. I guess you would have to figure what makes
the frontend not get stuck at the same place as the first attempt.

Roger.

