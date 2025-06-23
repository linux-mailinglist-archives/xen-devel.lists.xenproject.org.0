Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C433AE4E65
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:57:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022759.1398606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToEA-0008Ej-IX; Mon, 23 Jun 2025 20:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022759.1398606; Mon, 23 Jun 2025 20:57:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uToEA-0008CF-Fo; Mon, 23 Jun 2025 20:57:18 +0000
Received: by outflank-mailman (input) for mailman id 1022759;
 Mon, 23 Jun 2025 20:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uToE9-0008C8-5E
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:57:17 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a22887b0-5074-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 22:57:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4CD7661549;
 Mon, 23 Jun 2025 20:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19603C4CEED;
 Mon, 23 Jun 2025 20:57:09 +0000 (UTC)
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
X-Inumbo-ID: a22887b0-5074-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750712231;
	bh=XRmvCv4E2+eRUFPw+yjBMhAhnb630wPHTMDalSv+ol8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Orv18A4RdReAZrWtzVBVium265dkfKE8cNyKrYSHsrbOLjhAGCcFRLQO3Nk20EhnT
	 JgMYQnPwpS/g7jsA06DQ6UivLjEsJMkKR5QnjTzTa4hVDiFI4xQmjq6S9TCRy3gET2
	 7TMVYighVXUxyON9rX4HqYDU9vTcV3ghI2CW+iSv1V3YV2p/KH9C7G43y4Iut8vZye
	 z6a5i7KpGV0OiRC/6Vj1udHmIpr65OOYLiczN8x/lk6KbNDcy8HC4mnLv9+Bba9au9
	 1O0EeBXKNLdgqeh8/4HsNIfhnekaMKpKZo7W3jah2MA3oQ2wiYl22pC+TovObBImvf
	 ID+4L/scx6EKw==
Date: Mon, 23 Jun 2025 13:57:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 3/6] CI: upload tests-junit.xml as a normal artifact
 too
In-Reply-To: <84bdfa33c8382080bb78fbf3a0b46e4dfd6b9187.1750686195.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2506231356580.8066@ubuntu-linux-20-04-desktop>
References: <cover.16ccd290bf95e314a4f23777f5564b3aa2417e57.1750686195.git-series.marmarek@invisiblethingslab.com> <84bdfa33c8382080bb78fbf3a0b46e4dfd6b9187.1750686195.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1020017787-1750712230=:8066"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1020017787-1750712230=:8066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Jun 2025, Marek Marczykowski-Górecki wrote:
> This allows checking the file if gitlab can't parse it for some reason.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/gitlab-ci/test.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index a9d871cf72ad..dc08488e76f4 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -155,6 +155,7 @@
>      paths:
>        - smoke.serial
>        - '*.log'
> +      - tests-junit.xml
>      when: always
>    rules:
>      - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
> -- 
> git-series 0.9.1
> 
--8323329-1020017787-1750712230=:8066--

