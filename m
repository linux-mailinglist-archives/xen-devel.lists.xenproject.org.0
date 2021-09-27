Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900741967F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196995.349911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrjO-0008Pw-FI; Mon, 27 Sep 2021 14:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196995.349911; Mon, 27 Sep 2021 14:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrjO-0008O9-CJ; Mon, 27 Sep 2021 14:35:46 +0000
Received: by outflank-mailman (input) for mailman id 196995;
 Mon, 27 Sep 2021 14:35:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrjM-0008O3-NK
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:35:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrjM-0001Mr-LX
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:35:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrjM-0004Yi-KK
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:35:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUrjJ-0000iJ-DJ; Mon, 27 Sep 2021 15:35:41 +0100
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
	bh=Ds0r5BeAigokeNiNFatsZ1/EKEVxckV8FbxIOcH/U1k=; b=3StHqKEPw7SwADXLiI5OrBs34g
	a7OxWBfBXt977lfedApA2oNaxorJB9Bj66uoxM/w1e7yshFgvDPQ6qpwj8j2wN5hWZLc09c1PlwRF
	EUPRzlP+Y10nCKAt8V3E1YWQQD8xmVuhqLoTvpNU4qRqFK4DklOFnmXR1o750rz2q+hQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.54973.125818.683581@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 15:35:41 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Config: use Mini-OS commit 9f09744aa3e5982 for
 xen-unstable
In-Reply-To: <6c655f0e-5e32-6895-1a88-a967c8721bfd@suse.com>
References: <20210908125232.20993-1-jgross@suse.com>
	<6c655f0e-5e32-6895-1a88-a967c8721bfd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v2] Config: use Mini-OS commit 9f09744aa3e5982 for xen-unstable"):
> Ping?
> 
> On 08.09.21 14:52, Juergen Gross wrote:
> > Switch the used Mini-OS commit to 9f09744aa3e5982 in xen-unstable.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> > ---
> > V2:
> > - use a specific commit instead of master (Ian Jackson, Jan Beulich)
> > ---
> >   Config.mk | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Config.mk b/Config.mk
> > index 4d723eec1d..e85bf18654 100644
> > --- a/Config.mk
> > +++ b/Config.mk
> > @@ -246,7 +246,7 @@ MINIOS_UPSTREAM_URL ?= git://xenbits.xen.org/mini-os.git
> >   endif
> >   OVMF_UPSTREAM_REVISION ?= b37cfdd2807181aed2fee1e17bd7ec1190db266a
> >   QEMU_UPSTREAM_REVISION ?= master
> > -MINIOS_UPSTREAM_REVISION ?= 051b87bb9c19609976fb038f386920e1ce5454c5
> > +MINIOS_UPSTREAM_REVISION ?= 9f09744aa3e5982a083ecf8e9cd2123f477081f9

Acked-by: Ian Jackson <iwj@xenproject.org>

and committed.  I added this note to the commit message:

    [ 9f09744aa3e5982 is current mini-os.git#master -iwj. ]

Ian.

