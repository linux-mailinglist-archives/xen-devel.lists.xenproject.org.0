Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2E650AF5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 12:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466006.724826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7EhP-0006m2-0x; Mon, 19 Dec 2022 11:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466006.724826; Mon, 19 Dec 2022 11:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7EhO-0006ij-Tn; Mon, 19 Dec 2022 11:52:50 +0000
Received: by outflank-mailman (input) for mailman id 466006;
 Mon, 19 Dec 2022 11:52:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gyHb=4R=citrix.com=prvs=3454adc0d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p7EhO-0006id-26
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 11:52:50 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6b78dd1-7f93-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 12:52:47 +0100 (CET)
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
X-Inumbo-ID: a6b78dd1-7f93-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671450767;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zk+rRHxc3tVIxfUB5Ewejc1DjPi9oUcRDVAUX0g8ryM=;
  b=UqXASDwmppKhXeeER0Vr/vX2jCcm9+9BTfxZZ5exYOfnT1MCZLDM9G2W
   n43E/TTf7rHapP1PLjZ4bIr0PmzZGvWjAJ7DJzsnjvkBfQ3rlVEPg8JK5
   niczTg9tdjUF2I7E/uYJGxL15Uo/+CkjscxS51ywTtQW0OyNrTS7S1YiB
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 91556525
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6Qj1pqig5iLhNZfOpXA1ET+FX161bBAKZh0ujC45NGQN5FlHY01je
 htvWWjQbvzZZWOhfNwnbN6wp0tV7cPVmNcyGgVk+y01Riob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gaPzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQVdQE3bEqBvd7tmouXb9Axp/0aM+z0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfB+
 z+Yoj6kav0cHM7E+SS04FSKusX0lgDeR40xDbiZ9OE/1TV/wURMUUZLBDNXu8KRlUqWS99Zb
 UsO9UIGoaEs+WSxQ9L6Xhn+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBWJfVBUGFwk/34K5ma0Wt0/ud+98NbHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Jui8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvK1bcrHE1OxDAjjGFfK0QfUYXY
 MvzTCpRJSxCVfQPIMSeHI/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7hjhIvd+VW9z
 jqqH5fSo/mpeLGkM3a/HE96BQxiEEXX8rit8pELLrHTelY3cIzjYteIqY4cl0Vet/w9vo/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:p93SJa1joXCcxow34NZddAqjBIokLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faSskd2ZJhAo6HlBEDuex/hHPJOjrX5eI3SJTUO21HYSb2Kj7GSoAEIcheWnoU2uJ
 uIMZIOauEYZWIK9foSizPZLz9P+re6zJw=
X-IronPort-AV: E=Sophos;i="5.96,255,1665460800"; 
   d="scan'208";a="91556525"
Date: Mon, 19 Dec 2022 11:52:36 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>
CC: <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Christian Lindig <christian.lindig@citrix.com>
Subject: Re: [PATCH v4 03/11] CODING_STYLE(tools/ocaml): add 'make format'
 and remove tabs
Message-ID: <Y6BQhAs0ZgRqJ3//@perard.uk.xensource.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
 <81d621cea5975fdd9698992b968dcd7528c637af.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81d621cea5975fdd9698992b968dcd7528c637af.1671214525.git.edwin.torok@cloud.com>

On Fri, Dec 16, 2022 at 06:25:12PM +0000, Edwin Török wrote:
> +	git ls-files '*.c' '*.h' | xargs -n1 sed -ie 's/\t/    /g'

Seen as there's a patch adding .clang-format, what the point of this
command?

"-ie" means to ask sed to change file in-place an keep a copy of the
original file with "e" as suffix. So please replace that by "-i~" or
"-i -e" or just "-i", with the first one create a "~" backup, the last
two not creating a backup at all and probably what you wanted. ("-e" is
optional as there's only a single command)

Thanks,

-- 
Anthony PERARD

