Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A9648AE0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 23:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458323.716233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3m8i-0007G2-4u; Fri, 09 Dec 2022 22:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458323.716233; Fri, 09 Dec 2022 22:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3m8i-0007DY-23; Fri, 09 Dec 2022 22:46:44 +0000
Received: by outflank-mailman (input) for mailman id 458323;
 Fri, 09 Dec 2022 22:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAZn=4H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3m8h-0007DS-9O
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 22:46:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 589e36cc-7813-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 23:46:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B6326236E;
 Fri,  9 Dec 2022 22:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055EBC433F0;
 Fri,  9 Dec 2022 22:46:37 +0000 (UTC)
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
X-Inumbo-ID: 589e36cc-7813-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670625999;
	bh=BwJLB5v+O2/TDwJ9UKKGFRy5zPU5E7zS7psyQyTril4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hab0KQF787raPgtLQiqgaHLiBA3VAO+/yb3+voWoStKaeS1glvEYxOvV2Hv1RBOnp
	 3SDEcNvyp6eGcEocUb+fdjdbqJJQZP2eW2OLd3Ad3/7piTEx3QnDzXX7yWhM51UI9b
	 iyvThFPSE4DTrrd/2SKKXh+tJLbRXW1w2g+19q/oC4ca14sPHxJMsXmlT6yZ+ex8lJ
	 XBqgKKEw0HgSf8qFdkQxrkf8RWPW7YIoy1ot21Ah6NFgghtby1FiZror8IaafOGN0W
	 8JbCgJXaiXgrHZgFLvzBnDhOM+cljFbjcMt6x0RG4q4TiYNr7h3/uKQDEFIhjRTZhB
	 T2DDi0scRjI0Q==
Date: Fri, 9 Dec 2022 14:46:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>, roberto.bagnara@bugseng.com
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, julien@xen.org, roger.pau@citrix.com, 
    burzalodowa@gmail.com, michal.orzel@amd.com
Subject: Re: MISRA C Rule 20.7 disambiguation
In-Reply-To: <eb35b7bf-3a49-4faa-3ea6-a6076f032fd6@suse.com>
Message-ID: <alpine.DEB.2.22.394.2212091427180.3075842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2212081619310.3075842@ubuntu-linux-20-04-desktop> <eb35b7bf-3a49-4faa-3ea6-a6076f032fd6@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Dec 2022, Jan Beulich wrote:
> On 09.12.2022 01:45, Stefano Stabellini wrote:
> > This patch is to start a discussion in regard to rule 20.7 and its
> > interpretation. During the last MISRA C call we discussed that "our"> interpretation of the rule means that the following two cases don't need
> > extra parenthesis:
> > 
> > #define M(a, b) func(a, b)
> > #define M(a, b) (a) = b
> 
> I'm puzzled by the latter.

Sorry that was my mistake, I misread one of the examples.


> Iirc there was discussion on whether the LHS of an assignment needs
> parentheses, but I don't think there was any question about the RHS
> wanting them, irrespective of the facts that only comma expressions
> have lower precedence than assignment ones and that evaluation goes
> right to left anyway.
> 
> One aspect speaking for parentheses even on the LHS is that an expression
> (rather than an lvalue) passed as macro argument then uniformly becomes
> invalid, i.e. not just
> 
> 	M(x + y, z)
> 
> would be rejected by the compiler, but also
> 
> 	M(x = y, z)

So actually it should be:

#define M(a, b) (a) = (b)


> > Let's take another example:
> > 
> > #define xzalloc_flex_struct(type, field, nr) \
> >     ((type *)_xzalloc(offsetof(type, field[nr]), __alignof__(type)))
> > 
> > "type" is the same as last time. There are 2 other interesting macro
> > parameters here: nr and field.
> > 
> > nr could result in an expression, but I don't think it needs
> > parenthesis because it is between []? However, we know we have a clear
> > exception for the "," operator. We don't have a clear exception for the
> > [] operator. Do we need (nr)?
> 
> The question of whether parentheses are needed clearly need to be based
> on whether without parentheses anything that looks sensible on the surface
> can be mistaken for other than what was meant. I think [] simply are
> another form of parenthesization, even if these are commonly called square
> bracket (not parentheses). For this to be mistaken, a macro argument would
> need to be passed which first has a ] and then a [. This clearly doesn't
> look sensible even when just very briefly looking at it. Plus the same
> issue would exist with parentheses: You could also undermine the proper
> use of parentheses in the macro by passing a macro argument which first
> has ) and then (. IOW - adding parentheses here adds no value, and hence
> is merely clutter.
> 
> > field could result in an expression, so I think it needs parenthesis.
> 
> No, field (and intentionally named that way) is a struct member indicator.
> Neither p->(field) nor s.(field) are syntactically valid. There simply
> cannot be parentheses here, so the same conclusion as near the top applies.
>
> > Just to be clear, I'll list all the possible options below.
> > 
> > a) no changes needed, xzalloc_flex_struct is good as is
> 
> This is it, and not surprisingly: This construct was introduced not that
> long ago, when we already paid close attention to parenthesization needs.


Let's see if we can configure a MISRA C checking tool with the behavior
we would like, i.e. xzalloc_flex_struct not a violation. (I am using
xzalloc_flex_struct as an example.)

cppcheck marks xzalloc_flex_struct as violation but it is not surprising
as we know cppcheck is a bit rudimental. It might be better to disable
scanning for 20.7 in cppcheck.

Eclair marks it as a violation too. Eclair thinks "nr" needs
parenthesis. Roberto, we have already discussed how the comma operator
"," being the lower precedence doesn't require extra parenthesis.
Roberto, what's your take on the [] square brakets?

