Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447433BF954
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 13:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153035.282715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SX7-0005n0-Ng; Thu, 08 Jul 2021 11:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153035.282715; Thu, 08 Jul 2021 11:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1SX7-0005jt-JY; Thu, 08 Jul 2021 11:49:33 +0000
Received: by outflank-mailman (input) for mailman id 153035;
 Thu, 08 Jul 2021 11:49:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Di/c=MA=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m1SX6-0005jn-9O
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 11:49:32 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.218])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f272eec-e939-48bc-8260-e03df5a16e34;
 Thu, 08 Jul 2021 11:49:31 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx68BnTa47
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 8 Jul 2021 13:49:29 +0200 (CEST)
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
X-Inumbo-ID: 2f272eec-e939-48bc-8260-e03df5a16e34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625744969;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=uC0DRUeikHzls3iF8+TSpWo4D0zgm/OGgytXMHohXvc=;
    b=pmUBY9BLotq1X0gtzd7g5z7IY9/j0AL72YvMRq8EHdtau9TDTPNDxYXfhVj6iN+LA1
    N5L/x8B6tPGFq53Vk2D1rS9h0Xq04BaLG9QXZQT8I3wPYpt0E8P3QOg8JL2ORmwf8Cci
    tU/1ygdR+JJKJzavWRjks/aE45B7CoIZagZfL9luTxE8qvUISA0wNqk5xLuMJesHoiwD
    bn2PkD1JtDUlTE/q0znRFX/6JZTjhFb12Vh1C2lD+s++XUSlkUlx7z3OpByVEoWG7mEi
    rbLUP4Pgs3VvX/HlzyYFp6fFHjaDwExd27EFQnBVXmZNnh4atuK92M3A9RaezXrdtjZm
    Pysg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Thu, 8 Jul 2021 13:49:08 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: collect log files in subdirectories
Message-ID: <20210708134908.2e08141d.olaf@aepfle.de>
In-Reply-To: <e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
References: <20210708065435.24515-1-olaf@aepfle.de>
	<e84e3fd4-5439-4e15-e363-35c70fa8cad9@citrix.com>
X-Mailer: Claws Mail 2021.07.08 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qtmdmqhoTFHZfoJ=ff3sx4q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qtmdmqhoTFHZfoJ=ff3sx4q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 8 Jul 2021 12:43:41 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/333797480
> is a pipeline running with this patch in place.

Thanks, apparently the logs are in place now.

My github/gitlab username is 'olafhering'.

Olaf

--Sig_/qtmdmqhoTFHZfoJ=ff3sx4q
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDm5jQACgkQ86SN7mm1
DoApJg//XLK3S12ZElKJ/O2lBuzumy4a3erF796Ft8m8z0eueFgseVYaBjHigIeq
pEjxxXTrZr/kHp5W/vZzxIpUnUx/vcgjnVVlUpLYsgPuQE573igXbKzikP+/q4lk
p0J1+Pv3YZPXCXI+oQqVWPcyBqDtGCh0MlgdkrhZ1qJcWlL/MMKbD3rRGbAdrlo7
IiCcFpNQS+wdYophPAW9dnhsjf/ID++HZh6jwL1zeG5XdsmhgupdiC0pVutuYsIV
bWS8f/q0moBjgdAXlVu/gNioc2mUCVtiA3BBIk/UncHAnWFWeQzJuZ/ujRG+duMb
ptExVUkradZrtKoEMq+v8pO56FkBAU9YICFbdpfacX2Uderb3EpH+CQC2MhG35gq
3nsz6KdTjQlHsIVZN0ELjC5xHV2288A2L++Eg3Ha7g5+UclrEn7F+XLiSk8kPlFS
QNcEmJX9phHwjt4avcP/+U5FXusePTGLPm8Pm0R5LA6Jc4wvQvHhbUAOON/zg5/A
S6xdHWcI2SawEiXhJdTDxkKVjeYozFlG5lWFQZ4RdcmuDF5buOWNRdI/Zd8hl7VK
cC0CSIzKUTOV5SrdemupL+YkDJCyyD/7IhtIUJTsJFV1rjYkjdAvwv/NKxGd5zEc
LhcZwMJATMi2PFwM27kkmM8IuBZHsDtmK8BQyUECeEkSMQ4lClI=
=S9Z2
-----END PGP SIGNATURE-----

--Sig_/qtmdmqhoTFHZfoJ=ff3sx4q--

