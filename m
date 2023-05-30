Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505707157C2
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 09:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540757.842713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uG8-0007i6-1K; Tue, 30 May 2023 07:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540757.842713; Tue, 30 May 2023 07:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3uG7-0007fJ-Uv; Tue, 30 May 2023 07:59:11 +0000
Received: by outflank-mailman (input) for mailman id 540757;
 Tue, 30 May 2023 07:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IZK1=BT=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q3uG6-0007fD-Fl
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 07:59:10 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da9028b2-febf-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 09:59:08 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4U7x7GWG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 30 May 2023 09:59:07 +0200 (CEST)
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
X-Inumbo-ID: da9028b2-febf-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1685433547; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Uk3c7AFdFuaLjxlaw1li65Z5pN+m1Vxmd75qBMXxEcGu3Ni6SJFUyzeN5i0OPaDcNG
    dD7ykNkenSFcz2jDBzLENQNfBxWgjc0P1E35cYnviS+41zc8l7SK+/AbWkNUw10d9Q8g
    UJTtgr9VZsKk+prRnJaQADqbcPclpqmLwUSa7tJaGgLQEBQ9A1xYvhvlqHIRkzjF173P
    eB1zVaINdLHXUvyYj6ITVuKK/xObmph+zDaw2geK6lGqSQ7UPfxm3aAY2lcaoMhv2Qte
    4HUtlKfi6TpRy11rb0AgE03g9pfrKLNnIWIZRyA0QCHHMnoNqvi/s+xr5taJXUOBeXFN
    9pBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1685433547;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=48SLYBKwuJ1qGErn4ucN0izxxjzjGz4onuRxZLQh++Q=;
    b=TuaDSn6oj3ELd7ichlbzvvscVHYrJ4f5qISLA47HHrb9kk6WlCbmiUUDii9YyGoQI/
    54TI5xiF8pdUetPo9zlH0JyR40ZXnY+mNGaEMSIbyoC2lopGaPiBI+BKGfy8k6TWA7OT
    zHRRQvTqa0lgZfX1XudYwQO4S8eRSe1CZii56NyOU780asNMxs+coplraLzHjW9G1VBI
    BwT980FsXdDDpGZJAlTy8zdJyrDB0THLP4GD6SCGZK9mPnIX3xM5G/iiviq+sD7a5IUy
    GE/wcqN9fkxZL062WZAdgbx5vBdYpA05PyBRo4RtkzCjZYE53VAKZ+/biNBHyIySbUfr
    Ho1g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1685433547;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=48SLYBKwuJ1qGErn4ucN0izxxjzjGz4onuRxZLQh++Q=;
    b=jT9fu7IXF/5joZsUYE3mP2qGyC6E/dhNlaZywRIfuUAwMn7dzBrKAa0oWbJjIet89h
    QbzEM+YoK8tE9RxiovorD8r1GeYHK7eNTmfKeFZ33Z4vzik7qpOSFNLAyHtFO535LRk2
    McHhrEy4yQgcCdz8n5V2feFa2TVpRs7ix2twIGdXka90dyrC8m5zlGiCj0SYhDIi0UTY
    6pQocUp18+RGHIJKT4dKAqOn0Uv9NuxaHdmsJNCC/Gv/eROwq2qfmXliQmr3jAN62HiB
    MZFfuqB+y97WZ+ZcDFO5Y0eqRVMuc6OQWMtm4YL1qxY1tCAGqb9KvIr8PvOX25Nx4OXy
    sQiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1685433547;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=48SLYBKwuJ1qGErn4ucN0izxxjzjGz4onuRxZLQh++Q=;
    b=LGD7cf3bTg2myJCohY8ag/XPFtZg4vhuuQ4YhpW9WwtYYNfG/+P3d6JDG2ql3P9HzA
    IvOLRdlhkH+N89X5HoBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4BhOIaRvsld/sN75OpaIeOWAiVTRkMz6wPlUdSg=="
Date: Tue, 30 May 2023 09:58:59 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230530095859.60a3e4ea.olaf@aepfle.de>
X-Mailer: Claws Mail 20230504T161344.b05adb60 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NA6tvDi3aD7wV1LPUj6STap";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/NA6tvDi3aD7wV1LPUj6STap
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

While looking again through calculate_tbuf_size after a very long time,
I was wondering why the code uses nr_cpu_ids instead of num_online_cpus.
In case Xen was booted with maxcpus=3DN, would it be safe to use N as
upper limit? I think this would increase the per-cpu buffer size for
each active pcpu, and as a result more events could be captured.


Olaf

--Sig_/NA6tvDi3aD7wV1LPUj6STap
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmR1rMMACgkQ86SN7mm1
DoDPxxAAnruClTu+L1qd6H0ttk3cIGjTuql6iBT8Y6iQcPWPFqTzh1XlwhpicnPa
wzQZjTMPG3XRYc/Lamr9xL/4M/kjg00AN7xrjhuh1InZi1bRh7jI9r2t9vTSGjyB
TBPOXVoVoI8Jn6e6f5yr9boYW5YtpMcHujUAcAv8YDzL6FfgHmKbA+Gm9wV3LfVk
2wRomrViYBZuOPytQk/ln2SwG21KH+Lyjk7iSGcSXUHONKuGw0gD+LKF7c5rpV22
vrC348ohcGMoAVJA90DPvn4AoCy+rZ9dZ4rQJ+uy9g1PV7j4bopqd7b9nsJPcHym
3SCgTs0+1oReM3GuZIHf9rifrJlpW+RLysThjoFidkmqAAS0nFRIy2YlOOJYsmNg
Q0pj/i6Sxrr/bH+BRzus2ebtbW6SUk5cT6Rhx+3k0P8uS9ybxn7txmRd9PDunWSi
NAEaz2SxFmvTwfH1fbk4I7v9mPaO8Mp1Mj4uh1hoV9p/Po4U1FGcAD6vtnDoZ0A+
kBQsJmznqmykrYKXT1sbxTUCx/oqZzHa8KnrcP/E+tXJVreUfFzGk6EYXoJeac5e
aPwPR80hTMrvcaW+VK/h//Xtmkdg5Mof89Rd5UB5IanvLvrLXgDt29y8lgGzkjiW
IPZhov9+9iWG9Svudqc9djdIDcynTH00bUbjt5VbcmT31TYjCfE=
=cKim
-----END PGP SIGNATURE-----

--Sig_/NA6tvDi3aD7wV1LPUj6STap--

