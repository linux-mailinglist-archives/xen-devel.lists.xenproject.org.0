Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC0635903
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 11:07:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447491.703765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmei-0006up-8V; Wed, 23 Nov 2022 10:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447491.703765; Wed, 23 Nov 2022 10:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxmei-0006sa-5f; Wed, 23 Nov 2022 10:07:00 +0000
Received: by outflank-mailman (input) for mailman id 447491;
 Wed, 23 Nov 2022 10:06:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxmeg-0006sS-Vf
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 10:06:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxmed-00014y-EH; Wed, 23 Nov 2022 10:06:55 +0000
Received: from [54.239.6.185] (helo=[192.168.17.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxmed-0002i0-5u; Wed, 23 Nov 2022 10:06:55 +0000
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
	bh=+tmvheOjdVs1qwz7U4EmZ3qnnhXJHpO3V/cE6DYtZJE=; b=2hiPCf0q8oToAcXajNYS8c1zfH
	SBk64oDeqmloX2WsAcrlUMRFOaOKQFr7NHEZGsywPd/WVeE9u6+nw5GEcb2TQ1z2TKCnbWf/TZJ5g
	jhpXHu19Mlb+PH7JNsF2yWHz6Af/xBckFm7FDccUtSt/8rjtX9f59psfbASFNKtFfG2Y=;
Message-ID: <cf70a3e9-288d-db2c-30c3-ffb6d62d4ade@xen.org>
Date: Wed, 23 Nov 2022 11:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/3] Changelog: Add __ro_after_init and CET
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Community Manager <community.manager@xenproject.org>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
 <20221123040315.1480112-3-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221123040315.1480112-3-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/11/2022 04:03, Henry Wang wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

