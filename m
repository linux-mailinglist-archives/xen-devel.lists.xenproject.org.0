Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87C4F9568
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301490.514521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnUH-0000Zx-TM; Fri, 08 Apr 2022 12:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301490.514521; Fri, 08 Apr 2022 12:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnUH-0000YB-Pc; Fri, 08 Apr 2022 12:13:13 +0000
Received: by outflank-mailman (input) for mailman id 301490;
 Fri, 08 Apr 2022 12:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K+qN=US=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ncnUG-0000Y3-JR
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:13:12 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41d0d5db-b735-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 14:13:10 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id d40so7178161lfv.11
 for <xen-devel@lists.xenproject.org>; Fri, 08 Apr 2022 05:13:11 -0700 (PDT)
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
X-Inumbo-ID: 41d0d5db-b735-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjzsqM2Aq6bI/R4MOEHqqKcutv3AUjy6oe0odTRwJHk=;
        b=OkLVfZDGLNoEi6MHXGNE/OqYMV8TezXnrz6AHIxPq/g41cG+Zb/KWS3GxYeiqtLGxF
         DIchmMJ0YPNKrJog73gTkTOo3orE29LadzNfoItGo+fdL6hfXGCim4HrXEZ9r1eHGW8G
         Xzo0+SHN+dk3x8K6eyJtrfSbUkSzKQ3JZs2rxNq3pT8hu4T+rOsS5RFSX50o5U43byWJ
         PI3lo2TZqEQTSchc+v+0v+codwtdA4lT8Q9sIR3fdXiK67gj8MrOYuzyDhafRz2AKo6K
         Ru1HRmAokMdIBkxw2aUUFBKRmw3XpbX2a06GjZNv336AeFjB8etg4BN8SjxGhR2BpeW7
         5UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjzsqM2Aq6bI/R4MOEHqqKcutv3AUjy6oe0odTRwJHk=;
        b=KGSQHjuSFjoLXkLBNQAjE5EslOl8N5NgBh9JkeXrCdIaYm6trJ41AAWR7A0p6vanS6
         S4KlLVQdwGHk7MfDBAGoCH6Q88D0saCHV9YzAMsHX6WxcrxstxSpe0LiGBKZ1IT3Z+fd
         d8JvNlxHJEe3tChIwUJ4oTYj74JKLA6o2kjuNvaRRBAiWvafZAfMzDadMusxmDvkiHNY
         2XEz+5xvLxu6LIOizACrrCcXSStdbgC3DUyypg0PphG0c2zDtyXWnF8Pmrr8yu8xSxr1
         Q/j2cpvmogDjgOyfnhFtNdsS85ruM05uqKlHYWQVP5OJki9cR6PeqJsPP8YHltyeun2C
         18MQ==
X-Gm-Message-State: AOAM531b/tdtEpoTeTn6HQYwYmLugZ9OP0r4JkunSYBuF/RJlcJJ8nU2
	jMGJdqamm72JalLtj0CbZO/wzymDGR9VTa43bfc=
X-Google-Smtp-Source: ABdhPJwh6PLV+9ltHILguAbZi+RA9qkesxQ5cgyt3M4KGWPf54n8d6YruewMPHLIeY1zGsxAzsfMkReHmsMjBIT0dTo=
X-Received: by 2002:ac2:43d0:0:b0:46b:8248:57d5 with SMTP id
 u16-20020ac243d0000000b0046b824857d5mr2756448lfl.250.1649419991199; Fri, 08
 Apr 2022 05:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com> <Yk6VvXJHWxJZTgeF@Air-de-Roger>
 <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com> <CAKf6xps+VAvi1QcDGG=mB2pVt3frWFj=6pYrDMVKH+KgE6qaEw@mail.gmail.com>
 <0057e1c5-a651-dfbe-18ed-dc118abb723d@suse.com>
In-Reply-To: <0057e1c5-a651-dfbe-18ed-dc118abb723d@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 8 Apr 2022 08:12:59 -0400
Message-ID: <CAKf6xpux1Eo7necx8OdiApWs=hKAf663C0E2zcKiszBnDY9f6g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] VT-d: avoid NULL deref on domain_context_mapping_one()
 error paths
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 8, 2022 at 2:03 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 07.04.2022 18:31, Jason Andryuk wrote:
> > As I understand it, an RMRR is common with USB controllers for
> > implementing legacy mouse & keyboard support.  The Cannon Point PCH is
> > fairly modern, so I'd expect it to use PCI Express.  Xen seems to
> > identify it as DEV_TYPE_PCI given "PCI" above.  It is an integrated
> > PCI device, so it has no upstream bridge.  Maybe that is why it can
> > still be assigned?  The "unsupported assignment" is a legacy PCI
> > device, behind a bridge, with an RMRR?
>
> Ah yes - the "behind a bridge" aspect does matter (but I can't
> adjust the description of an already committed patch). That's both
> for the respective part of the XSA-400 series as well as for the
> change here.

Ok.  Thank you for confirming.  It is captured in the mailing list
archive at least.

Regards,
Jason

