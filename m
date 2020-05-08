Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0F1CAA6D
	for <lists+xen-devel@lfdr.de>; Fri,  8 May 2020 14:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jX1yX-0000ej-9x; Fri, 08 May 2020 12:19:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nu4B=6W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jX1yW-0000ee-CH
 for xen-devel@lists.xenproject.org; Fri, 08 May 2020 12:19:32 +0000
X-Inumbo-ID: 2b767932-9126-11ea-9fe3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b767932-9126-11ea-9fe3-12813bfff9fa;
 Fri, 08 May 2020 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9qzjDPmPt7faBUrRFNEd9DTpu6660M2T8Wn5nIMWlrU=; b=emYcw3Jh/e/FDlp3Wf1HQRnqLE
 3OTCP0UHbOls/55yGtwvaNnbBNNls3Ql6MpUGIpK1b9n+94uwEZkxDxISxyvtzeFI7dg2WRaWyamR
 2VI1rMcNcAOiufO49NzDFz9ptKRTwbI8fnYAo//+UnGJvfoXxbNt4bjJG7wUELwfgKCU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jX1yR-0007YC-PR; Fri, 08 May 2020 12:19:27 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jX1yR-00056U-IM; Fri, 08 May 2020 12:19:27 +0000
Subject: Re: Xen Coding style
To: Jan Beulich <jbeulich@suse.com>
References: <ad26bbdc-5209-ce0c-7956-f8b08e6c2492@amazon.com>
 <8771c424-6340-10e5-1c1f-d72271ab8c1b@suse.com>
 <38926d4e-3429-58bc-f43c-514aed253a8e@xen.org>
 <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <63d1ceac-81bb-c916-d403-6f227b4d0ea8@xen.org>
Date: Fri, 8 May 2020 13:19:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3b55f045-c6a0-af62-c607-3a85d38cea25@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>,
 "committers@xenproject.org" <committers@xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 08/05/2020 12:20, Jan Beulich wrote:
> On 08.05.2020 12:00, Julien Grall wrote:
>> You seem to be the maintainer with the most unwritten rules. Would
>> you mind to have a try at writing a coding style based on it?
> 
> On the basis that even small, single aspect patches to CODING_STYLE
> have been ignored [1],

Your thread is one of the example why I started this thread. Agreeing on 
specific rule doesn't work because it either result to bikesheding or 
there is not enough interest to review rule by rule.

> I don't think this would be a good use of my
> time.

I would have assumed that the current situation (i.e 
nitpicking/bikeshedding on the ML) is not a good use of your time :).

I would be happy to put some effort to help getting the coding style 
right, however I believe focusing on an overall coding style would value 
everyone's time better than a rule by rule discussion.

> If I was promised (reasonable) feedback, I could take what I
> have and try to add at least a few more things based on what I find
> myself commenting on more frequently. But really I'd prefer it to
> be done the other way around - for people to look at the patches
> already sent, and for me to only subsequently send more. After all,
> if already those adjustments are controversial, I don't think we
> could settle on others.
While I understand this requires another investment from your part, I am 
afraid it is going to be painful for someone else to go through all the 
existing coding style bikeshedding and infer your unwritten rules.

It might be more beneficial for that person to pursue the work done by 
Tamas and Viktor in the past (see my previous e-mail). This may mean to 
adopt an existing coding style (BSD) and then tweak it.

Cheers,

-- 
Julien Grall

