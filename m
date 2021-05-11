Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE6B37B131
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 23:59:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126027.237222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgaOr-0004PY-AK; Tue, 11 May 2021 21:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126027.237222; Tue, 11 May 2021 21:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgaOr-0004NG-6x; Tue, 11 May 2021 21:58:45 +0000
Received: by outflank-mailman (input) for mailman id 126027;
 Tue, 11 May 2021 21:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgaOp-0004N9-KE
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 21:58:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fd51c80-b02f-4ce6-b4d0-a8b47202542a;
 Tue, 11 May 2021 21:58:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21C646162A;
 Tue, 11 May 2021 21:58:41 +0000 (UTC)
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
X-Inumbo-ID: 0fd51c80-b02f-4ce6-b4d0-a8b47202542a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620770321;
	bh=HOAq54B5Xnf9i1yZBD7EBx8nEVkEkFwS/CLLa0ixz7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Kxo1nZAUpxDj8UDtbAIJIlwytKjdSlAagdFCo2+YiLDpYmrLi0feAyKrsm/llsBmQ
	 BST775Ym5JCsgFM4l82XRxxu3AN9Du2tktEwyb3R07oo1KxmgdGaflwu5U6nopzNqn
	 GE5Kp5PC4SlsUUi/w2I5sBvc8VP8nJIz8hnBzH8XhxfEJjRZsgJxYEgTdQQhg/XFFv
	 9TBuHi6PaKGg+XmhtWI8KgzhVkl9GyUni2dOllRewz6yfvkU0bkwL2AEJg5gCoBdez
	 hxDvD/duB1brOS3I4CGLI5EiIfAejEHsdqkEn8m0jOdGULgkQ9iEue5WO2Sn2+/2fr
	 ktlu4djgH5new==
Date: Tue, 11 May 2021 14:58:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
In-Reply-To: <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
Message-ID: <alpine.DEB.2.21.2105111457480.5018@sstabellini-ThinkPad-T480s>
References: <20210504133145.767-1-luca.fancellu@arm.com> <20210504133145.767-4-luca.fancellu@arm.com> <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s> <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
 <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 May 2021, Jan Beulich wrote:
> An alternative to correcting the (as it seems) v2 related issues, it
> may be worth considering to extract only v1 documentation in this
> initial phase.

FWIW I agree with Jan that "grant table v1" documentation only is a good idea.

