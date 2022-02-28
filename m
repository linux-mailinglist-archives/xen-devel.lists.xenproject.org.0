Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E34C658F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 10:20:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280248.478116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcC9-0002Tl-1P; Mon, 28 Feb 2022 09:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280248.478116; Mon, 28 Feb 2022 09:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcC8-0002Qb-Uh; Mon, 28 Feb 2022 09:19:52 +0000
Received: by outflank-mailman (input) for mailman id 280248;
 Mon, 28 Feb 2022 09:19:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcC7-0002QV-Px
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 09:19:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcC2-0001R0-Jv; Mon, 28 Feb 2022 09:19:46 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcC2-0000JB-Cw; Mon, 28 Feb 2022 09:19:46 +0000
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
	bh=voGZEd5Eve9O3Bg1Sl0I79UAX6SsPDaF/oSzL2dpFQk=; b=T/O1XNumGBPHw/dKcdYQw1fTvx
	TA1IDlQuG6oODT8znCN34jW1oj1sm7Tks62vIIXToVkciZFci8IR69IFd8b80apIBtvojC4MNYGkD
	v6mMTShiOdxt2TWr/4sOGxHHgfcaVPKStFtAXMi0LxrYdVcW/4G7aNFRC2iKxE+h9AsU=;
Message-ID: <16bef21e-42b3-c271-81ab-1d87453a0fdb@xen.org>
Date: Mon, 28 Feb 2022 09:19:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 1/3] xen/arm: Add i.MX lpuart driver
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, xen-devel@lists.xenproject.org, van.freenix@gmail.com,
 Peng Fan <peng.fan@nxp.com>
References: <20220228010711.11566-1-peng.fan@oss.nxp.com>
 <20220228010711.11566-2-peng.fan@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220228010711.11566-2-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peng,

On 28/02/2022 01:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>

Can you give me a link to the specification and/or a similar driver in 
Linux?

This would help to review this patch.

Cheers,

-- 
Julien Grall

