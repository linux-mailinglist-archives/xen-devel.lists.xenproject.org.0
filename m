Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1481F93957C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 23:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762369.1172537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0bd-0000aU-5S; Mon, 22 Jul 2024 21:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762369.1172537; Mon, 22 Jul 2024 21:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sW0bd-0000YS-22; Mon, 22 Jul 2024 21:30:05 +0000
Received: by outflank-mailman (input) for mailman id 762369;
 Mon, 22 Jul 2024 21:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuwE=OW=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sW0bc-0000EF-2J
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 21:30:04 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dfce30b-4871-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 23:30:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2AB8DA02D3;
 Mon, 22 Jul 2024 23:30:02 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKfM2qWowNs9; Mon, 22 Jul 2024 23:30:02 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 10AF0A02CA;
 Mon, 22 Jul 2024 23:30:02 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sW0bZ-0000000AY7o-2o5O; Mon, 22 Jul 2024 23:30:01 +0200
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
X-Inumbo-ID: 8dfce30b-4871-11ef-bbfe-fd08da9f4363
Date: Mon, 22 Jul 2024 23:30:01 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 1/4] mini-os: make mm.c coding style compliant
Message-ID: <20240722213001.c43qzpjjmjqk2yq3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722150141.31391-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 22 juil. 2024 17:01:38 +0200, a ecrit:
> @@ -63,8 +63,8 @@ unsigned long nr_free_pages;
>  
>  /*
>   * Hint regarding bitwise arithmetic in map_{alloc,free}:
> - *  -(1<<n)  sets all bits >= n. 
> - *  (1<<n)-1 sets all bits <  n.
> + *  -(1 << n)  sets all bits >= n.
> + *  (1 << n) - 1 sets all bits <  n.

Please keep the alignment of "sets"

Apart this nitpick,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

