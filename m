Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6951AA9DE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:27:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOj0k-00020w-AH; Wed, 15 Apr 2020 14:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tllG=57=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1jOj0i-00020r-Ci
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 14:27:28 +0000
X-Inumbo-ID: 39c046c0-7f25-11ea-b58d-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39c046c0-7f25-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt4s8oCvagp1tw9q1/hSGsMdGjZ24IF156aFzu1RJ44=; b=AHKCeZ5MbXUijbcpGdM8g+mv+V
 bd/vS0hrrgyq49N9j4b8675cVhMTLmAyH5esun3wsUs17+tP9OJXY4NAUT86fEauYJuGMghnqeYr1
 RFqBRJiBugzfp/WLrBUNVG+/pOwyFJA7g3srpvgVJ/TayN4EdtA/GwUvv7P6MVIaLI5s=;
Received: from [77.168.80.73] (port=40166 helo=[172.16.1.40])
 by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1jOj2d-0003DS-5q; Wed, 15 Apr 2020 16:29:27 +0200
Subject: Re: preparations for 4.13.1 and 4.12.3
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <322d98a5-e8e2-d4a5-8a95-b8033cd9f3fd@eikelenboom.it>
Date: Wed, 15 Apr 2020 16:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f8ecb6b1-00de-67c1-07c6-6fdb92dd63ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 09/04/2020 09:41, Jan Beulich wrote:
> All,
> 
> the releases are due in a week or two. Please point out backports
> you find missing from the respective staging branches, but which
> you consider relevant. (Ian, I notice there haven't been any
> tools side backports at all so far. Julien, Stefano - same for
> Arm.)
> 
> Jan

I would like to suggest for 4.13.1:

4b5b431edd984b26f43b3efc7de465f3560a949e "tools/xentop: Fix calculation
of used memory"

Thanks,

--
Sander



