Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA63282E5
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 16:58:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91756.173073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkva-0006EK-HH; Mon, 01 Mar 2021 15:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91756.173073; Mon, 01 Mar 2021 15:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGkva-0006Dv-Do; Mon, 01 Mar 2021 15:57:46 +0000
Received: by outflank-mailman (input) for mailman id 91756;
 Mon, 01 Mar 2021 15:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-0006Dq-Lr
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-0002y7-Hi
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGkvY-00005H-Eh
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 15:57:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGkvU-0004kk-TO; Mon, 01 Mar 2021 15:57:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=D6ber2Y4v3368Vq2zqGOCcZQ0X8vbXNk5rYjNgWHM7g=; b=moU0gcLGQakxbsDeGu7klJNbOR
	BRNLqyNA8O2H2GS0CJLLONBUo/ij2pBa/5XTD2bfs5hEzP5fYi2xEhGFBdl6Vs5EAu0+EtcT5ORsG
	g5uK5PXvW9rxW7PI/DjBRyEkI0wKoVTcY73SGM8P/h1qIDvoES4cdSb/qrille4VrNqk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.3828.576373.217715@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 15:57:40 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Connor Davis <connojdavis@gmail.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Dario Faggioli  <dfaggioli@suse.com>
Subject: Re: [PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1
In-Reply-To: <171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
	<171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1"):
> In this case the compiler is recognizing that no valid array indexes
> remain, and hence e.g. reports:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

