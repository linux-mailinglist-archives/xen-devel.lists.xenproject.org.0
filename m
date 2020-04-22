Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD911B3ADD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:11:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBPf-0004b4-7A; Wed, 22 Apr 2020 09:11:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j4T=6G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRBPd-0004az-Tx
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:11:21 +0000
X-Inumbo-ID: 3a9271f1-8479-11ea-9243-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a9271f1-8479-11ea-9243-12813bfff9fa;
 Wed, 22 Apr 2020 09:11:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F1BDDAE39;
 Wed, 22 Apr 2020 09:11:18 +0000 (UTC)
Subject: Re: [PATCH v3] Introduce a description of the Backport and Fixes tags
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200417222430.20480-1-sstabellini@kernel.org>
 <5d33d469-9aba-5285-766a-193d7109712d@suse.com>
 <alpine.DEB.2.21.2004211117460.24585@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b2d1e94-ccac-756a-d80e-397cef4b53a2@suse.com>
Date: Wed, 22 Apr 2020 11:11:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2004211117460.24585@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: lars.kurth@citrix.com, julien@xen.org, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.04.2020 20:22, Stefano Stabellini wrote:
> On Mon, 20 Apr 2020, Jan Beulich wrote:
>> On 18.04.2020 00:24, Stefano Stabellini wrote:
>> Previously I did suggest to add an indication that people requesting
>> backports should also be prepare to actually help with backporting.
>> I don't recall a verbal reply, and I also don't see any respective
>> update here. (I'm not fully trusting our mail system, i.e. it may
>> very well be that I did miss a reply.)
> 
> 
> I didn't reply, but I added two lines in that regards, see also above:
> 
>>> +Maintainers might ask the requester to help with the backporting work if
>>> +it is not trivial.

Oh, sorry, I simply didn't notice it in the place you put it.

Jan

