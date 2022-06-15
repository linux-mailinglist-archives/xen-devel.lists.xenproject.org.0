Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E405F54C1BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 08:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349709.575861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MRl-0005qs-AY; Wed, 15 Jun 2022 06:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349709.575861; Wed, 15 Jun 2022 06:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1MRl-0005o0-7W; Wed, 15 Jun 2022 06:24:09 +0000
Received: by outflank-mailman (input) for mailman id 349709;
 Wed, 15 Jun 2022 06:24:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=crEz=WW=gmail.com=viresh.linux@srs-se1.protection.inumbo.net>)
 id 1o1MRk-0005nr-Bx
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 06:24:08 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2157d85-ec73-11ec-9917-058037db3bb5;
 Wed, 15 Jun 2022 08:24:07 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-30ce6492a60so51000607b3.8
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jun 2022 23:24:06 -0700 (PDT)
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
X-Inumbo-ID: c2157d85-ec73-11ec-9917-058037db3bb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LshRSzq22wtp4qhXs+/iZas8+X4eeCgZ5sV4MhFsw2w=;
        b=luyrFMQUtVOGazWD1iq3vMXmKdEc5Z9Js2dg0RzKB7UAOL8BZ52UtgL/CXxEVKZVuw
         Lk4Uf50DB2KCN4AdmvHrHj1dL0buHpaWhvQP2ITrsXjzfMfLafIeW+ByvnE87ylrbN96
         NwgiKQIz2gnpUTJtwkHDdaMyi+OtlkO+HpgYQJA1Xb2gbQ0wx/i1jppcWMwFNPIic/BL
         gHYZPBNIQEnouIR/kcjreA0RJP6sNCa0Cj7vrEecr1j2QTQoDizmKigSbHDaJYHag7vx
         4kk8G8Q4AJJasQv7l8ujLQaoEfvqb6jDOCcGYTrSjw5pjx5idMc+9lQHaLuotaWJ/2ID
         lxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LshRSzq22wtp4qhXs+/iZas8+X4eeCgZ5sV4MhFsw2w=;
        b=0JfWiE+gWaR4kN56JczdfN6simahwec7VUuxISRv4fZgg2nu19DwKOKflU47nF5LsS
         Jfba4rWZ+V/SbIU/c9WclaSJRtYPMY53ktnHw/FLFJAe7x+npSSOZpJPE0MQ+L830xhb
         QWe5GOh9QUuOn9FjR4mSSyctyAc3i+KcAvaxleE0Ped5nx8diNN+gO4ChTQaNe5fdG9r
         DQv8DRI6wIWVNi0LWt+WZ3z3C9L4GiZIwnQbPSU1bfmc5Wpan+WLFqt4kEM7ihtxlbx5
         g/xW1SNw4taaydyr36tWyZKz1VUWlXVXHqCzOF7GIYVXXl5Fkh9wfZvP4ThOVdTKu3gv
         12hw==
X-Gm-Message-State: AJIora+dMT+foc+o5S2XrkQ+duiaV8gz6Aw6FFlGuk7kIIZwUBFrf7+3
	GiV5LewIgis44zHzLru0fe5niMSoSf6Ge49mzXI=
X-Google-Smtp-Source: AGRyM1tAM6ElCRQ+uq7vQIdf64vAqhTVQNLn5SJ7tZ9sRuvacanhNpyrrq71qFzPCPyW5IbmrgmbXDkARvs8jenWC3E=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr10019086ywk.209.1655274245807; Tue, 14
 Jun 2022 23:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1654197833-25362-1-git-send-email-olekstysh@gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 15 Jun 2022 11:53:54 +0530
Message-ID: <CAOh2x=kxpdisV+tqcYOoZGSKA8YjPMej+7u19Jpa1jmVcZCaxA@mail.gmail.com>
Subject: Re: [PATCH V4 0/8] virtio: Solution to restrict memory access under
 Xen using xen-grant DMA-mapping layer
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	virtualization@lists.linux-foundation.org, x86@kernel.org, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
	Henry Wang <Henry.Wang@arm.com>, Kaly Xin <Kaly.Xin@arm.com>, Jiamei Xie <Jiamei.Xie@arm.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

On Mon, Jun 6, 2022 at 10:16 AM Oleksandr Tyshchenko
<olekstysh@gmail.com> wrote:
> The high level idea is to create new Xen=E2=80=99s grant table based DMA-=
mapping layer for the guest Linux whose main
> purpose is to provide a special 64-bit DMA address which is formed by usi=
ng the grant reference (for a page
> to be shared with the backend) with offset and setting the highest addres=
s bit (this is for the backend to
> be able to distinguish grant ref based DMA address from normal GPA). For =
this to work we need the ability
> to allocate contiguous (consecutive) grant references for multi-page allo=
cations. And the backend then needs
> to offer VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1 feature bits (it=
 must support virtio-mmio modern
> transport for 64-bit addresses in the virtqueue).

I was trying your series, from Linus's tree now and started seeing
boot failures,
failed to mount rootfs. And the reason probably is these messages:

[ 1.222498] virtio_scsi virtio1: device must provide VIRTIO_F_ACCESS_PLATFO=
RM
[ 1.316334] virtio_net virtio0: device must provide VIRTIO_F_ACCESS_PLATFOR=
M

I understand from your email that the backends need to offer
VIRTIO_F_ACCESS_PLATFORM flag now, but should this requirement be a
bit soft ? I mean shouldn't we allow both types of backends to run with the=
 same
kernel, ones that offer this feature and others that don't ? The ones that =
don't
offer the feature, should continue to work like they used to, i.e.
without the restricted
memory access feature.

I am testing Xen currently with help of Qemu  over my x86 desktop and
these backends
(scsi and net) are part of QEMU itself I think, and I don't really
want to go and make the
change there.

Thanks.

--
Viresh

