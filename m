Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1A8C69C2
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722512.1126561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GaV-0007rJ-T3; Wed, 15 May 2024 15:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722512.1126561; Wed, 15 May 2024 15:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GaV-0007pE-Pj; Wed, 15 May 2024 15:30:39 +0000
Received: by outflank-mailman (input) for mailman id 722512;
 Wed, 15 May 2024 15:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1aeg=MS=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1s7GaT-0005FX-La
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:30:37 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d56de2-12d0-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:30:35 +0200 (CEST)
Received: from mail.solinno.uk (localhost [127.0.0.1])
 by doppler.solinno.uk (Postfix) with ESMTP id E2A9880068;
 Wed, 15 May 2024 16:30:34 +0100 (BST)
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
X-Inumbo-ID: 12d56de2-12d0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1715787034;
	bh=9h8ymMqtRs462F/ihippUsQtICketsWkIzl7UyFP8uA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2PKjIe7NNtR8Nzp83aPPRIuS2tSG96MmKGh2BPsJfSzy8VXHIEvfwR1nx59WzAzSh
	 P5MoHNwh5eOaoq2bHhWyKvIFtSidTjvdBN1DJOnuvdaUsq7QwubA8SRHDq3+dLXlBg
	 B6A3yhqaUrf48rJTrcH0s+U1UP8adIQtmPxpgCxc=
MIME-Version: 1.0
Date: Wed, 15 May 2024 16:30:34 +0100
From: Leigh Brown <leigh@solinno.co.uk>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@citrix.com
Subject: Re: [RFC PATCH v2 4/5] docs/man: document VIF vlan keyword
In-Reply-To: <CAKf6xpviWyFxt4JMq23K0LxjDcP2zJF1Sqye=1jS2UAtwcaRww@mail.gmail.com>
References: <20240508213824.55824-1-leigh@solinno.co.uk>
 <20240508213824.55824-5-leigh@solinno.co.uk>
 <CAKf6xpviWyFxt4JMq23K0LxjDcP2zJF1Sqye=1jS2UAtwcaRww@mail.gmail.com>
Message-ID: <c62b512c3b1ea58fb07e50df85b4ebd6@solinno.co.uk>
X-Sender: leigh@solinno.co.uk
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason,

On 2024-05-15 01:57, Jason Andryuk wrote:
> On Wed, May 8, 2024 at 5:39 PM Leigh Brown <leigh@solinno.co.uk> wrote:
>> 
>> Document the new `vlan' keyword in xl-network-configuration(5).
>> 
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> One nit below
> 
>> ---
>>  docs/man/xl-network-configuration.5.pod.in | 38 
>> ++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>> 
>> diff --git a/docs/man/xl-network-configuration.5.pod.in 
>> b/docs/man/xl-network-configuration.5.pod.in
>> index f3e379bcf8..c35c0922b3 100644
>> --- a/docs/man/xl-network-configuration.5.pod.in
>> +++ b/docs/man/xl-network-configuration.5.pod.in
>> @@ -259,6 +259,44 @@ Specifies the MTU (i.e. the maximum size of an IP 
>> payload, exclusing headers). T
> 
>> +Note, one VLAN ID must be marked as the PVID. In the case of a vlan
>> +specification consisting of a single VLAN ID (e.g. C<vlan=10>), the 
>> B<p> suffix
>> +may be omitted. Specifying more than one untagged VLAN ID is an 
>> advanced
>> +configuration - use with caution.
>> +
>> +For example:
>> +
>> +        'vlan=10' -- meaning a single VLAN that is the PVID.
>> +       'vlan=10p/20' -- VLAN 10 is the PVID and VLAN 20 is tagged.
>> +       'vlan=10p/100+10x4' -- VLANs 10, 100, 110, 120, 130, 140, 150.
> 
> Indent mismatch between 7 and 8 spaces.

FWIW I will sort that too :-)

>> +
>>  =head2 trusted / untrusted
>> 
>>  An advisory setting for the frontend driver on whether the backend 
>> should be
>> --
>> 2.39.2
>> 
>> 

Regards,

Leigh.

