Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7130DB0F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 14:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80929.148486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7I9V-0006EQ-G6; Wed, 03 Feb 2021 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80929.148486; Wed, 03 Feb 2021 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7I9V-0006E1-Cb; Wed, 03 Feb 2021 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 80929;
 Wed, 03 Feb 2021 13:24:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7I9T-0006Dw-II
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 13:24:59 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c2c5866-c55f-4a6e-8a4c-e17a0f47a6bc;
 Wed, 03 Feb 2021 13:24:58 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113DOv1L003985;
 Wed, 3 Feb 2021 14:24:57 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 57267281D; Wed,  3 Feb 2021 14:24:57 +0100 (CET)
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
X-Inumbo-ID: 7c2c5866-c55f-4a6e-8a4c-e17a0f47a6bc
Date: Wed, 3 Feb 2021 14:24:57 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203132457.GA3237@antioche.eu.org>
References: <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
 <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
 <20210203123312.GA2906@antioche.eu.org>
 <25ba02f1-ec03-3bdd-b378-946889271969@suse.com>
 <20210203124726.GA3034@antioche.eu.org>
 <411aa7b7-3006-61ce-e2e2-9b9d51658b99@suse.com>
 <20210203130321.GA2579@antioche.eu.org>
 <cb9d1b06-9777-73a7-fdbc-c25ffe45d8dd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb9d1b06-9777-73a7-fdbc-c25ffe45d8dd@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Wed, 03 Feb 2021 14:24:57 +0100 (MET)

On Wed, Feb 03, 2021 at 02:11:43PM +0100, Jürgen Groß wrote:
> Not using git on a daily basis I really suggest to use stgit as an
> add.on:
> 
> https://wiki.xenproject.org/wiki/Managing_Xen_Patches_with_StGit
> 
> It makes handling multiple iterations of a patch rather easy.

thanks. When I started, I looked at the wiki for instructions about
patches, but didn't find any ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

