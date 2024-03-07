Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31A875569
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 18:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689995.1075595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHlN-0001ae-06; Thu, 07 Mar 2024 17:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689995.1075595; Thu, 07 Mar 2024 17:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riHlM-0001Yr-Tn; Thu, 07 Mar 2024 17:42:36 +0000
Received: by outflank-mailman (input) for mailman id 689995;
 Thu, 07 Mar 2024 17:42:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M1Q8=KN=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1riHlM-0001Yl-EM
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 17:42:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 146b957e-dcaa-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 18:42:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8537D82855A1;
 Thu,  7 Mar 2024 11:42:33 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mJxmg77ypgQS; Thu,  7 Mar 2024 11:42:33 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EFF3882855B8;
 Thu,  7 Mar 2024 11:42:32 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fAOJl1r7LOu4; Thu,  7 Mar 2024 11:42:32 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 91F1A82855A1;
 Thu,  7 Mar 2024 11:42:32 -0600 (CST)
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
X-Inumbo-ID: 146b957e-dcaa-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EFF3882855B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1709833353; bh=udLhNytx/iZirHQTMFoTliqlsufJ0/pYIaFsuxGAJRo=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=jiAjiIKN9n8uJJ+BsHQ8e1upfBXet83CeuF21w5f7Q9NRICkg0iWUCltrLovf3/Sx
	 T0mc3XMecCGPMBCSJFXKV0nDp4YIkVDS2cSsXxvgWxyIba/T4u3jiP0ctAG4x+rnJm
	 4MTflt/2ZX/ws0TnYGrZvU3x3JBiHrol1KnWTpWI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8d602d68-b5d1-416d-b6b3-d9c0593e762c@raptorengineering.com>
Date: Thu, 7 Mar 2024 11:42:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] xen/ppc: switch PPC to use asm-generic/device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <222ae66639312712e145bd04d5dd1ebd2c511d43.1708086092.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <222ae66639312712e145bd04d5dd1ebd2c511d43.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 2/16/24 6:39 AM, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

