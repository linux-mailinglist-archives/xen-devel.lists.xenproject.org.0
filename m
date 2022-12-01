Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641A63F3AE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:22:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450861.708355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lOM-000803-9W; Thu, 01 Dec 2022 15:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450861.708355; Thu, 01 Dec 2022 15:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lOM-0007yG-6h; Thu, 01 Dec 2022 15:22:26 +0000
Received: by outflank-mailman (input) for mailman id 450861;
 Thu, 01 Dec 2022 15:22:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p0lOK-0007y8-Uh
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:22:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0lOI-0003yq-2S; Thu, 01 Dec 2022 15:22:22 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.7.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p0lOH-0004li-Rr; Thu, 01 Dec 2022 15:22:22 +0000
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
	bh=IMNwycdeUa1/ELkdIJUyvH4gMQdCEvFdHCfX/POdxho=; b=GQCDDMhJOwh0O14O2v0SBK/eCu
	jwV9inU1RmKRHE+YHLt1J1cUGwgPGvnIEOURvxw8XEc/QJ97XYwFmW6sTsQB2G2D9SJLvSZHFOLhp
	FCah9cbzz9qs7E+baUQxYd1HkBVM4NxFDmXIc7n9hnyvhQtw0oy09h0wrKnMhOR1DtR4=;
Message-ID: <c90f8cad-23e6-444c-c3d4-7b5b41bb992f@xen.org>
Date: Thu, 1 Dec 2022 15:22:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: Commit moratorium
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <3deaeaf4-dd5d-93cb-2ca5-3c22e2c19bff@xen.org>
 <16684217-afbd-3671-5fad-08057a0e1b20@xen.org>
 <791303a6-7b37-20fc-083c-be8083c90014@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <791303a6-7b37-20fc-083c-be8083c90014@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/12/2022 15:17, Jan Beulich wrote:
> On 01.12.2022 15:32, Julien Grall wrote:
>> I have finally managed to branch 4.17. The tree is now re-opened.
> 
> Does this extend to the 4.17 branch as well? I've committed Anthony's
> build fix to staging, but wasn't sure about doing the "backport"
> right away ...

Yes so long the patches have a release-acked-by.

Cheers,

-- 
Julien Grall

