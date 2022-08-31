Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B75A86C5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 21:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396031.636003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTQf-0007U1-Li; Wed, 31 Aug 2022 19:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396031.636003; Wed, 31 Aug 2022 19:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTTQf-0007SG-IY; Wed, 31 Aug 2022 19:31:13 +0000
Received: by outflank-mailman (input) for mailman id 396031;
 Wed, 31 Aug 2022 19:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LF4z=ZD=xen.org=julien@srs-se1.protection.inumbo.net>)
 id 1oTTQd-0007SA-Og
 for xen-devel@lists.xen.org; Wed, 31 Aug 2022 19:31:11 +0000
Received: from mail.xenproject.org (mail.xenproject.org [104.130.215.37])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74faf950-2963-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 21:31:08 +0200 (CEST)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTTQX-0005es-MD; Wed, 31 Aug 2022 19:31:05 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTTQX-0004eS-Fu; Wed, 31 Aug 2022 19:31:05 +0000
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
X-Inumbo-ID: 74faf950-2963-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:To:MIME-Version:Date:Message-ID;
	bh=fReVIWnjRoKT/cVf+2eWC+hDyaag3+QAHMuxnL5+kug=; b=IhUtPn1Hgq3soLdtZxCk2u+9mO
	mNVqWXSPG2BDOsMRxpmB+POv9AcvqAdK+r59JYdOFGZvSTuF+VjWG89F0ywo/iBhpLV9pNxDQ+iDN
	lPSPu0AotDhyv8fTvl8My1EHU3HGmJa5Tx9Np6xs0zWqJOuQIe3ibI3AphS7F4Qcgttk=;
Message-ID: <516110eb-f2aa-f2f7-2f11-a1dbe47930c8@xen.org>
Date: Wed, 31 Aug 2022 20:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: Oleshii Wood <oleshiiwood@gmail.com>, xen-devel@lists.xen.org
References: <CA+SAi2s6ZfY87dR2noYkKiH_QwJMXKbj_6404Hmru-t==vSAhw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: Xen in ARM environment networking overload issue
In-Reply-To: <CA+SAi2s6ZfY87dR2noYkKiH_QwJMXKbj_6404Hmru-t==vSAhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 30/08/2022 14:09, Oleshii Wood wrote:
> Hello guys,

Hello,

> 
> The same issue migh be found by link
> https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=xen_add_phys_to_mach_entry&page=1 
> <https://xen.markmail.org/message/3w4oqeu5z7ryfbsb?q=xen_add_phys_to_mach_entry&page=1>

The link also contains a pointer to a patch which is...

> 
> DOM0/DOMU kernels version 5.15.19

... not included in 5.15.19 but is at least included in the latest
stable version for 5.15 (5.15.63).

Please update the latest v5.15.X and check if this issue is still present.

[...]

> It is produced unconditionally. In  the above mentioned condition this 
> output
> degrades the performance drastically.

The error message is a sign something went horribly wrong. The right 
solution is to find the root cause rather than...

> I may offer a patch which decreases the amount of messages.

... decreasing the verbosity.

Cheers,

-- 
Julien Grall

