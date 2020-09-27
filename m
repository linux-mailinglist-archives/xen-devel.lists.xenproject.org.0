Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12A27A11E
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 15:00:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMWHr-00042p-MA; Sun, 27 Sep 2020 13:00:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aL2e=DE=gmail.com=asaffisher.dev@srs-us1.protection.inumbo.net>)
 id 1kMWHq-00042j-2q
 for xen-devel@lists.xen.org; Sun, 27 Sep 2020 13:00:18 +0000
X-Inumbo-ID: c1bf5d46-cec2-43cd-a88c-d32bfb19fbcb
Received: from mail-il1-x12f.google.com (unknown [2607:f8b0:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1bf5d46-cec2-43cd-a88c-d32bfb19fbcb;
 Sun, 27 Sep 2020 13:00:17 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id y2so7180283ila.0
 for <xen-devel@lists.xen.org>; Sun, 27 Sep 2020 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nFeTEIAkGUmTSkpBO8f+vEEmh+UTJE18Clvc30N+IYg=;
 b=BLQPE1uno0Vk0V2HbYOzbkLHhncMShyNwE5cu7+Hnely8vj10ZfrMI8AunuRIvEROA
 MwgvPi5ZOisE8T878EJ2fgDeyS6VENpha20Q+6NpEIQlolZFd0044v4zivZTypCuwV0z
 Nb7GH18dEOTUtkn/uGrsJ+LVEeIMKSsiBI2+uJz5nESBNiN5D34/GpKK61dqDegOqwqN
 mv9H8z4E1mA2TK4nYr1S27LvhL0y+ioDVOtvxH+r+jnruferIuphRvZuvmURSvVUxrVf
 qxdAMM4Wg/knTBRU//JvemSmtQHtB1lWsLpBI6mARSAgc3cE8//sbd4SdiPW2ZCD402r
 BWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nFeTEIAkGUmTSkpBO8f+vEEmh+UTJE18Clvc30N+IYg=;
 b=UQSiu2WgH99uOaZbU1aERHByGWbhsgx0KfjhQsGBB81AtvfqYSNErBYIwaW5WgM/rV
 ue5qBShiGXc4Gvv0aiXpi35a3p/rnwt0v4wX1vg0ZcgoLAajZuSsDuZAEPFgpc2zkwoB
 994pabQia1duUuangUessCmErlE8kyqOLCTt0iZLYzVxEVeyMo+PBT+zEwO6nfyAWvFB
 5VK2V29MbVTSl8Piobth1m5HZmSPaCpVvhh95odSvBpbZICPz20A2m+qsA9uwe55Y/fF
 VnurVrhdQZmBBA3Iv4LPQi5PIsrQNeLoSWevo1IAOKCOwviruhF6w4oH63tODQfW3/f+
 2CnQ==
X-Gm-Message-State: AOAM530nZ8ItRGyCkaBobNCoABjG6g5IjgXF7wC8ElcbdCEmjGFZ6l3D
 posWa82JARmASdLlXaO1hi7guFMfGhDpZP7kl91pxu8+VvvE3Y51
X-Google-Smtp-Source: ABdhPJwnblMypc3DD8Ra5lH05b3T0kXVN1zEgRr7nwjOC7zNYYlVk8IZ/DEJHPfBWEKLcZKBw2gqGlLaY8Ca4eA6vQQ=
X-Received: by 2002:a05:6e02:e0a:: with SMTP id
 a10mr7296606ilk.113.1601211616461; 
 Sun, 27 Sep 2020 06:00:16 -0700 (PDT)
MIME-Version: 1.0
From: Asaf Fisher <asaffisher.dev@gmail.com>
Date: Sun, 27 Sep 2020 16:00:05 +0300
Message-ID: <CAHmEStv4FSbsC0j0N9JgjUbNSYuu0bkMBp1grZfw3vwa1n7cUA@mail.gmail.com>
Subject: Compiling while considering address-of-packed-member
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000009c06d405b04b21a1"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000009c06d405b04b21a1
Content-Type: text/plain; charset="UTF-8"

should I just turn it off? I mean some code such as ipxe (from ipxe.tar.gz)
does not add pragma marks to ignore this error..
also  /tools/firmware/rombios/32bit/tcgbios/tcgbios.c:1508 needs a pragma
mark...
What should I do?

--0000000000009c06d405b04b21a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">should I just=C2=A0turn it off? I mean some code such as i=
pxe (from ipxe.tar.gz) does not add pragma marks to ignore this error..<div=
>also=C2=A0=C2=A0/tools/firmware/rombios/32bit/tcgbios/tcgbios.c:1508 needs=
 a pragma mark...</div><div>What should I do?</div></div>

--0000000000009c06d405b04b21a1--

