Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45A27AF31
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 15:39:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMtMd-0006d0-NA; Mon, 28 Sep 2020 13:38:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMtMb-0006cv-T3
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 13:38:45 +0000
X-Inumbo-ID: e1d9a31c-d234-4c74-93c4-26d09f1fa78e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e1d9a31c-d234-4c74-93c4-26d09f1fa78e;
 Mon, 28 Sep 2020 13:38:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601300323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ci/9FEpDRb+17HWUGNDlSs/DtGMBmunY3ieKSBw9Cf4=;
 b=UEzdYTAJVuTiyEtgJOAvRpQBNmE2/rLgSwADCnyKHLZYU8Qmd2eRgeSWV+c1bK3WiwXa1Z
 X8j8AGPdCjjPjESjlMgJgxSuJOxb1DfRVDdP3qsnfA14QLvddxhK4Ya/qYZ9r2kOZhWiaF
 SmACTcA94/DQYUyeX9yLV4V5SQpaGzY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 177DFB130;
 Mon, 28 Sep 2020 13:38:43 +0000 (UTC)
Subject: Re: [PATCH 4/5] x86/ELF: also record FS/GS bases in
 elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <518a5f88-3ae4-a3ed-ab13-caaf7e8a7295@suse.com>
 <5e95ba48-68dc-81f4-1d62-f3310b0ba091@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26b0de09-98f7-aa27-5348-03dde141f365@suse.com>
Date: Mon, 28 Sep 2020 15:38:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5e95ba48-68dc-81f4-1d62-f3310b0ba091@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.09.2020 15:04, Andrew Cooper wrote:
> On 28/09/2020 13:06, Jan Beulich wrote:
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Any idea why this wasn't done before?

No. My only guess is laziness, in the sense of "I'll do it later" and
then forgetting.

>  At a minimum, I'd be tempted to
> put a sentence in the commit message saying "no idea why this wasn't
> done before".

Sure, done.

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

