Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E391B7045
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:07:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRuIW-0008Fu-Tj; Fri, 24 Apr 2020 09:07:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRuIW-0008Fp-4z
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:07:00 +0000
X-Inumbo-ID: f4706db0-860a-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4706db0-860a-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfXAoTKO81O9UCNI35gltwGJGQMJmPE+twwNLoah7us=; b=Cms+xhQ7pzfkBQTBW2cDb3EpzH
 gTW3SW1LePNsY0gtPQYFA+b9t0saSojsZdvoS3rgSD878vjoA5jGezvTQHj0oit/VuXFYyP/vCSI4
 BYnI/26q2BzNLytMVWV6Mm1Ha3XWevrtnC9C70G209lCnPbXJuN22pwZdF7/bwnCX5ZI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRuIT-0003au-Sv; Fri, 24 Apr 2020 09:06:57 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRuIT-0004Kq-MX; Fri, 24 Apr 2020 09:06:57 +0000
Subject: Re: [PATCH 3/6] x86_64/mm: map and unmap page tables in
 subarch_memory_op
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1587116799.git.hongyxia@amazon.com>
 <1c88c785eb9537983a1692cc379604233ff13025.1587116799.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1fe549b7-2141-c013-61de-f7196e7ba966@xen.org>
Date: Fri, 24 Apr 2020 10:06:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1c88c785eb9537983a1692cc379604233ff13025.1587116799.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Hongyan,

On 17/04/2020 10:52, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

