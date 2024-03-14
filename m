Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045E87C568
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:57:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693567.1081852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku15-0000A8-LH; Thu, 14 Mar 2024 22:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693567.1081852; Thu, 14 Mar 2024 22:57:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rku15-00007q-Ib; Thu, 14 Mar 2024 22:57:39 +0000
Received: by outflank-mailman (input) for mailman id 693567;
 Thu, 14 Mar 2024 22:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rku14-00007k-MG
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:57:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400c3759-e256-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 23:57:37 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1EFF761501;
 Thu, 14 Mar 2024 22:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC2EC433F1;
 Thu, 14 Mar 2024 22:57:34 +0000 (UTC)
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
X-Inumbo-ID: 400c3759-e256-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457055;
	bh=0m1bNOAcoF6TX+7VGMPS2Eeh6UaoS2g1I1NnY0n4LOI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VLGS9eYFW35AK9inpfHUskn0HkjJ6x9PGo9p2DYunEapA4G2wP7UsJ7PCmmtIr1xW
	 oyxPVaf7JoAAXU2OyNi0DaKCArCRup4p4CQKX5lOEw+Bm3IffDs0xCekH8sg+9bOQc
	 yimLn2bjzkuP0qEkSCUFeH8AgR6GR13N48pU+Z0AoRKmpKUj4ri0KyuCVCavtQpUv7
	 HJnnQE+PZ/Fb8m8KRX0r/aYDC+H89Rpk79XJkt4RSeKYN28BDvujIOfI0d9DKAuL01
	 ZoSdoCvYge4e+MX94TaaDbo0ZH24pR0V1njny66akZRh0qdjno96Z1ZX8DDw29qdZa
	 WKy8WM1Un4QSg==
Date: Thu, 14 Mar 2024 15:57:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 02/16] misra: modify deviations for empty and
 generated headers
In-Reply-To: <8a491f641a8931b6ccc91fca1da6cdfa090c5b36.1710145041.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141556380.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <8a491f641a8931b6ccc91fca1da6cdfa090c5b36.1710145041.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> This patch modifies deviations for Directive 4.10:
> "Precautions shall be taken in order to prevent the contents of
> a header file being included more than once"
> 
> This patch avoids the file-based deviation for empty headers, and
> replaces it with a comment-based one using the format specified in
> docs/misra/safe.json.
> 
> Generated headers are not generally safe against multi-inclusions,
> whether a header is safe depends on the nature of the generated code
> in the header. For that reason, this patch drops the deviation for
> generated headers.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Nice!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

