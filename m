Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E058361E6C4
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 23:02:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439022.692959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornj2-0004oe-VT; Sun, 06 Nov 2022 22:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439022.692959; Sun, 06 Nov 2022 22:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ornj2-0004ls-SQ; Sun, 06 Nov 2022 22:02:44 +0000
Received: by outflank-mailman (input) for mailman id 439022;
 Sun, 06 Nov 2022 22:02:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ornj1-0004lm-1D
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 22:02:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornj0-00024d-Eg; Sun, 06 Nov 2022 22:02:42 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ornj0-0000cS-9K; Sun, 06 Nov 2022 22:02:42 +0000
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
	bh=gkYEBpWGTb+HPlWDXlqHMHr5VkN4XV/nbqB2cbLfEok=; b=2iYmj9P4E9CQAFiymrT218rG6O
	q+B+HSlcCKbkeRAOrmcYoQfXagwa8q8fMj6Qh6yUD2faSlgmLJ2w1mErfKcTcWTZBro6nEvN2olrZ
	BMrxCb0DC/ZRO+Oc6QgjiRTz+cT33IgaODuFLP6qWDSepkN6FkYCyKR7W5BJMuCkmPb8=;
Message-ID: <d49af850-c805-d9b8-d45f-2bb3ecbd3ec2@xen.org>
Date: Sun, 6 Nov 2022 22:02:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 17/20] tools/xenstore: switch hashtable to use the talloc
 framework
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-18-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-18-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Instead of using malloc() and friends, let the hashtable implementation
> use the talloc framework.

Can you outline why switching to talloc() is better?

Cheers,

-- 
Julien Grall

