Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC961770A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 08:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436125.690201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqUBm-0005A6-2g; Thu, 03 Nov 2022 06:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436125.690201; Thu, 03 Nov 2022 06:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqUBl-00057e-Vw; Thu, 03 Nov 2022 06:58:57 +0000
Received: by outflank-mailman (input) for mailman id 436125;
 Thu, 03 Nov 2022 06:58:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcaG=3D=onlineschubla.de=paul@srs-se1.protection.inumbo.net>)
 id 1oqUBk-00057Y-U7
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 06:58:57 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fac11bef-5b44-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 07:58:54 +0100 (CET)
Received: from mail.onlineschubla.de by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id U559b8yA36wrPKP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 3 Nov 2022 07:58:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.onlineschubla.de (Postfix) with ESMTP id 3DDDB201C6
 for <xen-devel@lists.xenproject.org>; Thu,  3 Nov 2022 07:58:53 +0100 (CET)
Received: from mail.onlineschubla.de ([127.0.0.1])
 by localhost (mail.onlineschubla.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZOmTMO2LQqH for <xen-devel@lists.xenproject.org>;
 Thu,  3 Nov 2022 07:58:52 +0100 (CET)
Received: from [192.168.178.167] (unknown [192.168.12.2])
 by mail.onlineschubla.de (Postfix) with ESMTPA id 4766520157
 for <xen-devel@lists.xenproject.org>; Thu,  3 Nov 2022 07:58:52 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fac11bef-5b44-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667458733;
    s=strato-dkim-0002; d=onlineschubla.de;
    h=In-Reply-To:From:References:To:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=HL5Rs1p4VGc86jYsZXj8jtLsWSZG7/oFL/FWfFH+RzY=;
    b=KnCgqQSP96edQgD3epReU4cvuNr7zev1c97DU2L/CMt524hloWr6z1wZLD0NJACDoT
    x0uDdzmjD0Nnx5fzQdnRkGwraNc7pxKTolTZA+1waa7R3dvDIFNLIkiQN6r8IzgCqJ4d
    jNiW9EHPYqO/eAD1gjqlsin2A1mhWoG+YEAxS9+RFG9j2pKKg3PTsWmlJJcI0ULu7OwC
    OiDsEG43tt7wmBRBOKACGk9OHD9CSLk3b9BRgaOrUen9/ZQZXEUGuN3orUPXyxksY61r
    1SjtCpW1MUDZx0A8dlmqJmk7dP+tu3rLEHKjCVk1WO8wOVau5YEiPO9tWYPJA+DZRmEt
    +6Dg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":PG0ReWCndfO3rCSML4AvNaDxJ7WJyilEI/NMX3IPsStZLbcZC9mNZx0oO96cCwabxEcCkdg/gSnE"
X-RZG-CLASS-ID: mo00
X-Virus-Scanned: Debian amavisd-new at onlineschubla.de
Message-ID: <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de>
Date: Thu, 3 Nov 2022 07:58:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
 <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
 <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
From: Paul Leiber <paul@onlineschubla.de>
In-Reply-To: <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 30.10.2022 um 17:36 schrieb G.R.:
> On Mon, Jan 10, 2022 at 10:54 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>> So looks like at least the imbalance between two directions are not
>>> related to your patch.
>>> Likely the debug build is a bigger contributor to the perf difference
>>> in both directions.
>>>
>>> I also tried your patch on a release build, and didn't observe any
>>> major difference in iperf3 numbers.
>>> Roughly match the 30Gbps and 1.xGbps number on the stock release kernel.
>> Thanks a lot, will try to get this upstream then.
>>
>> Roger.
> Hi Roger, any news for the upstream fix? I haven't heard any news since...
> The reason I came back to this thread is that I totally forgot about
> this issue and upgraded to FreeNAS 13 only to rediscover this issue
> once again :-(
>
> Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?
>
> Thanks,
> G.R.
>

Hi,

I want to confirm that the patch in an official release would make quite some people very happy. E.g. among OPNsense users, there are some who
suffer from the network issue [1]. FWIW, I compiled a kernel including Roger's patch, and it seems to be working without trouble in my OPNsense DomU.

Best regards,

Paul

[1] https://forum.opnsense.org/index.php?topic=28708.15


