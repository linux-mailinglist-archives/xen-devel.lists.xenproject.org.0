Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838D560171D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 21:13:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424559.672076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVXp-0002Kt-MZ; Mon, 17 Oct 2022 19:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424559.672076; Mon, 17 Oct 2022 19:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVXp-0002HP-Gq; Mon, 17 Oct 2022 19:13:01 +0000
Received: by outflank-mailman (input) for mailman id 424559;
 Mon, 17 Oct 2022 19:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okVXn-0002HE-UW
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 19:12:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b512acd5-4e4f-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 21:12:58 +0200 (CEST)
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
X-Inumbo-ID: b512acd5-4e4f-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666033977;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=nHhP4CicGwE1po6u8WtjJ1vEAs6NcxGF1strgPp5D+M=;
  b=XZU56Zzs4g+Xsobk89R2/HtYaNRW2Kj8lS5KqnGePUlAXy0tUYNfrrRW
   aFahyO73mZc7rCrM71+bM1yUqu0AvZcpzszZCnYvbm6cwHgKEnPAUhiuV
   rpqL0A0VHdeuzZ3Lb3BGJkDKjJBBGShRTtHcwDmaRjbpkpaEyJu+7pf8A
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82918876
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fvkMXKOJtPE0YYLvrR1Al8FynXyQoLVcMsEvi/4bfWQNrUp2hjMGy
 zYfXzjUb/2LMWH0KNp3YYm3o0oC6J/Sx95hHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglbwr414rZ8Ek15ayr52tC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eMrY747t6E3F0p
 b87EAEBclearPOd+efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnE1EbEp8h2syvgWHyaWZwo1OJv6snpWPUyWSd1ZC9aouMKozVG625mG6Gj
 zzMxU/CMCo2JeSh7yiv23CTl+vQyHaTtIU6S+Tjq68CbEeo7lIUDBoaRF6qu86Tg0S1W89cA
 0EM8y9opq83nGShQ8PhRRS+rDiBtwQFRttLO+Qg7UeGza+8yyaUAHIVCAFIbtMOvdUzAzct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxAA8mrESgMgjx6i9u1fdjFqRSoPhF1BvoF+NByT8s10/NNXNi5GUBUbz4s1jNduUXEm77
 Dsno/mS8KcXJoCmrXnYKAkSJ42B6/GAOTzapFdgGZg96jigk0KekZBsDCJWfxkwbJtdEdP9S
 AqK4F4KuscPVJe/RfUvC79dHfjG2kQJ+T7NcvnPJuRDbZFqHONs1HE/PBXAt4wBfaVFrE3eB
 Xt5WZzwZZr5If49pNZTewv6+eZyrh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BaZbbl0gCDrGiP3W/HWsvwbcidCJTOHwLg5YPKr7rzvROQgnN9MM9MZt+Itc4zsy5Z8/D/
 22nW18w9WcTcUbvcF3QAlg6MeuHdc8m/RoG0dkEYA/AN44LOt30ss/ytvIfINEayQCU5aQsE
 qBaJJjRU64np/au0211UKQRZbdKLHyD7T9i9QL8CNTjV/aMnzD0x+I=
IronPort-HdrOrdr: A9a23:Da73vq+p2S7amNtlXhZuk+DQI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re+sjzuiWE6wr5NEtOpTniAtjmfZq/z+8W3WB5B97LN2OK1FdARLsSibcKqAeBJ8SRzIBgPN
 9bAs1DNOE=
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="82918876"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH 0/2] arm/p2m: XSA-409 fix
Date: Mon, 17 Oct 2022 20:12:35 +0100
Message-ID: <20221017191237.11079-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

My attempt at a more simple fix than any proposed thus far.  Sadly not as
simple as I was hoping, but it does resolve the bugs according to Gitlab:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/669072903

In particular, it addresses every buggy error path I've spotted in previous
patches.  The preemptible helpers can't safely be rewrapped to work in an
idempotent teardown context.

Andrew Cooper (1):
  arm/p2m: Rework p2m_init()

Henry Wang (1):
  xen/arm: p2m: Populate pages for GICv2 mapping in arch_domain_create()

 xen/arch/arm/p2m.c | 67 ++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 14 deletions(-)

-- 
2.11.0


