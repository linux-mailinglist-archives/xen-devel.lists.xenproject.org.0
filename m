Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEED8006B6
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 10:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645396.1007559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zi7-0002JS-U6; Fri, 01 Dec 2023 09:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645396.1007559; Fri, 01 Dec 2023 09:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8zi7-0002Ho-Qc; Fri, 01 Dec 2023 09:21:23 +0000
Received: by outflank-mailman (input) for mailman id 645396;
 Fri, 01 Dec 2023 09:21:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8zi6-0002Hi-QP
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 09:21:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8zi2-0003tc-Cl; Fri, 01 Dec 2023 09:21:18 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8zi2-0007xq-6y; Fri, 01 Dec 2023 09:21:18 +0000
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
	bh=F2XTt8TPeOzbqceIRZZ4AVXmMTNHSM+uyfyfHMOrlOg=; b=N1qI1caOGES6HrVqf7zTyPkh2k
	J6YejHq+uLG9WxuXxBFPcYci+39yrtFGSDS9GXZyxrrvqfSDRianmiGom3dm2yNCVvcsb/y/rPs6k
	qYZOcGcgKTTLcY2VG/uKIMGTcbEk3QJwIzSMyOuUdBxiF3Z5vr+INNcDdjAtqStuep04=;
Message-ID: <df0bc6ca-2a04-4ed2-ae70-642ae44da549@xen.org>
Date: Fri, 1 Dec 2023 09:21:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 30/11/2023 22:27, Stefano Stabellini wrote:
> Hi all,
> 
> This vote is in the context of this thread:
> https://marc.info/?l=xen-devel&m=169213351810075

Thanks for providing the context + CCing committers.

First I will echo what Jan said and mention that providing context to 
the vote is always useful.

My second point is while I understand the vote is open to everyone, it 
would be good to at least CC the maintainers of the area involved (or 
committers if you need a wider input). At least a few of us don't often 
look at xen-devel and I would have missed this vote request if Stefano 
hadn't CCed me.

Cheers,

-- 
Julien Grall

