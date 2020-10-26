Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352C29897C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12151.31841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyvv-0008S1-No; Mon, 26 Oct 2020 09:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12151.31841; Mon, 26 Oct 2020 09:36:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyvv-0008Rc-KL; Mon, 26 Oct 2020 09:36:55 +0000
Received: by outflank-mailman (input) for mailman id 12151;
 Mon, 26 Oct 2020 09:36:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kWyvu-0008RX-4o
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:36:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13a3cdc9-1b90-463d-a3d6-235550d9b2bc;
 Mon, 26 Oct 2020 09:36:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69DE1B1D2;
 Mon, 26 Oct 2020 09:36:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kWyvu-0008RX-4o
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:36:54 +0000
X-Inumbo-ID: 13a3cdc9-1b90-463d-a3d6-235550d9b2bc
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13a3cdc9-1b90-463d-a3d6-235550d9b2bc;
	Mon, 26 Oct 2020 09:36:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603705012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+p5pwnxxDkubn0ApxX3PGLtDsgBeYgDFORRxRpObx/U=;
	b=hPpbBpHdz2jfhRBaX8oZvHNasUuQD+scibtUTaby1oAG9POpUautAg7q+FGi4oCZLMB3F/
	aj7JWIaw1ImMZVN6/7qZy1qbzBylpgfB+OkzhjyRJqZRQi1UExz3zidMnKRjnXQTlQ/G3s
	0mqusl1tzHa1b5gRAh4lMBIMNmp37Mo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 69DE1B1D2;
	Mon, 26 Oct 2020 09:36:52 +0000 (UTC)
Subject: Re: [PATCH 05/12] docs: fix hypfs path documentation
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4f34ff5-4ab8-14da-1da0-9bb0e70b80d7@suse.com>
Date: Mon, 26 Oct 2020 10:36:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> The /params/* entry is missing a writable tag.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

