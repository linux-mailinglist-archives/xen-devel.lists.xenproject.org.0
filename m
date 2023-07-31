Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FC76A0E8
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 21:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573435.898124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYHp-0000No-PJ; Mon, 31 Jul 2023 19:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573435.898124; Mon, 31 Jul 2023 19:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQYHp-0000Lc-MI; Mon, 31 Jul 2023 19:10:33 +0000
Received: by outflank-mailman (input) for mailman id 573435;
 Mon, 31 Jul 2023 19:10:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vA1f=DR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQYHo-0000LT-Jo
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 19:10:32 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea194a2f-2fd5-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 21:10:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8113E828466F;
 Mon, 31 Jul 2023 14:10:29 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Ll8us8oKiyNv; Mon, 31 Jul 2023 14:10:28 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BAE1582856A7;
 Mon, 31 Jul 2023 14:10:28 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zDsMDfKnZ33e; Mon, 31 Jul 2023 14:10:28 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2F562828466F;
 Mon, 31 Jul 2023 14:10:28 -0500 (CDT)
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
X-Inumbo-ID: ea194a2f-2fd5-11ee-b255-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com BAE1582856A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690830628; bh=m0zcKQFiB+S7bs/VBJ4VmiE/Y9E4MMVfcn49xchWozY=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=GsyRgg8bOmmmVeKvIuUqL7WyUD5CbdkwFYZ61R/uU70GN3gcrjFRJg769kLWRXk2I
	 3Gg8CuBDKnrceyGgf+7/Qq731iswbXjN3FxLLrE+j6ICVJeW82HEvdMWTjiOHOKlgC
	 oHTa1q92qO6+oR90CfetmP349Om2k+3iapEkL938=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <123b9273-c2c8-9fad-786e-e02821c3839e@raptorengineering.com>
Date: Mon, 31 Jul 2023 14:10:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/5] xen/ppc: Add OPAL API definition header file
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <7feead05db9baa310feaddd24415774582e88344.1690579561.git.sanastasio@raptorengineering.com>
 <7206fb11-a34e-4c47-3f15-83f5410db37a@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <7206fb11-a34e-4c47-3f15-83f5410db37a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/23 10:59 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> OPAL (OpenPower Abstraction Layer) is the interface exposed by firmware
>> on PowerNV (bare metal) systems. Import Linux's header definining the
>> API and related information.
> 
> To help future updating, mentioning version (or commit) at which this
> snapshot was taken would be helpful.

Sounds reasonable. I'll reference the Linux commit that this was pulled
from in the commit message.

> Jan

Thanks,
Shawn

