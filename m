Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F2875A11
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 23:16:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690056.1075707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riM14-0008EK-Qw; Thu, 07 Mar 2024 22:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690056.1075707; Thu, 07 Mar 2024 22:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riM14-0008C0-Nq; Thu, 07 Mar 2024 22:15:06 +0000
Received: by outflank-mailman (input) for mailman id 690056;
 Thu, 07 Mar 2024 22:15:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1riM13-0008BZ-F8
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 22:15:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 251b167d-dcd0-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 23:15:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78D8861D4C;
 Thu,  7 Mar 2024 22:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3B1C433C7;
 Thu,  7 Mar 2024 22:15:01 +0000 (UTC)
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
X-Inumbo-ID: 251b167d-dcd0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709849702;
	bh=ImqCRmQ0LNYndfa/qXhGMKDnHDvm3W+hzBKcpcvdFb4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kEc/AU6tdERsft279aFt2X6a/R8McrOuX3o4rngLNLRyCbnyxxMS8vteGHPRvNxiI
	 3CnOHklwy2Pofn2mGucXmlmTj7zUHGy5s26UPx7QFqkMiMs1QelRB3DvpH+6AnrrHW
	 QrKxkQkxqJwZRVkgM3ri5hqoTi3gnGCBeQ5/ijb7+j+8DupVDIi4VbT/YglUDFyWQg
	 JUdW+x48mNMtsg4xgeYrnusrU/ToeJuP77MO5EZXhbzD5Dw2jQfZUoZBP+WP1+276Q
	 KE7e185toxbhC0eGm0voMfvatc5hhzNCbOX/ZGcZRA1NtvwLqHmKcnNbCd7bsBesDn
	 V/Px3aObX+uTQ==
Date: Thu, 7 Mar 2024 14:15:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] automation: introduce non debug clang based tests
In-Reply-To: <20240229095529.17723-3-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2403071414530.853156@ubuntu-linux-20-04-desktop>
References: <20240229095529.17723-1-roger.pau@citrix.com> <20240229095529.17723-3-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-187522848-1709849702=:853156"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-187522848-1709849702=:853156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 29 Feb 2024, Roger Pau Monne wrote:
> The generated code between the debug and release builds can be quite
> different, as a note 2ce562b2a413 only manifested in non-debug builds due to
> the usage of -O2.
> 
> Duplicate the clang based test in order to test with both debug and non-debug
> Xen builds.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

--8323329-187522848-1709849702=:853156--

