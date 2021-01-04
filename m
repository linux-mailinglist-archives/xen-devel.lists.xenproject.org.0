Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A72E9336
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61060.107154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN0w-0000CV-FE; Mon, 04 Jan 2021 10:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61060.107154; Mon, 04 Jan 2021 10:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN0w-0000C6-BN; Mon, 04 Jan 2021 10:23:02 +0000
Received: by outflank-mailman (input) for mailman id 61060;
 Mon, 04 Jan 2021 10:23:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN0v-0000C1-Ot
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:23:01 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d84c5401-440a-4a6b-a3ca-5ef4408f8e2f;
 Mon, 04 Jan 2021 10:22:59 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AMo6N028846;
 Mon, 4 Jan 2021 11:22:50 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 4059B281D; Mon,  4 Jan 2021 11:22:50 +0100 (CET)
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
X-Inumbo-ID: d84c5401-440a-4a6b-a3ca-5ef4408f8e2f
Date: Mon, 4 Jan 2021 11:22:50 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 06/24] Handle the case where vifname is not present in
 xenstore.
Message-ID: <20210104102250.GB2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-7-bouyer@netbsd.org>
 <20201229114302.kqszcnb7ynk7enin@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229114302.kqszcnb7ynk7enin@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 04 Jan 2021 11:22:50 +0100 (MET)

On Tue, Dec 29, 2020 at 12:43:02PM +0100, Roger Pau Monné wrote:
> Maybe it would be easier to just fix libxl to always set the vifname
> in xenstore?
> 
> FWIW, on FreeBSD I'm passing the vifname as an environment parameter
> to the script.

Actually I don't know why the vifname is not always set. It may depend on
the Xen version ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

