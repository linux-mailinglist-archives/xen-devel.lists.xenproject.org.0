Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF37C904B
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 00:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616910.959239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrQh4-0001Bw-1k; Fri, 13 Oct 2023 22:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616910.959239; Fri, 13 Oct 2023 22:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrQh3-00019y-VQ; Fri, 13 Oct 2023 22:31:41 +0000
Received: by outflank-mailman (input) for mailman id 616910;
 Fri, 13 Oct 2023 22:31:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4sWS=F3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qrQh2-00019s-71
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 22:31:40 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45edc430-6a18-11ee-98d4-6d05b1d4d9a1;
 Sat, 14 Oct 2023 00:31:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A4A2DB82C43;
 Fri, 13 Oct 2023 22:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51156C433C8;
 Fri, 13 Oct 2023 22:31:35 +0000 (UTC)
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
X-Inumbo-ID: 45edc430-6a18-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697236297;
	bh=yZ/D+SBuf6S/p2ilda8uRAjrp6VYuqFTgsy8KGi5nhs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PIRv2IL4pYnhyW/9xVrANLNBjEdkfVOC/vfU/6GRbKWqkntBUhH+qr4Mn5AvR+1Jy
	 v7utky4fXKurxveoNiz5lEGpQ/DrD+PZk9405TUvIgMKYRzEvcp3z/cAz+I5xH0paw
	 WLCkQslFOJ9I9nZyE9AurPJon1M3k0XwnS7O611bn4x8AYoOuWBQCKVoMCgem0IDQH
	 o6Ih7smR+Obs+Q4x6f+4oBETK0EBSC9u0GM0bozQqkpkCy3+LayDviUleDKsDQ1CvO
	 pvEmm5PqbeS1U6jf6owSQS8bV7grDO8M0b/3b/H1/MrMWtXH0bI7N5NY1qvUcaMV36
	 Mt8TY1E/HCRqw==
Date: Fri, 13 Oct 2023 15:31:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v3 2/2] docs/misra: add deviations.rst to document
 additional deviations.
In-Reply-To: <36464fe1db154454548d19bf437a7838e519512a.1697191850.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310131531270.965337@ubuntu-linux-20-04-desktop>
References: <cover.1697191850.git.nicola.vetrini@bugseng.com> <36464fe1db154454548d19bf437a7838e519512a.1697191850.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Oct 2023, Nicola Vetrini wrote:
> This file contains the deviation that are not marked by
> a deviation comment, as specified in
> docs/misra/documenting-violations.rst.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

