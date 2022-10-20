Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF981606165
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426772.675439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVTF-0002nd-6H; Thu, 20 Oct 2022 13:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426772.675439; Thu, 20 Oct 2022 13:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVTF-0002kv-2f; Thu, 20 Oct 2022 13:20:25 +0000
Received: by outflank-mailman (input) for mailman id 426772;
 Thu, 20 Oct 2022 13:20:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iaqk=2V=citrix.com=prvs=285ecbe66=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1olVTD-0002kp-KM
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:20:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2956282-5079-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 15:20:22 +0200 (CEST)
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
X-Inumbo-ID: f2956282-5079-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666272022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=CyqtvLuCo9vPcS4ykOKHNf/TdY6KVRL/lttb5kuxJeM=;
  b=aF6ZCztJF3UfqwYXqTHj+ojMkLNjF6J+J0ybd9JF6l9A42PSmO/ApCMg
   NN2nnZvzNVazthHGD5sxElvXfe/dWgaUwzuqEF9yyrCR+o2o5A7z1Xvpi
   GonWnmmkTyOiLj+p4HfssY69eUBk4Gjn20qjjoW28//M1sRERZy2TCeVu
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 85684026
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VYI8G62Si8+ZMlKIm/bD5axxkn2cJEfYwER7XKvMYLTBsI5bpzIPm
 2NOUG+Eb6uLa2Pwf4tyPIqwpEMHupXUnd4yTgtupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlA5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUV68s0BVBh/
 McGF2gtNAyRoMiXz/G0H7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqIJIzWHZ8L9qqej
 mj0wFumOQ4wDdrF1D28q0yAuO7ovgquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQnx
 3LKm+LGDAdxj+W1E26P0Z21onC9bH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/MChc+Ij2unAsotJBCtdbZXtWYGn4EOzAR1ofNfAFQnpU
 JTpdqGjAAEy4XOlznHlrAYlRuvBCxO53Nr02AcHInXZ327xk0NPhKgJiN2EGG9nM9wfZRjia
 1LJtAVa6fd7ZSX0M/YuM97tVZ93l8AM8OgJsdiNNLJzjmVZLlfbrEmCm2bKt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdynnpW7TqKHfjTlk37uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikUwOAbygPXWLrOb+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:P+peJKrDsh/LIit1r72qW78aV5oTeYIsimQD101hICG8cqSj9v
 xGuM5rsiMc7wxhPk3I+OrwXJVoLkmxyXcY2+Ys1PKZLXDbUQiTXeRfBOnZsl7d8kTFn4Y3v8
 pdmupFeb/N5DBB/L7HCWKDc+rIruPozJyV
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="85684026"
Date: Thu, 20 Oct 2022 14:20:09 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.17 1/6] test/vpci: add dummy cfcheck define
Message-ID: <Y1FLCaAwscvJ3Lj3@perard.uk.xensource.com>
References: <20221020094649.28667-1-roger.pau@citrix.com>
 <20221020094649.28667-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221020094649.28667-2-roger.pau@citrix.com>

On Thu, Oct 20, 2022 at 11:46:44AM +0200, Roger Pau Monne wrote:
> Some vpci functions got the cfcheck attribute added, but that's not
> defined in the user-space test harness, so add a dummy define in order
> for the harness to build.
> 
> Fixes: 4ed7d5525f ('xen/vpci: CFI hardening')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

