Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A1301BFF
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jan 2021 14:11:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73673.132651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3fAs-0001C9-2H; Sun, 24 Jan 2021 13:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73673.132651; Sun, 24 Jan 2021 13:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3fAr-0001Bk-V0; Sun, 24 Jan 2021 13:11:25 +0000
Received: by outflank-mailman (input) for mailman id 73673;
 Sun, 24 Jan 2021 13:11:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d/C3=G3=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1l3fAq-0001BP-7d
 for xen-devel@lists.xenproject.org; Sun, 24 Jan 2021 13:11:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 612693da-a2ba-4af2-b5ed-af74157758d0;
 Sun, 24 Jan 2021 13:11:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B634522ADC;
 Sun, 24 Jan 2021 13:11:22 +0000 (UTC)
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
X-Inumbo-ID: 612693da-a2ba-4af2-b5ed-af74157758d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611493883;
	bh=eQ88PvupuioCNW7tkGGhAMMpSfJ8kHhHjNZWNJQTuKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AlFpSiGSBozQ1MSnPObM9Ji5GyJORj9/cG24SRXZQddU5koRJpijMM2GVd2W6rHdr
	 DogO261pf3bQq0RkFLVv3K7Nxvh2X89x5w0mVlg8KSCQ3TG4F4kTq81fQC7AWS2Gnc
	 VjVq5FuP3AVjQC0BT13xl2JonigKb4CKXu9lJ4jHFDzT+ky91muj093De5cZ8VuYgk
	 mVLR/uRFFeWf6cIXYKEAXVzT6ksxHrvLo8L2VmSSaGn8KToz2trRIgtlka2RckkXtW
	 9sLEYdvWUjFhJX2L1uXNddorp0drsQpZh3y74X0eIFlhhWl1XWccHXiB8FiUZd7g2s
	 6zKbaUAhve/4A==
Date: Sun, 24 Jan 2021 08:11:21 -0500
From: Sasha Levin <sashal@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH AUTOSEL 5.10 26/45] x86/xen: Fix xen_hvm_smp_init() when
 vector callback not available
Message-ID: <20210124131121.GG4035784@sasha-vm>
References: <20210120012602.769683-1-sashal@kernel.org>
 <20210120012602.769683-26-sashal@kernel.org>
 <86c0baa1-f8c5-2580-6ee9-efc7043c2bf5@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <86c0baa1-f8c5-2580-6ee9-efc7043c2bf5@oracle.com>

On Tue, Jan 19, 2021 at 08:35:04PM -0500, Boris Ostrovsky wrote:
>
>On 1/19/21 8:25 PM, Sasha Levin wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>>
>> [ Upstream commit 3d7746bea92530e8695258a3cf3ddec7a135edd6 ]
>
>
>Sasha, you will also want https://lore.kernel.org/lkml/20210115191123.27572-1-rdunlap@infradead.org/, it is sitting in Xen staging tree.

I'll grab it too, thanks!

-- 
Thanks,
Sasha

