Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C65AA575
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 04:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397167.637648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTw5c-0008Vg-0Z; Fri, 02 Sep 2022 02:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397167.637648; Fri, 02 Sep 2022 02:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTw5b-0008TF-U2; Fri, 02 Sep 2022 02:07:23 +0000
Received: by outflank-mailman (input) for mailman id 397167;
 Fri, 02 Sep 2022 02:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTw5a-0008T7-J6
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 02:07:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa687ac7-2a63-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 04:07:21 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38192B82939;
 Fri,  2 Sep 2022 02:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04842C433C1;
 Fri,  2 Sep 2022 02:07:16 +0000 (UTC)
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
X-Inumbo-ID: fa687ac7-2a63-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662084438;
	bh=nkD7zrNHjQcljVJuYP4L4MyVaV7hhlag7R0EKkQvP7E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VBpRU7AS0QhnvNwiofpB8SE4L7Xc+XCGXUjfKjUu1oM6nf6o/8KR7gw2yEhjLLtPY
	 vJGY9H/Z1EkI/RrpCfVU06UkRcpgkym3Wf3+BvpkbqN/voPUi1cInQ7wtBL414ZBaB
	 cFbixxyQ7BOg6DL9mIj1NmQlotdUMIpYasF4lBZWgPyaUuGL72lQbialBIdnDgLZgK
	 07GN/NBzQe957mehU9q3W8Zxlo+z0QQ7dGMbZCrvW5/ElLGhMHzhh8is8e+MADi0xM
	 PfjffLpx6bGutoPBr/64Fokn1uhm1rZeyO1uEZLR1ZvxhDAy0haS6VFuMcvb2g8IuO
	 CJFCpqrVZ+MkQ==
Date: Thu, 1 Sep 2022 19:07:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
In-Reply-To: <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop> <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com> <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Bertrand Marquis wrote:
> Hi Xenia,
> 
> > On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
> > 
> > 
> > On 9/1/22 01:35, Stefano Stabellini wrote:
> >> Patches 1, 4, and 6 are already committed. I plan to commit patches 2, 3
> >> and 5 in the next couple of days.
> >> Patch 7 needs further discussions and it is best addressed during the
> >> next MISRA C sync-up.
> > 
> > I would like to share here, before the next MISRA C sync, my understandings that will hopefully resolve a wrong impression of mine, that I may have spread around, regarding this rule.
> > There was a misunderstanding regarding the rule 20.7 from my part and I think that Jan is absolutely right that parenthesizing macro parameters used as function arguments is not required by the rule.
> > 
> > The rule 20.7 states "Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses" and in the rationale of the rule states "If a macro parameter is not being used as an expression then the parentheses are not necessary because no operators are involved.".
> > 
> > Initially, based on the title, my understanding was that it requires for the expression resulting from the expansion of the macro to be enclosed in parentheses. Then, based on the rule explanation and the examples given,  my understanding was that it requires the macro parameters that are used as expressions to be enclosed in parentheses.
> > But, after re-thinking about it, the most probable and what makes more sense, is that it require parentheses around the macro parameters that are part of an expression and not around those that are used as expressions.
> > 
> > Therefore, macro parameters being used as function arguments are not required to be enclosed in parentheses, because the function arguments are part of an expression list, not of an expression (comma is evaluated as separator, not as operator).
> > While, macro parameters used as rhs and lhs expressions of the assignment operator are required to be enclosed in parentheses because they are part of an assignment expression.
> > 
> > I verified that the violation reported by cppcheck is not due to missing parentheses around the function argument (though still I have not understood the origin of the warning). Also, Eclair does not report it.
> > 
> > Hence, it was a misunderstanding of mine and there is no inconsistency, with respect to this rule, in adding parentheses around macro parameters used as rhs of assignments. The rule does not require adding parentheses around macro parameters used as function arguments and neither cppcheck nor Eclair report violation for missing parentheses around macro parameters used as function arguments.
> 
> 
> Thanks a lot for the detailed explanation :-)
> 
> What you say does make sense and I agree with your analysis here, only protect when part of an expression and not use as a subsequent parameter (for a function or an other macro).

Yeah I also agree with your analysis, and many thanks for
double-checking the cppcheck and Eclair's reports.

