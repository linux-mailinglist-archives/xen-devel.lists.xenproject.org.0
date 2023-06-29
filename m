Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E91742F81
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557122.870213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzCP-0001mS-An; Thu, 29 Jun 2023 21:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557122.870213; Thu, 29 Jun 2023 21:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzCP-0001kB-84; Thu, 29 Jun 2023 21:29:09 +0000
Received: by outflank-mailman (input) for mailman id 557122;
 Thu, 29 Jun 2023 21:29:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEzCN-0001k3-He
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:29:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzCM-0008Po-QQ; Thu, 29 Jun 2023 21:29:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzCM-0003f7-Lk; Thu, 29 Jun 2023 21:29:06 +0000
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
	bh=nSTswfM4G/lEWCDVQXnWAa4G2+3uxoXyFvGrtfypQVA=; b=byf/jX92Vw99hSqSuiH1ItvanJ
	gfqyt+Jz+rbJWZnBkIxnB+6EQ5++FcYqsSc6R/rPBclZ05r1wuu2QQ+mOSIZbR8rnvsq3fQ4HXuH3
	rRVDIDotTGd+HOZnnYqtk+Tru5iepdx3G5aDISAuFK1HBR5JFqUYX++e81++FL6tVDVA=;
Message-ID: <8f256514-06f8-3776-c464-d64227c7400e@xen.org>
Date: Thu, 29 Jun 2023 22:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 4/5] tools/xenstore: split out rest of live update
 control code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230627122750.2007-1-jgross@suse.com>
 <20230627122750.2007-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230627122750.2007-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 27/06/2023 13:27, Juergen Gross wrote:
> Move the rest of live update related code from xenstored_control.c to
> a dedicated new source file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

