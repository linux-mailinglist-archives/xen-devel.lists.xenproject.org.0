Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827801EDDA0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 09:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgjx1-00053P-Ly; Thu, 04 Jun 2020 07:06:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dm44=7R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jgjwz-00053K-Ir
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 07:06:05 +0000
X-Inumbo-ID: da2abac2-a631-11ea-ae22-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da2abac2-a631-11ea-ae22-12813bfff9fa;
 Thu, 04 Jun 2020 07:06:03 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9zAhf83GSgEwVQAlNLIU0pGVdGDAshbC0Sjobq4FVFCviv2UJIg1ceYEsq+Yy0UQBCh1NFfEVy
 iMLTX3yV7vbF6Waw25yG9y+zEinLLz1zR9Lro1huou6GtYPZBtzM7yyyrAbkeV8wwEgZAesGPR
 9t4kRazxWGZKk+HF81fNvmBeezr3rFw/eWaf2A0imOXifNpt7cl+sNxzIbSZAhzYx7lP3DUvFq
 UuLfxFcBZb2rPfRlU+omrackTfSfGDW1cThP56PbO0AyoTGYXRLwTK9XnJksPbOfMd9H9U2L+p
 U9U=
X-SBRS: 2.7
X-MesageID: 19486747
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,471,1583211600"; d="scan'208";a="19486747"
Date: Thu, 4 Jun 2020 09:05:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Agarwal, Anchal" <anchalag@amazon.com>
Subject: Re: [PATCH 06/12] xen-blkfront: add callbacks for PM suspend and
 hibernation]
Message-ID: <20200604070548.GH1195@Air-de-Roger>
References: <7FD7505E-79AA-43F6-8D5F-7A2567F333AB@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7FD7505E-79AA-43F6-8D5F-7A2567F333AB@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

Hello,

On Wed, Jun 03, 2020 at 11:33:52PM +0000, Agarwal, Anchal wrote:
>  CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
>     On Tue, May 19, 2020 at 11:27:50PM +0000, Anchal Agarwal wrote:
>     > From: Munehisa Kamata <kamatam@amazon.com>
>     > 
>     > S4 power transition states are much different than xen
>     > suspend/resume. Former is visible to the guest and frontend drivers should
>     > be aware of the state transitions and should be able to take appropriate
>     > actions when needed. In transition to S4 we need to make sure that at least
>     > all the in-flight blkif requests get completed, since they probably contain
>     > bits of the guest's memory image and that's not going to get saved any
>     > other way. Hence, re-issuing of in-flight requests as in case of xen resume
>     > will not work here. This is in contrast to xen-suspend where we need to
>     > freeze with as little processing as possible to avoid dirtying RAM late in
>     > the migration cycle and we know that in-flight data can wait.
>     > 
>     > Add freeze, thaw and restore callbacks for PM suspend and hibernation
>     > support. All frontend drivers that needs to use PM_HIBERNATION/PM_SUSPEND
>     > events, need to implement these xenbus_driver callbacks. The freeze handler
>     > stops block-layer queue and disconnect the frontend from the backend while
>     > freeing ring_info and associated resources. Before disconnecting from the
>     > backend, we need to prevent any new IO from being queued and wait for existing
>     > IO to complete. Freeze/unfreeze of the queues will guarantee that there are no
>     > requests in use on the shared ring. However, for sanity we should check
>     > state of the ring before disconnecting to make sure that there are no
>     > outstanding requests to be processed on the ring. The restore handler
>     > re-allocates ring_info, unquiesces and unfreezes the queue and re-connect to
>     > the backend, so that rest of the kernel can continue to use the block device
>     > transparently.
>     > 
>     > Note:For older backends,if a backend doesn't have commit'12ea729645ace'
>     > xen/blkback: unmap all persistent grants when frontend gets disconnected,
>     > the frontend may see massive amount of grant table warning when freeing
>     > resources.
>     > [   36.852659] deferring g.e. 0xf9 (pfn 0xffffffffffffffff)
>     > [   36.855089] xen:grant_table: WARNING:e.g. 0x112 still in use!
>     > 
>     > In this case, persistent grants would need to be disabled.
>     > 
>     > [Anchal Changelog: Removed timeout/request during blkfront freeze.
>     > Reworked the whole patch to work with blk-mq and incorporate upstream's
>     > comments]
> 
>     Please tag versions using vX and it would be helpful if you could list
>     the specific changes that you performed between versions. There where
>     3 RFC versions IIRC, and there's no log of the changes between them.
> 
> I will elaborate on "upstream's comments" in my changelog in my next round of patches.

Sorry for being picky, but can you please make sure your email client
properly quotes previous emails on reply. Note the lack of '>' added
to the quoted parts of your reply.

>     > +                     }
>     > +
>     >                       break;
>     > +             }
>     > +
>     > +             /*
>     > +              * We may somehow receive backend's Closed again while thawing
>     > +              * or restoring and it causes thawing or restoring to fail.
>     > +              * Ignore such unexpected state regardless of the backend state.
>     > +              */
>     > +             if (info->connected == BLKIF_STATE_FROZEN) {
> 
>     I think you can join this with the previous dev->state == XenbusStateClosed?
> 
>     Also, won't the device be in the Closed state already if it's in state
>     frozen?
> Yes but I think this mostly due to a hypothetical case if during thawing backend switches to Closed state.
> I am not entirely sure if that could happen. Could use some expertise here.

I think the frontend seeing the backend in the closed state during
restore would be a bug that should prevent the frontend from
resuming.

>     > +     /* Kick the backend to disconnect */
>     > +     xenbus_switch_state(dev, XenbusStateClosing);
>     > +
>     > +     /*
>     > +      * We don't want to move forward before the frontend is diconnected
>     > +      * from the backend cleanly.
>     > +      */
>     > +     timeout = wait_for_completion_timeout(&info->wait_backend_disconnected,
>     > +                                           timeout);
>     > +     if (!timeout) {
>     > +             err = -EBUSY;
> 
>     Note err is only used here, and I think could just be dropped.
> 
> This err is what's being returned from the function. Am I missing anything?

Just 'return -EBUSY;' directly, and remove the top level variable. You
can also use -EBUSY directly in the xenbus_dev_error call. Anyway, not
that important.

>     > +             xenbus_dev_error(dev, err, "Freezing timed out;"
>     > +                              "the device may become inconsistent state");
> 
>     Leaving the device in this state is quite bad, as it's in a closed
>     state and with the queues frozen. You should make an attempt to
>     restore things to a working state.
> 
> You mean if backend closed after timeout? Is there a way to know that? I understand it's not good to 
> leave it in this state however, I am still trying to find if there is a good way to know if backend is still connected after timeout.
> Hence the message " the device may become inconsistent state".  I didn't see a timeout not even once on my end so that's why 
> I may be looking for an alternate perspective here. may be need to thaw everything back intentionally is one thing I could think of.

You can manually force this state, and then check that it will behave
correctly. I would expect that on a failure to disconnect from the
backend you should switch the frontend to the 'Init' state in order to
try to reconnect to the backend when possible.

>     > +     }
>     > +
>     > +     return err;
>     > +}
>     > +
>     > +static int blkfront_restore(struct xenbus_device *dev)
>     > +{
>     > +     struct blkfront_info *info = dev_get_drvdata(&dev->dev);
>     > +     int err = 0;
>     > +
>     > +     err = talk_to_blkback(dev, info);
>     > +     blk_mq_unquiesce_queue(info->rq);
>     > +     blk_mq_unfreeze_queue(info->rq);
>     > +     if (!err)
>     > +         blk_mq_update_nr_hw_queues(&info->tag_set, info->nr_rings);
> 
>     Bad indentation. Also shouldn't you first update the queues and then
>     unfreeze them?
> Please correct me if I am wrong, blk_mq_update_nr_hw_queues freezes the queue
> So I don't think the order could be reversed.

Regardless of what blk_mq_update_nr_hw_queues does, I don't think it's
correct to unfreeze the queues without having updated them. Also the
freezing/unfreezing uses a refcount, so I think it's perfectly fine to
call blk_mq_update_nr_hw_queues first and then unfreeze the queues.

Also note that talk_to_blkback returning an error should likely
prevent any unfreezing, as the queues won't be updated to match the
parameters of the backend.

Thanks, Roger.

