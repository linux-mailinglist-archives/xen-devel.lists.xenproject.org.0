Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI4vEH0c72lk6wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:21:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751EB46EF82
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 10:21:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294691.1571382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHCa-0008Ix-20; Mon, 27 Apr 2026 08:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294691.1571382; Mon, 27 Apr 2026 08:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHCZ-0008Ft-SM; Mon, 27 Apr 2026 08:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1294691;
 Mon, 27 Apr 2026 08:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wHHCY-0008Fm-By
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHHCX-007bnY-74
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:20:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69ef1c44-bab6-0a2a0a5309dd-0a2a4502cec0-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:20:20 +0200
Received: from [40.107.159.15]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69ef1c44-af86-0a2a45020019-286b9f0f56fe-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:20:20 +0200
Received: from AS4P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::11)
 by FRZPR08MB11925.eurprd08.prod.outlook.com (2603:10a6:d10:1ca::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:20:16 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::17) by AS4P191CA0016.outlook.office365.com
 (2603:10a6:20b:5d9::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 08:20:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Mon, 27 Apr 2026 08:20:16 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB3PR08MB8938.eurprd08.prod.outlook.com (2603:10a6:10:43f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 08:19:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Mon, 27 Apr 2026
 08:19:11 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ET8rgDXXvf0/qN4Gc+VN3bwtwHxqBwM+p8IF6RWVH1m7nvYKBrCdSvkCbAiEg3JWiew5AuJdyyKB5sZPxAbtZsFOFXwgYD8tIeExBoc8nZZe0Nhb4Sv2pFa5WZHTlF+pfr0WKeQTj0KoAYo0KgtjKwPMo6vP5hMgioMHj6IxfqoW/BGGl4rUhO7M9Ny1DY38g/cGAxittqVezSFu+c8zU3pExWvBt8DYwY1DgGK5rZcwFlM0wkPIOOI8yF5Gt5D47QCSewNHjBvRgvI5z3T9axBIaJN+Acvfbp8ijBzkQpZuiVgZsbrbWfmin8/gZtC6poAmHdsSp7i4OWK1US/I7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFXEgwJbXYOgjdf8Mo6Sab4nd2d9bIKymYBPd6sxkRQ=;
 b=pbSjodl+SQeuY/bymobrKVpxMI0Imy41oJh7YtEPsXC3Ztx/aXPm55OrsPzU9Qox83st67yT6jnPuvEOv1Bj+f3hMW1eaxMvHSAjrfKTJXMiLMyzDthCLOCiH7QUxoo1XsMHNCvjsfaIR2gHEcrlkcvkCAKCoZ0rc+7t3leOvOGsEXJ7dPZS2YjwGKZ0rlhYewT1WepVPzA49WixjEBKBXT7dv7/5zruHEvzwt4qhscArtUubgkHmzi/2uEd+EHyJcBIy7VsvHjFBBzZHF2TdfzBAl6U5W32Xk1HkyPE/xwVtN7nV6eAtDNVuyDV+lZIsFpV/whQiBffvY5znA5ZIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFXEgwJbXYOgjdf8Mo6Sab4nd2d9bIKymYBPd6sxkRQ=;
 b=CFeSTZjIYMEm38gO/TNk6Ao7VpSQ6begIZikECvxeMTBS2X8aLUPZnJYk+6sm5Nkycpwlr/SYK1mRyTbzTrDMSSkTBvFq6HeVDIT8UuSbWEkNqKICYqKoVllYFyc9AH0eAOwaUEd8CFamVW1XQB95fG6R43vcSAW+voSGQXpy3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lj3BKDmX/GxDuGRtSnAzZ6GiRQxRjN2AGHYGqpvRGXplOA0K89V9DSK4mK2cZ8b3OIlZpeyiCCShgGmkfbe9nIgamq7XOkvlnwUE0O7TTxmzPqywlCYHxAXixbi4QjWB+aLOaw9ihT5QDY40t2brcvKLv2pPyLWzV+8BqRjN9jGZFLntTdVISgO9nBrqtOnypOwmP6AqxL47oCJByVCxDvLLyAW21gTgi1WuP9PTMr4Toz2xAigEn5bMh64mur709bMg4HPnQJg4i6BMO+63Wipj0uibB++Nwct9jIqcjn+vBEFuhNDDKyYEcIUxAKb/PFeqFAzCaBxq7nDpS6DzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFXEgwJbXYOgjdf8Mo6Sab4nd2d9bIKymYBPd6sxkRQ=;
 b=QDmNQWblquYbOu/V4xpvPhmbXiwQW9w+6IcLBFN4GrAIAsaL7z0fimhio+jfcEEOcqdOflGCipawfCifEJ/LOF15LP9taijNAjXMo1AwzjBhg9hQ6cnixUhV7PD/xqdv1wIR9+KWV8Q+LSLgfVdtnCsSj6DTL6yAUvo3cXFLILdAAgpHF2Svg6OE9a6caxghm6qlRtylOHI889kuVoJdcmZ76iDYKPyDxqyI/VN0489YD+S0Y5jPS+Ej9R7W3SwS1fN8Ln4ahNxIf80O9TfRieQtYgINhS90k+ifXiiDdFBRCRFWZfz6CMU48oQ12uHQ7sPDWTLQKHJdfVL65MRBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vFXEgwJbXYOgjdf8Mo6Sab4nd2d9bIKymYBPd6sxkRQ=;
 b=CFeSTZjIYMEm38gO/TNk6Ao7VpSQ6begIZikECvxeMTBS2X8aLUPZnJYk+6sm5Nkycpwlr/SYK1mRyTbzTrDMSSkTBvFq6HeVDIT8UuSbWEkNqKICYqKoVllYFyc9AH0eAOwaUEd8CFamVW1XQB95fG6R43vcSAW+voSGQXpy3o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Topic: [PATCH v8 06/13] xen/arm: tee: keep init_tee_secondary() for
 hotplug and resume
Thread-Index: AQHcwo4fuKBruO1pu0mbPZdZpnwt6LXyt+WA
Date: Mon, 27 Apr 2026 08:19:11 +0000
Message-ID: <E02B689E-E2CA-47AB-85EC-B8C0EB2028D6@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <666917e8e8e435640c272c19908f412c315b2dc6.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB3PR08MB8938:EE_|AMS0EPF000001A5:EE_|FRZPR08MB11925:EE_
X-MS-Office365-Filtering-Correlation-Id: 0114b0cc-1af8-4af8-07ec-08dea435cfff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 BVKWvrtgG4U97nO3K3WENfZq5zc9fIGW/DwzytLh13YYPhWSVw4k5PaBH9l9JF7ac8jOO/fTUb2f21XUmOuN6DcbPLz7Nth+iFkOgDM/qSkvxz1/E/ZrAqn5A/vnPQO3xqNypsrKjdBEVCJR5zlZk3d/e7J/kYCKlYWy4i8Ka4bYtgMgU5NAoHSVwdDa1+ndDjPx8DgLTFmqH43c/XTkxMbiBDdtUH43dtOJseUumG9HUYRP+QIcm64vzcr7cq0xIFO2KNBETtRy6g7P+EdlP6D9vlMk6Uxwi/c63MThfCRWGnMHsocqzVBFDtDNd8R6WttnvqGkKMx+a1lVUiJvc2Q45uNcYg1tzTkyz7FjPinjpSMNH6anra3Qjt+RDlk5MZL8LA566dMlTtDPc+PK8nkEuud6jCDQd6aXQ//5c1G5Jq3l5bfhoZo/Fbj6xU/3AUxI3qTmtsRYIdXkamNE2V75lOacZvjHPrydnETA4WKODl96W4+/P8JsPr04YF5orYf5BoFmofBBb2kC9aPY8CkWaIchRDBpmlYlsktC63PLAvvNh1KYYqWNKzY9ZiWIHqRvnTK/ScBfguxPOlwdy2LdGmeLs6aSLZZv5BabeCV1FByCz1DC+1e8Ba6RbftnCi8I7/gYjNUGJM+Z/hU3JbqZ7Mo4I7oQP5RjguCcawLt/HUqfT1YypSl4u6qRNrdV2IoOUxQmtrkKeReWL29rgkMUSpEZhbOpEQfyIkrFhIr8RqVd2ZksotUwfintHVTI/FCxsqdb59No23uVtXFJT5rVVu1maFtO6DTl0LAgtQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB70685F2B88024E950737BEB4C3B5FF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 eFEfDr8flF3HOmw8HsFk8iai0rhOAfBDu7fumFryFNn+oCXb8x4NLtCqKPuyexMTrbJdhk2lmL/QQLWHtZFTZUblumnB+d0aclQc+xn/id9kIHXJv3WvkFBcUXWZ4OKYMVW6Qn6O33xx9tN+cndRrmHTb5dbRkICOon+M0ZSv9i8l0Aavy5QxAUBFWboiB5T70YlBQblKZdQiNWa572LdGUZgKuatR6FlNUUg9EyBtpBvS505n02Om1PaXCj04Tv0/bmmX/nu44Lufu7x9XzLaikUwilr2lHXP/O0Ao7vERJh7TeeSUaUDI2UFo+2K3ORPmNXIfp0MDm8cKpA23jMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8938
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11859b05-83e6-4fc2-5ae7-08dea435a99d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|14060799003|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ZuQZuucvAd+KUbyedDcSM+TcXJg0iwgT3621KzedpsGth8OpRoe5rxtcWTPBezCHDFyxFs6m3JFiX+nriOEKi7pY4Ul3dTXDJdeDDUmzzVUuud3B7tkFnzcChV5MdPsR7wWFHGqtNNwfUSW6QTD6ougsbar5AzKajEZaIcLcRbFQroJKn4axSbC3lA6b0gpASfZBSp1KSuo5Zg0dG5X47MfS7I+fYaIHi3y+MBGq60cKzYevdwhGDeTkYhwrBte0pQsV2O9WZdHjvR57dCaxbfAPoiDCmpjP3jee/T+x4uGPB0ayJKbZpnv3QGmhxPjgtU73WzN0WxafQnf5v1r+ZrpRQ0dQtuAKzCtES9tDpKWrdUVi50rbIsDqbviMMZz0woBug59QoDgIDg8wEQkyUDf49suc+G4wxWP0rNkwNiKpoKWbiox/+aAfxoHBKZGWzo2PnF/ze/t9gqdmVNw+H/mUWfywPdewDnsdYA02KrGrMRX4LMIQr1IyytbhJRnlW0vHEGK6Lg22zyUGSvZQY/1pMHCl+erIgh1VcYr+VY44NYAuTT+Wy7kqqwzmDU42QOHMBCiQp8o6fWATwa/IkhEbyd2cEcg3SJGCxKk+rRf9tm3pVY5dloBfZx66aQyVN1JCHvUxqvjmwe5IDAayI8UIiZYCDOSe0h68iTXYgQjaLgc53Zt/HE81uPd/YiPxJuo2tB2l4ZUUIozXUuVL3IAGugyPEafCNdJ4rrcaS0plJ8jpBNvnutaswhIwSxcR5hpvCdTpGSdCgZQOMEEElw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EAS/lDF4dA3JhuEufD3uxWrhgqbQALUQi62tw3zU24/wz4EAM/turOqZABjla3Je0W/vu0VpglPq6sJRnmVG0j1jyVDx+G+651dXpcKiiDEwYVcigTavTVbjd067AwkxFrZJ3x6K3NsIqhRkneIPUkaYv+arhslr++omtQFnmEUdnkmZxRP+xrbK/fCgqTEv4MwZjbz1EoLWVMzVQAjcbPhGsGxQ0kzmasMqJHqj1NxMRwDUkcwfkNdOz2tvRlxCW2usNIOuMp2/SC8pGhBfG03nt5XDXyXjYtxzx0lk+pjbiDZUioEFC9LzJmnG0GLYJ8HxiJ0ueYM3DN0m8F/iW2CktPj8NUrJVvzTVnTsNJI0wwoP8XsGIY8iAiEY33x8m4F4LtlSUoWqj4fwoyhANkyjiCc9LnqaorL/2MyPs+9xZpI+QLM/OOS3QjjR8PPz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:20:16.1808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0114b0cc-1af8-4af8-07ec-08dea435cfff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11925
X-purgate-ID: tlsNG-720697/1777278020-B3B60161-55A93EFD/0/0
X-purgate-type: clean
X-purgate-size: 1131
X-Rspamd-Queue-Id: 751EB46EF82
X-Rspamd-Action: no action
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

Hi Mykola,

> On 2 Apr 2026, at 12:45, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> init_tee_secondary() was marked __init and freed after boot. Calling it
> from the CPU hotplug/resume path then executed discarded code, which
> could crash Xen. Drop __init so the TEE mediator secondary init can run
> safely on hotplugged and resumed CPUs.
>=20
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> xen/arch/arm/tee/tee.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 8501443c8e..00e561fc78 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -128,7 +128,7 @@ static int __init tee_init(void)
>=20
> presmp_initcall(tee_init);
>=20
> -void __init init_tee_secondary(void)
> +void init_tee_secondary(void)
> {
>     if ( cur_mediator && cur_mediator->ops->init_secondary )
>         cur_mediator->ops->init_secondary();
> --=20
> 2.43.0
>=20


