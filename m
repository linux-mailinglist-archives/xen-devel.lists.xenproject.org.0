Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704B293F22
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 17:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9686.25475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUt7k-0006xH-M0; Tue, 20 Oct 2020 15:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9686.25475; Tue, 20 Oct 2020 15:00:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUt7k-0006ws-I9; Tue, 20 Oct 2020 15:00:28 +0000
Received: by outflank-mailman (input) for mailman id 9686;
 Tue, 20 Oct 2020 15:00:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUt7i-0006wn-Ad
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:00:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5df2f849-06ce-4bfd-ad9e-2d2670fcbc42;
 Tue, 20 Oct 2020 15:00:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUt7c-0005MV-El; Tue, 20 Oct 2020 15:00:20 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUt7c-0000q0-3f; Tue, 20 Oct 2020 15:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUt7i-0006wn-Ad
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 15:00:26 +0000
X-Inumbo-ID: 5df2f849-06ce-4bfd-ad9e-2d2670fcbc42
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5df2f849-06ce-4bfd-ad9e-2d2670fcbc42;
	Tue, 20 Oct 2020 15:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=pml2VH/aJBySECuBJctkn8YHzhRubM/5Ho+AdXysPyE=; b=5gBAP7h17aUashmZF0D0G6jJwt
	9WzEgi9AOcyvtcLNiY5zfzu5xQstvNrH4Q89raW3wCWx3YxGbhK6fK2UV1CieBTsaQCil5RlcMuAU
	q7MeeASZrXM/0UwPLChEqFh15eWFJBtxgU9v515yzs2eTeEdW9P/flHDtbZ09EnIuaak=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUt7c-0005MV-El; Tue, 20 Oct 2020 15:00:20 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUt7c-0000q0-3f; Tue, 20 Oct 2020 15:00:20 +0000
Subject: Re: [PATCH] IOMMU: avoid double flushing in shared page table case
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Paul Durrant <paul@xen.org>
References: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <01a5840e-3250-246c-8d38-29a65d4937ea@xen.org>
Date: Tue, 20 Oct 2020 16:00:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2020 14:52, Jan Beulich wrote:
> While the flush coalescing optimization has been helping the non-shared
> case, it has actually lead to double flushes in the shared case (which
> ought to be the more common one nowadays at least): Once from
> *_set_entry() and a second time up the call tree from wherever the
> overriding flag gets played with. In alignment with XSA-346 suppress
> flushing in this case.
> 
> Similarly avoid excessive setting of IOMMU_FLUSHF_added on the batched
> flushes: "idx" hasn't been added a new mapping for.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The Arm part really is just for completeness (and hence could also
>       be dropped) - the affected mapping spaces aren't currently
>       supported there.

As I may I have pointed out in the past, there are many ways to screw 
things up when using iommu_dont_flush_iotlb.

So I would rather not introduce any usage on Arm until we see a use-case.

Cheers,

-- 
Julien Grall

