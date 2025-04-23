Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ABCA99986
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:38:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965265.1355863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gqe-0005zH-UN; Wed, 23 Apr 2025 20:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965265.1355863; Wed, 23 Apr 2025 20:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gqe-0005xz-RY; Wed, 23 Apr 2025 20:37:36 +0000
Received: by outflank-mailman (input) for mailman id 965265;
 Wed, 23 Apr 2025 20:37:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7gqd-0005xt-KZ
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:37:35 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c81efb8c-2082-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:37:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7E62A4BC38;
 Wed, 23 Apr 2025 20:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455DDC4CEE2;
 Wed, 23 Apr 2025 20:37:30 +0000 (UTC)
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
X-Inumbo-ID: c81efb8c-2082-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745440651;
	bh=f5bt742FmkSStgygNozfe3oDF0tdCvDPdwEKB+XIvzI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qsbmt1dRWzDhS/VgtyCiwwJP6X9PbV/BnSSAFVPKlTWBhGs3D67e2MsQEtd1lpYZV
	 AKhQU2M2OW1kSHhRgmhWH5QZxWJ4j4Q0qlgaRZHekfZwNEMumQBBGQmi870PZ0MZDM
	 EmO+62Hutd/mhTJSrrBUP4EqTWxKkGESee3+1JOWo7AI6XME7Cwc+vPd1BSUFC23qK
	 /iasJHGQTE5MKc1NYig9LWQl+1h9cQashhniMVpsWxQcKeRBJQjtgIInPYAVAReNOA
	 L9aeyfbRbtEpY7GnuMyLKTfd2J/TXN6EY3ezgRMop4JohGno+WMlRI63v0s5Lo+vU9
	 SJiGAxZCwIBCQ==
Date: Wed, 23 Apr 2025 13:37:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <20989ef0-a906-4ad2-818b-e52dd49b868d@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504231337240.785180@ubuntu-linux-20-04-desktop>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com> <20989ef0-a906-4ad2-818b-e52dd49b868d@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Jan Beulich wrote:
> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
> > From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > 
> > MISRA C Rules 21.1 ("#define and #undef shall not be used on a
> > reserved identifier or reserved macro name") and R21.2 ("A reserved
> > identifier or reserved macro name shall not be declared") violations
> > are not problematic for Xen, as it does not use the C or POSIX
> > libraries.
> 
> In the course of all the Misra discussions it was pointed out more than
> once that it's not just the titles which matter, but also the
> "Amplification" text. While the latter two of the three bullet points
> applying to both rules clearly are library-centric, the first one isn't.
> In that light it's entirely unclear to me how ...
> 
> > Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
> > __builtin_* functions from the compiler that are available so
> > a deviation is formulated for all identifiers not starting with
> > "__builtin_".
> > 
> > The missing text of a deviation for Rule 21.2 is added to
> > docs/misra/deviations.rst.
> > 
> > To avoid regressions, tag both rules as clean and add them to the
> > monitored set.
> 
> ... our code base could be anywhere near clean towards these two rules.


Given the section these two rules belong to "Standard libraries" and
given the rest of the rule description, it is clear to me that the
conflicts and undefined behaviors the two rules are trying to prevent
are conflicts with C or POSIX libraries. Nicola is the original author
of the patch and he has more experience with MISRA and I would trust
his interpretation.

