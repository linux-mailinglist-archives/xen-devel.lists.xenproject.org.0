Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7E2238C2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 11:55:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwN4V-00078P-CC; Fri, 17 Jul 2020 09:54:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Bgo=A4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jwN4T-00078K-TA
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 09:54:25 +0000
X-Inumbo-ID: 7ea04a6a-c813-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ea04a6a-c813-11ea-b7bb-bc764e2007e4;
 Fri, 17 Jul 2020 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594979665;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=fI81c/8hwVQWBLLk8cS0glHAIbt+oZbJtZK0qW4qzuQ=;
 b=GE4SXnsZJtOxfIQAzmwafGjY5kzUbpu2mpEkdJ9SirPZqJuP20OeQYUY
 xxosrk+hdb4YAd59m7raoXkzb83uie5VmsPAm7xlB+TpVP7mJ8VAA23DM
 cjiwqfBiA2TTh1jLwYm1/Z801MLEe2yl9lI5UK/ToFHWydxt3mIw+SamE A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: JgVqh6+/0rrA4OrAXwNdi68JopV9V6p52OnTzLJcXw/55EvOhC8pPjfS5QVrzCapLG7/FdM5HI
 JuYsOWInvrC4LHuY43JLExFm1T2FwGoUUlOF4YvOtylodGu4v1ByzIyE/0xMZ3bqOnnA2+3bwW
 Bwgy2GzHz0W9+eBZRkhQ4E9aged/gJl05xrnrtbzWDIKbxRZNWbH8K/Y2yMBXcIiFONT5VRVyI
 C01J17bWlibUaC7F/RKqECE/CfWJ3RcoRBv/VMGflIlCg2tpBEAVVwNKoas0TqAUwXabpAKEBw
 xMs=
X-SBRS: 2.7
X-MesageID: 22922260
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,362,1589256000"; d="scan'208";a="22922260"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24337.30027.196236.23948@mariner.uk.xensource.com>
Date: Fri, 17 Jul 2020 10:54:19 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [osstest PATCH] Revert "make-flight: Temporarily disable flaky
 test"
In-Reply-To: <20200716153424.40953-1-roger.pau@citrix.com>
References: <20200716153424.40953-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[osstest PATCH] Revert "make-flight: Temporarily disable flaky test""):
> This reverts commit c436ff754810c15e4d2a434257d1d07498883acb.
> 
> Now that XSA-321 has been released we can try to enable PVH dom0
> tests again.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

And pushed, thanks.

Ian.

