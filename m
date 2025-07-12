Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CEB02AA6
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 13:35:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041834.1412419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaYVS-0000gs-V0; Sat, 12 Jul 2025 11:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041834.1412419; Sat, 12 Jul 2025 11:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaYVS-0000ep-Rq; Sat, 12 Jul 2025 11:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1041834;
 Sat, 12 Jul 2025 11:35:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uD0C=ZZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1uaYVR-0000ej-CV
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 11:35:01 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bffe39a-5f14-11f0-b894-0df219b8e170;
 Sat, 12 Jul 2025 13:34:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id ABA29A20F7;
 Sat, 12 Jul 2025 13:34:55 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22ta6CbDibEu; Sat, 12 Jul 2025 13:34:55 +0200 (CEST)
Received: from begin (unknown [89.234.162.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 52F15A20E8;
 Sat, 12 Jul 2025 13:34:55 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98.2)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1uaYVK-0000000E2mZ-3h07; Sat, 12 Jul 2025 13:34:54 +0200
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
X-Inumbo-ID: 3bffe39a-5f14-11f0-b894-0df219b8e170
Date: Sat, 12 Jul 2025 13:34:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] MAINTAINERS: add me as an additional stubdom maintainer
Message-ID: <aHJIXlnC_mhG7i_t@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
References: <20250701062232.7117-1-jgross@suse.com>
 <alpine.DEB.2.22.394.2507011238170.862517@ubuntu-linux-20-04-desktop>
 <2c220a56-0cc9-41c5-b4a7-e84209dd1490@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c220a56-0cc9-41c5-b4a7-e84209dd1490@xen.org>
Organization: I am not organized

Julien Grall, le sam. 12 juil. 2025 11:44:02 +0100, a ecrit:
> On 01/07/2025 20:38, Stefano Stabellini wrote:
> > On Tue, 1 Jul 2025, Juergen Gross wrote:
> > > I've been the main contributor to the stubdom framework for several
> > > years now.
> > > 
> > > Add me as a maintainer.
> > > 
> > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> I think for this one we also need an Ack from Samuel. So I have CCed him

Yes, please. As my reviewing latency shows, I don't have enough
bandwidth (and I have not been actually really working on stubdom since
2008...)

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Samuel

