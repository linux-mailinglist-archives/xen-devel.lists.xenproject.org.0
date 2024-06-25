Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EDD915AFE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747005.1154254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLu1R-0002i0-MK; Tue, 25 Jun 2024 00:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747005.1154254; Tue, 25 Jun 2024 00:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLu1R-0002fM-JR; Tue, 25 Jun 2024 00:26:57 +0000
Received: by outflank-mailman (input) for mailman id 747005;
 Tue, 25 Jun 2024 00:26:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLu1P-0002fG-Tx
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:26:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ecc8b55-3289-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:26:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 68FBB60A70;
 Tue, 25 Jun 2024 00:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9666C2BBFC;
 Tue, 25 Jun 2024 00:26:50 +0000 (UTC)
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
X-Inumbo-ID: 9ecc8b55-3289-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719275212;
	bh=+IH3mY1gzUzpvw6yySwfM+NnUF2wFABrQJxAcb9DocQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vQW7h+QsN11yDJLwy2fAwA2W3DT6qk/xgwmScOTwpyEd7TbcWNPQv3AvWmhcAbbtE
	 mEVricUzC3L4MI7QSx2AWXFA3ETy1YANIJ08CZfv+R5mCA0CSVDG0XRI4/J3e3jZsT
	 raCjX8MGUMb6g34gOpTZfpXbvyTjjLvm3EIYdXRQnnmFLUcMh4ues068MpNoBBIjA7
	 Ry40dd6OVPaN+LkSevKSC30C31xfOYupjfIG7EWAAn15OmH+FpFEYY91V+FftN1eNr
	 qLl+fZzRV33M8zhL8CGAV9NYDgqi0zt0mC/HQzfTxnkiVD2dlQRB4Uz5nggiSU+6Zm
	 eJ79j0G2/CvbA==
Date: Mon, 24 Jun 2024 17:26:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Federico Serafini <federico.serafini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH v2] automation/eclair: configure Rule 13.6 and custom
 service B.UNEVALEFF
In-Reply-To: <alpine.DEB.2.22.394.2406241637380.3870429@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2406241725240.3870429@ubuntu-linux-20-04-desktop>
References: <5c60e98d70ae94c155fd56ec13b764b7a8f6161c.1719219962.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2406241637380.3870429@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Stefano Stabellini wrote:
> On Mon, 24 Jun 2024, Federico Serafini wrote:
> > Rule 13.6 states that "The operand of the `sizeof' operator shall not
> > contain any expression which has potential side effects".
> > 
> > Define service B.UNEVALEFF as an extension of Rule 13.6 to
> > check for unevalued side effects also for typeof and alignof operators.
> > 
> > Update ECLAIR configuration to deviate uses of BUILD_BUG_ON and
> > alternative_v?call[0-9] for both Rule 13.6 and B.UNEVALEFF.
> > 
> > Add service B.UNEVALEFF to the accepted.ecl guidelines to check
> > "violations" in the weekly analysis.
> > 
> > Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hi Oleksii,

I am asking for a release-ack on this rule: it widens the checks done by
ECLAIR but only for non-blocking rules (a rule not causing a gitlab-ci
failure). Hence, there should be no effect on gitlab-ci.

Cheers,

Stefano

