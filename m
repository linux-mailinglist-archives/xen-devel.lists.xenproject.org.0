Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC404E795B
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 17:53:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294852.501570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnAi-0000yy-Td; Fri, 25 Mar 2022 16:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294852.501570; Fri, 25 Mar 2022 16:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXnAi-0000vg-QN; Fri, 25 Mar 2022 16:52:20 +0000
Received: by outflank-mailman (input) for mailman id 294852;
 Fri, 25 Mar 2022 16:52:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIhH=UE=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nXnAh-0000va-PU
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 16:52:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed96c3e9-ac5b-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 17:52:17 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id h7so14391049lfl.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Mar 2022 09:52:17 -0700 (PDT)
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
X-Inumbo-ID: ed96c3e9-ac5b-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=exHzcs3Wx1NtyvV6W7TJV+pR/BeiOMJ1mlOvCqPmOiU=;
        b=n5UBQYYPUvxdShv3weT6iC+EP+UVC94NxQ/TLlbx99QEa7VQlb+8TwrEu079wzwL1d
         m2uotbLAralAJwnRhwhkgIAseaImBGjwa4myVfHClGfnBKETqtKci11bebyCs8sKSNVT
         zUA02/hFBRTmN2aMG3eIYGCg4rZTQCdm9Ut0TvEjfigMybzIIb3cJrLKX1etQGcwyNDt
         1wSxPuVrhOIRXxa/1lCpbx9+Y6wMq5EshXiJGixIy5aZ5owTinbwesHIOPOFrF65eJ0c
         DgxY56GvBRrJjqGPUoYcCQ1yiG3ogT/gdZj5zYW7SPmggsXdWBxh90/Sg6o1LqiSyoYT
         n5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=exHzcs3Wx1NtyvV6W7TJV+pR/BeiOMJ1mlOvCqPmOiU=;
        b=T5KNVUtMltgdFqN52auWkDdZ74DrqOvuBJjiF81/aqRWC2kBDs+XZkKqs2TC6dXzm7
         ZG1tiFJr1on/XPZYgUYGSshxh9MbCGJg69+daJV4iZ3oBLSVL96QYkVfAb4QsqW+xyfB
         4Txio1nkTbeigKebbGiQcHvFrMW90XccGuS+HFAoN8AoeLQZ1NlLunirbnzXA44K/uyZ
         v4Np0yBnT4kEUt7AatLZiYu9tqlq/iOpRYV7+KSuqPzlEvbVmHbD3b/+fbgUzrAwmGe8
         uLqlnOoBiqC9iFTtW71mQlOiKu8vl8YnUunJwgjES1Ki2EhJb+s01U0HS72vri+f34VO
         +euA==
X-Gm-Message-State: AOAM532HV2CoPEF7l8vZXtZ85GKF9BtO7HJiaSov7xFSkdVyH8nqTpuS
	rbUl6JczMc6X4wnIvHeJCh9HHGFN8FZjOkrXCvM=
X-Google-Smtp-Source: ABdhPJy8B39DrSnTm0SvqqsM20ex++KzQ0iX24RhpXL+6HbFIOMeirqRF2oowhK4IrFJ69phOlfzd4SBldjksxr4A0c=
X-Received: by 2002:a05:6512:33c2:b0:44a:25e2:25d4 with SMTP id
 d2-20020a05651233c200b0044a25e225d4mr8373825lfg.359.1648227136475; Fri, 25
 Mar 2022 09:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org> <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
 <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com> <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop>
 <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
In-Reply-To: <ccb85826-feb8-7c26-64e3-0a459bdaf8b6@gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 25 Mar 2022 12:52:04 -0400
Message-ID: <CAKf6xpsB9Tr+WtDWPRYmkjB+8QmA0-oWrAcYh5D2G6WVWDZo1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
To: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, 
	Bertrand.Marquis@arm.com, Julien Grall <julien@xen.org>, Volodymyr_Babchuk@epam.com, 
	Luca Miccio <lucmiccio@gmail.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 25, 2022 at 11:46 AM Daniel P. Smith <dpsmith.dev@gmail.com> wrote:
>
> On 3/24/22 20:30, Stefano Stabellini wrote:
> > On Wed, 23 Mar 2022, Jan Beulich wrote:
> >> On 23.03.2022 01:22, Stefano Stabellini wrote:
> >>> The existing XSM check in evtchn_alloc_unbound cannot work and should
> >>> not work: it is based on the current domain having enough privileges to
> >>> create the event channel. In this case, we have no current domain at
> >>> all. The current domain is Xen itself.
> >>
> >> And DOM_XEN cannot be given the appropriate permission, perhaps
> >> explicitly when using a real policy and by default in dummy and SILO
> >> modes?
> >
> > The issue is that the check is based on "current", not one of the
> > domains passed as an argument to evtchn_alloc_unbound. Otherwise,
> > passing DOMID_XEN would be straightforward.
> >
> > We would need to use a hack (like Daniel wrote in the other email) to
> > set the idle_domain temporarily as a privileged domain only for the sake
> > of passing an irrelevant (irrelevant as in "not relevant to this case")
> > XSM check. That cannot be an improvement. Also, setting current to a
> > "fake" domain is not great either.
>
> My suggestion was not to intended to be simply a hack but looking at the
> larger issue instead of simply doing a targeted fix for this one
> instnace. While I cannot give an example right off hand, the reality is,
> at least for hyperlaunch, that we cannot say for certain there will not
> be further resource allocations that is protected by the security
> framework and will require preliminary handling by the construction
> logic in the hypervisor. The low-complexity approach is to address each
> one in a case-by-case fashion using direct calls that go around the
> security framework. A more security conscience, and higher complexity,
> approach would be to consider a least-privilege approach and look at
> introducing the ability to do controlled switching of contexts, i.e.
> moving `current` from DOMID_IDLE to DOMID_CONSTRUCT, to one that is
> granted only the necessary privileges to do the resource allocations in
> which it is limited.
>
> This is also not the first time this issue has come up, I don't recall
> the exact thread but several months ago someone ran into the issue they
> need to make a call to a resource function and was blocked by XSM
> because DOMID_IDLE has no privileges. The reality is that the idea of
> monolithic high-privileged entities is being dropped in favor of
> least-privilege, and where possible hardware enforced, constraint. This
> can be seen with Intel de-privileging SMM and running SMI handlers in
> constrained ring 3. Arm is gaining capability pointers, CHERI, that will
> enable the possibility for constrained, least-privileged kernel
> subsystems. Would it not be advantageous for Xen to start moving in such
> a direction that would enable it to provide a new level of safety and
> security for consumers of Xen?
>
> Coming back to the short-term, I would advocate for introducing the
> concept and abstraction of constrained context switching through a set
> of function calls, which would likely be under XSM to allow policy
> enforcement. Likely the introductory implementation would just mask the
> fact that it is just setting `is_privileged` for DOMID_IDLE. Future
> evolution of the capability could see the introduction of new
> "contexts", whether they are represented by a domain could be determined
> then, and the ability to do controlled switching based on policy.

For the specific case of evtchn_alloc_unbound, Flask's
xsm_evtchn_unbound has a side effect of labeling the event channel.
So skipping the hook will have unintended consequences for Flask.

xsm_evtchn_unbound could be split in two to have an access piece and a
labeling piece.  The access piece is run at hypercall entry, and the
labeling is still done in evtchn_alloc_unbound.  For Flask, labeling
depends on the two domain endpoints, but not current.

More generally, it seems to me there are too many xsm checks in the
middle of functions/operations.  They are fine for a normal entry via
hypercall, but they interfere with Xen's internal operations.  Xen
shouldn't be restricted in its own operations.  The live update people
hit it with domain creation, and I just posted a patch for
unmap_domain_pirq.

It would be more obvious for auditing if each hypercall entrypoint
applied xsm checks.  Make the allow/deny decision as early as
possible.  Then a worker function would be easily callable for the
Xen-internal case.  The flip side of that is the xsm hook may need
sub-op specific data to make its decision, so it fits to put it in the
sub-op function.  It seems to me the location of hooks was determined
by where the data they need is already available.  Re-arranging hooks
may require some duplication.

The xsm controls should clearly apply to the DomUs and other entities
managed by Xen.  xsm restricting Xen itself seems wrong.  Having
internal operations get denied by xsm may unintentionally subvert Xen
itself.

Yes, moving checks outward makes for an un-restricted middle.  But the
security server running in the same address space isn't going to help
against code exec inside the hypervisor.

I think I view it like this:  Why is a xen internal operation subject
to a security check?  When would one ever want to deny a xen internal
operation?

Regards,
Jason

