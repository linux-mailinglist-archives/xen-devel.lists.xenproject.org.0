Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CBD1D131
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 09:21:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202627.1518109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfw7J-0006j8-Ff; Wed, 14 Jan 2026 08:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202627.1518109; Wed, 14 Jan 2026 08:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfw7J-0006gk-CO; Wed, 14 Jan 2026 08:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1202627;
 Wed, 14 Jan 2026 08:20:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8+q=7T=deutnet.info=agriveaux@srs-se1.protection.inumbo.net>)
 id 1vfw7H-0006ge-Um
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 08:20:35 +0000
Received: from srv1.deutnet.info (srv1.deutnet.info [2a01:4f8:c2c:6846::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e59f911c-f121-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 09:20:34 +0100 (CET)
Received: from [2a01:e0a:186:d20::ebe]
 by srv1.deutnet.info with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <agriveaux@deutnet.info>) id 1vfw7E-0000000441y-1uz6;
 Wed, 14 Jan 2026 09:20:32 +0100
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
X-Inumbo-ID: e59f911c-f121-11f0-b15e-2bf370ae4941
Content-Type: multipart/alternative;
 boundary="------------KHFGdDkTUPn9EHSBx1BsbyfN"
Message-ID: <a7eb74e9-d5c1-4000-a4a1-d0a09a4fb192@deutnet.info>
Date: Wed, 14 Jan 2026 09:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH XEN] tools: Update files examples PV&PVH with pygrub.
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <aWV5U1hgOYqDBIk2@deutnet.info>
 <a2331e66-24ac-412f-bed5-66d9920f4efc@suse.com>
 <3e937fc7-62bb-404c-9b1b-c4172404bf35@deutnet.info>
 <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>
Content-Language: en-US
From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
In-Reply-To: <4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com>

This is a multi-part message in MIME format.
--------------KHFGdDkTUPn9EHSBx1BsbyfN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/01/2026 à 08:43, Jürgen Groß a écrit :
> Yes. This is why I don't like the wording "inside guest", which is 
> just not
> true.

Before wasting more time for that side, there is chroot with bind-mount 
of DomU FS.

Rephrasing like this should be more than enough:

# Enable to use a grub2 emulation boot instead of direct kernel boot.

>
> Please be aware that we are trying to phase out pygrub, as it widens the
> attack surface of dom0 from a guest. pygrub needs to look into guest
> controlled file systems, so any bug in the related code (e.g. failure to
> handle a corrupted or maliciously modified file system) might result in
> security issues like code injection.

Effectively, if pygrub is on verge of being phased out, there is not 
need for this patch...

But could you point me to the discussion of alternatives ? As pygrub 
allow a more easy management...

Should this be noted to the wiki ?


>
> So I'm on the edge whether we really should make it easier to use pygrub.
Legit, Should patch subject need to be [RFC PATCH] ?
>
>
> Juergen

Thanks.

--------------KHFGdDkTUPn9EHSBx1BsbyfN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Le 14/01/2026 à 08:43, Jürgen Groß a
      écrit :</div>
    <blockquote type="cite"
      cite="mid:4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com">Yes. This
      is why I don't like the wording "inside guest", which is just not
      <br>
      true. <br>
    </blockquote>
    <p>Before wasting more time for that side, there is chroot with
      bind-mount of DomU FS.</p>
    <p>Rephrasing like this should be more than enough:</p>
    <p># Enable to use a grub2 emulation boot instead of direct kernel
      boot. </p>
    <blockquote type="cite"
      cite="mid:4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com"><br>
      Please be aware that we are trying to phase out pygrub, as it
      widens the
      <br>
      attack surface of dom0 from a guest. pygrub needs to look into
      guest
      <br>
      controlled file systems, so any bug in the related code (e.g.
      failure to
      <br>
      handle a corrupted or maliciously modified file system) might
      result in
      <br>
      security issues like code injection. <br>
    </blockquote>
    <p>Effectively, if pygrub is on verge of being phased out, there is
      not need for this patch...</p>
    <p>But could you point me to the discussion of alternatives ? As
      pygrub allow a more easy management...</p>
    <p>Should this be noted to the wiki ?</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com"><br>
      So I'm on the edge whether we really should make it easier to use
      pygrub. <br>
    </blockquote>
    Legit, Should patch subject need to be [RFC PATCH] ?
    <blockquote type="cite"
      cite="mid:4a572d26-a58c-4119-b8b2-006e4e1eea89@suse.com"><br>
      <br>
      Juergen
      <br>
    </blockquote>
    <p>Thanks.</p>
    <div id="grammalecte_menu_main_button_shadow_host"
      style="width: 0px; height: 0px;"></div>
  </body>
</html>

--------------KHFGdDkTUPn9EHSBx1BsbyfN--

