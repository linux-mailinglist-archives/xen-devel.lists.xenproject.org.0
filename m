Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A652758640
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565476.883617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrYs-0002Zb-LV; Tue, 18 Jul 2023 20:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565476.883617; Tue, 18 Jul 2023 20:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrYs-0002XI-Ir; Tue, 18 Jul 2023 20:44:46 +0000
Received: by outflank-mailman (input) for mailman id 565476;
 Tue, 18 Jul 2023 20:44:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLrYq-0002XC-Kr
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:44:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrYp-0003ms-GH; Tue, 18 Jul 2023 20:44:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLrYp-0006vD-BL; Tue, 18 Jul 2023 20:44:43 +0000
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
	bh=yyHnDc0JzFychfpX3WURoH08cSqZpZkBR7B39eXQXpU=; b=QJL0QcHvn2DPU8J7/PvRd+vIpp
	9McCFbjKdHY16PQCS9YDp3TAMt+DQGK6dB8ynk3VW+RptOBzMfgutCVl8SGv+ET34WSeN8Np7PL6N
	vQlgKL/YdP0iean/7BnXrrkIufidiuHRoEFZsnjaQ/oLNMnAH+2J/JkC/4GRHLddvhzo=;
Message-ID: <0084caae-d07a-f319-5082-b6a8ff3be100@xen.org>
Date: Tue, 18 Jul 2023 21:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/18] tools/xenstore: rename do_tdb_write() and change
 parameter type
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> Rename do_tdb_write() to db_write() and replace the key parameter with
> db_name specifying the name of the node in the data base, and the data
> parameter with a data pointer and a length.
> 
> Do the same key parameter type change for write_node_raw(), too.
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

