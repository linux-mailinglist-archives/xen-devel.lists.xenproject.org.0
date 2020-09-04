Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980A25D710
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 13:19:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE9kp-0007D4-Rm; Fri, 04 Sep 2020 11:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YEB=CN=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kE9kn-0007Cx-Uh
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 11:19:38 +0000
X-Inumbo-ID: 841f5804-48db-4cfa-bbe1-b6a9ca2c5475
Received: from mail-40136.protonmail.ch (unknown [185.70.40.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 841f5804-48db-4cfa-bbe1-b6a9ca2c5475;
 Fri, 04 Sep 2020 11:19:35 +0000 (UTC)
Date: Fri, 04 Sep 2020 11:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599218374;
 bh=bef9SXrY8OrXTb+X/bIbn9MQNAroSGvVU4Nq87aJ2W0=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=sJd6zi7E2jFOUSO+/k7Ur4cvuDMJMTKhrAVlcuRlyG0pGE7hF6L5ODk9KcG0/ezb7
 281XKDeQkM37N//y9khdwPpPwUy+tqVHESfaaj5UnPaTGwKVcNLtg8FY4Wco1lAdPZ
 TAHQCy6iqjHNN94GxyTO2s7z4xINqQ0tikpgBPSo=
To: George Dunlap <George.Dunlap@citrix.com>
From: Trammell Hudson <hudson@trmm.net>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
Subject: Re: Continuing the Gitlab experiment: Single-patch PRs for gitlab
Message-ID: <h35nKZ8ByB_Mb-jk6WEUO-VlCLDgU0fjVUzhZ1eCNVWwbL5aNnoRQ7lVDxM31Nd3PvuRzSMbcNmyUkflzUiDiHUTdQTGReB8zPoCCi_pff4=@trmm.net>
In-Reply-To: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
References: <78D90C74-945A-4B2C-9A7C-78EC0B623C04@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Friday, September 4, 2020 5:54 AM, George Dunlap <George.Dunlap@citrix.c=
om> wrote:

> And I=E2=80=99d encourage others to try submitting simple one-or-two-patc=
h series as PRs to Gitlab instead, as we continue the experiment.

I've reworked my unified EFI image patch to merge with the
recent Makefile changes and submitted it through the website:

https://gitlab.com/xen-project/xen/-/merge_requests/4

--
Trammell

