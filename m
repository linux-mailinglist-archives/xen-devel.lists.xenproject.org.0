Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2346A074C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:24:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500256.771555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9hp-0002cq-NX; Thu, 23 Feb 2023 11:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500256.771555; Thu, 23 Feb 2023 11:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9hp-0002b9-Kb; Thu, 23 Feb 2023 11:24:09 +0000
Received: by outflank-mailman (input) for mailman id 500256;
 Thu, 23 Feb 2023 11:24:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOJK=6T=citrix.com=prvs=41104d4c8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pV9ho-0002az-Pc
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:24:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9561b330-b36c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:24:07 +0100 (CET)
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
X-Inumbo-ID: 9561b330-b36c-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677151447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fCZpAOrYwzC43VHamGdgfL2H+4fXsjuHrmvu3rDaNbA=;
  b=ag+VQoXQcB89VU2FS8cUzDgncRN5CYGpaVo0GEd7wsTIYpKU7uUbR3vs
   qAePKAQw8w5WHkQwCqO8Z8QimE3gnBQyiLipQ0uITCU0ce9VIA2eQY0Fv
   Sh4P2DOw38ZrDWrl4mVsZrPEUuYIuLs12esow0qka3ZWGtte5mAL85rat
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97036107
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:gTnF7KvtAlHGiw5JGFDtYiKFYufnVBlZMUV32f8akzHdYApBsoF/q
 tZmKWCHO62Da2OgLdojbt6yoxxQ7JLQz9NhHgFr/ys8FCIX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGDtSXjS5jsCMnJH8UfdUrJsqc87aI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 z2epDqgWk5y2Nq3yzG59E2orMjzpwjyeoQuSp2zqL0wjwjGroAUIEJPDgbqyRWjsWaiUtdWM
 GQI+S4jq6cj+UjtRd74NzWgqWOAlg4RXZxXCeJSwAiM0aPV5w+xDGkYQjNPZdoqudVwTjsvv
 neAh97zDCZjmKGUQ3masLyTqFuaJSkQBX8PY2kDVwRty8H7oZs4hxbGRMtLGq+pgtD7FDf8z
 irMpy87750MieYb2qP9+krI6xqgq53IZg8z+ATMX2ih4x95ZYiqfIih4x7Q6vMoBJaUSByNs
 WYJn+Ca7fsSFtedmSqVWuIPEbq1ofGfP1X0g0NrHpQn3ySg/TikZ484yDNxPk5tNu4NfDb7Z
 0mVsgRUjLdRNna3aa58Y6qqFt8ni6PnELzYuuv8N4QUJMIrLUneoX8oPBTLt4zwrKQyuZE0Z
 qe/S8+ONyo5Tr959BDpTrga4KB+k0jS2ljvbZz8yh2m15+Xa3iUVaoJPTOyUwwp0E+XiF6Lq
 ogCbqNm3z0aCbSjOXePreb/OHhQdRAG6YbKR9u7nwJpCi5vAykfBvDY2tvNkKQ1zv0Oxo8kE
 pxQM3K0KWYTZ1WddW1miVg5MtsDuKqTSlpqVRHAxX7yhxAejX+Htc/zjacfc7g97/BExvVpV
 fQDcMjoKq0RFWufqmxMNMGi89AKmPGXaeWmZXfNXdTCV8Q4G1yhFiHMI2MDCxXi/gLo7JBj8
 tVMJyvQQIYZRhQKMSolQKvH8r9FhlBEwLgadxKRcrFulLDErNACx9rZ0qVmfKnh6HzrmlOn6
 uphKU5C+rKc+dFtoIOhaGLth97BLtaS13FyRwHzhYta/wGDloZ/6eesiNq1QA0=
IronPort-HdrOrdr: A9a23:PG9Zh667CEpZGu/7IQPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="97036107"
Date: Thu, 23 Feb 2023 11:23:58 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, <demi@invisiblethingslab.com>, "Julien
 Grall" <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 2/6] xen/x86: Replace GPL v2.0 copyright with an SPDX tag
 in *.c (part 2)
Message-ID: <Y/dMzst9+JJDwAp/@perard.citrite.net>
References: <20230209230020.52695-1-julien@xen.org>
 <20230209230020.52695-3-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230209230020.52695-3-julien@xen.org>

On Thu, Feb 09, 2023 at 11:00:16PM +0000, Julien Grall wrote:
> This is replacing the below pattern with the SPDX tag GPL-2.0 in
> xen/arch/x86/*.c:
> 
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License as published by
>  * the Free Software Foundation; either version 2 of the License, or
>  * (at your option) any later version.

This boilerplate allow to use newer version of the GPL license, the
identifier for that is "GPL-2.0-or-later".
    https://spdx.org/licenses/GPL-2.0-or-later.html

>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  * GNU General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public License
>  * along with this program; If not, see <http://www.gnu.org/licenses/>.

Cheers,

-- 
Anthony PERARD

