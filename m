Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918079D0B73
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 10:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839179.1254989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxpZ-00027G-Px; Mon, 18 Nov 2024 09:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839179.1254989; Mon, 18 Nov 2024 09:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCxpZ-00024S-Mp; Mon, 18 Nov 2024 09:14:01 +0000
Received: by outflank-mailman (input) for mailman id 839179;
 Mon, 18 Nov 2024 09:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ZrC=SN=bounce.vates.tech=bounce-md_30504962.673b0552.v1-fd6b31ca697945b3a63ff6027e53d83b@srs-se1.protection.inumbo.net>)
 id 1tCxpY-00024M-Dy
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 09:14:00 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 700d0187-a58d-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 10:13:56 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XsMPZ0r4ZzJKF3ZP
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 09:13:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fd6b31ca697945b3a63ff6027e53d83b; Mon, 18 Nov 2024 09:13:54 +0000
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
X-Inumbo-ID: 700d0187-a58d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjcwMGQwMTg3LWE1OGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTIxMjM2LjkxNjAyOSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2IwNTUyLnYxLWZkNmIzMWNhNjk3OTQ1YjNhNjNmZjYwMjdlNTNkODNiQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731921234; x=1732181734;
	bh=WouQcZAEK/8SLk7RaUwHr+bca8Ub1zIh2pNeO4fqFyE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y4c0JR+N1RfpXolGEi3/5dCDhAud+Vx76L6/Bw88oZzgo+wlPCHkLDbu+XXZUyXXi
	 qujgRyrxuAQ3ZDqu5gmb6NYdMVtWv7CgNxyFLCF3LcSrZRo/ExFiF5af0Vi7+fz7q2
	 1N47vDlQdwSTfGNjjqf3+iefYiDP8xuPAy3FLyNOVcaQo6Q/VFy4ENPkqPMdxu0qh1
	 B4LQIK11LJ6OAijBbv2ksvwAZS8DBL+ZslT5RSFT/C2OrVk2ZjzYSWrGBGgvbp6trD
	 RnUWOuDPwx7az1GFAW9COpIHAK4wu/aHsDkCuapaAdedE8OUlQ7TdKUH1VInyfn62T
	 5TVKYVywiIOBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731921234; x=1732181734; i=ngoc-tu.dinh@vates.tech;
	bh=WouQcZAEK/8SLk7RaUwHr+bca8Ub1zIh2pNeO4fqFyE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Qji+wJaZvZaYcbOv27y7bguECfonCuib5IUuqmvfxedfCDlcQWXPPbow0AvHWcfzF
	 6iYwN1PxYh3s0xUvlBHv0IzZU+58crzqWDLj2Ph2X2029UxrwU3pXkbhwrhjaYLZ5e
	 re4zSZaGo/ZJNMYLeAPjl/isAojJqoIuS6iQtouFnCGSw5ZsKPBNZ/HviLAdB97Q5L
	 +RZzMfx0vVQ3jS0mPDZzIevdO99smj3aS0YdtkYxwpcXT3se+EVtxnWojJa6zx3DXw
	 Tej7tzavhPGhuQQnihzP6ciUqW/f0ULijiEP71nIfhPn7KxGbk2qO69pZX4qXNTsqW
	 nEeESbfzJwrNw==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20Virtualize=20architectural=20LBRs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731921233544
Message-Id: <3f75df1d-f397-487f-9b81-d7740712b924@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech> <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com>
In-Reply-To: <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fd6b31ca697945b3a63ff6027e53d83b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 09:13:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 18/11/2024 09:52, Jan Beulich wrote:
> Looking over just the files touched: No change to XSAVE logic at all?

XSAVE is hidden behind a new IA32_XSS bit. I'll try to implement that next.


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

