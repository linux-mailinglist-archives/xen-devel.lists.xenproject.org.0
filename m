Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD3779C7B
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 04:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582755.912668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1b-0001zA-U8; Sat, 12 Aug 2023 02:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582755.912668; Sat, 12 Aug 2023 02:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUe1b-0001wx-RK; Sat, 12 Aug 2023 02:06:43 +0000
Received: by outflank-mailman (input) for mailman id 582755;
 Sat, 12 Aug 2023 02:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WvX7=D5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUe1a-0001ue-Ks
 for xen-devel@lists.xenproject.org; Sat, 12 Aug 2023 02:06:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e04d1de8-38b4-11ee-b286-6b7b168915f2;
 Sat, 12 Aug 2023 04:06:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE48A64CB2;
 Sat, 12 Aug 2023 02:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C14C433C7;
 Sat, 12 Aug 2023 02:06:38 +0000 (UTC)
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
X-Inumbo-ID: e04d1de8-38b4-11ee-b286-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691805999;
	bh=v03ioEWWe/WG/8/dGTeAMaVff7IsbQbiAAyZnr2UnVM=;
	h=Date:From:To:cc:Subject:From;
	b=IyqvKs3AnA3tBXKcQiQ8L9+m6mmbKXjSOe6c0YrUOPY5VwSgoxD35hziA1Fm43HhT
	 Uzc4IU2ghtuN5uJ3h9ffxN3aKRnXPJ9i+vPUgOyLCmhRFsXQ4dIrlFUzFkRcWMH8wP
	 I3+CgJIy05mSFBtoxlgc3KVAf99Q30H/TGxVPwrBHLXQQVF8TnrhyvQzc3IiH6bVV1
	 uAKjNARh9uuk3BFzcX3veWOXNLSqbEcKcQvDkUV7J5yllq/CubRmmroMsWEIMBR1GF
	 dpf7r2SkKbS61mnEiIt8107iARqPOhp02oPqjWdWyF9HnRsSNo6NBn8oIPkzMiltW0
	 j28hiZI/Z0+fg==
Date: Fri, 11 Aug 2023 19:06:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, cardoe@cardoe.com, michal.orzel@amd.com
Subject: [PATCH 0/3] automation: switch Debian unstable to Bookworm
Message-ID: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Debian unstable has been released as Bookworm, so let's change our
containers to use Bookworm which is a stable release.

Here is proof everything still works:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/964051324

Cheers,

Stefano

