Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86270647D19
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 05:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457598.715553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3VPF-0006zU-0X; Fri, 09 Dec 2022 04:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457598.715553; Fri, 09 Dec 2022 04:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3VPE-0006wI-UA; Fri, 09 Dec 2022 04:54:40 +0000
Received: by outflank-mailman (input) for mailman id 457598;
 Fri, 09 Dec 2022 04:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9WF=4H=kernel.org=saeed@srs-se1.protection.inumbo.net>)
 id 1p3VPE-0006wC-6y
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 04:54:40 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 946cf3d2-777d-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 05:54:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7EC3ECE2898;
 Fri,  9 Dec 2022 04:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4DDC433D2;
 Fri,  9 Dec 2022 04:54:33 +0000 (UTC)
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
X-Inumbo-ID: 946cf3d2-777d-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670561673;
	bh=rSB5y5gfDM3Ow36b0u0/C60y2e6oDZ7NLUrrP88Fvw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpi3f9V9c4bdztR9nKSHWOL7zKOIZAXYwTHtMpKKT9o3KR5YV5pYfEzxZ1bRPWZiW
	 xG78z0gPVMFgG++Kxgi1Ic7IbwUHNPufvT88q+LIS/fiF4tQi+Mn3HEGsLR7XQxJj6
	 edvJXJNDzp6fmSWq3dRUk/yHn9RBvPdqO1b3V4B5E7AqN/TGfGodFWR5wnZDTkdsen
	 SXJefYARubHiyglRodLXiqJNo0MACwaBFAxYzh1oE0kCNifGP0qtNwQM9fVFFD1puR
	 3mttmyLek4N8hrvlRrgkAGDWO0EPcWZx+09tXEBNDCHEv1TO+gYCm6a5V3M6Drngir
	 EseWRJJroxj7A==
Date: Thu, 8 Dec 2022 20:54:32 -0800
From: Saeed Mahameed <saeed@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: wei.liu@kernel.org, paul@xen.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, xen-devel@lists.xenproject.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] xen-netback: Remove set but unused variable 'pending_idx'
Message-ID: <Y5K/iE9oa3PIrsQx@x130>
References: <20221209034036.37280-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221209034036.37280-1-jiapeng.chong@linux.alibaba.com>

On 09 Dec 11:40, Jiapeng Chong wrote:
>Variable pending_idx is not effectively used in the function, so delete
>it.
>
>drivers/net/xen-netback/netback.c:886:7: warning: variable ‘pending_idx’ set but not used.
>
>Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3399
>Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Reviewed-by: Saeed Mahameed <saeed@kernel.org>

Please mark your patch clearly with [PATCH net-next] or 
[PATCH net] if it's a bug fix. 

Thanks for the patch.


