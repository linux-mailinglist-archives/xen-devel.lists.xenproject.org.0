Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B185FE40
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 17:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684495.1064385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdC9R-0002Hy-Dv; Thu, 22 Feb 2024 16:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684495.1064385; Thu, 22 Feb 2024 16:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdC9R-0002Ff-Aa; Thu, 22 Feb 2024 16:42:25 +0000
Received: by outflank-mailman (input) for mailman id 684495;
 Thu, 22 Feb 2024 16:42:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qXTC=J7=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rdC9Q-0002FW-69
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 16:42:24 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59162a93-d1a1-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 17:42:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id B1336A019C;
 Thu, 22 Feb 2024 17:42:20 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZ7SmCzCoOcV; Thu, 22 Feb 2024 17:42:20 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 75767A017F;
 Thu, 22 Feb 2024 17:42:20 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rdC9L-0000000Harf-3wSW; Thu, 22 Feb 2024 17:42:19 +0100
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
X-Inumbo-ID: 59162a93-d1a1-11ee-98f5-efadbce2ee36
Date: Thu, 22 Feb 2024 17:42:19 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v8 3/8] stubdom: extend xenstore stubdom configs
Message-ID: <20240222164219.rmeybzido2rhpjkb@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Jason Andryuk <jandryuk@gmail.com>
References: <20240216163139.9093-1-jgross@suse.com>
 <20240216163139.9093-4-jgross@suse.com>
 <a12f113b-bd97-4807-97c9-b66b55e247f8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a12f113b-bd97-4807-97c9-b66b55e247f8@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le jeu. 22 févr. 2024 17:06:09 +0100, a ecrit:
> On 16.02.24 17:31, Juergen Gross wrote:
> > Extend the config files of the Xenstore stubdoms to include XENBUS
> > and 9PFRONT items in order to support file based logging.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> 
> Samuel, are you fine with this patch?

Yes!

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

> 
> 
> Juergen
> 
> > ---
> >   stubdom/xenstore-minios.cfg    | 2 +-
> >   stubdom/xenstorepvh-minios.cfg | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/stubdom/xenstore-minios.cfg b/stubdom/xenstore-minios.cfg
> > index a41704bb6b..239da519b9 100644
> > --- a/stubdom/xenstore-minios.cfg
> > +++ b/stubdom/xenstore-minios.cfg
> > @@ -3,7 +3,7 @@ CONFIG_NETFRONT=n
> >   CONFIG_FBFRONT=n
> >   CONFIG_KBDFRONT=n
> >   CONFIG_CONSFRONT=n
> > -CONFIG_XENBUS=n
> >   CONFIG_LWIP=n
> > +CONFIG_9PFRONT=y
> >   CONFIG_BALLOON=y
> >   XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> > diff --git a/stubdom/xenstorepvh-minios.cfg b/stubdom/xenstorepvh-minios.cfg
> > index 6af51f5753..752b90d7d3 100644
> > --- a/stubdom/xenstorepvh-minios.cfg
> > +++ b/stubdom/xenstorepvh-minios.cfg
> > @@ -4,7 +4,7 @@ CONFIG_NETFRONT=n
> >   CONFIG_FBFRONT=n
> >   CONFIG_KBDFRONT=n
> >   CONFIG_CONSFRONT=n
> > -CONFIG_XENBUS=n
> >   CONFIG_LWIP=n
> > +CONFIG_9PFRONT=y
> >   CONFIG_BALLOON=y
> >   XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> 

