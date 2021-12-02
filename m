Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C39466A2E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 20:10:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236934.410924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrTQ-0006n7-Vg; Thu, 02 Dec 2021 19:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236934.410924; Thu, 02 Dec 2021 19:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrTQ-0006kl-SC; Thu, 02 Dec 2021 19:10:28 +0000
Received: by outflank-mailman (input) for mailman id 236934;
 Thu, 02 Dec 2021 19:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TWG+=QT=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1msrTP-0005Su-R5
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 19:10:27 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8232273a-53a3-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 20:10:27 +0100 (CET)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1msrTM-000BWi-OW; Thu, 02 Dec 2021 19:10:24 +0000
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
X-Inumbo-ID: 8232273a-53a3-11ec-b1df-f38ee3fbfdf7
Date: Thu, 2 Dec 2021 19:10:24 +0000
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 1/2] x86/mm: don't open-code p2m_is_pod()
Message-ID: <YakaIHomlrAsPXNG@deinos.phlegethon.org>
References: <ac46f25b-e669-f309-b36e-c4760e10479e@suse.com>
 <a1110809-b4fb-c53e-5f46-dc7628165634@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a1110809-b4fb-c53e-5f46-dc7628165634@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 12:01 +0100 on 01 Dec (1638360084), Jan Beulich wrote:
> Replace all comparisons against p2m_populate_on_demand (outside of
> switch() statements) with the designated predicate.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tim Deegan <tim@xen.org>

