Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0D73F5D3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 09:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555888.868062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3EI-00053F-NL; Tue, 27 Jun 2023 07:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555888.868062; Tue, 27 Jun 2023 07:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE3EI-0004zu-Jr; Tue, 27 Jun 2023 07:35:14 +0000
Received: by outflank-mailman (input) for mailman id 555888;
 Tue, 27 Jun 2023 07:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EECo=CP=bounce.vates.fr=bounce-md_30504962.649a912d.v1-609155a8b5504464ad2be0f722b1f101@srs-se1.protection.inumbo.net>)
 id 1qE3EH-0004zo-17
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 07:35:13 +0000
Received: from mail136-22.atl41.mandrillapp.com
 (mail136-22.atl41.mandrillapp.com [198.2.136.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24e7ec05-14bd-11ee-8611-37d641c3527e;
 Tue, 27 Jun 2023 09:35:10 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-22.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4QqxM117HNzFCWYbg
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 07:35:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 609155a8b5504464ad2be0f722b1f101; Tue, 27 Jun 2023 07:35:09 +0000
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
X-Inumbo-ID: 24e7ec05-14bd-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.fr;
	s=mandrill; t=1687851309; x=1688111809; i=yann.dirson@vates.fr;
	bh=OkqwrC9aV5kjEbZ5lyL+O0Q6loF+qbwkSSkhYCoatTM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hb4zEaAGkSJ3AuGf7mxP93XCdrHiWEcDVfdXsUgtHSSlrIdhQPNrUwq/W0gPTeUOZ
	 UI9ZR3/x7ciWjmX3FoimhsoYwP5O43/G1c6qGU+PA5I4vk3uLEo/HKescuqCkWxx8u
	 HgsGfCuzF78vr5QitC/VBEQoZvdMnoIfDKbHP1yY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1687851309; h=From : 
 Subject : Message-Id : To : Cc : References : In-Reply-To : Date : 
 MIME-Version : Content-Type : Content-Transfer-Encoding : From : 
 Subject : Date : X-Mandrill-User : List-Unsubscribe; 
 bh=OkqwrC9aV5kjEbZ5lyL+O0Q6loF+qbwkSSkhYCoatTM=; 
 b=ZvtNXDmwc3RmE0xaV+VGGkKsIJdRh4d41HDIHrocV+U1pTqjE8iPgOAIT3NCJRAKOjWA7x
 PNdc9UfJ6TFfVMtuL0AgIDwMt+cD3PqK5bM2J2gieSLkfxDg4QxR86FUz4yvCTz8SILUQASr
 1si4hLp+OoxgEaGb9XgNmSO7Omj3c=
From: Yann Dirson <yann.dirson@vates.fr>
Subject: =?utf-8?Q?Re:=20[PATCH=201/1]=20doc:=20clarify=20intended=20usage=20of=20~/control/=20xentore=20path?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 39f1d088-dab6-450b-998d-f0ee110bfa80
X-Bm-Transport-Timestamp: 1687851306505
Message-Id: <046475ca-a940-d9c6-9913-26bf7fe3ca25@vates.fr>
To: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230531103427.1551719-1-yann.dirson@vates.fr> <20230531103427.1551719-2-yann.dirson@vates.fr> <d28b77ef-f6c8-e95c-c484-4025c6f51eb7@xen.org> <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
In-Reply-To: <ede5628d-31c2-9637-df60-209d0c9107d8@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.609155a8b5504464ad2be0f722b1f101?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20230627:md
Date: Tue, 27 Jun 2023 07:35:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

As discussed in Xen Summit, we likely don't want to merge it as is after 
all, but rather acknowledge that XAPI has taken the opposite route and 
allow the toolstack to give ownership of ~/control (or at least write 
permission?) to the guest -- maybe also recommending not to do that.

Would that sound OK to everyone?

On 6/27/23 09:04, Juergen Gross wrote:
> On 24.06.23 16:07, Julien Grall wrote:
>> Hi Yann,
>>
>> Adding Juergen.
>>
>> On 31/05/2023 11:35, Yann Dirson wrote:
>>> Signed-off-by: Yann Dirson <yann.dirson@vates.fr>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> 
> Juergen
> 

-- 
Yann Dirson | Vates Platform Developer
XCP-ng & Xen Orchestra - Vates solutions
w: vates.tech | xcp-ng.org | xen-orchestra.com


Yann Dirson | Vates Platform Developer

XCP-ng & Xen Orchestra - Vates solutions
web: https://vates.tech

