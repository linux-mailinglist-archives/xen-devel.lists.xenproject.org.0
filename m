Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD93FBCCF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 21:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175243.319339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKmnQ-0002Hs-NB; Mon, 30 Aug 2021 19:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175243.319339; Mon, 30 Aug 2021 19:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKmnQ-0002EQ-Iu; Mon, 30 Aug 2021 19:18:16 +0000
Received: by outflank-mailman (input) for mailman id 175243;
 Mon, 30 Aug 2021 19:18:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Rp=NV=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1mKmnO-0002EK-7n
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 19:18:14 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04f0eff2-09c7-11ec-aca8-12813bfff9fa;
 Mon, 30 Aug 2021 19:18:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C6C960238;
 Mon, 30 Aug 2021 19:18:12 +0000 (UTC)
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
X-Inumbo-ID: 04f0eff2-09c7-11ec-aca8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630351092;
	bh=IsJ1eyte8pqC29zpTwrvhMUn8oR4aDRp/oA5dY+oUu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZOIega9sXyUc6icmBUCBKQUmiGY76J1k5FwUpJ7qL+jkDIJQK7EOxN5Vk3J9v6oP5
	 wz/jCi0AU7ibfsGTGm6wTydszncqEcoxohUn0gawaYxaTYuHOJAvnYafTa5/+J64Q/
	 WySko4GOPnjhWjQPR9yUgpOtG4m+07KcDyxBQBVM2Z/akNPtc82J/F3zCadJCl70DE
	 7JKRrCeT6UkK//jdwTX/a2DcuBd01jK3GO36awGyaPMHzy3hQt7DuItHjRByWtd398
	 i5vxKJK7QZqHhr9De8FatGMFnAAqJODwy2ug3e9qdi57OWZrlymXu+aV1k6Zk01zwd
	 3AF2lKHmRpNIw==
Date: Mon, 30 Aug 2021 14:18:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio =?iso-8859-1?Q?Migu=E9ns?= Iglesias <lonyelon@gmail.com>
Cc: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
	sstabellini@kernel.org, bhelgaas@google.com,
	xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio =?iso-8859-1?Q?Migu=E9ns?= Iglesias <sergio@lony.xyz>
Subject: Re: [PATCH v2] xen/pcifront: Removed unnecessary __ref annotation
Message-ID: <20210830191810.GA13209@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210830201426.g2vaxh6chqnprual@archlap>

On Mon, Aug 30, 2021 at 10:14:26PM +0200, Sergio Miguéns Iglesias wrote:
> Thanks again for you answers!
> I am lerning a lot from your replys and I really appreciate it. Should I
> make a v3 patch and split that one into 2 different patches or would it
> be confusing?
> 
> I don't want to take more of your time with poor patches so I don't know
> if I should resend this one.

If it's already applied, it doesn't matter for this case.  But in this
situation I would generally post a v3 incorporating the feedback.  To
be respectful of reviewers' time, try to avoid posting more than one
or two revisions per week.  As long as you tag reposts appropriately
with v2, v3, etc (as you did), there's no confusion.

It's nice if you include a note about what changed between v1 and v2
in the cover letter or below the "---" line as was done here:

  https://lore.kernel.org/linux-pci/8f9a13ac-8ab1-15ac-06cb-c131b488a36f@siemens.com/

