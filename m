Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300BA23B516
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 08:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2qcM-0003Dy-HC; Tue, 04 Aug 2020 06:40:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2qcL-0003Dr-7T
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 06:40:09 +0000
X-Inumbo-ID: 5673ca0e-d61d-11ea-b00d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5673ca0e-d61d-11ea-b00d-12813bfff9fa;
 Tue, 04 Aug 2020 06:40:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B7DFAC7D;
 Tue,  4 Aug 2020 06:40:23 +0000 (UTC)
Subject: Re: [PATCH 03/10] x86emul: extend decoding / mem access testing to
 MMX / SSE insns
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <97ca3d9c-7540-c7b1-cf84-34c75c9127df@suse.com>
 <197bf5e9-5246-abfb-3870-6ca3dbaee152@suse.com>
 <b8411bcf-f678-2e35-467a-6a0753d33461@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <291ff1f5-a999-b337-c704-f9a7d0754ddf@suse.com>
Date: Tue, 4 Aug 2020 08:40:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b8411bcf-f678-2e35-467a-6a0753d33461@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 18:42, Andrew Cooper wrote:
> On 03/08/2020 15:50, Jan Beulich wrote:
>> IOW just legacy encoded ones. For 3dNow! just one example is used, as
>> they're all similar in nature both encoding- and operand-wise.
>>
>> Adjust a slightly misleading (but not wrong) memcpy() invocation, as
>> noticed while further cloning that code.
> 
> I don't see any adjustment, in this or later patches.
> 
> Is the comment stale?

Indeed it is, thanks for noticing. That change we merged back into
the patch that has already gone in (and afaict now it was a memset(),
not a memcpy()).

Jan

