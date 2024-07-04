Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B921927EEE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 00:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754041.1162333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPUck-0003Zp-LY; Thu, 04 Jul 2024 22:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754041.1162333; Thu, 04 Jul 2024 22:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPUck-0003XF-Iz; Thu, 04 Jul 2024 22:08:18 +0000
Received: by outflank-mailman (input) for mailman id 754041;
 Thu, 04 Jul 2024 22:08:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NKU0=OE=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sPUcj-0003X7-7d
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 22:08:17 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7cddd59-3a51-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 00:08:14 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 464M802C001828
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 4 Jul 2024 18:08:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 464M80FX001827;
 Thu, 4 Jul 2024 15:08:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: e7cddd59-3a51-11ef-8776-851b0ebba9a2
Date: Thu, 4 Jul 2024 15:08:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZocdQFCkH7p5nkiz@mattapan.m5p.com>
References: <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
 <Zn4BRxTcXKufonw5@mattapan.m5p.com>
 <ZoLwfUsSEJzcQ4kI@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoLwfUsSEJzcQ4kI@mattapan.m5p.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Jul 01, 2024 at 11:07:57AM -0700, Elliott Mitchell wrote:
> On Thu, Jun 27, 2024 at 05:18:15PM -0700, Elliott Mitchell wrote:
> > I'm rather surprised it was so long before the next system restart.  
> > Seems a quiet period as far as security updates go.  Good news is I made
> > several new observations, but I don't know how valuable these are.
> > 
> > On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monné wrote:
> > > 
> > > Does booting with `iommu=no-intremap` lead to any issues being
> > > reported?
> > 
> > On boot there was in fact less.  Notably the "AMD-Vi" messages haven't
> > shown up at all.  I haven't stressed it very much yet, but previous
> > boots a message showed up the moment the MD-RAID1 driver was loaded.
> > 
> > 
> > I am though seeing two different messages now:
> > 
> > (XEN) CPU#: No irq handler for vector # (IRQ -#, LAPIC)
> > (XEN) IRQ# a=#[#,#] v=#[#] t=PCI-MSI s=#
> > 
> > These are to be appearing in pairs.  Multiple values show for each field,
> > though each field appears to vary between 2-3 different values.  There
> > are thousands of these messages showing up.
> 
> Some lucky timing so I've done some more experimentation and sampling.
> 
> The "(XEN) IRQ" line almost always shows up with the "(XEN) CPU" line.
> I notice it is possible to generate the first without the second, so this
> seems notable.  Every single "(XEN) CPU" line mentioned "LAPIC".
> 
> The small number (20) of lines where "(XEN) IRQ" did not show up, the
> "(XEN) CPU" line always ended with "(IRQ -2147483648, LAPIC)"
> 
> For the "t=" value out of 316 samples, 94 listed "PCI-MSI" while 222
> listed "PCI-MSI/-X".
> 
> For the IRQ, 72 occurred 126 times.  71, 73 and 108 occurred roughly 50
> times each. 109 and 111 occurred under 10 times.  Almost no other IRQ
> values appeared.
> 
> The "s=" value was "00000030" slightly more often than "00000010".  No
> other values have been observed so far.
> 
> The other values were didn't show too many patterns.
> 
> Most processors were mentioned roughly equally.  Several had fewer
> mentions, but not enough to seem significant.  I discovered processor 1
> did NOT show up.  Whereas processor 0 had an above average number of
> occurrences.  This seems notable as these 2 processors are both reserved
> exclusively for domain 0.

All of the patterns continue.  There are more reports on processor 0 than
any other processor, but not enough to look particularly suspicious.
What *does* look suspicious is the complete absence of reports from
processor 1.

> There have also been a few "spurious 8259A interrupt" lines.  So far
> there haven't been very many of these.  The processor and IRQ listed
> don't yet appear to show any patterns.  So far no IRQ has been listed
> twice.

IRQs 3-7 and 9-15 have each shown up once.  1-2 and 8 haven't shown up
so far.


Things look different enough to try reenabling Linux software RAID1.  I'm
going to continue monitoring closely, but so far it seems
"iommu=no-intremap" may in fact mitigate the issue with software RAID1.

This seems odd, but I'm simply reporting what I observe.  I would have
expected to see problem indications by now, yet there aren't any.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



