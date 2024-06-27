Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092B91A2BC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 11:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749874.1158096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlW2-0002pM-0M; Thu, 27 Jun 2024 09:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749874.1158096; Thu, 27 Jun 2024 09:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMlW1-0002np-Tk; Thu, 27 Jun 2024 09:34:05 +0000
Received: by outflank-mailman (input) for mailman id 749874;
 Thu, 27 Jun 2024 09:34:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0yt=N5=outstep.com=lonnie@srs-se1.protection.inumbo.net>)
 id 1sMlW0-0002nj-RV
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 09:34:04 +0000
Received: from mail.outstep.net (mail.outstep.net [213.136.84.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6430e5e1-3468-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 11:34:03 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E0C37234103E; Thu, 27 Jun 2024 11:33:50 +0200 (CEST)
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
X-Inumbo-ID: 6430e5e1-3468-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outstep.com; s=dkim;
	t=1719480837; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-language:in-reply-to:references:autocrypt;
	bh=2WaVWz1uKoPy7V5jJP8XhvKRNX5ChIzE5XRMe+7TDC0=;
	b=WxRx7U+StoLNMAdgDycZ7ZqkB35I4QVfRRgx+R7ip7VXWDuKU3Roo9wO6aFGKWtOoLIK7t
	8EbNaa+x148EM+CUVsiUWnDzmIltnSyXpxRjksx+XK/6SsbvUcvNf5TFeMZNHbq4IrGdtX
	bZAciksHjXmPPisoq7+tmRbJOVTzEbW+/FAzcLx81ZKxbUrUiLy3nG4wHufB+9NDjtY3u1
	d+g8MLUmIMaTkihQhtxHZc18wo0zxUys/o3S1IeI/3nNb+oZzdXzzW+kDs9Hj3RGeKtgdh
	FYnlWB4pY7y8bkon19iI4lbxhFrv/cZEfScpzWu31jlbKdYxMrpK8sm1a0nVpg==
Content-Type: multipart/alternative;
 boundary="------------QHu000RIvSuCk0jjQNql1ZiU"
Message-ID: <be292bcf-d77f-44ba-b29a-b1608586647b@outstep.com>
Date: Thu, 27 Jun 2024 05:33:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Disaggregated (Xoar) Dom0 Building
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>
 <59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com>
Content-Language: en-US
From: Lonnie Cumberland <lonnie@outstep.com>
Autocrypt: addr=lonnie@outstep.com; keydata=
 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
 WujEwGqqyfUF7eo=
In-Reply-To: <59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com>
X-Last-TLS-Session-Version: TLSv1.3

This is a multi-part message in MIME format.
--------------QHu000RIvSuCk0jjQNql1ZiU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for your suggestions and information as I will definitely look 
into these more.

I have a very brief introduction to Dom0less and it is definitely 
something of interest for me to  review as well.

On the QubesOS side, I also read up a little on it and while it has a 
number of similarities to what I am trying to do on the functional side, 
it seems to be a whole distro release that comes in a 6GB ISO download 
to install where as the project I am working towards is to have 
everything as a RAM-based ultra-lightweight thin hypervisor.   I looked 
over ACRN, the NOVA Microhypervisor (Headron, Beadrock Udo), 
Rust-Shyper, Bareflank-MicroV, and many other development efforts but it 
seems that Xen is the most advanced for my purposes here.

Thanks again and I will dig into everything much more as well.

Have a great day,
Lonnie

On 6/27/2024 1:54 AM, Juergen Gross wrote:
> On 26.06.24 18:47, Lonnie Cumberland wrote:
>> Hello All,
>>
>> I hope that everyone is doing well today.
>>
>> Currently, I am investigating and researching the ideas of 
>> "Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking Up is 
>> Hard to Do: Security and Functionality in a Commodity Hypervisor" 
>> 2011) available which were developed against version 22155 of 
>> xen-unstable. The Linux patches are against Linux with pvops 
>> 2.6.31.13 and developed on a standard Ubuntu 10.04 install. My effort 
>> would also be up update these patches.
>>
>> I have been able to locate the Xen "Dom0 Disaggregation" 
>> (https://wiki.xenproject.org/wiki/Dom0_Disaggregation) am reading up 
>> on things now but wanted to ask the developers list about any 
>> experience you may have had in this area since the research objective 
>> is to integrate Xoar with the latest Xen 4.20, if possible, and to 
>> take it further to basically eliminate Dom0 all together with 
>> individual Mini-OS or Unikernel "Service and Driver VM's" instead 
>> that are loaded at UEFI boot time.
>>
>> Any guidance, thoughts, or ideas would be greatly appreciated,
>
> Just some pointers, this is not an exhaustive list:
>
> - you should have a look at dom0less (see 
> docs/features/dom0less.pandoc in
>   the Xen source tree) and hyperlauch (see 
> docs/designs/launch/hyperlaunch.rst
>   in the Xen source tree)
>
> - Xenstore in a stub-domain is working fine, it is the default in 
> openSUSE and
>   SLE
>
> - QubesOS has a lot of the disaggregation you are looking for implemented
>
> - I'm pretty sure only very few changes should be needed for the Linux 
> kernel,
>   if any.
>
>
> Juergen

--------------QHu000RIvSuCk0jjQNql1ZiU
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Times New Roman, Times, serif">Thanks for your
      suggestions and information as I will definitely look into these
      more.<br>
      <br>
      I have a very brief introduction to Dom0less and it is definitely
      something of interest for me to  review as well.<br>
      <br>
      On the QubesOS side, I also read up a little on it and while it
      has a number of similarities to what I am trying to do on the
      functional side, it seems to be a whole distro release that comes
      in a 6GB ISO download to install where as the project I am working
      towards is to have everything as a RAM-based ultra-lightweight
      thin hypervisor.   I looked over ACRN, the NOVA Microhypervisor
      (Headron, Beadrock Udo), Rust-Shyper, Bareflank-MicroV, and many
      other development efforts but it seems that Xen is the most
      advanced for my purposes here.<br>
      <br>
      Thanks again and I will dig into everything much more as well.<br>
      <br>
      Have a great day,<br>
      Lonnie<br>
    </font><br>
    <div class="moz-cite-prefix">On 6/27/2024 1:54 AM, Juergen Gross
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:59d67a78-14a0-42ac-b0dc-3d75c109f767@suse.com">On
      26.06.24 18:47, Lonnie Cumberland wrote:
      <br>
      <blockquote type="cite">Hello All,
        <br>
        <br>
        I hope that everyone is doing well today.
        <br>
        <br>
        Currently, I am investigating and researching the ideas of
        "Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking
        Up is Hard to Do: Security and Functionality in a Commodity
        Hypervisor" 2011) available which were developed against version
        22155 of xen-unstable. The Linux patches are against Linux with
        pvops 2.6.31.13 and developed on a standard Ubuntu 10.04
        install. My effort would also be up update these patches.
        <br>
        <br>
        I have been able to locate the Xen "Dom0 Disaggregation"
        (<a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Dom0_Disaggregation">https://wiki.xenproject.org/wiki/Dom0_Disaggregation</a>) am
        reading up on things now but wanted to ask the developers list
        about any experience you may have had in this area since the
        research objective is to integrate Xoar with the latest Xen
        4.20, if possible, and to take it further to basically eliminate
        Dom0 all together with individual Mini-OS or Unikernel "Service
        and Driver VM's" instead that are loaded at UEFI boot time.
        <br>
        <br>
        Any guidance, thoughts, or ideas would be greatly appreciated,
        <br>
      </blockquote>
      <br>
      Just some pointers, this is not an exhaustive list:
      <br>
      <br>
      - you should have a look at dom0less (see
      docs/features/dom0less.pandoc in
      <br>
        the Xen source tree) and hyperlauch (see
      docs/designs/launch/hyperlaunch.rst
      <br>
        in the Xen source tree)
      <br>
      <br>
      - Xenstore in a stub-domain is working fine, it is the default in
      openSUSE and
      <br>
        SLE
      <br>
      <br>
      - QubesOS has a lot of the disaggregation you are looking for
      implemented
      <br>
      <br>
      - I'm pretty sure only very few changes should be needed for the
      Linux kernel,
      <br>
        if any.
      <br>
      <br>
      <br>
      Juergen
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------QHu000RIvSuCk0jjQNql1ZiU--

