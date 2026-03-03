Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI6mMQn3pmmgawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:58:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7911F1E4D
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 15:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244866.1544225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRCE-0007x9-Mz; Tue, 03 Mar 2026 14:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244866.1544225; Tue, 03 Mar 2026 14:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxRCE-0007vi-Jo; Tue, 03 Mar 2026 14:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1244866;
 Tue, 03 Mar 2026 14:58:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wwL6=BD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vxRCD-0007vb-BB
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 14:58:01 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e77f4cd-1711-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 15:57:59 +0100 (CET)
Received: from DB9PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:10:1da::9)
 by VI1PR08MB10005.eurprd08.prod.outlook.com (2603:10a6:800:1bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:57:54 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::56) by DB9PR05CA0004.outlook.office365.com
 (2603:10a6:10:1da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Tue,
 3 Mar 2026 14:57:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Tue, 3 Mar 2026 14:57:52 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17)
 by AM8PR08MB5554.eurprd08.prod.outlook.com (2603:10a6:20b:1c5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 14:56:50 +0000
Received: from DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b]) by DBAPR08MB5590.eurprd08.prod.outlook.com
 ([fe80::f68e:1311:9070:68b%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 14:56:50 +0000
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
X-Inumbo-ID: 5e77f4cd-1711-11f1-b164-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QUadyBHxJzuQnJiBDFzuoTvJrwMR6HoAu3yLR3UZdiCCAvIL9vIWZOUf3Nw2Fm2qxde5QTy4O3cBQK820JY05yzmzgpQwzvXZyON+iMgxkk68/PfE0szIxJzNnn7zxPNvbpsFS5kE+Fr0YcviO4hpWRNM9aDMhW+5Tk9Gwgui7nwiTq0cgVkg31f5FWcVlFmtBxP7x+0ohrBaOn9lgx8lmCHGTqJrY9pV/wMHBPVvg8vcLemG+Eq+b7tEd4ZpZxHzziYVlrlzR9vC8YRkX17Hfnm/W8Ed3IgROjLtE09ns7F1CgPIoM+05q299UP/s+FS3lOwavbTLcN8YJBjT1GPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZJ6unCO6hnV4jRvbsZ0yfL6SFJrbINWnvnbn3XZ/9k=;
 b=F1zyermFNIMaEh3DaCRY9DXshqLXO3t+OiQPH6DunBo4CIEsyttLX8OnffVq5/phyGBcvFRHCsoOW1h/9rQ4141ZUwQnTeXZ7Od6tw8L3fX34LjhozSYqPUYYyItkYuC8+cnUnOzL+uHGS04rQidFElSmEAyCv8EpBuHDYeuVzhux6cqabH2i8dKlVmOOGG/aGgDRZ8QJUWw/zUlGvEy0X4gIhYeJxOdoaoy2VplOZnJ+1k6EZrxcteA8UN88d++KEZvrr/WbmNz1uHwcT5D2lwnqoc35UxopK6DGj+s+RgWi/C0mKYTV7fimR9fvLpSnrjsOp8kD00gkkOtpnYhWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZJ6unCO6hnV4jRvbsZ0yfL6SFJrbINWnvnbn3XZ/9k=;
 b=bFUIpUVvipYOrzvUPOfYgLbaGLT995dfi7MX+NEJhDmi9sMP0hg5IXu4tapAF8ZEJxTNy0tImJjWpeN4oCT1YCR0rBz9F2Moc858ILAUhuldEj+RGh/FYoAkYnnvxtYb8WuOKb0cJ6cdpNUYeJ0B/2DuJX3HBN8bVaWLSZkGE5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR+ghtcmeVNLUajld7A4uQ6DlxuVrhFVhy+wGUMgpEzGyusYe07BKZu7N2E5F3PzEaKC+by1zaFHRZHe3CfeNGKp8pz8jeuM4/zr5AVF8FTK3SMEnYF3nAi49YW8vkgtzENT8TJzoSh2JprXn9hSiowb7BQWYDPaB78mbmFfrq0XGcopfxfSYpSVqwnpEvN+TUpzXMbEzftqWbbqRC61FlvV24IXcnurN13Nx3ZN6sC2Qb2r3P6WaT1jFHUdyH6K6aRBc3w1m9s1Ve4Q1kKkFUOFx34WAguVQqIen3v0qbVP7EgewBFhD5AaXMvqFLo2UN/r15u1uFPHw5KYyt3p9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZJ6unCO6hnV4jRvbsZ0yfL6SFJrbINWnvnbn3XZ/9k=;
 b=VMClxGhBoX2uecS0Zg+OsC00Hz4eilpHmQl107OKH0TXX4FKXJ9IzQHy5I/ttd+f9AdrFdDljY3Urj8gJiWrD4zipf3uSwvM6omrD9BGZIiNNOqaRJWAMVNqckHBJ+d5St7ZiEntZaJUwXc6BSJQdcBJsnhjVB490TyAnB3X39dnIgMqGbSEoHycMhg5oKHtaqauYE+tPNgs4B+JJ06Jm1nePeTvc0TjroWr4ho5ytJyb1uGtw1SPEO6F1kMN6f1Y6BC8b6wZ6iPnUZNND2e4lNTYBP1Mv+/wqCKjylD3cJmUUkT+kAMT2QWKEVtAkPMRq7d5kK7ZPPAxQtsnbAwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZJ6unCO6hnV4jRvbsZ0yfL6SFJrbINWnvnbn3XZ/9k=;
 b=bFUIpUVvipYOrzvUPOfYgLbaGLT995dfi7MX+NEJhDmi9sMP0hg5IXu4tapAF8ZEJxTNy0tImJjWpeN4oCT1YCR0rBz9F2Moc858ILAUhuldEj+RGh/FYoAkYnnvxtYb8WuOKb0cJ6cdpNUYeJ0B/2DuJX3HBN8bVaWLSZkGE5A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Romain
 Caritey <Romain.Caritey@microchip.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH v6 05/14] xen/time: move ticks<->ns helpers to common code
Thread-Topic: [PATCH v6 05/14] xen/time: move ticks<->ns helpers to common
 code
Thread-Index: AQHcpxZBc3YdHjKklE6Q6qyeWG5VUrWc7bSA
Date: Tue, 3 Mar 2026 14:56:50 +0000
Message-ID: <2AE980D3-571A-4AB9-A01B-EAA90D3EA0B9@arm.com>
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <545c2af877d519b1186c79fd6108d33e7e52cd3b.1772016457.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <545c2af877d519b1186c79fd6108d33e7e52cd3b.1772016457.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5590:EE_|AM8PR08MB5554:EE_|DB1PEPF000509E5:EE_|VI1PR08MB10005:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0edb1d-175c-4498-06e9-08de79353efc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 3bqowzC5bgtDxXfAxvbi98OnbXlZG7j5dMvHXCRH04JHs3Q6NFI7JoEcLytNvsrW7QTyWcEh6TmQCcWvqyeny421A34uqWinchij+rmPqKIuJuBfpqn/Mq+JxRU0u3Mx1JBUxBYTAiZUH7TnUKn97GZEFC+YmB0EKiSfeZzap2/W/QQSa/UpoWHR1OTXCm8xIbFKvDjYQoTMv29uOUanCHEqVfoMdh9xTk+xKfUJS/C+nIu2KJfEFA8Kqs4QFDBOo1JECYunplsZmtQLIV9bla+MliQM0QffFBZS7MpOfIXrV8NMOMPAHvDVCCDp6qxZJy6l7k3PLHj7OgUXbTkQhTPeaZBDSokHCX+zWuNXammm+TJFiXO66KQhVdDfJNzNW9lXR7mqtE0KmL76Ki5oGG7Q8SbBneVTh19DCIvMV8HvGJxBjDxSAV0fNAcb2xzSqyCXHBjnN4QPi5a1kLKxKAYli+0ablu+hDSc7/5eeafjomxRdjayw9MVFGaTsw4xUQxdZc3tjxvtzbjwGm+IYa45p2hbLRTqWhxdONH+/Gzh0nslvndbeOeG1tOsk/O3r8fNduSWh2v67M4qOb7TRfpM7sQ7hWrq/YfmKdIlrd0tIW/tWr/aED5fFF4idCicwHyRH08l33S825vkR62oswzSUr59fDVe/S3IPef6oMAxOdgAcKl//HWmAuMmyguqC6W+tieEbTiKrIWaAZsowVzeBE6jUSfS3I9FKAXdEo+J/FiW1SEHwx8l8zp2FGYa8GZF0sWrJfvwWYmhJU7Y0a7p7CMADPmlUdiSPwxqWJ8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5590.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D3318D397BBF154DA1554BBB66DBC85D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5554
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34dde7f7-89b7-4957-5e7a-08de793519a6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|35042699022|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	oLbUm7AagHDRimb8k3+GMK2IgwRxnKCzZuTbRLKhcZcpkOZkAGf0Dy2soArGxC/xzMVUhqh3qtFlHUeS+QqK+/YnEGN1j9oMpq/Ia2/AFVhvkUNiZ+2iKs6BpTWcjyi2h4J7P1ObvLbXCVczphYPDVGCVd6m2clmuN0ZeErzr+CU+iA7BbWREB/QSRqgtDI0IPS7Q5H0ocScm8pcU1i+vTqaTtQN7ChquiwXPOjt2Ptj1w9vJpxPFw5lgJx+IUKhwNHVyqHw+WwKja9ZRL3iD01ZsW/0H3uQM4HpWdH4JqpxQSgv8jXridvNFEY7mmK+lfHQVYs1j6XO3QxVeKiQyHequdwn+HqLh2nzJza8u5faYCe9MGHQlnMkvdHhjnxbNjpou0dPU6j0Tb+dYerpGQiWX1dUlOPPPOxLorqTtNkH374L/H6Nn8IAf54GyFxF1xe+NoJ+BP2YXLS4KqhWhFQTM0yz9NVnvpukDJtLEzmjreRH16q930Lw7fChEiVGpmwhwEJ4FRYCuzl+u5Sz+NyZ68ExaHuxv96Hr71jZDZ8DilpKwnzPwnDjVmA4qEprClmy+AFaw4vCLRf3fvg2ndYjo/mR0ekHHZc+YHUzZ0Buap208c0swSjBeGnJIU9HePisY+QX7cxdjy/iPPvrnyfZ6D/lOtFrK3e558F7gh/gFEr66GJtdvOS8NqQtlzvnyGsViqtdvoW+Lq611MtYEswX2pJG3H8BuXGYygUa7FOSPUfGSxLBG6uMUiAjmNQm9XAKxJpDni9AyIxraPdM1nXE2mjIIR2f+qwb9P9jVJ4F9zABnf5UqDw/tNSwUzoYbej9O5jwPuQZzF8XSSzw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(35042699022)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HeEW6N71CBkJ0SIQw5TJn3vGpdvm+ndQShWocCAyngjqkHPal2hTdAiVkhBmgcvq0btzfHFgo3DXF1H0z1mFmp4ac+jvNje+Z7BBu0nQKQLYxlCwuGkcn1wvnTzJMzFzt1eZkzyWufC755DokasWOdIPGqQeclG82JUx63RoKiGxYvl5In/69Tb1c49ghMLcw7MG3ohbu9UkbEzCc+WCauY/n1iLV6SLmuZIRHV99gUotGumgFX8gMdgZCDurSZHlqV2eOXF8v2nipRH9GDhDx6ggOvHqWdbQYammsNiS09oq9fvd7AG7Wn9B6HIbOFMy/i0BBw2hJGiBMG105m6XD+f57hRq9KVezpH6nKZhshiJZ+F50AUxSYjCcKgWTCNhZ0wLO0uN6YGW+nrDwQ2V49fbHCAeMV6tB2YS5g+uMvoIFW5wULOhEE1NpPzTKjP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 14:57:52.8962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0edb1d-175c-4498-06e9-08de79353efc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10005
X-Rspamd-Queue-Id: 1B7911F1E4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,amd.com,epam.com,citrix.com,vates.tech,suse.com,wdc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

Hi Oleksii

> On 26 Feb 2026, at 12:51, Oleksii Kurochko <oleksii.kurochko@gmail.com> w=
rote:
>=20
> ticks_to_ns() and ns_to_ticks() are not architecture-specific, so provide=
 a
> common implementation that is more resilient to overflow than the histori=
cal
> Arm version. This is not a practical issue for Arm, as the latest ARM ARM
> that timer frequency should be fixed at 1 GHz and older platforms used mu=
ch
> lower rates, which is shy of 32-bit overflow. As the helpers are declared
> as static inline, they should not affect x86, which does not use them.
>=20
> On Arm, these helpers were historically implemented as out-of-line functi=
ons
> because the counter frequency was originally defined as static and unavai=
lable
> to headers [1]. Later changes [2] removed this restriction, but the helpe=
rs
> remained unchanged. Now they can be implemented as static inline without =
any
> issues.
>=20
> Centralising the helpers avoids duplication and removes subtle difference=
s
> between architectures while keeping the implementation simple.
>=20
> Drop redundant <asm/time.h> includes where <xen/time.h> already pulls it =
in.
>=20
> No functional change is intended.
>=20
> [1] ddee56dc2994 arm: driver for the generic timer for ARMv7
> [2] 096578b4e489 xen: move XEN_SYSCTL_physinfo, XEN_SYSCTL_numainfo and
>                      XEN_SYSCTL_topologyinfo to common code
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Computation is changing a bit from MS to S removing the 1000 factor on arm
but i do not think this would have an impact so:

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v4-v6:
> - Nothing changed. Only rebase.
> ---
> Changes in v3:
> - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
> ---
> Changes in v2:
> - Move ns_to_ticks() and ticks_to_ns() to common code.
> ---
> xen/arch/arm/include/asm/time.h   |  3 ---
> xen/arch/arm/time.c               | 11 -----------
> xen/arch/arm/vtimer.c             |  2 +-
> xen/arch/riscv/include/asm/time.h |  5 -----
> xen/arch/riscv/time.c             |  1 +
> xen/include/xen/time.h            | 11 +++++++++++
> 6 files changed, 13 insertions(+), 20 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/t=
ime.h
> index 49ad8c1a6d47..c194dbb9f52d 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -101,9 +101,6 @@ extern void init_timer_interrupt(void);
> /* Counter value at boot time */
> extern uint64_t boot_count;
>=20
> -extern s_time_t ticks_to_ns(uint64_t ticks);
> -extern uint64_t ns_to_ticks(s_time_t ns);
> -
> void preinit_xen_time(void);
>=20
> void force_update_vcpu_system_time(struct vcpu *v);
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index cc3fcf47b66a..a12912a106a0 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -27,7 +27,6 @@
> #include <asm/cpufeature.h>
> #include <asm/platform.h>
> #include <asm/system.h>
> -#include <asm/time.h>
> #include <asm/vgic.h>
>=20
> uint64_t __read_mostly boot_count;
> @@ -47,16 +46,6 @@ unsigned int timer_get_irq(enum timer_ppi ppi)
>     return timer_irq[ppi];
> }
>=20
> -/*static inline*/ s_time_t ticks_to_ns(uint64_t ticks)
> -{
> -    return muldiv64(ticks, SECONDS(1), 1000 * cpu_khz);
> -}
> -
> -/*static inline*/ uint64_t ns_to_ticks(s_time_t ns)
> -{
> -    return muldiv64(ns, 1000 * cpu_khz, SECONDS(1));
> -}
> -
> static __initdata struct dt_device_node *timer;
>=20
> #ifdef CONFIG_ACPI
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index d2124b175521..2e85ff2b6e62 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -12,13 +12,13 @@
> #include <xen/lib.h>
> #include <xen/perfc.h>
> #include <xen/sched.h>
> +#include <xen/time.h>
> #include <xen/timer.h>
>=20
> #include <asm/cpregs.h>
> #include <asm/div64.h>
> #include <asm/irq.h>
> #include <asm/regs.h>
> -#include <asm/time.h>
> #include <asm/vgic.h>
> #include <asm/vreg.h>
> #include <asm/vtimer.h>
> diff --git a/xen/arch/riscv/include/asm/time.h b/xen/arch/riscv/include/a=
sm/time.h
> index 1e7801e2ea0e..be3875b9984e 100644
> --- a/xen/arch/riscv/include/asm/time.h
> +++ b/xen/arch/riscv/include/asm/time.h
> @@ -24,11 +24,6 @@ static inline cycles_t get_cycles(void)
>     return csr_read(CSR_TIME);
> }
>=20
> -static inline s_time_t ticks_to_ns(uint64_t ticks)
> -{
> -    return muldiv64(ticks, MILLISECS(1), cpu_khz);
> -}
> -
> void preinit_xen_time(void);
>=20
> #endif /* ASM__RISCV__TIME_H */
> diff --git a/xen/arch/riscv/time.c b/xen/arch/riscv/time.c
> index e962f8518d78..2c7af0a5d63b 100644
> --- a/xen/arch/riscv/time.c
> +++ b/xen/arch/riscv/time.c
> @@ -4,6 +4,7 @@
> #include <xen/init.h>
> #include <xen/lib.h>
> #include <xen/sections.h>
> +#include <xen/time.h>
> #include <xen/types.h>
>=20
> unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
> diff --git a/xen/include/xen/time.h b/xen/include/xen/time.h
> index fe0d7a578a99..2185dd26a439 100644
> --- a/xen/include/xen/time.h
> +++ b/xen/include/xen/time.h
> @@ -8,6 +8,7 @@
> #ifndef __XEN_TIME_H__
> #define __XEN_TIME_H__
>=20
> +#include <xen/muldiv64.h>
> #include <xen/types.h>
> #include <public/xen.h>
>=20
> @@ -75,6 +76,16 @@ extern void send_timer_event(struct vcpu *v);
>=20
> void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds=
);
>=20
> +static inline s_time_t ticks_to_ns(uint64_t ticks)
> +{
> +    return muldiv64(ticks, MILLISECS(1), cpu_khz);
> +}
> +
> +static inline uint64_t ns_to_ticks(s_time_t ns)
> +{
> +    return muldiv64(ns, cpu_khz, MILLISECS(1));
> +}
> +
> #include <asm/time.h>
>=20
> #endif /* __XEN_TIME_H__ */
> --=20
> 2.53.0
>=20


