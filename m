Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E268B704DCB
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535168.832797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyto9-0000Vq-5g; Tue, 16 May 2023 12:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535168.832797; Tue, 16 May 2023 12:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyto9-0000TU-2U; Tue, 16 May 2023 12:29:37 +0000
Received: by outflank-mailman (input) for mailman id 535168;
 Tue, 16 May 2023 12:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r255=BF=gmail.com=fschmaus@srs-se1.protection.inumbo.net>)
 id 1pyto7-0000St-Iu
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:29:35 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ff738ef-f3e5-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 14:29:33 +0200 (CEST)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-510b154559fso151382a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 May 2023 05:29:33 -0700 (PDT)
Received: from [192.168.188.10] ([62.27.195.158])
 by smtp.gmail.com with ESMTPSA id
 j5-20020aa7de85000000b0050bc4600d38sm8155527edv.79.2023.05.16.05.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 05:29:31 -0700 (PDT)
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
X-Inumbo-ID: 4ff738ef-f3e5-11ed-8611-37d641c3527e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684240173; x=1686832173;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UF5NoWStWTbq5Siz8QiSqYAnylhbCK2MRLmmjITL1bI=;
        b=eWwDUAoxpDyTeGYgjIY134fuC4mO6F7lPfb4A0np4wpsnWO7OaGf/ckwddNodQXt8U
         7vb7w6fvbn5EgPUNNbb1cR55k/6bvenTYlUtaKoTatIGrnB/zA7TQks94Xibi6Ru4E3L
         aJPg7kUmYRwmPB0hyss9wF2O2Be1gfO7kzS09Vz/xSl8/X4excS+7WsBANvWqQvXWgiE
         OsXOttNhe4fpuB3YjwqMAOta08IF88km+u/7SJLtqmFE/0wrusbe9MemTvoq/sD5k1Ix
         2RrTXaGTMMShxc7KGLWFyxJ1sJTpO83sjaHdTp0wo4ENQfv0MwFSa7hfhabttAQ88i2I
         aSPg==
X-Gm-Message-State: AC+VfDxTXp00NFcSfkV6hxFnVPEHVNGiuU41GzT4acDdDho+GIQh8sh3
	jk5mk4kEDe5wbL8o76dwBR1xaqcGhMaS6Q==
X-Google-Smtp-Source: ACHHUZ4JoLeFY7w99FQg7BKppaQ5imA8yq2767XrRyJJ5B0EtqtNb7oEoYcQXXCwDgWji0zAGJVViQ==
X-Received: by 2002:aa7:c04a:0:b0:50d:be83:9ff2 with SMTP id k10-20020aa7c04a000000b0050dbe839ff2mr19037594edo.23.1684240172521;
        Tue, 16 May 2023 05:29:32 -0700 (PDT)
Message-ID: <42cd7c2e-4bcc-5743-59b5-eed4e5289df7@geekplace.eu>
Date: Tue, 16 May 2023 14:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] m4/ptyfuncs.m4 tools/configure: add linux headers for pty
 functions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230516091355.721398-1-flo@geekplace.eu>
 <6e9af5ec-4484-38ed-2b40-6231baa9ec93@citrix.com>
From: Florian Schmaus <flo@geekplace.eu>
In-Reply-To: <6e9af5ec-4484-38ed-2b40-6231baa9ec93@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/05/2023 12.34, Andrew Cooper wrote:
> On 16/05/2023 10:13 am, Florian Schmaus wrote:
>> To avoid implicit function declarations, which will cause an error on
>> modern compilers. See https://wiki.gentoo.org/wiki/Modern_C_porting
>>
>> Downstream Gentoo bug: https://bugs.gentoo.org/904449
>>
>> Signed-off-by: Florian Schmaus <flo@geekplace.eu>
> 
> Thanks for the patch, but there's already a different fix in flight.

Thanks for the fast response pointing out the other patch.

> Does
> https://lore.kernel.org/xen-devel/20230512122614.3724-1-olaf@aepfle.de/
> work for you?  If so, we'd definitely prefer to take the deletion of
> obsolete functionality.

After a quick glance at the patch I believe that it would also achieve 
the same goal, while it is better than my approach.

- Florian

