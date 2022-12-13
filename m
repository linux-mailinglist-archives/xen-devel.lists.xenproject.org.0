Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AAE64BE4D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 22:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461181.719233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cit-0000B7-6p; Tue, 13 Dec 2022 21:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461181.719233; Tue, 13 Dec 2022 21:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Cit-00008M-3h; Tue, 13 Dec 2022 21:21:59 +0000
Received: by outflank-mailman (input) for mailman id 461181;
 Tue, 13 Dec 2022 21:21:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Cir-00008D-Sn
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 21:21:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Cir-0003kM-HU; Tue, 13 Dec 2022 21:21:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Cir-0000eR-BJ; Tue, 13 Dec 2022 21:21:57 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vOMrTmeZv3ZRdo9Oz5VUpINoTRnGuKc0dkoYbXSV37w=; b=P/kGTC22yEtcADioI9BSHTh7hu
	iPY7+bwyFHiEpwpqf8kJE9JnkiiWCPxIWnxvidBbhVbLFNAT/oQYlP5BTu6Gn/dEx47hT+taJXdEz
	8MjegzZeQMjpxdNVIqu/635zBvTFD2PQ4woRR955AcjHAPntAoAfDCfHLq1CuIazw+wQ=;
Message-ID: <12115a68-6210-6af0-b1a0-e8596b12fc89@xen.org>
Date: Tue, 13 Dec 2022 21:21:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v5 08/11] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n>
 for AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
 <20221205132637.26775-9-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221205132637.26775-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 05/12/2022 13:26, Ayan Kumar Halder wrote:
> Adapt save_aprn_regs()/restore_aprn_regs() for AArch32.
> 
> For which we have defined the following registers:-
> 1. Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
> 2. Interrupt Controller Hyp Active Priorities Group1 Registers 0-3
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

