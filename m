Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2799441C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812922.1225664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6Px-000158-5o; Tue, 08 Oct 2024 09:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812922.1225664; Tue, 08 Oct 2024 09:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6Px-00013Z-32; Tue, 08 Oct 2024 09:22:09 +0000
Received: by outflank-mailman (input) for mailman id 812922;
 Tue, 08 Oct 2024 09:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95Tx=RE=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sy6Pw-00013T-Kz
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:22:08 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c94eea49-8556-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 11:22:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 226CCA0522;
 Tue,  8 Oct 2024 11:22:06 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b36NvorYlX62; Tue,  8 Oct 2024 11:22:06 +0200 (CEST)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id C9945A051D;
 Tue,  8 Oct 2024 11:22:05 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sy6Pt-0000000ByQo-2P21; Tue, 08 Oct 2024 11:22:05 +0200
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
X-Inumbo-ID: c94eea49-8556-11ef-a0bc-8be0dac302b0
Date: Tue, 8 Oct 2024 11:22:05 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 2/4] stubdom: explcitly add libc and lwip Mini-OS config
 options
Message-ID: <ZwT5vdOPkcydf3hn@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20241005151548.29184-1-jgross@suse.com>
 <20241005151548.29184-3-jgross@suse.com>
 <ZwRXvG4a2Jtgba2s@begin>
 <5b4233fc-ea12-4b19-bff9-dfb6c6c43832@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b4233fc-ea12-4b19-bff9-dfb6c6c43832@suse.com>
Organization: I am not organized

Jürgen Groß, le mar. 08 oct. 2024 11:18:26 +0200, a ecrit:
> On 07.10.24 23:50, Samuel Thibault wrote:
> > > diff --git a/stubdom/grub/minios.cfg b/stubdom/grub/minios.cfg
> > > index 8df49092cd..5145b357e0 100644
> > > --- a/stubdom/grub/minios.cfg
> > > +++ b/stubdom/grub/minios.cfg
> > > @@ -1,3 +1,4 @@
> > > -CONFIG_START_NETWORK=n
> > > +CONFIG_LIBC=y
> > > +CONFIG_LWIP=n
> > >   CONFIG_SPARSE_BSS=n
> > >   CONFIG_TPMFRONT=y
> > 
> > Grub does use LWIP, and just does not want mini-os to start network
> > automatically, grub does so by itself from minios_probe.
> 
> Are you sure? LWIPDIR isn't being set for building grub-stubdom. How
> does this work?

Ah, sorry, grub implements tcp/ip itself indeed, so it's only netfront
that stubdom-grub needs.

Samuel

