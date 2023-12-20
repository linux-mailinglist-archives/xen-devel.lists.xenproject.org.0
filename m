Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B455E81A6CE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 19:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658219.1027311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1Ev-0002zG-FV; Wed, 20 Dec 2023 18:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658219.1027311; Wed, 20 Dec 2023 18:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG1Ev-0002xO-BZ; Wed, 20 Dec 2023 18:24:17 +0000
Received: by outflank-mailman (input) for mailman id 658219;
 Wed, 20 Dec 2023 18:24:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrkk=H7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rG1Et-0002hx-GT
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 18:24:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9b29432-9f64-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 19:24:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 92170616E1;
 Wed, 20 Dec 2023 18:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5321C433C7;
 Wed, 20 Dec 2023 18:24:10 +0000 (UTC)
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
X-Inumbo-ID: f9b29432-9f64-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703096652;
	bh=jvMqksva70Wn2M8Xu3PBi1hCXSjBSwlNNO6oe/XHZoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lUKu6Ciz3AHJhweR2YVWA/MUAxauanjnI2GNh1oSvAMVTJWYw4Dxa3LXJtrT6YIs+
	 7mtcBP5+CTwgwwQeOCIFsK8rNIu9dIVDjl8+Kkf2ihqZj/tAn0I7Gu0agwBnfGimwL
	 uMNRj0y4JU0RzNPYsvwTFedZmLMToO9kM74WZV+psd0V9fOdP76VRAOvoMKt9nBQNU
	 zMwYJbrwvPVegwVXxlB3jYZ8w/uX/OopZPqIBFdKG+KUGk0H/KE/BRej5cih9Up0aj
	 h4I0N9g8T2irFPwNHyv+n8pYmZPx+p7yh2VGJeXIKU0DGG5V16wfkZhpIG3CWhB6jL
	 LQgSVh2ioC1pA==
Date: Wed, 20 Dec 2023 10:24:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: fix typo in deviation.
In-Reply-To: <d9ec973290747665905176939aef7749d5550734.1703068956.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312201005130.685950@ubuntu-linux-20-04-desktop>
References: <d9ec973290747665905176939aef7749d5550734.1703068956.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Nicola Vetrini wrote:
> Unwanted leading '+'-s cause the deviation not to work as expected,
> leading to wrong analysis counts.
> 
> Fixes: 11126964d82f ("automation/eclair_analysis: avoid violation of MISRA Rule 2.1")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


