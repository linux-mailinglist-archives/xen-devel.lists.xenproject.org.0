Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515F3534803
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 03:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337416.562010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu28d-00076a-GD; Thu, 26 May 2022 01:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337416.562010; Thu, 26 May 2022 01:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nu28d-000747-D6; Thu, 26 May 2022 01:18:07 +0000
Received: by outflank-mailman (input) for mailman id 337416;
 Thu, 26 May 2022 01:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nu28c-000741-37
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 01:18:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0326c86-dc91-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 03:18:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F34B16178B;
 Thu, 26 May 2022 01:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5099C385B8;
 Thu, 26 May 2022 01:18:00 +0000 (UTC)
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
X-Inumbo-ID: b0326c86-dc91-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653527881;
	bh=f1ROh0jhdngz8xUjuNAgmHCnrQqW6Evn0tfcS/9eO5g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oaPwo+k4ixEd4tAiXUXTQv9kRD37r8hywS4gnu1EJ/eR1pi2+9XCVJgITx24pBuQK
	 R6PnsdquOtL7Iv13ZasyA/g+X/24HjKBSgN1w4xJqpZ8WxnnBsuy7+RKX2JvJUVK0f
	 tyrbtZo/EqYzRX8oDb4nrl6khvaOlmTdjCACm0/B5SH25B631Zc6JhiVwJYDj1F+ow
	 Fwt+Xh/ezcfLWGBXRuvMDodVYiJeMW1aQIlqxKWDgqvecvYNRv53axnevfPR0J9i6O
	 gMcukPgqdMTe1sgLOU8O7BZDS2iHYZJdHpkjFjpzX1h8RuZw/k3CwZIbyLqMRPhqyJ
	 WkNKSxDWoukag==
Date: Wed, 25 May 2022 18:18:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    George.Dunlap@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] docs/misra: add Rule 5.1
In-Reply-To: <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205251813290.1905099@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205241650160.1905099@ubuntu-linux-20-04-desktop> <20220525003505.304617-2-sstabellini@kernel.org> <6604372a-67a1-6ad2-bbcf-d6b4337a4bf0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 May 2022, Jan Beulich wrote:
> On 25.05.2022 02:35, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > Add Rule 5.1, with the additional note that the character limit for Xen
> > is 63 characters.
> > 
> > The max length identifiers found by ECLAIR are:
> > 
> > __mitigate_spectre_bhb_clear_insn_start
> > domain_pause_by_systemcontroller_nosync
> > 
> > Both of them are 40 characters long. A limit of 63 characters work for
> > the existing code.
> 
> I have to admit that it hasn't become clear to me why we want to
> permit (if not to say encourage) the use of such long identifiers.
> If 40 is the longest we've got, why not limit it to 40 for now
> with a goal of further reducing? A 40-char symbol plus some
> indentation will already pose problems with 80-char line length.
 
We can go lower than 63 if we want to. I chose the closest power-of-two
length -1 for the NUL terminator. But it doesn't have to be a
power-of-two. So we could go with "41" if we want to.

Anyone in favor of that? I am happy with any number between 41 and 63.


> Otoh, as said on the call, I think the public headers want
> mentioning explicitly here in some way. Part of them (most or all
> of what's under io/) aren't used when building Xen, so won't be
> seen by Eclair (aiui). Yet they are a formal part of the code
> base, and e.g. ring.h has some pretty long names (albeit still
> below 40 chars as it looks). So once we're able to go down to e.g.
> 32 for the bulk of the code base, public headers should imo still
> be explicitly allowed to use longer identifiers.

Actually I thought about writing something for the public header but I
wasn't sure what to write. What about:

- Note: the Xen characters limit for identifiers is 41. Public headers
  (xen/include/public/) are allowed to retain longer identifiers for
  backward compatibility.

