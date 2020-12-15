Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCB2DA964
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 09:45:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52972.92437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp5wh-000088-K9; Tue, 15 Dec 2020 08:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52972.92437; Tue, 15 Dec 2020 08:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp5wh-00007j-Gm; Tue, 15 Dec 2020 08:44:35 +0000
Received: by outflank-mailman (input) for mailman id 52972;
 Tue, 15 Dec 2020 08:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2hg=FT=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kp5wg-00007e-MH
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 08:44:34 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fae789a-7964-4171-855c-b65bf073a094;
 Tue, 15 Dec 2020 08:44:32 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0BF8iUdu022065
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 09:44:31 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 499E22E992E; Tue, 15 Dec 2020 09:44:25 +0100 (MET)
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
X-Inumbo-ID: 7fae789a-7964-4171-855c-b65bf073a094
Date: Tue, 15 Dec 2020 09:44:25 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 14/24] Pass bridge name to qemu and set XEN_DOMAIN_ID
Message-ID: <20201215084425.GA1447@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-15-bouyer@netbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-15-bouyer@netbsd.org>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 15 Dec 2020 09:44:31 +0100 (MET)

On Mon, Dec 14, 2020 at 05:36:13PM +0100, Manuel Bouyer wrote:
> Pass bridge name to qemu
> When starting qemu, set an environnement variable XEN_DOMAIN_ID,
> to be used by qemu helper scripts

This one is not NetBSD related, I should have sent is as a separate
git mail ... I guess (i'm not familiar with git, sorry).

But I think it can be usefull for the comunity.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

