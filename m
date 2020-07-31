Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F3234801
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1WMq-0007Ok-DA; Fri, 31 Jul 2020 14:50:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1WMo-0007Of-Nq
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:50:38 +0000
X-Inumbo-ID: 32105fe8-d33d-11ea-abc9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32105fe8-d33d-11ea-abc9-12813bfff9fa;
 Fri, 31 Jul 2020 14:50:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 439F5AB3D;
 Fri, 31 Jul 2020 14:50:50 +0000 (UTC)
Subject: Re: [PATCH v4 0/2] epte_get_entry_emt() modifications
To: Paul Durrant <paul@xen.org>
References: <20200731144112.12516-1-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bcf6deeb-e451-8929-e034-45b41ab1500a@suse.com>
Date: Fri, 31 Jul 2020 16:50:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731144112.12516-1-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 16:41, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Paul Durrant (2):
>   x86/hvm: set 'ipat' in EPT for special pages
>   x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()

Reviewed-by: Jan Beulich <jbeulich@suse.com>

