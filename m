Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362AB3C2A0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 20:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101975.1454796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us46P-0004V6-6m; Fri, 29 Aug 2025 18:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101975.1454796; Fri, 29 Aug 2025 18:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us46P-0004Tc-3b; Fri, 29 Aug 2025 18:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1101975;
 Fri, 29 Aug 2025 18:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UI2G=3J=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1us46N-0004TM-Rs
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 18:45:31 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55760a9f-8508-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 20:45:30 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 57TIixUf002004
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Aug 2025 14:45:05 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 57TIivMS002003;
 Fri, 29 Aug 2025 11:44:57 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 55760a9f-8508-11f0-8adc-4578a1afcccb
Date: Fri, 29 Aug 2025 11:44:57 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Paul Leiber <paul@onlineschubla.de>
Subject: Re: Consider changing CONFIG_ACPI default on ARM?
Message-ID: <aLH1KYyl7nAOBKCp@mattapan.m5p.com>
References: <CAO_48GG1Tg0d3ATnNAYNr0cg7Ty_zsnzT29=dpkk99DxyTWcmg@mail.gmail.com>
 <fceb5df8-d628-479d-acb3-d1d26409fbac@onlineschubla.de>
 <aJLae1Nl0pyOZgyh@mattapan.m5p.com>
 <1b96f2f3-55a2-4b33-84b1-a7c18d38d10c@suse.com>
 <6e9b5265-7a3b-4fd5-b14e-0e60a8b49833@gmail.com>
 <a3092ae1-d836-4403-8fb5-30593fcd2fb8@suse.com>
 <aKjOaT-P74Yh4-bi@mattapan.m5p.com>
 <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f11b8ea-a386-4c2a-afe6-c7e57d1d7f75@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on mattapan.m5p.com

On Sat, Aug 23, 2025 at 08:59:13AM +0100, Julien Grall wrote:
> 
> On 22/08/2025 21:09, Elliott Mitchell wrote:
> > There may be many more using it.  Perhaps this
> > should even be done on the 4.20 branch given how long this has been
> > working?
> 
> I am guessing you mean 4.21 which will be released in a couple of months
> time, correct?
> 
> We have been discussing among the committers on whether we are ok to enable
> ACPI despite the fact it is still not feature complete (see above). The
> discussion is not fully finalized but if we were to enable CONFIG_ACPI=y by
> default then I think we would need the following:
> 
>  * Select device-tree by default rather than ACPI

This appears to be the case.  `arm_smmu_device_probe()` only calls
`arm_smmu_device_acpi_probe()` if the SMMUv3 is absent from the
device-tree.  The file appears laced with assumptions about device-tree
support being enabled so I think this is the present state.

>  * Go through SUPPORT.MD and check what features we marked as SUPPORTED.md
> but doesn't work on ACPI.
> 
> Maybe you can help with that?

The only things which stood out to me was SMMUv1/SMMUv2/SMMUv3.  Since
SMMUv3 is marked experimental anyway, this doesn't seem to be a problem.

Note, I haven't been looking too closely at things so my look isn't all
that much better than than an Ouija board.

Mostly it seems multiple people have found rebuilding Debian's packages
and enabling ACPI was the best way of getting Debian/Xen on a RP4.  The
lack of bugs seems to suggest ACPI works quite well.  The downsides are
limits in what ACPI supports and needing to rebuild.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



