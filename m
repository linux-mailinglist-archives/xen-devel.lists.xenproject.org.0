Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8885F9318E0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759159.1168820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOzw-0002Mo-Hk; Mon, 15 Jul 2024 16:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759159.1168820; Mon, 15 Jul 2024 16:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOzw-0002LJ-F2; Mon, 15 Jul 2024 16:56:24 +0000
Received: by outflank-mailman (input) for mailman id 759159;
 Mon, 15 Jul 2024 16:56:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sTOzu-0002Ia-I7
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:56:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTOzu-0002IC-AV; Mon, 15 Jul 2024 16:56:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sTOzu-0007ry-4R; Mon, 15 Jul 2024 16:56:22 +0000
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
	bh=kaT9FQZRbqsKKamuTNhRvaOwqygl1r+HPoAkGyDKqaU=; b=p2SZ4xy20mC3m7lP2P+OgM6Hym
	wksrtF3F2sm4by7qJG3KOIXUCiiZ1zMYSNNJVfipBLqDC0b2BslOyPdnUv0yM10FB2zlD+jQ0Tks8
	dMsEzzJGYwxLWMHrFDDTIknFpesKFOay8NGKG028594TBVgTvzCYYFx5G7c3siDXWLs4=;
Message-ID: <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
Date: Mon, 15 Jul 2024 17:56:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/07/2024 16:50, Andrew Cooper wrote:
> An earlier part of the checklist states:
> 
>    * change xen-unstable README. The banner (generated using figlet) should say:
>        - "Xen 4.5" in releases and on stable branches
>        - "Xen 4.5-unstable" on unstable
>        - "Xen 4.5-rc" for release candidate
> 
> Update the notes about XEN_EXTRAVERSION to match.

We have been tagging the tree with 4.5.0-rcX. So I think it would be 
better to update the wording so we use a consistent naming.

Cheers,

-- 
Julien Grall

