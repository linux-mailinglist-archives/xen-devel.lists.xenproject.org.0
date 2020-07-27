Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55422F972
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 21:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k096L-0004Px-Kl; Mon, 27 Jul 2020 19:47:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k096K-0004Ps-0I
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 19:47:56 +0000
X-Inumbo-ID: 100a1ea1-d042-11ea-8aee-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 100a1ea1-d042-11ea-8aee-bc764e2007e4;
 Mon, 27 Jul 2020 19:47:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 793D3ACC3;
 Mon, 27 Jul 2020 19:48:04 +0000 (UTC)
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
Date: Mon, 27 Jul 2020 21:47:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727145526.GR7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 16:55, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/include/asm-x86/asm-defns.h
> 
> Maybe this could be asm-insn.h or a different name? I find it
> confusing to have asm-defns.h and an asm_defs.h.

While indeed I anticipated a reply to this effect, I don't consider
asm-insn.h or asm-macros.h suitable: We don't want to limit this
header to a more narrow purpose than "all sorts of definition", I
don't think. Hence I chose that name despite its similarity to the
C header's one.

Jan

