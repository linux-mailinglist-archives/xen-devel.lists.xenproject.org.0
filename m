Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6405E552702
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 00:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352903.579775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q3j-0007oG-GT; Mon, 20 Jun 2022 22:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352903.579775; Mon, 20 Jun 2022 22:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Q3j-0007kP-CM; Mon, 20 Jun 2022 22:39:51 +0000
Received: by outflank-mailman (input) for mailman id 352903;
 Mon, 20 Jun 2022 22:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8m2=W3=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1o3Q3i-0007k3-4k
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 22:39:50 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f02af7-f0e9-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 00:39:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 5721E2014F;
 Tue, 21 Jun 2022 00:39:46 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wv5TOJiU0PRU; Tue, 21 Jun 2022 00:39:46 +0200 (CEST)
Received: from begin.home (anantes-655-1-33-15.w83-195.abo.wanadoo.fr
 [83.195.225.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1259420137;
 Tue, 21 Jun 2022 00:39:45 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1o3Q3d-00B6Ec-JF;
 Tue, 21 Jun 2022 00:39:45 +0200
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
X-Inumbo-ID: e2f02af7-f0e9-11ec-b725-ed86ccbb4733
Date: Tue, 21 Jun 2022 00:39:45 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 0/8] mini-os: some cleanup patches
Message-ID: <20220620223945.mjnn3kulnyhi4xfn@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Juergen Gross, le lun. 20 juin 2022 09:38:12 +0200, a ecrit:
> Do some cleanups.
> 
> No functional change intended, apart from whitespace changes only
> minor modifications making code easier to read.
> 
> Juergen Gross (8):
>   mini-os: drop xenbus directory
>   mini-os: apply coding style to xenbus.c
>   mini-os: eliminate console/console.h
>   mini-os: rename console/xenbus.c to consfront.c
>   mini-os: apply coding style to consfront.c
>   mini-os: eliminate console directory
>   mini-os: apply coding style to console.c
>   mini-os: add mini-os-debug[.gz] to .gitignore

For the whole series:

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

>  .gitignore                      |   2 +
>  Makefile                        |   9 +-
>  console/xenbus.c => consfront.c |  99 ++++---
>  console.c                       | 415 ++++++++++++++++++++++++++
>  console/console.c               | 177 -----------
>  console/console.h               |   2 -
>  console/xencons_ring.c          | 238 ---------------
>  include/console.h               |   1 +
>  xenbus/xenbus.c => xenbus.c     | 510 +++++++++++++++++++-------------
>  9 files changed, 778 insertions(+), 675 deletions(-)
>  rename console/xenbus.c => consfront.c (78%)
>  create mode 100644 console.c
>  delete mode 100644 console/console.c
>  delete mode 100644 console/console.h
>  delete mode 100644 console/xencons_ring.c
>  rename xenbus/xenbus.c => xenbus.c (71%)
> 
> -- 
> 2.35.3
> 

