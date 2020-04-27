Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8C21BADE0
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 21:29:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT9Q8-00040A-AI; Mon, 27 Apr 2020 19:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXlK=6L=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1jT9Q6-0003zr-Ir
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 19:27:58 +0000
X-Inumbo-ID: 32d102cc-88bd-11ea-ae69-bc764e2007e4
Received: from sonic315-21.consmr.mail.ne1.yahoo.com (unknown [66.163.190.147])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32d102cc-88bd-11ea-ae69-bc764e2007e4;
 Mon, 27 Apr 2020 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1588015676; bh=IYkeoNs4JtRYr21msPhC3mQ4YJ5CNxllenBLvvqmKrw=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=OI7QZYg4/Pd73OzFnI5VWU+arixdVmVA1K9W73fW6ABoohSJ3A5edrEzTogHMeS+H1HVnfDcQm8TjABv69VaDIfM40jlCO8IhoG/FidPhi2nXcJkzWRp+gd7ZC/UWwl5VYby4eVzwuLyO45y+l5Pm/q6ForVE75411lQF7XHApTSYHV1kFcJhct1ZzcgagQzw/3DiHfM3+qf5qG23spbZ/izVuJSYIsenlnycDfmg6kY7zdf+nDcZvJ2nkdba/XRw7L1ZWY2LYXaokqPm2DChUOLn5gImVdwgg603GYXVnrzHbNoswUEAOy5GhsDp3uMXWpaZPoo/u6BPTCLxzg4yA==
X-YMail-OSG: QbapiF4VM1keGjavqEbRJMb6b9nlrnIxpIY3nBzFoRCeUvzz_QIMlJjPqLmgBjU
 ME6_5Z0jlP85h0GFRuPc.CBoQB0mMDdzKvgwYuvfelLmlQlvMRl_Pj7VeBbarAHErpsK.sTQjHUY
 x5wnIeQ8O2Yn8Y7i26DylMOHvRQC04e3cPzOKD.herWKPuR0KgPYGOl7j.VAliMgdMT3Zuxu95F_
 R.6aHSwxxkq4xgt5dd8MthKHl5ZiAMNtyKJOm9FMs3_UtGTHJAwPpZLtxak3Le3RrL.sz6bWOUQ2
 5sFabgTnhi3YxGfuaJ2W529k62Uq9gR6N3w1FUPKzZa1LjNruVID6TvDI_bwqSbBqd8NnJl5hZEa
 lx27ndLA8sWn798TtvNBHlMZxFarT.yNIJSygma7qsc5PnHsy0kbJYbKY5StCpsfAzT71BgYUltS
 Vab0uwogSqywRsFulsN9UBegJQzBfrn3PJ1W4DV0HyHj3zAhC57xI.JPncorf0ljFPJdEH4QtlrU
 a6ELaO7pOG_1nrW9SI_JHbAXlGFqqMKM2XcKjySNIwxqG4lhm4ChiS9yPeSzo_It_ybUKGaFdHPH
 StJKC3HwWn_bHFmwHKuRNQdIEIO06mArsIPKHsziwPsqZi2Gpse7pxal9.43lpIpaQIthiPY0y0A
 3yAQs5foqXVLYV4Lyg97I8sc8KVsFCq8MAJaOFMgIaHKYdT7nQmTvnBHyhzFK85e1Ir5lGttyNsO
 QaTPSuPahhdizCAjCdwqqtxJa13nf.k4GpqEN84XTHkp8xy7ixYP6xgQwoXVNd.IWsJ_T6OyILXw
 uZotscnGJw6em7YwpfIOTUTMJCuk9E2PZpt4iFPnMws.xmmHiMyxHHd0X.ZZvcni6Gz5vtxCyIPK
 S4m0xD54Fm2gBLggsQTHgCQAlb1R1z73hvDH_wEkZFbQEJXBmym0GS68LNrhRu1TQbnhj2ZWVzoL
 qZAVDhQu.fClrKWEGlCXjZvxroZ0RoFjbQS.uKP7_cYUw0Cp_7u0TYHLm4aQTBJYNcF9yJPJuW4L
 DlfkMhhX4sG1d3zMSu99kkAMi6hblWAVDM3NuCrQjo.kY6BHbnhrmzgPZvUMfeVXS.kOOfJvm1iz
 BTA6oE3qczr.2D0BmWK0Zfvy9jCVE2IK4jAiqlHdUBVfS3eAlDEK1DvJKVSvdp.JU9uvaGB_C5t.
 Iv4xHRJUhmiyK7FwGmyfFqb01h88Q1aZHRyFiDu6KQ.HrnijYO9GojC631l9oqIxnfSS2Yf19pLC
 4LWrbTk7XuVcGibmobplP05Uded2h8jvV8OrTxZOPkq8JzRDkxFjWgklJL7P7TCup0U7df1ORxLt
 0oL7vTdLUdcs3pW_PVVbHayKChGqJK0ir
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Mon, 27 Apr 2020 19:27:56 +0000
Date: Mon, 27 Apr 2020 19:27:55 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, 
 =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
Message-ID: <738028694.1121290.1588015675832@mail.yahoo.com>
In-Reply-To: <a06fdec5-9e9e-2319-e7f7-d68fdb48ffba@suse.com>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
 <a06fdec5-9e9e-2319-e7f7-d68fdb48ffba@suse.com>
Subject: Re: Xen network domain performance for 10Gb NIC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64; rv:75.0) Gecko/20100101 Firefox/75.0
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

The driver domain is HVM. Both the driver domain and=20






On Monday, April 27, 2020, 1:28:13 AM EDT, J=C3=BCrgen Gro=C3=9F <jgross@su=
se.com> wrote:=20




> Is the driver domain PV or HVM?

The driver domain is HVM.

> How many vcpus do dom0, the driver domain and the guest have?

Dom0 has 12 vcpus, pinned. Both the driver domain and the guest have 4 vcpu=
s, pinned as well.


Juergen

