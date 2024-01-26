Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004CB83DE93
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 17:23:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672204.1045952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOz0-0000Q1-LY; Fri, 26 Jan 2024 16:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672204.1045952; Fri, 26 Jan 2024 16:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOz0-0000O2-It; Fri, 26 Jan 2024 16:23:10 +0000
Received: by outflank-mailman (input) for mailman id 672204;
 Fri, 26 Jan 2024 16:23:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTOyz-0000Nw-ND
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 16:23:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTOyz-00089W-68; Fri, 26 Jan 2024 16:23:09 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTOyy-0003Xf-W1; Fri, 26 Jan 2024 16:23:09 +0000
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
	bh=L2JTTxQKuUGqCdtzpTgbu/k8Mkrvkvt/spjSptdn2iU=; b=inGI81AjubALGvd0w7E52qYTQP
	iSuBrNQkUbkFvXYQKHL94OCoRm0G8AxiSwu3hrBVkP+aNGGkhrvRu28YUtTjc5dU6N1ZO1nY4NKCQ
	vkBs81o4aDbNjneUJvVZ8P6d1FUfL9kvgb7KkT+TQ52uGQXfsSfSjVjKpVxPkO704eik=;
Message-ID: <d488a1cc-6bdb-43e0-8c2c-ceeff485a020@xen.org>
Date: Fri, 26 Jan 2024 16:23:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/33] tools/xenstored: get own domid in stubdom case
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240104090055.27323-1-jgross@suse.com>
 <20240104090055.27323-27-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240104090055.27323-27-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/01/2024 09:00, Juergen Gross wrote:
> Obtain the own domid when running as stubdom.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

