Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63AD817F67
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656470.1024655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP9K-0001DY-Vn; Tue, 19 Dec 2023 01:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656470.1024655; Tue, 19 Dec 2023 01:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP9K-0001Ba-TA; Tue, 19 Dec 2023 01:43:58 +0000
Received: by outflank-mailman (input) for mailman id 656470;
 Tue, 19 Dec 2023 01:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP9J-0000Vo-9U
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:43:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 122bcfa6-9e10-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:43:55 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3469CB81205;
 Tue, 19 Dec 2023 01:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDFFC433C7;
 Tue, 19 Dec 2023 01:43:53 +0000 (UTC)
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
X-Inumbo-ID: 122bcfa6-9e10-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702950234;
	bh=oWiM59z27pgbt0dbNzQrpyziAjjCdM8kfodYqoPeZJU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DXxCuKkPYdUCRYon2hdzyzP8SQ6VnURFp6rJHhTpLZbz4MsI8c0wcvODOm3YG9syM
	 GWMOc+ss8G+ecmsmp1pIqKcDYA3ICqJO1z+9FzbFXfGqe67PmH4TcutdEh0WSNn2bj
	 3kyIxqKYxKW5w/h8+oLmSolTnw8lWqifL7+WmEyYuKNY+U3EMWlOWk6Q+JVqIsYP6S
	 eMxEOwr5am+Uim1zeiVxeonasIFSRriVvK885YkcIb7bHms1OAjvxNZhOWYWtE5y6U
	 3WpzXhyO4cF0cBuicDunuT11gE+CToUmfal9aX5fjB0y1JibTdsw4d0yV6hQiBwP13
	 toN0M3BxpRyzw==
Date: Mon, 18 Dec 2023 17:43:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH v2 7/7] automation/eclair_analysis: avoid violation
 of MISRA Rule 2.1
In-Reply-To: <alpine.DEB.2.22.394.2312181739560.3175268@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2312181743250.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <6bf425b3d01dc16297ef45e58c03b3ffd803b9e0.1702891792.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2312181739560.3175268@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Stefano Stabellini wrote:
> On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> > The presence of an unlinked object file triggers a violation
> > of MISRA C Rule 2.1, which is deviated, as it's not part of
> > the final Xen binary.
> > 
> > No functional change.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> > ---
> >  automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > index 85741a2c01a9..e3de0fb2adf8 100644
> > --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> > +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> > @@ -28,6 +28,11 @@ not executable, and therefore it is safe for them to be unreachable."
> >  -config=MC3R1.R2.1,ignored_stmts+={"any()", "pure_decl()"}
> >  -doc_end
> >  
> > ++-doc_begin="The following autogenerated file is not linked deliberately."
> > ++-file_tag+={C_runtime_failures,"^automation/eclair_analysis/C-runtime-failures\\.rst\\.c$"}
> > ++-config=MC3R1.R2.1,reports+={deliberate, "any_area(any_loc(file(C_runtime_failures)))"}
> > ++-doc_end

Would it make sense to add it to exclude-list instead?

