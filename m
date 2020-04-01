Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6D19AF0C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 17:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJfZo-0003WH-9B; Wed, 01 Apr 2020 15:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Uk1=5R=gmail.com=asaffisher.dev@srs-us1.protection.inumbo.net>)
 id 1jJfYE-0003Ud-RN
 for xen-devel@lists.xen.org; Wed, 01 Apr 2020 15:45:10 +0000
X-Inumbo-ID: c485108e-742f-11ea-9e09-bc764e2007e4
Received: from mail-il1-x12a.google.com (unknown [2607:f8b0:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c485108e-742f-11ea-9e09-bc764e2007e4;
 Wed, 01 Apr 2020 15:45:10 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id j9so377026ilr.7
 for <xen-devel@lists.xen.org>; Wed, 01 Apr 2020 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7WH1VZMhipii5qGj8FCkDoZc0ZVO53Rd+qcBUFGxmKo=;
 b=Byl1+AQt1qUM2DWFl8PbqdwKSApWrWgtXUfB5P2j8w88c1/lpGWT7HRefnuISdlglc
 MxueS1DtZ4sn4V039gRod8pcQEDiwtp3XkLD6j3HGIipOK3eTr9fVVxgXILtVpeJ/eLp
 kFidsheCM7mCdDvhiSzlmkQdtpmB2gNOVLNFr1agqnuHVI72RMyr4Gqaww9RxUzACGVR
 iQce9yorwPRzzoWhL0yBuRuTfTDxMtazWGkHeNDEFyANfJxMZ0JIevd+GMY/A9qZvEvL
 GecI4RPUH/my8TJ59cgzRThynR6gOht6gsW8XEpxrTMQIC+0LaIB2ey0sneB5VzyvjgO
 fdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7WH1VZMhipii5qGj8FCkDoZc0ZVO53Rd+qcBUFGxmKo=;
 b=FWLKYf2hr2//ltjfy5KqNCjtAwjqRTV2ir4CCYvwNUECPzw3cbVNOel+qLcyfeWh9D
 8iWI48MtH5flFKfrMxWYurrgR2AOlNEF39HFQWAOpH3ZyhV1lYUV71i37n1FePel/8v7
 swyUDD1Q3gA2Nj4g0Tyd5xK17D+quUTyu6lkPA1INScOgySxMRfcROKP7tAe/dRbFgDt
 AJzPS42hNtVe3fz9PRekbakYXrUPqxt8CHQ445uynUnuv7Lum3epgrZoOYzxw1ShvcyD
 oJz7fG6dTLPK3JKuW2r9f4pR1pmxYLZw/sKZ8+U4TNaau61Fqf6WtntB2AWRIOe94d/M
 SahQ==
X-Gm-Message-State: ANhLgQ3o7/LrU7cgBUZzxusxc9+TiGHJZdXGeo3BUcLcNXZVwDmYUJnq
 ZctUTKt1jXF+wl8/hsYGHVmeJweiXZvsH61VTjy4kmXZjlw=
X-Google-Smtp-Source: ADFU+vsBYyv9GqtuRMp9MPOwYoo/pwxq07OscYvQIy+HzD7/DyS0SD7QSp9l6frVQApx8GWyaD0kuM9e35E47dto4+Y=
X-Received: by 2002:a92:3b9c:: with SMTP id n28mr22113720ilh.53.1585755909175; 
 Wed, 01 Apr 2020 08:45:09 -0700 (PDT)
MIME-Version: 1.0
From: Asaf Fisher <asaffisher.dev@gmail.com>
Date: Wed, 1 Apr 2020 18:44:58 +0300
Message-ID: <CAHmEStvAQ0SHMYMcS4c43B9uOAU3trvsRJMVtO5CxCr+QXTD9g@mail.gmail.com>
Subject: Make VM save/restore and VM migration work on ARM.
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000aad76805a23c91d7"
X-Mailman-Approved-At: Wed, 01 Apr 2020 15:46:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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

--000000000000aad76805a23c91d7
Content-Type: text/plain; charset="UTF-8"

Hello!
Just wonder if this Open Work Item is still available?
https://wiki.xenproject.org/wiki/Xen_ARM_TODO
Thank you,
Asaf Fisher

--000000000000aad76805a23c91d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello!<div>Just wonder if this Open Work Item is still=C2=
=A0available?</div><div><a href=3D"https://wiki.xenproject.org/wiki/Xen_ARM=
_TODO">https://wiki.xenproject.org/wiki/Xen_ARM_TODO</a>=C2=A0</div><div>Th=
ank you,</div><div>Asaf Fisher=C2=A0<br></div></div>

--000000000000aad76805a23c91d7--

