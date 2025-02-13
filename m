Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B21A334D3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 02:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887048.1296620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOCB-0006pX-9Y; Thu, 13 Feb 2025 01:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887048.1296620; Thu, 13 Feb 2025 01:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOCB-0006nQ-6y; Thu, 13 Feb 2025 01:39:15 +0000
Received: by outflank-mailman (input) for mailman id 887048;
 Thu, 13 Feb 2025 01:39:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiOC9-0006nK-I8
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 01:39:13 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53439918-e9ab-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 02:39:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5039A41C41;
 Thu, 13 Feb 2025 01:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43561C4CEDF;
 Thu, 13 Feb 2025 01:39:10 +0000 (UTC)
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
X-Inumbo-ID: 53439918-e9ab-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739410750;
	bh=7VDXZERxfBhI3G9TFEImfcD1Qv2190av7xmd9creM8M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p13l0KgCCVDRZIaQwaA/0X/MmSorlKOlBoYozn7UwTUJnvQLZ8sfe/Vj2traezvYp
	 VZLras9QYfUMc3L2q2o6+niKVzj1uh/Xx+c92expXhXlrXbHFsA4La/1/N+GIFQ7kU
	 qnGYHtdZUY3hz86OiE7PeHlP0gkfrt9x9XjLIdbD1zsnLTXGkUDAF9CnsmBE/4vOn8
	 wQOP4h016a3yl+snbfSLb5Ws+KJ03iyGq+E4Xxs1Vv7yZASgtsfiYeGZlCnhuu7Dh4
	 CrjZmK+D/jYzccAzAmTVIZh91SBQOPW3OuAa43oFm25H2+4eQQq3ZkA1DQBb5VT0pP
	 LhHaTkL0e8Cdw==
Date: Wed, 12 Feb 2025 17:39:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: struct mctelem_cookie missing definition
In-Reply-To: <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop> <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1850662854-1739410750=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1850662854-1739410750=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Feb 2025, Andrew Cooper wrote:
> On 13/02/2025 1:25 am, Stefano Stabellini wrote:
> > Hi all,
> >
> > I am looking through the few remaining MISRA violations that we have
> > left.  One of them is R11.2:
> >
> > https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen/ECLAIR_normal/staging/X86_64/9118578464/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
> >
> > Specifically, mctelem_cookie_t is a pointer to incomplete type and
> > therefore COOKIE2MCTE triggers a "conversion between a pointer to an
> > incomplete type and any other type".
> >
> > mctelem_cookie_t is defined as:
> >
> > typedef struct mctelem_cookie *mctelem_cookie_t;
> >
> > I am looking through the code and I genuinely cannot find the definition
> > of struct mctelem_cookie.
> >
> > If mctelem_cookie_t is only used as a pointer, wouldn't it make more
> > sense to do:
> >
> > typedef struct mctelem_ent *mctelem_cookie_t;
> >
> > ?
> >
> > What am I missing?
> 
> Nothing.  Or perhaps the twisted thinking of the original author.
> 
> It is genuinely a pointer type (== known size) which you can't deference
> (because there is no definition), and can only operate on by casting to
> an integer.  Except the code also requires it to be a uint64_t which is
> why there's some fun disabling of relevant hypercalls for compat guests.
> 
> If someone could find the time to file it in /dev/null and replace it
> with literally anything else, I'd be very thankful.

Are you OK with typedefing mctelem_cookie_t to uint64_t instead?
--8323329-1850662854-1739410750=:619090--

