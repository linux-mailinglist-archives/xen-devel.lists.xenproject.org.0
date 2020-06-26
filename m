Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F123620AECD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 11:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jokPt-00055K-Ag; Fri, 26 Jun 2020 09:13:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Q51=AH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jokPs-00055A-EE
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 09:13:00 +0000
X-Inumbo-ID: 3ab934a6-b78d-11ea-8289-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ab934a6-b78d-11ea-8289-12813bfff9fa;
 Fri, 26 Jun 2020 09:12:59 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: T38r9SNgToIC/w7aDuAM7EkY+pgK9okoEH0+lTSUJx07CqgWIROtb49rxOQRiXXPaeR6ZVZAGe
 StGKMh2imfI2uuyLlp3OGlC5nDgFxMKtx5pIVhpU3XlrJF0ZxKoJjUu+mxvKfsjopB5rUF3lff
 2pwoaqIcMFJJG1jo2L4B6VpoibYfqee8fD8v+Oht/J1BEzkTqaoOvmUJaw5xhWN2jM7f74uyD+
 Ln8OyB8paYUUr8zh+f8v799e4f5+l+Drl9NZqdD96XIitldvVaKU3Qv9lxaj1fFBR+HkW8UWif
 1X8=
X-SBRS: 2.7
X-MesageID: 21014931
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,283,1589256000"; d="scan'208";a="21014931"
Date: Fri, 26 Jun 2020 11:12:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Subject: Re: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation]
Message-ID: <20200626091239.GA735@Air-de-Roger>
References: <7FD7505E-79AA-43F6-8D5F-7A2567F333AB@amazon.com>
 <20200604070548.GH1195@Air-de-Roger>
 <20200616214925.GA21684@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200617083528.GW735@Air-de-Roger>
 <20200619234312.GA24846@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200622083846.GF735@Air-de-Roger>
 <20200623004314.GA28586@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200623081903.GP735@Air-de-Roger>
 <20200625183659.GA26586@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200625183659.GA26586@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
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

On Thu, Jun 25, 2020 at 06:36:59PM +0000, Anchal Agarwal wrote:
> On Tue, Jun 23, 2020 at 10:19:03AM +0200, Roger Pau Monné wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > 
> > 
> > 
> > On Tue, Jun 23, 2020 at 12:43:14AM +0000, Anchal Agarwal wrote:
> > > On Mon, Jun 22, 2020 at 10:38:46AM +0200, Roger Pau Monné wrote:
> > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > >
> > > >
> > > >
> > > > On Fri, Jun 19, 2020 at 11:43:12PM +0000, Anchal Agarwal wrote:
> > > > > On Wed, Jun 17, 2020 at 10:35:28AM +0200, Roger Pau Monné wrote:
> > > > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Tue, Jun 16, 2020 at 09:49:25PM +0000, Anchal Agarwal wrote:
> > > > > > > On Thu, Jun 04, 2020 at 09:05:48AM +0200, Roger Pau Monné wrote:
> > > > > > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > > > > > On Wed, Jun 03, 2020 at 11:33:52PM +0000, Agarwal, Anchal wrote:
> > > > > > > > >  CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> > > > > > > > >     > +             xenbus_dev_error(dev, err, "Freezing timed out;"
> > > > > > > > >     > +                              "the device may become inconsistent state");
> > > > > > > > >
> > > > > > > > >     Leaving the device in this state is quite bad, as it's in a closed
> > > > > > > > >     state and with the queues frozen. You should make an attempt to
> > > > > > > > >     restore things to a working state.
> > > > > > > > >
> > > > > > > > > You mean if backend closed after timeout? Is there a way to know that? I understand it's not good to
> > > > > > > > > leave it in this state however, I am still trying to find if there is a good way to know if backend is still connected after timeout.
> > > > > > > > > Hence the message " the device may become inconsistent state".  I didn't see a timeout not even once on my end so that's why
> > > > > > > > > I may be looking for an alternate perspective here. may be need to thaw everything back intentionally is one thing I could think of.
> > > > > > > >
> > > > > > > > You can manually force this state, and then check that it will behave
> > > > > > > > correctly. I would expect that on a failure to disconnect from the
> > > > > > > > backend you should switch the frontend to the 'Init' state in order to
> > > > > > > > try to reconnect to the backend when possible.
> > > > > > > >
> > > > > > > From what I understand forcing manually is, failing the freeze without
> > > > > > > disconnect and try to revive the connection by unfreezing the
> > > > > > > queues->reconnecting to backend [which never got diconnected]. May be even
> > > > > > > tearing down things manually because I am not sure what state will frontend
> > > > > > > see if backend fails to to disconnect at any point in time. I assumed connected.
> > > > > > > Then again if its "CONNECTED" I may not need to tear down everything and start
> > > > > > > from Initialising state because that may not work.
> > > > > > >
> > > > > > > So I am not so sure about backend's state so much, lets say if  xen_blkif_disconnect fail,
> > > > > > > I don't see it getting handled in the backend then what will be backend's state?
> > > > > > > Will it still switch xenbus state to 'Closed'? If not what will frontend see,
> > > > > > > if it tries to read backend's state through xenbus_read_driver_state ?
> > > > > > >
> > > > > > > So the flow be like:
> > > > > > > Front end marks XenbusStateClosing
> > > > > > > Backend marks its state as XenbusStateClosing
> > > > > > >     Frontend marks XenbusStateClosed
> > > > > > >     Backend disconnects calls xen_blkif_disconnect
> > > > > > >        Backend fails to disconnect, the above function returns EBUSY
> > > > > > >        What will be state of backend here?
> > > > > >
> > > > > > Backend should stay in state 'Closing' then, until it can finish
> > > > > > tearing down.
> > > > > >
> > > > > It disconnects the ring after switching to connected state too.
> > > > > > >        Frontend did not tear down the rings if backend does not switches the
> > > > > > >        state to 'Closed' in case of failure.
> > > > > > >
> > > > > > > If backend stays in CONNECTED state, then even if we mark it Initialised in frontend, backend
> > > > > >
> > > > > > Backend will stay in state 'Closing' I think.
> > > > > >
> > > > > > > won't be calling connect(). {From reading code in frontend_changed}
> > > > > > > IMU, Initialising will fail since backend dev->state != XenbusStateClosed plus
> > > > > > > we did not tear down anything so calling talk_to_blkback may not be needed
> > > > > > >
> > > > > > > Does that sound correct?
> > > > > >
> > > > > > I think switching to the initial state in order to try to attempt a
> > > > > > reconnection would be our best bet here.
> > > > > >
> > > > > It does not seems to work correctly, I get hung tasks all over and all the
> > > > > requests to filesystem gets stuck. Backend does shows the state as connected
> > > > > after xenbus_dev_suspend fails but I think there may be something missing.
> > > > > I don't seem to get IO interrupts thereafter i.e hitting the function blkif_interrupts.
> > > > > I think just marking it initialised may not be the only thing.
> > > > > Here is a short description of what I am trying to do:
> > > > > So, on timeout:
> > > > >     Switch XenBusState to "Initialized"
> > > > >     unquiesce/unfreeze the queues and return
> > > > >     mark info->connected = BLKIF_STATE_CONNECTED
> > > >
> > > > If xenbus state is Initialized isn't it wrong to set info->connected
> > > > == CONNECTED?
> > > >
> > > Yes, you are right earlier I was marking it explicitly but that was not right,
> > > the connect path for blkfront will do that.
> > > > You should tear down all the internal state (like a proper close)?
> > > >
> > > Isn't that similar to disconnecting in the first place that failed during
> > > freeze? Do you mean re-try to close but this time re-connect after close
> > > basically do everything you would at "restore"?
> > 
> > Last time I checked blkfront supported reconnections (ie: disconnect
> > from a backend and connect again). I was assuming we could apply the
> > same here on timeout, and just follow the same path where the frontend
> > waits indefinitely for the backend to close and then attempts to
> > reconnect.
> > 
> > > Also, I experimented with that and it works intermittently. I want to take a
> > > step back on this issue and ask few questions here:
> > > 1. Is fixing this recovery a blocker for me sending in a V2 version?
> > 
> > At the end of day it's your feature. I would certainly prefer for it
> > to work as good as possible, this being a recovery in case of failure
> > just make sure it does something sane (ie: crash/close the frontend)
> > and add a TODO note.
> > 
> > > 2. In our 2-3 years of supporting this feature at large scale we haven't seen this issue
> > > where backend fails to disconnect. What we are trying to do here is create a
> > > hypothetical situation where we leave backend in Closing state and try and see how it
> > > recovers. The reason why I think it "may not" occur and the timeout of 5HZ is
> > > sufficient is because we haven't come across even a single use-case where it
> > > caused hibernation to fail.
> > > The reason why I think "it may" occur is if we are running a really memory
> > > intensive workload and ring is busy and is unable to complete all the requests
> > > in the given timeout. This is very unlikely though.
> > 
> > As said above I would generally prefer for code to handle possible
> > failures the best way, and hence I think here it would be nice to
> > fallback to the normal disconnect path and just wait for the backend
> > to close.
> >
> Do you mind throwing some light in here, what that path may be, if its
> straight forward to fix I would like to debug it a bit more. May be I am
> missing some of the context here.

So the frontend should do:

- Switch to Closed state (and cleanup everything required).
- Wait for backend to switch to Closed state (must be done
  asynchronously, handled in blkback_changed).
- Switch frontend to XenbusStateInitialising, that will in turn force
  the backend to switch to XenbusStateInitWait.
- After that it should just follow the normal connection procedure.

I think the part that's missing is the frontend doing the state change
to XenbusStateInitialising when the backend switches to the Closed
state.

> I was of the view we may just want to mark frontend closed which should do 
> the job of freeing resources and then following the same flow as
> blkfront_restore. That does not seems to work correctly 100% of the time.

I think the missing part is that you must wait for the backend to
switch to the Closed state, or else the switch to
XenbusStateInitialising won't be picked up correctly by the backend
(because it's still doing it's cleanup).

Using blkfront_restore might be an option, but you need to assert the
backend is in the initial state before using that path.

> > You likely have this very well tuned to your own environment and
> > workloads, since this will now be upstream others might have more
> > contended systems where it could start to fail.
> > 
> I agree, however, this is also from the testing I did with 100 of runs 
> outside of EC2 running few tests of my own. 
> > > 3) Also, I do not think this may be straight forward to fix and expect
> > > hibernation to work flawlessly in subsequent invocations. I am open to
> > > all suggestions.
> > 
> > Right, adding a TODO would seem appropriate then.
> >
> Just to double check, I will send in a V2 with this marked as TO-DO?

I think that's fine. Please clearly describe what's missing, so
others know what they might have to implement.

Thanks, Roger.

