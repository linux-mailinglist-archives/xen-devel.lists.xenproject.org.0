Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6837A36682D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114216.217572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9HY-0001Im-KM; Wed, 21 Apr 2021 09:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114216.217572; Wed, 21 Apr 2021 09:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9HY-0001IN-H2; Wed, 21 Apr 2021 09:36:28 +0000
Received: by outflank-mailman (input) for mailman id 114216;
 Wed, 21 Apr 2021 09:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZ9HW-0001II-GL
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:36:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c06e48c4-eea7-4d40-baeb-e8af7ed4bfbc;
 Wed, 21 Apr 2021 09:36:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 115F9B2E4;
 Wed, 21 Apr 2021 09:36:25 +0000 (UTC)
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
X-Inumbo-ID: c06e48c4-eea7-4d40-baeb-e8af7ed4bfbc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618997785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjI3cwIvRZCqDbzZskark2u8JjM+yVrhgh5DWKybc/8=;
	b=KnrOBdXC6n9pA6tl0G4hvjlzXlt7VjsOFoRAjs8+717Os5Gg7V+BAHow0v08lNAuIi+NqZ
	oxNUWm0PfGmmGR2ceJ0EmYu7k1xNkk6OV6LvRAdk0T4A56tBKSk4lNPrkI5bbeLYO1+Um1
	YAc12/ZN86NllrJ/joTH28b7EceP0FM=
Subject: Re: [PATCH] CI: Drop TravisCI
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Doug Goldstein <cardoe@cardoe.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210421092705.2295-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <42a760a2-5663-8e7e-78a5-f5988f222378@suse.com>
Date: Wed, 21 Apr 2021 11:36:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210421092705.2295-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.04.2021 11:27, Andrew Cooper wrote:
> Travis-ci.org is shutting down shortly.  The arm cross-compile testing has
> been broken for a long time now, and all testing has now been superseded by
> our Gitlab infrastructure.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

FWIW
Acked-by: Jan Beulich <jbeulich@suse.com>


