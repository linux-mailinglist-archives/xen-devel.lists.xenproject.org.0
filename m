Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC377BF5D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 19:53:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583777.914088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbl2-0003dz-46; Mon, 14 Aug 2023 17:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583777.914088; Mon, 14 Aug 2023 17:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbl2-0003bf-0C; Mon, 14 Aug 2023 17:53:36 +0000
Received: by outflank-mailman (input) for mailman id 583777;
 Mon, 14 Aug 2023 17:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVbkz-0003bV-Vo
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 17:53:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbkz-0005qp-Bd; Mon, 14 Aug 2023 17:53:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbkz-0006N5-6p; Mon, 14 Aug 2023 17:53:33 +0000
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
	bh=W2ToNMbKAxupQltJ//2V7QwvLnOoy8fq3/QJQDtVB6w=; b=jFKhmn297AdROgOTz3nMCByIAo
	PCHAeMTAd3LTBzy5Juq0ZSIuipEz/rTAE5wMLOUto38jnje4yyFqMcZqxbvjUvVJ8jTXbpFyzNPee
	OMUVbFYLdSANexh91nDs8cU8VjauJAOFgUhP8tQJgx6yCGekE0AdfMFhUF58vuXK8ATA=;
Message-ID: <7d28ad4d-5be3-4454-913f-0ab71f757fff@xen.org>
Date: Mon, 14 Aug 2023 18:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/19] tools/xenstore: change talloc_free() to take a
 const pointer
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> With talloc_free() and related functions not taking a pointer to const
> it is tedious to use the const attribute for talloc()-ed memory in
> many cases.
> 
> Change the related prototypes to use "const void *" instead of
> "void *".
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

