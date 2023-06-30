Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CAD74419C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 19:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557607.871109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFIFp-0002ma-FY; Fri, 30 Jun 2023 17:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557607.871109; Fri, 30 Jun 2023 17:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFIFp-0002kM-Bu; Fri, 30 Jun 2023 17:49:57 +0000
Received: by outflank-mailman (input) for mailman id 557607;
 Fri, 30 Jun 2023 17:49:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qFIFn-0002kE-Vj
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 17:49:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFIFn-00054q-1x; Fri, 30 Jun 2023 17:49:55 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFIFm-0004Yd-TB; Fri, 30 Jun 2023 17:49:55 +0000
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
	bh=qvpxnpMHySuXg2ybWwFiS0h4RpDNaCqfb3MJAzzZxCc=; b=xUsz6vOBF6ul2Fp36JUGi4SiRS
	uy14c4V/Qj5Lt0rZ62NSs78jlMKH7pk28QHwynHuneiElogWA2HpHzcBpBXVgBNpplXdSD0yC5GyV
	mbQvCTouRaMEAT2qfzxOPqYoGypEqX9I1p3J4xnF4JgV/gptWXq7zVrhuyIoAKeQn8mA=;
Message-ID: <84197474-9ea0-d42a-b591-13821325cf89@xen.org>
Date: Fri, 30 Jun 2023 18:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230630113756.672607-1-george.dunlap@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230630113756.672607-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The subject stay "1/2" but I don't see any "2/2" nor cover letter. Where 
can I find the rest of the series?

Cheers,

-- 
Julien Grall

