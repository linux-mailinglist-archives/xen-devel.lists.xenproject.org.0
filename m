Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A105D813CA1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:30:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654749.1022046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtHy-0008Gw-20; Thu, 14 Dec 2023 21:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654749.1022046; Thu, 14 Dec 2023 21:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtHx-0008E9-Vb; Thu, 14 Dec 2023 21:30:37 +0000
Received: by outflank-mailman (input) for mailman id 654749;
 Thu, 14 Dec 2023 21:30:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtHw-0008Dz-74
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:30:36 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 031b8fe6-9ac8-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 22:30:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16E49CE248D;
 Thu, 14 Dec 2023 21:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBD3C433C8;
 Thu, 14 Dec 2023 21:30:30 +0000 (UTC)
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
X-Inumbo-ID: 031b8fe6-9ac8-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589431;
	bh=z7DK3fJ7UoTx4ZzCexTuVjJMYigMkIHSQlbcZ4S1dM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N9vAdeApV16K74Z8eVW/eK/HouEqmcJx6rveVPWkEdbHY59ucL7/Y2Yc+5yWtt65B
	 EObKzKkRTqreuy7xvumMa3I+FYy/qC4FI0wFhPEQNrE//efE6ylWnNBH3igF2u3ejZ
	 S+dXtY/50tgT8WIOPoq6sHhHVYL1a9XJ/4qOWHUALjfDbq/xoRXpUhiaogEcASS93V
	 hkKDiVhwrFSQCgDZwXs2V84FiKahRQI5yKgmfZzPARMda4u1zyb9oNn/tDabxJS4OV
	 jgjKoIOZPy/oQDF5s96haBmmjCtcsEek3/531BX+EBNSM4tKMM3VQ98aTyawv0PF4i
	 L/8TA0jwQjD4g==
Date: Thu, 14 Dec 2023 13:30:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/5] x86/ioapic: use NULL as a null pointer
 constant
In-Reply-To: <01968117d9fc3eee6d6eca0d340d9d2edd4d6dd4.1702553835.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141330230.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com> <01968117d9fc3eee6d6eca0d340d9d2edd4d6dd4.1702553835.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Nicola Vetrini wrote:
> Resolves violations of MISRA C Rule 11.9.
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

