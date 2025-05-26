Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB8AC444D
	for <lists+xen-devel@lfdr.de>; Mon, 26 May 2025 22:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997769.1378587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeDI-00043g-CT; Mon, 26 May 2025 20:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997769.1378587; Mon, 26 May 2025 20:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJeDI-00041o-9K; Mon, 26 May 2025 20:14:24 +0000
Received: by outflank-mailman (input) for mailman id 997769;
 Mon, 26 May 2025 20:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5RhM=YK=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1uJeDG-00040P-Kl
 for xen-devel@lists.xenproject.org; Mon, 26 May 2025 20:14:22 +0000
Received: from chassiron.antioche.eu.org (chassiron.antioche.eu.org
 [2001:41d0:fc2c:4d01::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0140dfbe-3a6e-11f0-b893-0df219b8e170;
 Mon, 26 May 2025 22:14:19 +0200 (CEST)
Received: from rochebonne.antioche.eu.org
 ([IPv6:2001:41d0:fc2c:4d00:96de:80ff:fe21:bec0])
 by chassiron.antioche.eu.org (8.18.1/8.16.1) with ESMTP id 54QKEEee007167;
 Mon, 26 May 2025 22:14:15 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 447071A4D0; Mon, 26 May 2025 22:13:40 +0200 (CEST)
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
X-Inumbo-ID: 0140dfbe-3a6e-11f0-b893-0df219b8e170
Date: Mon, 26 May 2025 22:13:40 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Xen 4.18.5 PV dbregs fail
Message-ID: <aDTLdL4irrkTLxje@antioche.eu.org>
References: <aDSr8u-7w_Rbf4el@mail.soc.lip6.fr>
 <d019f9f9-6d45-43fe-b184-fc55f79d411f@citrix.com>
 <b1336e71-356c-46a0-b0c4-9fcbee3f92fa@citrix.com>
 <aDS27G05bJvSyd5o@antioche.eu.org>
 <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0733f3dc-9f01-4e15-98ab-d7fd7c3e303d@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (chassiron.antioche.eu.org [IPv6:2001:41d0:fc2c:4d01:0:0:0:1]); Mon, 26 May 2025 22:14:15 +0200 (MEST)

On Mon, May 26, 2025 at 07:50:14PM +0100, Andrew Cooper wrote:
> [...]
> Well, that range does include the aforementioned commit.
> 
> Can you bisect around d32c77f471fb8400b6512c171a14cdd58f04f0a3 which is
> the backport of ^ in 4.18 ?

Sure,
with 0d5f15e and d32c77f the test pass, with cecee35 it fails.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

