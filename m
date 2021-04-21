Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336A367357
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 21:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114927.219080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIP6-0002rn-Ro; Wed, 21 Apr 2021 19:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114927.219080; Wed, 21 Apr 2021 19:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIP6-0002rO-Ob; Wed, 21 Apr 2021 19:20:52 +0000
Received: by outflank-mailman (input) for mailman id 114927;
 Wed, 21 Apr 2021 19:20:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZIP5-0002rJ-DP
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 19:20:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIP3-0006k1-E7; Wed, 21 Apr 2021 19:20:49 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIP3-00079T-7a; Wed, 21 Apr 2021 19:20:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=k6RYQ/9INavHSA4Nf7QiFbZSgiKEs2m1EampdOupvwQ=; b=pi5CIzUOq9YoFI6pBBjw5npSq5
	ZVlz0CadF50njkNF0zYy8/E8hBfNQhsSpN8ZTQeSZOQC2Dd+Q9LQQsqTCJ19W2yyr8lQaAuTIiwjX
	F7z4CrX8elP4fsYQ0WTjodqlvWh92VrPkjX2tPIkleHPL+DSwQNBjCY4hRah7+fEMQ60=;
Subject: Re: [PATCH v2 17/20] lib: move/rename strnicmp() to strncasecmp()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <3ae091ce-6f6c-3ec6-abd3-4490239a707f@suse.com>
 <1fab1400-9bb5-f9e8-0f7f-3213afc0ad92@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ba017001-98eb-875e-a868-cbbdb26edd77@xen.org>
Date: Wed, 21 Apr 2021 20:20:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1fab1400-9bb5-f9e8-0f7f-3213afc0ad92@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 21/04/2021 15:25, Jan Beulich wrote:
> While moving the implementation, also rename it to match strcasecmp(),
> allowing the similar use of a compiler builting in this case as well.

NIT: I think you meant builtin here.

Cheers,

-- 
Julien Grall

