Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AB616397
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 14:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435942.689900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDbF-00012v-K5; Wed, 02 Nov 2022 13:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435942.689900; Wed, 02 Nov 2022 13:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDbF-000118-HM; Wed, 02 Nov 2022 13:16:09 +0000
Received: by outflank-mailman (input) for mailman id 435942;
 Wed, 02 Nov 2022 13:16:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oqDbD-000112-Pz
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 13:16:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oqDbD-0001zR-Hg; Wed, 02 Nov 2022 13:16:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.20.91]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oqDbD-0004l3-7C; Wed, 02 Nov 2022 13:16:07 +0000
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
	bh=7+JvXZyYtt5ysBoPO3lLZpX41CSdzaCd3dJ2JGRqb4g=; b=x5kN9NrNhdsWuCNsQEeufidbud
	p2F0KUGuUnOlUCT3v+9IeCh0IqZJRPUI2AjgoDmpe9ydvOqSZB1EUF+bmsWu7uKHpjpqduFhBrgg2
	bujn5btpV3NQmDgvEuzkK7JsRh+tKnhCk6wXroRcct41bqC3c0nEZuqzWf7JRwiV1JWw=;
Message-ID: <fad0265d-a736-5135-b5ea-3735a8bc72da@xen.org>
Date: Wed, 2 Nov 2022 13:16:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221102112854.49020-4-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/11/2022 11:28, Anthony PERARD wrote:
> This header have been created by moving code from other part of the
> project and miss a licence header. The original source code was some
> version of GPL or LGPL but we intend to have the public header to be
> MIT so they can be included easily in other projects.
> 
> Part of device_tree_defs.h were moved from libxl_arm.c which is
> LGPL-2.1-only. And part were moved from device_tree.h that is
> GPL-2.0-only.
> 
> Part of the original code were added by Julien Grall @ Citrix with a
> Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
> 886f34045bf0.

 From this comment it is not entirely who you think the copyright owner 
is. IIRC, part of the agreement was that all code written with my Linaro 
"hat" would be copyrighted by Linaro rather than Citrix.

So I think we would need Linaro's agreement for the relicensing.

Cheers,

-- 
Julien Grall

