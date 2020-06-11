Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A251F68D3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 15:10:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjMy3-0007Nh-B8; Thu, 11 Jun 2020 13:10:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmH/=7Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjMy2-0007Cv-0s
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 13:10:02 +0000
X-Inumbo-ID: db1dfb5c-abe4-11ea-b51a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db1dfb5c-abe4-11ea-b51a-12813bfff9fa;
 Thu, 11 Jun 2020 13:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUvN62msFzpWs4pcQby/UhCeLE3bCKiq8E3ve1RA/VA=; b=RhsZZbZbJERinJksFOhy4m4Ozx
 Ljl/BkgJuZmjcnZ4sD8RSBQ7LlLDFW+SmxDgnO1FkcNSVg6t+GFhIT+w7kM0Im+TZ2Hm2r4gMVrVn
 MdjMuqFEPiDg72UOnkBAmc8yr+Q6+DyhpTkDBRGW1mH2UfjF9OlDN55toGfMhAosXGp4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjMxz-0004K8-Jq; Thu, 11 Jun 2020 13:09:59 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjMxz-0006KP-DH; Thu, 11 Jun 2020 13:09:59 +0000
Subject: Re: [PATCH] xen/arm: Add arm Neoverse N1 processor
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <5d99ae7a1432152e25d063c634e1e7292ab988aa.1591806668.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6f4cf5ec-8a7e-ca82-d305-d57a083af915@xen.org>
Date: Thu, 11 Jun 2020 14:09:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <5d99ae7a1432152e25d063c634e1e7292ab988aa.1591806668.git.bertrand.marquis@arm.com>
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
Cc: nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

On 11/06/2020 12:54, Bertrand Marquis wrote:
> Add MIDR and CPU part numbers for Arm Neoverse N1 processor

The MIDR and CPU part listed are only there because we need to use them 
for errata. This is not the list of processors we support :).

So I would prefer to introduce the new macro when there is an actual use 
of it.

Cheers,

-- 
Julien Grall

