Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA961E810C
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:58:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegSN-0002ky-Nm; Fri, 29 May 2020 14:57:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jegSM-0002kt-DU
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:57:58 +0000
X-Inumbo-ID: c82b2eb6-a1bc-11ea-a8cd-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c82b2eb6-a1bc-11ea-a8cd-12813bfff9fa;
 Fri, 29 May 2020 14:57:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9D60BAC24;
 Fri, 29 May 2020 14:57:56 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Improve error information in handle_pio()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200528130738.12816-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58d93dbe-11e3-ac1b-c2b5-b410ae837726@suse.com>
Date: Fri, 29 May 2020 16:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528130738.12816-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 15:07, Andrew Cooper wrote:
> domain_crash() should always have a message which emitted even in release

Oh, forgot to say: The wording here looks somewhat strange (and thus
unclear) to me.

> builds, so something more useful than this is presented.
> 
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   (XEN) domain_crash called from io.c:171
>   ...
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>


