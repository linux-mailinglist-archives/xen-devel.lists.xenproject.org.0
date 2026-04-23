Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1RG6jV6WnxlAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:17:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2FE44E6C4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 10:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291752.1570593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpFM-0001RD-0G; Thu, 23 Apr 2026 08:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291752.1570593; Thu, 23 Apr 2026 08:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFpFL-0001Q2-TJ; Thu, 23 Apr 2026 08:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1291752;
 Thu, 23 Apr 2026 08:17:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wFpFK-0001Oh-6T
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 08:17:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFpFI-000G8q-1T
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 10:17:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9d586-bab6-0a2a0a5309dd-0a2a450aaf64-22
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:17:13 +0200
Received: from [40.107.162.68]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69e9d589-56b3-0a2a450a0019-286ba244f361-4
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 10:17:13 +0200
Received: from AM9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::25)
 by DU0PR08MB8495.eurprd08.prod.outlook.com (2603:10a6:10:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 08:17:02 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::7) by AM9P250CA0020.outlook.office365.com
 (2603:10a6:20b:21c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 08:17:02 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 23 Apr 2026 08:17:02 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB9942.eurprd08.prod.outlook.com (2603:10a6:20b:545::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:15:56 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9818.023; Thu, 23 Apr 2026
 08:15:53 +0000
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
 b=Lem1mdvuEVefGFTMb2dRI2oIGwRciBLMMbcaZZzfYGt3ZzVTLYDDJgZPXMkLqP/ePH8ZECWqcZsxJASbXn4MdMpax8AcyNmWpl3C+mFwGUa3nUZiiwtiMOtCyZr2H2NNfeStmOyLgyo4Z2Qx7JfAmzCcC1Tp+7N2GvlGwQzNUkfUhDDncrnd7BwZsUNzcujsVwIbZr34GpOiPv/OETSNqHBabuLYdNmBSIlSrbZMJSCQJ5zEBYZ83bpAlExgI7eXk7BivbM0ghNK7ARPWJurAhxD80DMftdj7VDWsTu58yJuvy6WknEir1fwV1/EIlCsHhp2AlR0H3KiGM0UeIoGPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOBKO70A7UAdzofvuc/7jl3g1FJVWXfR6RJN+nYkYwI=;
 b=NYaEX+2bCsInHzkqGYgPcIfPYf4wODqknEfdA5b0QD+PKVDUV7j5PpEB+FtpQqMsA1g+Lzs2ZM0pNbOocfXFaQLVevaqjgIn0K2JZaDpba49PH64tPBC8BWSkpSgM8ejuSYjzXrKgSNeCq5gXTO42eahnBy74VXBG/y88rvQ59huV8YbZqFaQwOSvRZZvwCLDuuDVVbowW4zC0467f2xBa5JYtmiBGMQ8yp/PduS0oxZdPLOT/kJoVfqRVdJy7Z/c17KyssklnwoJgulXvxz7oucopEvmLXysYQ4gAO9fKTj6d75kLzpb03lzxCdY8fXP1xnxdb3JMCu6G5YoBWx1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOBKO70A7UAdzofvuc/7jl3g1FJVWXfR6RJN+nYkYwI=;
 b=C339owpm2qeTLv/f7JjdlGnv86KQ0AM+o/UBzKngDzsHLrScxWpdEmu0Y20Nop3NBuSKP9wIJBHwsMgFmrnVxgzFVdSUUTjGQySEasMBAF9n4tTcpoZPKDOj+WxbA+MfK7jAIp/xZTXxOsLYTUsttHoNlC2ptEhYyaahQygUdzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqlur0K93d2zHx3JPQloUzWFIrN5pGzhNiNfJuFVcU5dLEelLhm1NuMDTg7MHnkMO+PjmaQoHCYMEJ2BhBKY1VzL8WIpxGIEOqeCsROnAcjbjxX0HifZfWZNgIwtZRInk7w4IoBkKOcgll7JCn2pxfZIw2xlzmripjO0NxI3nZJxrMZBHyrUV9qTFm5BOcpdSwzcG6G/ROHli3QiBSbae3SMlC2eWK2jJli6bALqjF8sFJL32kqFfcN6RPfSQu0IilAhwDivrdsoei33Vko0hQmuWpt2qfcPyf5egLE+WcMi7VwTzv+tMx2dQDYS7Jsf5HdXYcskBvY247JKzigAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOBKO70A7UAdzofvuc/7jl3g1FJVWXfR6RJN+nYkYwI=;
 b=GwktKifoxI7fUHDEhf1qjfrDsPSC5z2pEMux3LnKFx+wvbWrXkhNeeoshKL9wJgt0mikG28bSOyUPMbFsU6Ay9n4LbK4TSSUeU7o6fhk+smLjMFj1YE69sMVhnIkE0XQlcJ2utLyOn9ZQZNlOKfR8+0irbtlh1nUvScgleyprmuKwTOxFvTtvha9XFij0THeoLYXg4jVNvtktSGEDyWI4TynmD+yiTIsbmXu/XGuWqoADIW4l2yj/leKJs/3pkL069PajWV1As+wCuBnsI1U8nCqpPZFtKxzUOkJO0jCxC0pLSBgb81qsT4GJfeJUIkcR0q45DeX5pFoTgqbzy9KGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOBKO70A7UAdzofvuc/7jl3g1FJVWXfR6RJN+nYkYwI=;
 b=C339owpm2qeTLv/f7JjdlGnv86KQ0AM+o/UBzKngDzsHLrScxWpdEmu0Y20Nop3NBuSKP9wIJBHwsMgFmrnVxgzFVdSUUTjGQySEasMBAF9n4tTcpoZPKDOj+WxbA+MfK7jAIp/xZTXxOsLYTUsttHoNlC2ptEhYyaahQygUdzA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>
Subject: Re: [PATCH 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
Thread-Topic: [PATCH 6/6] xen/arm: ffa: Deliver VM-to-VM notifications locally
Thread-Index: AQHcznAj5bksQAE/uU+1luHutLjHlrXrJN4AgAExA4A=
Date: Thu, 23 Apr 2026 08:15:53 +0000
Message-ID: <263B26DA-15D5-43A6-90D8-AA42AF8C391B@arm.com>
References: <cover.1776266307.git.bertrand.marquis@arm.com>
 <e85d0ef9733f091e09f520c2e0598f13cb7af06a.1776266307.git.bertrand.marquis@arm.com>
 <CAHUa44GbUQRfFzBqpAX94FSioYzT9tx5oP7C8fOvnWmMTV4-SQ@mail.gmail.com>
In-Reply-To:
 <CAHUa44GbUQRfFzBqpAX94FSioYzT9tx5oP7C8fOvnWmMTV4-SQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB9942:EE_|AMS0EPF00000198:EE_|DU0PR08MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 7397d6f9-e126-4846-7552-08dea110b2ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 GhE67Tff+WsfdHS3UsU0YS/VnEFq0FuT4vOS61HwRYf5tQj0mDtG4/jRE1sXXTZJLy8V26YhVlFP/AmsTABEc4Pu9HGfgKFZiqWxzj5Zao41X8MdObxLv4VszUs3NUQNORn0qSfdsB9rOQzvY4Yyi3+hHXp8xuJ1Sm1EHU+n72Vp2JIsPPd4KWE3l4Yi9UbYxqidf6s9+VE8qwWWlC5iwxHB1ldKywPkrKhTDRHizDLOhY6bJYhNRM7+X5vfrcwhovUUK3s2AYltqUhmIshnMKiUTbV+Atj8Fp+9u3pZCHKe2gGxONeqLUFUXxN3CHNPgbq76j9iaqBflKBDeyF6GyhDr1aILj35WujVaXn9c6d+yGyEGr/mpILWXM4sJx06XBo6uE4d6zfl3F3GO3lg9ttiIXr72Zy3Zvvhn048BzeChzTTbUpx4ySQTFZu+xpNtVOIZxc5MtN5l1OeIP1tfCRFddKKufkA4L5ig5tZkYFUDDZW8QX/DqQwNRM0jylL6GhNrZhoZZDCLy7CMwvspTQMlxgX6uky7sbCcVYFF9FzzeM7VZlMDuY0zDobzMteLvQntPk+xS1qEBsaMXSNAQDP6ncpzCVew79WXnaYeg5+IFdSK+FkiF/ivXitYZwLjR4JJlE3VFf3EfXNZaW7rvBthuDaROaha+Y9oozsGf/8S8WcR2lvPce7jv69dIjNZ+lACyeHXn6ZRwS0taHC1ipViW+PF91Fat6pxqCb5Vm5uqofVShB65L/GIHJG50KcqwdxJqPUfHpWuJoxq82bZWoQwhP6Tp0rgk2xysWhN0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <79422F588C3CA748846A8F994F25660B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 QW217cXh+OV1nAVXAEkuY92E31mdDPaVhDLz+qUMmdAMePkT98gVVLzU7DjQtdSNi3OWVDfdgRmZskdZDHjWC2EGGN1q+6O5CddK7zQukcTkcIwu6LGykOaYJ0oxPqMWcYxIcpUi0cEksEZyK5FsQxDqWC+JYZkm3THqYuJfo59tutNIgbRdXyQkMwPlQlOvaojMzmWH7RO3PL3NhOWDrgd836L0nAwi4CDLI5zSWv01tKgOncKKmHrb0NEe22W/ZzQFUJaFTHI18jxP7+qw+uBWzdgTBrzflGFgQQgGO+SQ5yWYx6GHC/V4Q4CSIrwOFZveM0/xapXHoYmo9VxfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9942
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eaad1835-930c-4612-25e1-08dea11089f5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|35042699022|14060799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XF6zqJ64YGBCwZ1qC3No8NcekiuNdzolzMG6HciTQeL3nAjbVw0mCBwhEzriDc+8yjKLfOv/yqwVwsrwfS8a23Hx3JqtGYBYR0vABray96Gbvi+hFCfwvmmCoFIrQIRqwtwDrNpXzqjScA80+gHaXxRGillz8gzG5EQuv+QZUAOLA9P0+KEm4x5o6g+nEJ1t+SiF1FS6ruA5+V+oM6vYTL9FVxAVJGqVbK8l1mSeMsTLKkqs8s/WemkgftNk1C4ph944n8pPi3HYOQc8YUn/dQT/79EnLMGs1ww6+z4uXzPIHTQGpritjSbd4kwVhC60M8xz2Fgc56ad9GBD3QQ4zGYFjvX/UpzlSnovlNLzBDNvbnUHZw4WgpXQEntRfbTKirM4rhft750xBB8zrOysxsY1UdzJBQkHUkzO09iv7sdnZI2n96aYV/IXZucn/k1vnjHGOIg35+ghGgY7Ht3ef6GXUvFYMu7zbmhLtFykys9ljuaItMDbX6mY1135zuJDFTok5Nm/L6NRkgF9F0CtQsIJiGitvRk8AnVN22FK8826Y/ZMIPHzOkmXQGTu1/1QfwA+iCBL7HocKZxWpogww6DJiTLcsjmf2ovlmio/3SBk2Xi1Wwahqv15gcEPqGM4ddGBrSZJ4tkdtMkep7fyvHxvdGwf9waOaYIbQKlWxeyhDNO3lY66pI+727YnblmvQfAqg/PSTVn4ZOvtNcgy9WebUgrsosamTqLfQ1FbX5cKBBrQrnE+rrcjuniIUrwhEvhGotskSDi4eElb9hYUAg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(35042699022)(14060799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sZBXPxiqNsT8L9uweKNwQRSgiqqS0ZrlBC33LqlKNGpBr92Tr3AU45jxe+MWiE7P53vrZY/pgIJUavo0NC8/VJj81NOpN69HIG7B10M2IFp0v1cGcgzhN6kmHnq78fhXz1/Q10vvfNhPB+RC2f/N2iALyZZyOzFUIWpUALDoWUD0+7YcKH0gZhr147OM220mn7Sw7YY2YORegux3a0VeCXposFaV8WkKODIBM8/aiDnhUi4za6Ue250Vc4chg8AeMytZolyTD0JTNgVQ+yMs69K1oRdTc5TWhT7H/3kHdHZgrEtEmZ2XyhKjk9gVIE5WH+KGD4sNULn8ya0uYClG2pTQzGSuv/e0Nn9bIS4OY+9Lo9wOQH0J3rlLqihaeESlHA/vfe2H6GK48vMsN68Lb/vz9dvPbFLReG0Bd1q3fxJp8LAXwmHJpNsD3ocg5FL4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:17:02.6895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7397d6f9-e126-4846-7552-08dea110b2ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8495
X-purgate-ID: tlsNG-4011c0/1776932233-465748B7-478EDB42/0/0
X-purgate-type: clean
X-purgate-size: 12030
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 1C2FE44E6C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmVucywNCg0KPiBPbiAyMiBBcHIgMjAyNiwgYXQgMTY6MDQsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMzo0MeKAr1BNIEJlcnRyYW5kIE1hcnF1aXMNCj4g
PGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IFZNIG5vdGlmaWNhdGlv
biBiaW5kaW5nIGFuZCBwZW5kaW5nIHRyYWNraW5nIGV4aXN0IGZvciBub24tc2VjdXJlDQo+PiBl
bmRwb2ludHMsIGJ1dCBGRkFfTk9USUZJQ0FUSU9OX1NFVCBzdGlsbCBvbmx5IGZvcndhcmRzIHNl
Y3VyZQ0KPj4gZGVzdGluYXRpb25zIHRvIHRoZSBTUE1DLiBOb24tc2VjdXJlIFZNcyB0aGVyZWZv
cmUgY2Fubm90IHJlY2VpdmUNCj4+IG5vdGlmaWNhdGlvbnMgZnJvbSBvdGhlciBWTXMuIExvY2Fs
IE5QSSBkZWxpdmVyeSBhbHNvIG5lZWRzIGV4cGxpY2l0DQo+PiByZS1hcm0gdHJhY2tpbmcgc28g
cmVwZWF0ZWQgcmFpc2VzIGFyZSBub3QgbG9zdCB3aGlsZSB0aGUgaW50ZXJydXB0IGlzDQo+PiBh
bHJlYWR5IHBlbmRpbmcuDQo+PiANCj4+IEFkZCBhIGxvY2FsIFZNIG5vdGlmaWNhdGlvbiBkZWxp
dmVyeSBwYXRoIGZvciBub24tc2VjdXJlIGRlc3RpbmF0aW9ucy4NCj4+IG5vdGlmaWNhdGlvbl9z
ZXRfdm0oKSByZXNvbHZlcyB0aGUgZGVzdGluYXRpb24gZW5kcG9pbnQsIHZlcmlmaWVzIHRoYXQN
Cj4+IGV2ZXJ5IHJlcXVlc3RlZCBiaXQgaXMgYm91bmQgdG8gdGhlIHNlbmRlciwgc2V0cyB0aGUg
cmVjZWl2ZXIncw0KPj4gdm1fcGVuZGluZyBiaXRtYXAgdW5kZXIgbm90aWZfbG9jaywgYW5kIHJh
aXNlcyBhbiBOUEkgb25seSB3aGVuIHRoZQ0KPj4gcmVjZWl2ZXIgdHJhbnNpdGlvbnMgZnJvbSBu
byBsb2NhbCBwZW5kaW5nIG5vdGlmaWNhdGlvbnMgdG8gc29tZS4NCj4+IA0KPj4gVHJhY2sgd2hl
dGhlciBhIGxvY2FsIE5QSSBpcyBhbHJlYWR5IGFybWVkIHdpdGggbm90aWZfaXJxX3JhaXNlZCwg
Y2xlYXINCj4+IHRoYXQgc3RhdGUgb25jZSBib3RoIFZNIGFuZCBoeXBlcnZpc29yIHBlbmRpbmcg
Yml0bWFwcyBhcmUgZHJhaW5lZCwgYW5kDQo+PiByb2xsIGJhY2sgbmV3bHktYWRkZWQgVk0gcGVu
ZGluZyBiaXRzIGlmIG5vIGRlc3RpbmF0aW9uIHZDUFUgaXMgb25saW5lLg0KPj4gQWxzbyBleHBv
c2UgZmlybXdhcmUgbm90aWZpY2F0aW9uIGF2YWlsYWJpbGl0eSBzbyBGRkFfRkVBVFVSRVMgb25s
eQ0KPj4gYWR2ZXJ0aXNlcyBub3RpZmljYXRpb24gc3VwcG9ydCB3aGVuIGl0IGlzIGFjdHVhbGx5
IHByb3ZpZGVkIGJ5IHRoZQ0KPj4gZmlybXdhcmUgb3IgYnkgQ09ORklHX0ZGQV9WTV9UT19WTS4N
Cj4+IA0KPj4gRnVuY3Rpb25hbCBpbXBhY3Q6IHdoZW4gQ09ORklHX0ZGQV9WTV9UT19WTSBpcyBl
bmFibGVkLCBub24tc2VjdXJlDQo+PiBGRkFfTk9USUZJQ0FUSU9OX1NFVCBkZWxpdmVycyBWTS10
by1WTSBub3RpZmljYXRpb25zIGxvY2FsbHkgYW5kIGtlZXBzDQo+PiBOUEkgZGVsaXZlcnkgcmVs
aWFibGUgYWNyb3NzIHJlcGVhdGVkIHJhaXNlcy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVy
dHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiB4ZW4v
YXJjaC9hcm0vdGVlL2ZmYS5jICAgICAgICAgfCAgMjQgKysrKystLQ0KPj4geGVuL2FyY2gvYXJt
L3RlZS9mZmFfbm90aWYuYyAgIHwgMTI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5oIHwgIDExICsrLQ0KPj4gMyBmaWxl
cyBjaGFuZ2VkLCAxNDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEu
Yw0KPj4gaW5kZXggMWZlMzNmMjY0NTRhLi43ZmUwMjEwNDljYmEgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+
PiBAQCAtMzksOCArMzksMTMgQEANCj4+ICAqIG8gRkZBX01TR19TRU5EX0RJUkVDVF9SRVE6DQo+
PiAgKiAgIC0gb25seSBzdXBwb3J0ZWQgZnJvbSBhIFZNIHRvIGFuIFNQDQo+PiAgKiBvIEZGQV9O
T1RJRklDQVRJT05fKjoNCj4+ICsgKiAgIC0gb25seSBzdXBwb3J0ZWQgd2hlbiBmaXJtd2FyZSBu
b3RpZmljYXRpb25zIGFyZSBlbmFibGVkIG9yIFZNLXRvLVZNDQo+PiArICogICAgIHN1cHBvcnQg
aXMgYnVpbHQgaW4NCj4+ICAqICAgLSBvbmx5IHN1cHBvcnRzIGdsb2JhbCBub3RpZmljYXRpb25z
LCB0aGF0IGlzLCBwZXIgdkNQVSBub3RpZmljYXRpb25zDQo+PiAtICogICAgIGFyZSBub3Qgc3Vw
cG9ydGVkDQo+PiArICogICAgIGFyZSBub3Qgc3VwcG9ydGVkIGFuZCBzZWN1cmUgcGVyLXZDUFUg
bm90aWZpY2F0aW9uIGluZm9ybWF0aW9uIGlzDQo+PiArICogICAgIG5vdCBmb3J3YXJkZWQNCj4+
ICsgKiAgIC0gdGhlIHNvdXJjZSBlbmRwb2ludCBJRCByZXBvcnRlZCBmb3IgYSBub3RpZmljYXRp
b24gbWF5IG5vIGxvbmdlcg0KPj4gKyAqICAgICBleGlzdCBieSB0aGUgdGltZSB0aGUgcmVjZWl2
ZXIgY29uc3VtZXMgaXQNCj4+ICAqICAgLSBkb2Vzbid0IHN1cHBvcnQgc2lnbmFsbGluZyB0aGUg
c2Vjb25kYXJ5IHNjaGVkdWxlciBvZiBwZW5kaW5nDQo+PiAgKiAgICAgbm90aWZpY2F0aW9uIGZv
ciBzZWN1cmUgcGFydGl0aW9ucw0KPj4gICogICAtIGRvZXNuJ3Qgc3VwcG9ydCBub3RpZmljYXRp
b25zIGZvciBYZW4gaXRzZWxmDQo+PiBAQCAtMjQ1LDYgKzI1MCw4IEBAIHN0YXRpYyB2b2lkIGhh
bmRsZV9mZWF0dXJlcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICB1aW50MzJf
dCBhMSA9IGdldF91c2VyX3JlZyhyZWdzLCAxKTsNCj4+ICAgICBzdHJ1Y3QgZG9tYWluICpkID0g
Y3VycmVudC0+ZG9tYWluOw0KPj4gICAgIHN0cnVjdCBmZmFfY3R4ICpjdHggPSBkLT5hcmNoLnRl
ZTsNCj4+ICsgICAgYm9vbCBub3RpZl9zdXBwb3J0ZWQgPSBJU19FTkFCTEVEKENPTkZJR19GRkFf
Vk1fVE9fVk0pIHx8DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZmZhX25vdGlmX2Z3
X2VuYWJsZWQoKTsNCj4+IA0KPj4gICAgIC8qDQo+PiAgICAgICogRkZBX0ZFQVRVUkVTIGRlZmlu
ZXMgdzIgYXMgaW5wdXQgcHJvcGVydGllcyBvbmx5IGZvciBzcGVjaWZpYw0KPj4gQEAgLTM0Mywx
MCArMzUwLDE2IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9mZWF0dXJlcyhzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykNCj4+IA0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9GRUFU
VVJFX05PVElGX1BFTkRfSU5UUjoNCj4+IC0gICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJl
Z3MsIEdVRVNUX0ZGQV9OT1RJRl9QRU5EX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgaWYgKCBu
b3RpZl9zdXBwb3J0ZWQgKQ0KPj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJl
Z3MsIEdVRVNUX0ZGQV9OT1RJRl9QRU5EX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgZWxzZQ0K
Pj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBGRkFfUkVUX05PVF9TVVBQ
T1JURUQpOw0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9GRUFUVVJFX1NDSEVE
VUxFX1JFQ1ZfSU5UUjoNCj4+IC0gICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3MsIEdV
RVNUX0ZGQV9TQ0hFRFVMRV9SRUNWX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgaWYgKCBub3Rp
Zl9zdXBwb3J0ZWQgKQ0KPj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19zdWNjZXNzKHJlZ3Ms
IEdVRVNUX0ZGQV9TQ0hFRFVMRV9SRUNWX0lOVFJfSUQsIDApOw0KPj4gKyAgICAgICAgZWxzZQ0K
Pj4gKyAgICAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdzLCBGRkFfUkVUX05PVF9TVVBQ
T1JURUQpOw0KPj4gICAgICAgICBicmVhazsNCj4+ICAgICBjYXNlIEZGQV9QQVJUSVRJT05fSU5G
T19HRVRfUkVHUzoNCj4+ICAgICAgICAgaWYgKCBBQ0NFU1NfT05DRShjdHgtPmd1ZXN0X3ZlcnMp
ID49IEZGQV9WRVJTSU9OXzFfMiApDQo+PiBAQCAtMzYxLDcgKzM3NCwxMCBAQCBzdGF0aWMgdm9p
ZCBoYW5kbGVfZmVhdHVyZXMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgY2Fz
ZSBGRkFfTk9USUZJQ0FUSU9OX1NFVDoNCj4+ICAgICBjYXNlIEZGQV9OT1RJRklDQVRJT05fSU5G
T19HRVRfMzI6DQo+PiAgICAgY2FzZSBGRkFfTk9USUZJQ0FUSU9OX0lORk9fR0VUXzY0Og0KPj4g
LSAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nlc3MocmVncywgMCwgMCk7DQo+PiArICAgICAgICBp
ZiAoIG5vdGlmX3N1cHBvcnRlZCApDQo+PiArICAgICAgICAgICAgZmZhX3NldF9yZWdzX3N1Y2Nl
c3MocmVncywgMCwgMCk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAgZmZhX3Nl
dF9yZWdzX2Vycm9yKHJlZ3MsIEZGQV9SRVRfTk9UX1NVUFBPUlRFRCk7DQo+PiAgICAgICAgIGJy
ZWFrOw0KPj4gICAgIGRlZmF1bHQ6DQo+PiAgICAgICAgIGZmYV9zZXRfcmVnc19lcnJvcihyZWdz
LCBGRkFfUkVUX05PVF9TVVBQT1JURUQpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+PiBpbmRleCA0
ZGVmNzAxZjAxMzAuLmU3NzMyMTI0NDkyNiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhX25vdGlmLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX25vdGlmLmMNCj4+
IEBAIC0yMCw3ICsyMCwxMiBAQCBzdGF0aWMgYm9vbCBfX3JvX2FmdGVyX2luaXQgZndfbm90aWZf
ZW5hYmxlZDsNCj4+IHN0YXRpYyB1bnNpZ25lZCBpbnQgX19yb19hZnRlcl9pbml0IG5vdGlmX3Ny
aV9pcnE7DQo+PiBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKG5vdGlmX2luZm9fbG9jayk7DQo+PiAN
Cj4+IC1zdGF0aWMgdm9pZCBpbmplY3Rfbm90aWZfcGVuZGluZyhzdHJ1Y3QgZG9tYWluICpkKQ0K
Pj4gK2Jvb2wgZmZhX25vdGlmX2Z3X2VuYWJsZWQodm9pZCkNCj4+ICt7DQo+PiArICAgIHJldHVy
biBmd19ub3RpZl9lbmFibGVkOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgYm9vbCBpbmplY3Rf
bm90aWZfcGVuZGluZyhzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gICAgIHN0cnVjdCB2Y3B1
ICp2Ow0KPj4gDQo+PiBAQCAtMzQsMTMgKzM5LDE1IEBAIHN0YXRpYyB2b2lkIGluamVjdF9ub3Rp
Zl9wZW5kaW5nKHN0cnVjdCBkb21haW4gKmQpDQo+PiAgICAgICAgIGlmICggaXNfdmNwdV9vbmxp
bmUodikgKQ0KPj4gICAgICAgICB7DQo+PiAgICAgICAgICAgICB2Z2ljX2luamVjdF9pcnEoZCwg
diwgR1VFU1RfRkZBX05PVElGX1BFTkRfSU5UUl9JRCwgdHJ1ZSk7DQo+PiAtICAgICAgICAgICAg
cmV0dXJuOw0KPj4gKyAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gICAgICAgICB9DQo+PiAg
ICAgfQ0KPj4gDQo+PiAgICAgaWYgKCBwcmludGtfcmF0ZWxpbWl0KCkgKQ0KPj4gICAgICAgICBw
cmludGsoWEVOTE9HX0dfREVCVUcgIiVwZDogZmZhOiBjYW4ndCBpbmplY3QgTlBJLCBhbGwgdkNQ
VXMgb2ZmbGluZVxuIiwNCj4+ICAgICAgICAgICAgICAgIGQpOw0KPj4gKw0KPj4gKyAgICByZXR1
cm4gZmFsc2U7DQo+PiB9DQo+PiANCj4+IHN0YXRpYyBpbnQzMl90IGZmYV9ub3RpZl9wYXJzZV9w
YXJhbXModWludDE2X3QgZG9tX2lkLCB1aW50MTZfdCBjYWxsZXJfaWQsDQo+PiBAQCAtMTA0LDYg
KzExMSw3MyBAQCBvdXRfdW5sb2NrOg0KPj4gICAgIHJldHVybiByZXQ7DQo+PiB9DQo+PiANCj4+
ICsvKg0KPj4gKyAqIERlbGl2ZXIgYSBWTS10by1WTSBub3RpZmljYXRpb24uIGN0eC0+bm90aWYu
bm90aWZfbG9jayBwcm90ZWN0cw0KPj4gKyAqIHZtX2JpbmQvdm1fcGVuZGluZyBzbyBjYWxsZXJz
IG11c3Qgbm90IGhvbGQgaXQgYWxyZWFkeS4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgaW50MzJfdCBu
b3RpZmljYXRpb25fc2V0X3ZtKHVpbnQxNl90IGRzdF9pZCwgdWludDE2X3Qgc3JjX2lkLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZmxhZ3MsIHVpbnQ2
NF90IGJpdG1hcCkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBkb21haW4gKmRzdF9kOw0KPj4gKyAg
ICBzdHJ1Y3QgZmZhX2N0eCAqZHN0X2N0eDsNCj4+ICsgICAgdW5zaWduZWQgaW50IGlkOw0KPj4g
KyAgICBpbnQzMl90IHJldDsNCj4+ICsgICAgdWludDY0X3QgcHJldl9iaXRtYXAgPSAwOw0KPj4g
KyAgICB1aW50NjRfdCBuZXdfYml0bWFwOw0KPj4gKyAgICBib29sIGluamVjdCA9IGZhbHNlOw0K
Pj4gKw0KPj4gKyAgICBpZiAoIGZsYWdzICkNCj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX0lO
VkFMSURfUEFSQU1FVEVSUzsNCj4+ICsNCj4+ICsgICAgcmV0ID0gZmZhX2VuZHBvaW50X2RvbWFp
bl9sb29rdXAoZHN0X2lkLCAmZHN0X2QsICZkc3RfY3R4KTsNCj4+ICsgICAgaWYgKCByZXQgKQ0K
Pj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsgICAgcmV0ID0gRkZBX1JFVF9PSzsN
Cj4+ICsNCj4+ICsgICAgc3Bpbl9sb2NrKCZkc3RfY3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+
ICsNCj4+ICsgICAgZm9yICggaWQgPSAwOyBpZCA8IEZGQV9OVU1fVk1fTk9USUY7IGlkKysgKQ0K
Pj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoICEoYml0bWFwICYgQklUKGlkLCBVTEwpKSApDQo+
PiArICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGRzdF9jdHgt
Pm5vdGlmLnZtX2JpbmRbaWRdICE9IHNyY19pZCApDQo+PiArICAgICAgICB7DQo+PiArICAgICAg
ICAgICAgcmV0ID0gRkZBX1JFVF9ERU5JRUQ7DQo+PiArICAgICAgICAgICAgZ290byBvdXRfdW5s
b2NrOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHByZXZfYml0bWFw
ID0gZHN0X2N0eC0+bm90aWYudm1fcGVuZGluZzsNCj4+ICsgICAgZHN0X2N0eC0+bm90aWYudm1f
cGVuZGluZyB8PSBiaXRtYXA7DQo+PiArICAgIGlmICggIWRzdF9jdHgtPm5vdGlmLm5vdGlmX2ly
cV9yYWlzZWQgJiYNCj4+ICsgICAgICAgICAoZHN0X2N0eC0+bm90aWYudm1fcGVuZGluZyB8fCBk
c3RfY3R4LT5ub3RpZi5oeXBfcGVuZGluZykgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBkc3Rf
Y3R4LT5ub3RpZi5ub3RpZl9pcnFfcmFpc2VkID0gdHJ1ZTsNCj4+ICsgICAgICAgIGluamVjdCA9
IHRydWU7DQo+PiArICAgIH0NCj4+ICsNCj4+ICtvdXRfdW5sb2NrOg0KPj4gKyAgICBzcGluX3Vu
bG9jaygmZHN0X2N0eC0+bm90aWYubm90aWZfbG9jayk7DQo+PiArDQo+PiArICAgIG5ld19iaXRt
YXAgPSBiaXRtYXAgJiB+cHJldl9iaXRtYXA7DQo+PiArICAgIGlmICggcmV0ID09IEZGQV9SRVRf
T0sgJiYgaW5qZWN0ICYmIG5ld19iaXRtYXAgJiYNCj4+ICsgICAgICAgICAhaW5qZWN0X25vdGlm
X3BlbmRpbmcoZHN0X2QpICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgc3Bpbl9sb2NrKCZkc3Rf
Y3R4LT5ub3RpZi5ub3RpZl9sb2NrKTsNCj4+ICsgICAgICAgIGRzdF9jdHgtPm5vdGlmLnZtX3Bl
bmRpbmcgJj0gfm5ld19iaXRtYXA7DQo+IA0KPiBUaGVyZSdzIGEgd2luZG93IGFib3ZlIHdoZW4g
ZHN0X2N0eC0+bm90aWYubm90aWZfbG9jayBpcyB1bmxvY2tlZC4NCj4gV2hhdCBpZiBhbm90aGVy
IENQVSBoYXMgbW9kaWZpZWQgZHN0X2N0eC0+bm90aWYudm1fcGVuZGluZyBkdXJpbmcgdGhhdA0K
PiB3aW5kb3c/DQoNCllvdSBhcmUgcmlnaHQsIHRoZXJlIGlzIGEgcmFjZSBpbiB0aGF0IHdpbmRv
dy4gVGhhbmtzIGZvciB0aGUgZmluZGluZyA6LSkNCg0KSSB0aGluayB0aGUgc2ltcGxlc3QgZml4
IGlzIHRvIGtlZXAgbm90aWZfbG9jayBoZWxkIGFjcm9zcyB0aGUgaW5qZWN0aW9uDQphdHRlbXB0
LCBzbyB3ZSBkbyBub3QgZXhwb3NlIHBhcnRpYWxseSB1cGRhdGVkIG5vdGlmaWNhdGlvbiBzdGF0
ZSB3aGlsZSB0aGUNCmludGVycnVwdCBkZWxpdmVyeSBpcyBzdGlsbCBpbiBwcm9ncmVzcy4NCg0K
SSBkbyBub3QgdGhpbmsgd2Ugc2hvdWxkIHJvbGwgdGhlIHBlbmRpbmcgYml0cyBiYWNrIG9uIGlu
amVjdGlvbiBmYWlsdXJlLA0KdGhvdWdoLiBJbiBwcmFjdGljZSB0aGUgY2FzZXMgd2hlcmUgd2Ug
ZmFpbCB0byBpbmplY3QgYXJlIGNhc2VzIHdoZXJlIHRoZQ0KdGFyZ2V0IGNhbm5vdCBjdXJyZW50
bHkgdGFrZSB0aGUgbm90aWZpY2F0aW9uIGFueXdheSwgYW5kIGRyb3BwaW5nIHRoZQ0KcGVuZGlu
ZyBzdGF0ZSB3b3VsZCBiZSB3b3JzZSB0aGFuIGtlZXBpbmcgaXQgcGVuZGluZyBhbmQgbm90IG1h
cmtpbmcgdGhlIElSUQ0KYXMgcmFpc2VkLg0KDQpTbyBteSBwbGFuIHdvdWxkIGJlIHRvIGtlZXAg
dGhlIHBlbmRpbmcgc3RhdGUsIG9ubHkgbWFyayBub3RpZl9pcnFfcmFpc2VkDQp3aGVuIHdlIGFj
dHVhbGx5IGluamVjdCwgYW5kIGtlZXAgdGhlIGV4aXN0aW5nIGRlYnVnIHByaW50IGZvciB0aGUg
Y2FzZXMgd2UNCmNhbiBkZXRlY3QuDQoNCklmIHRoYXQgYXBwcm9hY2ggbG9va3MgT0sgdG8geW91
LCBJIHdpbGwgdXBkYXRlIHRoaXMgcGF0Y2ggYWNjb3JkaW5nbHkuDQoNClRoZSBzYW1lIGlzc3Vl
IGV4aXN0cyBpbiBwYXRjaCAyIGZvciB0aGUgUlgtYnVmZmVyLWZ1bGwgcGF0aCwgc28gSSB3aWxs
IGZpeA0KaXQgdGhlcmUgYXMgd2VsbCBmb3IgdGhlIHNhbWUgcmVhc29uLg0KDQpDaGVlcnMNCkJl
cnRyYW5kDQoNCg==

