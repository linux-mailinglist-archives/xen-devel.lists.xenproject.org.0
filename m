Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DBD3C00F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208388.1520551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi5tE-0005BU-CE; Tue, 20 Jan 2026 07:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208388.1520551; Tue, 20 Jan 2026 07:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi5tE-00058z-9c; Tue, 20 Jan 2026 07:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1208388;
 Tue, 20 Jan 2026 07:10:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vi5tD-00058s-1d
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:10:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vi5t7-00Cd0R-1m;
 Tue, 20 Jan 2026 07:10:53 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vi5t6-00B8um-2v;
 Tue, 20 Jan 2026 07:10:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=aPPFJbjUAKb601RHV/6PWokK7q363TBq5kpsScZJaaA=; b=
	y1B5JOJ6ldIx9/MLW9dep8E78pfOPB6/kWTJ5dVgQTtcrnkhWJI5+hs3EuwjKL2VfkpMi7cU+w+hK
	ESw8ptov8xCEbxvYPd7HW2KwiX69fgJCy5UMQEdExAC3k4D3f/r2pvfgPhQAvvzW3j9y0rlIQN4Qp
	yswRJCcHHOsmu2EzY=;
From: dmukhin@xen.org
Date: Mon, 19 Jan 2026 23:10:50 -0800
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
	roger.pau@citrix.com, dmukhin@ford.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
Message-ID: <aW8qesBTjzT4eZX3@kraken>
References: <20260116030842.415583-2-dmukhin@ford.com>
 <09c0007b-3cac-469a-83a0-726c1be149da@suse.com>
 <alpine.DEB.2.22.394.2601161239510.72558@ubuntu-linux-20-04-desktop>
 <6f275030-a3c2-4710-952e-56c3226b5a8b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f275030-a3c2-4710-952e-56c3226b5a8b@suse.com>

On Mon, Jan 19, 2026 at 08:29:58AM +0100, Jan Beulich wrote:
> On 16.01.2026 21:47, Stefano Stabellini wrote:
> > On Fri, 16 Jan 2026, Jan Beulich wrote:
> >> On 16.01.2026 04:08, dmukhin@xen.org wrote:
> >>> --- a/INSTALL
> >>> +++ b/INSTALL
> >>> @@ -33,11 +33,11 @@ small subset of the options.  Attempts to change other options will be
> >>>  silently overridden.  The only way to find which configuration options
> >>>  are available is to run `make menuconfig' or the like.
> >>
> >> I fear this earlier paragraph needs editing as well, which will then
> >> make more clear that ...
> >>
> >>> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> >>> -in your environment.  However, doing this is not supported and the
> >>> -resulting configurations do not receive security support.  If you set
> >>> -this variable there is nothing stopping you setting dangerously
> >>> -experimental combinations of features - not even any warnings.
> >>> +This behavior can be overridden by enabling "Configure EXPERT features"
> >>> +in Kconfig (CONFIG_EXPERT).
> >>
> >> ... this may not be quite adequate.
> >>
> > 
> > I am not sure how you would like to change the earlier paragraph or this
> > paragraph. I gave it a try and removed both paragraphs, replacing it
> > with this:
> > 
> > """
> > Only a subset of options is supported or security-supported by Xen
> > Project. You can explore all available options, including unsupported
> > ones and those recommended only for expert users, by using `make
> > menuconfig` and enabling `CONFIG_UNSUPPORTED` and/or `CONFIG_EXPERT`.
> > However, enabling these options is not supported, and configurations
> > resulting from them do not receive security support.
> > """
> > 
> > What do you think?
> 
> This would be fine with me.

Thanks Stefano and Jan.
I will send an update shortly.

--
Denis

