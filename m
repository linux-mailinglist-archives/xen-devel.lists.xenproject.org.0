Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA239648937
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 20:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458213.716102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jPq-00069k-Om; Fri, 09 Dec 2022 19:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458213.716102; Fri, 09 Dec 2022 19:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3jPq-000672-LA; Fri, 09 Dec 2022 19:52:14 +0000
Received: by outflank-mailman (input) for mailman id 458213;
 Fri, 09 Dec 2022 19:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bplO=4H=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1p3jPp-00066w-AK
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 19:52:13 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7de3fed-77fa-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 20:52:11 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id n21so13860860ejb.9
 for <xen-devel@lists.xenproject.org>; Fri, 09 Dec 2022 11:52:10 -0800 (PST)
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
X-Inumbo-ID: f7de3fed-77fa-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J1izrHV/dfvla3hF4YyFp61zzuEH6lUXffetejWBGZI=;
        b=T47yxLWpkv4RW4vWdaiF+SZJOBFxJd29AdOAuOSZeVZsbWx0hSRsqVPhLx6B0Et9zR
         ntOjKa7+Lgcl7baRHt1sJm0Pk1zesuCeH+iLI4QrKsHVNvjQIGLiXI9icWUj53NiIV35
         ClH4JtzgBVMncX3VtLGwCY+wWfn/yDxbU4WNSLqL0+Rx0pekRfzbvhDhb324oi16FH9K
         txwbxerFCjDVJF1rZ4shCaGBB0pykjZkHGiz7C+PQVbyw3BMjr72vCM0UV3bJuFrc+BF
         +/8py11YjEjqqHLW8X/iwZ07SG2iTGr0XvdY0nP01QmRuCm3Hk9yRrM2HkEMLvjoX8z+
         g+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1izrHV/dfvla3hF4YyFp61zzuEH6lUXffetejWBGZI=;
        b=NgAPlsjBWj4Wvntz6vVI7qmpKzkPNNSUcVssmdF9SqdwafFyChtRFFvVTpBPIS5+bR
         ICoyBUFO7fcjN4sQ7fwjSMiTitIj/Ft3Zko9zfY3A3F4k1ZcTIFZ/qozDvqf/tgZedZF
         rzbJVplyTX9g+8Xdc1pL7nkrcRQ+nuuwdu9zutX4mWqUgE8EeEK5OxLQMtGbsUedCBDM
         E1dKF2xDNbKoIiBjNFRNpAyHby012SAqxwpaYMPdf/GoNRuEAsvUkcDndO1ZKenEZod9
         4bRaYonqClhvEdXpC4AH1hqx7maC+0y19cvJJcam3Uz60BU7p7KKexKb7tbAjmLojUaf
         aHuQ==
X-Gm-Message-State: ANoB5pmrlZ9wshR34hNYzt8B4J133AwGFN3lVwP2gA1fbiIApMrM04hn
	WUAwwhb+G8Ipcb2ot3Wv/3W04qDIXlNIT8MvfAQ=
X-Google-Smtp-Source: AA0mqf7cJpfgB8yJlpzhg9VKSVyHzsHSya4f4rm873Xw27xKt/pORwLfh+O/FL8PRp6AL8HU6ioxnt1TF/1bTHmZ3yA=
X-Received: by 2002:a17:906:7e57:b0:7c1:bb5:1937 with SMTP id
 z23-20020a1709067e5700b007c10bb51937mr9013520ejr.251.1670615529847; Fri, 09
 Dec 2022 11:52:09 -0800 (PST)
MIME-Version: 1.0
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <83f510bd-9a9c-3063-27dd-d894b1e8031c@suse.com> <a9050eac-21b0-c736-31a3-d6920080d82f@suse.com>
In-Reply-To: <a9050eac-21b0-c736-31a3-d6920080d82f@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 9 Dec 2022 14:51:58 -0500
Message-ID: <CAKf6xptYnqnPA0ME6RucFkxCzuYPrUWwj8WxDgFSy_9Ojz1t-g@mail.gmail.com>
Subject: Re: [PATCH 1/5] x86/tboot: drop failed attempt to hash shadow page tables
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, 
	=?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 8:58 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.12.2022 14:53, Jan Beulich wrote:
> > While plausible to do what was intended based on the name of the flag
> > (PGC_page_table), that name was misleading and is going to be changed.
> > It marks page tables pages _having_ a shadow, not shadows of page table
> > pages. The attempt also didn't cover the HAP case at all, and it
> > constituted a potentially very long loop doing nothing when
> > !SHADOW_PAGING. Instead leave a comment of what actually wants doing
> > there (which then also may need to account for e.g. the risk of A/D bits
> > becoming set behind our backs).
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

