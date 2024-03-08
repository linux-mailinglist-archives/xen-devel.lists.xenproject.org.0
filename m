Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CB876DB0
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 00:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690415.1076373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rijFk-000274-NH; Fri, 08 Mar 2024 23:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690415.1076373; Fri, 08 Mar 2024 23:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rijFk-00024c-KD; Fri, 08 Mar 2024 23:03:48 +0000
Received: by outflank-mailman (input) for mailman id 690415;
 Fri, 08 Mar 2024 23:03:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rijFj-00024R-Gi
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 23:03:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rijFj-00048E-9F; Fri, 08 Mar 2024 23:03:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rijFj-0001m0-4N; Fri, 08 Mar 2024 23:03:47 +0000
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
	bh=HkmVvyzi/bmdSNj+nB7BW0i7l0s7STdV+hLaTQjGULI=; b=YASpvM5IY97lvZUg87/sELzPVu
	GiC6rqNQFYjRMF47xH1kAv33O3uMolGCNkZ36XDHaE0qG8KwjniI6idZ5MxtsaRAF52haYJbNmxii
	z4djTR0zBz26AEcj6oTG5pEdnAW3pFxv6d528DzTVqM2An3AOx+/HNvtxFQsxc5MxGsY=;
Message-ID: <ec4f2ed1-ac3d-4e36-b35f-fce6d3e0678f@xen.org>
Date: Fri, 8 Mar 2024 23:03:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] support: add cache coloring arm64 experimental
 feature
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-16-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240129171811.21382-16-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 29/01/2024 17:18, Carlo Nonato wrote:
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> ---
> v6:
> - new patch
> ---
>   SUPPORT.md | 7 +++++++

I would consider to fold it in patch #1. So we could potentially to 
start committing the series.

In any case:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

