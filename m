Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6522FA4F1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 16:40:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69806.125069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WdB-0004BE-QY; Mon, 18 Jan 2021 15:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69806.125069; Mon, 18 Jan 2021 15:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1WdB-0004Ap-NK; Mon, 18 Jan 2021 15:39:49 +0000
Received: by outflank-mailman (input) for mailman id 69806;
 Mon, 18 Jan 2021 15:39:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1WdA-0004AU-98
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 15:39:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96768e28-3c82-432a-9239-89e2d114429b;
 Mon, 18 Jan 2021 15:39:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA554ADE0;
 Mon, 18 Jan 2021 15:39:46 +0000 (UTC)
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
X-Inumbo-ID: 96768e28-3c82-432a-9239-89e2d114429b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610984386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zK1HjgTL+iv99hwenJjIXwVMzbihCn51hisIUTTe3uA=;
	b=Zx2oY58fW4rYuWf5z81ZnL9xXiyYcId0HZntuNyx1IN8oFvAQpjdjCXLUpyMkRW72dB5za
	l2DSOeSs+Bh9nYsMRpPk71vx6cdbrSlYhStuDiB/MxuxRDjdagVoTf1FyrZttd2g8UWwtb
	Zlj8lrPfYhUxaIj+OJWGg7mhDL2JG2k=
Subject: Ping: [PATCH] kconfig: ensure strndup() declaration is visible
From: Jan Beulich <jbeulich@suse.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
Message-ID: <cec2d09e-3c7f-53a7-01e2-a98b74779c41@suse.com>
Date: Mon, 18 Jan 2021 16:39:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5db4e135-16e9-db1d-3e04-c0145f9f39bd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Doug,

On 11.01.2021 15:42, Jan Beulich wrote:
> Its guard was updated such that it is visible by default when POSIX 2008
> was adopted by glibc. It's not visible by default on older glibc.
> 
> Fixes: f80fe2b34f08 ("xen: Update Kconfig to Linux v5.4")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I've got an ack from Andrew, but strictly speaking I need yours
aiui. I'll wait some more, but will commit this perhaps by mid
of the week.

Jan

