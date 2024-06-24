Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1757915AB7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 01:38:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746976.1154213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtG4-0002nr-FS; Mon, 24 Jun 2024 23:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746976.1154213; Mon, 24 Jun 2024 23:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtG4-0002m8-C4; Mon, 24 Jun 2024 23:38:00 +0000
Received: by outflank-mailman (input) for mailman id 746976;
 Mon, 24 Jun 2024 23:37:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hzrU=N2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLtG3-0002m1-2m
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 23:37:59 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c64fe87f-3282-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 01:37:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6F794CE131B;
 Mon, 24 Jun 2024 23:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1FEC32781;
 Mon, 24 Jun 2024 23:37:47 +0000 (UTC)
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
X-Inumbo-ID: c64fe87f-3282-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719272268;
	bh=vWbG0c0CobB53DU/xavLSffEahkqZpCLX4EoIvPMzs0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o31GOQ93FI06XUUftO+cpWwi8Ls0+bsbbPznZslhylnbq3Frqf8TraDYVIYgnVRLz
	 O4pKH7vpXu7Mi5iZTXSC1pG9lOH3OSwBRpuGFkckBY/L2ZiiQ0L5YlRIsQHzD9STcQ
	 /sBCv0UQpADPDkejI4ivt2F0PbB1qHSc3t81n1DvwbwIYdfPA9sqIbBG78cV4tFO+s
	 WIzhA58X8TTJx1IUWoivzTwVM5sRalFstAsjhY7j699IPbFGAdu2h1TAlRcxy8EXxk
	 pxBGqVfVffV7PoQe92pTnlCdX96gscvfiuaVkLArauGZsxWt8yL9KlhsQLiUGNund/
	 TDtK9PEc1FVoA==
Date: Mon, 24 Jun 2024 16:37:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2] automation/eclair: configure Rule 13.6 and custom
 service B.UNEVALEFF
In-Reply-To: <5c60e98d70ae94c155fd56ec13b764b7a8f6161c.1719219962.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241637380.3870429@ubuntu-linux-20-04-desktop>
References: <5c60e98d70ae94c155fd56ec13b764b7a8f6161c.1719219962.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Rule 13.6 states that "The operand of the `sizeof' operator shall not
> contain any expression which has potential side effects".
> 
> Define service B.UNEVALEFF as an extension of Rule 13.6 to
> check for unevalued side effects also for typeof and alignof operators.
> 
> Update ECLAIR configuration to deviate uses of BUILD_BUG_ON and
> alternative_v?call[0-9] for both Rule 13.6 and B.UNEVALEFF.
> 
> Add service B.UNEVALEFF to the accepted.ecl guidelines to check
> "violations" in the weekly analysis.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


