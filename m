Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D530DA89
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 14:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80924.148462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Hob-00043h-Ej; Wed, 03 Feb 2021 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80924.148462; Wed, 03 Feb 2021 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7Hob-00043I-BO; Wed, 03 Feb 2021 13:03:25 +0000
Received: by outflank-mailman (input) for mailman id 80924;
 Wed, 03 Feb 2021 13:03:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3m8k=HF=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l7Hoa-00043C-20
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 13:03:24 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6971aad3-600f-4c43-99d0-d9c44f6beb1a;
 Wed, 03 Feb 2021 13:03:22 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 113D3LLL001690;
 Wed, 3 Feb 2021 14:03:21 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 268B6281D; Wed,  3 Feb 2021 14:03:21 +0100 (CET)
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
X-Inumbo-ID: 6971aad3-600f-4c43-99d0-d9c44f6beb1a
Date: Wed, 3 Feb 2021 14:03:21 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: xen-devel@lists.xen.org
Subject: Re: xenstored file descriptor leak
Message-ID: <20210203130321.GA2579@antioche.eu.org>
References: <20210203114832.GA1549@antioche.eu.org>
 <73c0dd26-d3a5-221f-84b8-06055ee62889@suse.com>
 <20210203120336.GA2511@antioche.eu.org>
 <8e4f159a-9519-3576-8f6b-3800a0e84500@suse.com>
 <20210203121738.GA2610@antioche.eu.org>
 <cbf97615-a81e-4a5d-6cc2-ce3b850ed2f5@suse.com>
 <20210203123312.GA2906@antioche.eu.org>
 <25ba02f1-ec03-3bdd-b378-946889271969@suse.com>
 <20210203124726.GA3034@antioche.eu.org>
 <411aa7b7-3006-61ce-e2e2-9b9d51658b99@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <411aa7b7-3006-61ce-e2e2-9b9d51658b99@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Wed, 03 Feb 2021 14:03:21 +0100 (MET)

On Wed, Feb 03, 2021 at 01:58:19PM +0100, Jürgen Groß wrote:
> On 03.02.21 13:47, Manuel Bouyer wrote:
> > On Wed, Feb 03, 2021 at 01:42:12PM +0100, Jürgen Groß wrote:
> > > Uh, this is no regular patch.
> > 
> > I though by regular patch, you meants a plain diff -u
> > 
> > > You've sent correct patches before,
> > 
> > Yes, and it's very time-consuming. This is why I want to have it right the
> > first time and not go through sevreral iterations with this protocol.
> > 
> 
> Its not that hard if you have a proper git tree...

git is the problem actually. I'm not used to it ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

