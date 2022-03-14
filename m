Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673624D88CA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 17:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290319.492349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnFF-0006GE-Jh; Mon, 14 Mar 2022 16:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290319.492349; Mon, 14 Mar 2022 16:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTnFF-0006De-Gm; Mon, 14 Mar 2022 16:08:29 +0000
Received: by outflank-mailman (input) for mailman id 290319;
 Mon, 14 Mar 2022 16:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qs9R=TZ=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1nTnFE-0006DY-N9
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 16:08:28 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb5b7ce1-a3b0-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 17:08:27 +0100 (CET)
Received: by mail-yb1-xb30.google.com with SMTP id g1so31761804ybe.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 09:08:27 -0700 (PDT)
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
X-Inumbo-ID: fb5b7ce1-a3b0-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
        b=SdKfd/jbfGl52GQYetUtYUdEOsWHs/OwcXpH/I1S9dZeNmPMmDUjhk4fg2k0fckDY0
         t23UvUz0VX5KFhJVhe9QE4pxDN4WgSxdl2ub9UvFNGfWLksZPY3qve78zZUa/T+keflA
         4AqyVh/8j+AuQSOjaa97O9K94KoTPLgUsD1vsKJvk2RgSco0dDjxktClnkVR6rNfUD1j
         zklsyhplOXYFaLqTldx9pYgtu++atT9y1Dw4Ghx51Wl3kAxno8itR1Ko8ofxlm++dFis
         qihdx8K0f1b56+t1POBlkbGHXwMXu7ECfibDcuW0asoel4nuFfOu+/4Uh3pw02Ppe5lO
         w2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2HGDRUKrwEN1d1K0bkDUZOaGvLo7SAJZqfbA6vVtahI=;
        b=Jt2lDzgRQL9FLAqa00dVbQrQ3C27zIEj8RalzFSv8nvVncGICCODENi/EacTcrrixs
         9zJz8l44g+QB1ZhV50ZyVh20cQDAR8FaNJsV9MmBL7y49UeNng1vWKyyN5Ji6x6SnVfU
         +JcZ9RuNl3ceZox9rWRIC1NL+Mvr50g5IoKrbzf4RgTaEx2WXjxk5uqzODP6V+hkOYJ7
         3sPgRtgp3x/LdtLRDgq1o0jc3MPyZCRP4KQBT+2wGOZ/tRaGrQQoxG5mwAgB/NOeGPd6
         vnteSDdWQsKpYf2gO0nsNS3l+Sh/emb0UrP2g9/e5VO1Vv/azSMc+EaCthvmZAKHp4+m
         6Qgg==
X-Gm-Message-State: AOAM531F7aoTziOoMruxrcbFbdRt5QbvLSlmNxoODOfua5zpGSuIPWIw
	BddXe8rGhdwWs4jadaeJCswATbF70Ce6A52gPzeHqg==
X-Google-Smtp-Source: ABdhPJyW6M/Aw8hf4XdJy6WjUtmqQsp6CbpUtiBE5nkkoLRyKFw/dasDSxXiwKCdKxH3YAqMGp/y61XBal4OddxiDeY=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr18269446ybp.39.1647274106395; Mon, 14
 Mar 2022 09:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220314160108.1440470-1-armbru@redhat.com> <20220314160108.1440470-4-armbru@redhat.com>
In-Reply-To: <20220314160108.1440470-4-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 16:08:15 +0000
Message-ID: <CAFEAcA8Tb7e+mJGaietc5si7_xZWxbTixcTSvNpB9wH_LQJ7kQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Christian Schoenebeck <qemu_oss@crudebyte.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, 
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Corey Minyard <cminyard@mvista.com>, 
	Patrick Venture <venture@google.com>, Eduardo Habkost <eduardo@habkost.net>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Greg Kurz <groug@kaod.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, Keith Busch <kbusch@kernel.org>, 
	Klaus Jensen <its@irrelevant.dk>, Yuval Shaia <yuval.shaia.ml@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabien Chouteau <chouteau@adacore.com>, KONRAD Frederic <frederic.konrad@adacore.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Juan Quintela <quintela@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	David Hildenbrand <david@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>, 
	Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Cornelia Huck <cohuck@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, John Snow <jsnow@redhat.com>, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, 
	qemu-block@nongnu.org, haxm-team@intel.com, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Mar 2022 at 16:01, Markus Armbruster <armbru@redhat.com> wrote:
>
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
>
> This commit only touches allocations with size arguments of the form
> sizeof(T).
>
> Patch created mechanically with:
>
>     $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
>              --macro-file scripts/cocci-macro-file.h FILES...
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

>  104 files changed, 197 insertions(+), 202 deletions(-)

I'm not going to say you must split this patch up. I'm just going to
say that I personally am not looking at it, because it's too big
for me to deal with.

-- PMM

