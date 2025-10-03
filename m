Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33294BB65B1
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 11:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136451.1473015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4byE-0008O5-4y; Fri, 03 Oct 2025 09:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136451.1473015; Fri, 03 Oct 2025 09:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4byE-0008Ky-1k; Fri, 03 Oct 2025 09:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1136451;
 Fri, 03 Oct 2025 09:20:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1v4byC-0008Kd-Ko
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 09:20:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v4byC-006fZ7-0d;
 Fri, 03 Oct 2025 09:20:56 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1v4byC-00Ekdg-0N;
 Fri, 03 Oct 2025 09:20:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=NuLjPqUgH7tZOHWqjbk/eU60+8LQV+QxtY3mhBm7zDc=; b=sg5GnB6tb9alsxahahL/evH7F+
	bBEPU8yE0CulrPH/5Q41hh1nxIPbriAhVMMMJTDJECmhi6YBFm9Mp3csWTDx8uZ9gk3sMfPDMK3S2
	tTNUMiBMc4+VAXrG2YuEuzvixacFwPkBd9cAA2EYibW2ucBWitegG5MvQTssUVJxRK4M=;
Date: Fri, 3 Oct 2025 11:20:53 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add myself as an AMD SVM & IOMMU reviewer
Message-ID: <aN-VdWG3VUoDhSF5@l14>
References: <20251002234311.10926-1-jason.andryuk@amd.com>
 <aN-EuzQ2AZ1oMN0K@Mac.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN-EuzQ2AZ1oMN0K@Mac.lan>

On Fri, Oct 03, 2025 at 10:09:31AM +0200, Roger Pau Monné wrote:
> On Thu, Oct 02, 2025 at 07:42:38PM -0400, Jason Andryuk wrote:
> > @@ -601,7 +618,8 @@ M:	Roger Pau Monné <roger.pau@citrix.com>
> >  S:	Supported
> >  L:	xen-devel@lists.xenproject.org
> >  F:	xen/arch/x86/
> > -F:	xen/drivers/passthrough/amd/
> > +X:	xen/arch/x86/hvm/svm/
> > +X:	xen/arch/x86/cpu/vpmu_amd.c
> 
> Would it be possible to not exclude the SVM related code here, and
> avoid having to duplicate the x86 maintainers on the AMD entries?
> 
> Or the parsing of the file doesn't deal with multiple entries possibly
> covering the same files?

./get_maintainer.pl can deal with a file been covered by multiple
entries, there's multiple example of that already, (e.g. many subsection
are also covered by TOOLSTACK).

The exclusion is likely unnecessary, and ./get_maintainer.pl will just
get the information (email, ...) from every sections that a file match.
But the duplication is necessary due to the "The meaning of nesting"
described in the MAINTAINERS file.

Cheers,

-- 
Anthony PERARD

