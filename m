Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A93671E5C51
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeF6E-0005g5-R1; Thu, 28 May 2020 09:45:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeF6D-0005g0-T6
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:45:17 +0000
X-Inumbo-ID: efb24df2-a0c7-11ea-a7ac-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efb24df2-a0c7-11ea-a7ac-12813bfff9fa;
 Thu, 28 May 2020 09:45:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E912EAD63;
 Thu, 28 May 2020 09:45:15 +0000 (UTC)
Subject: Re: [PATCH v2 01/14] x86/traps: Clean up printing in
 {do_reserved,fatal}_trap()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b9156db-58e2-a9f9-088a-51131ce3c7b6@suse.com>
Date: Thu, 28 May 2020 11:45:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-2-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.05.2020 21:18, Andrew Cooper wrote:
> For one, they render the vector in a different base.
> 
> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
> mnemonic, which starts bringing the code/diagnostics in line with the Intel
> and AMD manuals.
> 
> Provide constants for every archtiecturally defined exception, even those not
> implemented by Xen yet, as do_reserved_trap() is a catch-all handler.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

As before somewhat hesitantly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

