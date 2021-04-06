Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4473555F7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 16:03:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105999.202701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmIP-0005cq-L6; Tue, 06 Apr 2021 14:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105999.202701; Tue, 06 Apr 2021 14:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTmIP-0005cQ-Hf; Tue, 06 Apr 2021 14:03:09 +0000
Received: by outflank-mailman (input) for mailman id 105999;
 Tue, 06 Apr 2021 14:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dxY0=JD=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lTmIO-0005cJ-6Z
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 14:03:08 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 027a7277-821f-4bcb-947f-c888c0949e07;
 Tue, 06 Apr 2021 14:03:07 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lTmIM-000CxQ-Iw; Tue, 06 Apr 2021 14:03:06 +0000
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
X-Inumbo-ID: 027a7277-821f-4bcb-947f-c888c0949e07
Date: Tue, 6 Apr 2021 15:03:06 +0100
From: Tim Deegan <tim@xen.org>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 10/14] tools/kdd: Use const whenever we point to literal
 strings
Message-ID: <YGxqGpZIOsiO709x@deinos.phlegethon.org>
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-11-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210405155713.29754-11-julien@xen.org>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 16:57 +0100 on 05 Apr (1617641829), Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> literal strings are not meant to be modified. So we should use const
> char * rather than char * when we want to shore a pointer to them.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Tim Deegan <tim@xen.org>

Thanks,

Tim.

