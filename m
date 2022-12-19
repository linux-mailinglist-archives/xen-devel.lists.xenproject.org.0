Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBE650E84
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 16:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466203.725067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Hur-0004nQ-Eo; Mon, 19 Dec 2022 15:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466203.725067; Mon, 19 Dec 2022 15:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Hur-0004kf-BZ; Mon, 19 Dec 2022 15:18:57 +0000
Received: by outflank-mailman (input) for mailman id 466203;
 Mon, 19 Dec 2022 15:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KaZ1=4R=alefbet.net=tristan.israel@srs-se1.protection.inumbo.net>)
 id 1p7HnO-0004cH-3R
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 15:11:14 +0000
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c4f36e0-7faf-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 16:11:06 +0100 (CET)
Received: (Authenticated sender: tristan@tibsys.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 54F58FF809
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 15:11:04 +0000 (UTC)
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
X-Inumbo-ID: 5c4f36e0-7faf-11ed-8fd4-01056ac49cbb
From: tristan.israel@alefbet.net
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AF449565-4DF7-487C-B595-E33F950136CB"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Using 9P between domains
Message-Id: <04E47D37-6F76-4371-A5E2-E29633143865@alefbet.net>
Date: Mon, 19 Dec 2022 16:10:54 +0100
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3731.200.110.1.12)


--Apple-Mail=_AF449565-4DF7-487C-B595-E33F950136CB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Good morning,

I=E2=80=99m trying to configure 2 domains : =C2=AB front =C2=BB and =C2=AB=
 back =C2=BB. The =C2=AB back =C2=BB contains a filesystem which I want =
to
partially share with the =C2=AB front =C2=BB.

The =C2=AB front =C2=BB and =C2=AB back =C2=BB are PV under Debian 11.

I am using the following configuration in the front :=20
p9 =3D [ =E2=80=99tag=3Dtest,security_model=3Dnone,path=3D/var/lib,backend=
=3Dback=E2=80=99 ]

When I am on the =C2=AB front =C2=BB I do the following :
# modprobe 9pnet_xen

I get the following error in dmesg : "9pfs: probe of 9pfs-0 failed with =
error -2"

Can someone help me with the configuration of this? Is there any web =
page which can *really* help?

Thank you!


--Apple-Mail=_AF449565-4DF7-487C-B595-E33F950136CB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div>Good =
morning,</div><div><br></div><div>I=E2=80=99m trying to configure 2 =
domains : =C2=AB&nbsp;front&nbsp;=C2=BB and =C2=AB&nbsp;back&nbsp;=C2=BB. =
The =C2=AB&nbsp;back&nbsp;=C2=BB contains a filesystem which I want =
to</div><div>partially share with the =
=C2=AB&nbsp;front&nbsp;=C2=BB.</div><div><br></div><div>The =
=C2=AB&nbsp;front&nbsp;=C2=BB and =C2=AB&nbsp;back&nbsp;=C2=BB are PV =
under Debian 11.</div><div><br></div><div>I am using the following =
configuration in the front :&nbsp;</div><div>p9 =3D [ =
=E2=80=99tag=3Dtest,security_model=3Dnone,path=3D/var/lib,backend=3Dback=E2=
=80=99 ]</div><div><br></div><div>When I am on the =C2=AB&nbsp;front&nbsp;=
=C2=BB I do the following :</div><div># modprobe =
9pnet_xen</div><div><br></div><div>I get the following error in dmesg : =
"9pfs: probe of 9pfs-0 failed with error =
-2"</div><div><br></div><div>Can someone help me with the configuration =
of this? Is there any web page which can *really* =
help?</div><div><br></div><div>Thank you!</div><div><div><br></div>
</div>
</body></html>=

--Apple-Mail=_AF449565-4DF7-487C-B595-E33F950136CB--

