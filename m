Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B12B425D0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108669.1458729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpiB-0001fn-Ub; Wed, 03 Sep 2025 15:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108669.1458729; Wed, 03 Sep 2025 15:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utpiB-0001dW-Rp; Wed, 03 Sep 2025 15:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1108669;
 Wed, 03 Sep 2025 15:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XBW9=3O=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utpi9-0001dQ-Pv
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:47:49 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5663b2b0-88dd-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 17:47:47 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 583Fliwf010600
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 3 Sep 2025 17:47:45 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 583FliAk005009;
 Wed, 3 Sep 2025 17:47:44 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 58C2E107F7; Wed,  3 Sep 2025 17:47:43 +0200 (CEST)
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
X-Inumbo-ID: 5663b2b0-88dd-11f0-9d12-b5c5bf9af7f9
Date: Wed, 3 Sep 2025 17:47:43 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
        Juergen Gross <jgross@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLhjHxYAUeXWZhyU@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <aLbi7QhGy4QEH8E9@mail.soc.lip6.fr>
 <7d0fc0eb-52a4-4478-8c1b-9a359513abdd@suse.com>
 <aLbpFH2jPRPEqjhe@mail.soc.lip6.fr>
 <8a1fa32f-e7fb-4879-8516-1ddca5367619@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a1fa32f-e7fb-4879-8516-1ddca5367619@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Wed, 03 Sep 2025 17:47:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

Hello
with your help I now have a NetBSD PVH dom0 on Xen 4.20. Thanks all !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

