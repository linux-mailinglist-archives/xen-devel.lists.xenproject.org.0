Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BE25D36F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:22:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE6yj-0004P7-4P; Fri, 04 Sep 2020 08:21:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=saQb=CN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kE6yi-0004Oz-9r
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:21:48 +0000
X-Inumbo-ID: af4341b4-02d2-4e06-a454-91b82d8d44c3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af4341b4-02d2-4e06-a454-91b82d8d44c3;
 Fri, 04 Sep 2020 08:21:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA92DB627;
 Fri,  4 Sep 2020 08:21:47 +0000 (UTC)
Subject: Re: [PATCH v2] Add additional symbols to xen-syms.map
To: Michael Kurth <mku@amazon.de>
Cc: xen-devel@lists.xenproject.org, Michael Kurth <mku@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, wipawel@xen.org,
 wipawel@amazon.de
References: <20200821151045.92022-1-mku@amazon.de>
 <20200828160200.13322-1-mku@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dfac95c-c856-d45d-2cd9-424eeaba5911@suse.com>
Date: Fri, 4 Sep 2020 10:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200828160200.13322-1-mku@amazon.de>
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

On 28.08.2020 18:02, Michael Kurth wrote:
> From: Michael Kurth <mku@amazon.com>
> 
> Add "all_symbols" to all /tools/symbols calls so that
> xen-syms.map lists all symbols and not only .text section
> symbols. This change enhances debugging and livepatch
> capabilities.
> 
> Signed-off-by: Michael Kurth <mku@amazon.de>
> Reviewed-by: Eslam Elnikety <elnikety@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
> Reviewed-by: Robert Stonehouse <rjstone@amazon.co.uk>
> Reviewed-by: Pawel Wieczorkiewicz <wipawel@amazon.de>

Acked-by: Jan Beulich <jbeulich@suse.com>

