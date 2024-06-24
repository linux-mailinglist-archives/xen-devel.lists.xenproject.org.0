Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C1914FB3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746684.1153813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkU8-0000d1-Pj; Mon, 24 Jun 2024 14:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746684.1153813; Mon, 24 Jun 2024 14:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkU8-0000bX-Mw; Mon, 24 Jun 2024 14:15:56 +0000
Received: by outflank-mailman (input) for mailman id 746684;
 Mon, 24 Jun 2024 14:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLkU6-0000bR-MN
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:15:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43908da7-3234-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:15:52 +0200 (CEST)
Received: from [10.176.134.80] (unknown [160.78.253.181])
 by support.bugseng.com (Postfix) with ESMTPSA id 900564EE0738;
 Mon, 24 Jun 2024 16:15:51 +0200 (CEST)
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
X-Inumbo-ID: 43908da7-3234-11ef-b4bb-af5377834399
Message-ID: <1aeebff6-68f2-4135-ae5d-6c76f29f4ab0@bugseng.com>
Date: Mon, 24 Jun 2024 16:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: rules for mass adoption
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, sstabellini@kernel.org, andrew.cooper3@citrix.com,
 julien@xen.org, michal.orzel@amd.com, bertrand.marquis@arm.com,
 roger.pau@citrix.com
References: <20240622001422.3852207-1-stefano.stabellini@amd.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <20240622001422.3852207-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 22/06/24 02:14, Stefano Stabellini wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> This patch adds a bunch of rules to rules.rst that are uncontroversial
> and have zero violations in Xen. As such, they have been approved for
> adoption.
> 
> All the ones that regard the standard library have the link to the
> existing footnote in the notes.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Also Rule 21.11 ("The standard header file <tgmath.h> shall not be
used") results clean, I think it should be added within this patch.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

