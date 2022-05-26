Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C553542E
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 21:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337732.562419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJcU-00031P-5A; Thu, 26 May 2022 19:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337732.562419; Thu, 26 May 2022 19:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuJcU-0002yB-1C; Thu, 26 May 2022 19:58:06 +0000
Received: by outflank-mailman (input) for mailman id 337732;
 Thu, 26 May 2022 19:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nuJcS-0002Vw-Rz
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 19:58:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 266d9046-dd2e-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 21:58:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 245EC6190F;
 Thu, 26 May 2022 19:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39735C385A9;
 Thu, 26 May 2022 19:58:00 +0000 (UTC)
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
X-Inumbo-ID: 266d9046-dd2e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653595081;
	bh=8mWw/udNPF+/YboPCcEbCt+13wWFw7sK6GoYz4NxL14=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RyF/CYQSPcMbwnxgaRLIVj/W0vKN4O1WLUzvC2Ls98YooEKSSsQeTFKA6hIFSQsAC
	 NERvHoiiy4osTE0uKbPOgCd/BX3J9wslRkp+z1CnCiJTgSFkRUh9cXIRMDgJFi2nCO
	 QZSX9OJKLp89qo7a1eiAGpYu+kd2mvnXbJduP/rsWseUYzrSXp62XTmGvl4gcGdfKN
	 DF3p8DkuhP6wjwIr5QYeNv6ILTZci6dvxfy0ON9wMnabtPnQRFXYosEitQTpqqpgNe
	 UNaHq1t3V9Zw5I+aF27zyinP50l1iFzJSzlKCse/3oMuG38yJD+PXbAbtEHkBh6Pkw
	 asqf5+KqdxWlg==
Date: Thu, 26 May 2022 12:57:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] docs/misra: introduce rules.rst
In-Reply-To: <0d71af01-dbfa-d5ab-c55c-faa3693674bc@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205261230480.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-1-sstabellini@kernel.org> <62f142e3-02c7-22e0-3917-3a29fa2630b1@suse.com> <alpine.DEB.2.22.394.2205251746250.1905099@ubuntu-linux-20-04-desktop>
 <0d71af01-dbfa-d5ab-c55c-faa3693674bc@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 May 2022, Jan Beulich wrote:
> On 26.05.2022 03:12, Stefano Stabellini wrote:
> > On Wed, 25 May 2022, Jan Beulich wrote:
> >> On 25.05.2022 02:35, Stefano Stabellini wrote:
> >>> --- /dev/null
> >>> +++ b/docs/misra/rules.rst
> >>> @@ -0,0 +1,65 @@
> >>> +=====================
> >>> +MISRA C rules for Xen
> >>> +=====================
> >>> +
> >>> +**IMPORTANT** All MISRA C rules, text, and examples are copyrighted by the
> >>> +MISRA Consortium Limited and used with permission.
> >>> +
> >>> +Please refer to https://www.misra.org.uk/ to obtain a copy of MISRA C, or for
> >>> +licensing options for other use of the rules.
> >>> +
> >>> +The following is the list of MISRA C rules that apply to the Xen Project
> >>> +hypervisor.
> >>> +
> >>> +- Rule: Dir 2.1
> >>> +  - Severity:  Required
> >>> +  - Summary:  All source files shall compile without any compilation errors
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_02_01.c
> >>> +- Rule: Dir 4.7
> >>> +  - Severity:  Required
> >>> +  - Summary:  If a function returns error information then that error information shall be tested
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_07.c
> >>> +- Rule: Dir 4.10
> >>> +  - Severity:  Required
> >>> +  - Summary:  Precautions shall be taken in order to prevent the contents of a header file being included more than once
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_10.c
> >>
> >> Like Julien has already pointed out for 4.7, this and perhaps other ones
> >> also want clarifying somewhere that we expect certain exceptions. Without
> >> saying so explicitly, someone could come forward with a patch eliminating
> >> some uses (and perhaps crippling the code) just to satisfy such a rule.
> >> This would then be a waste of both their and our time.
> > 
> > Yes, and also Julien pointed out something similar. I'll add a statement
> > at the top of the file to say that there can be deviations as long as
> > they are commented.
> 
> We need to determine where such comments are to go. I hope you don't
> mean code comments on each and every instance of similar-kind
> deviations.

I'll reply to this in the other thread.


> > I wouldn't go as far as adding a note to each specific rule where we
> > expect deviations because I actually imagine that many of them will end
> > up having at least one deviation or two. It would be easier to mark the
> > ones where we expect to have 100% compliance and intend to keep it that
> > way (once we reach 100% compliance).
> > 
> > We are still in the early days of this process. For now, what about
> > adding the following statement at the top of the file (in addition to
> > the one saying that deviations are permissible):
> > 
> > """
> > The existing codebase is not 100% compliant with the rules. Some of the
> > violations are meant to be documented as deviations, while some others
> > should be fixed. Both compliance and documenting deviations on the
> > existing codebase is work-in-progress.
> > """
> > 
> > 
> >>> +- Rule: Dir 4.14
> >>> +  - Severity:  Required
> >>> +  - Summary:  The validity of values received from external sources shall be checked
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/D_04_14.c
> >>> +- Rule: Rule 1.3
> >>> +  - Severity:  Required
> >>> +  - Summary:  There shall be no occurrence of undefined or critical unspecified behaviour
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_01_03.c
> >>> +- Rule: Rule 3.2
> >>> +  - Severity:  Required
> >>> +  - Summary:  Line-splicing shall not be used in // comments
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c
> >>
> >> To aid easily looking up presence of a rule here, I think the table wants
> >> sorting numerically.
> > 
> > They are sorted numerically, first the "Dir" (directives) then the
> > "Rules".
> 
> Oh, I see. I didn't recognize the distinction. Maybe have a visual
> separator between the two classes?

I'll try but the layout changed significantly to become "proper RST"
following Andrew's comments. I'll see if I can come up with something.
If not, I could create two tables. First Dir, then Rules.


> >>> +- Rule: Rule 6.2
> >>> +  - Severity:  Required
> >>> +  - Summary:  Single-bit named bit fields shall not be of a signed type
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_06_02.c
> >>> +- Rule: Rule 8.1
> >>> +  - Severity:  Required
> >>> +  - Summary:  Types shall be explicitly specified
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c
> >>> +- Rule: Rule 8.4
> >>> +  - Severity:  Required
> >>> +  - Summary:  A compatible declaration shall be visible when an object or function with external linkage is defined
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c
> >>> +- Rule: Rule 8.5
> >>> +  - Severity:  Required
> >>> +  - Summary:  An external object or function shall be declared once in one and only one file
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_05_2.c
> >>> +- Rule: Rule 8.6
> >>> +  - Severity:  Required
> >>> +  - Summary:  An identifier with external linkage shall have exactly one external definition
> >>> +  - Link:  https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_06_2.c
> >>
> >> I don't think this was uncontroversial, as we've got a lot of uses of
> >> declarations when we expect DCE to actually take out all uses. There
> >> are also almost a thousand violations, which - imo - by itself speaks
> >> against adoption.
> > 
> > Ah yes, good catch. We spoke about DCE in the context of Rule 2.1, not
> > this one. My preference would be to keep Rule 8.6 with a note allowing
> > DCE:
> > 
> > - Note: declarations without definitions are allowed (specifically when
> >   the definition is compiled-out or optimized-out by the compiler)
> 
> I'd be fine with that.

Cool, I'll add it in.

