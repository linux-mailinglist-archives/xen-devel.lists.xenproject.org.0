Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7F11DB172
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 13:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMpj-0000Jp-Le; Wed, 20 May 2020 11:24:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rB2F=7C=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbMpi-0000Jk-UY
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:24:22 +0000
X-Inumbo-ID: 74443f54-9a8c-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74443f54-9a8c-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jL40Ufp1XIfYCFNcE6i0/bw407ND1pBiZ7ZeS+1PF90=; b=m9kMUv/IzqkbQE0gO8seBwDgL7
 OWI9Fi8tOL6hV8nINN7ziHZUoTklZvoYQ+u0vqTSr4/x9IrDrFZmG4dpMi8gCQ791pyXdyG6uJbjz
 /BFZb17Zsn0SvQ3Ptlk9BDEAiCL6onqdcqRddVhw2ya2pti+cWqjbNuEJNMWhYP9C2Ns=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbMpi-0007zj-9j; Wed, 20 May 2020 11:24:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbMpi-0001FI-3p; Wed, 20 May 2020 11:24:22 +0000
Subject: Re: [OSSTEST PATCH 21/38] buster: Extend ARM clock workaround
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-22-ian.jackson@eu.citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <09efa8af-2fc7-f166-3cd5-1da4c5c10ca2@xen.org>
Date: Wed, 20 May 2020 12:24:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519190230.29519-22-ian.jackson@eu.citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 19/05/2020 20:02, Ian Jackson wrote:
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

