Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNFFJ/7v6GkdRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:57:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B914482DD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290836.1570301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZwg-000414-Pg; Wed, 22 Apr 2026 15:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290836.1570301; Wed, 22 Apr 2026 15:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZwg-0003ym-MC; Wed, 22 Apr 2026 15:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1290836;
 Wed, 22 Apr 2026 15:56:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wFZwe-0003yg-L2
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZwe-00FO8L-1m
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:56:56 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e8efbc-5cb7-0a2a0a5109dd-0a2a450aa65e-18
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:56:55 +0200
Received: from [52.101.69.26]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69e8efc6-56b3-0a2a450a0019-3465451a6890-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:56:54 +0200
Received: from CWLP123CA0212.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::18)
 by AS2PR08MB9341.eurprd08.prod.outlook.com (2603:10a6:20b:59a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 15:56:50 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::5e) by CWLP123CA0212.outlook.office365.com
 (2603:10a6:400:19d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 15:56:50 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Wed, 22 Apr 2026 15:56:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 15:55:46 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9818.032; Wed, 22 Apr 2026
 15:55:46 +0000
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
 b=R6Is/nUdAqUevF5TEn5Ga8mLBEXHh4nA+mciOS7fh9ZpzgWw+2YMId8rXbF0f73WILmGp3IGy7sJV+/kgTfUWalnqfi90YJYA/FRXTAFSwXM1hDBsqpsZTFEoRffjqKhhfjvljWQgnVBBcEMEMhEnlfbbIMZ6fBPKN2c5BgKdYim8Ot28En60XUtyqZJgvpwsjtxJMEpSoD5Mu9HjdJBjorXK/EgKBsWiVwqzE7265YsGMw7GpK7NOH+ajXB7L1l2zuDc6FFEQhYCTBd76ZgVLJT9vG0ITLBdneD18fMiJsXxzEOfEznidpM2hXPEd584QKm+ih18DY0H7XVt1WGsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kl2PJjm4E4GfCJMlcRyVjQlDYOWo6koetR9ZTlZFnI=;
 b=VSwtjXLL2nlYKIAjj9FhDblVWOZGao3I8tJENBU1bHh5LeHFhiLjxqUXnqGUFvgMYA3Nf1HsQjcizPSfd168cnLP9YJwYTOYw49e0tOPEC35Yh7htPTIrgbxqEu8peMhjrFvv/GcEwuW3yN+lFCPya6kNDpQfcejOMqIHcQjdcDeCZXokPrzNkR+iZiujyxwosyUIp3PuV+la1rMtmENqpsSjQyAu5tncXZtFFE/vXYUm+61s607XWDtrp96a8ohNKYhjTagIOoT/1QjawgX+1SnIjv64IHFdIrwmjkgS3hssEJrgqdwp2r+WfEhByHvQ64jfzjNCn1rXW/Npo6/3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kl2PJjm4E4GfCJMlcRyVjQlDYOWo6koetR9ZTlZFnI=;
 b=TVeuaSmhwmns3qmLOh3XwLcTK5fit5EsLew/16FHhipZfZuS0dr2Qs4UB7H5X6gyAKyYSAFdav2GBlrDvzNtbXoC1Tmp6KgCRtOI3EN7XjdOwGQTBkD6Nc9TftHzN1IZeEwxn9NUkjSYUCks7EiDqYleser6Itp31h1ZJQgVz+0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK1cQ0DyGEREA2c5G6f8GkXHxZTpY9P2M/JsAgD/eGoLfpiWAZB3LzHlggpKcPEkQhtzkBVBDUTcPwQEEdqJaPPM5Z3W5lk41U1pMpEslwoU3MIJmaKf60jmf731gBBBR4r5sSlL1ELcNpEmGKmVbqmyEjbRU3yvmYCJyLrlGaK/a3tGafCbC8P+myT0tpQRFY9Yfnr7OKeXBITihSmxmJ6iAN4y1c8oSoL+4rM0MPiQV4ZwC5TzLEO6p39h8yHSW/2sERPOoi8V5Y8QRbidclpTUN6exrE3r9NnVgDu1cTNwzO+DaImRuI3pkCvdF1N0kekP2DtqUQqBuRWBAO/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kl2PJjm4E4GfCJMlcRyVjQlDYOWo6koetR9ZTlZFnI=;
 b=hmnT/klqULNHQw/0vayJY6DTgou9SE+46qRfXwDLw0+OsGIFrm7vp79hJrMjGvTvoPjGQy0cl3qDvUozrcIbgmXEhqi7fNZLpifEb9vFXvTNxIZW1PZV6885l62JGYDhl6aKtPO+CvvjtnsymugtVY33FZYaLoOn0cBk+o8iW+QTNbQrZn8/DJMb6aePl3wr25E+/M8gDzt2Q4UBLOkxtQ2i/h8pSH/ZDxqqHWjsQvaTpHS86CpkR0x9CiQ+duNUOEsMd6Vg2VmQNStf0DC5EqRDtuHm1Hr4RWYI/qLXkRLccFPvVz9dnfiBD4rA4zfmK6wWQMBzKoLNtfcrVBOp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kl2PJjm4E4GfCJMlcRyVjQlDYOWo6koetR9ZTlZFnI=;
 b=TVeuaSmhwmns3qmLOh3XwLcTK5fit5EsLew/16FHhipZfZuS0dr2Qs4UB7H5X6gyAKyYSAFdav2GBlrDvzNtbXoC1Tmp6KgCRtOI3EN7XjdOwGQTBkD6Nc9TftHzN1IZeEwxn9NUkjSYUCks7EiDqYleser6Itp31h1ZJQgVz+0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 03/13] xen/arm: gic-v3: tolerate retained redistributor
 LPI state across CPU_OFF
Thread-Topic: [PATCH v8 03/13] xen/arm: gic-v3: tolerate retained
 redistributor LPI state across CPU_OFF
Thread-Index: AQHc0nB7rI/mApm2xEOwE7P+RDE1mQ==
Date: Wed, 22 Apr 2026 15:55:46 +0000
Message-ID: <3235FD35-5EF1-4E77-B30E-AABEABCC081C@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <df183c2bc095ec611cff03e15ac1e358f0faa982.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <df183c2bc095ec611cff03e15ac1e358f0faa982.1775125380.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9677:EE_|AM3PEPF00009BA0:EE_|AS2PR08MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 135f2502-a38c-4ddd-4e3f-08dea087c43c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|38070700021|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 QyqpCChy+peWqDRabtkhpXt9jYdaCdlAxAV25RHuEdYFvwRXqJq7m0a/BweOQjrGljjhE6kb1BPe06+COqNDnFcua3lbXufwscVgY/mexFmpB1QoGSkVWYjHJ2p8TqjTWOC5n5u5iy9Dsn+UXx+G0NPSkNjuvol51pj0kEG+WMAI24m53VPqrRI5WSwDtP4acZM3BOFxz5mVsqckNwltvDsfecoa7keady4aATkrJrepQU6V5MELj7DJwJU46VRUZOB/mM69ZmK3K8K56mOEjABe4AIjE0mLGCH7Y+DQIZe4NbbAYLK71TrdiNrXe9QIUwChnfuJ7p18ryt+ZTgFd62aYcDDtzI2RWR+epPApvAu3HielSCKc3+UTPk8fZX6phOHXqm0VC5hfOQqmPyoOUOAhmW3TBD8SpfDQZIj8huu7s+tQg45z32YRoe/7TNsmmgedylye+6orMPW2TBjXjcm7/q21dALOjZe8mA8eoipseGG9M9RCRpnpTxHPXTiHK8GM7DOAnuKrnCkTReGjNJdzJiy4T+iUBV9mXsBBYhaxKuMwxxd/EMjOSyGXFP46ZX8lOyYXkVhGJSdq1MzJCSlkoH0bYijoOhZQmDhRhmojqruY1n6RMK4nEQwv4WZkOiDHFeWfikb/HulkSGb2nqaffK/w6PTy4hW92BR7C64BONZgP+0F2kwPxZ4Bdw86stqUJnELO97dlHNtDKVnd6qGxd1lk52RQ17xONYGTXO8kI2IPSagH/OxfVqD2Zpjmk5Qwr8Az5OKzMrasQaPCkhsB/fjOCqTxU88FGBiI8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <23D06EC015DE68408B0FEBB9F96D92F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 J20LnCJ5HWLWQQGEjnfwc2kcviy2C/X79KKn9hV65UJs+m2go5wafb3tvZYgDTSsnAsAAKe2jDFMCuMwINrIcVDSzVup2RDrrMZxHajEYlz7RKkCQNecA2/FgP9js8JXH1YVx3zZhXLf2dePeivoyskTZWiv/9Dgz3sB90ig+Oq3z7JbXE6+xmyssthczh2PgkKAKk5i+rrPmFo8BUz05nB38vPw9N8yy6aJO0JdAkGmoicxvM/59Y/lUIhloP5DKqLOTWqlnVAmftGM5ICrFAJUDcPT4OC3oG/iJT4DKI1vo1wMnbYJ1ypaTGbbKh1wdyVrW5wTF4GcNVzz1ol6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a2db3f2-e7a3-480f-de2e-08dea0879de1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|14060799003|82310400026|35042699022|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yXbstzGyUREnIc/0kH0t5DsTIZY7FkzUY3c+SzmYGLicpvRbXzTgHHOhpd1yWdroXmt4lb58DF5/ECvN8Fks9lWxZHTliYYqkqDXoxR1s7EPa/3uSFmAkmbpgbsda6aC5teW1jQP34po2c+eAwOMEsW2FDk3q/7TkeDziOCaAyDWoI1H08CBz8tUsgdRwyy99EzdjH/oKBu3JjiOCBkiAFs+skwLffbk7XSIBJafaHWn+YlEDhGZSoQxg2tL2nXnWhjy4h4c2uG51Uu7vTlttU6AbW3VlPWS/MihIhQQ4kHpJ9EjwM7p+jNPFWiLKjYGHzjqOXssO+6yR0Onth9hknA85q/M8ihfV9AGZkLPOV51pICmXyALO4yksPrt6n8c9I19cvoTMpPRc3VCSCzM910+tSyy7a9u57sMBx2ozd2QZIH3HRu2TZG3Mr4D/B9rnibCsa7LlDWLMzwpJVGV7pBuL2db9Pb3loYfiCZ4uB2M71yc1S6YOaNyO1wlz6Eb/h+sleVbPNPIxIJjfLAdjVS9NIWJLLM/vgm74tr+xOgOqq+aWy6lPYpE1biKbjoKnH3wY8qmHncXBCEBw9Fwox90XjtqM/wv1La23tqDXVVaTWE9n6+7ELX0Z06jR3wpWz+WwtFmcfKpmY+W+fbazvPcrwCBG1bEj7eiicIZcbVRgZ2vw9I+ABJrUer1FuqqQw9qlYxh147t/20jEvR/OForzdq2FXTU/ooJ5VjW3mAXP/py11+u4x09twDHuUn0eNGGjMmAW/uMp7vO5dgWiA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3BhfskbKRdhCnPASVEfnTJrpnp6UxRIlDLq+C3xbKeHoA7Bw5RBawfCs0IKnFP4Flpq6e1ITyLsus9+cxsMBRiU9nVRbpS9zBOmNbFmbaW9gOSaY1l9cq3I18l4XAdsvPCQBvmY3LBgo0f5tJ/7DdR3Pkblj6nbOiNQ4jVwuh9K62sWGuv1eYfyVRY7IoLtDqPrBqdDAJPwI6+a8b6PGD0PxiRIj+C9ITLa3saP2eg0GXW0Mu8Ka23/XR0kQ+OyRO67wb+8IxewFck545TDizf2R5DtbrE8wp/TTdUSHeAA6f8397m1wum06xOoSKGW2/gqMgZ9AK5NFvgrIyp3r9JUnUr0P77Kq2jz7iVEUF/k++oqA7qclO3QtV+wCkIUV7JYRXzX7z+XamNf1Cesn7aGTsde0pWI4IC3jFc+OX48uwtmpGqGi72w+oMMqABS+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 15:56:50.5529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135f2502-a38c-4ddd-4e3f-08dea087c43c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9341
X-purgate-ID: tlsNG-4011c0/1776873415-449668B7-60825E61/0/0
X-purgate-type: clean
X-purgate-size: 5810
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: E9B914482DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTXlrb2xhLA0KDQo+ICsNCj4gK3N0YXRpYyBpbnQgZ2ljdjNfbHBpX2Rpc2FibGVfbHBpcyh2
b2lkIF9faW9tZW0gKnJkaXN0X2Jhc2UpDQo+ICt7DQo+ICsgICAgdWludDMyX3QgcmVnID0gcmVh
ZGxfcmVsYXhlZChyZGlzdF9iYXNlICsgR0lDUl9DVExSKTsNCj4gKyAgICBpbnQgcmV0Ow0KPiAr
DQo+ICsgICAgaWYgKCAhKHJlZyAmIEdJQ1JfQ1RMUl9FTkFCTEVfTFBJUykgKQ0KPiArICAgICAg
ICByZXR1cm4gMDsNCj4gKw0KPiArICAgIHdyaXRlbF9yZWxheGVkKHJlZyAmIH5HSUNSX0NUTFJf
RU5BQkxFX0xQSVMsIHJkaXN0X2Jhc2UgKyBHSUNSX0NUTFIpOw0KPiArDQo+ICsgICAgLyoNCj4g
KyAgICAgKiBUaGUgc3BlYyBvbmx5IGd1YXJhbnRlZXMgcHJvZ3JhbW1hYmlsaXR5IHdoZW4gd2Ug
aGF2ZSBvYnNlcnZlZCB0aGUgYml0DQo+ICsgICAgICogY2xlYXJlZC4gV2hlcmUgY2xlYXJpbmcg
aXMgc3VwcG9ydGVkLCBSV1AgbXVzdCByZWFjaCAwIGJlZm9yZSB0b3VjaGluZw0KPiArICAgICAq
IFBST1BCQVNFUi9QRU5EQkFTRVIgYWdhaW4uDQo+ICsgICAgICovDQo+ICsgICAgd21iKCk7DQo+
ICsNCj4gKyAgICByZXQgPSBnaWN2M19kb193YWl0X2Zvcl9yd3AocmRpc3RfYmFzZSk7DQoNCkni
gJltIGxvb2tpbmcgaW50byB0aGUgaW1wbGVtZW50YXRpb24gb2YgZ2ljdjNfZG9fd2FpdF9mb3Jf
cndwKCkgYW5kIEkgc2VlDQppdOKAmXMgcG9sbGluZyBvbiBiaXQgMzEgKFVXUCkgaW5zdGVhZCBv
ZiBiaXQgMyAoUldQKT8NCg0KTm90IHJlbGF0ZWQgdG8gdGhpcyBwYXRjaCBidXQgSSBmZWVsIHdl
IG5lZWQgdG8gcmFpc2UgdGhpcy4NCg0KPiArICAgIGlmICggcmV0ICkNCj4gKyAgICAgICAgcmV0
dXJuIHJldDsNCj4gKw0KPiArICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQocmRpc3RfYmFzZSArIEdJ
Q1JfQ1RMUik7DQo+ICsgICAgaWYgKCByZWcgJiBHSUNSX0NUTFJfRU5BQkxFX0xQSVMgKQ0KPiAr
ICAgICAgICByZXR1cm4gLUVCVVNZOw0KPiArDQo+ICsgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsN
Cj4gLyoNCj4gICogVGVsbCBhIHJlZGlzdHJpYnV0b3IgYWJvdXQgdGhlIChzaGFyZWQpIHByb3Bl
cnR5IHRhYmxlLCBhbGxvY2F0aW5nIG9uZQ0KPiAgKiBpZiBub3QgYWxyZWFkeSBkb25lLg0KPiBA
QCAtMzczLDcgKzQzNCwyMSBAQCBpbnQgZ2ljdjNfbHBpX2luaXRfcmRpc3Qodm9pZCBfX2lvbWVt
ICogcmRpc3RfYmFzZSkNCj4gICAgIC8qIE1ha2Ugc3VyZSBMUElzIGFyZSBkaXNhYmxlZCBiZWZv
cmUgc2V0dGluZyB1cCB0aGUgdGFibGVzLiAqLw0KPiAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChy
ZGlzdF9iYXNlICsgR0lDUl9DVExSKTsNCj4gICAgIGlmICggcmVnICYgR0lDUl9DVExSX0VOQUJM
RV9MUElTICkNCj4gLSAgICAgICAgcmV0dXJuIC1FQlVTWTsNCj4gKyAgICB7DQo+ICsgICAgICAg
IGlmICggZ2ljdjNfbHBpX3RhYmxlc19tYXRjaChyZGlzdF9iYXNlKSApDQo+ICsgICAgICAgICAg
ICByZXR1cm4gLUVCVVNZOw0KPiArDQo+ICsgICAgICAgIHJldCA9IGdpY3YzX2xwaV9kaXNhYmxl
X2xwaXMocmRpc3RfYmFzZSk7DQo+ICsgICAgICAgIGlmICggcmV0ID09IC1FQlVTWSApDQo+ICsg
ICAgICAgIHsNCj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+ICsgICAgICAgICAg
ICAgICAgICAgIkdJQ3YzOiBDUFUlZDogTFBJcyBzdGlsbCBlbmFibGVkIHdpdGggdW5leHBlY3Rl
ZCByZWRpc3RyaWJ1dG9yIHRhYmxlc1xuIiwNCj4gKyAgICAgICAgICAgICAgICAgICBzbXBfcHJv
Y2Vzc29yX2lkKCkpOw0KPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAgICAg
IH0NCj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4g
KyAgICB9DQo+IA0KPiAgICAgcmV0ID0gZ2ljdjNfbHBpX3NldF9wZW5kdGFibGUocmRpc3RfYmFz
ZSk7DQo+ICAgICBpZiAoIHJldCApDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZ2ljLXYz
LmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLmMNCj4gaW5kZXggYmMwN2Y5N2MxNi4uMzRmYjA2NWFm
YyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2dpYy12My5jDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9naWMtdjMuYw0KPiBAQCAtMjc0LDggKzI3NCw4IEBAIHN0YXRpYyB2b2lkIGdpY3YzX2Vu
YWJsZV9zcmUodm9pZCkNCj4gICAgIGlzYigpOw0KPiB9DQo+IA0KPiAtLyogV2FpdCBmb3IgY29t
cGxldGlvbiBvZiBhIGRpc3RyaWJ1dG9yIGNoYW5nZSAqLw0KPiAtc3RhdGljIHZvaWQgZ2ljdjNf
ZG9fd2FpdF9mb3JfcndwKHZvaWQgX19pb21lbSAqYmFzZSkNCj4gKy8qIFdhaXQgZm9yIGNvbXBs
ZXRpb24gb2YgYSBkaXN0cmlidXRvci9yZWRpc3RyaWJ1dG9yIHdyaXRlLXBlbmRpbmcgY2hhbmdl
LiAqLw0KPiAraW50IGdpY3YzX2RvX3dhaXRfZm9yX3J3cCh2b2lkIF9faW9tZW0gKmJhc2UpDQo+
IHsNCj4gICAgIHVpbnQzMl90IHZhbDsNCj4gICAgIGJvb2wgdGltZW91dCA9IGZhbHNlOw0KPiBA
QCAtMjk1LDE3ICsyOTUsMjIgQEAgc3RhdGljIHZvaWQgZ2ljdjNfZG9fd2FpdF9mb3JfcndwKHZv
aWQgX19pb21lbSAqYmFzZSkNCj4gICAgIH0gd2hpbGUgKCAxICk7DQo+IA0KPiAgICAgaWYgKCB0
aW1lb3V0ICkNCj4gKyAgICB7DQo+ICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCAiUldQIHRp
bWVvdXRcbiIpOw0KPiArICAgICAgICByZXR1cm4gLUVUSU1FRE9VVDsNCj4gKyAgICB9DQo+ICsN
Cj4gKyAgICByZXR1cm4gMDsNCj4gfQ0KPiANCj4gc3RhdGljIHZvaWQgZ2ljdjNfZGlzdF93YWl0
X2Zvcl9yd3Aodm9pZCkNCj4gew0KPiAtICAgIGdpY3YzX2RvX3dhaXRfZm9yX3J3cChHSUNEKTsN
Cj4gKyAgICAodm9pZClnaWN2M19kb193YWl0X2Zvcl9yd3AoR0lDRCk7DQo+IH0NCj4gDQo+IHN0
YXRpYyB2b2lkIGdpY3YzX3JlZGlzdF93YWl0X2Zvcl9yd3Aodm9pZCkNCj4gew0KPiAtICAgIGdp
Y3YzX2RvX3dhaXRfZm9yX3J3cChHSUNEX1JESVNUX0JBU0UpOw0KPiArICAgICh2b2lkKWdpY3Yz
X2RvX3dhaXRfZm9yX3J3cChHSUNEX1JESVNUX0JBU0UpOw0KPiB9DQo+IA0KPiBzdGF0aWMgdm9p
ZCBnaWN2M193YWl0X2Zvcl9yd3AoaW50IGlycSkNCj4gQEAgLTkyNSw3ICs5MzAsNyBAQCBzdGF0
aWMgaW50IF9faW5pdCBnaWN2M19wb3B1bGF0ZV9yZGlzdCh2b2lkKQ0KPiAgICAgICAgICAgICAg
ICAgICAgIGdpY3YzX3NldF9yZWRpc3RfYWRkcmVzcyhyZGlzdF9hZGRyLCBwcm9jbnVtKTsNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZ2ljdjNfbHBpX2luaXRfcmRpc3QocHRyKTsN
Cj4gLSAgICAgICAgICAgICAgICAgICAgaWYgKCByZXQgJiYgcmV0ICE9IC1FTk9ERVYgKQ0KPiAr
ICAgICAgICAgICAgICAgICAgICBpZiAoIHJldCAmJiByZXQgIT0gLUVOT0RFViAmJiByZXQgIT0g
LUVCVVNZICkNCj4gICAgICAgICAgICAgICAgICAgICB7DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHByaW50aygiR0lDdjM6IENQVSVkOiBDYW5ub3QgaW5pdGlhbGl6ZSBMUElzOiAldVxu4oCd
LA0KIA0KVGhpcyBzaG91bGQgYmUgdGhlIG90aGVyIHdheSBhcm91bmQ/ICV1IGZvciBzbXBfcHJv
Y2Vzc29yX2lkKCkgYW5kICVkIGZvciByZXQ/DQoNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNtcF9wcm9jZXNzb3JfaWQoKSwgcmV0KTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
Z2ljX3YzX2l0cy5oDQo+IGluZGV4IGZjNWE4NDg5MmMuLjA4MWJkMTkxODAgMTAwNjQ0DQo+IC0t
LSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfaXRzLmgNCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19pdHMuaA0KDQpXaHkgdGhpcyBoZWFkZXIgYW5kIG5v
dCBnaWMuaD8NCg0KPiBAQCAtMTMzLDYgKzEzMyw3IEBAIHN0cnVjdCBob3N0X2l0cyB7DQo+IA0K
PiAvKiBNYXAgYSBjb2xsZWN0aW9uIGZvciB0aGlzIGhvc3QgQ1BVIHRvIGVhY2ggaG9zdCBJVFMu
ICovDQo+IGludCBnaWN2M19pdHNfc2V0dXBfY29sbGVjdGlvbih1bnNpZ25lZCBpbnQgY3B1KTsN
Cj4gK2ludCBnaWN2M19kb193YWl0X2Zvcl9yd3Aodm9pZCBfX2lvbWVtICpiYXNlKTsNCj4gDQo+
ICNpZmRlZiBDT05GSUdfSEFTX0lUUw0KPiANCj4gDQoNClRoZSByZXN0IGxvb2tzIG9rIHRvIG1l
IQ0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KDQo=

