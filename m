Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35DA3D4151
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 22:12:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160361.294826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71VA-0001Kg-V5; Fri, 23 Jul 2021 20:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160361.294826; Fri, 23 Jul 2021 20:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71VA-0001IQ-Qk; Fri, 23 Jul 2021 20:10:32 +0000
Received: by outflank-mailman (input) for mailman id 160361;
 Fri, 23 Jul 2021 20:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJz+=MP=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1m71V9-0001IK-Eq
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 20:10:31 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db8b56d9-b767-4622-9ac6-d189d159ac17;
 Fri, 23 Jul 2021 20:10:29 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>)
 id 1m71V6-0007Pg-Ol; Fri, 23 Jul 2021 20:10:28 +0000
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
X-Inumbo-ID: db8b56d9-b767-4622-9ac6-d189d159ac17
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=AYmPYs1e1VdqVi+JuPhqXLKGZO4lkLoNj8vtW6NLVvA=; b=JBqSnnH4Z2n3BA2E2dC0PvwQWb
	ysBKXqqTt8wFzKfjZulEikVvCcqPxlREmtXuGLdPDcOXPC8kkMEknVIMPG4ulh7z/3QtvdwV34Pd5
	YzKcEgwsxSulXGVSA+PyaUU1NdCq9UnBCy6BZao2b21eayKXc4ATIeJVWLPf9DsiLdhSCx+z9KzXR
	pEley/l6kKnYOgC4rFRp/WrSxtEmb0scNew0X+m3uYq3GsCflja1deem5OXYklXovN2eOYokdz5QW
	k/2gQCC8eL2M4GLlD1n0UKWPH3Yjj7m7MKC3EEGcOqd+RsXhcLzHLxaAvHM4/s3B6788HZCEc9e7C
	ie6acA7A==;
Date: Fri, 23 Jul 2021 20:10:28 +0000
From: Andy Smith <andy@strugglers.net>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072
 nents:13
Message-ID: <20210723201028.tzmz65biwelruvqb@bitfolk.com>
References: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
 <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
 <20210721141942.tnxyfpt7qttzjooo@bitfolk.com>
 <acc3c000-3d62-d91d-3ad7-0e0b460f4b0f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acc3c000-3d62-d91d-3ad7-0e0b460f4b0f@suse.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

Hi Jan,

On Wed, Jul 21, 2021 at 04:49:26PM +0200, Jan Beulich wrote:
> On 21.07.2021 16:19, Andy Smith wrote:
> > I understand that below 4GiB memory use of swiotlb is disabled so
> > all the time previously this was not used, and now is. Perhaps the
> > bug is in there?
> > 
> > I was told that the only simple way on a Xen dom0 to disable use of
> > swiotlb would be to set the memory below 4GiB again, so I might try
> > that.
> 
> I have no idea where you take this 4GiB aspect from. What the kernel
> considers "below 4GiB" in its view of the world may be at a much
> higher address in system address space. And the mere amount of
> memory doesn't matter here at all.

Ah, I was taking that from:

    https://elixir.bootlin.com/linux/v5.10.40/source/arch/x86/kernel/pci-swiotlb.c#L41

…which I had found while looking around how to disable use of
swiotlb. But I think I'm probably confused - should I only be
looking at arch/x86/xen/pci-swiotlb-xen.c in the case of a PV domain
like dom0?

I have not been able to reproduce the problem by giving a test
system with identical hardware more RAM and getting fio in a guest
to do random reads with a blocksize between 4kiB and 4MiB.

Perhaps it is highly workload dependent then. In some ways it's a
pity that I do not get call traces for the later occurrences as then
I could see if it's always the same 62.xvda-0 process (and thus same
guest) triggering it.

It's happened three more times since my previous email, but these
have been up to 46 hours apart. These were all reads, so MD just
satisfied the read from the other device without kicking the nvme
device out.

Hmm, I have the sector offset in the MD device so maybe I can
convert that into a logical volume to know if a particular guest is
provoking it…

If anyone happens to have any suggestions as to what kind of IO might
provoke this at all so I could maybe get fio to reproduce it, please
do let me know.

Thanks,
Andy

