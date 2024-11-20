Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE599D420F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 19:33:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841186.1256698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDpVd-0007ND-3a; Wed, 20 Nov 2024 18:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841186.1256698; Wed, 20 Nov 2024 18:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDpVd-0007Jy-0o; Wed, 20 Nov 2024 18:33:01 +0000
Received: by outflank-mailman (input) for mailman id 841186;
 Wed, 20 Nov 2024 18:32:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JQNB=SP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tDpVb-0007Js-AB
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 18:32:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc83cf92-a76d-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 19:32:56 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539f53973fdso18860e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 10:32:56 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd4671e4sm719746e87.166.2024.11.20.10.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 10:32:54 -0800 (PST)
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
X-Inumbo-ID: dc83cf92-a76d-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRjODNjZjkyLWE3NmQtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTI3NTc2LjU0NzgzMywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732127575; x=1732732375; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oB2+1tG6zHZKnmnNyLh/GrzjxFyzxy1VqAJd59CsJ7I=;
        b=QVy/hn4TCDD7AFik/jdxUoS50w/j/Qzbd0S6OUoLvrq6nTRZez7W9vTuz/oWZEGdE2
         CxDEP/N8jwmUo3mpSZ/vRGx5JbEri6zI7/PcJBiNMHtxPMdyRETeOg6CGbQwS/yl++iU
         mHQirc+nRT+/3yd+m/0NlHtl3i6ikZtA0KE+DvWT1y1XcJaCz5hLev7I+AwvvMGwK2vd
         suAumcy8ZoOhJmKNBIDttLM02XR7xAK/uiIjWPeJQh56Kqu+0qz2wP9ocfWxgKswwcir
         iDDPiIXUBVZrkQvoBZrWtahGLO9SWjYVSwEe1TGNWAlZCfg+vXy3UaLi0J5n2oNugh5L
         94ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732127575; x=1732732375;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB2+1tG6zHZKnmnNyLh/GrzjxFyzxy1VqAJd59CsJ7I=;
        b=riXzAQj+a1TKVp8INv6YrZyTZcS/wqVb/7VCiXutUcq8EPG7jyYAg0IU2/S+9/Dc7f
         Z4NXhGq8QOcQqXKRnVK6g43fWAE/DRoo2F+RtXiK6h3KnrOWbW8xYYC6nVetagZ3Rxm2
         Hp9lzY5fhWhczuQvkvWDF0nLuxCa65rv5aukNQSfEsPnbE9N1GgR2TzGg17PAkuLtliS
         Lil8RkbVCl6oWJ6OzeKWon0Y0DW5Abhiak1VSauy8Sq1VJVgdylxYxYCyFFmZ5iLNanK
         n2dzCbKF/+P/qo2x3p6fniMKOL+btKt55BH+Wx81Bw5uXwhSBAB+HnOev/BrZISPR5Uy
         Xugg==
X-Gm-Message-State: AOJu0YwMxrCKmJxoY3BJhKXXHky02IlEjvKM4/X1LbHOlozcJZ4FTlI4
	EaCHx83DoBJAu0SGXB4+rUH0t8pJadmdwvOL0eLr5T9f/aNUD/RQcn/8/A==
X-Google-Smtp-Source: AGHT+IHIYNNtaSm6x5amg6tEOi15MNuSIo8Z8FL7OhOgzb5RCHJypB1GppgzkxKuPlEAhQNx88NsUA==
X-Received: by 2002:a19:7508:0:b0:53d:bd50:a0f8 with SMTP id 2adb3069b0e04-53dc614c502mr116587e87.3.1732127575025;
        Wed, 20 Nov 2024 10:32:55 -0800 (PST)
Message-ID: <46bd08b50326613bb67b7076490af956e1c7bbbc.camel@gmail.com>
Subject: Last posting date for Xen 4.20 is  Fri Nov 29, 2024
From: oleksii.kurochko@gmail.com
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, "committers@xenproject.org"
	 <committers@xenproject.org>
Date: Wed, 20 Nov 2024 19:32:53 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

Hi all,

I would like to remind everyone that the last posting date for Xen 4.20
is Fri Nov 29, 2024. If you want your features to be
included for the release, please make sure they are posted for the
first time before Fri Nov 29, 2024.

The current schedule can be found here:
https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes

Best regards,
 Oleksii

