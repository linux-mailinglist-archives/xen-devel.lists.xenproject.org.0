Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92210599CD8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 15:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390333.627700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP207-0003oe-GJ; Fri, 19 Aug 2022 13:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390333.627700; Fri, 19 Aug 2022 13:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP207-0003mX-DS; Fri, 19 Aug 2022 13:25:27 +0000
Received: by outflank-mailman (input) for mailman id 390333;
 Fri, 19 Aug 2022 13:25:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP206-0003mP-3M
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 13:25:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60fdfaba-1fc2-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 15:25:24 +0200 (CEST)
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
X-Inumbo-ID: 60fdfaba-1fc2-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660915524;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JG0CLmvbXmbI1CY8qWqmo6NZ9hD0xesXwQvo7eZT0rA=;
  b=Lf+GeiPHYmBShDSc/5u7waZBspVVlRU6SpljSh+syRhu6wQKTYmsxF7Y
   7qSXYCAMcTpL91VtQJHU71TojWXwBi1hFBZ27qZ0iRjgBu22hfvMQlamU
   2Cb5W75SgNKzKjCFjhVWxL0UDE6OrqbkYc1QWfX0WHH2whiYE9Y0EHclc
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78914721
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:+pEID654Laho4GN+eo6N5gxRtBjHchMFZxGqfqrLsTDasY5as4F+v
 mFOCjrSPquKamqjeYp/aN/j8EwCv5OBmoBmQAFs+HpkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks/5aWq4Vv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJBoMftMCwNhoO31L2
 qQUJjkGTEqgjO3jldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+i8aYaKIIXiqcN9oUqen
 0b8+lzDJwgENvqv5B+ownSJr7qa9c/8cN1LT+DpnhJwu3WMwkQDBRtQUkG0ydG7hVS5QMl3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsQzpMbtVgqcE3QCAx2
 0GAt9TzDDdrvfueTnf13quVqBuiNC5TKnUNDQcGRwYY59jooKkokwnCCN1kFcaIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7v2Ajv+ILzcBEP+gD4Bm6r5whbPq2uaNn9gbTE1sqsPLp1X3HY4
 iZcy5fCtbBQZX2evHfTGbtQRdlF897AaWSB2gA3QvHN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9vy/D5g4lvIUPvBMmPavpUmCn3K40WH3i1QLmqoiI
 5qdesvEJS9EV/w3kGXpFrtDgeRDKsUCKYT7FPjGI+mPi+LCNBZ5t59eWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDX8UjyqZKdAhiBSVqWvjLRzl/LLHrzvxORD58UJc8ANoJJ+RYokiivryUp
 iHlAxEEkwaXaL+uAVziV02PoYjHBf5XxU/X9wR1Vbp08xDPubqS0Zo=
IronPort-HdrOrdr: A9a23:W3mceKjZudtG/57SJotavrLPBHBQX6F23DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICPoqTMiftWjdySSVxeRZjLcKrAeQYxEWmtQtt5
 uINpIOdeEYbmIKw/oSgjPIaOrIqePvmMvD6IeurEuFDzsaEZ2Ihz0JUjpzeXcGIzWucKBJba
 Z0kfA3wQZIF05nC/iTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqcnSWwfkNKNyMGv/MDTvMSg3BQ5u2VE8
 pwrj+kX+A8N2KeoMynjeK4CS2D0iGP0CkfeSt6tQ0CbWPbAIUh/LD2OytuYcc99WvBmfMa+O
 UCNrCt2N9GNVyddHzXpW9p3ZilWWkyBA6PRgwYttWSyCU+pgEy86K2/r1pop4szuN0d3B/3Z
 WODo140LVVCsMGZ6N0A+kMBcOxF2zWWBrJdGafO07uGq0LM2/E78ef2sR42Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmJlG6ArETmmxVSnkjste+596sLvhQ6eDC1zPdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXZ1E2gXvMqMiYEX2kPdlzOrTd2j+1/4jcLeaxNAzWMyjUIbQLQ==
X-IronPort-AV: E=Sophos;i="5.93,248,1654574400"; 
   d="scan'208";a="78914721"
Date: Fri, 19 Aug 2022 14:25:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>
CC: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: Ping: [XEN PATCH v4 21/32] tools: Remove -Werror everywhere else
Message-ID: <Yv+PPtFVpfbyoZ9a@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-22-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220811164845.38083-22-anthony.perard@citrix.com>

Hi Elena, Tim, Jan, Andrew, Roger, George,

Elena, could you give a ack or review this patch, for the change in
"tools/debugger/gdbsx/Rules.mk" ?

Tim, could you give a ack or review this patch, for the change in
"tools/debugger/kdd/Makefile" ?

Jan, Andrew, Roger, could you give a ack or review this patch, for the
change in "tools/fuzz/cpu-policy/Makefile" and
"tools/tests/cpu-policy/Makefile" ?

George, could you give a ack or review this patch, for the change in
"tools/xentrace/Makefile" ?

I would also need a review from someone on the whole patch.

Also, sorry to Jan, Andrew, and George, it seems that the use of
"--remove-duplicates" with `get_maintainer.pl` have removed your emails
from CC the list.

Thanks,


On Thu, Aug 11, 2022 at 05:48:34PM +0100, Anthony PERARD wrote:
> Patch "tools: Add -Werror by default to all tools/" have added
> "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> makefiles as it is now duplicated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

-- 
Anthony PERARD

