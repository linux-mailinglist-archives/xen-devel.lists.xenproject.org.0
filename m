Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493651B759
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 07:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321026.542364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfj-00082h-9h; Thu, 05 May 2022 05:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321026.542364; Thu, 05 May 2022 05:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmTfj-0007xB-3w; Thu, 05 May 2022 05:05:03 +0000
Received: by outflank-mailman (input) for mailman id 321026;
 Wed, 04 May 2022 22:57:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UCk=VM=paul-moore.com=paul@srs-se1.protection.inumbo.net>)
 id 1nmNwE-00062l-Io
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 22:57:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99078139-cbfd-11ec-a406-831a346695d4;
 Thu, 05 May 2022 00:57:40 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1670513wmn.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 May 2022 15:57:39 -0700 (PDT)
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
X-Inumbo-ID: 99078139-cbfd-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qfWwXZWPvxEE3w1uLnkzPlrx6nJaZSmQ1gbsC3kCZlI=;
        b=fMehx6+pldeupaypGl5lGMLh8Blc5Pb964suvnwujkOTfmhEds0USznV5iIpAmDMiQ
         3bX5ovLiBcm+P+Qjkm7S30sNoAIneyphU/3HUmg8FgNya3x4Ys+vGWu+B9CwMsbZwixV
         5hhw5d61RXfF0ZuA9a19yWLWnmsownsAlvxGOq/bh+zf+KCchfsYUSjN3DbkCogRNiil
         4sZMBBy0wN3DJWJ3HV3y9RTPrsOy6eZO4wbIVzlw9cfeY3DYzhWrMs9JJuoIK2/rWVPl
         SzHF6XACCrgzPRUtq8fL5afcNflV6Vriy9o5VdAvBNuxRLNvKxX70jkd0hURqNp4X2R8
         1xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qfWwXZWPvxEE3w1uLnkzPlrx6nJaZSmQ1gbsC3kCZlI=;
        b=EYUFGzufqp6Cr1Nnc5Bk5L7/k6eEsarCQ3oz0AIiTKrOfQ6wHIG3rhWUYnQWlMhr5S
         +qcpwmei37b8cGK38Y/GpSD6NCQbOTM729KFYXENfly/jJT0nxY4SROxaf6wnF4aDxbS
         YgVBsW/OPisqjijnjlORDpOCBMXYbrbs1r/IGafL9gwgMj2LP7Lqkd2r1WaS0bX6gwzJ
         2SiwttOeu5wvAByQulnTwkhJOUoz38PcZS37O/KcnvnzWZgEBEcLO3z9QtgzuRTJ/lS2
         SOpy7DVT1jKar/ZmCpgbe1bVTVXimPVVxnarE9iefxz6UWbogTzxBlstHK74SSFyNiPR
         66Zg==
X-Gm-Message-State: AOAM533K8fceuovLDAcTzkzWNB7CKaiNHQAoWDSgOw3AAlnQaHmZ2FLn
	/qFAEHHKveBA1s5PHvhI80NgB/RnjDRsTWtku2Ne
X-Google-Smtp-Source: ABdhPJzn8kCki7g2xrksVPCE2X0dMoSQ5GNrlnQWJqU+8a/RnZE5ShgkUyQvDBvdRa4kG7oifCsX28YouBnWU5DkxR0=
X-Received: by 2002:a05:600c:4fc9:b0:394:4317:1aa4 with SMTP id
 o9-20020a05600c4fc900b0039443171aa4mr1477643wmq.179.1651705059031; Wed, 04
 May 2022 15:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220504014440.3697851-1-keescook@chromium.org> <20220504014440.3697851-29-keescook@chromium.org>
In-Reply-To: <20220504014440.3697851-29-keescook@chromium.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 4 May 2022 18:57:28 -0400
Message-ID: <CAHC9VhT5Y=ENiSyb=S-NVbGX63sLOv4nVuR_GS-yww6tiz0wYA@mail.gmail.com>
Subject: Re: [PATCH 28/32] selinux: Use mem_to_flex_dup() with xfrm and sidtab
To: Kees Cook <keescook@chromium.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Xiu Jianfeng <xiujianfeng@huawei.com>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Gabbasov <andrew_gabbasov@mentor.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Gross <agross@kernel.org>, 
	Andy Lavr <andy.lavr@gmail.com>, Arend van Spriel <aspriel@gmail.com>, 
	Baowen Zheng <baowen.zheng@corigine.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Bradley Grove <linuxdrivers@attotech.com>, 
	brcm80211-dev-list.pdl@broadcom.com, Christian Brauner <brauner@kernel.org>, 
	Christian Lamparter <chunkeey@googlemail.com>, Chris Zankel <chris@zankel.net>, 
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, Dan Williams <dan.j.williams@intel.com>, 
	David Gow <davidgow@google.com>, David Howells <dhowells@redhat.com>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, devicetree@vger.kernel.org, 
	Dexuan Cui <decui@microsoft.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eli Cohen <elic@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Eugeniu Rosca <erosca@de.adit-jv.com>, Felipe Balbi <balbi@kernel.org>, 
	Francis Laniel <laniel_francis@privacyrequired.com>, Frank Rowand <frowand.list@gmail.com>, 
	Franky Lin <franky.lin@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Hante Meuleman <hante.meuleman@broadcom.com>, 
	Hulk Robot <hulkci@huawei.com>, Jakub Kicinski <kuba@kernel.org>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, James Morris <jmorris@namei.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jens Axboe <axboe@kernel.dk>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>, Kalle Valo <kvalo@kernel.org>, 
	Keith Packard <keithp@keithp.com>, keyrings@vger.kernel.org, kunit-dev@googlegroups.com, 
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>, 
	Leon Romanovsky <leon@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	llvm@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>, 
	Louis Peens <louis.peens@corigine.com>, Luca Coelho <luciano.coelho@intel.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Mark Brown <broonie@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, 
	Nathan Chancellor <nathan@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rich Felker <dalias@aerifal.cx>, Rob Herring <robh+dt@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, "Serge E. Hallyn" <serge@hallyn.com>, 
	SHA-cyfmac-dev-list@infineon.com, Simon Horman <simon.horman@corigine.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Stefan Richter <stefanr@s5r6.in-berlin.de>, 
	Stephen Hemminger <sthemmin@microsoft.com>, Tadeusz Struk <tadeusz.struk@linaro.org>, 
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>, 
	Udipto Goswami <quic_ugoswami@quicinc.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>, 
	xen-devel@lists.xenproject.org, Yang Yingliang <yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 3, 2022 at 9:57 PM Kees Cook <keescook@chromium.org> wrote:
>
> As part of the work to perform bounds checking on all memcpy() uses,
> replace the open-coded a deserialization of bytes out of memory into a
> trailing flexible array by using a flex_array.h helper to perform the
> allocation, bounds checking, and copying:
>
>     struct xfrm_sec_ctx
>     struct sidtab_str_cache
>
> Cc: Steffen Klassert <steffen.klassert@secunet.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Eric Paris <eparis@parisplace.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Xiu Jianfeng <xiujianfeng@huawei.com>
> Cc: "Christian G=C3=B6ttsche" <cgzones@googlemail.com>
> Cc: netdev@vger.kernel.org
> Cc: selinux@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/uapi/linux/xfrm.h    | 4 ++--
>  security/selinux/ss/sidtab.c | 9 +++------
>  security/selinux/xfrm.c      | 7 ++-----
>  3 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/include/uapi/linux/xfrm.h b/include/uapi/linux/xfrm.h
> index 65e13a099b1a..4a6fa2beff6a 100644
> --- a/include/uapi/linux/xfrm.h
> +++ b/include/uapi/linux/xfrm.h
> @@ -31,9 +31,9 @@ struct xfrm_id {
>  struct xfrm_sec_ctx {
>         __u8    ctx_doi;
>         __u8    ctx_alg;
> -       __u16   ctx_len;
> +       __DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, ctx_len);
>         __u32   ctx_sid;
> -       char    ctx_str[0];
> +       __DECLARE_FLEX_ARRAY_ELEMENTS(char, ctx_str);
>  };

While I like the idea of this in principle, I'd like to hear about the
testing you've done on these patches.  A previous flex array
conversion in the audit uapi headers ended up causing a problem with
GCC12 and SWIG; while it was a SWIG problem and not a kernel header
problem that was thin consolation for those with broken builds.

> diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
> index a54b8652bfb5..a9d434e8cff7 100644
> --- a/security/selinux/ss/sidtab.c
> +++ b/security/selinux/ss/sidtab.c
> @@ -23,8 +23,8 @@ struct sidtab_str_cache {
>         struct rcu_head rcu_member;
>         struct list_head lru_member;
>         struct sidtab_entry *parent;
> -       u32 len;
> -       char str[];
> +       DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(u32, len);
> +       DECLARE_FLEX_ARRAY_ELEMENTS(char, str);
>  };
>
>  #define index_to_sid(index) ((index) + SECINITSID_NUM + 1)

--=20
paul-moore.com

