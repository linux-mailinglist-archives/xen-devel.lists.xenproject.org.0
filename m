Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B9AB36B28
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094688.1449937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqusn-0002mR-OT; Tue, 26 Aug 2025 14:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094688.1449937; Tue, 26 Aug 2025 14:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqusn-0002jd-Lf; Tue, 26 Aug 2025 14:42:45 +0000
Received: by outflank-mailman (input) for mailman id 1094688;
 Tue, 26 Aug 2025 14:42:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uqusm-0002jX-Ek
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:42:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqusl-007aYq-32;
 Tue, 26 Aug 2025 14:42:44 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uqusl-002P7A-2U;
 Tue, 26 Aug 2025 14:42:43 +0000
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
	bh=FFwFzAGGTgkMjBYygtxvyoA45XP8c1SVxiWRIFNMKYY=; b=aDl436IBhGmlSswbojK1/i1J7+
	cc56gUOTPoicPWRFSLmwRwnQEQaiQKxGyRowNrzjyZ9lvInvtYdI4VPpgr8Cr8T4DkHptwbbdTgoA
	+wl+/QS6vvF4kR+gPAoqjcatibYly4Lz/aRMCjUKl4qYH9LW0d56kGczyQP6ubdkKiEE=;
Date: Tue, 26 Aug 2025 16:42:42 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v5 1/4] tools: add sizeof_field and endof_field macros
Message-ID: <aK3H4lNFN0BWjhqy@l14>
References: <cover.1755987697.git.w1benny@gmail.com>
 <8dd6b217fbde427407113fedabb70f54d12aed61.1755987697.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dd6b217fbde427407113fedabb70f54d12aed61.1755987697.git.w1benny@gmail.com>

On Sat, Aug 23, 2025 at 10:26:49PM +0000, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> * `sizeof_field` returns the size of a specific struct member
> * `endof_field` returns the offset to the end of the member within the struct
> 
> It will be useful in upcoming layout checks of SMBIOS structs.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

-- 
Anthony PERARD

