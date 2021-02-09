Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A21E3154C6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 18:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83355.154910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WdI-0003HP-RN; Tue, 09 Feb 2021 17:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83355.154910; Tue, 09 Feb 2021 17:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WdI-0003Gt-Mu; Tue, 09 Feb 2021 17:17:00 +0000
Received: by outflank-mailman (input) for mailman id 83355;
 Tue, 09 Feb 2021 17:17:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WdH-0003Gl-Vw
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:16:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WdH-0003IZ-U9
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:16:59 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l9WdH-0001g1-T8
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 17:16:59 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l9WdE-0005zj-L4; Tue, 09 Feb 2021 17:16:56 +0000
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
	bh=a9VGnPZOIdShHck4LO3O3Jk2W9JGbHYNo8DpOXP2rAA=; b=bmca7RF7TpFxylo3gl37py07Ks
	FMXQ966KkSPzK6pdcSokMCvhQM/5wIh8HACPKSNCW8O1iwCRrCVrwKkrK04yam8Puhy7/7CmphtwR
	GXfTaA7o4kaTjUb/x3icWlOttxM5n+YZbVaeOQa4Rn1ijcL6TXbDB1tWTp7NaSzuWip0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24610.50056.424595.200181@mariner.uk.xensource.com>
Date: Tue, 9 Feb 2021 17:16:56 +0000
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Anthony PERARD  <anthony.perard@citrix.com>
Subject: Re: [PATCH v20210209 3/4] xl: optionally print timestamps when
 running xl commands
In-Reply-To: <20210209180600.67e3f167.olaf@aepfle.de>
References: <20210209154536.10851-1-olaf@aepfle.de>
	<20210209154536.10851-4-olaf@aepfle.de>
	<24610.48626.319165.973767@mariner.uk.xensource.com>
	<20210209180600.67e3f167.olaf@aepfle.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Olaf Hering writes ("Re: [PATCH v20210209 3/4] xl: optionally print timestamps when running xl commands"):
> Am Tue, 9 Feb 2021 16:53:06 +0000
> schrieb Ian Jackson <iwj@xenproject.org>:
> 
> > This part of the commit message talks about -t rather than -T.  I will
> > fix that on commit.
> 
> It is really the lowercase t.
> 
> 01f78a81ae56220dd496a61185ba5dfae30dc2fe did not adjust the output in tools/libxl/xl_cmdimpl.c:help().

OIC, thanks.

Ian.

