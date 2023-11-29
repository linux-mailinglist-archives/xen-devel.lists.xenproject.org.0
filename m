Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088B87FCD5E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 04:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643627.1004047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B6B-0003bv-0s; Wed, 29 Nov 2023 03:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643627.1004047; Wed, 29 Nov 2023 03:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B6A-0003Yh-Ts; Wed, 29 Nov 2023 03:18:50 +0000
Received: by outflank-mailman (input) for mailman id 643627;
 Wed, 29 Nov 2023 03:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8B68-0003YF-PT
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 03:18:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0120a31b-8e66-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 04:18:46 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D18FCE1BC4;
 Wed, 29 Nov 2023 03:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BABC433C8;
 Wed, 29 Nov 2023 03:18:38 +0000 (UTC)
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
X-Inumbo-ID: 0120a31b-8e66-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701227920;
	bh=dQKgUiIn+4UIUdwrn89C+7JMqmOKWCXDNjnHVfzFgnw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FNWuWLrZtbJ1iWpFinvyUkFosmkO4KyG4TFAZxtAotk5fGgGOfM7IhfhEP4brqXyr
	 OJZjsL8kyzaWE221bSujsSHR+F5X2BPnuQhVjEGrk0w8gKd9dwu8wlK3ZsJomvdRhg
	 QSDQ7nrPDGlxlxyQMU6wSBYalK8PDblo085mStN9friW43DgfhK/3dxfF7CrmCztbg
	 Dt12mRM+L7tsyC83QQINkCvlROzX6q0BxEnQTAb7l1YY3+I6xZGCoNQjAGPGym9hb+
	 Es5qYfQZpPAbyi8Ew/QNShJ+dzB8N06eHmF+glnwJqVhFWXhBNOz9nB/Cagg4MiKeK
	 lkE5oprO733rQ==
Date: Tue, 28 Nov 2023 19:18:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v5 1/2] automation/eclair: make the docs for MISRA
 C:2012 Dir 4.1 visible to ECLAIR
In-Reply-To: <alpine.DEB.2.22.394.2311281916270.3533093@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2311281918280.3533093@ubuntu-linux-20-04-desktop>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com> <dd207f2aa0a79b784df5d042f8a0169707c21902.1700211131.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2311281916270.3533093@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Nov 2023, Stefano Stabellini wrote:
> On Fri, 17 Nov 2023, Nicola Vetrini wrote:
> > To be able to check for the existence of the necessary subsections in
> > the documentation for MISRA C:2012 Dir 4.1, ECLAIR needs to have a source
> > file that is built.
> > 
> > This file is generated from 'C-runtime-failures.rst' in docs/misra
> > and the configuration is updated accordingly.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> It looks like you also addressed all Julien's comments appropriately

I meant to add my reviewed-by

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

