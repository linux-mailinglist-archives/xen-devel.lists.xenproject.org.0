Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8507512520
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 00:14:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315506.534059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njpuS-00053C-LB; Wed, 27 Apr 2022 22:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315506.534059; Wed, 27 Apr 2022 22:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njpuS-0004zk-Hd; Wed, 27 Apr 2022 22:13:20 +0000
Received: by outflank-mailman (input) for mailman id 315506;
 Wed, 27 Apr 2022 22:13:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1njpuQ-0004ze-GQ
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:13:18 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3caa90ca-c677-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:13:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5194B82AEA;
 Wed, 27 Apr 2022 22:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E88BC385A7;
 Wed, 27 Apr 2022 22:13:14 +0000 (UTC)
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
X-Inumbo-ID: 3caa90ca-c677-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651097594;
	bh=8HG3IGpTV0uMVUVj8HuvUnBwaKHL1eRgjtJbwsIyR/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QjIuwRYLl56Rq3cyIOIl3EiMmoOv0ujJPRXwGv9mwJYolu0csCqrkc1XUemakdHtE
	 h437uwUpgZDNTMYtiQzLdWvYt0getuBpxuFEr9QygdYUxouHLKqaPjat3PnQ4nA8Yg
	 c98bqhaZliD5zz8f5E7SFAk8HCRvnHgW1sHyFMoLC4mqsw05DAnwQRsvK1UDJGVUdt
	 U/QJnSAREr/f9ZQk/lLt5m+kUtVv1eWg/EZutNr2vc5dPyFOwb/pJlE5L+dn/75Wv7
	 78INbujsrG7gntSnuwRTou5QxNLXQIsWstZfinT+M4o6TE1yLR65Kc5WPp1sf30mW3
	 yBv+Iq0DJAQsg==
Date: Wed, 27 Apr 2022 15:13:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Roger Pau Monne <roger.pau@citrix.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] cirrus-ci: add FreeBSD 14 task
In-Reply-To: <20220427155023.84403-1-roger.pau@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2204271512360.915916@ubuntu-linux-20-04-desktop>
References: <20220427155023.84403-1-roger.pau@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2109456191-1651097594=:915916"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2109456191-1651097594=:915916
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 27 Apr 2022, Roger Pau Monne wrote:
> Introduce a task that uses a FreeBSD 14 (HEAD) snapshot.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


Roger, should you add an entry to MAINTAINERS to set yourself as
maintainer of .cirrus.yml ?


> ---
>  .cirrus.yml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 4ae719136e..c38333e736 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -24,3 +24,9 @@ task:
>    freebsd_instance:
>      image_family: freebsd-13-0
>    << : *FREEBSD_TEMPLATE
> +
> +task:
> +  name: 'FreeBSD 14'
> +  freebsd_instance:
> +    image_family: freebsd-14-0-snap
> +  << : *FREEBSD_TEMPLATE
> -- 
> 2.35.1
> 
--8323329-2109456191-1651097594=:915916--

