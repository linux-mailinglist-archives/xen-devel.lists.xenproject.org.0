Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EACCB456D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 01:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183427.1506131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUE2-0003kt-NB; Thu, 11 Dec 2025 00:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183427.1506131; Thu, 11 Dec 2025 00:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTUE2-0003jS-KC; Thu, 11 Dec 2025 00:08:06 +0000
Received: by outflank-mailman (input) for mailman id 1183427;
 Thu, 11 Dec 2025 00:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3Jk=6R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vTUE1-0003hz-6k
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 00:08:05 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 760ee691-d625-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 01:08:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 550FF442E5;
 Thu, 11 Dec 2025 00:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2113CC4CEF1;
 Thu, 11 Dec 2025 00:08:01 +0000 (UTC)
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
X-Inumbo-ID: 760ee691-d625-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765411682;
	bh=uMnkKjf6HQAwqb5npPnDhzCnH+31bLdtzF+AcdjTLgQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hLnG5gQWZXTMj1yRub8/T2tbnaZcjPxaAZlgmxxTX/+zcXrKq5ZPcht8HpDjPs57C
	 XAjxIzJNAshnIHGp6wTdaYVrWX900IudS16uxUIWWdTm60psLChJQ+YVm7+boR37nJ
	 j1XA+3gWr4TQdY+wGjLAah57N5xDlnFbhYHJifcotWEUvPiCPmbWcfgeWEDIhWctmh
	 IjtrOPTl3GacrehUYG8VxQOd4JReXA5HYXVNFCTmoKwvnkDMsMOrYJL2wEydJjpdp+
	 CkhDiPManGI6MPKPzfsf4kUXJfHm514ojKPf9Xy39v5kQG61FLO6swHny9PzsupGsl
	 DR9bpex1C4pZQ==
Date: Wed, 10 Dec 2025 16:07:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
In-Reply-To: <a48dece01f70c18be88692e10120599a@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2512101607540.19429@ubuntu-linux-20-04-desktop>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com> <20251210183019.2241560-6-andrew.cooper3@citrix.com> <a48dece01f70c18be88692e10120599a@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Dec 2025, Nicola Vetrini wrote:
> On 2025-12-10 19:30, Andrew Cooper wrote:
> > With the wider testing, some more violations have been spotted.  This
> > addresses violations of Rule 20.7 which requires macro parameters to be
> > bracketed.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

