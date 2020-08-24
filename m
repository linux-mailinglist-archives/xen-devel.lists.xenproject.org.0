Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7EB24FFC3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 16:25:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kADPJ-0007bv-KY; Mon, 24 Aug 2020 14:25:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vnWE=CC=gmail.com=luckybreak051779@srs-us1.protection.inumbo.net>)
 id 1kADOM-0007av-HB
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 14:24:10 +0000
X-Inumbo-ID: 75ccf6d5-f0e8-44ef-b113-02b0add9d8ca
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75ccf6d5-f0e8-44ef-b113-02b0add9d8ca;
 Mon, 24 Aug 2020 14:24:09 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w14so7728558eds.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HDLPJNqfZWGvM9mroMcIskRMb7y8ZlWvo8riKa22w60=;
 b=gf643Qm1mSaXKtJlRGMujeawgtj9JVeAY3SG8L/swZSsL69fycNAbYQb5FKmwQvlGd
 9tJlUDB87FOQEeyRpQJPWgCbB5gSReJvSciqNh5GSNAhE58FQGUG9nOtOlEVK0vxscNR
 dldwdYuZfyJbL1lUjUqxyhPfSbUwHZzjnNU25aYKgaYh7v3xaTRiM5xRv5+ixrTmObX2
 Lc1Sy8VnI6XZ9wq9z8UpeUBvlShKJMZy9n2bziWlcVx3IpfQjHCvRZrJSoFYRbTrpJyp
 3dWxgah8QFF22E1guuaqfJxMB1a+WO+/UISSooE/c/lD5XKSA+ho1WH3P47UJoS+kNhH
 0OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HDLPJNqfZWGvM9mroMcIskRMb7y8ZlWvo8riKa22w60=;
 b=JTwhyul7oPHwBcny6Y4uGHwlvBfNknNaR8l+HBCFdlEQXiS4dw2G7oIGZneXpRVKIW
 rhQnXbBwuoFF/gkNwjSIXnZKSWxlJqhCXIWLqgcMzQiN7BugYGxnnoLEtl/rPKIf33jy
 6uChaKlnD0/+3WA7LChScNpuwJ74QQpTWBqdurDMtvVguMfUAiQxd2Al5t85NpQTfu9p
 ex3W0jD2fYaeW2nqcsZVppfxj9T7NIKwa6hlRqrinTzxXM2w7NNVi+WemEzUYH/q1Are
 YFVUf4pLXlZ8C4RExZLcsWwWoFhEeRiVMzcUJmQneboW+iilVr8IIFx5htHJT0dYmal1
 B04Q==
X-Gm-Message-State: AOAM533j6lQO5dF8Rt91zokrWzamnao/Y94BsYJ0TEtH2GFQLw0t0lsK
 O8ukOWfteJynhFQaWsbMPzYQ01RZ+UNYcZUxlCVD9ilrZ57EnYlOBT6pmw==
X-Google-Smtp-Source: ABdhPJwLMbkaMij60Tt68JYEKiZrzQQxcgZMAM57yw8e00zagzrmh4y7AXEiubPbCYDVrU1CUa2eozTLd8y8uWmkS5o=
X-Received: by 2002:aa7:c2c6:: with SMTP id m6mr5749050edp.118.1598279048429; 
 Mon, 24 Aug 2020 07:24:08 -0700 (PDT)
MIME-Version: 1.0
From: luckybreak051779 <luckybreak051779@gmail.com>
Date: Mon, 24 Aug 2020 10:23:48 -0400
Message-ID: <CAN00iyXLZXkXkq2Umg8K+hyJS=-+bzLeBVcaUEWOuMe-91T4eA@mail.gmail.com>
Subject: MFN on ARM
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ef029605ada05674"
X-Mailman-Approved-At: Mon, 24 Aug 2020 14:25:08 +0000
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

--000000000000ef029605ada05674
Content-Type: text/plain; charset="UTF-8"

Xen Team:

I am running Xen 4.13.0 on a 32-bit ARM processor.  In a domU driver I use
the dma_map_single() function to obtain a DMA address.
How can I get the MFN of that DMA address from inside the domU?  I need the
MFN to be able to differentiate between
two identical domUs running the same driver code (e.g. both calling
dma_map_single() ).

Thanks,
James

--000000000000ef029605ada05674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Xen Team:<br><br>I am running Xen 4.13.0 on a 32-bit ARM p=
rocessor.=C2=A0 In a domU driver I use the dma_map_single() function to obt=
ain a DMA address.<br>How can I get the MFN of that DMA address from inside=
 the domU?=C2=A0 I need the MFN to be able to differentiate between<br>two =
identical domUs running the same driver code (e.g. both calling dma_map_sin=
gle() ).<br><br>Thanks,<br>James<br></div>

--000000000000ef029605ada05674--

