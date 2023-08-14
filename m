Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60C77BF4F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 19:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583772.914077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbip-00035f-O9; Mon, 14 Aug 2023 17:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583772.914077; Mon, 14 Aug 2023 17:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVbip-00032w-LJ; Mon, 14 Aug 2023 17:51:19 +0000
Received: by outflank-mailman (input) for mailman id 583772;
 Mon, 14 Aug 2023 17:51:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVbin-00032q-Rm
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 17:51:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbim-0005p1-Pl; Mon, 14 Aug 2023 17:51:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVbim-0006M0-KD; Mon, 14 Aug 2023 17:51:16 +0000
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
	bh=CRGAGYatorhwvkAlu+sWUOSzngHI4gWRqvJZ9TEv+QQ=; b=c/LLYToYW9hjJIyxxDupoVovo+
	pQdALomP7gjG2lN5pe+z74jiMfM789sCD5/2KyiY6VYW7sc1pzFxLuOx3SKqLtWhcOHJYsOzZrKsc
	H8PVDA1n48C1x4tDV37UDm2e9sb8V5hbjDGEJh8fUykF+SJvzUIzCSbheKNFjRTPApoM=;
Message-ID: <1b5c0fdb-8ff4-4a75-9271-c016b9a4f617@xen.org>
Date: Mon, 14 Aug 2023 18:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/19] tools/xenstore: make hashtable key parameter
 const
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814074707.27696-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/08/2023 08:46, Juergen Gross wrote:
> The key is never modified by hashtable code, so it should be marked as
> const.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

