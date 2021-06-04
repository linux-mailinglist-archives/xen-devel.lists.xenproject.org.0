Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924ED39BF4E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 20:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136974.253794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpECS-0000yi-QO; Fri, 04 Jun 2021 18:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136974.253794; Fri, 04 Jun 2021 18:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpECS-0000wr-NP; Fri, 04 Jun 2021 18:05:40 +0000
Received: by outflank-mailman (input) for mailman id 136974;
 Fri, 04 Jun 2021 18:05:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lpECR-0000wl-AM
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 18:05:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lpECO-0001nH-DV; Fri, 04 Jun 2021 18:05:36 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lpECO-0007V8-7f; Fri, 04 Jun 2021 18:05:36 +0000
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
	bh=y/27EYTGRUek+11HnrhLto5u7roRALSw57xQF75A8Og=; b=pzkOQ8vOrzk1iOmeFytIJdqx5Z
	d5myXSOSyEyNvlHOA2Vbct61dYGnXmRxPpluV7hObDvz7MkEkrHF88+QAGrlbsbNuTpHoErzx1nbo
	1Xtjqnqln0eY2D1tMDBwiv+ZuV+FJD7fFixgD7iHWNcUBviYVB/DRCeqLehXOCP6i8Og=;
Subject: Re: [PATCH v2 0/6] tools/libs: add missing support of linear
 p2m_list, cleanup
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20210604060214.14924-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e765fa38-f2f6-ec0f-e6d5-a01d333488d9@xen.org>
Date: Fri, 4 Jun 2021 19:05:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210604060214.14924-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/06/2021 07:02, Juergen Gross wrote:
> This is a resend of V2 with the Acks folded in.

Thank you for resending with the Acks. It is now pushed!

Cheers,

-- 
Julien Grall

