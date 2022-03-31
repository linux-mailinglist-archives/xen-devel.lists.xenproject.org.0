Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021834EE177
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 21:14:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297063.505902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0F3-000450-O4; Thu, 31 Mar 2022 19:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297063.505902; Thu, 31 Mar 2022 19:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1na0F3-00042g-K9; Thu, 31 Mar 2022 19:13:57 +0000
Received: by outflank-mailman (input) for mailman id 297063;
 Thu, 31 Mar 2022 19:13:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1na0F2-00042Y-6m
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 19:13:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na0F1-0004Xs-Gw; Thu, 31 Mar 2022 19:13:55 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.206]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1na0F1-0004Us-An; Thu, 31 Mar 2022 19:13:55 +0000
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
	bh=UjH9LcFkiUve9nrMnme//2PhtzOIwRuuvslnnFr0prg=; b=PZ4/QWTdwt31NABU2TvkVMG8Ok
	+RtM84vZ6tpnLwfNWVhesPYfILsovX3zVvMxrjDosgRRxwmA7bTsSCk31ho7aRmHnjaG2XJV9LmPu
	YCOvHIS+OeXFDzksQB/7mKPBn8vg2x3OCVN++07+nwzTYAK47/vZnAEoAZLG+4BdTh78=;
Message-ID: <e6fc2c75-df0b-a6e8-80c0-cdc100946d4e@xen.org>
Date: Thu, 31 Mar 2022 20:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [XEN PATCH v10 2/7] build: replace $(BASEDIR) by $(objtree)
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-3-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220322112238.1117737-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 22/03/2022 11:22, Anthony PERARD wrote:
> We need to differentiate between source files and generated/built
> files. We will be replacing $(BASEDIR) by $(objtree) for files that
> are generated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

