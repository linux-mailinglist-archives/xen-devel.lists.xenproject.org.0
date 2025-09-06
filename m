Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4328B46790
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 02:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112897.1461035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugsC-0007Mn-RP; Sat, 06 Sep 2025 00:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112897.1461035; Sat, 06 Sep 2025 00:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugsC-0007Kw-O0; Sat, 06 Sep 2025 00:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1112897;
 Sat, 06 Sep 2025 00:33:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uugsB-0007Ki-0W
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 00:33:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uugsA-008C89-0B;
 Sat, 06 Sep 2025 00:33:42 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uugs9-000869-2v;
 Sat, 06 Sep 2025 00:33:42 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=GS34SKp1X4/mxc/EDFunZtSXF2DxGAoV21zbmVdse1o=; b=
	Reo4dC35fCPYF8965EdcY6GIHGsqPgasexwj2HE5EiXarEBome1x2jASqaIygQZ2AlEhwEFjn6XsI
	FOo3sEpgSaTFlqVYvmehnWrE+q8lPMDt+kL5lhi/UkLA3rWWHkpd4kfoJmZSRKaC8C6FM37l5rjK5
	rdVViWhbgsEVYFpMM=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 17:33:40 -0700
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v6 00/15] x86: introduce NS16550-compatible UART emulator
Message-ID: <aLuBZAupoQRGDS28@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905232715.440758-1-dmukhin@ford.com>

On Fri, Sep 05, 2025 at 04:26:59PM -0700, dmukhin@xen.org wrote:
> 
>   HVM
>   ---
>   Tested only boot of HVM linux guest with OVMF as the virtual firmware.
>   SeaBIOS as a virtual firmware is not tested.

Sorry, current series will enable the emulator for hwdom PVH only.
To enable the emulator for HVM, an extra change is neeed.

