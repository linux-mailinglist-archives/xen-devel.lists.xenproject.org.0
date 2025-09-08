Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D82B48D74
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 14:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115176.1461891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvaxJ-0003V5-Ep; Mon, 08 Sep 2025 12:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115176.1461891; Mon, 08 Sep 2025 12:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvaxJ-0003Sr-Bj; Mon, 08 Sep 2025 12:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1115176;
 Mon, 08 Sep 2025 12:26:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uvaxH-0003Sl-Js
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 12:26:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvaxH-000499-0u;
 Mon, 08 Sep 2025 12:26:43 +0000
Received: from [2a01:cb15:80df:da00:e2a9:ff82:7bde:38cd] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uvaxH-0009sv-0l;
 Mon, 08 Sep 2025 12:26:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=BwOSZGgZjqFAteTl5Je24LHMAr0oxKtArk45OrKFtno=; b=q4ns9vVZvsir8RIgY7zewQpUUp
	2w27jMnnjjYAvMCjkOamDYnU1otxocKYZVUXPIpVsx1JcsAOHRakbXiUtO0yhAaHifKlHiE4BH2TV
	bHCvsTCpjTpjFe2k7+PPFjLb0duA4pDQKlobKlVUoM9iXrjlsSi1eIJtS00C7fb+qXOM=;
Date: Mon, 8 Sep 2025 14:26:40 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl: respect unset video_memkb for Dom0
Message-ID: <aL7LgLjPmd0OFvMd@l14>
References: <719c456b-927d-41c3-b28d-135a895958dd@suse.com>
 <01f134a0-46fb-40d8-924d-79ab864352e9@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f134a0-46fb-40d8-924d-79ab864352e9@amd.com>

On Wed, Aug 27, 2025 at 09:12:50PM -0400, Jason Andryuk wrote:
> On 2025-08-27 01:56, Jan Beulich wrote:
> > Without this, Dom0 will have have a curiously off-by-1 target_memkb
> > value displayed by "xl list -l".
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

