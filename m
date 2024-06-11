Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551ED904068
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738546.1145334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3iE-0002lb-3J; Tue, 11 Jun 2024 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738546.1145334; Tue, 11 Jun 2024 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3iE-0002jP-0h; Tue, 11 Jun 2024 15:47:06 +0000
Received: by outflank-mailman (input) for mailman id 738546;
 Tue, 11 Jun 2024 15:47:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOE/=NN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sH3iD-0002jJ-6k
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:47:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d881bafa-2809-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:47:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AC6760ED4;
 Tue, 11 Jun 2024 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77A1C2BD10;
 Tue, 11 Jun 2024 15:47:00 +0000 (UTC)
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
X-Inumbo-ID: d881bafa-2809-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718120821;
	bh=wwtIEU7tFR0wb8jBKgY1L9opmSWOB8Rc754j5LMe1wQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lAzCRqYrlkFHStrtCzN226EyhMSSC7BlbsT/1xMid7kcB5MLefpFjnyCEhOf8KDY8
	 EepRy2cGK0c06LXrwYLJttu423+eBh+yTrJRUOitgqqGKynoAQ9Bk8yaXLxhTxeFNE
	 b4J4Vs1oA1DjDCNsiFz4QEsLExpAwIZ8FqweTlZfYapj6Z1pBizCFdE02SuD24NCDl
	 LnQIgpK08YQs27DSd9ESBrJYu8//HVwE+QKKP/pHbDPDwltqiy/nkcgOfQjKgV6HHN
	 SMDy1CGMQu//w8ZUfWKzs/5V3nt2gVH8C17TINRtIu+V8hMABdwGzkYwCkgxBNklpq
	 AwRy5Y1ckVXKg==
Date: Tue, 11 Jun 2024 10:46:59 -0500 (CDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH for-4.19] CI: Update FreeBSD to 13.3
In-Reply-To: <ZmhKK4PcLki8EVST@macbook>
Message-ID: <alpine.DEB.2.22.394.2406111046430.1328433@ubuntu-linux-20-04-desktop>
References: <20240611124701.802752-1-andrew.cooper3@citrix.com> <ZmhKK4PcLki8EVST@macbook>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2056669113-1718120821=:1328433"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2056669113-1718120821=:1328433
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 11 Jun 2024, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 01:47:01PM +0100, Andrew Cooper wrote:
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-2056669113-1718120821=:1328433--

