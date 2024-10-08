Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED29958F6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 23:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813599.1226603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHTk-0006Ub-Ks; Tue, 08 Oct 2024 21:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813599.1226603; Tue, 08 Oct 2024 21:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syHTk-0006SX-HJ; Tue, 08 Oct 2024 21:10:48 +0000
Received: by outflank-mailman (input) for mailman id 813599;
 Tue, 08 Oct 2024 21:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=95Tx=RE=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1syHTi-0006SJ-JZ
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 21:10:46 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c742a628-85b9-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 23:10:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BE970A054E;
 Tue,  8 Oct 2024 23:10:42 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pJnesq8Rcps; Tue,  8 Oct 2024 23:10:42 +0200 (CEST)
Received: from begin.home (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr
 [83.192.199.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 8904AA039E;
 Tue,  8 Oct 2024 23:10:42 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1syHTe-00000001he1-0Les; Tue, 08 Oct 2024 23:10:42 +0200
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
X-Inumbo-ID: c742a628-85b9-11ef-99a2-01e77a169b0f
Date: Tue, 8 Oct 2024 23:10:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Subject: Re: [MINI-OS PATCH 2/2] drop CONFIG_XC support
Message-ID: <ZwWf0lALEwSokZXQ@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20241007103456.14946-1-jgross@suse.com>
 <20241007103456.14946-3-jgross@suse.com>
 <ZwRdCU20l8PUPQ-V@begin>
 <a5a3abe5-245c-47ec-b197-261f4a61ccac@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5a3abe5-245c-47ec-b197-261f4a61ccac@suse.com>
Organization: I am not organized

Hello,

Jürgen Groß, le mar. 08 oct. 2024 11:22:11 +0200, a ecrit:
> On 08.10.24 00:13, Samuel Thibault wrote:
> > Juergen Gross, le lun. 07 oct. 2024 12:34:56 +0200, a ecrit:
> > > CONFIG_XC is no longer needed with individual CONFIG_LIBXEN support.
> > 
> > I don't really see why in the previous patch you introduced
> > compatibility and here you remove it?
> 
> Originally I meant to split the series by sending the first patch as a
> standalone one and then the second after the Xen side patches went in.
> 
> When changing my mind in this regard I thought dropping CONFIG_XC might
> be controversial, so I decided to keep the introduction of the
> CONFIG_LIBXEN items and the dropping of CONFIG_XC separate.

Ok, I was wondering something about this line :)

> I can merge the patches if you like that better.

It'll be simpler in the git history indeed.

Samuel

