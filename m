Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D07223043D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 09:39:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0KBy-0008N3-5U; Tue, 28 Jul 2020 07:38:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2JRE=BH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k0KBw-0008My-G9
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 07:38:28 +0000
X-Inumbo-ID: 5335b316-d0a5-11ea-8b19-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5335b316-d0a5-11ea-8b19-bc764e2007e4;
 Tue, 28 Jul 2020 07:38:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4630AD32;
 Tue, 28 Jul 2020 07:38:37 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] Few bug fixes and Convert to pin_user_pages*()
To: Souptick Joarder <jrdr.linux@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, sstabellini@kernel.org
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6za8U04U2TQhe6DUCv7B4h9L-iqPtyE1DuALXUWOD=1M3A@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d6489b26-3891-cfc2-e614-1d5677d3999f@suse.com>
Date: Tue, 28 Jul 2020 09:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6za8U04U2TQhe6DUCv7B4h9L-iqPtyE1DuALXUWOD=1M3A@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.20 09:10, Souptick Joarder wrote:
> Hi Boris,
> 
> On Sun, Jul 12, 2020 at 9:01 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>>
>> This series contains few clean up, minor bug fixes and
>> Convert get_user_pages() to pin_user_pages().
>>
>> I'm compile tested this, but unable to run-time test,
>> so any testing help is much appriciated.
>>
>> v2:
>>          Addressed few review comments and compile issue.
>>          Patch[1/2] from v1 split into 2 in v2.
>> v3:
>>          Address review comment. Add review tag.
>>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Cc: Paul Durrant <xadimgnik@gmail.com>
>>
>> Souptick Joarder (3):
>>    xen/privcmd: Corrected error handling path
>>    xen/privcmd: Mark pages as dirty
>>    xen/privcmd: Convert get_user_pages*() to pin_user_pages*()
> 
> Does this series looks good to go for 5.9 ?

Yes. I already have it in my queue.


Juergen

