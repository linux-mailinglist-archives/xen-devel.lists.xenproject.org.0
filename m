Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3688B304
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 22:44:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697898.1089146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ros6v-0001va-GP; Mon, 25 Mar 2024 21:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697898.1089146; Mon, 25 Mar 2024 21:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ros6v-0001sP-Dr; Mon, 25 Mar 2024 21:44:05 +0000
Received: by outflank-mailman (input) for mailman id 697898;
 Mon, 25 Mar 2024 21:44:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XUZI=K7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1ros6u-0001sJ-2F
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 21:44:04 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9f9bfc9-eaf0-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 22:44:01 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42PLhjIc069561
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 25 Mar 2024 17:43:50 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 42PLhiqK069560;
 Mon, 25 Mar 2024 14:43:44 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: c9f9bfc9-eaf0-11ee-a1ef-f123f15fe8a2
Date: Mon, 25 Mar 2024 14:43:44 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
 <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
 <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9b1c9c4-523b-481b-946e-37c7c18ea1d2@suse.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Mar 25, 2024 at 08:55:56AM +0100, Jan Beulich wrote:
> On 22.03.2024 20:22, Elliott Mitchell wrote:
> > On Fri, Mar 22, 2024 at 04:41:45PM +0000, Kelly Choi wrote:
> >>
> >> I can see you've recently engaged with our community with some issues you'd
> >> like help with.
> >> We love the fact you are participating in our project, however, our
> >> developers aren't able to help if you do not provide the specific details.
> > 
> > Please point to specific details which have been omitted.  Fairly little
> > data has been provided as fairly little data is available.  The primary
> > observation is large numbers of:
> > 
> > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
> > 
> > Lines in Xen's ring buffer.
> 
> Yet this is (part of) the problem: By providing only the messages that appear
> relevant to you, you imply that you know that no other message is in any way
> relevant. That's judgement you'd better leave to people actually trying to
> investigate. Unless of course you were proposing an actual code change, with
> suitable justification.

Honestly, I forgot about the very small number of messages from the SATA
subsystem.  The question of whether the current mitigation actions are
effective right now was a bigger issue.  As such monitoring `xl dmesg`
was a priority to looking at SATA messages which failed to reliably
indicate status.

I *thought* I would be able to retrieve those via other slow means, but a
different and possibly overlapping issue has shown up.  Unfortunately
this means those are no longer retrievable.   :-(

> In fact when running into trouble, the usual course of action would be to
> increase verbosity in both hypervisor and kernel, just to make sure no
> potentially relevant message is missed.

More/better information might have been obtained if I'd been engaged
earlier.

> > The most overt sign was telling the Linux kernel to scan for
> > inconsistencies and the kernel finding some.  The domain didn't otherwise
> > appear to notice trouble.
> > 
> > This is from memory, it would take some time to discover whether any
> > messages were missed.  Present mitigation action is inhibiting the
> > messages, but the trouble is certainly still lurking.
> 
> Iirc you were considering whether any of this might be a timing issue. Yet
> beyond voicing that suspicion, you didn't provide any technical details as
> to why you think so. Such technical details would include taking into
> account how IOMMU mappings and associated IOMMU TLB flushing are carried
> out. Right now, to me at least, your speculation in this regard fails
> basic sanity checking. Therefore the scenario that you're thinking of
> would need better describing, imo.

True.  Mostly I'm analyzing the known information and considering what
the patterns suggest.

Presently I'm aware of two reports (Imre Szőllősi and mine).

Both of these feature AMD processor machines.  Could be people with AMD
processors are less trustful of flash storage or could be an AMD-only
IOMMU issue.  Ideally someone would test and confirm there is no issue
with Linux software RAID1 on flash on an Intel machine.

Both reports feature two flash storage devices being run through Linux
MD RAID1.  Could be the MD RAID1 subsystem is abusing the DMA interface
in some fashion.  While Imre Szőllősi reported this not occuring with a
single device, the report does not explicitly state whether that was a
degenerate RAID1 versus non-RAID.  I'm unaware of any testing with 3x
devices in RAID1.


Both reports feature Samsung SATA flash devices.  My case also includes a
Crucial NVMe device.  My case also features a Crucial SATA flash device
for which the problem did NOT occur.  So the question becomes, why did
the problem not occur for this Crucial SATA device?

According to the specifications, the Crucial SATA device is roughly on
par with the Samsung SATA devices in terms of read/write speeds.  The
NVMe device's specifications are massively better.

What comes to mind is the Crucial SATA device might have higher latency
before executing commands.  Specifications don't mention command
execution latency, so it isn't possible to know whether this is the
issue.


Yes, latency/timing is speculation.  Does seem a good fit for the pattern
though.

This could be a Linux MD RAID1 bug or a Xen bug.

Unfortunately data loss is a very serious type of bug so I'm highly
reluctant to let go of mitigations without hope for progress.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



