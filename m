Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A3E778523
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 03:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582223.911855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHLc-0007gs-Oq; Fri, 11 Aug 2023 01:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582223.911855; Fri, 11 Aug 2023 01:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUHLc-0007fG-Ia; Fri, 11 Aug 2023 01:53:52 +0000
Received: by outflank-mailman (input) for mailman id 582223;
 Fri, 11 Aug 2023 01:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUHLa-0007fA-UC
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 01:53:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8a4e5af-37e9-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 03:53:47 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AF76651F7;
 Fri, 11 Aug 2023 01:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C25EC433C8;
 Fri, 11 Aug 2023 01:53:43 +0000 (UTC)
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
X-Inumbo-ID: e8a4e5af-37e9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691718825;
	bh=YRwtfgrELPlaPCQn8xHZDThKAaQOutw3UZTsU/0hUM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o/YVEjsWmFHbrUmi2lLmStduFykH76s51lFGh8kKtdoZnRx4F1DeJLPCEwra3m56N
	 bO1WGOvbmCRUhwHxno07wOBjlM+YWtI/8nAa7IKYgfK0OT8Nj3oy/KdbVfCHiV5QUg
	 2+v8asv4CKsSWVM5LAVHGWONTHvi1dHJZoAV5Im/CgLZEYYn/jiW+UNOdgITGH3jw4
	 40hcUqf4yBo+sCXzSHFVHD8wzpv/0YSFNvN7SQCoSRTuDN7GQpRDjl0nY3xbD5c5B0
	 eWVcbg5QHJw/4R96K+sVF+I4yM2U8YM6sW9mB3WfHhqrjVH67xc67gPMZjHSvd4uXC
	 rbVm2lvIHk8uQ==
Date: Thu, 10 Aug 2023 18:53:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 5/5] xen: Add clang-format configuration
In-Reply-To: <7219AAB4-7218-405F-8B4E-D9F3E54213EA@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308101852050.2127516@ubuntu-linux-20-04-desktop>
References: <20230728081144.4124309-1-luca.fancellu@arm.com> <20230728081144.4124309-6-luca.fancellu@arm.com> <3c5ae070-d6c2-070c-e482-e5135e2acef1@suse.com> <394778DB-2D5E-4C52-9DA1-F23A530534A8@arm.com> <9743391f-3b89-ddba-1c79-ddbb1d143437@suse.com>
 <7219AAB4-7218-405F-8B4E-D9F3E54213EA@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1322985965-1691718826=:2127516"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1322985965-1691718826=:2127516
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 10 Aug 2023, Luca Fancellu wrote:
> > On 10 Aug 2023, at 09:08, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 09.08.2023 18:18, Luca Fancellu wrote:
> >>> On 9 Aug 2023, at 16:48, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 28.07.2023 10:11, Luca Fancellu wrote:
> >>>> --- /dev/null
> >>>> +++ b/xen/.clang-format
> >>>> @@ -0,0 +1,693 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0-only
> >>>> +#
> >>>> +# clang-format configuration file. Intended for clang-format >= 15.
> >>>> +#
> >>>> +# For more information, see:
> >>>> +#
> >>>> +#   Documentation/process/clang-format.rst
> >>>> +#   https://clang.llvm.org/docs/ClangFormat.html
> >>>> +#   https://clang.llvm.org/docs/ClangFormatStyleOptions.html
> >>>> +#
> >>>> +---
> >>>> +
> >>>> +# [not specified]
> >>>> +# Align function parameter that goes into a new line, under the open bracket
> >>>> +# (supported in clang-format 3.8)
> >>>> +AlignAfterOpenBracket: Align
> >>> 
> >>> I'm not convinced this rule (assuming I'm getting it right) is
> >>> suitable in all cases, especially for functions with long names or
> >>> very many parameters.
> >> 
> >> Not sure I understand, I think this is the current behaviour in the codebase now.
> > 
> > My understanding is that the above aims at (only)
> > 
> > unsigned long function(unsigned long first_long_argument,
> >                       unsigned long second_long_argument);
> > 
> > when we also permit
> > 
> > unsigned long function(
> >    unsigned long first_long_argument,
> >    unsigned long second_long_argument);
> 
> Ohh ok now I see what you meant!
> 
> I did try this, ok sure it will format it as:
> 
> unsigned long function(unsigned long first_long_argument,
>                                      unsigned long second_long_argument);
> 
> Because it sees that it will fit the 80 chars.
> 
> At some point I think we need to overcome the uncertainty and chose a side, only
> from there we can benefit from an automatic checker and we can get rid of style issues (most of them).
> 
> Unfortunately most of the time we can’t say to the tool: we permit this style but also this style, 
> only one can be allowed and just few discrepancy might be deviated if properly justified (in-code comments).
> 
> I guess this is the only way to:
> 1) have a formalised coding style
> 2) have an automatic checker
> 3) unify the hypervisor codebase style, that will diverge (more than now) very quickly with the introduction
>     of new arch and features

I think it is understood that we'll have to make some style choices that
today are left open and also that we might have to introduce some style
conversions. The question is exactly which choices and which
conversions. We need to come up with a list, hopefully a short one.
--8323329-1322985965-1691718826=:2127516--

