Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5A1D68BE
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 18:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaLnb-0003pK-AA; Sun, 17 May 2020 16:05:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LWv/=67=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jaLnZ-0003pF-36
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 16:05:57 +0000
X-Inumbo-ID: 4a711a2a-9858-11ea-9887-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a711a2a-9858-11ea-9887-bc764e2007e4;
 Sun, 17 May 2020 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aracTdkUOGAum0JzZngocn0rsggXfItohclySS5ODlk=; b=K9sw9zGDYs8Vwl2ATe6njP+Ju2
 UwdA7/Phv9KI74jSRvIOwyJfFAGhL5ypQjXtEV+JqKgjvLTMOtg7vaGTekrJSF5Rj4eFfn0HOF7Sq
 miF1SqUhTXVwzTkWMl/XzfhvSrrboBCx6DTwW95ImmVkm42aqJZspYIvDXbuqCm9UPCY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jaLnY-0003aH-0q; Sun, 17 May 2020 16:05:56 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jaLnX-00063A-KD; Sun, 17 May 2020 16:05:55 +0000
Message-ID: <b73dbed41e83ee08b9ac6694a8fba76c512d2c93.camel@xen.org>
Subject: Re: RoCE adapters and Xen.
From: Hongyan Xia <hx242@xen.org>
To: "hack3rcon@yahoo.com" <hack3rcon@yahoo.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Date: Sun, 17 May 2020 17:05:48 +0100
In-Reply-To: <1478987168.271548.1589721329818@mail.yahoo.com>
References: <1478987168.271548.1589721329818.ref@mail.yahoo.com>
 <1478987168.271548.1589721329818@mail.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 2020-05-17 at 13:15 +0000, Jason Long wrote:
> Hello,
> The Xen hypervisor doesn't support the RoCE adapters? The Oracle
> migrates to the KVM because of it.
> Why not add this feature?

I am curious. Aren't RoCE adapters just PCIe devices? If things are set
up correctly and drivers are present, I don't think Xen has any problem
supporting them.

Do you have any reference that Oracle migrates to KVM *because* Xen
cannot support RoCE? Or is it simply that Oracle is migrating to KVM in
general?

I haven't worked on RoCE before so I could be wrong.

Hongyan


