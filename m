Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE903462E6
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 16:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100724.192075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj06-0002gy-2h; Tue, 23 Mar 2021 15:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100724.192075; Tue, 23 Mar 2021 15:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj05-0002gW-Vc; Tue, 23 Mar 2021 15:31:21 +0000
Received: by outflank-mailman (input) for mailman id 100724;
 Tue, 23 Mar 2021 15:31:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lOj04-0002gR-8I
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:31:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2ae88f9-fb7a-4ef6-8253-df6987c91f49;
 Tue, 23 Mar 2021 15:31:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17E84AD80;
 Tue, 23 Mar 2021 15:31:18 +0000 (UTC)
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
X-Inumbo-ID: d2ae88f9-fb7a-4ef6-8253-df6987c91f49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616513478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WA8CqcYb3xXb2VB7uZrlTmVh9WIGVIIeJ5A33NDqyA=;
	b=qBoYOBd6bYJEG57sLvccJp5L/V7+n4YT6s5tYXPZFWkritYDB5e27BYrNDeYn3QesrkWAZ
	iA4f3TqIlF48V6IOUo4JaSnLwxJ2ynbnMRzx9zvCcDemjynjCoLAwKVgMN0XRcyg1XVVrp
	I41WpAv2rj7XIcy1KxVeMTmEmb4buoI=
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Ian Jackson <iwj@xenproject.org>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20210322133301.11308-1-jandryuk@gmail.com>
 <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com>
 <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com>
 <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
 <CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com>
 <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com>
 <24665.61470.964721.635678@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8099fca3-3ded-d137-a22a-95798d02cc74@suse.com>
Date: Tue, 23 Mar 2021 16:31:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24665.61470.964721.635678@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.03.2021 14:41, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] xen: Create EFI_VENDOR directory"):
>> On 23.03.2021 13:34, Jason Andryuk wrote:
> ...
>>> On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
>>> grub, shim, fwupdate and xen are all packaged that way.  It seems
>>> reasonable to have those important binaries tracked by the package
>>> manager.
>>>
>>> Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
>>> script is called?
>>
>> Yes. And back at the time, when I consulted our EFI person, I was left
>> with the impression that this is the only reasonable approach. The
>> primary reason, as said, was that the EFI partition as a whole may get
>> rebuilt perhaps even from scratch at any point. Hence it's not
>> reasonable to expect package-managed files to live there.
> 
> I agree with this analysis but it is for people like Fedora to decide
> how they want to build their packages.
> 
> There is also the case of ad-hoc packages (eg our "make debball")
> which the user might reasonably choose to have dump things in the EFI
> system partition.

Well, it that's deemed reasonable, then perhaps yes. Albeit such
ad-hoc packaging could then also involve the creation of that dir.

> Conversely, I see no downside to the mkdir.  Jan, is there some actual
> harm in it ?  If not, we should be accomodating to people's build and
> packaging strategies even if we don't entirely approve of them.

"Actual harm" is relative: Nothing's going to break afaict. There'll
be a leftover dir from an install immediately followed by an
uninstall. I consider such okay for the purpose of the install step
that I did outline; I wouldn't consider it okay for a package
install/uninstall. But nothing worse, I guess. So bottom line - my
objection is not to be taken as a NAK. If everyone else wants the
change, then so be it.

Jan

