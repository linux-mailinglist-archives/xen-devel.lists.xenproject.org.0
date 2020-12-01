Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF02CA292
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41904.75417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4gA-00068q-NK; Tue, 01 Dec 2020 12:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41904.75417; Tue, 01 Dec 2020 12:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4gA-00068R-Jj; Tue, 01 Dec 2020 12:22:46 +0000
Received: by outflank-mailman (input) for mailman id 41904;
 Tue, 01 Dec 2020 12:22:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tcj=FF=yahoo.com=hack3rcon@srs-us1.protection.inumbo.net>)
 id 1kk4g9-00068M-5X
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:22:45 +0000
Received: from sonic301-2.consmr.mail.bf2.yahoo.com (unknown [74.6.129.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a130c4cb-f803-4850-a9db-b1c7851224a6;
 Tue, 01 Dec 2020 12:22:44 +0000 (UTC)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.bf2.yahoo.com with HTTP; Tue, 1 Dec 2020 12:22:43 +0000
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
X-Inumbo-ID: a130c4cb-f803-4850-a9db-b1c7851224a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1606825363; bh=DWRgjhjkz16GuG7eOlybJFH4/1Imfx+LR0DXUu+paX4=; h=Date:From:To:Subject:References:From:Subject; b=ArZu19vMKxXZLyLbRL54yf15tBOCEz4NBtJXYSLfjRYN8MdXVfflzkZT65PK4p5//oy+5vgDz65+/tn6oTIawj0wOskiVFN7ennw3TKMnnxzNM01DrFP+SbbcH7JXIwF3WyvYDYdtfXWJ4XYIEmsPUSMdR3Y9RPEcRJ9aCTGecDMRTw7A5xnxhZe0677y0/r6XoAkbxYlrf6RiRUxV6L7Y8zGJiEFaARt1/fq87RpX9LX7AnSlqlWfpYd+DWLkbI2Ln5byhUO0JydcJ5ZDWXX1CXbBppMTUoO9yQg76wm2xBIJzYLURNPfs3N3PPTRhTlsqWNRov6qSxn6Yv5mpIEw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1606825364; bh=pSFzuPrnXNKbhKTlUP2o7hcDoJXhFDxIEfhdw3hAVg9=; h=Date:From:To:Subject:From:Subject; b=haEzfG7TG2yrmwH723BpOGZFrSeKwvim46l9q4MUkt6x9tP4OCWU9a9B04ConwvZTK/9b3A0wdUx/dHZZpP7YU+pzYQZcmWDGjnNvM6GxTpqEVsziaxycxca0FaUBuK5KX6YWwRq071wK2fJ9BdKP+6G2j4WJLIgk6VrBVxqJn989FSgxV5Hm7Va2T74NQQaPqxLuOvNnQ/0dNvpZjzSXHHB0V56Fkk3gOTII3S9kIJOrmf5MBo/pyqTpMzkAj8SYKYq2PTI6ANw5pcqqFwduh0R4eL19N9R/eHqRHk9OTGhIJvijgg/sjTl/RamV9IuYAV6hyGLnMaGhFuFvdA6FQ==
X-YMail-OSG: sC8A6mIVM1m9AC9WW1IrJioQ67wpkSSG0feCbjaios4_KqGc1AjG6Y5yTOk0TUV
 an6Kw9YcZYDc4bbnTV8H9.T4xZ.4zH1.lQVow3JXC.QgBvSEobOuf6QgnVAkuSA0I3ecIHkj7rJ7
 A4MziK9TGRs3QjxQuI0JKS3a4yPqG0kiE1E6yxyrLxlJQbKAh_nsjGmnEuoz4a9Sp0AMQhxuvZQv
 25DD.yKqLA3SiGjhPHIhz3fXzRn0ENIiF55QB6F2uzSE9Zn3DhfrK2OGz7lmUqVMlny1fQHQzjNK
 YUdqMjD1Nifp2em68YR4X4gBp8JGuApEqOaMoi0mkTrPtRDCV12qLg5UZ3GEsj7XecX9n6zo0eDS
 OJ0KBoLfy7XCHzFc.xc0euYddZI_n0d2t99UQcXWYpdacGM09s2h_TU21.jhA7HcyYMJoewT6FPa
 57699y6lEvIsnk5dySMMt2lhiNsG0mJ8HO_.0M8ekV68dBSgoJCXjlf_sUmvm9lQmmfB1ogFRCMD
 81QZIJOwpIF5Kw.igtkBp46ZWkdwfik3mXyMReWs4.hNvz.ALU7DIqzMwjhj7Vn8dszue1mijaD6
 4ARtycqwOWd0fsIOoTUHb7HwZyWcivQmVBEVbBMv.WHTwSE4P.BS9dqwPM2DhG0nC3i0m0C3Qkj_
 3bI0JtRJcr.zVQm0L_anj_MHb.qaumvz.3vNUKOgg5WJV5yhJhFW4557aaPVDMeq4wdCuBAVTQdj
 XzsjdPmEso8dyvyRC5laCT0m3dcQA9eLsFIH9_RnRnrLCSn7tQ4n308rqciJkVZLtKgxCKQPzLJ8
 t3f3r09oHLGr8YXrmdu2l4hrQuib_GD6f_sz_Mo8Q6KKZv.sViAhg60XdU8rJzVTY.w_o7sIUCfS
 Yo3VyQhbbrIafrQnywW3qyY9OoAMhyGv7Jy5wDtfcwtCoDLAtJoOdtxB_s52CklGbm4hg3VMIzVO
 NHGYESre1grmg_FcsqwuYEF_DC7Xh_.2aj3ryyfVtxfifGxPAMjyBJal.P3izeLSl9vyth2kUyGC
 vvBFHB2aQXhS7Xsl0kQVhoeH8q1glRyKyrWM.88KKg3g32kBCA42xcbyFWeXw.9kI70XevhdTa2O
 oB5CS4OyJUwPM.3alFye_Sf.FuAmycYQWsVEXoXt2qxMwLymAWdCdsOt0otSBP0UV__YJ0uRl62y
 GtJWR8brU04WZQBdQtXDhQSW9Q7sk6RZprtUfriEbgjrLNysiFlQjcL7BBHEuZnO85RMyWKC.DDD
 RnWf9KcDWyia6l1Sw_jCd1gxwoFjjPXv11hQzkMz0U5WJ8KYHa0PWVl5LV6dnJyPoaSlGcUx6DAM
 ADtRj2NljoIkMe4A8Mk6GOszgOCtn0t2E0wIYf1pa9ypa8uoRFcxLDbfEEtMnuQ0Hid8DFB6NgKc
 YlEQ7MU829jyXL3JdGtU6253Eq1WdfwX1Ogp1XN2_5U5JF53pw7by2MieN2cifxyfmvte311_Q8q
 WN3oivQlL7jUF0t1Ow2s4hOdpqu5A4fVoH9JuGHhxImpmL8SwnkvCVJexZ76d7qtioaNmXavVHP7
 WpQeK.uNbd9n4XinJgbvAq9nkwzQztW2iJt3vLv9r0a3TDCJIT8jujJ.aB9RRqJxokRJQPvVeaLb
 VFS7v7Tw6n7jDc15HAEJEk3XZTXYWhStTUB0iC31Vn3dLVqBSPNHqxjm1yVl_qhJScE5prXyB7mD
 oJqiTVu7Zo3h54iOtGybuLlSn0ySWYRI.7TkS2sS1q5HFXMu4glvZKNuONkZkpUwEC.43dXSNU0i
 XrUvWbuMSlX6b5LK30GMEO_E4k4HCZzomD4deOEQ5hYrH.Wakv.j_nJjG.eFoXxLqw6p0KBfEeFj
 kApWpvF31WJ1R7Ek76ySN9MGBBDIfADREWGoKMIlK6WYqfHbBuvkYVOqhNELrA.XUJJe86kbrLCH
 MBjxAX3pYG4dkAsthswB873WxsAHbi9yee2xv41sMoUNKTCbzJxDa.g9njgQiGw5H9M6BNyaMUZa
 mNBbDGYseu.H7gUfcBHGiTNssDkNwXo4Y8ap7lIZMGLZq.dyC7iqCYaTo4rV5N5YkFxDwygPfRHQ
 zhIZN9fgAxiDUEkHArA00H.PHkKGXSOrXVGehB3k5kQuulvI55bjWRsd9acQh4ENLR9GyR0hy6PB
 uv8cUqAq.2QZFE7kyGkLoU5Op0le8grph2KBSBiWGFQoz97cbe50m6v4AtX5q3PzozN4D.lY7mNi
 mfYtwHnLxc_hnXEtv1gjVHaDbMesjbMYbCFFCtHNSXDf4xONY1xLqs8E9CRdoghc35OtOqCls6IC
 PpMh5_W4-
Date: Tue, 1 Dec 2020 12:22:38 +0000 (UTC)
From: Jason Long <hack3rcon@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <1326147626.1969889.1606825358993@mail.yahoo.com>
Subject: Apple on Xen?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1326147626.1969889.1606825358993.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.17111 YMailNorrin Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.67 Safari/537.36

Hello,
According to this news (https://aws.amazon.com/blogs/aws/new-use-mac-instan=
ces-to-build-test-macos-ios-ipados-tvos-and-watchos-apps/), Amazon EC2=C2=
=A0can run=C2=A0macOS.
Is it OK for Xen Project too?

Thanks.=C2=A0

