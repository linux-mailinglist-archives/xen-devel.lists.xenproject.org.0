Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0AB9D8E41
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 23:05:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843183.1258828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFhBX-0007dW-Is; Mon, 25 Nov 2024 22:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843183.1258828; Mon, 25 Nov 2024 22:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFhBX-0007am-Fl; Mon, 25 Nov 2024 22:03:59 +0000
Received: by outflank-mailman (input) for mailman id 843183;
 Mon, 25 Nov 2024 22:03:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tFhBW-0007ag-5w
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 22:03:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFhBV-0057FG-2C;
 Mon, 25 Nov 2024 22:03:57 +0000
Received: from [2a02:8012:3a1:0:29f6:ead8:34fc:5066]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tFhBV-00AFgP-1o;
 Mon, 25 Nov 2024 22:03:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ZyINfjGWU+EytS1THV9cIC0ENnHYLcE/T7lFtfxkE6M=; b=i419bsRvXHA2S2u4WpZ01iC3LW
	BCcwdDkWsIpeqo8zBNLBLt1PlhWmeNPZLk7K7BEAPt+po/EopXTe2xczBCvyNfsjGRjAPedK+SpuV
	5/YMfR8cujQDwm2khJNoxI9tjIJzM772rrf/lRlQmIVaPTDuhfz91WEzqVFhS1MW8/BM=;
Message-ID: <1b22f358-21c0-4d96-bd37-6336536f88a5@xen.org>
Date: Mon, 25 Nov 2024 22:03:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] page-alloc: make scrub_one_page() static
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
 <f0307505-8260-4955-86f7-95bc6f31669f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f0307505-8260-4955-86f7-95bc6f31669f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 25/11/2024 14:30, Jan Beulich wrote:
> Before starting to alter its properties, restrict the function's
> visibility. The only external user is mem-paging, which we can
> accommodate by different means.
> 
> Also move the function up in its source file, so we won't need to
> forward-declare it. Constify its parameter at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

