Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6105440FD
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 03:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344515.570055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz6qM-0007Q2-Ie; Thu, 09 Jun 2022 01:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344515.570055; Thu, 09 Jun 2022 01:20:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nz6qM-0007Nd-Fi; Thu, 09 Jun 2022 01:20:14 +0000
Received: by outflank-mailman (input) for mailman id 344515;
 Thu, 09 Jun 2022 01:20:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nz6qK-0007NJ-EJ
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 01:20:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d65b898-e792-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 03:20:10 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2CF7B82B96;
 Thu,  9 Jun 2022 01:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06F5C34116;
 Thu,  9 Jun 2022 01:20:06 +0000 (UTC)
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
X-Inumbo-ID: 4d65b898-e792-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654737607;
	bh=d+DLiXwlbjDMXCSdYRfGavyNvyx6xU4i4BT1aAY1rBQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aDr4OzrBoPV+1QLWdfgKDwbYQB0biEJJF3dWK6mDAd14CHqYk1Vls0HA2GsLfpKjW
	 +a7SKQF2jP4QJETYBg/YamTNQ5EqQIlIH6br+YsSUqnDkGEW0C0veORkZbUyNhVKRK
	 qgllxt4Zjnt6n44zQC6hCfAwB1JT/g/8HG0Pr/wLR3JZh0wigNrcbS5AKAZu+VdD63
	 JX/g0A2haxZV4mj51ocoqfqpOFpHjsWM0ETybpk24ONTY/ru1eT6Z2hf1DtDByAmxQ
	 GJizPnIDe1nMBQ6YiRNY147iZlUXx/MyoHVXupgx+Imda7TlTaU8/91UfaaW7T8wD/
	 17Zz68ikP5E3g==
Date: Wed, 8 Jun 2022 18:20:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <George.Dunlap@citrix.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, Andrew.Cooper3@citrix.com, 
    julien@xen.org, Bertrand.Marquis@arm.com, fusa-sig@lists.xenproject.org, 
    roberto.bagnara@bugseng.com
Subject: MISRA C meeting tomorrow, was: MOVING COMMUNITY CALL Call for agenda
 items for 9 June Community Call @ 1500 UTC
In-Reply-To: <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2206081806020.21215@ubuntu-linux-20-04-desktop>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com> <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop> <ebe4b409-318f-6b2c-0e05-fe9256528b32@suse.com>
 <alpine.DEB.2.22.394.2206061731421.277622@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Just a quick note to have another look at the spreadsheet before the
meeting tomorrow. I cleared the old rules we have already discussed
leaving only the ones to discuss next.


A few rules are similar to the already accepted Rule 5.1 with our agreed
40 characters limit for identifiers:
- Rule 5.2
- Rule 5.4


A couple of rules are about comparisons/operations between pointers to
different objects:
- Rule 18.1
- Rule 18.2
- Rule 18.3
In my opinion these rules are good in the general case. Things like _end
- _start and other "fake objects" should be deviations.


A few rules weren't clear:
- Rule 13.1, the example link was wrong, I updated it
- Rule 9.3, { 0 } is allowed by the rule and also { [2] = 1 } is allowed
- Rule 9.4, range initializers are not considered by the rule because
            they are a GNU extension


Finally, for Rule 13.2, I updated the link to ECLAIR's results. There
are a lot more violations than just 4, but I don't know if they are
valid or false positives.


Looking forward to our discussion tomorrow!

Cheers,

Stefano

