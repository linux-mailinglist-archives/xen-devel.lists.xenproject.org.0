Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0671AA93A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 16:00:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiZz-0006bZ-6A; Wed, 15 Apr 2020 13:59:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j72F=57=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jOiZw-0006bU-UK
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:59:48 +0000
X-Inumbo-ID: 5e4c628e-7f21-11ea-8a50-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e4c628e-7f21-11ea-8a50-12813bfff9fa;
 Wed, 15 Apr 2020 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=vCaqE+Z/abmDVe5i43oLfnAU1WnM9bycARrx9VcM/vY=; b=tmmkO4/Ny3jNWojm/LEC+aV738
 MzdiwbAIpIp0TNLcDfVXFVvp9uEE0D7feHH1aSYNev5ethttLr6cXV5pZDKkC7iGQuz4vVVrgaJU+
 l6KJc3lXbPWE/mCGutQj4bNt2o0ioliErntBGpN4j9T4r73xK5jtTVsf0UggH+k5MeWU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOiZu-0004RA-EY; Wed, 15 Apr 2020 13:59:46 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jOiZu-0000iM-59; Wed, 15 Apr 2020 13:59:46 +0000
Date: Wed, 15 Apr 2020 14:59:43 +0100
From: Wei Liu <wl@xen.org>
To: Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH V1] Fix for Coverity ID: 1461759
Message-ID: <20200415135943.rx6tqgdmyflyxuqv@debian>
References: <20200415135313.12886-1-aisaila@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415135313.12886-1-aisaila@bitdefender.com>
User-Agent: NeoMutt/20180716
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 15, 2020 at 04:53:13PM +0300, Alexandru Isaila wrote:
> Signed-off-by: Alexandru Isaila <aisaila@bitdefender.com>

Thanks, but Roger already posted a fix for this.

Wei.

