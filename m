Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F6B28687
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 21:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083801.1443247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0LU-0002Xt-Co; Fri, 15 Aug 2025 19:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083801.1443247; Fri, 15 Aug 2025 19:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un0LU-0002VW-8n; Fri, 15 Aug 2025 19:44:12 +0000
Received: by outflank-mailman (input) for mailman id 1083801;
 Fri, 15 Aug 2025 19:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JuuU=23=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1un0LS-0002VQ-NH
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 19:44:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3524588f-7a10-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 21:44:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3781F60007;
 Fri, 15 Aug 2025 19:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82717C4CEEB;
 Fri, 15 Aug 2025 19:44:05 +0000 (UTC)
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
X-Inumbo-ID: 3524588f-7a10-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755287046;
	bh=L/keBw/Wcwup6Co+KZG6QZZWHxdMSKTfGUNrWhFbiQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dkD3+N5GMphFkxsnjfAm3nTS0N36kIXWp5Z53NN7insZCaCWfW1slfJlYyVBmvOI8
	 zt6zF6oK8BpGiEpcrScZWKFsUeaxsJPKz2jTgi+NNJ6crJFfNDhzE3AqL4LYMBDNMU
	 IdNUDZT37blfsbuHHM+9UljTOmGBijyGR7m7dO0h3AlG/K2VPSzkhwJb6dslxtJfl6
	 kfaHMDorZvwPcNR/XPbxnpNx3MsjjVeaijZ0/wAz9qFhgSKVtFHHZVOSEfuo/AGcPJ
	 TCOlWQzDTXy4bUWzXGvLaSE9ITiPxm76CEJjnNQL9J5XhCfxuE9LC2g9AGitxX2WSW
	 4k9De+ZCQpqPg==
Date: Fri, 15 Aug 2025 12:44:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4] misra: add deviations of MISRA C Rule 5.5
In-Reply-To: <874c914eafd42020afc2087eccf4d7a3@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2508151243480.923618@ubuntu-linux-20-04-desktop>
References: <afe942916b8a2408f575d2acda49699f74718161.1753991597.git.dmytro_prokopchuk1@epam.com> <874c914eafd42020afc2087eccf4d7a3@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Aug 2025, Nicola Vetrini wrote:
> On 2025-07-31 22:43, Dmytro Prokopchuk1 wrote:
> > MISRA C Rule 5.5 states: "Identifiers shall be distinct from macro names".
> > 
> > Update ECLAIR configuration to deviate clashes: specify the macros that
> > should be ignored. Update deviations.rst and rules.rst accordingly.
> > 
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


