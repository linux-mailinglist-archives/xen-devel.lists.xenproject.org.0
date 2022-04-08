Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F24F9A95
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 18:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301687.514917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncrRK-0002uM-OC; Fri, 08 Apr 2022 16:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301687.514917; Fri, 08 Apr 2022 16:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncrRK-0002s8-LI; Fri, 08 Apr 2022 16:26:26 +0000
Received: by outflank-mailman (input) for mailman id 301687;
 Fri, 08 Apr 2022 16:26:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncrRI-0002rd-Vk
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 16:26:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1beba3b-b758-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 18:26:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7EE78B82C01;
 Fri,  8 Apr 2022 16:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5728C385A3;
 Fri,  8 Apr 2022 16:26:21 +0000 (UTC)
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
X-Inumbo-ID: a1beba3b-b758-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649435182;
	bh=tWYTaAaLnPcszS3FdrfrSfNwkM7cVtKruxx5Vq4g+vE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mz4ohBp7+wuCxJLvKXmf7jkNiM5/gNf2FzWTTvblCib1JedymAKI+xUBS6NB4Iqgj
	 Te5Zj9v1mqOC9CyLmQ7GX4K+wctahr7yTZWKDz7zgcwJ/DrpvVoOIIz64oOBQZk10/
	 HxCE5hwlUWjx+Kmdwnw123eXmQDxEXHP+U1Z5lcAMU0I4lS9j2laDx+lXM+Db0GhI1
	 IripqReMHLWwysuz8Y1zuEleruIuudAwa27S56UiieEx3eKOwmyFPs9jkqYZUhHNQx
	 PFMaA+DUa9YhbYtqN2n2KQp4EesG98VKY8Nn9C60CBngHJBqforl2BCyz8RfaoI9tr
	 8TrF0fQ7P1QfA==
Date: Fri, 8 Apr 2022 09:26:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
cc: Roger Pau Monne <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    osstest service owner <osstest-admin@xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
In-Reply-To: <e12ad0f2-b37f-e5f9-33c8-e7a5898b1384@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2204080924400.2910984@ubuntu-linux-20-04-desktop>
References: <osstest-169199-mainreport@xen.org> <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com> <Yk/tzuKq4D3mFEQu@Air-de-Roger> <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com> <YlAWBom8O8d1lCpQ@Air-de-Roger> <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <YlAZhWVFziwoL0rb@Air-de-Roger> <41fe950e-cbc8-1da9-02d2-733c6fe4bb7a@xen.org> <YlBUF0j8HEpRX8Hs@Air-de-Roger> <e12ad0f2-b37f-e5f9-33c8-e7a5898b1384@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1631907031-1649435182=:2910984"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1631907031-1649435182=:2910984
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 8 Apr 2022, Andrew Cooper wrote:
> On 08/04/2022 16:26, Roger Pau Monne wrote:
> > On Fri, Apr 08, 2022 at 12:24:27PM +0100, Julien Grall wrote:
> >> Hi Roger,
> >>
> >> On 08/04/2022 12:16, Roger Pau Monné wrote:
> >>> On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
> >>>> Hi,
> >>>>
> >>>> On 08/04/2022 12:01, Roger Pau Monné wrote:
> >>>>>>> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServer
> >>>>>>> uses 16 for example.
> >>>>>> I'm afraid a fixed number won't do, the more that iirc there are
> >>>>>> systems with just a few cores in the pool (and you don't want to
> >>>>>> over-commit by default).
> >>>>> But this won't over commit, it would just assign dom0 16 vCPUs at
> >>>>> most, if the system has less than 16 vCPUs that's what would be
> >>>>> assigned to dom0.
> >>>> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will get
> >>>> that number even if there are 8 pCPUs.
> >>>>
> >>>> In fact, the documentation of dom0_max_vcpus suggests that the numbers of
> >>>> vCPUs can be more than the number of pCPUs.
> >>> It was my understanding that you could only achieve that by using the
> >>> min-max nomenclature, so in order to force 16 vCPUs always you would
> >>> have to use:
> >>>
> >>> dom0_max_vcpus=16-16
> >>>
> >>> Otherwise the usage of '_max_' in the option name is pointless, and it
> >>> should instead be dom0_vcpus.
> >>>
> >>> Anyway, I could use:
> >>>
> >>> dom0_max_vcpus=1-16
> >>>
> >>> Which is unambiguous and should get us 1 vCPU at least, or 16vCPUs at
> >>> most.
> >> Unfortunately, Arm doesn't support the min-max nomenclature.
> > Hm, can we update the command line document then?
> >
> > There's no mention that the min-max nomenclature is only available to
> > x86. I assume it's not possible to share the logic here so that both
> > Arm and x86 parse the option in the same way?
> 
> TBH, this especially wants moving to common code.  It's atrocious UX to
> have per-arch variations on the syntax for "how many vcpus".

In my view, it would be OK to share the code, but I would also want to
retain the current behavior when e.g. dom0_max_vcpus=2 is specified.
Otherwise we break existing ARM tooling. (It is actually used by Yocto
and others.)
--8323329-1631907031-1649435182=:2910984--

