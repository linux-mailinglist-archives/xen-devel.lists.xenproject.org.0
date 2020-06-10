Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788751F522D
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 12:24:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jixtW-0008Jy-C9; Wed, 10 Jun 2020 10:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YKF/=7X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jixtV-0008Jt-Lb
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 10:23:41 +0000
X-Inumbo-ID: 7428d560-ab04-11ea-8496-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7428d560-ab04-11ea-8496-bc764e2007e4;
 Wed, 10 Jun 2020 10:23:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sfIz4vgJgpxoxsGeTJbhYQ9KwNqkxMh9V3IgGwxb5liHXUI3yUuqmZrEB4vnxxJB6hXbcqSTxO
 Uphcri6XSB1vQcmwIooOwmFO55DSKITLiuoD5Aou+l8ItsEvhqKUkfLvhU7Py5wB62zp4xmnBv
 5aFdPRHyvL09O2yqzg2JejmOQvkDxvkcLKFTpuGxLptUrWcU6fsjfSkAa/cMWFM9VZ/Y1Sh+Pl
 sJ1Vmp0SVvhn2xKInMf4VR8OuuR/XeSLCoBiKSC7PzjJxb7zsUCA9b6yjnyihnUcTYE8UHwIPc
 v2U=
X-SBRS: 2.7
X-MesageID: 19668192
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19668192"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24288.46238.722388.438970@mariner.uk.xensource.com>
Date: Wed, 10 Jun 2020 11:23:26 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH-for-4.14 1/2] CHANGELOG: add 'domid_policy' and domid
 preservation on migrate [and 1 more messages]
In-Reply-To: <20200609162922.14679-2-paul@xen.org>,
 <20200609162922.14679-3-paul@xen.org>
References: <20200609162922.14679-1-paul@xen.org>
 <20200609162922.14679-3-paul@xen.org>	<20200609162922.14679-2-paul@xen.org>
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
Cc: Community Manager <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, security@xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> + - New 'domid_policy', allowing domain-ids to be randomly chosen.
> + - Option to preserve domain-id across migrate or save+restore.
> + - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).

These aren't mentioned in SUPPORT.md so their support status
(including security support status) is not defined.  I think this
should be fixed.

CC the security team who may have an opinion about their security
support status.

Ian.

