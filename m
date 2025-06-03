Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B49ACCAEB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004652.1384370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMU6Y-0005nv-EC; Tue, 03 Jun 2025 16:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004652.1384370; Tue, 03 Jun 2025 16:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMU6Y-0005lB-BO; Tue, 03 Jun 2025 16:03:10 +0000
Received: by outflank-mailman (input) for mailman id 1004652;
 Tue, 03 Jun 2025 16:03:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMU6X-0005l5-5A
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:03:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMU6W-000Gzj-2l;
 Tue, 03 Jun 2025 16:03:08 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMU6W-006EQw-2w;
 Tue, 03 Jun 2025 16:03:08 +0000
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
	bh=pisaKtL3MIeruJOLIMwS+fjY5pQV6SvYfczT5BZv9i8=; b=qUQwvCiWihEVxjQOYDCpgN3kRI
	zMaBoDVZ59AqRrKRPhwqMTD3gn5FRWQK4oyrxu6WRMy3eea42GN3gbtxXpJl/8tfINq943XOm24VD
	4l/phc+FKJlwM9A9qI5W+5cZlsJb0vgiHDipfYBzfNVSBn+2vljVQhZpskGo68RezwQw=;
Date: Tue, 3 Jun 2025 18:03:06 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 6/9] CI: Upload junit result as artefact
Message-ID: <aD8cuiPrWjo_GGIK@l14>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-7-anthony@xenproject.org>
 <30007ef7-9576-41fb-8d4d-08ae7cbdacc4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30007ef7-9576-41fb-8d4d-08ae7cbdacc4@citrix.com>

On Tue, Jun 03, 2025 at 02:13:59PM +0100, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> > From: Anthony PERARD <anthony.perard@vates.tech>
> >
> > This allow to investigate the file in cases of error. Not all
> > jobs that extend ".adl-x86-64" are creating a "tests-junit.xml" but
> > Gitlab only produce a warning when the file isn't found.
> 
> I'm not sure what you're trying to say here.

I guess I can shorten the message to (with some rewording):
    "This allows to investigate the junit file in cases of parse error."

I guess it doesn't matter if a gitlab job is expected to produce
"tests-junit.xml" or not.

Thanks,

-- 
Anthony PERARD

