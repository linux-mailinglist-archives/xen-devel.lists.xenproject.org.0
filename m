Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2DB98AF45
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 23:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807629.1219190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svO7u-0005Gg-Bu; Mon, 30 Sep 2024 21:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807629.1219190; Mon, 30 Sep 2024 21:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svO7u-0005Dv-80; Mon, 30 Sep 2024 21:40:18 +0000
Received: by outflank-mailman (input) for mailman id 807629;
 Mon, 30 Sep 2024 21:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svO7s-0005Dp-VU
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 21:40:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f054a1-7f74-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 23:40:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 076695C4A56;
 Mon, 30 Sep 2024 21:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D4DC4CEC7;
 Mon, 30 Sep 2024 21:40:10 +0000 (UTC)
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
X-Inumbo-ID: 92f054a1-7f74-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727732411;
	bh=f9hHoveTU9Vcm0J4ngyV6wxgzpH48MS+w2diGry+hJ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AFHWsQrUL5XAtqSQfgDO6RkjMe1rPT52ZjFxUR10rqkbRTlVroaVwcPBpO7T0wxG4
	 6odR51cpyuVcnsHyhPLgl02qjaY3672Lg7A87vpURDw5i/zdDFDlIOxReM+gjXk3nj
	 z7xqiwqWnsnjl3EmPBbqFPWxkYo5j8FXmIcakQjbJIrttEiKfSQyjw43LnfKURp2iE
	 gjjH8CdUDN6/jAvZdv/sVz/CO8T9BmsTPzhmvsEVlfxLEvsXwx4jMqXR4b6QXums12
	 0nC6WLUSxvXXzpFDtMQnzn5dFpSj5us6OMu3XaI3CqExaDaF7VQKQLjW6A8z8IDRic
	 dO33uIkCnXfuA==
Date: Mon, 30 Sep 2024 14:40:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v6] CODING_STYLE: Add a section on header guards
 naming conventions
In-Reply-To: <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409301430090.451631@ubuntu-linux-20-04-desktop>
References: <a68267c7465a9b0d2ed8f844a5e0145de50b0f3a.1725550985.git.alessandro.zucchelli@bugseng.com> <7357f6e8-2630-4027-b339-eedab9ae48c5@suse.com> <alpine.DEB.2.22.394.2409092149210.3672@ubuntu-linux-20-04-desktop> <44738f93-e99b-4f1c-9ed3-59dd2eac7aff@suse.com>
 <alpine.DEB.2.22.394.2409111808580.611587@ubuntu-linux-20-04-desktop> <24e33cc2-c9eb-4609-a074-51df81997aba@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Jan Beulich wrote:
> On 12.09.2024 03:13, Stefano Stabellini wrote:
> > Hi Jan, we have gone back and forth on this a few times, but neither
> > Alessandro nor I fully understand your perspective. To help streamline
> > the process and save time for everyone, I suggest you provide an example
> > of the rules written in the style you believe is appropriate. Once you
> > set the initial direction, Alessandro and I can continue and complete
> > the rest in that preferred style.
> 
> Header inclusion guards
> -----------------------
> 
> Unless otherwise specified, all header files should include proper
> guards to prevent multiple inclusions. The following naming conventions
> apply:
> 
> - Guard names are derived from directory path underneath xen/ and the
>   actual file name.  Path components are separated by double underscores.
>   Alphabetic characters are converted to upper case.  Non-alphanumeric
>   characters are replaced by single underscores.
> - Certain directory components are omitted, to keep identifier length
>   bounded:
>   - The top level include/,
>   - Any architecture's arch/<arch>/include/asm/ collapses to
>     ASM__<ARCH>__,
>   - Architecture-specific private files' arch/.
> 
> For example:
> 
> - Xen headers: XEN__<filename>_H
>   - include/xen/something.h -> XEN__SOMETHING_H
> 
> - asm-generic headers: ASM_GENERIC__<filename>_H
>   - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
> 
> - arch-specific headers: ASM__<architecture>__<subdir>__<filename>_H
>   - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
> 
> - Private headers: <dir>__<filename>_H
>   - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
>   - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
>   - common/something.h -> COMMON__SOMETHING_H
> 
> Note that this requires some discipline on the naming of future new
> sub-directories: There shouldn't be any random asm/ one anywhere, for

I would remove the word "random"


> example.  Nor should any new ports be named the same as top-level (within
> xen/) directories.  Which may in turn require some care if any new top-
> level directories were to be added.  Rule of thumb: Whenever a new sub-
> directory is added, check the rules for no collisions to result.

I guess you meant "no collisions among the results" ?

This is fine by me. With these two minor NITs addressed, I think you can
go ahead and commit the changes with my acked-by.

