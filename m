Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A09828E399
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 17:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6802.17921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj5C-00016X-GA; Wed, 14 Oct 2020 15:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6802.17921; Wed, 14 Oct 2020 15:52:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSj5C-000168-Cu; Wed, 14 Oct 2020 15:52:54 +0000
Received: by outflank-mailman (input) for mailman id 6802;
 Wed, 14 Oct 2020 15:52:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kSj5A-000163-PW
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:52:52 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eaafcb1-5579-408d-91e0-4802d2a56182;
 Wed, 14 Oct 2020 15:52:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y12so4485916wrp.6
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:52:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h16sm5868732wre.87.2020.10.14.08.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 08:52:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TKJF=DV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kSj5A-000163-PW
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 15:52:52 +0000
X-Inumbo-ID: 2eaafcb1-5579-408d-91e0-4802d2a56182
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2eaafcb1-5579-408d-91e0-4802d2a56182;
	Wed, 14 Oct 2020 15:52:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y12so4485916wrp.6
        for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2020 08:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9bsO4XTS8Ud4pEmBCazMT/i3UmJ173+XZwgvkVsK8QM=;
        b=fcrM+2EpdzKj61GTNYF/tqNtXFmE/KbktHCQielfSOom/qf1UuxrtG1SCruZ6DrFMB
         YuPv8QePXqcuzCPychTspZxE1cQojLejrcMYXmyn7GGfphTS401reSXIDlU/WB+TOD89
         zusfXbZXxmBENpZOzAgYg/qga4xkoDBb/zG406KbU7HuhQWu9Q95P+s+WMA+IKHXGzoO
         xduIjRrX8ipnQ4+fRpBtgsGymu98wT1zo/5sG07PgqUDpr8XnrPrz7BhmJv10e11zhUm
         V/2j0ywiVSl3x79YpzqTkulE6iZA8rNyXbUn4NWL/jOk62IIJJRfXJ29sLdguMV5upLL
         A1ug==
X-Gm-Message-State: AOAM533o/O1rKb6KBFheOHTVts0bH2Q/uglBCI2g9+nmAO/OWbCqlWtx
	sUQ5w18FzZZj/JuUbUC5lS0=
X-Google-Smtp-Source: ABdhPJxetcPUnvNy08/XzDzvnZ4VKNAsuFXTRz0s7wZtnUMj5IU7yl72Xhx8Iu85Eb9VDn6lKv8Lvg==
X-Received: by 2002:adf:e70a:: with SMTP id c10mr6124532wrm.425.1602690771200;
        Wed, 14 Oct 2020 08:52:51 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id h16sm5868732wre.87.2020.10.14.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:52:50 -0700 (PDT)
Date: Wed, 14 Oct 2020 15:52:49 +0000
From: Wei Liu <wl@xen.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
Message-ID: <20201014155249.42zw6vvoteom4iff@liuwe-devbox-debian-v2>
References: <20201014153150.83875-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014153150.83875-1-jandryuk@gmail.com>
User-Agent: NeoMutt/20180716

On Wed, Oct 14, 2020 at 11:31:50AM -0400, Jason Andryuk wrote:
> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
> kernel build CONFIG_PVH=y CONFIG_PV=n lacks the note.  In this case,
> virt_entry will be UNSET_ADDR, overwritten by the ELF header e_entry,
> and fail the check against the virt address range.
> 
> Change the code to only check virt_entry against the virtual address
> range if it was set upon entry to the function.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> 
> ---
> Maybe the overwriting of virt_entry could be removed, but I don't know
> if there would be unintended consequences where (old?) kernels don't
> have an elfnote, but do have an in-range e_entry?  The failing kernel I
> just looked at has an e_entry of 0x1000000.
> 
> Oh, it looks like Mini-OS doesn't set the entry ELFNOTE and relies on
> e_entry (of 0) to pass these checks.
> 

I have not looked into the patch, but please don't use mini-os as a source
for truth. ;-)

It is more likely than not we should fix mini-os instead of Xen and
Linux.

Wei.

