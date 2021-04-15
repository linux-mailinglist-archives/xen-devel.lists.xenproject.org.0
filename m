Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E836064A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:55:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110997.212135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyi6-00036C-GX; Thu, 15 Apr 2021 09:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110997.212135; Thu, 15 Apr 2021 09:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyi6-00035n-DL; Thu, 15 Apr 2021 09:54:54 +0000
Received: by outflank-mailman (input) for mailman id 110997;
 Thu, 15 Apr 2021 09:54:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyi5-00035h-D2
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:54:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad353301-eb3d-4cd8-8ec9-15f377c0ad37;
 Thu, 15 Apr 2021 09:54:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00926AC6E;
 Thu, 15 Apr 2021 09:54:51 +0000 (UTC)
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
X-Inumbo-ID: ad353301-eb3d-4cd8-8ec9-15f377c0ad37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618480492; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghAjuzN7t+Osm3igbv0deLUXN/vrvvOvgrdVz/kYnLQ=;
	b=c5Fm/Ut/vQZ2zxCWaBPhDUbSvv2qd6VPIBYugHnVvg9jLA9YUQ9DicU+w57I6IjZS3LvR9
	S+rFXfFVu4WAwFafImUO+lb1QhOf3Ua2nMl8AlCR84bYcMnkv9nsclLKSah1cvNRKd59ZQ
	BzjKk3BTTFt9Oe1f+u/sCR10cf9niyE=
Subject: Ping: [PATCH v4 0/3] x86/time: calibration rendezvous adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Message-ID: <4823d7ff-ad6e-979a-914a-3aa438d57a5c@suse.com>
Date: Thu, 15 Apr 2021 11:54:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 11:53, Jan Beulich wrote:
> The first patch was, under a different title and with a different
> approach, already part of the prior series of the same subject.
> The other two patches are new, resulting from me spotting further
> room for improvement (or so I hope).
> 
> 1: latch to-be-written TSC value early in rendezvous loop
> 2: yield to hyperthreads after updating TSC during rendezvous
> 3: avoid reading the platform timer in rendezvous functions

Ping?

Jan

