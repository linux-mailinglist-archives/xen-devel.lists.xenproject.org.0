Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 530EB487A85
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jan 2022 17:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254488.436360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5sFB-00070B-ND; Fri, 07 Jan 2022 16:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254488.436360; Fri, 07 Jan 2022 16:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5sFB-0006xU-Jx; Fri, 07 Jan 2022 16:37:33 +0000
Received: by outflank-mailman (input) for mailman id 254488;
 Fri, 07 Jan 2022 16:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S+jj=RX=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1n5sF9-0006xM-Q2
 for xen-devel@lists.xenproject.org; Fri, 07 Jan 2022 16:37:31 +0000
Received: from smarthost01b.ixn.mail.zen.net.uk
 (smarthost01b.ixn.mail.zen.net.uk [212.23.1.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1998debd-6fd8-11ec-9ce5-af14b9085ebd;
 Fri, 07 Jan 2022 17:37:28 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.ixn.mail.zen.net.uk with esmtpsa
 (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.90_1)
 (envelope-from <james@dingwall.me.uk>)
 id 1n5sF4-0002kg-8f; Fri, 07 Jan 2022 16:37:26 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 7C17325A99A;
 Fri,  7 Jan 2022 16:37:25 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7eTJkVi_Ckg; Fri,  7 Jan 2022 16:37:25 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk [192.168.1.200])
 by dingwall.me.uk (Postfix) with ESMTP id 653CD25A997;
 Fri,  7 Jan 2022 16:37:25 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 48084A80; Fri,  7 Jan 2022 16:37:25 +0000 (GMT)
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
X-Inumbo-ID: 1998debd-6fd8-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Fri, 7 Jan 2022 16:37:25 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: Jan Beulich <jbeulich@suse.com>
Cc: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
	xen-devel@lists.xenproject.org
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Message-ID: <20220107163725.GA2575646@dingwall.me.uk>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
> On 06.01.2022 16:08, James Dingwall wrote:
> >>> On Wed, Jul 21, 2021 at 12:59:11PM +0200, Jan Beulich wrote:                                                                            
> >>>> On 21.07.2021 11:29, James Dingwall wrote:                                                                                             
> >>>>> We have a system which intermittently starts up and reports an incorrect cpu frequency:                                               
> > ...
> >>> I'm sorry to ask, but have you got around to actually doing that? Or
> >>> else is resolving this no longer of interest?
> > 
> > We have experienced an occurence of this issue on 4.14.3 with 'loglvl=all'
> > present on the xen command line.  I have attached the 'xl dmesg' output for
> > the fast MHz boot, the diff from the normal case is small so I've not added
> > that log separately:
> > 
> > --- normal-mhz/xl-dmesg.txt     2022-01-06 14:13:47.231465234 +0000
> > +++ funny-mhz/xl-dmesg.txt      2022-01-06 13:45:43.825148510 +0000
> > @@ -211,7 +211,7 @@
> >  (XEN)  cap enforcement granularity: 10ms
> >  (XEN) load tracking window length 1073741824 ns
> >  (XEN) Platform timer is 24.000MHz HPET
> > -(XEN) Detected 2294.639 MHz processor.
> > +(XEN) Detected 7623.412 MHz processor.
> >  (XEN) EFI memory map:
> >  (XEN)  0000000000000-0000000007fff type=3 attr=000000000000000f
> >  (XEN)  0000000008000-000000003cfff type=7 attr=000000000000000f
> 
> Below is a patch (suitably adjusted for 4.14.3) which I would hope can
> take care of the issue (assuming my vague guess on the reasons wasn't
> entirely off). It has some debugging code intentionally left in, and
> it's also not complete yet (other timer code needing similar
> adjustment). Given the improvements I've observed independent of your
> issue, I may not wait with submission until getting feedback from you,
> since - aiui - it may take some time for you to actually run into a
> case where the change would actually make an observable difference.

I'll get it added to our build and see what we find...

Thanks,
James

> 
> Jan
> 
> x86: improve TSC / CPU freq calibration accuracy
> 
> While the problem report was for extreme errors, even smaller ones would
> better be avoided: The calculated period to run calibration loops over
> can (and usually will) be shorter than the actual time elapsed between
> first and last platform timer and TSC reads. Adjust values returned from
> the init functions accordingly.
> 
> On a Skylake system I've tested this on accuracy (using HPET) went from
> detecting in some cases more than 220kHz too high a value to about
> ±1kHz. On other systems the original error range was much smaller, with
> less (in some cases only very little) improvement.
> 
> Reported-by: James Dingwall <james-xen@dingwall.me.uk>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Do we think we need to guard against the bizarre case of
>      "target + count" overflowing (i.e. wrapping)?
> TBD: Accuracy could be slightly further improved by using a (to be
>      introduced) rounding variant of muldiv64().
> TBD: I'm not entirely sure how useful the conditionals are - there
>      shouldn't be any inaccuracies from the division when count equals
>      target (upon entry to the conditionals), as then the divisor is
>      what the original value was just multiplied by.
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -378,8 +378,9 @@ static u64 read_hpet_count(void)
>  
>  static int64_t __init init_hpet(struct platform_timesource *pts)
>  {
> -    uint64_t hpet_rate, start;
> +    uint64_t hpet_rate, start, expired;
>      uint32_t count, target;
> +unsigned int i;//temp
>  
>      if ( hpet_address && strcmp(opt_clocksource, pts->id) &&
>           cpuidle_using_deep_cstate() )
> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>  
>      pts->frequency = hpet_rate;
>  
> +for(i = 0; i < 16; ++i) {//temp
>      count = hpet_read32(HPET_COUNTER);
>      start = rdtsc_ordered();
>      target = count + CALIBRATE_VALUE(hpet_rate);
>      if ( target < count )
>          while ( hpet_read32(HPET_COUNTER) >= count )
>              continue;
> -    while ( hpet_read32(HPET_COUNTER) < target )
> +    while ( (count = hpet_read32(HPET_COUNTER)) < target )
>          continue;
>  
> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
> +    expired = rdtsc_ordered() - start;
> +
> +    if ( likely(count > target) )
> +    {
> +        /*
> +         * A (perhaps significant) delay before the last HPET read above (e.g.
> +         * due to a SMI or NMI) can lead to (perhaps severe) inaccuracy if not
> +         * accounting for the time expired past the originally calculated end
> +         * of the calibration period.
> +         */
> +printk("%lu -> ", expired * CALIBRATE_FRAC);//temp
> +        count -= target;
> +        target = CALIBRATE_VALUE(hpet_rate);
> +        expired = muldiv64(expired, target, target + count);
> +printk("%lu (%3u,%u)\n", expired * CALIBRATE_FRAC, count, target);//temp
> +    }
> +}
> +
> +    return expired * CALIBRATE_FRAC;
>  }
>  
>  static void resume_hpet(struct platform_timesource *pts)
> 

-- 
------------------------------------------------------------------------
James Dingwall
e: james@dingwall.me.uk
w: http://www.dingwall.me.uk/
------------------------------------------------------------------------

