Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC75758664
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 23:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565498.883677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrpT-0000Ko-AD; Tue, 18 Jul 2023 21:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565498.883677; Tue, 18 Jul 2023 21:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrpT-0000Hh-76; Tue, 18 Jul 2023 21:01:55 +0000
Received: by outflank-mailman (input) for mailman id 565498;
 Tue, 18 Jul 2023 21:01:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLrpR-0000Ha-0G
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 21:01:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrpQ-0004Lq-BQ; Tue, 18 Jul 2023 21:01:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrpQ-0007ZA-6l; Tue, 18 Jul 2023 21:01:52 +0000
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
	bh=ScKwKafu436xpQuaiD4ZzcZyIeMejtMoash/nP04Aw8=; b=zt5KIBu1D71MLpVJUdaE/SqBxQ
	MEXCRqWB6I9PmsMFEiCq4eokOdBogNwlohX8GB2lOi1lSiwaBqnKsLyP8sRl28YAv83pNXZ2C4IQf
	N7AjlfVmx1ZN93CYofkA4MA+lNSU0BsPcAZ4UK1DPg/ksfFvzvoN1Wgg3SXPY0eKeLww=;
Message-ID: <c1c18e03-5a3e-2793-2b42-040b79a47ab9@xen.org>
Date: Tue, 18 Jul 2023 22:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 13/18] tools/xenstore: let db_delete() return void
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-14-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-14-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi JUergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> db_delete() only ever is returning 0. Switch it to return void and
> remove all the error handling dealing wit a non-zero return value.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

