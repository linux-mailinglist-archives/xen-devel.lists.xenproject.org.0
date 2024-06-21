Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECD913010
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 00:07:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745645.1152795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmPi-0004fY-Gr; Fri, 21 Jun 2024 22:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745645.1152795; Fri, 21 Jun 2024 22:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKmPi-0004cR-EI; Fri, 21 Jun 2024 22:07:22 +0000
Received: by outflank-mailman (input) for mailman id 745645;
 Fri, 21 Jun 2024 22:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKmPh-0004c9-17
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 22:07:21 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ed6a4df-301a-11ef-b4bb-af5377834399;
 Sat, 22 Jun 2024 00:07:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8CEF1CE3D00;
 Fri, 21 Jun 2024 22:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7631CC32789;
 Fri, 21 Jun 2024 22:07:10 +0000 (UTC)
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
X-Inumbo-ID: 9ed6a4df-301a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719007631;
	bh=/4Um76W/pAVbIBbCOir5GbUqrqCWgSMwvcNAGHu+xIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W22bkPAVqv86j3N0rfPSubDhA6Hdc/sc9FCGUGaH8fs/uT0ryHsnkai3uA+hrFoR1
	 RleVMoBnFF+f/KHwL/2F9cEyZxw7E/atgUQpr8jc4P9HhODuCgcGV6NXR+IdjZpr8A
	 aRrT6WN+4J8tCFxz3LJdpst9nHoYyb4ve/Mfn6RRQMCg5B3amd3n8R71fFt8CqZWOS
	 gqAFdYEj2jBqwj1/LOuISVJX+injREYWvKBUWbqB/pzQtmEEp5gaMQnM+jP1hgD25M
	 mjJJMMjeghhr5T9Ac58L9gm4yxZTfPDxnUFLP/oEtIVElyVPIPJxCT6/p3JW6hGGFl
	 FS5aSODBArAoQ==
Date: Fri, 21 Jun 2024 15:07:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH] automation/eclair: add deviations of MISRA C Rule
 5.5
In-Reply-To: <alpine.DEB.2.22.394.2406201722100.2572888@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2406211506160.2572888@ubuntu-linux-20-04-desktop>
References: <dbd34e37b5d757ff7ae2a7318ad12b159970604c.1718887298.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406201722100.2572888@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Stefano Stabellini wrote:
> On Thu, 20 Jun 2024, Federico Serafini wrote:
> > MISRA C Rule 5.5 states that "Identifiers shall be distinct from macro
> > names".
> > 
> > Update ECLAIR configuration to deviate:
> > - macros expanding to their own name;
> > - clashes between macros and non-callable entities;
> > - clashes related to the selection of specific implementations of string
> >   handling functions.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I would like to ask for a release-ack as its effect is limited to ECLAIR
analysis results and rule 5.5 is not blocking anyway (it is allowed to
fail).

