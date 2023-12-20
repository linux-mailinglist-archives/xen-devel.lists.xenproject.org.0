Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C121819502
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 01:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657266.1026029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkGw-0000Z3-90; Wed, 20 Dec 2023 00:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657266.1026029; Wed, 20 Dec 2023 00:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFkGw-0000W8-6F; Wed, 20 Dec 2023 00:17:14 +0000
Received: by outflank-mailman (input) for mailman id 657266;
 Wed, 20 Dec 2023 00:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFkGu-0000W2-4J
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 00:17:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d297859-9ecd-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 01:17:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 60F9AB81A38;
 Wed, 20 Dec 2023 00:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A396C433C8;
 Wed, 20 Dec 2023 00:17:05 +0000 (UTC)
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
X-Inumbo-ID: 1d297859-9ecd-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703031426;
	bh=LX5gplFP3Y5qAHC9iaIrXZXOrJXSk6MQ0/YfFhBWOv4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ib78rCd+Nbiwr2rRg9aRmyUXgQE+LWqFq/965j6VnCbfLenpf/S7XlkoxWWbCg3+K
	 eB83gg/hkJqN8YS19SmpKDvO+h2b4Hv883ctbGtrsjNt1sSpiQyAnynA8nNjwncnqL
	 oTpxWZD8Cs9zDt3ghmzuDd8ZDV2NV1s8VFgsQEcKdxhRSagxv0Mhq/iK7cD1zSHaGW
	 JuE/eXcO1r8Atmiu76ams1YdshhIGiNc4HUocQS1S3c2L3Hk9JqIbKRXl6bYFSIUs9
	 AN9FjWeeEVzhCWdAEu2RClR/kvmalTBjwE2SjuKLEazKsbrDeVmOCsTzMwAEagvi/n
	 P67Ih27TbC10Q==
Date: Tue, 19 Dec 2023 16:17:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    "consulting@bugseng.com" <consulting@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen: add acmacros.h to exclude-list.json
In-Reply-To: <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
Message-ID: <alpine.DEB.2.22.394.2312191616400.3175268@ubuntu-linux-20-04-desktop>
References: <664ddc412905546d44d3e311a743ba5217a6243b.1702976486.git.nicola.vetrini@bugseng.com> <055b6cf3-4f29-4f1d-b650-26c6d9be8832@suse.com> <2fd03776043811a8ceae9ae41de5f0fa@bugseng.com> <2c64af71dcb3984f1753ef115868cb7b@bugseng.com>
 <2F345562-4049-4A50-9793-D0002B239C43@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2058828051-1703031426=:3175268"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2058828051-1703031426=:3175268
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 19 Dec 2023, Luca Fancellu wrote:
> Hi!
> 
> > On 19 Dec 2023, at 11:05, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
> > 
> > On 2023-12-19 11:51, Nicola Vetrini wrote:
> >> On 2023-12-19 11:37, Jan Beulich wrote:
> >>> On 19.12.2023 10:02, Nicola Vetrini wrote:
> >>>> --- a/docs/misra/exclude-list.json
> >>>> +++ b/docs/misra/exclude-list.json
> >>>> @@ -209,6 +209,10 @@
> >>>>           "rel_path": "include/acpi/acglobal.h",
> >>>>           "comment": "Imported from Linux, ignore for now"
> >>>>         },
> >>>> +        {
> >>>> +          "rel_path": "include/acpi/acmacros.h",
> >>>> +          "comment": "Imported from Linux, ignore for now"
> >>>> +        },
> >>> Together with what's already there (in context), wouldn't it better be
> >>> the entire directory then which is excluded, or at least all
> >>> include/acpi/ac*.h collectively (and perhaps also
> >>> include/acpi/platform/ac*.h)?
> >>> Jan
> >> +Cc Luca Fancellu
> >> Sure. I wasn't certain which files are imported from ACPI CA and which aren't.
> >> I'm also not sure whether "include/acpi/ac*.h" would be properly recognized by other tooling that uses exclude-list.json (only cppcheck I think). I Cc-ed Luca Fancellu on this.
> > 
> > It occurred to me that it's surely ok to use "include/acpi/ac*" and "include/acpi/platform/ac*".
> 
> Yes I think it’s fine, it just come to my mind now that this could have the risk that if
> another file is added with ‘ac' prefix, even if it could be subject to MISRA compliance,
> it will be excluded.
> 
> If that risk is negligible for the maintainer of that part, then it’s fine.

I think it is OK either way, I'll let Jan pick his preference.
--8323329-2058828051-1703031426=:3175268--

