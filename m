Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB3A99998
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965289.1355883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gxP-0008Ju-Pe; Wed, 23 Apr 2025 20:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965289.1355883; Wed, 23 Apr 2025 20:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7gxP-0008IV-MS; Wed, 23 Apr 2025 20:44:35 +0000
Received: by outflank-mailman (input) for mailman id 965289;
 Wed, 23 Apr 2025 20:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7gxP-0008IP-0E
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:44:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c27d9b81-2083-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:44:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6E2136844A;
 Wed, 23 Apr 2025 20:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA33C4CEEE;
 Wed, 23 Apr 2025 20:44:29 +0000 (UTC)
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
X-Inumbo-ID: c27d9b81-2083-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441071;
	bh=uMhUJfZYfVvJEJs7nUGIYRhcIGPxH2J/LW71cLWFygA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N5nzcChNII8dVY7nIGO4RQPQUYbyEZ+whE+8UUXXqxMjBUXl1SXRpt7+JFRFJmtRH
	 jVjNN7e/80xEAMR1DnB5b5/lZ0jh3EgCLT+GrwGgegKXY3sjFnSW7CS3UVyefdCHSE
	 0I4Y0Zey7/z3BPsMxwsT/BFKR8C8Eqc51Xx7+5FlKksRPBKpV8l0nCI/ek7M0UJ2D+
	 b66doaJVVmqG8hA+BHH1v4WHRhBBKoO61V9pr8/hab+orlFEB1hY0RwCNDWbRAIyu3
	 5mnwcZJuTmSNApEaKI7FTzYCKHJ42xOfgmFV+EWJl8UEf8yXgC6J1qvTSvKpy97txr
	 TZszWM408VQVw==
Date: Wed, 23 Apr 2025 13:44:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Victor Lira <victorm.lira@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v1] misra: add deviation for rules 21.1 and 21.2
In-Reply-To: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504231344200.785180@ubuntu-linux-20-04-desktop>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
> reserved identifier or reserved macro name") and R21.2 ("A reserved
> identifier or reserved macro name shall not be declared") violations
> are not problematic for Xen, as it does not use the C or POSIX
> libraries.
> 
> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
> __builtin_* functions from the compiler that are available so
> a deviation is formulated for all identifiers not starting with
> "__builtin_".
> 
> The missing text of a deviation for Rule 21.2 is added to
> docs/misra/deviations.rst.
> 
> To avoid regressions, tag both rules as clean and add them to the
> monitored set.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Victor Lira <victorm.lira@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

