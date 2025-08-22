Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E1B31427
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 11:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089807.1447279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOQn-0007CI-11; Fri, 22 Aug 2025 09:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089807.1447279; Fri, 22 Aug 2025 09:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upOQm-00079O-Tc; Fri, 22 Aug 2025 09:51:32 +0000
Received: by outflank-mailman (input) for mailman id 1089807;
 Fri, 22 Aug 2025 09:51:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUr3=3C=darkstar.site=sakib@srs-se1.protection.inumbo.net>)
 id 1upOQk-00070p-SK
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 09:51:30 +0000
Received: from fforwardh-a3-smtp.messagingengine.com
 (fforwardh-a3-smtp.messagingengine.com [103.168.172.198])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931f0cc2-7f3d-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 11:51:30 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfforwardh.phl.internal (Postfix) with ESMTP id 387EE8019F;
 Fri, 22 Aug 2025 05:51:28 -0400 (EDT)
Received: from phl-frontend-02 ([10.202.2.161])
 by phl-compute-04.internal (MEProxy); Fri, 22 Aug 2025 05:51:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Aug 2025 05:51:26 -0400 (EDT)
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
X-Inumbo-ID: 931f0cc2-7f3d-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755856288; x=1755942688; bh=In0StexMoh8GPjq3jgjnpvyNh6TTCqQYG3/
	BfZ4QI3o=; b=I0HgdpE0kEreuhAM2jou0V+PD7AF25RxXLRKgojP/t7EYW5VFvR
	uwP2NfuwRLkgaKjppcEaWKdYnSh/OkFd1mWzyjg11K4P4cog1XHRkM9T43KZ1Fum
	dG3QwodbfQ/XpNuYthBJEESqUeBeEcU/keyviJ0Meih+XYRqhg4PuoLKfSYsYilU
	0AJL3JNPlsxuCxepN9VcSdxkZaA4O8VB6uMsmxBh3kIlX7KK4VkDuAhVokm6w6Ff
	eN+wTJLH4J20L/qNDcSZuKMxQUESGZ3D5SUuFF/pIu8JcNMK8Z3F/Gd7a5ZOBOk9
	UW3VJ7YIyPL//ISqRLGsOFz03CMc/8RNrmQ==
X-ME-Sender: <xms:nz2oaONNPayV-lAZ1dNrnDdYsUfTHSgKPdVoRyBoMSEvRctAVzPpRA>
    <xme:nz2oaIpU_oQVlv4ZrocyvNANsTCLORHHrn-VDDKR1AVJtuVH-E6dSWzOHNU3EYfQC
    Cb1IzSST23PcemdbyQ>
X-ME-Received: <xmr:nz2oaBv86uumGcqYM5lTApxDeKaBHrtVVJ0cqb_heRbvvF-gOjq8sw9M3IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieefgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgvrhhgihihucfm
    ihgsrhhikhcuoefuvghrghhihigpmfhisghrihhksegvphgrmhdrtghomheqnecuggftrf
    grthhtvghrnhepgedvfeefhfduvdetkeegleeggfelheekveeiuddufeehtdehleelhfek
    iedvvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghkihgssegurghrkhhsthgrrhdr
    shhithgvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhr
    tghpthhtohepshgvrhhgihihpghkihgsrhhikhesvghprghmrdgtohhmpdhrtghpthhtoh
    eprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegr
    nhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitg
    hhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghn
    rdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtg
    hpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhr
    tghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:nz2oaH1xj8CVC7Rbjg81PwHnxHZE_NHbcxYL77j1t61WzLHj5bWHnQ>
    <xmx:nz2oaMEXSLsdY7fuQlEpfNqFO2wCC2t8nz8cfcnMS5cEiuZ33e-A8Q>
    <xmx:nz2oaCvstVptAqvDpbHqhP1ZPjxGIAEiGNAUKTSvGrhOyP9VaznCmw>
    <xmx:nz2oaPpAutVsWE750zZKjZAuCtGVlPTQ6CDq2aJIRL6XOeZPi26sPw>
    <xmx:nz2oaJUIoZKrhnT3NwOEpP5llAW_6cwciwLGwd5l1LmUwKBjvVFdiA>
    <xmx:oD2oaLCySOp6A6mmukWYcxJgvB7lUzD5ekkR1YEG1sbZO0TBXTjzZzJZpK5U>
Feedback-ID: i5de959fc:Fastmail
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v1] xen/flask: limit sidtable size
Date: Fri, 22 Aug 2025 12:51:23 +0300
Message-Id: <20250822095123.998313-1-Sergiy_Kibrik@epam.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Xen lacks a defined largest number of security IDs it can potentially
use. The number of SIDs are naturally limited by number of security contexts
provided by a given security policy, i.e. how many combination of user, role
and type there can be, and is dependant on the policy being used.
Since the policy is generally not known in advance the size of sidtable in Xen
has a rather high limit of UINT_MAX entries.

However in the embedded environment configured for safety it is desirable to
avoid guest-triggered dynamic memory allocations at runtime, or at least limit
them to some decent and predictable amounts. This patch provides a configuration
option to impose such a limit.

Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
CC: Jan Beulich <jbeulich@suse.com>
---
After RFC patch discussion it's been suggested to use Kconfig option
instead of estimation of sidtable size at build time:

   https://lore.kernel.org/xen-devel/20250630085559.554334-1-Sergiy_Kibrik@epam.com/

 -Sergiy
---
 xen/common/Kconfig        | 19 +++++++++++++++++++
 xen/xsm/flask/ss/sidtab.c |  8 +++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 76f9ce705f..f956a93fb3 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -418,6 +418,25 @@ config XSM_FLASK_AVC_STATS
 
 	  If unsure, say Y.
 
+config XSM_FLASK_SIDTABLE_LIMIT
+	def_bool n
+	prompt "Limit the size of SID table" if EXPERT
+	depends on XSM_FLASK
+	---help---
+	  Limit the number of security identifiers allocated and operated by Xen.
+	  This will limit the number of security contexts and heap memory
+	  allocated for SID table entries.
+
+	  If unsure, say N.
+
+config XSM_FLASK_MAX_SID
+	int "Max SID table size" if XSM_FLASK_SIDTABLE_LIMIT
+	default 512
+	help
+	  The maximum amount of SIDs allocated by Xen. Default value is
+	  approximately double the size of contexts that default Xen policy can
+	  potentially have.
+
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
 	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
diff --git a/xen/xsm/flask/ss/sidtab.c b/xen/xsm/flask/ss/sidtab.c
index 69fc3389b3..1dd0700b8c 100644
--- a/xen/xsm/flask/ss/sidtab.c
+++ b/xen/xsm/flask/ss/sidtab.c
@@ -14,6 +14,12 @@
 #include "security.h"
 #include "sidtab.h"
 
+#ifdef CONFIG_XSM_FLASK_SIDTABLE_LIMIT
+#define SID_LIMIT CONFIG_XSM_FLASK_MAX_SID
+#else
+#define SID_LIMIT UINT_MAX
+#endif
+
 #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
 
 #define INIT_SIDTAB_LOCK(s) spin_lock_init(&(s)->lock)
@@ -228,7 +234,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
         if ( sid )
             goto unlock_out;
         /* No SID exists for the context.  Allocate a new one. */
-        if ( s->next_sid == UINT_MAX || s->shutdown )
+        if ( s->next_sid == SID_LIMIT || s->shutdown )
         {
             ret = -ENOMEM;
             goto unlock_out;
-- 
2.25.1


