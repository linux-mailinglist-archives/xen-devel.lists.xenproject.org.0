Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE64499E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 17:47:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455350.712796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2b5m-0004Ue-C8; Tue, 06 Dec 2022 16:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455350.712796; Tue, 06 Dec 2022 16:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2b5m-0004St-9I; Tue, 06 Dec 2022 16:46:50 +0000
Received: by outflank-mailman (input) for mailman id 455350;
 Tue, 06 Dec 2022 16:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZAw=4E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2b5k-0004Sm-Rl
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 16:46:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9305f2ad-7585-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 17:46:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36EEEB81ABD;
 Tue,  6 Dec 2022 16:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECF0C433C1;
 Tue,  6 Dec 2022 16:46:44 +0000 (UTC)
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
X-Inumbo-ID: 9305f2ad-7585-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670345206;
	bh=CgMeKbwfJFsPkgSGTN+eSNXuolIOiHJwmwmcbYgVXaM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mPCanATaYz5FjUwUATFFeCFZD8nYODg4hhrbG/36sSUH1J6+UoBm5Qnd2OHu+YrAQ
	 4UqCF8+qjy22I3Ag/WpFUTcmg5dUEZN+yIsQ1PK7sR31CEk8pSQymOxXrfe1DX/Yfx
	 H1TcfNogdMmpP4kugyZ6ps//TqZvzQh8ufZxdS9OMVHIJ99QDnOMPzXX/8e1reIB5J
	 sV95psRQsBT426lXsidqXBagAxq6R8YRfYQ0waZVlvnLooKFcpTnM06aKD+OWzypFj
	 xGZy2Vfk+ja4g6lv26v+N8r0x45UiaEsh83QC/Od3/HN+m5plPM4MiiG/nizs016Jr
	 OUU21rhvVHVfA==
Date: Tue, 6 Dec 2022 08:46:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Remove trigraphs from comments
In-Reply-To: <20221206144806.23139-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2212060846290.4039@ubuntu-linux-20-04-desktop>
References: <20221206144806.23139-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 6 Dec 2022, Michal Orzel wrote:
> MISRA C rule 4.2 states that trigraphs (sequences of two question marks
> followed by a specified third character [=/'()!<>-]) should not be used.
> This applies to both code and comments. Thankfully, we do not use them
> in the code, but still there are some comments where they are
> accidentally used. Fix it.
> 
> With regards to the comments and respective macros in pci_regs.h, these
> were inherited from Linux. Let's knowingly accept the divergence.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
>  - use (?!?) for arch-x86_64.h
>  - add a note in commit msg that pci_regs.h originated from Linux and we
>    knowingly accept the divergence
> ---
>  xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
>  xen/include/public/arch-x86_64.h       |  2 +-
>  xen/include/xen/pci_regs.h             | 12 ++++++------
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
> index 4732855c40ed..bb7af967ffee 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -228,7 +228,7 @@ struct x86_emulate_ops
>       * All functions:
>       *  @ctxt:  [IN ] Emulation context info as passed to the emulator.
>       * All memory-access functions:
> -     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_??).
> +     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_?).
>       *  @offset:[IN ] Offset within segment.
>       *  @p_data:[IN ] Pointer to i/o data buffer (length is @bytes)
>       * Read functions:
> diff --git a/xen/include/public/arch-x86_64.h b/xen/include/public/arch-x86_64.h
> index 5db52de69584..acf705f25e7a 100644
> --- a/xen/include/public/arch-x86_64.h
> +++ b/xen/include/public/arch-x86_64.h
> @@ -22,5 +22,5 @@
>   * A similar callback occurs if the segment selectors are invalid.
>   * failsafe_address is used as the value of eip.
>   *
> - * On x86_64, event_selector and failsafe_selector are ignored (???).
> + * On x86_64, event_selector and failsafe_selector are ignored (?!?).
>   */
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index ee8e82be36b4..a90aff1712ba 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -246,13 +246,13 @@
>  #define  PCI_PM_CTRL_STATE_MASK	0x0003	/* Current power state (D0 to D3) */
>  #define  PCI_PM_CTRL_NO_SOFT_RESET	0x0008	/* No reset for D3hot->D0 */
>  #define  PCI_PM_CTRL_PME_ENABLE	0x0100	/* PME pin enable */
> -#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (??) */
> -#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (??) */
> +#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (?) */
> +#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (?) */
>  #define  PCI_PM_CTRL_PME_STATUS	0x8000	/* PME pin status */
> -#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (??) */
> -#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (??) */
> -#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (??) */
> -#define PCI_PM_DATA_REGISTER	7	/* (??) */
> +#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (?) */
> +#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (?) */
> +#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (?) */
> +#define PCI_PM_DATA_REGISTER	7	/* (?) */
>  #define PCI_PM_SIZEOF		8
>  
>  /* AGP registers */
> -- 
> 2.25.1
> 

