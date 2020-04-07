Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2288D1A0F27
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 16:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLpDS-0000UP-Bo; Tue, 07 Apr 2020 14:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jrji=5X=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jLpDR-0000UK-MK
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 14:28:37 +0000
X-Inumbo-ID: 11933314-78dc-11ea-80d4-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11933314-78dc-11ea-80d4-12813bfff9fa;
 Tue, 07 Apr 2020 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XSa4awPWjTVr+eLrRBq6LVZN76LNyL5MtqRIO6BS2hg=; b=HdPbhcGs0fO4G+FpiLcxVfhMaJ
 85hLM2pzS4T6hfVHb72hrwQgP/m4G/zrRgbWyfA9UHDCIW7zSJ553I3/1k3isT7BTaj7D6G95p4VB
 okueUvnvrGzUBshqVjMm4+8x1mfGpYPPTAWdbZlib02bJqi3Htb9vVBUaXoiIK/QNZI4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLpDQ-0004bY-04; Tue, 07 Apr 2020 14:28:36 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=freeip.amazon.com) by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jLpDP-0003nm-M0; Tue, 07 Apr 2020 14:28:35 +0000
Message-ID: <ba6260f7684f862b0e0e1892d2fd0d307134cbd3.camel@xen.org>
Subject: Re: [PATCH 0/5] use new API for Xen page tables
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Date: Tue, 07 Apr 2020 15:28:33 +0100
In-Reply-To: <0f072eca-bd34-ebb7-706f-9dc688c991ad@suse.com>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <636251f68db5e094f0c4dd5871eb4146dadb1589.camel@xen.org>
 <0f072eca-bd34-ebb7-706f-9dc688c991ad@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 2020-04-06 at 13:03 +0200, Jan Beulich wrote:
> On 06.04.2020 10:27, Hongyan Xia wrote:
> > Ping.
> 
> Does this somehow imply you didn't get my replies sent on the 1st?
> 
> Jan

Apologies. Somehow your replies ended up in a separate thread. There is
a problem with my email client.

Hongyan


