Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FA772A1C1
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 20:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546267.853005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gPP-0002wN-Hq; Fri, 09 Jun 2023 18:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546267.853005; Fri, 09 Jun 2023 18:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7gPP-0002tH-ED; Fri, 09 Jun 2023 18:00:23 +0000
Received: by outflank-mailman (input) for mailman id 546267;
 Fri, 09 Jun 2023 18:00:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q7gPN-0002tB-M0
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 18:00:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gPM-00032j-TI; Fri, 09 Jun 2023 18:00:20 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.17.204]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q7gPM-0001u8-Nr; Fri, 09 Jun 2023 18:00:20 +0000
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
	bh=aXjxcn4Q8Zd5Qow0SPt6mlNBLyPM0AeGkZHrvKTcPrE=; b=6nwDzkykmjWReVsNJkfIfY+3qs
	ci1Hcx6hMe/tB5beSrCSm3ToO8wmHMXgxfEyb+ewdr6IsJYt0JOYOhni6hRCT8sJppyRDXcHFqLYC
	ZcU9iWn6I4ljkdbNTnxQ/Z9Hsb0rKS+9sFTrDDHqSQ2/ILjkkv+PeWf/5m1aw6AXXPhg=;
Message-ID: <42ab7c98-3672-13a5-8a76-fe33c4682d93@xen.org>
Date: Fri, 9 Jun 2023 19:00:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v3 05/16] tools/xenstore: make some write limit functions
 static
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530085418.5417-1-jgross@suse.com>
 <20230530085418.5417-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530085418.5417-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 09:54, Juergen Gross wrote:
> Some wrl_*() functions are only used in xenstored_domain.c, so make
> them static. In order to avoid the need of forward declarations, move
> the whole function block to the start of the file.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

