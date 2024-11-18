Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85939D0D90
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 10:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839210.1255029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyTw-0003dS-Fm; Mon, 18 Nov 2024 09:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839210.1255029; Mon, 18 Nov 2024 09:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyTw-0003bg-CZ; Mon, 18 Nov 2024 09:55:44 +0000
Received: by outflank-mailman (input) for mailman id 839210;
 Mon, 18 Nov 2024 09:55:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xYpB=SN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tCyTu-0003b7-Gt
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 09:55:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 437c2793-a593-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 10:55:39 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B15284EE0764;
 Mon, 18 Nov 2024 10:55:37 +0100 (CET)
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
X-Inumbo-ID: 437c2793-a593-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQzN2MyNzkzLWE1OTMtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTIzNzM5LjIzMzQ3LCJzZW5kZXIiOiJuaWNvbGEudmV0cmluaUBidWdzZW5nLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731923737; bh=CLzxPMmWtxLHKsXSKAhPlDvW45eeESq7pAZIoUNMeNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s2iaKSu0Hffwy5i3MJMG6VhZCCbxuU878FFd4IlptdcLMljZ179ZhoMIazct/TwV2
	 Wuha8SG0sYs2tWHYgznA4h+5SKhOolXBtklUhezW1qVE+pHxY1k6RCSqtNEQ/Lahca
	 tS6W7xSnf6hqK+8dTV3emECm9/KGkyBsbB/4w5I/HO1SF/VE5HoOZvoPkSCOAvYwXf
	 GU3zuOoQG5d8sA1vt7VSXLKoptN6jy7EB0sx+ttylf4V4UlV2DjCHdDfuHKlQ3xRZZ
	 3vNhUDeTE3K7iDL9YAQUa08Bf2h3oNxsi4fqaMHKEaimkmevWLb1FoLbu8/8S5gIt6
	 ArLBWWe5p4A7g==
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 10:55:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 alessandro.zucchelli@bugseng.com, simone.ballarin@bugseng.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, julien@xen.org,
 roger.pau@citrix.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: increase identifiers length to 64
In-Reply-To: <782b24a0-a960-4667-a183-1e270841d2a8@suse.com>
References: <alpine.DEB.2.22.394.2411151617580.1160299@ubuntu-linux-20-04-desktop>
 <782b24a0-a960-4667-a183-1e270841d2a8@suse.com>
Message-ID: <eeaec89c4d4aa8abd738d8af7d068a19@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-18 09:58, Jan Beulich wrote:
> On 16.11.2024 01:23, Stefano Stabellini wrote:
>> Currently the identifiers characters limit is arbitrarily set to 40. 
>> It
>> causes a few violations as we have some identifiers longer than 40.
>> 
>> Increase the limit to another rather arbitrary limit of 64. Thanks to
>> this change, we remove a few violations, getting us one step closer to
>> marking Rules 5.2 and 5.4 as clean.
>> 
>> Also update the ECLAIR config that was actually set to 63 as character
>> limit.
> 
> What I don't really understand: With the Eclair config already having 
> said
> 63, how come we did see patches aiming at dealing with the limit being 
> just
> 40? IOW - how would those (supposed) issue even have been spotted.
> 

Hi Jan,

the issue was spotted by Andrew, and therefore we made the patches to 
align the configuration with the limits chosen by the project, which 
makes those violations appear. It is also possibile to do it the other 
way around (align the rst with the ECLAIR configuration), which spares 
the need for additional deviations.

In that case, I agree that 63 is better than 64.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

