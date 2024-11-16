Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3EA9CFBA5
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:24:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838510.1254512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6bR-0002bx-7A; Sat, 16 Nov 2024 00:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838510.1254512; Sat, 16 Nov 2024 00:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6bR-0002Zp-47; Sat, 16 Nov 2024 00:23:53 +0000
Received: by outflank-mailman (input) for mailman id 838510;
 Sat, 16 Nov 2024 00:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWrC=SL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tC6bP-0002Zh-RR
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:23:51 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c1eeb4d-a3b1-11ef-a0c7-8be0dac302b0;
 Sat, 16 Nov 2024 01:23:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 80B5FA4287C;
 Sat, 16 Nov 2024 00:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8367C4CECF;
 Sat, 16 Nov 2024 00:23:45 +0000 (UTC)
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
X-Inumbo-ID: 0c1eeb4d-a3b1-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjBjMWVlYjRkLWEzYjEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzE2NjI4Ljk2MDEzOCwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731716627;
	bh=49pDdQydnL3D/DPJVWoglQOCqOnqk9uOJK0z/HNgkL8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PbOYAc+nevc2grcNV8znBSnEBadftDucD2mpwkwTKZEFTDn+nR2p3flQBuxFC7UCP
	 g8xQttHHoHuuV59OfoKMvfWnBCVtdrThMS46kzEYSNIzYYb8qmyBCQzXNyD2fM6ap2
	 10u9qPukDQSW8xFEnfjtrC46T4VMtYJQ/HjkLMUaaQ0N232xAU3DJTBX4U0fT60XSF
	 PyoEJbXh1rINBaZeMng5y1aUpM2zqpCX3Aeta5oTRujIL1zMHH1K84ppl3VW0cLlKx
	 f5h2BgIu0Amlh8hw+7oX9VY82cZjyX+Rn8meUHw1EJht1tx7E/soJy/tCCnxl64zeN
	 XMXUlPJ39lxPA==
Date: Fri, 15 Nov 2024 16:23:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen:add deviations for MISRA C 2012 Rule R5.2
In-Reply-To: <0fa9be78162b596c69da6c1bf840364e@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2411151623170.1160299@ubuntu-linux-20-04-desktop>
References: <41a1127e6d77d2be350e7679bd1034e0c2918e94.1731487210.git.alessandro.zucchelli@bugseng.com> <39168f90-7c80-451d-9c20-50da0de4af78@suse.com> <3789df92285b2c08b855369f46f3a229@bugseng.com> <24b117ed-dd5a-47a7-8c5d-ddddd7407ac9@suse.com>
 <alpine.DEB.2.22.394.2411131822260.222505@ubuntu-linux-20-04-desktop> <0fa9be78162b596c69da6c1bf840364e@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Nov 2024, Alessandro Zucchelli wrote:
> On 2024-11-14 03:23, Stefano Stabellini wrote:
> > On Wed, 13 Nov 2024, Jan Beulich wrote:
> > > On 13.11.2024 11:48, Alessandro Zucchelli wrote:
> > > > At this link you can see all the violations of Rule 5.2:
> > > >
> > > >
> > > https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/bugseng/xen/ECLAIR_normal/40_characters/X86_64/8143097084/PROJECT.ecd;/by_service/MC3R1.R5.2.html
> > > 
> > > Thank you. From a cursory look these all appear to be a result of the 40
> > > chars limit we put in place (quite arbitrarily). That's not mentioned at
> > > all ...
> > > 
> > > > By deviating the two macros CHECK_NAME_ and DEFINE_COMPAT_HANDLE all the
> > > > violations are addressed.
> > > >
> > > > On 2024-11-13 11:31, Jan Beulich wrote:
> > > >> On 13.11.2024 09:41, Alessandro Zucchelli wrote:
> > > >>> This addresses violations of MISRA C:2012 Rule 5.2 which states as
> > > >>> following: Identifiers declared in the same scope and name space shall
> > > >>> be distinct.
> > > >>>
> > > >>> This deviation addresses violations of Rule 5.2 arising from
> > > >>> identifiers generated through token pasting macros CHECK_NAME_ and
> > > >>> DEFINE_COMPAT_HANDLE.
> > > 
> > > ... in the description.
> > > 
> > > Together with the 5.4 patch having the same lack of context, I wonder
> > > whether we shouldn't simply up that limit.
> > 
> > Yes: if we up to the limit to 64 (another arbitrary number), can be mark
> > both 5.4 and 5.1 as clean? If so, I think we should do it right away.
> > 
> Hi,
> In doc/misra/rules.rst, the limit is documented as 40, but in the
> configuration
> file automation/eclair_analysis/ECLAIR/toolchain.ecl, it is set to 63.
> 
> If you intend to proceed by increasing the limit, you may ignore this
> deviation
> as well as my other deviation concerning Rule 5.4. In that case, please update
> the documentation in doc/misra/rules.rst to reflect the new limit.

Got it. See:
https://marc.info/?l=xen-devel&m=173171643022486

