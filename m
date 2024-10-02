Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C780A98E601
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 00:17:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809058.1221199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7eI-0003T9-E6; Wed, 02 Oct 2024 22:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809058.1221199; Wed, 02 Oct 2024 22:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw7eI-0003RE-B1; Wed, 02 Oct 2024 22:16:46 +0000
Received: by outflank-mailman (input) for mailman id 809058;
 Wed, 02 Oct 2024 22:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x6XJ=Q6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw7eH-0003Bk-Fk
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 22:16:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 010b571b-810c-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 00:16:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63DD35C0F73;
 Wed,  2 Oct 2024 22:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873FBC4CEC2;
 Wed,  2 Oct 2024 22:16:41 +0000 (UTC)
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
X-Inumbo-ID: 010b571b-810c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727907402;
	bh=y6YdS5wyQDJGdmoHg++lROT+gRIAH7fPkBIaax8hoNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jD1CULWi5SKsKO4xjeTp0p3+doFFRy2P8p4besYru5MuOmivCOchbFYUnB+wphOPA
	 NpcRz9Mqo+3aBCOf5s3dC0Rsugv/xmND+tkoCHUjjfbLK+lSrQSJGDk6CT3GwIElqc
	 LmO/0++/3JM/FV45+ZSOWBWHbfFOJRbn8qUBpK+OVVzMJFwIaIsJOBUY3Cp5OySGsL
	 0ns3BMig9QgCWnC5HmVu40khggLZ7Bluv83KzCwkmwZSsBo71SsUciV6nZtmFENCgB
	 zfTABoQKkLqpQICXk5nAXQWhasHi4wILo3I64gD+ae19gPHXzMVOqBIfEHMIP+AGHz
	 6k9+5jlOwRpzg==
Date: Wed, 2 Oct 2024 15:16:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: preserve built xen.efi
In-Reply-To: <Zv2xC7JPBEs1-aue@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2410021459030.1138574@ubuntu-linux-20-04-desktop>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com> <3ca5faa7-2276-4c85-a4ee-cc6ad5af3238@citrix.com> <Zv2xC7JPBEs1-aue@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-959767660-1727906554=:1138574"
Content-ID: <alpine.DEB.2.22.394.2410021505110.1138574@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-959767660-1727906554=:1138574
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2410021505111.1138574@ubuntu-linux-20-04-desktop>

On Wed, 2 Oct 2024, Marek Marczykowski-Górecki wrote:
> On Wed, Oct 02, 2024 at 09:42:13PM +0100, Andrew Cooper wrote:
> > On 02/10/2024 1:42 pm, Marek Marczykowski-Górecki wrote:
> > > It will be useful for further tests.
> > >
> > > Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > ---
> > >  automation/scripts/build | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/automation/scripts/build b/automation/scripts/build
> > > index b3c71fb6fb60..4cd41cb2c471 100755
> > > --- a/automation/scripts/build
> > > +++ b/automation/scripts/build
> > > @@ -47,6 +47,7 @@ if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> > >  
> > >      # Preserve artefacts
> > >      cp xen/xen binaries/xen
> > > +    if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi
> > 
> > Wouldn't
> > 
> >     # Preserve xen and optionally xen.efi
> >     cp -f xen/xen xen/xen.efi binaries/
> > 
> > do this in a more concise way?
> 
> I don't think so, `cp -f` still fails if the source cannot be found.

I think it would have to be something like:

cp -f xen/xen xen/xen.efi binaries/ || true


> > Alternatively, what about this:
> > 
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index b3c71fb6fb60..14815ea7ad9c 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -41,6 +41,15 @@ cp xen/.config xen-config
> >  # Directory for the artefacts to be dumped into
> >  mkdir -p binaries
> >  
> > +collect_xen_artefacts ()
> > +{
> > +    for A in xen/xen xen/xen.efi; do
> > +        if [[ -f $A ]]; then
> > +            cp $A binaries/
> > +        fi
> > +    done
> > +}
> > +
> >  if [[ "${CPPCHECK}" == "y" ]] && [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> >      # Cppcheck analysis invokes Xen-only build
> >      xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra --
> > -j$(nproc)
> > @@ -53,7 +62,7 @@ elif [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
> >      make -j$(nproc) xen
> >  
> >      # Preserve artefacts
> > -    cp xen/xen binaries/xen
> > +    collect_xen_artefacts
> >  else
> >      # Full build.  Figure out our ./configure options
> >      cfgargs=()
> > 
> > so we don't triplicate the handling?
> 
> That may be a better idea indeed.

collect_xen_artefacts is also a good option, perhaps even better. A
couple of minor NITs:

function collect_xen_artefacts()
{
    local f
    for f in xen/xen xen/xen.efi; do
        if [[ -f $f ]]; then
            cp $f binaries/
        fi
    done
}
--8323329-959767660-1727906554=:1138574--

