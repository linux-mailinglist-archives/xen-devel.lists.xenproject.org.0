Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF0E9175C2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 03:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748239.1155852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHdX-0003KQ-UP; Wed, 26 Jun 2024 01:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748239.1155852; Wed, 26 Jun 2024 01:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMHdX-0003HA-RU; Wed, 26 Jun 2024 01:39:51 +0000
Received: by outflank-mailman (input) for mailman id 748239;
 Wed, 26 Jun 2024 01:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMHdW-0003GX-4m
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 01:39:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f75db6a8-335c-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 03:39:47 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 66E7CCE1FEC;
 Wed, 26 Jun 2024 01:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DB1C32781;
 Wed, 26 Jun 2024 01:39:38 +0000 (UTC)
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
X-Inumbo-ID: f75db6a8-335c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719365980;
	bh=/QJ90yg1H84m3CnzBykG2Nzo8awodZ13WlBhB1VMhhE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LmUp55+Cppeqe12gCoWlDkyuHkQuhLYwzgFkTXQ3gNTTW1idiHxvKv9N4xrKQ5FzP
	 7wI3ddn99SxfmGWmfkq/GPvIvDALEnsAyUVUAcnPvj9Lt83+8AOwMiojiIYldLnhAy
	 LagGAVM8Ag/cQ8S2CrUxlhOB8dAd6qgLq3lUdG3OWneY94FhFoIM4/E/gHZU/gVyKm
	 Rp19J64GolH2xSV9QgY+xN9C7s7BUAE+8UlbnLBHVE2NLYKG+Xju6blNm8e2yi1TG3
	 J0q6JqA3NPFW6cpVaQlqJ9riA56dVtHq8vlHjl5XGXBtQ8dgFfD3AAtvOJ/ogW4ER6
	 y/IRuY9oztbag==
Date: Tue, 25 Jun 2024 18:39:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, sstabellini@kernel.org, 
    andrew.cooper3@citrix.com, julien@xen.org, michal.orzel@amd.com, 
    bertrand.marquis@arm.com, roger.pau@citrix.com
Subject: Re: [PATCH v2] docs/misra: rules for mass adoption
In-Reply-To: <1aeebff6-68f2-4135-ae5d-6c76f29f4ab0@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406251839280.3635@ubuntu-linux-20-04-desktop>
References: <20240622001422.3852207-1-stefano.stabellini@amd.com> <1aeebff6-68f2-4135-ae5d-6c76f29f4ab0@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Federico Serafini wrote:
> Hi Stefano,
> 
> On 22/06/24 02:14, Stefano Stabellini wrote:
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > This patch adds a bunch of rules to rules.rst that are uncontroversial
> > and have zero violations in Xen. As such, they have been approved for
> > adoption.
> > 
> > All the ones that regard the standard library have the link to the
> > existing footnote in the notes.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Also Rule 21.11 ("The standard header file <tgmath.h> shall not be
> used") results clean, I think it should be added within this patch.

I sent a v3 adding 21.11

