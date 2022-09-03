Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE175ABBEB
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 02:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398012.638768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUHPC-0000OI-L8; Sat, 03 Sep 2022 00:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398012.638768; Sat, 03 Sep 2022 00:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUHPC-0000Lt-Hl; Sat, 03 Sep 2022 00:53:02 +0000
Received: by outflank-mailman (input) for mailman id 398012;
 Sat, 03 Sep 2022 00:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUHPB-0000Ln-L0
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 00:53:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c118ba4e-2b22-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 02:52:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8F056202C;
 Sat,  3 Sep 2022 00:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35D2C433D6;
 Sat,  3 Sep 2022 00:52:56 +0000 (UTC)
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
X-Inumbo-ID: c118ba4e-2b22-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662166377;
	bh=oXfjIhgKoRIXrpxJE5IbVwJQItA4R8mh+W0/UVGnvfw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vpt00UMGrmfL6hh4qiBVQv8c/m4jwC0mkn3KrVoTAGvk0M4c2XLXMLIbiA8s4p0Qf
	 hcocKdHYxDCNfbQ9AtoMrdDtqAuyMzgn0APlwNavty7yVnWnaYCDnCPs5frqSQ3dNT
	 l9XHGBtaQKvA6Eakmw/clPeQhdbW1sQMNRx8Bo0+Qx0xzUSkLLe3hUrvTyZUlinzDp
	 ZjVQ2+/2tG0QCgar3KcvGldD4EL05IY32ekZRcLeXqEp9RNefn88eE+3jgb1TQFEuj
	 riEnY4IvVXf/Tv10nknsVb1FRkeFTjWmF8he5HDAn7sSNBv+U7gShsZ9QsQfrUlhx6
	 zgDYvabzALabQ==
Date: Fri, 2 Sep 2022 17:52:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: roberto.bagnara@bugseng.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, burzalodowa@gmail.com
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
In-Reply-To: <422ad42f-8bfa-55a9-2e70-4ae857632a94@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2209021743150.3931@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop> <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com> <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
 <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop> <422ad42f-8bfa-55a9-2e70-4ae857632a94@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Roberto

I think we need Roberto's advice on Rule 20.7. (Full thread below.)

The question is on the interpretation of Rule 20.7. Are parenthesis
required by Rule 20.7 in the following cases:

- macro parameters used as function arguments 
- macro parameters used as macro arguments
- macro parameter used as array index
- macro parameter used as lhs in assignment

Some of these cases are interesting because they should function
correctly even without parenthesis, hence the discussion. In particular
parenthesis don't seem necessary at least for the function argument
case.

Regardless of the MISRA C interpretation, Xenia noticed that Eclair
reports violations on these cases (cppcheck does not, I don't know other
checkers).



On Fri, 2 Sep 2022, Xenia Ragiadakou wrote:
> On 9/2/22 05:07, Stefano Stabellini wrote:
> > On Thu, 1 Sep 2022, Bertrand Marquis wrote:
> > > Hi Xenia,
> > > 
> > > > On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
> > > > 
> > > > 
> > > > On 9/1/22 01:35, Stefano Stabellini wrote:
> > > > > Patches 1, 4, and 6 are already committed. I plan to commit patches 2,
> > > > > 3
> > > > > and 5 in the next couple of days.
> > > > > Patch 7 needs further discussions and it is best addressed during the
> > > > > next MISRA C sync-up.
> > > > 
> > > > I would like to share here, before the next MISRA C sync, my
> > > > understandings that will hopefully resolve a wrong impression of mine,
> > > > that I may have spread around, regarding this rule.
> > > > There was a misunderstanding regarding the rule 20.7 from my part and I
> > > > think that Jan is absolutely right that parenthesizing macro parameters
> > > > used as function arguments is not required by the rule.
> > > > 
> > > > The rule 20.7 states "Expressions resulting from the expansion of macro
> > > > parameters shall be enclosed in parentheses" and in the rationale of the
> > > > rule states "If a macro parameter is not being used as an expression
> > > > then the parentheses are not necessary because no operators are
> > > > involved.".
> > > > 
> > > > Initially, based on the title, my understanding was that it requires for
> > > > the expression resulting from the expansion of the macro to be enclosed
> > > > in parentheses. Then, based on the rule explanation and the examples
> > > > given,  my understanding was that it requires the macro parameters that
> > > > are used as expressions to be enclosed in parentheses.
> > > > But, after re-thinking about it, the most probable and what makes more
> > > > sense, is that it require parentheses around the macro parameters that
> > > > are part of an expression and not around those that are used as
> > > > expressions.
> > > > 
> > > > Therefore, macro parameters being used as function arguments are not
> > > > required to be enclosed in parentheses, because the function arguments
> > > > are part of an expression list, not of an expression (comma is evaluated
> > > > as separator, not as operator).
> > > > While, macro parameters used as rhs and lhs expressions of the
> > > > assignment operator are required to be enclosed in parentheses because
> > > > they are part of an assignment expression.
> > > > 
> > > > I verified that the violation reported by cppcheck is not due to missing
> > > > parentheses around the function argument (though still I have not
> > > > understood the origin of the warning). Also, Eclair does not report it.
> > > > 
> > > > Hence, it was a misunderstanding of mine and there is no inconsistency,
> > > > with respect to this rule, in adding parentheses around macro parameters
> > > > used as rhs of assignments. The rule does not require adding parentheses
> > > > around macro parameters used as function arguments and neither cppcheck
> > > > nor Eclair report violation for missing parentheses around macro
> > > > parameters used as function arguments.
> > > 
> > > 
> > > Thanks a lot for the detailed explanation :-)
> > > 
> > > What you say does make sense and I agree with your analysis here, only
> > > protect when part of an expression and not use as a subsequent parameter
> > > (for a function or an other macro).
> > 
> > Yeah I also agree with your analysis, and many thanks for
> > double-checking the cppcheck and Eclair's reports.
> 
> Unfortunately in the specific case that I checked, it was not reported because
> it was actually an argument to a macro, not a function.
> Eclair does report as violations of Rule 20.7 the macro parameters that are
> used as function arguments and are not enclosed in parentheses.
> 
> So, one tool reports it as violation and the other one not.
> 
> The same goes, also, for the case where a macro parameter is used as index to
> an array. Eclair reports it as violation while cppcheck does not.

