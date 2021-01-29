Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D19330906D
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 00:04:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78567.142978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5coV-0002Tq-Sp; Fri, 29 Jan 2021 23:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78567.142978; Fri, 29 Jan 2021 23:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5coV-0002TR-PO; Fri, 29 Jan 2021 23:04:27 +0000
Received: by outflank-mailman (input) for mailman id 78567;
 Fri, 29 Jan 2021 23:04:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5coU-0002TL-FV
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 23:04:26 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43d105bc-16bd-4eeb-b5b1-e710b027a5d4;
 Fri, 29 Jan 2021 23:04:25 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TN4OTR007776;
 Sat, 30 Jan 2021 00:04:24 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 6F8F1281D; Sat, 30 Jan 2021 00:04:24 +0100 (CET)
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
X-Inumbo-ID: 43d105bc-16bd-4eeb-b5b1-e710b027a5d4
Date: Sat, 30 Jan 2021 00:04:24 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] NetBSD: use system-provided headers
Message-ID: <20210129230424.GB3543@antioche.eu.org>
References: <20210129225946.8674-1-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129225946.8674-1-bouyer@netbsd.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Sat, 30 Jan 2021 00:04:24 +0100 (MET)

Sorry I forgot to change the Subject. It should have been [PATCH v3]

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

