Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16F2BB0F4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 17:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32528.63576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg9eG-0003s8-H3; Fri, 20 Nov 2020 16:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32528.63576; Fri, 20 Nov 2020 16:52:36 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg9eG-0003rj-Dk; Fri, 20 Nov 2020 16:52:36 +0000
Received: by outflank-mailman (input) for mailman id 32528;
 Fri, 20 Nov 2020 16:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HtV5=E2=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
 id 1kg9eF-0003re-3M
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:52:35 +0000
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ed703fa-8215-404f-b5ab-093037792211;
 Fri, 20 Nov 2020 16:52:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u4so9468503qkk.10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 08:52:34 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
 by smtp.gmail.com with ESMTPSA id e6sm637759qtb.57.2020.11.20.08.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 08:52:32 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HtV5=E2=gmail.com=niveditas98@srs-us1.protection.inumbo.net>)
	id 1kg9eF-0003re-3M
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 16:52:35 +0000
X-Inumbo-ID: 4ed703fa-8215-404f-b5ab-093037792211
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4ed703fa-8215-404f-b5ab-093037792211;
	Fri, 20 Nov 2020 16:52:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id u4so9468503qkk.10
        for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zg6zl9X6YJy4l7Imn9Y9548H4d9zP5iPhLHw2KjR81I=;
        b=KYTAe23ZfGGHGNAGHpdYB3UZEe8FVCqTVCQmDrAaYYcXWlNJH5iP+0o9R7u9ErRxc0
         8UTAiYyqjuJRoip43grTiRnshuQTsLEGjeAode6kQusufUzWWcu9lNzMRs+SLByYtcJt
         0Wcjmpr74BVpkZ7AnCaZDkUrMmpDol1ArR8LZuK45lIOENZv3uEJjL7p8IaCD9UG2lZ4
         TUTGLuu7SrwiZDu1Qx52MZrXN+igJ3dVBgYr4hDrHGE87Gw1paV6aElVEbHB5/ViuBqz
         Yl+FlX9xWX5xpbQNHtKJyEL5OyJsEbcDzUKY73y3RrF04mSR9lIjLrVS7LrX4RSucrk6
         H1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=zg6zl9X6YJy4l7Imn9Y9548H4d9zP5iPhLHw2KjR81I=;
        b=Nk8Q8cQ2uxpIJ0r+uGEjCu7Ucr7W3TikoLTO/+FqTcIrwy2h8TTXS1QfIotiKOlGjM
         oJIWJIgQSB//VLgITl2k4NaX1fqryuRBfeDS9qax/nu48/TxPGoBlP4fvz6eiygWXS4h
         El3lzovgn1Q6zrifgdQc4U4QQxj+P9dnMNy50B1mpXD3CPemgO001QUWB9483x9POtVP
         Nqzkd1YqEnzwYbQqhAr9nwt6HSYOkYS1zyWAj0mMj8hVyz3cZjvPdcenowBIhx03ID1W
         mrb+1dibrxk/n7dRoWA5eOwnB3dzePQnbddFTuEvPOr9fuXfa9v27IWYIYyVLsJRcKC1
         CRgg==
X-Gm-Message-State: AOAM530PoovHvrmjSwnH42LfOa5tlwWInVbraWmm7WrpG423nOLJ8Fu4
	34YLhyKUzPoic9V4UF6arns=
X-Google-Smtp-Source: ABdhPJzQXE8TGuFjICs2cksSw1/J1lR2Og/k6v3kk7zVcez12b9Lg4Iso3TVZEA0vEu0e9mBnNPnxQ==
X-Received: by 2002:a37:aa93:: with SMTP id t141mr16890603qke.400.1605891153722;
        Fri, 20 Nov 2020 08:52:33 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id e6sm637759qtb.57.2020.11.20.08.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:52:32 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From: Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date: Fri, 20 Nov 2020 11:52:31 -0500
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, peterz@infradead.org,
	luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: Re: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit
 pvops cruft
Message-ID: <20201120165231.GA1074066@rani.riverdale.lan>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-9-jgross@suse.com>

On Fri, Nov 20, 2020 at 12:46:26PM +0100, Juergen Gross wrote:
> PVOP_VCALL4() is only used for Xen PV, while PVOP_CALL4() isn't used
> at all. Keep PVOP_CALL4() for 64 bits due to symmetry reasons.
> 
> This allows to remove the 32-bit definitions of those macros leading
> to a substantial simplification of the paravirt macros, as those were
> the only ones needing non-empty "pre" and "post" parameters.
> 
> PVOP_CALLEE2() and PVOP_VCALLEE2() are used nowhere, so remove them.
> 
> Another no longer needed case is special handling of return types
> larger than unsigned long. Replace that with a BUILD_BUG_ON().
> 
> DISABLE_INTERRUPTS() is used in 32-bit code only, so it can just be
> replaced by cli.
> 
> INTERRUPT_RETURN in 32-bit code can be replaced by iret.
> 
> GET_CR2_INTO_AX and ENABLE_INTERRUPTS are used nowhere, so they can
> be removed.

As a heads-up, GET_CR2_INTO_AX has been removed in tip:master already by
  31d854603305 ("x86/head/64: Remove unused GET_CR2_INTO() macro")

