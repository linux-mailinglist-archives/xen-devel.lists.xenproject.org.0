Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF958690F0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 13:53:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686123.1067662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rewxk-0000AB-CW; Tue, 27 Feb 2024 12:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686123.1067662; Tue, 27 Feb 2024 12:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rewxk-00008B-9V; Tue, 27 Feb 2024 12:53:36 +0000
Received: by outflank-mailman (input) for mailman id 686123;
 Tue, 27 Feb 2024 12:53:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rewxi-000085-L7
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 12:53:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rewxi-0008Q7-1j; Tue, 27 Feb 2024 12:53:34 +0000
Received: from [15.248.2.14] (helo=[10.45.19.66])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rewxh-0000m6-O2; Tue, 27 Feb 2024 12:53:33 +0000
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
	bh=b6e7ixJF5w1pI1Ywu47yw51uOYI+anWHRmhRIskW2KU=; b=RGjkJmfP+oYsxYxR75SC1wgFnu
	eXjhYMe0TG3hxPAr36FzVu6pJi9c/UjFue+f+XNSkN73zx4myLxWY27czgp5za/xyEfGaMW5PHiWF
	nDR9XTw2XcqGB1D5nkZ5euXaKLcLbPx69/oWkghNzMVhZ620jOeKo5jzXc44/lTvzucc=;
Message-ID: <9c5e0fdd-e306-46fc-9f9c-45b81163a0c0@xen.org>
Date: Tue, 27 Feb 2024 12:53:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] docs/misra/rules.rst: add rule 16.6 and 20.12
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, george.dunlap@citrix.com,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com, federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-1-stefano.stabellini@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240213223334.3693410-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 13/02/2024 22:33, Stefano Stabellini wrote:
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

