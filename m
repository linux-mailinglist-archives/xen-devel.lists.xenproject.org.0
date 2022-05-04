Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057665196C1
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320015.540609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N4-0005oN-3L; Wed, 04 May 2022 05:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320015.540609; Wed, 04 May 2022 05:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7N3-0005iu-TJ; Wed, 04 May 2022 05:16:17 +0000
Received: by outflank-mailman (input) for mailman id 320015;
 Wed, 04 May 2022 01:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rvwn=VM=chromium.org=keescook@srs-se1.protection.inumbo.net>)
 id 1nm476-0007U4-Er
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 01:47:36 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aecb958-cb4c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 03:47:35 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id a11so21695pff.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 May 2022 18:47:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a170902ba9700b0015e8d4eb1d6sm7012542pls.32.2022.05.03.18.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 18:47:32 -0700 (PDT)
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
X-Inumbo-ID: 2aecb958-cb4c-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+ZZ5vfFx25K1I7i1kYl8UxhLqvkhElnoRitD8+hKJmA=;
        b=DpRwgsc8k+bO9cXVHmU7ksT2E8T7R4om62xOunRq9j6F4/Hlmd+72tPALfSIkWpTBv
         6ZsB/FoXumwXqUlvu94h7ehF0Poi6zQZRyL/SVAXWNru3D7CYZKN+GO4S+p3OYu8TvOf
         p5r4/HuAd0PoSIWCdxVFPC7ODUIYPeBjfKvmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZZ5vfFx25K1I7i1kYl8UxhLqvkhElnoRitD8+hKJmA=;
        b=H3QBJt/8FGoNQ5tBkoz9intG79x0e79OkL5RhEkVHtcOG9moyDesIcBce+RH3JQWp8
         CsBSv5aJ+eNuYZka6umPEfZrdZ7fsnmMUrHRpgFzGJJ8h2yLjSPf0yEg1DYnU3QU215e
         JLlqOGtw+5nh2AfgiwbpWKfNqzjorh0R43SzEuttjAIff+9jd8KzdMjGJQx4XoiBDbA9
         V5dENXB2yryBxs/SV5Rn+2pHGOtdqUlL66+4xJQL7zrulUHJso8VlYB+hDVaBx2c/Kc+
         bxzLm0SsXZnWICCNT+db+yFwXUVKRF/v0aI4q1PY88hhz3o5Wy6KdIZZ01YVMhH+NWrT
         wYTQ==
X-Gm-Message-State: AOAM533t0VWpDlAbh3obgPlGAYAoIJrDkM1VV7Pxr/v14Y/BO7PCLM4k
	hSzci+WWN1gZZDS09g2Y58Vxsg==
X-Google-Smtp-Source: ABdhPJytQuECKGgEb8eAW6DkkFw1E8TxkJAce0g4AzSArkwdtDW898amuL4eidgPFi1A7RBjUnKTDA==
X-Received: by 2002:a62:8684:0:b0:50d:972b:d9d2 with SMTP id x126-20020a628684000000b0050d972bd9d2mr18445121pfd.4.1651628853419;
        Tue, 03 May 2022 18:47:33 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Rich Felker <dalias@aerifal.cx>,
	Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>,
	Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>,
	Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>,
	Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	selinux@vger.kernel.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 01/32] netlink: Avoid memcpy() across flexible array boundary
Date: Tue,  3 May 2022 18:44:10 -0700
Message-Id: <20220504014440.3697851-2-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2198; h=from:subject; bh=m3+rrHA3rlt0sA4WgKzRJNTXeSTN4vWW0f0prUvbWYY=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqAKYSI60YG7oB43Zm2qf2XEYFq9+0dv6JxgKQA Vag6ObOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHagAAKCRCJcvTf3G3AJt+PD/ 4wYVpcKl2liC+Uc4jUmmdOovQey8J6/k2HmeHGxkjjuXUGIWCxvRqFTmpp0zt8q6NeCY1dzyQE7A9N PW2CVLlv5GLZfLyBlcsOWL4hofk/Ed905HvAky/Dx8yVe0LszOaIIrWGUii70nX0RIZBcDlNYaOY4k wGJaGLJ9XI5Abp/vMi8qzgEIVt5Qty6Z+cfnpAvETE9FFC0ibHAuxSsOCPhKMgvWgkyDjMAVgJQC6t TKGjSE1Rwow+68x8cxXa3ZsNgWXO0wHDaWWB4/QUxyVrq/AqCxOvgu3SljXBgVpaeUF41w+gB7rTXz Jpn7XXtJZLIDQT9yoNDAsj8yjQSIPdaKabA732knKP+dXXvoimMLj17LWxunuIrNQJ5Awl5Dz2jNa4 96eQ4Eabc5miPNc5+9VOK1Wc20FUE/uqW/VkQkBWzcnLXslpLRuJ2jNTFzk50BKZOJ20vutotuSmWf 5gqjyHzRfK+iajoBCEV6nUiWN7ewO8XDDayLZtzu5foCWXgFFwp2ZWksNnvY6M1djooGD0fU2cMDkZ HK9WR0ZfO5zv8cE5RCjDXb25deVhtGS6HRKU3vBlDmFx3drFqOEK/4zwTej6ttVyJqAspxBqEq7xpi JDgQOkTfh60YdtsNYhykruXCL3NnFuRLtxOeMGWD4IL6YtPwYfH3V6aFCljQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for run-time memcpy() bounds checking, split the nlmsg
copying for error messages (which crosses a previous unspecified flexible
array boundary) in half. Avoids the future run-time warning:

memcpy: detected field-spanning write (size 32) of single field "&errmsg->msg" (size 16)

Creates an explicit flexible array at the end of nlmsghdr for the payload,
named "nlmsg_payload". There is no impact on UAPI; the sizeof(struct
nlmsghdr) does not change, but now the compiler can better reason about
where things are being copied.

Fixed-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Link: https://lore.kernel.org/lkml/d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Rich Felker <dalias@aerifal.cx>
Cc: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/uapi/linux/netlink.h | 1 +
 net/netlink/af_netlink.c     | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
index 855dffb4c1c3..47f9342d51bc 100644
--- a/include/uapi/linux/netlink.h
+++ b/include/uapi/linux/netlink.h
@@ -47,6 +47,7 @@ struct nlmsghdr {
 	__u16		nlmsg_flags;	/* Additional flags */
 	__u32		nlmsg_seq;	/* Sequence number */
 	__u32		nlmsg_pid;	/* Sending process port ID */
+	__u8		nlmsg_payload[];/* Contents of message */
 };
 
 /* Flags values */
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 1b5a9c2e1c29..09346aee1022 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2445,7 +2445,10 @@ void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err,
 			  NLMSG_ERROR, payload, flags);
 	errmsg = nlmsg_data(rep);
 	errmsg->error = err;
-	memcpy(&errmsg->msg, nlh, payload > sizeof(*errmsg) ? nlh->nlmsg_len : sizeof(*nlh));
+	errmsg->msg = *nlh;
+	if (payload > sizeof(*errmsg))
+		memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload,
+		       nlh->nlmsg_len - sizeof(*nlh));
 
 	if (nlk_has_extack && extack) {
 		if (extack->_msg) {
-- 
2.32.0


