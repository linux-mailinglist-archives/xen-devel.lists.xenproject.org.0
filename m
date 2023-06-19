Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09699735D3A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551304.860782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJE0-0006q0-Uj; Mon, 19 Jun 2023 18:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551304.860782; Mon, 19 Jun 2023 18:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBJE0-0006o7-RF; Mon, 19 Jun 2023 18:03:36 +0000
Received: by outflank-mailman (input) for mailman id 551304;
 Mon, 19 Jun 2023 18:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBJDz-0006o1-16
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 18:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJDy-00048v-8K; Mon, 19 Jun 2023 18:03:34 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBJDy-0001Fe-2H; Mon, 19 Jun 2023 18:03:34 +0000
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
	bh=o6GHBkLyrb52ZVbowhwCookatEcgtQX3chWzkHRpH6Q=; b=y0ueHjwzpJ9JrsyMQQzjeRMBnX
	qNfLxshVbHZTvB8RY39jAJ4+P+zsDNGT749uzAb1IVIbjem5/3Zy4zD4B3rm1MD2IoOknfKLIwfJ9
	uF/HtrkU6LMbe23+xqUIt/67krjeHUNldbKk2Ou2jbMskp29A0fMlf+jYb4o4EGPn7dI=;
Message-ID: <07f10a84-7deb-9fa0-aace-46253a33c6a9@xen.org>
Date: Mon, 19 Jun 2023 19:03:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/16] tools/xenstore: split out rest of live update
 control code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-16-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-16-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> Move the rest of live update related code from xenstored_control.c to
> a dedicated new source file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Depending on the outcome of the discussion in patch #15, this patch may 
need to be updated. At its current state:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

