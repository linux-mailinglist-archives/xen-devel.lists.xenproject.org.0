Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B7A7D54B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 09:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939241.1339419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gif-0003e0-J4; Mon, 07 Apr 2025 07:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939241.1339419; Mon, 07 Apr 2025 07:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1gif-0003as-FY; Mon, 07 Apr 2025 07:16:33 +0000
Received: by outflank-mailman (input) for mailman id 939241;
 Mon, 07 Apr 2025 07:16:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UKk=WZ=linuxfoundation.org=gregkh@srs-se1.protection.inumbo.net>)
 id 1u1gie-0003a3-Ay
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 07:16:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a1596bd-1380-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 09:16:31 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BBEB8A4854A;
 Mon,  7 Apr 2025 07:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4349C4CEDD;
 Mon,  7 Apr 2025 07:16:28 +0000 (UTC)
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
X-Inumbo-ID: 3a1596bd-1380-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744010189;
	bh=io0E4moshV/LDfFXrbcr6nh9X9BHIltAUho6j+zSBD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF1uQcIdJFjJQ/F9wG+SFD47ag5KHaMgOjZ0HEXb9BrGkNCdpVilAqzWEV8ktw0sI
	 QFvf+XSxEEt/f888ALbkLwdHIgWCw2Lq6mv+rA2H97vR0yHhOAWDX11zsqOIEJRuWS
	 GvG70MHxKJDsBlm4NeV+7+BhpIj9UpNpbfL/t+7w=
Date: Mon, 7 Apr 2025 09:14:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
Cc: jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 5.15.y 1/1] xen/swiotlb: relax alignment requirements
Message-ID: <2025040751-oversleep-sevenfold-b429@gregkh>
References: <20250407070235.121187-1-harshvardhan.j.jha@oracle.com>
 <20250407070235.121187-2-harshvardhan.j.jha@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407070235.121187-2-harshvardhan.j.jha@oracle.com>

On Mon, Apr 07, 2025 at 12:02:35AM -0700, Harshvardhan Jha wrote:
> [ Upstream commit 099606a7b2d53e99ce31af42894c1fc9d77c6db9]

Wrong git id :(

