Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0EC61E652
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:10:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438994.692914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormub-0005Fy-Is; Sun, 06 Nov 2022 21:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438994.692914; Sun, 06 Nov 2022 21:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormub-0005Di-GL; Sun, 06 Nov 2022 21:10:37 +0000
Received: by outflank-mailman (input) for mailman id 438994;
 Sun, 06 Nov 2022 21:10:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormua-0005DS-Gx
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:10:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormuZ-0000tv-V7; Sun, 06 Nov 2022 21:10:35 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormuZ-0007AW-Q6; Sun, 06 Nov 2022 21:10:35 +0000
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
	bh=F/nYLIawPo9HgrFZI+/fkr/mbpTyUM6/lTUyDiCLBHE=; b=i4R5NoD1RZOJZgoFA/m2U+uofa
	2Kct8ChKhiStlyjVhMdBkaDtP21bL4qfk7hdS0yoosmKS8it7dy4GYGD/qOe4mmncZS0hFSfTFhZ7
	w2gv8ZwdKeXcw243xloHfkMZEX2b7chVRS9UgbaOR+w1BYmV6oKR4ICYlzX2tcqJfEKo=;
Message-ID: <d5491630-011f-cc1d-4230-fa48651413ec@xen.org>
Date: Sun, 6 Nov 2022 21:10:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 05/20] tools/xenstore: preserve errno across corrupt()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Let corrupt() preserve errno in order to be able to simplify error
> handling in future.
> 
> This is rather easy as the errno value when entering corrupt() is
> saved already.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

