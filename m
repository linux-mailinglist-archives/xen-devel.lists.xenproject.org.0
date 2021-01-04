Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A422E9C74
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 19:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61467.108209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwU9b-0006yK-Uv; Mon, 04 Jan 2021 18:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61467.108209; Mon, 04 Jan 2021 18:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwU9b-0006xv-Rd; Mon, 04 Jan 2021 18:00:27 +0000
Received: by outflank-mailman (input) for mailman id 61467;
 Mon, 04 Jan 2021 18:00:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwU9a-0006xq-Hu
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 18:00:26 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa612f29-52e2-442f-8716-e0580d74a588;
 Mon, 04 Jan 2021 18:00:24 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104I0J1o026636;
 Mon, 4 Jan 2021 19:00:19 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 1AD64281D; Mon,  4 Jan 2021 19:00:19 +0100 (CET)
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
X-Inumbo-ID: aa612f29-52e2-442f-8716-e0580d74a588
Date: Mon, 4 Jan 2021 19:00:19 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/5] x86/vPCI: tolerate (un)masking a disabled MSI-X entry
Message-ID: <20210104180019.GA947@antioche.eu.org>
References: <f93efb14-f088-ca84-7d0a-f1b53ff6316c@suse.com>
 <fef14892-f21d-e304-d9b1-7484e0ea3415@suse.com>
 <20201228182407.5ntx7qppe4vu7fvu@Air-de-Roger>
 <255866b7-8bc1-6bdc-2188-e772a3b9fa7e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <255866b7-8bc1-6bdc-2188-e772a3b9fa7e@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 04 Jan 2021 19:00:19 +0100 (MET)

On Mon, Jan 04, 2021 at 05:35:23PM +0100, Jan Beulich wrote:
> Thanks.
> 
> > Manuel, can we get confirmation that this fixes your issue?
> 
> I'll give it some time before committing for him to confirm,
> but I guess I'd like to time out by the end of the week.

Yes, it works for me

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

