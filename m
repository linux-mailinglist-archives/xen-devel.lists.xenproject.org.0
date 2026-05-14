Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ACwAusEBmrFdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 19:22:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF755452D1
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 19:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309122.1580263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNZl6-0005M8-8x; Thu, 14 May 2026 17:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309122.1580263; Thu, 14 May 2026 17:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNZl6-0005KK-5t; Thu, 14 May 2026 17:22:04 +0000
Received: by outflank-mailman (input) for mailman id 1309122;
 Thu, 14 May 2026 17:22:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNZl4-0005KC-E6
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 17:22:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNZl3-00Ar02-Md
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 19:22:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0604ac-5cb7-0a2a0a5109dd-0a2a4505b656-14
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:22:01 +0200
Received: from [52.101.84.68]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0604b8-aaa8-0a2a45050019-346554442f43-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 19:22:00 +0200
Received: from DU6P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::29)
 by DU0PR08MB9512.eurprd08.prod.outlook.com (2603:10a6:10:44c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 17:21:56 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::d) by DU6P191CA0058.outlook.office365.com
 (2603:10a6:10:53e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 17:21:56 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13 via
 Frontend Transport; Thu, 14 May 2026 17:21:56 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DBBPR08MB5913.eurprd08.prod.outlook.com (2603:10a6:10:20b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 17:20:54 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:20:53 +0000
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
 b=ggME/fFaEXIX9sCOD/K3awz5FQbb9DJRIkPqofGPjTnKYnuV6g30NBA8YEBpcCYV1FmUcq37xhCAhGSTS+ggT5DDD15346zA5acjhZpkth17OdE1kLL1mexp9e/Vv/wH/XODvint6HOprM9Z9T1ypvIaQLmv1hT10GwzuOwz+j6SQ01ElrGPg92BHmqrmh7+J+FOzEGOEBJokKd5ljnZ2cTgAS7amp6cUDo0/zVlH3i8LELfaO6sN03xrpFSwhfxjNwi+ROSNGa9+CGEC7GDq8Ue3OAQ5neVCOj7sbx3ORBq+FWEkDdNVnSZE7zg7RPeiCIgPUKDlxd6NwBIhXPHKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0emeo6+8Y3nQwRjlJPnfCGtFv/1dOiWJsAIsXGNXnoo=;
 b=YZNSF444O5KVHdhhHpQu3b/l7RlqWS1Szzfzbzl7SfX8EgUiSIEYOn2wQ+XOwBa1LGohes8t3nnIRokSOaAvXRJF0OAh7V8lFh2ytGBh+tc1YuhhYkx4VHY6socBTAbdOep/YUOFQHzM6Ts69kDjI9EjMFDYDRhxHvtzRSOOiqrFcXmPyk23CUIe/e9n3+AqNhLeSE7thQqb/rzoiU9+MK6RRDgYPJ4pSU0+xBGpyjyfx5+A8UPCBmofM3W6mu6IuHIXyefcqeYJNhqlRqdX1C7ggKwrUr3VLfQnlL96shgYCJSd0zMfdmItEB1Pbo8ICS85Ep2WP8iio2NAOUsmUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0emeo6+8Y3nQwRjlJPnfCGtFv/1dOiWJsAIsXGNXnoo=;
 b=kZEs/3tMeb0yn5q3lUzwX4BoSXOxLd9mt1ndlq7OB7FKaGb8Ck5qa/kQ7DhXTaP0srvxsnbFUHtNkqXjR0SNMQjk0GSrZz3FKd1dESVWi9MDPvsYpV+FpNu1jWU3dzMVd1jWCs81BTGq4cw5MSNBxoSt118xpdi3rPoKFX0WAmQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbT3WnIJmGz+YuG5JdcO2+RS/ySfD1E1wPbKnWTUL4lrkbSbHakoEN2fmNrCrYChD+EDJI/hxs5GyaGdw/Z+ZQH5buSIh3+b3ZylVWy5q7/FwJ98JH82X11M0PaLlg9EKNYJ0LVf/51auTSl73QH/NwyiCuc27X6tpQXcFz9E95EgCUwwRITuSdqyLOyfhIr1sAq4HDllbCsng4Wjdya2v2ZIGJllfoGLKLjn0RF2tTerraLVDqsT5v+tpU474L2jwicq//dUMK1qZoFRwM4M7gS/6MHvlVb/RSxt5zL+wOi5H4eIY8wGOuQ3utaRvwUzhu8i6I7hRZdjSA6DB0vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0emeo6+8Y3nQwRjlJPnfCGtFv/1dOiWJsAIsXGNXnoo=;
 b=IF4mW8y2WA+MjoP8/LXc1d4ikanwqtJNP/YoRIKvxDTlEzL9ZqV0wHYzlAwjFY+fqHGDk2uUK9lloHzyOJc9sQ4Ra82XkJzS5so2cFG7V01q3iTVxnxlHdNFiSUyVd68I5HzmxYlYiNo8ACXLZHONGvqzJamA+r+sHaL947PrinmVHcbyiZsb/57ukGZJ2sKzuxbxi4NsQYiJN0JZJ/PCPXzt0gTqLb2u2XsCCL26gTf+SplIrtpTowhVqkNgtAq40XgCRfjG295AhM/eoh/SdqxtALTg9GiY1aLX67SMTbm7ruTaMt+kdP3Da5OzkYm+DpfCqUzOonI5ZJ1MoPtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0emeo6+8Y3nQwRjlJPnfCGtFv/1dOiWJsAIsXGNXnoo=;
 b=kZEs/3tMeb0yn5q3lUzwX4BoSXOxLd9mt1ndlq7OB7FKaGb8Ck5qa/kQ7DhXTaP0srvxsnbFUHtNkqXjR0SNMQjk0GSrZz3FKd1dESVWi9MDPvsYpV+FpNu1jWU3dzMVd1jWCs81BTGq4cw5MSNBxoSt118xpdi3rPoKFX0WAmQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v9 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Topic: [PATCH v9 10/13] xen/arm64: Save/restore CPU context across
 SYSTEM_SUSPEND
Thread-Index: AQHc4jI1kApzK9pOoE+jepD/YgGe7bYNx4CA
Date: Thu, 14 May 2026 17:20:53 +0000
Message-ID: <7254EEC1-315F-41EB-B623-5CACAD7255E9@arm.com>
References: <cover.1778605274.git.mykola_kvach@epam.com>
 <46bbc9e008a65dd86fb2b368e4751eb7d2014afa.1778605274.git.mykola_kvach@epam.com>
In-Reply-To:
 <46bbc9e008a65dd86fb2b368e4751eb7d2014afa.1778605274.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DBBPR08MB5913:EE_|DU2PEPF0001E9C0:EE_|DU0PR08MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: 56cbdb84-6a9a-475d-b7c5-08deb1dd4c6f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|11063799003|4143699003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 iV2q+I3QUv5fk28XAAvDzX/ZBo5NZdB61vgTHib5TFfuIddiXyLi/aoW1deu1rPjLHFydpyY76HsYs4ow64j8ZtONvjW+Aib0jo6nEAKxj0BnMy3R0e1FZZyJSdFO8J8D7Yk5plGDHV5dBV+/JjhlaaJQOi4o/79Ral9C7OyvLBHSqXWiOqwaYoc/c+sqj/hxOsZXPtWK6HJkKuiR/q4bOV3L8UH2MRPJany4tcsBy/73PvT//6+NaZKXlbs/GV7gvVnDEeFqEvKPzNv886zn8FA/lK4JLZfBofTtnjwNjy8ePL2XzQRS2cLx8waD/ChzR97u46y5X0pQh6AXJzwR0GTyrfv+O4yG8v5HKZuFoScF8hejvR0Lmt/Sv9Xt1Afi1m1AeQagTkmkATU4sv3JX6MffAW3Z7vs6D+w5EeM+GUB3/ZdObu/WKqz4SkFDy9536jM0koX9SsYBDUvP+mg6otAo4Od+hQjGsF61F92ZIl3lzO6fP8ymu1+KYyUzht8XXBJCkyqb4D4m97wmq4WwZQfLIAp0KcmicyiKvE8oq3p2+g+Cy/WEhwNQaWtnD9+w36b0R9biHUU5+E1d/H5wHiWpZcVWBsTIcfUm3YwEkRsdIEt/q2ZnKmh+rPSmq+lm+cq7D5JoP5Ssm5wFnli6YLttXVYiL2aCHpSPjtbQd35vY4OpaxcuQhcF2D+bvAU5ATHVrex6as32Y0aVpXHM4MGcL9saoL65FpS6bVmgsE/LSB+KU4Yxya+7e3ftA5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(11063799003)(4143699003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F326A2BD5F753342BA7B9A8667732DFA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 fxwNzSZCy8/bjIOZnee2L0WKQUkUsYZqFUZF7F8ypz8S384NL1CzW8YXC22Hzw/YbsWcf0AsMgt77kM5gZz5SuDzJwnaK9Wo9nB0qXUYoVb7UnOXphsD4EopVt5PFaYidH4OCYEdQjJavAuJjLlxuqCqH4IFUTea5o7ByzMYKGCxmTN41WKaIDHT4X8vTAnC83ihCGrM1ew93jcz+VhbZZuIaxqyvGIb3InvCYgOWdaBYTYgQtkbEC58BN2nG+YLajK+KuvYY6o7neXLixzhJ9YyKnK13OLuiCuZ9Ew8vtJAaw0n1XiKIZgEAWHcz9EI0DBbP69b5IwtYMy8yaxoBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5913
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f22a5068-0fd9-4378-4737-08deb1dd274a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|35042699022|36860700016|4143699003|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	NKKqf9rRqKs+YrZL8wt1PZIXCfaheDv6/JzxbYJBDG/bdCBDTt6N1p5EXSZSNPELNHp38lHghBfoMSp0WgSx8gS0azmC+Gba8Wh95QNWf8Uyp3t5RGEcftkexE+F6+aky3aprQKXnWEbK+mZJbyInUbzZ3Z7tKkJI7eqnjBsbvRPt3l75LiJRpfQtRqj9Qwy3wDJa08pHgHwQJartmEvYHnpCdg4W4jiLIMrpzb5aWF5Jq4W2DF133OqNi99D+u8sUKPd8BQ8pUX3AKgny11IUwiqnCfQqBykzV5WJ8pjt7IV4EOadpZRRnDj6HxOwUizNulaTUhdZJnZhQrDmud79ETVYk3vzGN+FJuUwB49Lsx63782eJXeDaYEfx6lGIeBNTFm/T9GH2t2zjr+rOApYgEvS2VHz9a/5dQNXwVO/rcLnecT7yvl4yG691n1P/yXw9A0yMAST6zSCLrKGPMm4J18MxOxSzxYjhwNg4Rb9a+l+pati/NSJePQz0evg1cJUYpAFfdnAM27oo/6vpvxo0BCMESFacAiqsmnofOUYCD03sTued+T78PmZU6yquqNA9wRKFsgSUtKSW5tnYCxvzKTAXqCqY/rYs08RWlcINd6gxXCGvkynR+ILQfaOB6RyognM4oNqu8bFywVDD80i7ON2vMs+KPb+A4RoTJtDAsH0e6RAKXF5aXiNbydADUB4CclxBNRfWTNgp8RrW0cmW3Yiee0FTn7ua0Fb6htkE=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(35042699022)(36860700016)(4143699003)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9484AUT0ANkcDPljl5O3Tdx3nvtyi4DqKaJgDbxyweJ3fuNMN+D8yy3o79ar8lXVzJQz9Hl/6g1hlOYuBp5sLhUexlG6SIG6qygmXeq5QbSKZAFIXb81fSKRZAgozokfuhWUU8ThwDi3xxXPdl+wMFGFyELUi4ZUzWrP/L3vma0bvxUqCyYae9Qu5vl/EQZQrmqR2R5zDS6sz6H4i9LLP3+25aROKa2Kkwy5O4xmPsONbp6dooZqCOFSguuf4tb3/E2+WiGoFtUQCiIr0ohCcR54kIvBAtr6sQswwJjcCxq70m1YoB90WXc56oQ4bd6JR4v0DyYzbSleUMbL6oM/IsVtdv1uFXCok9Rm3p5AXRY53UMzyrj+Zs6j3TIwYHWYvBJ+7K7+oGF6R9fKLR5aiHu1Y9PmRlDv+GvirIHuRB2G4Q2sy91Rn3gsbKoyUBUm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 17:21:56.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cbdb84-6a9a-475d-b7c5-08deb1dd4c6f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9512
X-purgate-ID: tlsNG-c201ff/1778779321-D3B60443-7AE8593F/0/0
X-purgate-type: clean
X-purgate-size: 1969
X-Rspamd-Queue-Id: 3FF755452D1
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

Hi Mykola,

>=20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * int prepare_resume_ctx(void)
> + *
> + * CPU context saved here will be restored on resume in hyp_resume funct=
ion.
> + * prepare_resume_ctx shall return a non-zero value. Upon restoring cont=
ext
> + * hyp_resume shall return value zero instead. From C code that invokes
> + * prepare_resume_ctx, the return value is interpreted to determine whet=
her
> + * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
> + */
> +FUNC(prepare_resume_ctx)
> +        ldr   x0, =3Dresume_cpu_context
> +
> +        /* Store callee-saved registers */
> +        stp   x19, x20, [x0, #RESUME_CTX_X19]
> +        stp   x21, x22, [x0, #RESUME_CTX_X21]
> +        stp   x23, x24, [x0, #RESUME_CTX_X23]
> +        stp   x25, x26, [x0, #RESUME_CTX_X25]
> +        stp   x27, x28, [x0, #RESUME_CTX_X27]
> +        stp   x29, lr, [x0, #RESUME_CTX_X29]
> +
> +        /* Store stack-pointer */
> +        mov   x2, sp
> +        str   x2, [x0, #RESUME_CTX_SP]
> +
> +        /* Store system control registers */
> +        mrs   x2, VBAR_EL2
> +        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
> +        mrs   x2, VTCR_EL2
> +        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
> +        mrs   x2, VTTBR_EL2
> +        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
> +        mrs   x2, TPIDR_EL2
> +        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
> +        mrs   x2, MDCR_EL2
> +        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
> +        mrs   x2, HSTR_EL2
> +        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
> +        mrs   x2, CPTR_EL2
> +        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
> +        mrs   x2, HCR_EL2
> +        str   x2, [x0, #RESUME_CTX_HCR_EL2]

Do you think we should save also CNTHCTL_EL2? Apologies it escaped my first=
 review,
but I see we program it in the boot cpu path + secondary cpu path: init_tim=
er_interrupt().

The rest looks ok.

Cheers,
Luca


