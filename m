Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705A784D42
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588773.920373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYacw-0003An-AM; Tue, 22 Aug 2023 23:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588773.920373; Tue, 22 Aug 2023 23:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYacw-00038Y-7f; Tue, 22 Aug 2023 23:17:34 +0000
Received: by outflank-mailman (input) for mailman id 588773;
 Tue, 22 Aug 2023 23:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYacu-00038S-MA
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:17:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 105ff808-4142-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 01:17:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6EDA61FFA;
 Tue, 22 Aug 2023 23:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BC1C433C8;
 Tue, 22 Aug 2023 23:17:24 +0000 (UTC)
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
X-Inumbo-ID: 105ff808-4142-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692746246;
	bh=0URZlRbDFdXEX/8bh8iSvBI9MmJgmODB1NonCxdvCSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y1IRmHN9Ga97EZO9DRLZbcc7xQiXl+31LwjOVsw7TPUJykbWq9vewbIgEijtsrH77
	 d/vprdSILnqA3x2DjiFovn0BRAyH5QO+q8CpZ3G1BvKXUhdHsGK4f3S0fDHNA5vJcd
	 ws8Eu+sx0d5/NXqJwbmXpQco81yliBToUFSVjpJuVk426umxs+IcBg6E3lSe50aivH
	 MbAbm9oOeUsqovtFlg8jlQSoR/poAqmonYAjOBF/5j5JbFJ5Cg/KtQYTBNpindTDRx
	 N0MNfHd048vE+UDdi3MD9FekCfCq/A9aamPbpeAWg4Kqu1o1Mh5+jn9wxDqzm2T8gs
	 iH/RJnjsk6lJw==
Date: Tue, 22 Aug 2023 16:17:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, george.dunlap@citrix.com, bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] docs/misra: add exceptions to rules
In-Reply-To: <659abb38-67ff-bb6e-bd62-b1ee90860304@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308221617180.6458@ubuntu-linux-20-04-desktop>
References: <20230822013014.2523202-1-sstabellini@kernel.org> <f3ea87fe-cc05-453a-87b0-e7f795e24459@xen.org> <ee6fe3b0-92ab-e215-ea0e-091658b87138@suse.com> <efd756ff-9fc1-49a7-b5d7-841915a9ee63@xen.org> <659abb38-67ff-bb6e-bd62-b1ee90860304@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Aug 2023, Jan Beulich wrote:
> On 22.08.2023 12:33, Julien Grall wrote:
> > Hi Jan,
> > 
> > On 22/08/2023 11:12, Jan Beulich wrote:
> >> On 22.08.2023 09:56, Julien Grall wrote:
> >>> On 22/08/2023 02:30, Stefano Stabellini wrote:
> >>>> --- a/docs/misra/rules.rst
> >>>> +++ b/docs/misra/rules.rst
> >>>> @@ -59,7 +59,8 @@ maintainers if you want to suggest a change.
> >>>>         - Required
> >>>>         - Precautions shall be taken in order to prevent the contents of a
> >>>>           header file being included more than once
> >>>> -     -
> >>>
> >>> It is not clear to me why this line is removed. Was it added by mistake
> >>> in a previous commit?
> >>
> >> The patch is replacing an empty comment ...
> >>
> >>>> +     - Files that are intended to be included more than once do not need to
> >>>> +       conform to the directive
> >>
> >> ... with a non-empty one.
> > 
> > I understand that... My question is more related to why we originally 
> > added one? If this was done on purpose, then why are we removing it?
> 
> I think the goal is for the file to be easily machine readable, and hence
> the same number of sub-items want to appear for every main item.

Yes, it is to respect the RST table format so that gets rendered as a
table in HTML/PDF/etc.

