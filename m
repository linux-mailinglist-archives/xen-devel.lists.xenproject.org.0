Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0771A2FE9BB
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 13:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72038.129445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2YrI-0001jM-6d; Thu, 21 Jan 2021 12:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72038.129445; Thu, 21 Jan 2021 12:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2YrI-0001ix-2T; Thu, 21 Jan 2021 12:14:40 +0000
Received: by outflank-mailman (input) for mailman id 72038;
 Thu, 21 Jan 2021 12:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaFh=GY=gmail.com=vicooodin@srs-us1.protection.inumbo.net>)
 id 1l2YrH-0001is-2M
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 12:14:39 +0000
Received: from mail-ot1-x335.google.com (unknown [2607:f8b0:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16fb4859-d036-4b15-a97d-f0ab959b40dd;
 Thu, 21 Jan 2021 12:14:38 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id d1so1338636otl.13
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 04:14:38 -0800 (PST)
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
X-Inumbo-ID: 16fb4859-d036-4b15-a97d-f0ab959b40dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=/NWL35Cnme8VSzscEJqs4UCQQRPXFL/vaSUf3iI5V/k=;
        b=Sm+OqxBhC/+TfN2r5USrP5+YQZgKMtdcUwAVoCTMjup+CtA6sBoUuxG7RgqSQqR88o
         HxdslZhB1eY5njx0SVLrGrH8B1BIjHGmrkccEnytgZwZVX+W3v5tUCiw5/7MhN9lHrgQ
         z9mheQUOObzGxUc0VdzvBX0USRQRlROHG3GulR8BQb5QrJ4awIoRhz0qa9h7DIDdesMf
         NsXr6y6BYk1edN/jV8hbeuzx3cVrpSjBRXq9bGP5i2pa0U6OJes4OREu62WaxZxbKC/f
         0+CM/9Rjzz6WGvmfeAl3PNT4Zv4LrPp8jteMVr0IZzFv9tMOt+bwYACLvtNJIatygU48
         3M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=/NWL35Cnme8VSzscEJqs4UCQQRPXFL/vaSUf3iI5V/k=;
        b=d08/Z/GkNsRuzxyhxACZWc5qcHGhER58MlrXIWJr3kGOOz8WxJ1HWqOb+rWr0DwJ+y
         +visGIXj406l3c2P/fFssKcmisVbXKpf6U3qLpnlZojHhRYmioXQOvN1VhFYIEfI7i29
         7Bkd8PfzTO94NxsU0i9vZAltBUDgw2Gl57UIeQ+Zd2r3MDWjrRPbqv1w/jFmuUJsniG2
         CvWwVhddSccONIhSL0G5dQig27yTou1QWPSGST4iHjnE8whGu181OFu98tCHqzhu1MO5
         4gVZPW1K1kR3qKooH1XOPOhDXn0RjRxM3oHZ+dTo6/9XNXQypYQQISZvcL9PtRsj1yHA
         nkEQ==
X-Gm-Message-State: AOAM530gFjZ08R2qLlyO905Zi00kem8RDNN88EEevt//598EL9Hz0a4m
	7B+B48eep3sKECTJ9mYHFWBY9dWduFGab1CFpX4=
X-Google-Smtp-Source: ABdhPJzPxRhmWz5ddM4lrDMxKS/BwydK1aJg4Cek0R/qTyYdLJtHjGhKilmnwWbdqtsd/cPcFUEpgDL5FqsF+UtFHuk=
X-Received: by 2002:a9d:1288:: with SMTP id g8mr8776208otg.168.1611231277761;
 Thu, 21 Jan 2021 04:14:37 -0800 (PST)
MIME-Version: 1.0
From: Nastya Vicodin <vicooodin@gmail.com>
Date: Thu, 21 Jan 2021 14:14:26 +0200
Message-ID: <CAFdZxxmyXncZhCepxM8beRvTAsaYya=VSO5eaDU4zjqLGbYWqw@mail.gmail.com>
Subject: [PATCH v7 0/7] xl / libxl: named PCI pass-through devices
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, 
	Paul Durrant <pdurrant@amazon.com>
Content-Type: multipart/alternative; boundary="000000000000f6470305b968039c"

--000000000000f6470305b968039c
Content-Type: text/plain; charset="UTF-8"

Hi, Wei!

Wei, could you please review?

Regards,
Anastasiia Lukianenko

--000000000000f6470305b968039c
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi, Wei!<div><br></div><div>Wei, could you please review?<br></div><div><br></div><div>Regards,</div><div>Anastasiia Lukianenko</div></div>

--000000000000f6470305b968039c--

