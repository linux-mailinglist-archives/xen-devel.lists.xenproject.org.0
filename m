Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEB0813CA0
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 22:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654746.1022037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtH6-0006tr-QC; Thu, 14 Dec 2023 21:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654746.1022037; Thu, 14 Dec 2023 21:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtH6-0006qW-Mk; Thu, 14 Dec 2023 21:29:44 +0000
Received: by outflank-mailman (input) for mailman id 654746;
 Thu, 14 Dec 2023 21:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtH5-0006qO-NR
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 21:29:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4559638-9ac7-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 22:29:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3964DB8076B;
 Thu, 14 Dec 2023 21:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9A0C433C7;
 Thu, 14 Dec 2023 21:29:39 +0000 (UTC)
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
X-Inumbo-ID: e4559638-9ac7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702589380;
	bh=G7OvJbnTg05jJWpHaAvpURoYXvWOrX3FazP3c15oqRk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y1aEUh9ALRBqZy96EZ9PnuX3cgf2cjuZg8H88Wk2S7prnpVQ0rMPw/feKkyvmD+02
	 8fOpJQM80VF43W+n6l0r7YtK/Et0JwF+yWYpwD2FW/BF7cel62+LI5XA73c7ZHPFDn
	 Wwy5R+l138gn9EVlx8zh2QjzIYb++aH82zObZWJzs7PSNaG5YTH1yAUAOt51N8IFHC
	 Qb9+6QJeIkquttzNlanXrpEY+LdYAzLZExZ6Ileb+n0k8YbryV5/d3nxUQt1pP8S/1
	 KK4xNzQ9iR4Wa5MmTIEBiywOZSY5pZaGsb73/BWoaICQhl6bTXnTk1fsGTTjXVvlWp
	 KMjV6PDWtzvjQ==
Date: Thu, 14 Dec 2023 13:29:38 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 1/5] xen/hvm: use NULL as a null pointer constant
In-Reply-To: <7c52d4b78785a56aee1ffc3661503bdd145595d9.1702553835.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141329320.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com> <7c52d4b78785a56aee1ffc3661503bdd145595d9.1702553835.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Nicola Vetrini wrote:
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

