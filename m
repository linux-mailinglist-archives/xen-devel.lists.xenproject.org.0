Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B693B92D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 00:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764559.1175038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWkit-0006fR-2N; Wed, 24 Jul 2024 22:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764559.1175038; Wed, 24 Jul 2024 22:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWkis-0006c1-W6; Wed, 24 Jul 2024 22:44:38 +0000
Received: by outflank-mailman (input) for mailman id 764559;
 Wed, 24 Jul 2024 22:44:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T/i=OY=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1sWkir-0006bY-FG
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 22:44:37 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b752ae5-4a0e-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 00:44:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 8AA46A038F;
 Thu, 25 Jul 2024 00:44:32 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yB0qiCt7ad1; Thu, 25 Jul 2024 00:44:32 +0200 (CEST)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 676E2A038D;
 Thu, 25 Jul 2024 00:44:32 +0200 (CEST)
Received: from samy by begin with local (Exim 4.98-RC3)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1sWkil-0000000BNLX-1y2I; Thu, 25 Jul 2024 00:44:31 +0200
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
X-Inumbo-ID: 4b752ae5-4a0e-11ef-bbff-fd08da9f4363
Date: Thu, 25 Jul 2024 00:44:31 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 4/4] mini-os: remove sanity_check()
Message-ID: <20240724224431.jelemlo6tt2jgaw2@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
References: <20240722150141.31391-1-jgross@suse.com>
 <20240722150141.31391-5-jgross@suse.com>
 <20240722213544.hjyohnoz4mtcfltr@begin>
 <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <884d746c-47e4-4d0f-87a9-e2a03d2a3286@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Hello,

Jürgen Groß, le mar. 23 juil. 2024 08:36:13 +0200, a ecrit:
> On 22.07.24 23:35, Samuel Thibault wrote:
> > Juergen Gross, le lun. 22 juil. 2024 17:01:41 +0200, a ecrit:
> > > Remove the sanity_check() function, as it is used nowhere.
> > > 
> > > Since any application linked with Mini-OS can't call sanity_check()
> > > either (there is no EXPORT_SYMBOL for it), there is zero chance of
> > > breaking any use case.
> > 
> > Don't we still want to keep it around, at least as formal documentation
> > of the expected status of the list?
> 
> Hmm, is it really worth the extra code?

I have already seen such kind of piece of code getting very convenient
when tracking odd bugs.

Samuel

