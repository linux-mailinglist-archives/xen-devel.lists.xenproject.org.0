Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E01D928C
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:52:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxyh-00071V-4E; Tue, 19 May 2020 08:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jaxyg-00071Q-2V
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:51:58 +0000
X-Inumbo-ID: fec1eecc-99ad-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fec1eecc-99ad-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 08:51:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63266AC22;
 Tue, 19 May 2020 08:51:59 +0000 (UTC)
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
To: Manuel Bouyer <bouyer@antioche.eu.org>
References: <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
 <20200517173259.GA7285@antioche.eu.org>
 <20200517175607.GA8793@antioche.eu.org>
 <000a01d62ce7$093b7f50$1bb27df0$@xen.org>
 <20200518173111.GA13512@antioche.eu.org>
 <cd60e91a-a4a4-d14e-eead-c93f7682413d@suse.com>
 <20200519084615.GB1782@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b3bcaf85-a37b-9fb8-a472-c8899ca800c8@suse.com>
Date: Tue, 19 May 2020 10:51:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519084615.GB1782@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, paul@xen.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 10:46, Manuel Bouyer wrote:
> Note that I'm using the 4.13.0 release sources, not the top of branch.
> Is it something that could have been fixed after the release ?

I don't recall anything, but switching to 4.13.1 would still seem like
a helpful thing for you to do.

Jan

