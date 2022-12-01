Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB463F3A3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450847.708332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lLU-0005Xd-GK; Thu, 01 Dec 2022 15:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450847.708332; Thu, 01 Dec 2022 15:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lLU-0005V4-Dh; Thu, 01 Dec 2022 15:19:28 +0000
Received: by outflank-mailman (input) for mailman id 450847;
 Thu, 01 Dec 2022 15:19:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0lLT-0005Uw-12
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:19:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0lLS-0003uA-9C; Thu, 01 Dec 2022 15:19:26 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0lLS-0004Xv-2g; Thu, 01 Dec 2022 15:19:26 +0000
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
	bh=4tu7NnPPDRtm4z5dpg9wrHky5IL5QJxBrNBUWD3YSCo=; b=bm0xy9HmWNRnckBKoxT8MYCHvD
	F/Sz5fmoO1GK1EdVysoNREIsAWy01kkoHVk7ZzhQwlfC9IVsq1gRr/BdKZJQc+MkjuGjv7aOrQHgD
	pCzR1KOnWsyMWG/6HzPvPix5mRaBpI/GJL8BYMzrQDSFpC6c25yhsivEnRSF5gYBaqbA=;
Message-ID: <1f3d3a05-fe11-b156-da93-03913be687de@xen.org>
Date: Thu, 1 Dec 2022 15:19:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: preparations for 4.16.3
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2c4c605e-f8c5-abbb-db85-89465b7e10a6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan & Stefano,

On 28/11/2022 10:50, Jan Beulich wrote:
> All,
> 
> the release is due in a couple of weeks time; ideally we'd get it out
> before the year end break.
> 
> Please point out backports you find missing from the respective staging
> branch, but which you consider relevant.

I have just one backport request:

db8fa01c61db0317a9ee947925226234c65d48e8 "xen/arm: Correct the p2m pool 
size calculations"

Cheers,

-- 
Julien Grall

