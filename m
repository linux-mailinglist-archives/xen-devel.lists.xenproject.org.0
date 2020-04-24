Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B865C1B6E66
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 08:45:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRs4n-0003wM-AB; Fri, 24 Apr 2020 06:44:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRs4l-0003wH-Pa
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 06:44:39 +0000
X-Inumbo-ID: 10b6409f-85f7-11ea-9467-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10b6409f-85f7-11ea-9467-12813bfff9fa;
 Fri, 24 Apr 2020 06:44:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03539AC2C;
 Fri, 24 Apr 2020 06:44:36 +0000 (UTC)
Subject: Re: [xen-unstable test] 149752: regressions - trouble:
 blocked/fail/pass/starved
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-149752-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac5222a2-fa77-14e6-7dd9-37c88ec98d66@suse.com>
Date: Fri, 24 Apr 2020 08:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <osstest-149752-mainreport@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 23:53, osstest service owner wrote:
> flight 149752 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/149752/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-i386-prev               6 xen-build                fail REGR. vs. 149741
>  build-i386                    6 xen-build                fail REGR. vs. 149741
>  build-i386-xsm                6 xen-build                fail REGR. vs. 149741

Despite this looking like a pattern hinting at a 32-bit build
issue, all three failed because of an issue with fetching ovmf
afaics.

Jan

