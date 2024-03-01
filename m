Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671FC86D944
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 02:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687482.1071017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfs8G-0007rD-Kx; Fri, 01 Mar 2024 01:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687482.1071017; Fri, 01 Mar 2024 01:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfs8G-0007o0-IG; Fri, 01 Mar 2024 01:56:16 +0000
Received: by outflank-mailman (input) for mailman id 687482;
 Fri, 01 Mar 2024 01:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfs8E-0007nu-Oz
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 01:56:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df0fa8f3-d76e-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 02:56:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1E146164D;
 Fri,  1 Mar 2024 01:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA63C433F1;
 Fri,  1 Mar 2024 01:56:05 +0000 (UTC)
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
X-Inumbo-ID: df0fa8f3-d76e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709258167;
	bh=gbJ8Iv/7xTt/XUfyMnMXrC66ed30tdQaG4+PFSMncqk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DaY5G3CS3sdH8A3HE+6CrZ9f0SGF+c7lQMKSYUFzQPlhRpx3iZVI1Iq0o18I2jmv6
	 183ciPBEriZ2o/encAXsOKXINWmqgVhV4Tu06GfqVgRLedUO+ZWSipfk7ly2Jy0Ywy
	 nr1+RsF0z2QI8KT6jOnd77YidFkxoM4eMfflOtU4r8m6jMP6kQPSl9Qe8yYfPAruno
	 ERSacnRE/mp53WbDzKuaXBw2XPij9xb85LEANPdIvhJbLc8oK8bNW80hMHeDIqjzu0
	 fWrjGMIWVtHyXaRZUIVyrjKT00X1dhJHqsKBPYhSNNmtpegoJFTmSdeWhSKWNRW5CT
	 8Zqj0Mpg3XIzQ==
Date: Thu, 29 Feb 2024 17:56:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <stefano.stabellini@amd.com>
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, george.dunlap@citrix.com, julien@xen.org, 
    bertrannd.marquis@arm.com, roger.pau@citrix.com, 
    roberto.bagnara@bugseng.com, federico.serafini@bugseng.com, 
    Luca.Fancellu@arm.com, michal.orzel@amd.com
Subject: Re: [PATCH v2 1/3] docs/misra/rules.rst: add rule 16.6 and 20.12
In-Reply-To: <20240213223334.3693410-1-stefano.stabellini@amd.com>
Message-ID: <alpine.DEB.2.22.394.2402291754010.853156@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop> <20240213223334.3693410-1-stefano.stabellini@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This patch broke gitlab-ci. The jobs failing are the cppcheck jobs.

xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j80
No summary for rule 20.12
WARNING: Can't open /builds/xen-project/hardware/xen/xen/drivers/video/font_8x14.c: 'utf-8' codec can't decode byte 0x9f in position 7228: invalid start byte
WARNING: Can't open /builds/xen-project/hardware/xen/xen/drivers/video/font_8x16.c: 'utf-8' codec can't decode byte 0x80 in position 5436: invalid start byte
WARNING: Can't open /builds/xen-project/hardware/xen/xen/drivers/video/font_8x8.c: 'utf-8' codec can't decode byte 0x80 in position 4410: invalid start byte
ERROR: An error occured when running:
/builds/xen-project/hardware/xen/xen/tools/convert_misra_doc.py -i /builds/xen-project/hardware/xen/docs/misra/rules.rst -o /builds/xen-project/hardware/xen/xen/cppcheck-misra.txt -j /builds/xen-project/hardware/xen/xen/cppcheck-misra.json 

I'll look into it as soon as possible.


On Tue, 13 Feb 2024, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>  docs/misra/rules.rst | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 182331089d..c185366966 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -478,6 +478,12 @@ maintainers if you want to suggest a change.
>         adhere to Rule 16.2 would result in increased complexity and
>         maintenance difficulty, and could potentially introduce bugs. 
>  
> +   * - `Rule 16.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_06.c>`_
> +     - Required
> +     - Every switch statement shall have at least two switch-clauses
> +     - Single-clause switches are allowed when they do not involve a
> +       default label.
> +
>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>       - Required
>       - A switch-expression shall not have essentially Boolean type
> @@ -554,6 +560,13 @@ maintainers if you want to suggest a change.
>         evaluation
>       -
>  
> +   * - `Rule 20.12 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_12.c>`_
> +     - A macro parameter used as an operand to the # or ## operators,
> +       which is itself subject to further macro replacement, shall only
> +       be used as an operand to these operators
> +     - Required
> +     - Variadic macros are allowed to violate the rule.
> +
>     * - `Rule 20.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_20_13.c>`_
>       - Required
>       - A line whose first token is # shall be a valid preprocessing
> -- 
> 2.25.1
> 
> 

