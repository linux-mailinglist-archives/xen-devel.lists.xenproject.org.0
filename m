Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E441A52FE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Apr 2020 19:04:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNJX5-0002u7-6U; Sat, 11 Apr 2020 17:03:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aaZy=53=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jNJX3-0002u2-Oq
 for xen-devel@lists.xen.org; Sat, 11 Apr 2020 17:03:01 +0000
X-Inumbo-ID: 4c2d3d98-7c16-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c2d3d98-7c16-11ea-b58d-bc764e2007e4;
 Sat, 11 Apr 2020 17:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586624581;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=lX0gEFd+llQd3iCLBmuTrQiufaicbK9rCs3Gnvs4jZ4=;
 b=TOLSZrnOG6fJOOICwrn7BdzDKJ7PM7QZ4N1rhMpLvvyuBFu6ohDEdYWN
 4n4kGQEBes6mH6U/5wkDBWAUxpVHtHKGW2FpvsMOQscSnDY4hgdVPwvi/
 oAGHB9WZQ78nrD/+oLJViVvsIbSJgKlsDaau6wRNdDgu+dlj5P1VCeWt8 M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tjTLgeqH4zgdl4zlRoGMyIBB5q7a0CYMjuPV9jX3bb80EwoAoycZ+pSH5PSlU8mmY6r0KjVNsD
 GwkPuX5dtUysj6bsjQftR/mwhPzGVgdRzfMvOZC0PuGJp/cg1HRdrejW0wXEisZ5qJcCs7aFUy
 lzKhkwYlV+T9r5d2X5wDehXwiZtXfFKS/oNrsEYIZZefm62LlBdTS6gmNYCyNs15AMX6a4bV8a
 8M+hx5T6AUaACBfYWPre/Ke2hXUrrlwSPpNSjjk+pSbft4Ccp1yMC1ttJKUDqS7e6u+oAiyjya
 gao=
X-SBRS: 2.7
X-MesageID: 15518887
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,371,1580792400"; d="scan'208";a="15518887"
Subject: Re: XEN 4.11 PV questions
To: Asaf Fisher <asaffisher.dev@gmail.com>, "xen-devel@lists.xen.org"
 <xen-devel@lists.xen.org>
References: <CAHmESttxVE+E93svHBEwCE1pNYc9Lxkb+L2vm2jGwbBwOEMOXA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2713ff72-9560-7a1b-3aef-3513fda14b85@citrix.com>
Date: Sat, 11 Apr 2020 18:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHmESttxVE+E93svHBEwCE1pNYc9Lxkb+L2vm2jGwbBwOEMOXA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/04/2020 15:10, Asaf Fisher wrote:
> Hello,
> In general I have a intel family 6 model 94 and xen does not support
> so I want to add support to it.

Model 94 (== 0x5e) is Skylake, which has been around for quite a while
now.  (Alternatively, if you mean 0x94, I'm not sure that is even a
production CPU.)

Which CPU do you have, and what is actually going wrong?

> For the question:
>
> I’m trying to understand exactly how and when dom0’s vCPU gets a
> runtime and where in the code is like the “vmenter”(I know there is no
> such a thing in pv..)

Mechanically, PV guests running under Xen is just like regular
userspace.  You get there via IRET/SYSRET.

>
> So:
> 1. I got 2 pCPUs and I see that after the secondary cpu gets setup it
> goes into and idle loop and wait for a task. 
>
> 2. When primary cpu finishes init xen, it unpauses dom0 and therefore
> schedule it’s vCPU and call the wake function on the credit scheduler.
> I’m getting a hard time understanding what the wake do... does it put
> a tasklet in the percpu section and then the pCPU see it in its
> tasklet on the idle loop? If not what really happens? If yes, how what
> is the code flow that causes the dom0 code to be executed? Is it a
> context switch? If so where? Or is it just a function call?(I think
> it’s highly unlikely)

During Xen's boot, all APs start up and starts running the idle vCPU
(there is actually one idle vcpu for each CPU in the system).  This is
idle loop.

The very end of Xen's boot path unpauses dom0 (marks the scheduler
softirq pending), and runs the idle vCPU.  At this point, d0v0 is the
only non-idle and runnable vcpu in the system.

As a softirq is pending, the idle loop processes that first before going
to sleep.  This runs the schedule() function which finds d0v0 ready to
run, and context switches to it.

On x86, we have per-CPU stacks, not per-vCPU stacks, so context switch
involves playing with state at the base of the current stack, rather
than changing to a different stack.  After all of this is done, the end
of context_switch() invokes  d->arch.ctxt_switch->tail() which, for PV
guests, which resets the stack pointer to the base, and executes
ret_from_intr().  This is now in assembly code, and eventually IRET's to
dom0's entrypoint.

~Andrew

