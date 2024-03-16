Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2224587D784
	for <lists+xen-devel@lfdr.de>; Sat, 16 Mar 2024 01:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694103.1082977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHdX-0005pY-Jn; Sat, 16 Mar 2024 00:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694103.1082977; Sat, 16 Mar 2024 00:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlHdX-0005n3-G9; Sat, 16 Mar 2024 00:10:55 +0000
Received: by outflank-mailman (input) for mailman id 694103;
 Sat, 16 Mar 2024 00:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e312=KW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rlHdW-0005mx-Go
 for xen-devel@lists.xenproject.org; Sat, 16 Mar 2024 00:10:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a60fa1ba-e329-11ee-a1ee-f123f15fe8a2;
 Sat, 16 Mar 2024 01:10:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1410D61820;
 Sat, 16 Mar 2024 00:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81744C433F1;
 Sat, 16 Mar 2024 00:10:49 +0000 (UTC)
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
X-Inumbo-ID: a60fa1ba-e329-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710547850;
	bh=RtG317NAqSuHheUaXBnD3mY4qWHQOZuAld0nDefX+34=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J4qumpUyykUY3hD+KR0N4glMKFWP389iV3oWYP+hzs/HMQ/UF98DzfTX+tSpZZ4Ia
	 KCEGP5rKXQHsE4lLlsR90yY83P3dZ+wSuf6kjUD231WQW6Ur7QgQ5TGfuSPsHrV2cg
	 qKKPbOy+3I+UO5KyzBNoSFgsXGvAG79ba1hPpxL8HZWxotaYSkp15XdKsDHvlN1eud
	 ZlEGkYtOO26oBHBb9kRI0ooa67R0xPWkN9Q0ZOJ/YKRLvPvzS1RooH3NhDBS1PW0vB
	 ro0lcA3AsklzQWaECTFg88j/3mKeibwMVhxrAH235XamYq5GQfTyRxnrPc0+3bpiBT
	 ciXEKDffV9muA==
Date: Fri, 15 Mar 2024 17:10:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2] automation/eclair: allow parameter name
 "unused"
In-Reply-To: <de0938a9f68c21dfd9b31606329b1937dd263ab5.1710499973.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403151710390.853156@ubuntu-linux-20-04-desktop>
References: <de0938a9f68c21dfd9b31606329b1937dd263ab5.1710499973.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Mar 2024, Federico Serafini wrote:
> Update ECLAIR configuration of MISRA C:2012 Rule 8.3 to deviate
> violations involving parameter name "unused" (with an optional
> numeric suffix): it makes explicit the intention of not using such
> parameter within the function.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


