Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6167762356
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 22:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569934.891154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOfR-0004ZV-JP; Tue, 25 Jul 2023 20:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569934.891154; Tue, 25 Jul 2023 20:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOOfR-0004Xq-Gi; Tue, 25 Jul 2023 20:30:01 +0000
Received: by outflank-mailman (input) for mailman id 569934;
 Tue, 25 Jul 2023 20:30:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ITxH=DL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qOOfQ-000438-6T
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 20:30:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05f12735-2b2a-11ee-b240-6b7b168915f2;
 Tue, 25 Jul 2023 22:29:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC6246186A;
 Tue, 25 Jul 2023 20:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEC3C433C7;
 Tue, 25 Jul 2023 20:29:55 +0000 (UTC)
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
X-Inumbo-ID: 05f12735-2b2a-11ee-b240-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690316997;
	bh=R1o1FjC5+1850Wd0jwg1cn2b9IHmCqMVJ75KmrE/uMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IpozL/zK5nIUMQ4979+ku+b3d0SI23fwjnQAO9/QjU9CvRPln7YX6noeCWPWJG5Xi
	 gE1/Pw2Grs/tTSpCovxbPcqSbpkcaj9Fios4gZTTMhACqyIIXba5aHYwAeW0bllaV8
	 5V7gkJ3xRRfV+hfcftTBMRMf3Z5F31w2LVNTrnTk8THJB9HaZOaJgnbfBxkC1ocIPQ
	 1nJBrYRWFlSgUmM0wJfoF3QxBtwJbum1X86az0jeyYuQnUZHcKOn7L/qWg1wGwnvuK
	 IqIPppAaHTBpvMWD5TZLArj6l5Nj6SpdZLkpsMOVQrnnH486x+eF7o2ak2aJ1oBF9y
	 bqUpHJImTdymA==
Date: Tue, 25 Jul 2023 13:29:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] xen/spinlock: mechanically rename parameter name
 'debug'
In-Reply-To: <5332da19-a9d8-f9fb-62b3-b1dbdf7982dc@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307251329430.3118466@ubuntu-linux-20-04-desktop>
References: <87c0f41e43a1c95ef7d8923c77a2072eb9baee96.1690276551.git.nicola.vetrini@bugseng.com> <120ed841-5e0f-e27b-9937-5599dc75d84a@suse.com> <alpine.DEB.2.22.394.2307251235090.3118466@ubuntu-linux-20-04-desktop>
 <5332da19-a9d8-f9fb-62b3-b1dbdf7982dc@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 25 Jul 2023, Nicola Vetrini wrote:
> On 25/07/23 21:37, Stefano Stabellini wrote:
> > On Tue, 25 Jul 2023, Jan Beulich wrote:
> > > On 25.07.2023 11:17, Nicola Vetrini wrote:
> > > > Rule 5.3 has the following headline:
> > > > "An identifier declared in an inner scope shall not hide an
> > > > identifier declared in an outer scope"
> > > > 
> > > > To avoid any confusion resulting from the parameter 'debug'
> > > > hiding the homonymous function declared at
> > > > 'xen/arch/x86/include/asm/processor.h:428'
> > > > the rename of parameters s/debug/lkdbg/ is performed.
> > > > 
> > > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > > ---
> > > > Changes in v2:
> > > > - s/dbg/lkdbg/
> > > 
> > > But only in some of the cases. E.g. ...
> > > 
> > > > -static void check_barrier(union lock_debug *debug)
> > > > +static void check_barrier(union lock_debug *dbg)
> > > 
> > > ... not here (there are a few more).
> > 
> > I agree with Jan: these are all union lock_debug parameters, so it would
> > make sense to me to use lkdbg everywhere in this patch.
> 
> Yes, indeed, that's unintentional. Can this be done on commit or should I send
> a v3?

Please send an update if possible

