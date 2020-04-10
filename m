Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C371A44EA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 12:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMqUQ-0006y7-Dk; Fri, 10 Apr 2020 10:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aV0t=52=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMqUO-0006y2-MN
 for xen-devel@lists.xen.org; Fri, 10 Apr 2020 10:02:20 +0000
X-Inumbo-ID: 5da6f8de-7b12-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5da6f8de-7b12-11ea-b4f4-bc764e2007e4;
 Fri, 10 Apr 2020 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b5m7xqWitjr7zEwfWpyeTn6OUrRAcNRFol6uLJeYYIw=; b=T0J37rmM3ZunVhJg1vVa+1Akqd
 /r1dcRHTig+wiozuoH+g1eObfSrmMWotoc3gnygwZIpema215RTgZIBw1Y6ZjIawzJ7Xm5ooOV/aE
 hdOkKz4jfBv4tv9KSKgZQ9H6FnejnXu044mseNu/WU7eeNrtUfm2xGNDPG4hQcuFg69A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMqUN-00033h-Oj; Fri, 10 Apr 2020 10:02:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMqUN-0007cC-IM; Fri, 10 Apr 2020 10:02:19 +0000
Subject: Re: Make VM save/restore and VM migration work on ARM.
To: Asaf Fisher <asaffisher.dev@gmail.com>, xen-devel@lists.xen.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAHmEStvAQ0SHMYMcS4c43B9uOAU3trvsRJMVtO5CxCr+QXTD9g@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7938c6e2-f488-70eb-8d17-1b6e23f127e3@xen.org>
Date: Fri, 10 Apr 2020 11:02:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmEStvAQ0SHMYMcS4c43B9uOAU3trvsRJMVtO5CxCr+QXTD9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 01/04/2020 16:44, Asaf Fisher wrote:
> Hello!

Hello,

Apologies for the late answer.

> Just wonder if this Open Work Item is still available?
> https://wiki.xenproject.org/wiki/Xen_ARM_TODO

Yes, there was some effort in the past but this wasn't yet upstreamed. I 
can point you to the existing work if you are interested to pick-up.

Cheers,

-- 
Julien Grall

