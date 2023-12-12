Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955080E0F3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:43:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652605.1018556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCroE-0001Bo-4I; Tue, 12 Dec 2023 01:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652605.1018556; Tue, 12 Dec 2023 01:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCroE-0001A9-1f; Tue, 12 Dec 2023 01:43:42 +0000
Received: by outflank-mailman (input) for mailman id 652605;
 Tue, 12 Dec 2023 01:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rCroC-00010i-FO
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:43:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de0b5628-988f-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 02:43:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C3E46CE1316;
 Tue, 12 Dec 2023 01:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E58FC433C8;
 Tue, 12 Dec 2023 01:43:34 +0000 (UTC)
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
X-Inumbo-ID: de0b5628-988f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702345415;
	bh=lmCRcoetHLoOnZ6lcya+2uVM9PbtmNs6EdtNAxxbeZ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o2UIClReODvMCcS0V8dhkzJA6HHCeiUwEOlemPW2T/g49ytYdG7lMUJR3CeUHXeCX
	 +Ab6M2874/0qb+SiBee2OFgFYDqGoCsH5ihRc8fwxOpfDliP+G38+Aqv70EEH075iw
	 11haPXbtlvZmpuuust4qIjYHvLqgij5Tzpj6aUo1KFhc3Sv3yglbPmyPU3wAhnQSR1
	 vxYjXaVFKnoEXfNm/cOtFX+/SWsDX5muFQQJIjWQ1MqYthkpcCqLoL0BTLnclsF/fa
	 oHtzUNsXSqw1ONiw/wtgovDlrK567ZA6WGzATaS87fyLct/Pl3kHAT0fzUR1HHEaqH
	 0JjlVyi/c5Gtw==
Date: Mon, 11 Dec 2023 17:43:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [XEN PATCH 4/7] xen/sched: address MISRA C:2012 Rule 2.1
In-Reply-To: <4006f1eb1977a89a57c5c02f003a2fefc06dfc42.1702283415.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312111743250.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702283415.git.nicola.vetrini@bugseng.com> <4006f1eb1977a89a57c5c02f003a2fefc06dfc42.1702283415.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> The break statement after the return statement is definitely unreachable
> and can be removed with no functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


