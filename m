Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC9B0A6F1
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 17:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048918.1419108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmoi-0002Td-HP; Fri, 18 Jul 2025 15:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048918.1419108; Fri, 18 Jul 2025 15:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucmoi-0002Qj-EV; Fri, 18 Jul 2025 15:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1048918;
 Fri, 18 Jul 2025 15:16:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1ucmoh-0002Qd-5c
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 15:16:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ucmof-006RPX-2X;
 Fri, 18 Jul 2025 15:16:05 +0000
Received: from [2a01:cb15:80df:da00:7079:39df:8b4d:ea79] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1ucmof-0008eS-1N;
 Fri, 18 Jul 2025 15:16:05 +0000
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
	bh=Hqz+wI5/mMU/AoFUAsuyD12I9J57yjGpqXv6z+xaq40=; b=VEqjBH5TyybiTmxR6Vh7o9XlMO
	kNlacHfe1zsGUEoYwTdL0ZwxWZhYoR5dlUuI8vt6huWjrA9kuf8IuLgrIQ7KbTPsRRVg1+MhVV1if
	B8qskUerwJnr3QRvoBGsK3we6tyerJWUW5KD042wUO6KxPbBgF6hEPTB/d8muk/h8/0U=;
Date: Fri, 18 Jul 2025 17:16:03 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Petr =?utf-8?B?QmVuZcWh?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v10 1/9] tools/xl: Add altp2m_count parameter
Message-ID: <aHplM-eTYp7nzHgy@l14>
References: <cover.1752691429.git.w1benny@gmail.com>
 <c291e2e56c598df8c328e76f237699084b2dd593.1752691429.git.w1benny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c291e2e56c598df8c328e76f237699084b2dd593.1752691429.git.w1benny@gmail.com>

On Wed, Jul 16, 2025 at 08:15:31PM +0000, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Introduce a new altp2m_count parameter to control the maximum number of altp2m
> views a domain can use. By default, if altp2m_count is unspecified and altp2m
> is enabled, the value is set to 10, reflecting the legacy behavior.
> 
> This change is preparatory; it establishes the groundwork for the feature but
> does not activate it.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 
Anthony PERARD

