Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB98B38552
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 16:46:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096228.1450983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHQ3-0003eF-SW; Wed, 27 Aug 2025 14:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096228.1450983; Wed, 27 Aug 2025 14:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urHQ3-0003ck-Q0; Wed, 27 Aug 2025 14:46:35 +0000
Received: by outflank-mailman (input) for mailman id 1096228;
 Wed, 27 Aug 2025 14:46:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1urHQ2-0003ce-8a
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 14:46:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urHPw-009HEB-1t;
 Wed, 27 Aug 2025 14:46:28 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1urHPw-004AUL-1c;
 Wed, 27 Aug 2025 14:46:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=67Md2EoQIxu9KYmikqABR3avTGnCaj+4vTuii75qCgI=; b=sPo673c7oOD5lZw4pOjv/W8M0h
	3InM0TKrHjmvDP/GT6FFEKbD5ZYofTmCA7Gs5dQPRpk9xeFGI//iCGs1noolfa6+fJXbuANoTfTTJ
	r1LBw0LElNDPaYmGRV4B/36uwEb6YCrT6FrKmyBCEzG5B+SgWL/GgwGgb7AXbI3xU3zI=;
Date: Wed, 27 Aug 2025 16:46:26 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
Message-ID: <aK8aQhpOYWcm3EzR@l14>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>

On Mon, Aug 25, 2025 at 05:50:02PM +0200, Oleksii Kurochko wrote:
> Hello community,
> 
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
> 
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]
> 7. Some other patch series I missed.

Do we want to add this following one to the list?
- Allow to build libxl and other tools with json-c instead of yajl
https://lore.kernel.org/xen-devel/20250808145602.41716-1-anthony@xenproject.org/

Cheers,

-- 
Anthony PERARD

