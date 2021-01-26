Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148063043FE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 17:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75311.135560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RXN-0006uD-1P; Tue, 26 Jan 2021 16:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75311.135560; Tue, 26 Jan 2021 16:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RXM-0006to-US; Tue, 26 Jan 2021 16:49:52 +0000
Received: by outflank-mailman (input) for mailman id 75311;
 Tue, 26 Jan 2021 16:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BegI=G5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l4RXL-0006ti-9h
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 16:49:51 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 285a156f-c45d-40c1-9603-cf6446329104;
 Tue, 26 Jan 2021 16:49:49 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10QGngxm024498;
 Tue, 26 Jan 2021 17:49:42 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id F3F9B281D; Tue, 26 Jan 2021 17:49:41 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 285a156f-c45d-40c1-9603-cf6446329104
Date: Tue, 26 Jan 2021 17:49:41 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: handle case where vifname is not present
Message-ID: <20210126164941.GB8309@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-5-bouyer@antioche.eu.org>
 <20210115160659.hux7u7cbwktfog32@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210115160659.hux7u7cbwktfog32@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Tue, 26 Jan 2021 17:49:42 +0100 (MET)

On Fri, Jan 15, 2021 at 05:06:59PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:25PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > Some Xen version didn't set the vifname in xenstore; just build one if
> > not present.
> 
> I think the current version (what's going to become 4.15) should write
> the vifname in all cases? If not that's likely an error that we should
> fix elsewhere IMO.
> 
> Can you check whether the current version has this error present? And
> whether it affects PV or HVM guests?

Yes, in recent Xen version this doesn't seem to be needed any more.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

