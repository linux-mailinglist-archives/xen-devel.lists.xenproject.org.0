Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F42C11A4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 18:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34901.66184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khFPw-0003X8-8U; Mon, 23 Nov 2020 17:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34901.66184; Mon, 23 Nov 2020 17:14:20 +0000
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
	id 1khFPw-0003Wi-4w; Mon, 23 Nov 2020 17:14:20 +0000
Received: by outflank-mailman (input) for mailman id 34901;
 Mon, 23 Nov 2020 17:14:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khFPu-0003Wc-8z
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:14:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khFPs-0005vF-Sn; Mon, 23 Nov 2020 17:14:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khFPs-0006Xa-Mt; Mon, 23 Nov 2020 17:14:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFPu-0003Wc-8z
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 17:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=sDQ1P3GMiyM1/UNVRYUxlXFHl7wGylJrDOUJKtg10Co=; b=W+gkknvNm70lhnAkWGMcmSPrfD
	QJiuqYqL62ycnRJxOyYSzqMwBcLtfoB0m40PGdSxoaCxR/vYSnNMZBvHGnu9Ne53p3TPZbFtpn2qh
	MQZR9i64gATiE1Gdrk99GFiQHuL71rHzrExFss4VvfDJq8Z9isMag2n+HVOEa7d2r00E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFPs-0005vF-Sn; Mon, 23 Nov 2020 17:14:16 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khFPs-0006Xa-Mt; Mon, 23 Nov 2020 17:14:16 +0000
Subject: Re: [PATCH] MAINTINERS: Propose Ian Jackson as new release manager
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>
References: <20201123160400.1273386-1-george.dunlap@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4aa1cc9b-ca25-e72a-21b2-35fcb661d66d@xen.org>
Date: Mon, 23 Nov 2020 17:14:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123160400.1273386-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi George,

NIT: s/MAINTINERS/MAINTAINERS/

On 23/11/2020 16:04, George Dunlap wrote:
> Ian Jackson has agreed to be the release manager for 4.15.  Signify
> this by giving him maintainership over CHANGELOG.md.
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

