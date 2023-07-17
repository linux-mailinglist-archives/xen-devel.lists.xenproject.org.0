Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEC756F1A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 23:47:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564864.882611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLW2u-0008Kz-A3; Mon, 17 Jul 2023 21:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564864.882611; Mon, 17 Jul 2023 21:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLW2u-0008Ig-70; Mon, 17 Jul 2023 21:46:20 +0000
Received: by outflank-mailman (input) for mailman id 564864;
 Mon, 17 Jul 2023 21:46:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLW2t-0008Ia-4k
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 21:46:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLW2r-00047e-Qe; Mon, 17 Jul 2023 21:46:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLW2r-0000ne-JX; Mon, 17 Jul 2023 21:46:17 +0000
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
	bh=Z5WDx2imJXBTPB2UzUn1DlCH7XKK991dTHu8ydM9tko=; b=L8eTNhDekGHE/d+iO0v4RuL5JS
	J6bwgB2iGOQfoNte4SJkEX7IL5VISNyti0cpi4TFfHO7oIYl1e8BEvSmPc298zGQzLx3cP/RaHb8s
	fjpF58HMsUGZts2y/TKOOkM7r+9Rt44SVYAwKlKpOZphJOrfVSPmQn0dzjg8OKPXo7D4=;
Message-ID: <5d108900-f3dc-f974-c02b-3f0b099ccfba@xen.org>
Date: Mon, 17 Jul 2023 22:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/18] tools/xenstore: rename do_tdb_delete() and
 change parameter type
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-5-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Rename do_tdb_delete() to db_delete() and replace the key parameter
> with db_name specifying the name of the node in the data base.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

