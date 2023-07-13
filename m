Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D76752754
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jul 2023 17:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563300.880464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyLb-0001Hw-Vn; Thu, 13 Jul 2023 15:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563300.880464; Thu, 13 Jul 2023 15:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJyLb-0001FD-Sl; Thu, 13 Jul 2023 15:35:15 +0000
Received: by outflank-mailman (input) for mailman id 563300;
 Thu, 13 Jul 2023 15:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LNpG=C7=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qJyLa-0000uP-6Z
 for xen-devel@lists.xenproject.org; Thu, 13 Jul 2023 15:35:14 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daddfdef-2192-11ee-b239-6b7b168915f2;
 Thu, 13 Jul 2023 17:35:12 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 36DFYsHe097067
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 13 Jul 2023 11:34:59 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 36DFYqdM097066;
 Thu, 13 Jul 2023 08:34:52 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: daddfdef-2192-11ee-b239-6b7b168915f2
Date: Thu, 13 Jul 2023 08:34:52 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/3] Fixing ACPI error reporting display
Message-ID: <ZLAZnHUo8P2wccxD@mattapan.m5p.com>
References: <cover.1689191941.git.ehem+xen@m5p.com>
 <47f21cdf-5aa3-5f19-b967-6b217890e706@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47f21cdf-5aa3-5f19-b967-6b217890e706@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Thu, Jul 13, 2023 at 10:38:37AM +0200, Jan Beulich wrote:
> On 12.07.2023 21:59, Elliott Mitchell wrote:
> > This series has been seen previously.  The issue is pretty simple, if
> > ACPI errors occur there is a high probability they will occur on multiple
> > cores at once.
> 
> Nit: Both here and in the title s/ACPI/APIC/, to not misguide people about
> the area the series touches (just in case a v4 might be needed).

Uh, yeah.  Wonder how that got missed.  Seems like the time for a
Simpson's "doh!"  Also in patch #2 there is "APIC errors".

It would be correct if English words had the transitivity property.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



