Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680213A3965
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 03:50:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140119.258972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrWIX-0007Tq-D4; Fri, 11 Jun 2021 01:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140119.258972; Fri, 11 Jun 2021 01:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrWIX-0007Sp-7s; Fri, 11 Jun 2021 01:49:25 +0000
Received: by outflank-mailman (input) for mailman id 140119;
 Fri, 11 Jun 2021 01:49:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C43g=LF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lrWIV-0007Sh-H4
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 01:49:23 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd4b84f1-6dd1-4db7-92f0-a54d5e4886f9;
 Fri, 11 Jun 2021 01:49:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1260613B0;
 Fri, 11 Jun 2021 01:49:21 +0000 (UTC)
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
X-Inumbo-ID: fd4b84f1-6dd1-4db7-92f0-a54d5e4886f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623376162;
	bh=LzqymiWl9W3uKLPJog1kh+tyHSofk1JHiqsNFGP3NRA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aZo0/fuN+9UOLe0Q7uXPSFb93Qu5PdVlN2mgthWsPFNnrkI9CJpdVcAvc5obB2JAp
	 WACvowRZa7T91OJ4srBOKrE1twBQR7NnOZ9XuhLNHX/zKWKsGdlhVpNSGuRU3/QZkr
	 zdbjPgJUxDJWYODbyLDxidkFmL9yxeSTvHzaU988PVScxjxVGTRKV76QZiguWiRUbj
	 uqVIhah/6+MpZ3r7kAXRX0N0fapUW7p1ydMk9eanGkMmy0vVxlfZu395Pdi+OqRJ3Q
	 yhRENYUrgte6hT8aFIE3NbAqEsicfMbrxqxPcRchtqQriuzjEAcqj/6NgQweJ3Lp6E
	 tFiJeYywOvYJA==
Date: Thu, 10 Jun 2021 18:49:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [xen-unstable-smoke test] 162597: regressions - FAIL
In-Reply-To: <E28F5F88-7D8A-46C1-89B8-9841071778D1@arm.com>
Message-ID: <alpine.DEB.2.21.2106101644340.24906@sstabellini-ThinkPad-T480s>
References: <osstest-162597-mainreport@xen.org> <6d95cfac-e43c-d1f0-f988-4f11335b104d@suse.com> <E28F5F88-7D8A-46C1-89B8-9841071778D1@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Jun 2021, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 10 Jun 2021, at 12:32, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 10.06.2021 12:50, osstest service owner wrote:
> >> flight 162597 xen-unstable-smoke real [real]
> >> flight 162602 xen-unstable-smoke real-retest [real]
> >> http://logs.test-lab.xenproject.org/osstest/logs/162597/
> >> http://logs.test-lab.xenproject.org/osstest/logs/162602/
> >> 
> >> Regressions :-(
> >> 
> >> Tests which did not succeed and are blocking,
> >> including tests which could not be run:
> >> test-armhf-armhf-xl         18 guest-start/debian.repeat fail REGR. vs. 162574
> > 
> > This now being the 3rd failure in a row, I guess there's a fair chance
> > of there actually being something wrong with ...
> > 
> >> commit dfcffb128be46a3e413eaa941744536fe53c94b6
> >> Author: Stefano Stabellini <sstabellini@kernel.org>
> >> Date:   Wed Jun 9 10:37:59 2021 -0700
> >> 
> >>    xen/arm32: SPSR_hyp/SPSR
> >> 
> >>    SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
> >>    trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
> >>    See: ARM DDI 0487D.b page G8-5993.
> >> 
> >>    This fixes booting Xen/arm32 on QEMU.
> >> 
> >>    Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>    Reviewed-by: Julien Grall <jgrall@amazon.com>
> >>    Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >>    Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > 
> > ... this. My Arm-untrained eye couldn't spot anything in the logs.
> 
> I am not sure to read the log correctly so do I see it right that dom0 started and it failed then to start a guest ?

Thanks Jan for bringing it to my attention. 

I am not an expert in reading OSSTest logs. From the following:

http://logs.test-lab.xenproject.org/osstest/logs/162597/test-armhf-armhf-xl/info.html

I understand that Xen booted and a DomU was started. However,
"migrate-support-check" and "saverestore-support-check" failed. Is that
correct?

If so, it would be really strange for SPSR_hyp/SPSR to cause the problem
because I would expect Xen to hang at boot before Dom0 is started
instead.


I don't have any ARMv7 hardware to try to repro this issue, and ARMv7 is
most certainly required (ARMv8/aarch32 won't repro.)

Could someone more at ease with OSSTest than me arrange for a run with
this commit reverted to verify that it is the issue?



In any case, I tried to figure it out. I guessed it could be a compiler
error. I followed the white rabbit down the ARM ARM hole. I disassebled
the Xen binary [1] from the failed job. "msr SPSR, r11" is 0x0026a38c.

The encoding should be at B9.3.12 of the ARMv7-A DDI 0406C and F5.1.121
of ARMv8 DDI 0487D.b. Unfortunately it doesn't seem to match either one
of them and I don't understand why.


The "mrs r11, SPSR" is generated as 0x00262ecc. That should be described
at F5.1.117 for ARMv8 and B9.3.9 for ARMv7. Also doesn't seem to match.


I guess I am looking at the wrong encoding but I am not exactly sure why.



[1] http://logs.test-lab.xenproject.org/osstest/logs/162597/build-armhf/build/

