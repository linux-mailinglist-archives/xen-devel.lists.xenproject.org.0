Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D4535DC5B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 12:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109654.209334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG7p-0000Ns-SJ; Tue, 13 Apr 2021 10:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109654.209334; Tue, 13 Apr 2021 10:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWG7p-0000NT-PB; Tue, 13 Apr 2021 10:18:29 +0000
Received: by outflank-mailman (input) for mailman id 109654;
 Tue, 13 Apr 2021 10:18:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OBYq=JK=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1lWG7p-0000NO-4O
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 10:18:29 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d78b20a2-8dd4-4d9e-93d0-882a3f574ab0;
 Tue, 13 Apr 2021 10:18:28 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-4L1p0jZGPi2EEMc9htak4w-1; Tue, 13 Apr 2021 06:18:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 058CB814337;
 Tue, 13 Apr 2021 10:18:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-199.ams2.redhat.com
 [10.36.115.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6ECF62967D;
 Tue, 13 Apr 2021 10:18:17 +0000 (UTC)
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
X-Inumbo-ID: d78b20a2-8dd4-4d9e-93d0-882a3f574ab0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618309107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6JXSOnWFPQcYcJpN/lhDhlxyRcMiYtsdgrU+YMw8Wk=;
	b=EmfwRS6PWD698uws/nxmroElmHEhQyl0eynrMA4cH+gQSdq50ESywP1GwnIRh/n05r8CDV
	ALDVvQTHhujax8cASHYLGV+sMnDDL4YqmyLSFo9GByZRez4JjY2VcPgZUcUbLtuax7j1eQ
	IOsJOcRAjipKoaF2ARFMpdhuh5f7Ki0=
X-MC-Unique: 4L1p0jZGPi2EEMc9htak4w-1
Subject: =?UTF-8?Q?Re:_=e5=9b=9e=e5=a4=8d:_[edk2-devel]_[PATCH_v3_2/7]_MdePk?=
 =?UTF-8?Q?g:_Allow_PcdFSBClock_to_by_Dynamic?=
To: gaoliming <gaoliming@byosoft.com.cn>, devel@edk2.groups.io,
 anthony.perard@citrix.com
Cc: 'Jordan Justen' <jordan.l.justen@intel.com>,
 'Ard Biesheuvel' <ardb+tianocore@kernel.org>,
 xen-devel@lists.xenproject.org, 'Julien Grall' <julien@xen.org>,
 'Michael D Kinney' <michael.d.kinney@intel.com>,
 'Zhiguang Liu' <zhiguang.liu@intel.com>, 'Liming Gao' <liming.gao@intel.com>
References: <20210412133003.146438-1-anthony.perard@citrix.com>
 <20210412133003.146438-3-anthony.perard@citrix.com>
 <00c601d73000$350a7510$9f1f5f30$@byosoft.com.cn>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8fce5f56-de1b-f2e0-6ec6-ed7c29d56ede@redhat.com>
Date: Tue, 13 Apr 2021 12:18:16 +0200
MIME-Version: 1.0
In-Reply-To: <00c601d73000$350a7510$9f1f5f30$@byosoft.com.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04/13/21 02:59, gaoliming wrote:
> Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>

Thanks, I've updated the email address in your existent R-b on the patch.

Laszlo

> 
>> -----邮件原件-----
>> 发件人: devel@edk2.groups.io <devel@edk2.groups.io> 代表 Anthony
>> PERARD via groups.io
>> 发送时间: 2021年4月12日 21:30
>> 收件人: devel@edk2.groups.io
>> 抄送: Laszlo Ersek <lersek@redhat.com>; Jordan Justen
>> <jordan.l.justen@intel.com>; Ard Biesheuvel <ardb+tianocore@kernel.org>;
>> xen-devel@lists.xenproject.org; Anthony PERARD
>> <anthony.perard@citrix.com>; Julien Grall <julien@xen.org>; Michael D
>> Kinney <michael.d.kinney@intel.com>; Liming Gao
>> <gaoliming@byosoft.com.cn>; Zhiguang Liu <zhiguang.liu@intel.com>; Liming
>> Gao <liming.gao@intel.com>
>> 主题: [edk2-devel] [PATCH v3 2/7] MdePkg: Allow PcdFSBClock to by
>> Dynamic
>>
>> We are going to want to change the value of PcdFSBClock at run time in
>> OvmfXen, so move it to the PcdsDynamic section.
>>
>> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=2490
>> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
>> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
>> Reviewed-by: Liming Gao <liming.gao@intel.com>
>> ---
>>
>> Notes:
>>     CC: Michael D Kinney <michael.d.kinney@intel.com>
>>     CC: Liming Gao <gaoliming@byosoft.com.cn>
>>     CC: Zhiguang Liu <zhiguang.liu@intel.com>
>>
>>  MdePkg/MdePkg.dec | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
>> index f4156920e599..8965e903e093 100644
>> --- a/MdePkg/MdePkg.dec
>> +++ b/MdePkg/MdePkg.dec
>> @@ -2265,10 +2265,6 @@ [PcdsFixedAtBuild,PcdsPatchableInModule]
>>    # @ValidList  0x80000001 | 8, 16, 32
>>    gEfiMdePkgTokenSpaceGuid.PcdPort80DataWidth|8|UINT8|0x0000002d
>>
>> -  ## This value is used to configure X86 Processor FSB clock.
>> -  # @Prompt FSB Clock.
>> -
>> gEfiMdePkgTokenSpaceGuid.PcdFSBClock|200000000|UINT32|0x0000000c
>> -
>>    ## The maximum printable number of characters. UefLib functions:
>> AsciiPrint(), AsciiErrorPrint(),
>>    #  PrintXY(), AsciiPrintXY(), Print(), ErrorPrint() base on this PCD
> value to
>> print characters.
>>    # @Prompt Maximum Printable Number of Characters.
>> @@ -2372,5 +2368,9 @@ [PcdsFixedAtBuild, PcdsPatchableInModule,
>> PcdsDynamic, PcdsDynamicEx]
>>    # @Prompt Boot Timeout (s)
>>
>> gEfiMdePkgTokenSpaceGuid.PcdPlatformBootTimeOut|0xffff|UINT16|0x0000
>> 002c
>>
>> +  ## This value is used to configure X86 Processor FSB clock.
>> +  # @Prompt FSB Clock.
>> +
>> gEfiMdePkgTokenSpaceGuid.PcdFSBClock|200000000|UINT32|0x0000000c
>> +
>>  [UserExtensions.TianoCore."ExtraFiles"]
>>    MdePkgExtra.uni
>> --
>> Anthony PERARD
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Groups.io Links: You receive all messages sent to this group.
>> View/Reply Online (#73954): https://edk2.groups.io/g/devel/message/73954
>> Mute This Topic: https://groups.io/mt/82037830/4905953
>> Group Owner: devel+owner@edk2.groups.io
>> Unsubscribe: https://edk2.groups.io/g/devel/unsub
>> [gaoliming@byosoft.com.cn]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 
> 


