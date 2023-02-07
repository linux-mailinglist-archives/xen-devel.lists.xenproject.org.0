Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFC68CD71
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 04:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490806.759663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPEdz-0000zj-8z; Tue, 07 Feb 2023 03:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490806.759663; Tue, 07 Feb 2023 03:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPEdz-0000xa-5j; Tue, 07 Feb 2023 03:27:43 +0000
Received: by outflank-mailman (input) for mailman id 490806;
 Tue, 07 Feb 2023 03:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SVd9=6D=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1pPEdx-0000xS-N4
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 03:27:41 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f28911c-a697-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 04:27:39 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 3173R6tH051115
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 6 Feb 2023 22:27:11 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 3173R5pB051114;
 Mon, 6 Feb 2023 19:27:05 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 5f28911c-a697-11ed-93b5-47a8fe42b414
Date: Mon, 6 Feb 2023 19:27:05 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Doug Goldstein <cardoe@cardoe.com>,
        Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://
Message-ID: <Y+HFCbLqpSgSadTR@mattapan.m5p.com>
References: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Feb 06, 2023 at 10:10:33PM -0500, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.

I completely agree with the premise, but I would suggest the better
approach to removing use of git:// is to instead require signing of
commits.  I'm also under the impression git can use TLS, though I'm
unsure whether gits:// works (and what revision of git is required).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



