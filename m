Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D230780A96
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585993.917224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxAv-0007Dy-5D; Fri, 18 Aug 2023 10:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585993.917224; Fri, 18 Aug 2023 10:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxAv-0007BF-2e; Fri, 18 Aug 2023 10:57:53 +0000
Received: by outflank-mailman (input) for mailman id 585993;
 Fri, 18 Aug 2023 10:57:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWxAt-0007B5-Sx
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:57:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxAs-0006po-U1; Fri, 18 Aug 2023 10:57:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWxAs-0002uo-PO; Fri, 18 Aug 2023 10:57:50 +0000
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
	bh=vLDvZ+NnfrSNuC3q+/7uZ85AWerv5ac0X7Yk7Hmeuf0=; b=FLl6smezT+PBIBUWidNANoE5xv
	6k47sGt9deUBCLjq0+9oxHXLx+8SMvLr6+oZlmFxUaLsiC7KaTZqiEOWmzD6ZwFbL608qpPtTGMSy
	08tD1pgC7vqtPMUmXuBKXtZ/bVuyQaExXO3QX9CddHZCmxZStVJlWQyoxUzs1tGzMSCI=;
Message-ID: <c5540ee3-7f3e-4ff5-8f00-fc0c83fe645c@xen.org>
Date: Fri, 18 Aug 2023 11:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/19] tools/xenstore: use struct node_hdr in struct
 node
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-12-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-12-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> Replace some individual fields in struct node with struct node_hdr.
> 
> This allows to add a helper for calculating the accounted memory size
> of a node.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

