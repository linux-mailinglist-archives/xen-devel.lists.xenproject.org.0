Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81E4DD665
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 09:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291944.495842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8FR-00032X-SB; Fri, 18 Mar 2022 08:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291944.495842; Fri, 18 Mar 2022 08:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV8FR-00030c-Nl; Fri, 18 Mar 2022 08:46:13 +0000
Received: by outflank-mailman (input) for mailman id 291944;
 Fri, 18 Mar 2022 08:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XSx1=T5=kernel.org=sj@srs-se1.protection.inumbo.net>)
 id 1nV8FQ-00030A-28
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 08:46:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d897220b-a697-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 09:46:04 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3FA5AB8219B;
 Fri, 18 Mar 2022 08:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80E1CC340E8;
 Fri, 18 Mar 2022 08:46:02 +0000 (UTC)
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
X-Inumbo-ID: d897220b-a697-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647593163;
	bh=cWhrXvFTgU1ErDA0SpUZ0GqSHdi4e6cPHYhyBk/nnAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:From;
	b=HkXAvEqfjW4y0Y9d10Fm4nJh6Pv3kZ8onmNVtoAG8zSMpgyvzOt6E7Fgs5YxQJqS3
	 0XtvCnUHrkgMONiKPca6DtFwKeRQakIjCyd1GCsuegsW7PQ+M8SBPEyL+AkoJPuQdH
	 B6YmSxSv7sjvV7DEAuFOYNK/MG6S4OcPZYZd0d+nTonhf+p6R9tdbWJjqXxOkmQ2iq
	 Ygzrb8BI2DpKiEgNQIRbrKdizN5pJdWX5jomUS+McL2C57j5YsMTjJM2x+9611/8cR
	 FyE7OYSlDsizFzz48RExcbrO2SOJvU/3HU2d1C0LWGQFzwqn7px0SCEcYSUJ+L6toI
	 9TaFGP1cKtlGA==
From: sj@kernel.org
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com,
	jgross@suse.com,
	mheyne@amazon.de,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen-blk{back,front}: Update contact points for buffer_squeeze_duration_ms and feature_persistent
Date: Fri, 18 Mar 2022 08:46:00 +0000
Message-Id: <20220318084600.26243-1-sj@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301144628.2858-1-sj@kernel.org>

Hi Roger and Juergen,


May I ask your opinions to this patch, please?


Thanks,
SJ

On Tue, 1 Mar 2022 14:46:28 +0000 SeongJae Park <sj@kernel.org> wrote:

> SeongJae is currently listed as a contact point for some blk{back,front}
> features, but he will not work for XEN for a while.  This commit
> therefore updates the contact point to his colleague, Maximilian, who is
> understanding the context and actively working with the features now.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>
> ---
>  Documentation/ABI/testing/sysfs-driver-xen-blkback  | 4 ++--
>  Documentation/ABI/testing/sysfs-driver-xen-blkfront | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> index a74dfe52dd76..7faf719af165 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> @@ -29,7 +29,7 @@ Description:
>  What:           /sys/module/xen_blkback/parameters/buffer_squeeze_duration_ms
>  Date:           December 2019
>  KernelVersion:  5.6
> -Contact:        SeongJae Park <sj@kernel.org>
> +Contact:        Maximilian Heyne <mheyne@amazon.de>
>  Description:
>                  When memory pressure is reported to blkback this option
>                  controls the duration in milliseconds that blkback will not
> @@ -39,7 +39,7 @@ Description:
>  What:           /sys/module/xen_blkback/parameters/feature_persistent
>  Date:           September 2020
>  KernelVersion:  5.10
> -Contact:        SeongJae Park <sj@kernel.org>
> +Contact:        Maximilian Heyne <mheyne@amazon.de>
>  Description:
>                  Whether to enable the persistent grants feature or not.  Note
>                  that this option only takes effect on newly created backends.
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkfront b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> index 61fd173fabfe..7f646c58832e 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkfront
> @@ -12,7 +12,7 @@ Description:
>  What:           /sys/module/xen_blkfront/parameters/feature_persistent
>  Date:           September 2020
>  KernelVersion:  5.10
> -Contact:        SeongJae Park <sj@kernel.org>
> +Contact:        Maximilian Heyne <mheyne@amazon.de>
>  Description:
>                  Whether to enable the persistent grants feature or not.  Note
>                  that this option only takes effect on newly created frontends.
> -- 
> 2.17.1

