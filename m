Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D07AE1CB
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608144.946454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuFq-0005Oq-3S; Mon, 25 Sep 2023 22:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608144.946454; Mon, 25 Sep 2023 22:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkuFq-0005ML-08; Mon, 25 Sep 2023 22:40:38 +0000
Received: by outflank-mailman (input) for mailman id 608144;
 Mon, 25 Sep 2023 22:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxCo=FJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qkuFo-0005MB-Ik
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:40:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a327d43-5bf4-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 00:40:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B1785828562B;
 Mon, 25 Sep 2023 17:40:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9bqdO8Tm1XzL; Mon, 25 Sep 2023 17:40:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3D2A7828558A;
 Mon, 25 Sep 2023 17:40:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NT32EsywkuWV; Mon, 25 Sep 2023 17:40:32 -0500 (CDT)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C9F708285584;
 Mon, 25 Sep 2023 17:40:31 -0500 (CDT)
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
X-Inumbo-ID: 8a327d43-5bf4-11ee-878a-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3D2A7828558A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1695681632; bh=wDY6wR2J0s7hhbHs0gBHyRKApay1WV8kTMG6REQ+mRs=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=iKBI9iaybmJYHUJY6Eoqjj2aAFZSRxRZDX+Y6Cdx6B6Ivt57k3+uqtAN8uY94JqQs
	 PYubY+nnEraGcAvYn5ggXTZKULIXVRZ06PZocmK3gRuc/ZrYstTBsKoapKDXkWDYM6
	 z4XdAe4sm2TkvUWmlb538EZiAZ0Pbyr5G4ZeVpC8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <b5ecbf9d-a85c-7eab-b1bb-8c81fc5e9f20@raptorengineering.com>
Date: Mon, 25 Sep 2023 17:40:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: xen | Failed pipeline for staging | ea36ac0d
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <65096f918e2e5_29a56047619e@gitlab-sidekiq-catchall-v2-84c6ffbc68-bt8nn.mail>
 <9aa0fad3-4132-8444-fb3f-8e1d542652e6@suse.com>
 <752d163b-7830-9150-0757-8cadc22309f7@raptorengineering.com>
In-Reply-To: <752d163b-7830-9150-0757-8cadc22309f7@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/25/23 1:11 PM, Shawn Anastasio wrote:
> On 9/19/23 5:21 AM, Jan Beulich wrote:
>> These two, otoh, look to be a result of the tests pre-seeding xen/.config with
>> CONFIG_DEBUG settings, followed by making the olddefconfig goal. That, aiui,
>> isn't picking up xen/arch/*/configs/*_defconfig, which at this point is
>> mandatory for PPC (and likely is going to be so also for RISC-V once the full
>> build is enabled there), at least as far as some of the option disables there
>> go.
>>
>> I think this wants switching to making the defconfig goal, and substituting
>> CONFIG_DEBUG in the resulting .config. Due to x86'es and Arm's defconfig-s
>> all being empty, this ought to be no change in what exactly is being tested
>> there.
>>
> 
> These two have KBUILD_DEFCONFIG set to ppc64_defconfig in their
> configuration (build.yaml:552), so I'm not sure what exactly needs to be
> changed in order to get the desired behavior.
> 
Disregard this. After seeing Michal's follow-up I figured out the issue
and will submit a patch using the fix he proposed.

Thanks,
Shawn

