Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A556758645
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565483.883639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrdR-0004Pc-K1; Tue, 18 Jul 2023 20:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565483.883639; Tue, 18 Jul 2023 20:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrdR-0004MG-GC; Tue, 18 Jul 2023 20:49:29 +0000
Received: by outflank-mailman (input) for mailman id 565483;
 Tue, 18 Jul 2023 20:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLrdP-0004Li-Sa
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:49:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrdP-0003zg-83; Tue, 18 Jul 2023 20:49:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrdP-0006zi-3Y; Tue, 18 Jul 2023 20:49:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=z7HqkBEH/2Y/YsO+GRcIiK/QABaoxJ/XsAniPUvUUio=; b=NPAxnJXerpgrxgF2aYICcN2w07
	5bhjzMdGpnAU34+3eh1V6YNSuGhgH9PoHMkqVSx9tJ+ak6oOt/2H1lp3TUJgjbuLhBI3J521GrVL0
	DOAetcPWYhMeUuwSnpzUvXB91a3fh9iqpoH8zu0fTNf/NNOeonRazVTcpcfbsuTF5kdw=;
Message-ID: <446d5bba-e0f0-a4f5-a8dc-7c2428f3a9e3@xen.org>
Date: Tue, 18 Jul 2023 21:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/18] tools/xenstore: let hashtable_add() fail in case
 of existing entry
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Silently adding another entry with the same key to a hashtable is a
> perfect receipt for later failure with hard to diagnose symptoms.
> 
> Let hashtable_add() fail in case another entry with the same key is
> already existing.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

