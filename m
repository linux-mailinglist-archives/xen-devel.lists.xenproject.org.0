Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BB268813
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 11:16:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHkaq-00066m-C8; Mon, 14 Sep 2020 09:16:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHkao-00066h-Sz
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 09:16:10 +0000
X-Inumbo-ID: 27b8e53e-8c3b-44d6-bfac-33985e4a48d8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27b8e53e-8c3b-44d6-bfac-33985e4a48d8;
 Mon, 14 Sep 2020 09:16:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13945B221;
 Mon, 14 Sep 2020 09:16:15 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] x86/xen.lds.S: Work around binutils build id
 alignment bug
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200907190027.669086-1-hudson@trmm.net>
 <20200907190027.669086-2-hudson@trmm.net>
 <5b8f533d-c646-8a52-cf37-d21b182ccf9b@suse.com>
 <6SnmUgvnHWozDhOcXRgAUuB_aEQdoXlOD5-uC6-t2LGRtadueg0vaUUmBISei_7NrT_9DCVBfNLUR12D6XTYoJNri7W2fw1_yeMUXULfwR0=@trmm.net>
 <e1eb360f-5ffc-aa3f-1f82-ace6c4bc6b0c@suse.com>
 <gdlY1Kh1f04pgsJpJS9plY_bWnJuywRv1f3Fm8C5I1Tuug8tl5Iv5XjbA8dHSiMSXgPURpnG2AjYfgvxKMZkpANq3_H3f7jHltoxqA-Wbs8=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67566841-2ad9-bb94-1ab0-736be847b001@suse.com>
Date: Mon, 14 Sep 2020 11:15:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <gdlY1Kh1f04pgsJpJS9plY_bWnJuywRv1f3Fm8C5I1Tuug8tl5Iv5XjbA8dHSiMSXgPURpnG2AjYfgvxKMZkpANq3_H3f7jHltoxqA-Wbs8=@trmm.net>
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

On 14.09.2020 11:14, Trammell Hudson wrote:
> On Tuesday, September 8, 2020 8:29 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> [...] As with, I think, the majority of new
>> features, distros would pick up your new functionality mainly for
>> use in new versions, and hence would likely run with new binutils
>> anyway by that time.
> 
> It also occurs to me that the binutils used to process the xen.efi
> image does not need to be the same as the one used to generate it,
> so there are no build-time dependencies on having this fix in place.
> 
> Dropping this patch from the series doesn't affect the ability of a
> distribution with a new binutils from being able to build unified
> images, so I'm fine with abandoning it.
> 
> Are there any further thoughts on the other parts of the series?

It's on my list of things to look at, yes. I'm sorry it's taking
some time to get there.

Jan

