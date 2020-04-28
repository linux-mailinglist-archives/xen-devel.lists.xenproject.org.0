Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09A1BC49D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 18:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSns-0001Zd-Ck; Tue, 28 Apr 2020 16:09:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g9hW=6M=yahoo.com=akm2tosher@srs-us1.protection.inumbo.net>)
 id 1jTSnq-0001ZX-UJ
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 16:09:47 +0000
X-Inumbo-ID: adab919e-896a-11ea-9898-12813bfff9fa
Received: from sonic306-21.consmr.mail.ne1.yahoo.com (unknown [66.163.189.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adab919e-896a-11ea-9898-12813bfff9fa;
 Tue, 28 Apr 2020 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1588090185; bh=OAdW46J7CromgWWVcRHytxOrM8LrphxeB10hAjaElg8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=AQWUDM/XObwjc54jqMlTuW82NZVI1Kg22sEzNAogV/L6XZLOzif2nUBTxvOafACuwzZE9Lo4W3qpKi/cOIswTOM3GpoIfnMf4DzXI0NIpigLBG/5kUQqDz9EX6s6LQZDqs0GPnC+IIKWoRrpnoAPSWrP5c7wSNbF/I+YFaNYxX5StBDBCGZYzYO+hahY0LrcmnI5PI2iMGEQnvFAgavqAq7arlA7rUIa1C1gI3EmlqGy8VpLCsXndZ8gIxJMIoM4+M/uybkEdwuOBWViJAyatFe7Sne+8ARC0x60kLq6RYyjt2E5KU3JUuPaBfhODvkoOPJYEBxth6VtuCUdFzYnTg==
X-YMail-OSG: CvW6M8UVM1lbCE2JEsw6rZBOghZK.dYFcA4I4oqU2dxsGsH.RKNkVLFZjBpMyxd
 tgxtq1QMloyYXENcoP9ZzM57P0zTG4FIWvq4MOjCYuNFIOpXdHpXql_M.U3M7fxAGN2rT_15Voea
 3JRupSt4h7xOGrzp3BaBm7MqYjRx2OZm0kw4I.Hdl19OVh407yiL9mH6suvP4jpAUNIrCtKk1L4h
 CC6bxaVscNBytDlLD1BHFbxMmfcVEZ_cfSGzzBoq2Vfoa3p8WsnqNVR2gFu1TD_vD8p1FhXOk3dK
 _PgJp6hbiCveJupQPyptBsVvb5ZBdosQWda2euXom6WyOIZP0C.enQLbJbdEoJgpG5kxZfw.moU.
 KT66oCXxbtbx_mJ6thZ0fMeJpDOnEoIm61nUWMF19jTw5qMMACD1kAJsU.wTCXUGVjVgtegzRw3t
 fGplwGjNcxK47ymvp5dumBCw7AVlewED_8QOUcgeT7LlzG1BldoHG_ESxaleEbaqDaNhG8CjMqfG
 OvaOziXcSYIyHIqcnzotIAUze8P9K.IiaAfe2fK2IPPwnIo8CJa7LSPqQ_qdQ3DCtXKtDmqD1Io0
 paGiwhyYEX.xpsBZC5MRU5ZJ675aHvAyD3f2WwbD0YRw8XY27uKq5dlMuspMUJJHTGZM4FbPUNWl
 ssHCPLnARaLHvXIm3bULBYa5_gSxjKRU2MPIBv5Duz6FBu6zc76C9xvNaCL_NA3kZZw.cLZh9u2M
 l6U2MZFLNaRW5bueLiJgWwJ8jMEM0U3Sl2FVV1vz7YpTfYB3YzBJwOMnXqJYeyhpPbIz5UqBxdyK
 hOoHAgDjh1SZGrmGp8V7QGCSaUs9N3eittyNV1O9itKYMqt.4iQ0spAXVuibDe8FBmXSIFL0WWDy
 oncp2dqwGrIqpgkFlQ5QRQAmq2YLB7gzh6sTz09vU36Ta6WloHtGlJErU0vrIZMQbKS6GdXAenKf
 ZN85qhujHmI_jiIQj85kvQz_sKy81KKDtHeWwvbikzJ3TouI4MEatHfGJ4sz3jo23iFx9rXVltO1
 jNH4YWGmTp0fnWt8H.K7tCPDIfELBWydIBetfsSyA_12hS6Y91EH8Byusuv5wJV8v_tWiceS3hET
 4HJv2Ge_JNA0IffCcjsfnvo3fVpgeA7n0dNGvY2CPmYM5E58QnTAXyHJtWusC2S9wVOKc95aVKaK
 E6avTHwbE7rVjV2RKt6HzKsZiZzE.0xVxYnbFLJaK2R9A7rvuV0Q_9XiPNCZkcsZjqcod9Z0kOPy
 bRIEO6yeJB_jsZSFKGRZS2P1xY5L6cuYnrQ1iptFMFcoDsg1_wyXoc1kz4ys_Y41xgIF0yo5rfQz
 jB4tDWlJg7T3w0w04TZy6CBDvghma5UubgJYkH_ZFeQ--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Tue, 28 Apr 2020 16:09:45 +0000
Date: Tue, 28 Apr 2020 16:08:08 +0000 (UTC)
From: tosher 1 <akm2tosher@yahoo.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Message-ID: <986397088.1609373.1588090088941@mail.yahoo.com>
In-Reply-To: <20200428070724.GS28601@Air-de-Roger>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
 <20200427070317.GL28601@Air-de-Roger>
 <1693679742.27711.1588051435928@mail.yahoo.com>
 <20200428070724.GS28601@Air-de-Roger>
Subject: Re: Xen network domain performance for 10Gb NIC
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Do you get the expected performance from the driver domain when not
> using it as a backend? Ie: running the iperf benchmarks directly on
> the driver domain and not on the guest.


Yes, the bandwidth between the driver domain and the client machine is close to 10Gbits/sec.

