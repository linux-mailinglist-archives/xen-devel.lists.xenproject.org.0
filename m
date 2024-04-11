Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBBF8A193B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 18:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704062.1100182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwrq-0006Nt-Dv; Thu, 11 Apr 2024 16:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704062.1100182; Thu, 11 Apr 2024 16:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruwrq-0006Lc-As; Thu, 11 Apr 2024 16:01:38 +0000
Received: by outflank-mailman (input) for mailman id 704062;
 Thu, 11 Apr 2024 16:01:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RFZQ=LQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ruwrp-0006LW-Kx
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 16:01:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65ce536-f81c-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 18:01:36 +0200 (CEST)
Received: from AM6P193CA0080.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::21)
 by VI1PR08MB10031.eurprd08.prod.outlook.com (2603:10a6:800:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 16:01:06 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::ba) by AM6P193CA0080.outlook.office365.com
 (2603:10a6:209:88::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 16:01:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 16:01:05 +0000
Received: ("Tessian outbound 7b505d68bb66:v300");
 Thu, 11 Apr 2024 16:01:05 +0000
Received: from ed2233b66f89.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 63F95F52-3AFB-45C3-BD82-6284675F123D.1; 
 Thu, 11 Apr 2024 16:00:58 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed2233b66f89.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Apr 2024 16:00:58 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6613.eurprd08.prod.outlook.com (2603:10a6:20b:339::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 16:00:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 16:00:55 +0000
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
X-Inumbo-ID: c65ce536-f81c-11ee-b908-491648fe20b8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=L+kHMwnbTUTOa+20YuAEjV2M1hLY3I4Etg571trtUtooDpeqbkfHtYH4H+M1eRo59CNgShEIOymtQU6cAv4iWFx9tyqM2i3H8hVtk+agvwvXSNc9DYUZTFV38SD0+48Gc3beSGBS2NBEdiMDp3oEoUf5kkPmUuZxz7Ii114QqXqGRssKIdlkGhMjrUgghxvmEb1Tjw64MgbhTqasZHyZX/SteG3ICWNjMDq8e54Kqm2vQIiK/aqYwP4bomWw4S99XJ+fa/JwnnRU5749MNOAAdcxZckfmjKHzb95vhtrN12d9c55mEDyoIoT0lC4YHUMjhlmG3o+mQbO/HDna8EoqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtFg4TLnwdiEGcWJIAYygZEjvYZ9om1IFUDvILgfdMw=;
 b=QZHW4FXjGoiwruAcbVxagbMDqRSUUhiZ9g2nKwZYKiSLNJcsbnvW29SZOuRqVYcOprKPQYcW4ijfJsDbJZfoUl3Dw+XDriKjGouV/0kniktOzueAap5HyVobzbGbNZegivT0Gff47PmQr3lbJ/+WIXSqm7pKUsCLibr3UQJjKPh2YKvH2Cba0eG57mhYa5VCz/AemICbpREbFPzIx2z+zK7iY3T3WPfLcQT/LxP87E16RQ1MQ5T5Yg/xr06Jl3VALx0RZKXoxCdY+7p/SPl41b2pPIkOZ9cYdf/NZKi5jArg1ksX9aWKKdZwIrw94oHO8557k4nU1haRYv+vL5jSTA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtFg4TLnwdiEGcWJIAYygZEjvYZ9om1IFUDvILgfdMw=;
 b=O38tEIIRq8SNsJ7mz8ZNWi63gJpck1laO3HPvrvSllYU1sccU4V837Nf40/TiVQDdma2kfXgBkdTcKzSI7GRrtTQSxWaSXjZ4+CrvonRVlMv70L44QLAw35N5yx5U2w/JbE6IYKIj2xDKUzF1s0VXoDBBuS45nZnH9aJcr9os8Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0a9dba7193662cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOsVn+XsQdeM6rEl5L/gzGqbTR8Bri0g2qLet8GAgY/YSzIe+Xmp51hHM0fOMM7Fad6Zx4WBjEjii9eEsA3gXa2CZZ3e21WjXR5BQ6UVg1ywgCtQCXGoC0RA7j4TsWQbuBGaQcHttNQD2CIKKGoeO6nlnsGIZ8o6GIWes03JT1rKepI+xDFkayD+2oP963SKReAChMplHDrf79Jbq2vBIdbixvfMp2+SvDyy214hB27LTlXoaq7KVDYbwpR9mPjGYjezSg0hR+qlY6QYys1OkljV5FAVpWRPpsVddOrSUZvCelGLtFXTalraaltxVvHj8rxz4DS+JL6IQZicN8OSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtFg4TLnwdiEGcWJIAYygZEjvYZ9om1IFUDvILgfdMw=;
 b=lG1JxNarCbMGGmobmkXdLMYZnO0xyK+HT+gCamim+qyB3Q1+Rx5oIW9LzyOIEPFKf7b2MnnMyF/htJPDAVGvV9xWKgCr3eazzKurI0YOvYe7fb8j0+19DuDjxDwplTb80hKUsNABNfbHQ/4mG+X9oX7ZbOmjH1GNVP61qrvFaWskk79VWAUiWBL6aUpLUzCkppC02ltCkyBquCKKlPK0VsL5/aOZDHQIAVYioMY116xWAd8A4nVDSS6v/yU1cOswe0C3AT27tVgCwS5zVQO132JDuNtYVOUhkPKGXw4rNa6LfUqLm1BZSsF+GrsSo9A8nzfZrDn4AkKJ5LUQWqwVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtFg4TLnwdiEGcWJIAYygZEjvYZ9om1IFUDvILgfdMw=;
 b=O38tEIIRq8SNsJ7mz8ZNWi63gJpck1laO3HPvrvSllYU1sccU4V837Nf40/TiVQDdma2kfXgBkdTcKzSI7GRrtTQSxWaSXjZ4+CrvonRVlMv70L44QLAw35N5yx5U2w/JbE6IYKIj2xDKUzF1s0VXoDBBuS45nZnH9aJcr9os8Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jason Andryuk
	<jason.andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/5] gzip: colocate gunzip code files
Thread-Topic: [PATCH 1/5] gzip: colocate gunzip code files
Thread-Index: AQHajCSYwHdHlHteY0Sfgy/E9d+Go7FjOomA
Date: Thu, 11 Apr 2024 16:00:55 +0000
Message-ID: <AA1FBA57-A643-4758-B99A-B59181B6329A@arm.com>
References: <20240411152518.2995-1-dpsmith@apertussolutions.com>
 <20240411152518.2995-2-dpsmith@apertussolutions.com>
In-Reply-To: <20240411152518.2995-2-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB6613:EE_|AMS0EPF00000192:EE_|VI1PR08MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: fd949b3c-8215-4d6c-c3d4-08dc5a40983c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wTRPawFamVZSH+SVnbRjKSh7VEpIyqOUGDSImfmcvcaechMmJMMZfrl9SOV1l92PDdyyh+VY0QON1z9/dNKqMouNxZAADKhE4zudPNgocn9Zh07FDe+4OeHxHGWcYcCXbeyPBN7DASyg6lTTJR5B4JUmB2RyQJ6d/wjqH2p3XHY4h/SFJJFgUVW1jnyxsiL2iZjaxFjJalZWxvz2eLlDHu0lMm7BnaQx1Ep4kvDAFj7fAf1Z1lM2l0F3wN9XPI60s6juzwsMUX8jovd2OCFF57hCly+o71IYM1l5PrtTdOdUbGkKggY4sx7ZpvF2KEFKeSEHVQJoW6JLE9TzYED8pVt3gjCba1IXeTXSMbPnVdg/KekY9MZ0lVuZTH6sPQRh68ck4/75dM7Oi+yqdh9g+PLPJXzT/gcEObAm/aQmRbxiFjRVVLldNHyH4mQvgLo9L58rbTxjxV79SPeI50wn5DuJw62SA5tXWsZN9WXFbSm51H1+UwHbkh345Kn9hl6ql5aXWkyru6MXWE9zmhhXYr8k9jL72xu45jX5MgW+c8vtkGdS4jUByfRqItCp1MsWC/Xs0ztG2PqKLLQph8fcdgMvG3sL7svg81dCllpEOT3+sZDw22jdNsVNw8AU3dYfy9A8pYsX4AKLJ7W032OdmK0K+WOvX0eL+1gaGO3+b+cxX5LwrhEoz/eNF5qXFVVKKktnCf+x7jgScOiZRvYLAg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BA1CAC30DF213441A59E1A287A538342@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	272cd284-13e9-48b2-5fcc-08dc5a40923f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I/FHk0hDZKD9wXbph4DcB5Grq8Lii2EW5gD+oJzgXiAfcm670mCuKbgzSCm1BwGlXgXr7wYAu5H4sTuP6A+F6+BSycLJ2qmJ7nV4yHbiY9cmHx7iq0zXpNGmp4hwBu6Y87Ke5hrRIFAsOsS5B67eYQ70dNPiyAheVY4lRlfmY5weOcAcSJ27syd6ADpkUWU8QC1yXj2nJ8jCRmWQfca98iNWW5jxW2W91m1j0RWR0raV0hE1cn6JzC0/QTbLLvSardZYMaYowwIZr0ga6aZQH/DgF850YrNnvBIwOd10dgVYdQ9qWt7zga9ibMHyrU9M3oM5m3nCQWUhROpXV3LIhyByBUO6eQFIM3Bd68ojtSwcxc0kZXVsYTmMSxzQzQLtpEqHn5eilF/b6Z6CpVv33mqdyZ1AuPtTFdcpk/70BHvWuJQQNmNm6MPkg9YO2xka86visvhxEDq5tB8a972kLiyyX/Llpcgc05p82BDghFoK+H4SlHUnn3NHgResAZcBOA+QWjxTujCtlbYmS2gNM5xAdqTdoDFF76vj8wpTcA0Qoc54OzcO5kiqlo0ccba/htgfnyhU0P1+Qw6kQKiUrebFkBmfJeIlYxqTht91DQ9BwUqjXvw1aCAaPsbmJr0dJFJHrSgkBtnmP1yd8FtTS81ph6scqmXH2WRTvLi57bxiiduRKTUBFIXOClFIjQA6oeWp92xzaRPFZEAfEK6nIkq4kY+Fe3Lmtz2xZ1BLZp7flV/5+1kNVQ+lTk3pnr/a
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 16:01:05.7824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd949b3c-8215-4d6c-c3d4-08dc5a40983c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10031



> On 11 Apr 2024, at 16:25, Daniel P. Smith <dpsmith@apertussolutions.com> =
wrote:
>=20
> This patch moves the gunzip code files to common/gzip. Makefiles are adju=
sted
> accordingly.
>=20
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> xen/common/Makefile             | 2 +-
> xen/common/gzip/Makefile        | 1 +
> xen/common/{ =3D> gzip}/gunzip.c  | 0
> xen/common/{ =3D> gzip}/inflate.c | 0
> 4 files changed, 2 insertions(+), 1 deletion(-)
> create mode 100644 xen/common/gzip/Makefile
> rename xen/common/{ =3D> gzip}/gunzip.c (100%)
> rename xen/common/{ =3D> gzip}/inflate.c (100%)

For inflate.c you will need to update also docs/misra/exclude-list.json



