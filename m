Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC88A4CA1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:39:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706014.1103007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJjb-0002LS-HZ; Mon, 15 Apr 2024 10:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706014.1103007; Mon, 15 Apr 2024 10:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJjb-0002IX-Es; Mon, 15 Apr 2024 10:38:47 +0000
Received: by outflank-mailman (input) for mailman id 706014;
 Mon, 15 Apr 2024 10:38:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwJjZ-0002IQ-Dv
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 10:38:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJjZ-0001pv-0x; Mon, 15 Apr 2024 10:38:45 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJjY-0007vf-Q7; Mon, 15 Apr 2024 10:38:44 +0000
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
	bh=oAsbH74/3hDU9w1qs2/UrsVM/iQLEuQY98xA5u1UnhU=; b=jRubm8nMWMuqEqQM1hGC1672gI
	JzUNYh+EjA41mZaDocRzbMepL9fY81ahgHLKe870rQ7VH/IQJC0H2yaEpdLyLE558VtmUYoGm7Qzo
	ygmdj8nEgw467lHKL+6k5KH5GhleeGgIrk64UQEhMv4KhYw1xl77KEkLxI6KMOmEz9QU=;
Message-ID: <6ee4b38e-cc54-42af-970e-547c4bbc7e69@xen.org>
Date: Mon, 15 Apr 2024 11:38:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: s/int/int32_t
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, jbeulich@suse.com, michal.orzel@amd.com,
 roger.pau@citrix.com
References: <alpine.DEB.2.22.394.2404091625170.711344@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2404091625170.711344@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/04/2024 00:26, Stefano Stabellini wrote:
> 
>>From 28f83c4ec0c0b5c1e7eb2bd8bc5dc3190314a5b7 Mon Sep 17 00:00:00 2001
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> Date: Tue, 9 Apr 2024 16:19:21 -0700
> Subject: [PATCH] public: s/int/int32_t
> 
> Straightforward int -> int32_t and unsigned int -> uint32_t replacements
> in public headers. No ABI or semantic changes intended.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

