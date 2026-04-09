Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBbpIhJV12kFMggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:28:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B43C705E
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276713.1562041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjno-0006Cn-CN; Thu, 09 Apr 2026 07:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276713.1562041; Thu, 09 Apr 2026 07:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjno-00069q-9X; Thu, 09 Apr 2026 07:27:48 +0000
Received: by outflank-mailman (input) for mailman id 1276713;
 Thu, 09 Apr 2026 07:27:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wAjnm-00069k-Nn
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:27:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAjnm-00CV9g-3V
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:27:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d754ea-bab6-0a2a0a5309dd-0a2a450ab0d2-20
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:27:45 +0200
Received: from [52.101.65.71]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d754f1-ee98-0a2a450a0019-34654147eb6a-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:27:45 +0200
Received: from CWLP123CA0113.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::29)
 by DU0PR08MB8140.eurprd08.prod.outlook.com (2603:10a6:10:3ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 07:27:41 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::36) by CWLP123CA0113.outlook.office365.com
 (2603:10a6:401:5f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.38 via Frontend Transport; Thu,
 9 Apr 2026 07:27:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Thu, 9 Apr 2026 07:27:41 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS4PR08MB7880.eurprd08.prod.outlook.com (2603:10a6:20b:51f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 07:26:37 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 07:26:37 +0000
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
 b=oNGGWnYKW+dm8USChQ/J5hvNEmLayg5LviHct/PWVHU8Xva8/tnR9gxMaFmf/PyfuWXLqd688FLLd7z+43JUvkKTR+qYH+jYu1DitZLKFk2yC5UU+ME3cjD2QZTdajJtf7NPMxNwUdUkQFbH5Di8otjrTpmyrmsejp9n6xQ775x0t4cRFNJSMZTpI8a5XCH3yuL0orYUIXk1fAo8IVOHNHhzf6ulLSLQsXDvTBnDaDNyh9Rw7xrKBumvyypO2xFgBj++YURyp/4uqQemJCFEJFqixFOoh8Z09PMLCNkfp3QIHMQi+FtzTLw7WKCKh6CqCp3Mo352H1pVhYwsnyyXGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqTe4MyzhafXHEhy3dsJVbJEL4twwFvm0mo6XNeqAu8=;
 b=w3YsEeN+3R12+ilrYO9kMS7TEMbz35GiE8wmOpqmBwMvXLCW+PwXi0Mv8QIL1f4N4aXYMhnRJ8yDBGQJFftDX7F4IX4YtDFAC5L4eIwq+Lx24X/9uj9IqxBELYdRn6OZga0+8u4029HElh9CfF4dWwqwG3aCl+4gg37ifTxwWb9GkE9GvirT4mFQpaJ3a4W1/YAr75bx97YpOSfDOUWN5Z44sTXkydzIKs4km0VIDkd8jHHFhE2+bGBX9zmetu6d1lINT1xlAksyTphMbCux9EUcoxxwzoiaSNhQWd9tNxy2Fr3m90giYY27M0qhAl18BU4jSKtgtNQ/xbx5MZLbig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqTe4MyzhafXHEhy3dsJVbJEL4twwFvm0mo6XNeqAu8=;
 b=GrpXA+BqMVtBYWJTZB9hl+ztsfzuPaUQUQVBcep1GQqgHD8md35/sm95tjo+M7llycki452/Unzv/eA2eRt4IPMJ2OaSDiw5RHNmfUiE82mfcJC/0dpCZR8CrZHMj5K6Tc2YraCRjv/1yBE2Rh43wjMKB0p+yenSNsbFU11AzAo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJPFEBLU+V0XX9NBINuhKbmEj9of9t48FisF6Yf5Mp2QTmIF2BP4JCgzPDB347duzdmQIssxMciurblOR1rxtiSKhS91zJcQ5UVkofa4ScYDtOs/mdMtw3YYXgQvNhgUbEAxwKZcTZOKauDvbF/JK+x77SG/6i34H/Op2O1Qp0fuhb88OJAUFoTTcFmz+JbMcDWaep1672JGIKhGcMgADKwzQrz9y/fVg7JlaWCWOi+iMrgu5EhHsCrKpYuXyty4cX/jsvnokE3RaRqD0tbeAuTUFhYPjZYHStURkaUeGkMVOz2EV2HokNkEQobqHoBdt/VXop1fAcHIymVpxgNH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqTe4MyzhafXHEhy3dsJVbJEL4twwFvm0mo6XNeqAu8=;
 b=XK0jFilXrRLypUVsvo4bpD6A4z5UaDgpKlzH1dNilsAzByt3gEDOaT1Ocdkm+QCe5HQMrxr2gKpaEfDUcPtGIbgQTYFff2NPPFulncuEddpj+h3oDTh3m//xbc3QZ489gKk2ND2PaQBnMP6Y8xwZU5wrqM2sM6xGhzrghADtpUcQyaRFi29W7u7YfRizC2ml7oYiO0w6pZdR1ramrEuJ7I+1QW8cbT7RI0fNKCnDXgxtiZMr9A+4dzYYdIohgqTUb+uNWTgHMYsTAeicA0WzuaVjgg5fS/DAWgwQ67Rs38qh2/qdod7PwaAwHiuR0qjDUWsXwcvsXWeLBY2tcHkcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqTe4MyzhafXHEhy3dsJVbJEL4twwFvm0mo6XNeqAu8=;
 b=GrpXA+BqMVtBYWJTZB9hl+ztsfzuPaUQUQVBcep1GQqgHD8md35/sm95tjo+M7llycki452/Unzv/eA2eRt4IPMJ2OaSDiw5RHNmfUiE82mfcJC/0dpCZR8CrZHMj5K6Tc2YraCRjv/1yBE2Rh43wjMKB0p+yenSNsbFU11AzAo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] make ioremap_attr() common
Thread-Topic: [PATCH v2 1/2] make ioremap_attr() common
Thread-Index: AQHcx/Izziiqdxydn0S4hdbQtQOHzg==
Date: Thu, 9 Apr 2026 07:26:37 +0000
Message-ID: <DF8F0F78-1DBA-41B9-8055-4CD3622F6929@arm.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
In-Reply-To: <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS4PR08MB7880:EE_|AM3PEPF0000A79A:EE_|DU0PR08MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e46de11-50ab-4c59-9cb1-08de96097c11
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 qCEy6TVVhYhV9GSpdhUtsSj7gPwGnt443MFWQNBNuD7Ra5ByVIHol3rpoN1GfMEwiYx3MAZ5IgGvXp/ibeH8P9TRkD3zS/5i6zQzhloeSUlnn9877hQiAuqIQisiwX6ijnLvW3GumBHyo/GW9kaHP0CyduMRPn+KqFcxwRvgrxi8vWibMiE+wc5OAVb9j6/YXauGe8MxPp6LO/pETFu4XHy/j0LMF0ZXFGh2Kc3ieL2LNsmmursVURlkKbbDtAO1soO6rEj+lV7iDQJbZkawxQIrL6dcWwqQjjg2pa+HUVceOI7vdnyxtQiZMgxCrM6KyTvVgxccLORNvlDb4l77AkNscUPgqMZHzrIwVLxNiOs6MUA+PLOCWKuGhhPX7z/QMGcceju9jdEQU1GO/btDp2887+EhfqkuBx6AYmPKwEalZdYHJ+Bb/romYZIQThLLYjB8yxjzO02a7XPjDr3IUbXtXMoLuLy4CWozNMcc3elhJQZ7KpDfFEEXQ6/t5ssJ45Jp8JOyErCtso4OaE85Cp/BrRfJSoFbv7e+UBkj1eI7pb5HW1yPgG2dH2WkzzWY62QeU+eJuMw70SPzFL0MG1z6ADT1r4Per1FJ5TsFztAfo2U2QpdipQAP2bSmPAi0LSV+j4iYZaaIc1oZUI1fLIJmhnsC0TImJuNxAsa2a2JbL90N/+S3B3eD464uzASVCjC+8keJKz2w/mytAKJn0rQaLyKWVUz8KmUepbV+YwHMK/jUg1gASREs7QGwlR9HVg9X290XLjIUHXMABAYi9I4hkHLSinzWL5JjacePQSc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FD6DB0EC9F36A42883C2F082658814B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 YgKE8NtkkRHVYswWlhUjfmv5v2zA965CsnFZWu+oNu11gDVlsQm0TRk79focmuxYMxQu5YVhfDBWRRhKwM1OTRo/lVIUTynBr/K/Nx5pokRXD94XruV3xe03uEujqP052vpeoCNdBESujlq0n9oZCMnA/QFmcA5BqpitFKSF2F92BV6UTj/xHrPhCXvNCQyRvZ2wf6Ll9698cPkv5bK1Nrk3TrD/knzP+l2TluLJve/4VOVxupK/Ztl5cxBk2HhBGlsVFdSMR7kLlXz+xh9GkcGlRFVk8iB5iVAGheOY6gJB6Y80940OmaUgJkBsFAwMBZdsKa7DAvEKsMabfjpStQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7880
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e143142-5295-4f47-9410-08de9609562b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|35042699022|7416014|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vq4NcjtIxXVB2R1vFkLrlQYV39uj4NFcz8C08xmU8J0wpO7wLi3iGuFsdgxAL6dOxbtdFov6+WgOueElB1+gdcZIOlGVRWcNLDg2wVVSm/WZiyQu1NEnu6S3Lx2FB+MEGrlGY7i90qqFNo6jfjThaS+tXQE6Np2fkUdhWHIgx648qLy8yQ1LYEDJ7qY7hI5XU/NAkWDDlehh4N1V4Mu2P892f1ux7v5W5QY6XW2h1+WMteItlLncS/nUME66rZyejr9roVJlnwg8AdaI1d2td6m8RegmlAgLCYEfB9lsHgH4PPDUH5y5ws+xVaAB45bN2T7f87qT/5Hg88lA3p6Jv8ZTCYGkWLXA+0t5pmOtvAOECNsSYoA62cJzyRJqcLHALXtnGQ9bVZ7O6e7HZThrYWFfARaDbizyiFBaBkzT2epjk6uJwUS04tSl+zwd1cz5HQ4YXS3GKl8ktDLrwgd2hrmO6Jtsqj5b86y/fro0Laqd3nUc2J9oSUbl6o4giyIrOOvQSkGIWd4TGAnLZawqqldHuyYOUHkbAhOkKOIdifJNsBRPdDSQZVxnYp03uY3sOQeZXFFhXDXRdwU3b11nPrbuJ1L7AF9qW1nX1ZnXIHoBSCjxkbgGSLKYGn8BxKLOCnuXiouMNW9tMR+WNCPVgRWWUs1EHOynjSn2jd/iEpjii6gPS8B/5K+JAjcD26JwmbxqBewVEk3UeqsAxchYHjfYCJ3WIewbJ/aBxX7L0dcomKqvwB+NiYa2fXK37K76ZJKV32XRwIb5lSvr2gzhyg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(35042699022)(7416014)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PAuJQuo4cfjZSWsssFtBVAHoWUNlQpGK6K6dXP+py+gx7BltKTbKwaA6k+udqEXKOGnwgjcpl+JUgQiEgKz5oudT1t2YcszRZZJuXVYnBKg8Xi7dibGearHE780Nsmy9YJ1WpykGy5RLUqSFNRL9h8TU5s/RrRU9wXK6Rq5wCd+id4cjlaqFF4N+rU8F5zoLRCp/CkVCxEkq8Inasoa2CCR9H9QMdRLm/+7oABXPSiFpX68h77StiufE8zuJZNijb2Acp9CiDt7BKQva+PknJDDfsTsISCRWsKs/L6wfDrhkvazCDqSyUJ9fBXKyjfyJgOtOEgfqTnKJaq5xjkT+DAvK0legawgz1I9/N0IySu9B3vYEFvnjIELpAQTHUa6LQN3ik95/bGOljvKm+bIyLzbioOfrxiwaBSeFgvwQzGSyVramwVqR5z9Vg+pGT2Hq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 07:27:41.2475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e46de11-50ab-4c59-9cb1-08de96097c11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8140
X-purgate-ID: tlsNG-4011c0/1775719665-BF9440B1-7EA75923/0/0
X-purgate-type: clean
X-purgate-size: 3080
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:Bertrand.Marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: B91B43C705E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQo+IE9uIDggQXByIDIwMjYsIGF0IDEzOjA3LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gVGhpcyBjb3JlIGJhY2tpbmcgZnVuY3Rpb24gaXMg
dW5pZm9ybTsgd2hhdCB2YXJpZXMgYWNyb3NzIGFyY2hpdGVjdHVyZXMNCj4gYXJlIHRoZSBhdHRy
aWJ1dGVzIHBhc3NlZCBhbmQgaGVuY2UgdGhlIHdyYXBwZXJzIGFyb3VuZCBpdC4gWWV0IG9mIGNv
dXJzZQ0KPiBleHRyYSBjaGVja2luZyBvciBzcGVjaWFsIGhhbmRsaW5nIG1heSBiZSBuZWVkZWQg
cGVyIGFyY2gsIHNvIGludHJvZHVjZSBhDQo+IHN1aXRhYmxlIGhvb2suDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IC0tLQ0KPiBEZWNsYXJh
dGlvbnMgKG9yIGlubGluZSBjb3VudGVycGFydHMpIGFyZW4ndCBiZWluZyBtb3ZlZCBhcm91bmQs
IHRvIGF2b2lkDQo+IHRoZSBuZWVkIHRvIHRvdWNoIHNvdXJjZSBmaWxlcyB1c2luZyB0aGUgZnVu
Y3Rpb25zLiBRdWl0ZSBwb3NzaWJseSB0aGV5DQo+IHdhbnQgdG8gY29uc2lzdGVudGx5IGdvIGlu
dG8geGVuL2lvLmggYW5kIGFzbS9pby5oLg0KPiANCj4gT2YgY291cnNlIGlvcmVtYXAuYyBjb3Vs
ZCBhbHNvIGdvIGludG8gbGliLy4NCj4gDQo+IEZvciBSSVNDLVYgdGhlIHdyYXBwZXJzIGxpa2Vs
eSBzaG91bGQgYmVjb21lIGlubGluZSBmdW5jdGlvbnM/DQo+IA0KPiBQUEMgZG9lc24ndCByZWZl
cmVuY2UgYW55IG9mIHRoZSBmdW5jdGlvbnMganVzdCB5ZXQsIHNvIGdldHMgb25seSBhDQo+IGRl
Y2xhcmF0aW9uLg0KPiANCj4gRm9yIEFybSwgYSBUT0RPIGl0ZW0gaXMgZGVsaWJlcmF0ZWx5IHJl
dGFpbmVkLCB5ZXQgc2VlaW5nIHRoZSB1c2Ugb2YNCj4gaW9yZW1hcF93YygpIGluIGRvbWFpbiBi
dWlsZGluZyAod2hpY2ggYnkgaXRzZWxmIGlzIHF1ZXN0aW9uYWJsZSwgc2VlIG5leHQNCj4gcGF0
Y2gpIEkgd29uZGVyIGlmIHRoYXQncyBldmVuIGZlYXNpYmxlIGFzIGxvbmcgYXMgd2UgZG9uJ3Qg
aGF2ZQ0KPiBtZW1yZW1hcCgpIG9yIGFsaWtlLg0KPiAtLS0NCj4gdjI6IFVzZSBjb25kaXRpb25h
bCBvcGVyYXRvciBpbiBpb3JlbWFwX2F0dHIoKSdzIGZpbmFsIHJldHVybi4gUmUtYmFzZSBhbmQN
Cj4gICAgbGV2ZXJhZ2UgdGhhdCB0byBzaW1wbGlmeSBpb3JlbWFwX2F0dHIoKSBpdHNlbGYuDQo+
IA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaW8uaA0KPiArKysgYi94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vaW8uaA0KPiBAQCAtMSw2ICsxLDggQEANCj4gI2lmbmRlZiBfQVNN
X0lPX0gNCj4gI2RlZmluZSBfQVNNX0lPX0gNCj4gDQo+ICsjaW5jbHVkZSA8eGVuL21tLXR5cGVz
Lmg+DQo+ICsNCj4gI2lmIGRlZmluZWQoQ09ORklHX0FSTV8zMikNCj4gIyBpbmNsdWRlIDxhc20v
YXJtMzIvaW8uaD4NCj4gI2VsaWYgZGVmaW5lZChDT05GSUdfQVJNXzY0KQ0KPiBAQCAtOSw2ICsx
MSwxNiBAQA0KPiAjIGVycm9yICJ1bmtub3duIEFSTSB2YXJpYW50Ig0KPiAjZW5kaWYNCj4gDQo+
ICsjaWZkZWYgQ09ORklHX01QVQ0KPiArdm9pZCBfX2lvbWVtICptcHVfaW9yZW1hcF9hdHRyKHBh
ZGRyX3Qgc3RhcnQsIHNpemVfdCBsZW4sIHB0ZV9hdHRyX3QgZmxhZ3MpOw0KPiArI2RlZmluZSBh
cmNoX2lvcmVtYXBfYXR0ciBtcHVfaW9yZW1hcF9hdHRyDQo+ICsjZWxzZQ0KPiArLyoNCj4gKyAq
IGlvcmVtYXBfYXR0cigpIHNob3VsZCBvbmx5IGJlIHVzZWQgdG8gcmVtYXAgZGV2aWNlIGFkZHJl
c3MgcmFuZ2VzLg0KPiArICogVE9ETzogQWRkIGFuIGFyY2ggaG9vayB0byB2ZXJpZnkgdGhpcyBh
c3N1bXB0aW9uLg0KPiArICovDQo+ICsjZW5kaWYNCg0KSSBmaW5kIGEgYml0IHN0cmFuZ2UgdG8g
aGF2ZSBhbiAjZWxzZSB3aXRoIG9ubHkgYSBjb21tZW50LCBidXQgdG8gYmUgZmFpciBJ4oCZbSBu
b3Qgc3VyZSB3aGVyZSB0aGlzDQpjb21tZW50IGNhbiBiZSBwdXQgb3RoZXJ3aXNlLg0KDQpGb3Ig
dGhlIEFybSBhbmQgY29tbW9uIHBhcnQsIEnigJl2ZSBhbHNvIHRlc3RlZCBvbiBBcm02NCBNTVUs
IEFybTMyIE1NVSwgQXJtNjQgTVBVIG9uIHZpcnR1YWwgcGxhdGZvcm1zOg0KDQpSZXZpZXdlZC1i
eTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPiAjIGFybSwgY29tbW9uDQpU
ZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4gIyBhcm0sIGNv
bW1vbg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

