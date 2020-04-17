Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29C1ADC6E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 13:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPPRN-000266-Ax; Fri, 17 Apr 2020 11:45:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+QBT=6B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1jPPRL-000261-QW
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 11:45:47 +0000
X-Inumbo-ID: fa5fa034-80a0-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa5fa034-80a0-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=nhJoQhBdS+eHcmpfuySjaJ1ecM/XbFb2B9gH6k6ftF8=; b=BhJU5kpev6cGZB9Hr3lnQlbUiU
 QdgcKKsSDdVTFBONqDPcfmpIV57sNDsiOIQbINPXs9UX00Hd0zNtTIEqVwwSOQWlCBoRFcvqdPBCt
 PjhoYBkM1R3FEl1nFdvTqXSkwehnBCprFruHG5dg+tiVtewV+3BKJHDGvBiABoVrgQjI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPPRK-0004up-L5; Fri, 17 Apr 2020 11:45:46 +0000
Received: from 44.142.6.51.dyn.plus.net ([51.6.142.44] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jPPRK-0002g6-Bu; Fri, 17 Apr 2020 11:45:46 +0000
Date: Fri, 17 Apr 2020 12:45:43 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/pv: Delete CONFIG_PV_LDT_PAGING
Message-ID: <20200417114543.rofpi53qdg3gcsm2@debian>
References: <20200417113423.19057-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113423.19057-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Apr 17, 2020 at 12:34:23PM +0100, Andrew Cooper wrote:
> ... in accordance with the timeline layed out in the Kconfig message.  There
> has been no comment since it was disabled by default.

layed -> laid

Code looks good to me:

Reviewed-by: Wei Liu <wl@xen.org>

