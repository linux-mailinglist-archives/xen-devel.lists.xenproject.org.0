Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C263825FE70
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 18:16:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFJoq-0002xR-34; Mon, 07 Sep 2020 16:16:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72DF=CQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kFJoo-0002xH-98
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 16:16:34 +0000
X-Inumbo-ID: 0b95aa9c-e5ee-498d-918b-f47c43ad0778
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b95aa9c-e5ee-498d-918b-f47c43ad0778;
 Mon, 07 Sep 2020 16:16:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 790F8AC82;
 Mon,  7 Sep 2020 16:16:33 +0000 (UTC)
Subject: Re: [PATCH v4 29/31] tools: rename global libxlutil make variables
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-30-jgross@suse.com>
 <20200907155511.jhpucgrvmthhzlmv@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c908bdee-3ab6-6a4b-0c93-e38116a98a5c@suse.com>
Date: Mon, 7 Sep 2020 18:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907155511.jhpucgrvmthhzlmv@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.20 17:55, Wei Liu wrote:
> On Fri, Aug 28, 2020 at 05:07:45PM +0200, Juergen Gross wrote:
>> Rename *_libxlutil make variables to *_libxenutil in order to avoid
>> nasty indirections when moving libxlutil under the tools/libs
>> infrastructure.
> 
> xl means xenlight.
> 
> So I think the name should be libxenlightutil here.

I don't really mind, but given that the name is completely internal
to the build system I wonder whether the shorter name isn't more
pleasant.


Juergen

