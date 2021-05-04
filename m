Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AF372E79
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 19:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122607.231264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyWJ-0001H3-J6; Tue, 04 May 2021 17:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122607.231264; Tue, 04 May 2021 17:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldyWJ-0001Gc-F3; Tue, 04 May 2021 17:07:39 +0000
Received: by outflank-mailman (input) for mailman id 122607;
 Tue, 04 May 2021 17:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7IS=J7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1ldyWI-0001GQ-CR
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 17:07:38 +0000
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc6671eb-9236-4983-b6bb-1b732a0c2503;
 Tue, 04 May 2021 17:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 56B8B365;
 Tue,  4 May 2021 19:07:36 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bkCf6oQ-HwxQ; Tue,  4 May 2021 19:07:35 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 67417362;
 Tue,  4 May 2021 19:07:35 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1ldyWE-00GOos-JT; Tue, 04 May 2021 19:07:34 +0200
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
X-Inumbo-ID: cc6671eb-9236-4983-b6bb-1b732a0c2503
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 4 May 2021 19:07:34 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
Subject: Re: [PATCH 7/9] vtpmmgr: Flush all transient keys
Message-ID: <20210504170734.nc4hfmo5olhlikes@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jandryuk@gmail.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>
References: <20210504124842.220445-1-jandryuk@gmail.com>
 <20210504124842.220445-8-jandryuk@gmail.com>
 <20210504131626.h2ylaamk35evw6yg@begin>
 <CAKf6xptnmC9FQzZ_2Z1uBaFYS1s0F7VAVu0cm=a_5YKyPSEdxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKf6xptnmC9FQzZ_2Z1uBaFYS1s0F7VAVu0cm=a_5YKyPSEdxA@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 56B8B365
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 TO_DN_ALL(0.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Jason Andryuk, le mar. 04 mai 2021 13:05:33 -0400, a ecrit:
> On Tue, May 4, 2021 at 9:16 AM Samuel Thibault
> <samuel.thibault@ens-lyon.org> wrote:
> >
> > Jason Andryuk, le mar. 04 mai 2021 08:48:40 -0400, a ecrit:
> > > We're only flushing 2 transients, but there are 3 handles.  Use <= to also
> > > flush the third handle.
> > >
> > > The number of transient handles/keys is hardware dependent, so this
> > > should query for the limit.  And assignment of handles is assumed to be
> > > sequential from the minimum.  That may not be guaranteed, but seems okay
> > > with my tpm2.
> > >
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Maybe explicit in the log that TRANSIENT_LAST is actually inclusive?
> 
> In the commit message?  Sounds good to me.

Yes, please.

Samuel

