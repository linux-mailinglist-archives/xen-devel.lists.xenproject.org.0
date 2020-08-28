Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8B0255500
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 09:22:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBYiD-00033q-Jk; Fri, 28 Aug 2020 07:22:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8pf4=CG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kBYiC-00033a-Ql
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 07:22:12 +0000
X-Inumbo-ID: d275b38e-3a8d-43f3-93b5-99950d68c086
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d275b38e-3a8d-43f3-93b5-99950d68c086;
 Fri, 28 Aug 2020 07:22:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 95682B7D3;
 Fri, 28 Aug 2020 07:22:43 +0000 (UTC)
Subject: Re: [RFC PATCH] xen/Kconfig: Turn CONFIG_EXPERT into normal
 configuration
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?unknown-8bit?B?TW9ubsOp?= <roger.pau@citrix.com>
References: <20200828030112.GB25246@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c61eaae-d222-1d01-b85c-95f8fc835480@suse.com>
Date: Fri, 28 Aug 2020 09:22:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828030112.GB25246@mattapan.m5p.com>
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

On 28.08.2020 05:01, Elliott Mitchell wrote:
> There is little reason to specially require CONFIG_EXPERT to come from
> the environment.  Worse, this makes replicating configurations much more
> difficult.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Against which tree did you develop this? The change you're proposing
has happened already quite some time ago, and is e.g. part of 4.14.
Please make sure patch submissions are against at least the master
branch, but preferably the staging one.

Jan

