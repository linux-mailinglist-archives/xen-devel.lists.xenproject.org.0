Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39A5FA947
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 02:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419405.664175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi36M-00013K-LA; Tue, 11 Oct 2022 00:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419405.664175; Tue, 11 Oct 2022 00:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi36M-00011F-I5; Tue, 11 Oct 2022 00:26:30 +0000
Received: by outflank-mailman (input) for mailman id 419405;
 Tue, 11 Oct 2022 00:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oi36K-000115-6c
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 00:26:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5661a4f1-48fb-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 02:26:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8399460FCF;
 Tue, 11 Oct 2022 00:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE88C433C1;
 Tue, 11 Oct 2022 00:26:21 +0000 (UTC)
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
X-Inumbo-ID: 5661a4f1-48fb-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665447983;
	bh=tU9BBGGHJTh3lSTNEV/+WssVkNmezsErJAYxoqNdPO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pFKMNJtSYDlnvtPk74/+SUs8cieOy8iISQrijy60n++P88aQTo1OvAYQKcdVTj6KE
	 QIsehGDYBQP+hLF5h55JPid9kRV5M2KWkfwKa9YVXQTISA2ao+27ysUxaPosztihNk
	 Qod6694nQKrx+OFlnz/qX6T3+CQNscu8scd4x5zdRF8tGOVxiHTAXS8WlDpCrXiocF
	 XBSnhU77FOunMmGOQ2kMlbOjr5xopn4U91JBVByjqneT0Khura2EV8U0DH+BGWWaPW
	 Nq7nd6Hc9NOSMsHOFrtYTgPgpI2fgOmZytkfTLR6MM7txYBUctpMMWq5xcMLpYt4mV
	 THFeOFtrPZnhw==
Date: Mon, 10 Oct 2022 17:26:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v3 4/4] Remove extra copies of licenses and license
 headers
In-Reply-To: <b87e4263-4018-b840-74be-965aec89d187@xen.org>
Message-ID: <alpine.DEB.2.22.394.2210101716390.3690179@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2210071710070.3690179@ubuntu-linux-20-04-desktop> <20221008001544.78302-4-sstabellini@kernel.org> <b87e4263-4018-b840-74be-965aec89d187@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 9 Oct 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 08/10/2022 01:15, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Remove the extra copy of the GPL license and license copyright headers
> > from CONTRIBUTING and the top-level COPYING.
> > 
> > Mention of the LICENSES/ directory and also mention the SPDX tag.
> > 
> > SPDX support is still in progress and COPYING files in subdirectories
> > still need to be updated.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Patch new in v3
> > ---
> >   CONTRIBUTING | 150 ++--------------------
> >   COPYING      | 351 +--------------------------------------------------
> >   2 files changed, 17 insertions(+), 484 deletions(-)
> > 
> > diff --git a/CONTRIBUTING b/CONTRIBUTING
> > index 6ec146baf0..7b6b03fb96 100644
> > --- a/CONTRIBUTING
> > +++ b/CONTRIBUTING
> > @@ -19,10 +19,6 @@ Most notably:
> >    - tools/xl           : LGPL v2.1
> >    - xen/include/public : MIT license
> >   -The COMMON COPYRIGHT NOTICES section of this document contains
> > -sample copyright notices for the most common licenses used within
> > -this repository.
> > -
> 
> How about replacing this section with something like:
> 
> " See LICENSES/ for a list of licenses and SPDX tags currently used."

Good idea


> >   When creating new components, new files, or importing code please follow
> >   the conventions outlined below. As a general rule, whenever code using a
> >   license other than GPLv2 is introduced, attention must be drawn to the
> > @@ -32,20 +28,22 @@ deviation. Any new code must be GPLv2 compatible.
> >   New components
> >   --------------
> >   -When creating new components and directories that contain a
> > -significant amount of files that are licensed under licenses other
> > -than GPLv2 or the license specified in the COPYING file, please
> > -create a new COPYING file in that directory containing a copy of the
> > -license text and a rationale for using a different license. This helps
> > -ensure that the license of this new component/directory is maintained
> > -consistently with the original intention.
> > +When creating new components and directories that contain a significant
> > +amount of files that are licensed under licenses other than GPLv2,
> > +please create a new COPYING file in that directory with the rationale
> > +for using a different license. This helps ensure that the license of
> > +this new component/directory is maintained consistently with the
> > +original intention.
> 
> I don't understand why the wording "or the license specified in the COPYING
> file" is dropped. To me, the sentence was indicating that it is not necessary
> to create a COPYING file in every sub-directory if the license is not GPLv2
> and it matches the license of a parent directory.
> 
> Do you plan to remove COPYING completely?

No, I don't plan to remove COPYING completely. COPYING is useful to tell
the user what license to choose. I only meant to clarify that COPYING
doesn't need to have a full copy of the license again. An SPDX tag would
be enough. I can change it to:

---
When creating new components and directories that contain a
significant amount of files that are licensed under licenses other
than GPLv2 or the license specified in the COPYING file, please
create a new COPYING file in that directory containing the SPDX tag
and a rationale for using a different license. This helps ensure that
the license of this new component/directory is maintained consistently
with the original intention.
---


> >     New files
> >   ---------
> >   -If specific files that differ from the license in a directory are
> > introduced,
> 
> This is fine to drop but ...
> 
> > -exceptions should be highlighted and discussed in the commit message or
> > cover
> > -letter introducing the file.
> 
> ... I think this should be kept because we want to have justification why the
> license of a file doesn't match the license of the directory.

Good idea


> > +New files should start with a single-line SPDX comment to express the
> > +license. The following comment and license are recommended:
> 
> Someone reading this may think that a new file in libxl wants to be GPLv2. So
> I would add in parentheses that the license may be different in some
> directory.
> 
> Similarly, I think this should be stronger than recommended. The SPDX should
> be a *must* and for the license there are effectively little leeway in which
> one we could use for existing components.
> So how about:
> 
> "For instance, if the file is GPLv2, the comment would look like:
> 
> /* SPDX-License-Identifier... */
> 
> The recommended license of a directory will depend on the COPYING file. If the
> new file is using a different license, this should be highlighted and
> discussed in the commit message or cover letter introducing the file.
> "
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

