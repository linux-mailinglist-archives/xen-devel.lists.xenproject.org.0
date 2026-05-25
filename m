Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULecEJWvFGqWPQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 22:22:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF85CE453
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 22:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319480.1587061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRboU-00006D-Kb; Mon, 25 May 2026 20:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319480.1587061; Mon, 25 May 2026 20:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRboU-0008Vi-Hw; Mon, 25 May 2026 20:22:14 +0000
Received: by outflank-mailman (input) for mailman id 1319480;
 Mon, 25 May 2026 20:22:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wRboS-0008Va-PB
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 20:22:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRboS-000apZ-5Q
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 22:22:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a14af6a-2eae-0a2a0a5409dd-0a2a4506a31c-24
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 22:22:12 +0200
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a14af73-7371-0a2a45060019-d155d0b3f19d-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 22:22:11 +0200
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-38be5e86918so3361501fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 13:22:11 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1779740531; cv=none;
        d=google.com; s=arc-20240605;
        b=RWYbzNjTfT02WQD4MH2+r/67YdDeZEnmtp88FpEoWX86PuEaG9e++lyX60xHQuY7Ke
         dO8ylE6jH4hARBWXlgowUAy2BDFSRtAgqOPep4OMNTSnAE2KW7IsmP6a/x1Fh/LjD+JD
         v3Qwc/4eCevhk1VigeheqqzVcg7bOID7WaHdnCHvf17Tav0BjOGlIC0b1A/2xEYu5U9T
         QXgDwub/Ag0I5RISSNjQ1d60e+vhcIIZx239QlY4/a+bXyHK/OlLX6g5by2pyUFmPDHw
         /PX+IHg6tDTZjE+bZ6OAHTO9t1HOabs5xgBlzPG5R+j4RJSh3Drz5olEsCltptKyltAC
         soqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iZ+wVJbAubaBhu7Hb39+luYPb+2p4UG22nwk4/ozSi4=;
        fh=0sVRqm7+oyz7WJ/bTvyRrhIQoOB1v0nJ1T68JVaBfuo=;
        b=iUXjqnThvb+UUvePAcUShT3Jl1kJmQskTu8aJP1JGvzmguXOgXQlaAjh5ZyPvARcTD
         nks0kGeuaOnY8Ot5KoS4j7SJssOdhxInnqoVakePhl+dEmeBQbzQ52IVMjAn703/85Em
         NeBEE/N0JLRbD+aM40kXr/wyODkdGLQesu+jHr7WOvEKUbJH80f2qJRw3BPHR/YAHJ6T
         HXIqpuOyIcSr9NW662Zt7gTuSW+9D0LvqchqRJHiVQSQuS+QcORCWtZmPY2cbXv7/ufk
         aLu30VPjcp8MYhjZ4KckC6lYskVzQZOTuG1aZbsx7OycWL6L13EanpLfYovLonuz15n3
         yT1w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740531; x=1780345331; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ+wVJbAubaBhu7Hb39+luYPb+2p4UG22nwk4/ozSi4=;
        b=UmUfM8oG4GYTL/pec9g/wQFWguxVIKQTM70zTRvIPP0j9YkmuLuMh+KWaL7WPODHWm
         dUApHmodbfU56EkMI5Zea+lRFlqkYLrHP+MXEPZ65817iiiyje/9Qg7uz0D4MR5BpxIM
         e4sDPNAU2nDf2WHDSl9WHv8Yb+9Ckdfz6N5N3i9fw99QLEbQLiF/XepRzHe+w5WNWZUN
         xFGPipc3x8xl19kkj/4ERfGvuOeWJrOWI/7UjLK3po8XEQZ4Ji9Ip9VsLS6vy9kO51se
         6iaSQf26wAhuB9zRaJJDrre6QRNHaAHGWHZOqVCzpFMOSKnKzvRIfKNOz5AlU9XjePcn
         6a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740531; x=1780345331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZ+wVJbAubaBhu7Hb39+luYPb+2p4UG22nwk4/ozSi4=;
        b=pxtecx5xEb4Dmqg/WXYQwSufLtapzOC+2T4uUB1OQGQMRTFxP/hhG8musrwyAVv2xe
         3E/Pb4o+K28JNxp2vOO9l4h26f/q+kZYTunTZqtNhbf5B6tpjUusaE/zyoILjMT/MLui
         EX9t6qIM7jJ6FLiu37Y0EobTYkl0qBP9NI6+439Sc4rAEO00SA7svdEPaZ6nm2KbQghr
         kpeCdYmMr/Q7ynKm5/rZvIYxoSsCEyzR2s/rsn671Z+ZXaD2Ukxb5o3YoSFkwkawphrD
         ZVH+PGGjW5M48mgm2zIjTbfIl4YUPCG42NY+fLAjU/mKx2OzSF/wQ08nhTQaGwqhdJqv
         hdsA==
X-Gm-Message-State: AOJu0Yx5zf4Y6w1GIyFtDja4Sb/bi6Q9rKrNg/sxgaPa8hGRbVUkt4QL
	OiXNZNsDUKUio9hl/ZPLAQRfEifBquSskeK2w9JeDlU9Q0rbvWDKN4HV9QYqReshf33kx0MikiY
	23eX51AY0kq6rP5Md3ygMjeaqNaHrETE=
X-Gm-Gg: Acq92OF0DSUb3rJ6PcvIdrS+ue25PNJ151lbMSMTtWb44MOguuL8+GxJxEd9GkjovUn
	sVvnLIfPN4o25bnjZdixtd/A052Ur+rX/PlTQTWxGN6ADBJcHTITUiIK6LaB5pMcNAUVcNWAwd0
	N4Tr1lZaywaNT7AlAcsVrv5dOVBv7KOKaL6A2DsG+OVO6S25A3SCS/4+ub1XbxWjs/FxWNHRw8M
	j3fZ23LNR4pjHZ/xiQhy+tmlPjrRvFSm5BmVaE5cHH7THBK1mwBwTC55a0XWbcjhuAK/GxXF96f
	HHfz
X-Received: by 2002:a2e:9ec2:0:b0:393:a37e:b131 with SMTP id
 38308e7fff4ca-395d8c5a63dmr37739941fa.9.1779740531071; Mon, 25 May 2026
 13:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1779430299.git.mykola_kvach@epam.com> <88459940b410ceddc04bca7e2cadf7c16bd5c13b.1779430299.git.mykola_kvach@epam.com>
 <d98c2f4d-d1a9-4ef3-a24e-05cc6451bb72@amd.com>
In-Reply-To: <d98c2f4d-d1a9-4ef3-a24e-05cc6451bb72@amd.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 25 May 2026 23:21:59 +0300
X-Gm-Features: AVHnY4IGuUTRlWcpOAAttbTo2Vn6IWIzaq-dJd_KkIl03Ikx7alNDTxJYpKg4KY
Message-ID: <CAGeoDV_o3-xgO=D25hQ5ofT_y-h6OWHQxF8CwQVzs4+GG-Fxig@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: Document Arm GICv3 limit for dom0_max_vcpus
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1779740532-87170D75-DA1DA3A4/0/0
X-purgate-type: clean
X-purgate-size: 2523
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 95AF85CE453
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thank you for the review.

On Mon, May 25, 2026 at 12:55=E2=80=AFPM Orzel, Michal <michal.orzel@amd.co=
m> wrote:
>
>
>
> On 22-May-26 08:18, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > On Arm GICv3 systems, Dom0 may use the host GIC layout, for example
> > when it is the hardware domain. In that case the effective Dom0 vCPU
> > count is not only bounded by the requested dom0_max_vcpus value and
> > Xen's generic vCPU limits. It is also bounded by the redistributor MMIO
> > regions that can be exposed for the host layout.
> >
> > Document that Xen can only create Dom0 vCPUs whose virtual redistributo=
r
> > frame is covered by those regions, and that secondary vCPU creation sto=
ps
> > at the first vCPU whose virtual redistributor frame is not covered.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> >  docs/misc/xen-command-line.pandoc | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index d46d5b2152..0a5589b24c 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -981,6 +981,14 @@ The number of VCPUs to give to dom0.  This number =
of VCPUs can be more
> >  than the number of PCPUs on the host.  The default is the number of
> >  PCPUs.
> >
> > +On Arm systems using GICv3, Dom0 may use the host GIC layout, for exam=
ple
> It's not dom0 specific. It can by any domain using host memory layout mea=
ning
> dom0, hwdom, domU direct mapped, in which case I'm not sure if such comme=
nt
> should belong here given that this behavior is not dom0_max_vcpus specifi=
c (same
> could be triggered on your setup with dom0less domU, direct-mapped and 17=
 vCPUs).

You are right that the redistributor coverage limit is not specific to
dom0_max_vcpus. It applies to Arm GICv3 domains using the host layout,
such as the hardware domain or a direct-mapped domain.

My reason for touching dom0_max_vcpus was that this option is where users
are told how many Dom0 VCPUs Xen will try to create. However, the
GICv3-specific details would fit better in a more generic Arm
device-tree/domain description section, around the cpus/direct-map
properties.

For dom0_max_vcpus, I can keep only a short generic note, for example:

The resulting number of Dom0 VCPUs is still subject to Xen's generic
and architecture-specific domain limits.

~Mykola

