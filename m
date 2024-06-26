Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F19187DC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 18:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749364.1157438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVoC-0001zZ-Rd; Wed, 26 Jun 2024 16:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749364.1157438; Wed, 26 Jun 2024 16:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMVoC-0001xY-P1; Wed, 26 Jun 2024 16:47:48 +0000
Received: by outflank-mailman (input) for mailman id 749364;
 Wed, 26 Jun 2024 16:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3dI=N4=outstep.com=lonnie@srs-se1.protection.inumbo.net>)
 id 1sMVoB-0001xG-L4
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 16:47:47 +0000
Received: from mail.outstep.net (mail.outstep.net [213.136.84.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfeb67c5-33db-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 18:47:45 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 57610234103E
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 18:47:39 +0200 (CEST)
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
X-Inumbo-ID: cfeb67c5-33db-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outstep.com; s=dkim;
	t=1719420462; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-language:autocrypt; bh=x08X/ypKSwkbCNlQgqgo6NU4pKrMrIcRQFTRqQOC1N4=;
	b=nsRQfg8ByytfBOVNGZwYHHhzhxmoMLXgWo5OZ1LER3ZXfyj7Sj2cBQCh0xY1YIqpXbZIk1
	JZd6/jP0hpGtx8n95OZ29Upsx4fW7mbHv8M3+m3qEjgII6/6iILz6elaPU3HsS7/BJXpHp
	hnpjB/SpvC1GDZk2aPq69jG3eTuSzA2TqG+tYSnff7w/d5rpcbhCFsjqQqiDTcaUSJcN/3
	3MN7x4OSaW+qo5AbY67xtPJ0y97stSDBMT+rTvrm7YaT0zmisi7Hczu8A4UXF2lX0JwEhg
	9kM5SE2k/AZrroRiJMy4qHLieT3Eh32/q0NGPmUNr0vB3KonjkGv6CSrdaCXyA==
Content-Type: multipart/alternative;
 boundary="------------292oU0MEsyLYdgj3qgD92PnY"
Message-ID: <376f0fe4-4ae8-461d-87f2-0fa2e6913689@outstep.com>
Date: Wed, 26 Jun 2024 12:47:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xen-devel@lists.xenproject.org
Content-Language: en-US
From: Lonnie Cumberland <lonnie@outstep.com>
Subject: Disaggregated (Xoar) Dom0 Building
Autocrypt: addr=lonnie@outstep.com; keydata=
 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
 WujEwGqqyfUF7eo=
X-Last-TLS-Session-Version: TLSv1.3

This is a multi-part message in MIME format.
--------------292oU0MEsyLYdgj3qgD92PnY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello All,

I hope that everyone is doing well today.

Currently, I am investigating and researching the ideas of 
"Disaggregating" Dom0 and have the Xoar Xen patches ("Breaking Up is 
Hard to Do: Security and Functionality in a Commodity Hypervisor" 2011) 
available which were developed against version 22155 of xen-unstable. 
The Linux patches are against Linux with pvops 2.6.31.13 and developed 
on a standard Ubuntu 10.04 install. My effort would also be up update 
these patches.

I have been able to locate the Xen "Dom0 Disaggregation" 
(https://wiki.xenproject.org/wiki/Dom0_Disaggregation) am reading up on 
things now but wanted to ask the developers list about any experience 
you may have had in this area since the research objective is to 
integrate Xoar with the latest Xen 4.20, if possible, and to take it 
further to basically eliminate Dom0 all together with individual Mini-OS 
or Unikernel "Service and Driver VM's" instead that are loaded at UEFI 
boot time.


Any guidance, thoughts, or ideas would be greatly appreciated,
Thanks and have a great day,
Lonnie
--------------292oU0MEsyLYdgj3qgD92PnY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Times New Roman, Times, serif">Hello All,<br>
      <br>
      I hope that everyone is doing well today.<br>
      <br>
      Currently, I am investigating and researching the ideas of
      "Disaggregating" Dom0 and have the Xoar Xen patches ("</font>Breaking
    Up is Hard to Do: Security and Functionality in a
    Commodity Hypervisor<font face="Times New Roman, Times, serif">"
      2011) available which were developed against version 22155 of
      xen-unstable. The Linux patches are against Linux with pvops
      2.6.31.13 and developed on a standard Ubuntu 10.04 install. My
      effort would also be up update these patches.<br>
      <br>
      I have been able to locate the Xen "Dom0 Disaggregation"
      (<a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Dom0_Disaggregation">https://wiki.xenproject.org/wiki/Dom0_Disaggregation</a>) am reading
      up on things now but wanted to ask the developers list about any
      experience you may have had in this area since the research
      objective is to integrate Xoar with the latest Xen 4.20, if
      possible, and to take it further to basically eliminate Dom0 all
      together with individual Mini-OS or Unikernel "Service and Driver
      VM's" instead that are loaded at UEFI boot time.<br>
      <br>
      <br>
      Any guidance, thoughts, or ideas would be greatly appreciated,<br>
      Thanks and have a great day,<br>
      Lonnie<br>
    </font>
  </body>
</html>

--------------292oU0MEsyLYdgj3qgD92PnY--

