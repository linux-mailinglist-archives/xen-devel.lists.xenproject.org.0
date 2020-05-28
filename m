Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8454E1E5BAC
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:18:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeEf8-0002sr-Or; Thu, 28 May 2020 09:17:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeEf6-0002sm-Um
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:17:17 +0000
X-Inumbo-ID: 05e4e08e-a0c4-11ea-a7a8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05e4e08e-a0c4-11ea-a7a8-12813bfff9fa;
 Thu, 28 May 2020 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Z0tasWUn/B4MzE6fZiFjnf1JiK67V7eieVP2LkyCkM=; b=zS07+VJJSmLYUNobIG8kv8V6x0
 maBN6XPUEf1ZUcbZzf4MWCWL4+FkhCXU0OItYlubgAOZnTgPcFhlPPdCiUPW2Tqo96A95Jw+FJjQR
 OMwrQwIcQXnUnhrthf4Mb+HK/wFs0+3d9EplDBGEUTZms00qcibzieYYpleUc/FEi+Yk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeEf2-0007Mf-9X; Thu, 28 May 2020 09:17:12 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeEf2-00065Q-2S; Thu, 28 May 2020 09:17:12 +0000
Subject: Re: [PATCH v6 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200527173407.1398-1-paul@xen.org>
 <20200527173407.1398-5-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <27717a17-560d-a804-39c2-93bbc3c85009@xen.org>
Date: Thu, 28 May 2020 10:17:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200527173407.1398-5-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 27/05/2020 18:34, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and update xen-domctx to dump some information describing the record.
> 
> NOTE: The domain may or may not be using the embedded vcpu_info array so
>        ultimately separate context records will be added for vcpu_info when
>        this becomes necessary.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

