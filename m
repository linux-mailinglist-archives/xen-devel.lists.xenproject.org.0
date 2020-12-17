Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8842DD4A4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56028.97766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvbW-0006As-Kn; Thu, 17 Dec 2020 15:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56028.97766; Thu, 17 Dec 2020 15:54:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvbW-0006AT-Hi; Thu, 17 Dec 2020 15:54:10 +0000
Received: by outflank-mailman (input) for mailman id 56028;
 Thu, 17 Dec 2020 15:54:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YGc=FV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpvbV-0006AO-CL
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:54:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67f5f643-a9ef-4607-bc04-1322f2339085;
 Thu, 17 Dec 2020 15:54:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 485CBAC1A;
 Thu, 17 Dec 2020 15:54:07 +0000 (UTC)
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
X-Inumbo-ID: 67f5f643-a9ef-4607-bc04-1322f2339085
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608220447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2DZh75jUxdp+tLWQj/5xkezmHM+AXQskTAF3Pe03PIk=;
	b=mKR/Dxk9pmCDRuR/TSjgvyFMso4lQdP2ap91wwPYctgzoDtfFcvav47Z6sN0hOj1feNuiU
	GhIwjPIWDCpijs+9s4lxAVuKgOZRG7I8Vkt4ZcRg/exKdwZU/xrzsMFqCKvTSszbnIgvKh
	gKJL21ncSnsglx/k2iARa63zq4KarWw=
Subject: Re: [PATCH v3 6/8] xen/cpupool: add cpupool directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc21ddcd-f263-d502-5b85-a74350c29fe3@suse.com>
Date: Thu, 17 Dec 2020 16:54:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209160956.32456-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 17:09, Juergen Gross wrote:
> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
> dynamic, so the related hypfs access functions need to be implemented.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


