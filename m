Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E711E3ED7
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 12:18:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdt8I-0004Rq-5e; Wed, 27 May 2020 10:17:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qkut=7J=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jdt8G-0004Rl-R1
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 10:17:56 +0000
X-Inumbo-ID: 5400db18-a003-11ea-8993-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5400db18-a003-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 10:17:55 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04RAHq3K007955
 for <xen-devel@lists.xenproject.org>; Wed, 27 May 2020 12:17:54 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 8C60C2828; Wed, 27 May 2020 12:17:52 +0200 (CEST)
Date: Wed, 27 May 2020 12:17:52 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: patches for Xen 4.13
Message-ID: <20200527101752.GA3094@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]);
 Wed, 27 May 2020 12:17:54 +0200 (MEST)
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

Hello,
I got Xen 4.13 working with NetBSD. Now I'd like to get the patches back
in the Xen sources. What is the best way to submit the patches ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

