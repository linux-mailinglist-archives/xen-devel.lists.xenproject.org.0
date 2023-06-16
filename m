Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75036733A8C
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550403.859466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFnS-0006Mv-ME; Fri, 16 Jun 2023 20:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550403.859466; Fri, 16 Jun 2023 20:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAFnS-0006KW-JW; Fri, 16 Jun 2023 20:11:50 +0000
Received: by outflank-mailman (input) for mailman id 550403;
 Fri, 16 Jun 2023 20:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlCr=CE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qAFnQ-0006KQ-W9
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 20:11:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c48139-0c82-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 22:11:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BBA06318C;
 Fri, 16 Jun 2023 20:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED606C4339A;
 Fri, 16 Jun 2023 20:11:43 +0000 (UTC)
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
X-Inumbo-ID: 04c48139-0c82-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946305;
	bh=tsre/4n+NOz6ZRIK1t7itkWxHUrewiTHt7Bue9fDIZw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tjsyIOM/RcN8WdkCZeJ0ZAaB44snbP6yMh+qP/y5NiiywWVa6MlMXbMMLoASf+rO/
	 X1VtEezC2rxGcTjin03+QKDp7PPPU92xy48v8a5lvrnoqsZy9uti6IDa/1k5wMr5fH
	 HbbCgLrldMpo2+tYotEVeNcVi+zSObYObTHWOCguT+VO/nzQPTIEvWOe6bMiFEFh1N
	 OFCRM1pw1kf6G//Aux6WsT1kCHhlfilWC89oTahtJ9J0cUuQlrx4dKB3jDNO2s9g/X
	 HzpRLA7bSs8TFR9tTU9qAn+iari/OpKG+Fwnr6hF3cgoca96aTXwGgDbSuXeyDWwts
	 iLqmVzb8dV75A==
Date: Fri, 16 Jun 2023 13:11:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] xen/misra: add rules 1.4 and 2.1
In-Reply-To: <FB0559AE-E996-40B5-89FF-4F96AF97E534@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306161311320.897208@ubuntu-linux-20-04-desktop>
References: <20230615212716.1330929-1-sstabellini@kernel.org> <FB0559AE-E996-40B5-89FF-4F96AF97E534@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1594210747-1686946305=:897208"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1594210747-1686946305=:897208
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 16 Jun 2023, Luca Fancellu wrote:
> > On 15 Jun 2023, at 22:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Also add a comment at the top of the file to say rules.rst could be
> > changed.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Hi Stefano,
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> 
> While I was testing the patch with our script that translates the docs to cppcheck
> Inputs, I noticed we might have a small issue there, seems that Directives and Rules
> clashes, and from a quick look to cppcheck addon, seems that only the rules are needed.
> 
> I’ll have a look on that soon.

Noted, thanks!


> > 
> > ---
> > Changes in v2:
> > - add link for 1.4
> > - expand 1.4 comment to say it could be revisited
> > - add comment at the top
> > ---
> > docs/misra/rules.rst | 15 +++++++++++++++
> > 1 file changed, 15 insertions(+)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index a88c284e7d..11b9c42b70 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -32,6 +32,9 @@ violations are meant to be documented as deviations, while some others
> > should be fixed. Both compliance and documenting deviations on the
> > existing codebase are work-in-progress.
> > 
> > +The list below might need to be updated over time. Reach out to THE REST
> > +maintainers if you want to suggest a change.
> > +
> > .. list-table::
> >    :header-rows: 1
> > 
> > @@ -90,6 +93,18 @@ existing codebase are work-in-progress.
> >        behaviour
> >      -
> > 
> > +   * - `Rule 1.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/>`_
> > +     - Required
> > +     - Emergent language features shall not be used
> > +     - Emergent language features, such as C11 features, should not be
> > +       confused with similar compiler extensions, which we use. When the
> > +       time comes to adopt C11, this rule will be revisited.
> > +
> > +   * - `Rule 2.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_01_1.c>`_
> > +     - Required
> > +     - A project shall not contain unreachable code
> > +     -
> > +
> >    * - `Rule 2.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_02_06.c>`_
> >      - Advisory
> >      - A function should not contain unused label declarations
> > -- 
> > 2.25.1
> > 
> > 
> 
> 
--8323329-1594210747-1686946305=:897208--

