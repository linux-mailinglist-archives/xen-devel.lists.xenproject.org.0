Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA3A12DD5
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:39:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873138.1284119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB63-0002uh-PT; Wed, 15 Jan 2025 21:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873138.1284119; Wed, 15 Jan 2025 21:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYB63-0002su-Mr; Wed, 15 Jan 2025 21:38:43 +0000
Received: by outflank-mailman (input) for mailman id 873138;
 Wed, 15 Jan 2025 21:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9vXr=UH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tYB62-0002Hm-1E
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:38:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 158ae7a2-d389-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:38:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41C49A424EE;
 Wed, 15 Jan 2025 21:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D995CC4CED1;
 Wed, 15 Jan 2025 21:38:37 +0000 (UTC)
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
X-Inumbo-ID: 158ae7a2-d389-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736977119;
	bh=gIV+iYssSHhdqs1CVtSAqPvQ3+jmqt5x0b6ibhD9PFg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u+FJpHGs26C+NGToMI4AIhkOlEVhikJmPQuHlZuAWWYuglac/azss4OXQ3K1cjMcT
	 VGnZYxkCe/4LMftTuUWkb0rCxWFZSMtK4u7RPDFFW+5J8pepwlPUqVn+t6aUgbKoni
	 4JY5Lazisswhy5tTI1/klPoVwBDfMdEggP9+v0yKEwMr4OqbwZgn3nTHivGC18Sg3q
	 cqzSue1J9wiv4ZSGcNoijWl5skwYK0zhgIOfq5yh1XsEOxwc/NbB5BCqkrO2PsKEDX
	 mvFNxTUK+MrFQHAz6q3bneaGSadayszVhd12KLxVlhVtTyuNszlAhDx2d/CoulgU+F
	 lgZScnn/KXWjA==
Date: Wed, 15 Jan 2025 13:38:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] docs: Punctuation: Add missing commas after linking
 adverbs as intros
In-Reply-To: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2501151338300.2684657@ubuntu-linux-20-04-desktop>
References: <ad9d1d7db8d43c82a02f64b8a317d7ae6522dd62.1736964253.git.bernhard.kaindl@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jan 2025, Bernhard Kaindl wrote:
> Fix missing commas after linking adverbs such as currently, fortunately,
> hence, instead, and thus, when used as linking adverbs at the beginning
> of sentences. I saw them with LTeX; other checkers have this rule too.
> 
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

