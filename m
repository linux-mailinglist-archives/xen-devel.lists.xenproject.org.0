Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F42283B6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 17:26:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxu9l-0000eb-RQ; Tue, 21 Jul 2020 15:26:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d7zm=BA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jxu9k-0000ds-Bh
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 15:26:12 +0000
X-Inumbo-ID: 8151b7de-cb66-11ea-a0f3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8151b7de-cb66-11ea-a0f3-12813bfff9fa;
 Tue, 21 Jul 2020 15:26:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F240FAE57;
 Tue, 21 Jul 2020 15:26:16 +0000 (UTC)
Subject: Re: [PATCH][next] x86/ioperm: initialize pointer bitmap with NULL
 rather than 0
To: Colin King <colin.king@canonical.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20200721100217.407975-1-colin.king@canonical.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <46011f9b-a5a6-b91c-f8c0-1c106ff5e60e@suse.com>
Date: Tue, 21 Jul 2020 17:26:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721100217.407975-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.07.20 12:02, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer bitmap is being initialized with a plain integer 0,
> fix this by initializing it with a NULL instead.
> 
> Cleans up sparse warning:
> arch/x86/xen/enlighten_pv.c:876:27: warning: Using plain integer
> as NULL pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

