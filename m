Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F233656DB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 12:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113532.216386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnyo-0005mQ-Fe; Tue, 20 Apr 2021 10:51:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113532.216386; Tue, 20 Apr 2021 10:51:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnyo-0005m4-CT; Tue, 20 Apr 2021 10:51:42 +0000
Received: by outflank-mailman (input) for mailman id 113532;
 Tue, 20 Apr 2021 10:51:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJT2=JR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lYnym-0005lz-OJ
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 10:51:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 870df810-2938-4bdd-bd71-a03c49a993ed;
 Tue, 20 Apr 2021 10:51:40 +0000 (UTC)
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
X-Inumbo-ID: 870df810-2938-4bdd-bd71-a03c49a993ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618915900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r2GvvTFs1FzifLgk5G62sYYj93zFWYsDLtHCLOMWAdY=;
  b=Gv7eAZi1xHI6bzZOz98ukJWT902GvTsWi55RPo63i4ovC0ZQD8Wyrnbu
   SNh4nHoZ+TMZwB8Y93C5t1Gjah647FEq4GIIEM2DQ9RlmC9khPjn+NEyT
   aboH5bmdVCqAsCijV58gFL1Pgj+RCEjt9dGeHmrBsCGaLUHSdEi5ukaN/
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FGkKX9wB4UugATYgZTNpiMY0igFSNGJREYzTy8bX5Fq3sWrChHI1kBFJDL3KdgfNqExizNhDtJ
 odIvYaRELlNyMbmnLZ/t0YM9G4IxFNX6qOQ+5QGxc1lUu7mKzt3fNb72c1sJIu+qtSBRR8Z4Uy
 YeQ262k6swB3JX8WjSHWz40WgFR0mIC0MHWWZf4/8Uvx1FyD+h2Z4B2zz7ZFfJJNFyif+Dgua5
 lTz0J5OBKzXb8whXhfxX+L2zZ5187Db8Q+LSPVcuHa6npgNcKV9eD+zzRkqx/I7KAKe0k4ugJo
 QdU=
X-SBRS: 5.1
X-MesageID: 41799571
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GMsmdqpM5h64NcpKirjuIAcaV5q6eYIsi2QD101hICF9WObwra
 GTtd4c0gL5jytUdXE7gNabOLSBR3S0z+8T3aA6O7C+UA76/Fa5NY0K1/qH/xTMEzDzn9Qw6Y
 5OaK57YeeeMXFbioLA7BC8A5IcxrC8gcaVrMP/61socg1wcaFn6G5Ce2OmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCpzbD2vanrbhIcCxks5BPmt0LL1JfAHwWFxRBbajtTwN4ZgB
 H4ujbk7aauuezT8H/h/lLUhq45pOfc
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; 
   d="scan'208";a="41799571"
Date: Tue, 20 Apr 2021 11:51:35 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <mst@redhat.com>,
	<marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
	<richard.henderson@linaro.org>, <ehabkost@redhat.com>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Message-ID: <YH6yNxOtvuFcuQsy@perard>
References: <161888998361.15979.8661085658302494664@72b6d80f974b>
 <91dc07bd-fc34-56fa-4c3e-684626a2e8d5@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <91dc07bd-fc34-56fa-4c3e-684626a2e8d5@citrix.com>

On Tue, Apr 20, 2021 at 10:51:47AM +0100, Igor Druzhinin wrote:
> On 20/04/2021 04:39, no-reply@patchew.org wrote:
> > === OUTPUT BEGIN ===
> > ERROR: Author email address is mangled by the mailing list
> > #2:
> > Author: Igor Druzhinin via <qemu-devel@nongnu.org>
> > 
> > total: 1 errors, 0 warnings, 21 lines checked
> > 
> 
> Anthony,
> 
> Is there any action required from me here? I don't completely understand how
> that happened. But I found this:

No action, I just need to remember to fix the patch's author before
submitting a pull request.

Citrix's policy is just too strict and don't even allow space changes in
some headers.

-- 
Anthony PERARD

