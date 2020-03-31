Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A90199892
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 16:31:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJHt4-0006PY-5A; Tue, 31 Mar 2020 14:29:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJHt2-0006PR-MS
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 14:29:04 +0000
X-Inumbo-ID: f88f0882-735b-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f88f0882-735b-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 14:29:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CA1BAE59;
 Tue, 31 Mar 2020 14:29:03 +0000 (UTC)
Subject: Re: [PATCH 04/11] x86/ucode/amd: Collect CPUID.1.EAX in
 collect_cpu_info()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200331100531.4294-1-andrew.cooper3@citrix.com>
 <20200331100531.4294-5-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <df2a4e27-ff37-cb62-dc0a-38d66612e75d@suse.com>
Date: Tue, 31 Mar 2020 16:29:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331100531.4294-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:05, Andrew Cooper wrote:
> ... rather than collecting it repeatedly in microcode_fits().  This brings the
> behaviour in line with the Intel side.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


