Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA62A91B3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 09:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20492.46406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaxMy-0004FI-Jp; Fri, 06 Nov 2020 08:45:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20492.46406; Fri, 06 Nov 2020 08:45:16 +0000
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
	id 1kaxMy-0004Et-GQ; Fri, 06 Nov 2020 08:45:16 +0000
Received: by outflank-mailman (input) for mailman id 20492;
 Fri, 06 Nov 2020 08:45:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kaxMw-0004Eo-W9
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:45:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15b3ac57-217e-474e-b29f-6274760d4f07;
 Fri, 06 Nov 2020 08:45:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaxMq-0005rz-VL; Fri, 06 Nov 2020 08:45:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kaxMq-00061j-OA; Fri, 06 Nov 2020 08:45:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l/Pr=EM=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kaxMw-0004Eo-W9
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 08:45:15 +0000
X-Inumbo-ID: 15b3ac57-217e-474e-b29f-6274760d4f07
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15b3ac57-217e-474e-b29f-6274760d4f07;
	Fri, 06 Nov 2020 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=jqH4sJLnfwsBMK4hFoqRfpFxqVIa//ygpS4sFstvk4s=; b=h98u+dSL4FufsO3vh3H5ipBO0U
	VUzVkPbNap5sBIvucxL9jKCMogjXIyHRAcTlkoVSziVmm8O42eX3RNRucVwALRUfCU2JJMrTnpsXP
	xrulYbBbKYqYfWDdjdFaqy69KyM0gg7FruzdoJfhbmeo87Nj52xK1HvJ20orrDvKoSWE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaxMq-0005rz-VL; Fri, 06 Nov 2020 08:45:08 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kaxMq-00061j-OA; Fri, 06 Nov 2020 08:45:08 +0000
Subject: Re: preparations for 4.14.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6b67e93b-1dff-ff31-457d-400cf33cd4b6@xen.org>
Date: Fri, 6 Nov 2020 08:45:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/11/2020 10:12, Jan Beulich wrote:
> All,

Hi Jan,


> the release is due in a couple of weeks time. Please point out
> backports you find missing from the respective staging branch,
> but which you consider relevant. (Ian: Please double check
> there are indeed no tools side backports needed here.)

Would it be possible to consider the backport mentioned [1]? For 
convenience, this is:

d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"

In addition, I would like to request a backport for:

fff1b7f50e75 "libxl: fix -Werror=stringop-truncation in
libxl__prepare_sockaddr_un"

Both patches are necessary to get Xen building with newer GCC.

> 
> Julien, Stefano, on the Arm side I'd like to ask for
> 
> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
> 
> just like I did when sending the respective 4.13.2 / 4.12.4
> mail. Is there a particular reason it wasn't put in?
> 
> Jan
> 

Cheers,

[1] <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>

-- 
Julien Grall

