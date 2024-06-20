Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FB90FAF5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 03:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744095.1151112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6bW-0006V8-16; Thu, 20 Jun 2024 01:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744095.1151112; Thu, 20 Jun 2024 01:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6bV-0006TH-Ur; Thu, 20 Jun 2024 01:28:45 +0000
Received: by outflank-mailman (input) for mailman id 744095;
 Thu, 20 Jun 2024 01:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sK6bV-0006TB-Em
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 01:28:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d7f88b8-2ea4-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 03:28:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44AEC60D3D;
 Thu, 20 Jun 2024 01:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FB3C2BBFC;
 Thu, 20 Jun 2024 01:28:39 +0000 (UTC)
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
X-Inumbo-ID: 6d7f88b8-2ea4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718846920;
	bh=0CKP7fRiUs61hYYKmr8CP6ra9KYZdf2+Na1Po2OCoFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pky8cFDPHKjPosyv4FtqaX95BwQqpSXKlaqHjMd3OWQUCTPQo6MbUnIshSMvPyAGY
	 mI/fHFx9zegoG6K1WushW0xNq3U8rTFmG1jw874pOqLVCtoZcxjlRAALr70G6AWrOz
	 W42nFlCdg6qrGJfIPK3QE2npNZZIhMpLljlnWTAy2j+5sjPD0n+X5NzHRwQ3p5zhBA
	 X38OH8xEbf9nbY2MDUnSLFmHrD6qRNd42TGrKFAsavpfBtTKEUDi0vkQb39V4y/Io4
	 AhjNQ0qRkaG1rNqrILRdA6dnA/BqQVDzk2v3v45k4VhrqZz382l4EHHrGoPV7rhakw
	 w56VEDk9PX2xw==
Date: Wed, 19 Jun 2024 18:28:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 4/5] automation/eclair_analysis: address remaining
 violations of MISRA C Rule 20.12
In-Reply-To: <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406191828311.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com> <ba7e17494f0bb167fe48f7fe0a69fabc1c3f5d1a.1717236930.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 1 Jun 2024, Nicola Vetrini wrote:
> The DEFINE macro in asm-offsets.c (for all architectures) still generates
> violations despite the file(s) being excluded from compliance, due to the
> fact that in its expansion it sometimes refers entities in non-excluded files.
> These corner cases are deviated by the configuration.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

