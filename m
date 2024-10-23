Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AC9ABFD9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 09:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824448.1238572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3VVn-0003Yx-B7; Wed, 23 Oct 2024 07:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824448.1238572; Wed, 23 Oct 2024 07:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3VVn-0003XN-8U; Wed, 23 Oct 2024 07:10:31 +0000
Received: by outflank-mailman (input) for mailman id 824448;
 Wed, 23 Oct 2024 07:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5Qp=RT=fujitsu.com=Alan.Robinson@srs-se1.protection.inumbo.net>)
 id 1t3VVm-0003XH-8b
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 07:10:30 +0000
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0dddec1-910d-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 09:10:26 +0200 (CEST)
Received: (qmail 24689 invoked from network); 23 Oct 2024 07:10:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
 by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Oct 2024 07:10:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 54D961009AC;
 Wed, 23 Oct 2024 08:10:23 +0100 (BST)
Received: from nera.osd.g02.fujitsu.local (unknown172-17-20-8 [172.17.20.8])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with SMTP id 018EF1009A5;
 Wed, 23 Oct 2024 08:10:22 +0100 (BST)
Received: by nera.osd.g02.fujitsu.local (Postfix, from userid 5004)
 id AEF70174782; Wed, 23 Oct 2024 09:10:22 +0200 (CEST)
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
X-Inumbo-ID: e0dddec1-910d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1729667426; i=@fujitsu.com;
	bh=iQnziBwb6xEZOb9BrlxVNpX9hvxFrIC7FIfolio811A=;
	h=Date:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
	 Content-Type:In-Reply-To:From;
	b=xVcsXawhBIPPlqw4U2T39NRwdNdVJtUF4fydjY5fC0SqkB/R25yZMM6TGzRGb/1gE
	 Bew9p5rrG2en/Og1KZgbeAOFBtxAWO2+loiTPIjeBXe2QOixE5L1sFALKxjEUBhrep
	 dW0o5PoRcLTkDU22kV1NsL/o7ZutbMEiQdOvBufHyGOOkV5QHeb46FQAxQGcT9vWla
	 0yoFs0EHPFkP9iPFm9GgaHaKg8pTA/hyGVCrTGApNR3PyfqpNle0mRULc2WXmYycHU
	 mrLVjg728BXkvV5u8iuaNtPLxH4K8+bYZp3uGAekndBZzf9NUdbnQOxe6Si/kWDT3i
	 junmktFWs3mIg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFKsWRWlGSWpSXmKPExsViZ8MxSTd+oUS
  6wdFFhhaLH+9it/g3Zxebxc89D9ksZpxfzGrxfctkJgdWjxvfu9g9Xk+ewOhx+MMVFo/1W66y
  BLBEsWbmJeVXJLBmvDl/gbmgk6ti8uopjA2MSzm6GLk4hAS2MErMv3CAtYuRg4NFwF+i658HS
  JxFYD+LxMx3+xghinYxSmx+sBDI4QQrWrhxLyOaKk6gqmqJSefOs0NMUpXYNc0OJCwioCvxbM
  EzNpB6ZoEDjBIXr7SwgiSEBfwkVi5aDLaZV8BY4uakcIgxyhJzr/4Fq+cVmMYksb55CRtEIlS
  ib90+MJtXQFDi5MwnLCA2s4CWxI1/L5lA5jALSEss/8cBEuYUCJNofDqJGcSWEJCR+L3yO1ir
  KND8dYtPMoKUswnoS7zqTYQoUZO4em4T8wRG8VlIFsxCsmAWwoIFjMyrGE2LU4vKUot0TfSSi
  jLTM0pyEzNz9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAqM0pZjtzg7GFX
  sa9Q8xSnIwKYnysvBKpAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4BWZB5QTLEpNT61Iy8wBJgy
  YtAQHj5II79YJQGne4oLE3OLMdIjUKUZFKXFekTlACQGQREZpHlwbLEldYpSVEuZlZGBgEOIp
  SC3KzSxBlX/FKM7BqCTMe2Y+0BSezLwSuOmvgBYzAS1WagZbXJKIkJJqYHLXzPnl25x+eBqb+
  emNc/b5X5b9PlOeq5utYorgf5U59dXpuitSXrkoqjGstxE6VhCg03fxvfXn1etjLeZ5l7ktS1
  2pczz6wJ2Y+r0BZWcrFpyKvBfe8FZAb6PgNqPNk7WtF66bNoXDtLT4ZwmT7ulfHpvUvPrvBUi
  cCnhVoxCmF3l7RqXg5XRW+Vntr9LdKxuW34nP62N5HDLHfaJF7MocDh0fiQm3T80r7u/LXq+/
  6fiFs4Y7bn0/bTDba/5GQ/tflxnOe2q+O92edMxp5ULDt20Wpbta0ycniZ1dYNmjWhDUcmjCJ
  pYz0gEb8iYu9+J0mlr75bBcTeWZU/YJXPnLvv3ku9al6+QvKbW3QYmlOCPRUIu5qDgRACyEN7
  7NAwAA
X-Env-Sender: Alan.Robinson@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1729667423!7800!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received:
X-StarScan-Version: 9.114.1; banners=-,-,-
X-VirusChecked: Checked
DKIM-Filter: OpenDKIM Filter v2.11.0 n03ukasimr02.n03.fujitsu.local 54D961009AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=dspueurope; t=1729667423;
	bh=iQnziBwb6xEZOb9BrlxVNpX9hvxFrIC7FIfolio811A=;
	h=Date:To:Cc:Subject:Reply-To:References:In-Reply-To:From:From;
	b=WWyneOuMH8BjQ16TsXw1YsIh9QxaRwq9xiyF076LPbldDe7S+MWIZIjE5ePuF3Xca
	 7vL4QpQlFybapvORzrq/CstV5ZiH8CZkl/Wj5QEoo36E7A9CMpswLXiIEwgvqo0spa
	 ZX3JuzK3PySC+DYW6A6752T5I5CPwfckUZIg5txfceQcaNpQivcmBSHUrmZrgcTbNF
	 enYZ4nXiyNhkR7u6ntYXRyZVbjzo4ySXmrKhztFIzQ4fFx8inWwVn03pMbHprdsn9D
	 FdrN6EgfhVLSugjKBylxisacgYGMJkk14xle+vWMgfJsNEqb1Jk7Q1voBOisSzZOBm
	 8qJOCHYKPFYQw==
DKIM-Filter: OpenDKIM Filter v2.11.0 n03ukasimr02.n03.fujitsu.local 018EF1009A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=dspueurope; t=1729667423;
	bh=iQnziBwb6xEZOb9BrlxVNpX9hvxFrIC7FIfolio811A=;
	h=Date:To:Cc:Subject:Reply-To:References:In-Reply-To:From:From;
	b=WWyneOuMH8BjQ16TsXw1YsIh9QxaRwq9xiyF076LPbldDe7S+MWIZIjE5ePuF3Xca
	 7vL4QpQlFybapvORzrq/CstV5ZiH8CZkl/Wj5QEoo36E7A9CMpswLXiIEwgvqo0spa
	 ZX3JuzK3PySC+DYW6A6752T5I5CPwfckUZIg5txfceQcaNpQivcmBSHUrmZrgcTbNF
	 enYZ4nXiyNhkR7u6ntYXRyZVbjzo4ySXmrKhztFIzQ4fFx8inWwVn03pMbHprdsn9D
	 FdrN6EgfhVLSugjKBylxisacgYGMJkk14xle+vWMgfJsNEqb1Jk7Q1voBOisSzZOBm
	 8qJOCHYKPFYQw==
Date: Wed, 23 Oct 2024 09:10:22 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/boot: Fix PVH boot during boot_info transition period
Message-ID: <20241023071022.GA30985@ts.fujitsu.com>
Reply-To: Alan.Robinson@fujitsu.com
Mail-Followup-To: Alan.Robinson@fujitsu.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <cd8f29e7662f44999552be6e75ac6d6c@BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd8f29e7662f44999552be6e75ac6d6c@BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM>
X-sent-by-me: robin@sanpedro
User-Agent: Mutt/1.9.3 (2018-01-21)
From: Alan.Robinson@fujitsu.com (Alan Robinson)
X-Virus-Scanned: ClamAV using ClamSMTP

Hi Andrew,

A small suggestion for the commit log..

On Tue, Oct 22, 2024 at 12:41:14PM +0000, Andrew Cooper wrote:
> 
> multiboot_fill_boot_info() taking the physical address of the multiboot_info
> structure leads to a subtle use-after-free on the PVH path, with rather less
> subtle fallout.
> 
> The pointers used by __start_xen(), mbi and mod, are either:
> 
>  - MB:  Directmap pointers into the trampoline, or
>  - PVH: Xen pointers into .initdata, or
>  - EFI: Directmap pointers into Xen.
> 
> Critically, these either remain valid across move_xen() (MB, PVH), or rely on
> move_xen() being inhibited (EFI).
> 
> The conversion to multiboot_fill_boot_info(), taking only mbi_p, makes the PVH
> path use directmap pointers into Xen, as well as move_xen() which invalidates
> said pointers.
> 
> Switch multiboot_fill_boot_info() to consume the same virtual addresses that
> __start_xen() currently uses.  This keeps all the pointers valid for the
> duration of __start_xen(), for all boot protocols.
> 
> It can be safely untangled once multiboot_fill_boot_info() takes a full copy
> the multiboot info data, and __start_xen() has been moved over to using the

 of the multiboot info data, and __start_xen() has been moved over to using the

> new boot_info consistently.
> 

Alan

