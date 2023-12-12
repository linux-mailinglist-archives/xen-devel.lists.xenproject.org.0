Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC16980FB0C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 00:10:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653668.1020088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBsq-000595-VD; Tue, 12 Dec 2023 23:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653668.1020088; Tue, 12 Dec 2023 23:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBsq-00056M-SY; Tue, 12 Dec 2023 23:09:48 +0000
Received: by outflank-mailman (input) for mailman id 653668;
 Tue, 12 Dec 2023 23:09:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBsp-000559-Jb
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 23:09:47 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5fa3a2-9943-11ee-98e8-6d05b1d4d9a1;
 Wed, 13 Dec 2023 00:09:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5D814B81983;
 Tue, 12 Dec 2023 23:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574FAC433C8;
 Tue, 12 Dec 2023 23:09:43 +0000 (UTC)
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
X-Inumbo-ID: 8a5fa3a2-9943-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702422584;
	bh=U74hejZJZbbp5p9aKrLQhxOz/wgdMR4AmNKvc57O1Z0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p6UzRdJDcPeWjXg9sE/LOwvbPwH0iRz8hSh7fhd72bBfSuwdqND+6qoA+rxZ1+tmo
	 pe4xu7eLe+G/B3ktEhuWtoEHL2JdFPfpdk2I14WeZbexH0RtjOrWQhyvuXZ0zwUt04
	 iNhAvcynuhjGyLJ1vo4SqoEpaH7YhB1YEj4loHVjB0MsAYRyuBcS/knWdA1IheQhDZ
	 9UyTacREnVMNGb4CDurtr/gBoZW2zv6l7XnjyM2ttyEPlNcep+bHWCIqJerivQLJ1M
	 caiOLWNsRMagv3WR3l488MuxQoT49cz7KJYcYgLqULFc9CN2qTc9G3J0Wz2Phb2GkD
	 QH/7rS8DubEhQ==
Date: Tue, 12 Dec 2023 15:09:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v2] automation/eclair_analysis: file exclusion
 automation
In-Reply-To: <31a802364de17dd457f3ec265302ea27e90ed518.1702284801.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121509360.1703076@ubuntu-linux-20-04-desktop>
References: <31a802364de17dd457f3ec265302ea27e90ed518.1702284801.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> The file exclude-list.json contains files that are classified as
> adopted code for MISRA compliance. Therefore, this file is used to
> automatically generate a suitable .ecl configuration for ECLAIR.
> 
> As such, many entries in out_of_scope.ecl can be removed, as they
> would be duplicates.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

