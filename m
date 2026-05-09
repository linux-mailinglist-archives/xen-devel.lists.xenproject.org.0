Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC51Oa7n/mnzzAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 09:52:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075414FE95E
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 09:52:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304501.1577499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLcTY-0003pw-SB; Sat, 09 May 2026 07:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304501.1577499; Sat, 09 May 2026 07:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLcTY-0003oB-PB; Sat, 09 May 2026 07:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1304501;
 Sat, 09 May 2026 07:51:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLcTX-0003o5-1S
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 07:51:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLcTW-009BYU-CC
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 09:51:50 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fee785-e002-0a2a0a5209dd-0a2a4508c7b2-32
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 09:51:49 +0200
Received: from [40.107.130.3]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fee795-63b5-0a2a45080019-286b82037012-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 09:51:49 +0200
Received: from CWLP265CA0453.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::22)
 by AS2PR08MB10155.eurprd08.prod.outlook.com (2603:10a6:20b:62d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Sat, 9 May
 2026 07:51:45 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::b1) by CWLP265CA0453.outlook.office365.com
 (2603:10a6:400:1b7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Sat,
 9 May 2026 07:51:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Sat, 9 May 2026 07:51:45 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com (2603:10a6:20b:420::10)
 by DB4PR08MB8005.eurprd08.prod.outlook.com (2603:10a6:10:38f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Sat, 9 May
 2026 07:50:40 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31]) by AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 07:50:40 +0000
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
 b=Ano/IT14zKw3kYobaN9+xaFoz2UA7WXHBl1DJAR3QqA5USPbHhhUuYt4Oa4VjZtpvcOp4VjcqGy+JO0OyoWajsB+lG1mIgJpMi0M67L/fGjL//AAzuwvqEOsXYVhw5i5mHR8T5HJM+lNOoUMEI3Isve+Z2tEWXxXcj1bsnGYTToqqKflN8CyVmQ/UScdxqHZQ+NQTS7SOggsALKb5xBCDGMfqH/RKpRL7SezQZhN7prKFu1Rp+qjQtama9dn/tLOrsdeCwBwP+MGOkUtSXyNDw3s3M+eyaRHY0DioEa2TkxyCq0WpuUUCTw0AcdHF2bpDNeG6xdBdSjmfcWz3vsaTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXvam/YZ/eDqHqEp8ToiSa3PuFcnOSmoOOyUdP1mmPQ=;
 b=gCs1D5d2Vvcd9p8Yo3bWh+lhSIAcYzLoJHxKW/a8szsplyJJ+RKRS2ziEnDSfbbHz6A2nSXWS56jFiUnXbVHecXdKug1V/Ca4nGFktO3VplzOPBxdXVMLG6Oh4CuIzK+ScHJJZmqRtlXW8ihJj0jtaXtuN+XtEPtAyJNXnugYtcbmyj1wbB6o7TgHpegIclEg32RmJL/nHxGwvfFZYeYCga+cYZ/oUzvxveIrINbAkBdLmrNDZ90NoNv5YsYs7+ZuzLXj8kx0gwOWCWS100kExFMg0oxVzMt9WpA6QPlQyYMSqVRf8aBgAbuWTuGLayW7QVRv9dTwaqyAzOW/WgNnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvam/YZ/eDqHqEp8ToiSa3PuFcnOSmoOOyUdP1mmPQ=;
 b=Y5nA8XI6818HfQnLMHEzViCb1rVl1Zp9wA3lFVJi+lwONd0yjfBp+wB8SMWnzJ8URUN1//Zj1/+u6r6ItEvPr2sSSgC2+Y3DTJlDidDpU4aURUvJATBdHe89hfAv82spCx/sLrtl509XGQ2DAYxYaQgSZwr23Ehxk0T+Ng99vZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzZVAluTo+bshLr8lCzE4RyI2nPq5jKUkfsdgFP12PbW3DXsN1ycV/NvsJGGzYVteg2LA0NejjHdP5WmjoMpUOnxo3/00k3P0cU3M/vqH84o0lMtK5yQtkJCLvksGZR6bCpe/OlLw7SJU8TKv9xtvMw/LVat2pLAGKkUMb08ZjoiFBuZZBKJLA9fWnQ0Wf1SoRnCXkk3yhI1c5j9QOICIfajeWQst9pamSt/5jfrszM34XmAweNeWte/ZcxYwS2/jl3GbwfhP/Qkrz0SJ7yOVOsVUGjwW+8HvzkAJOIdPMUJ6XWOh560DfLMPUuFSnXXqgP4BIjuPUqECAG12R0UGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXvam/YZ/eDqHqEp8ToiSa3PuFcnOSmoOOyUdP1mmPQ=;
 b=iIOw/zkH+SuONepFO6H2W2iDJ/eayEryKrSzVxOT6qmyybHJcCEoNgWWHtKj+Q/RhnUHRqF9+0lTHorWfBDZsGfMZJWiaylhVoLYdl514Wx/M8n/6kpxylpzSP2+ekoaukqixRR9W9BHDR/l9du1JmJjLrbNvdG2WxHWm5AXKgqh53evpzLHjg/MtdhGP0i7t0+nexsz9HZaU3qjDFeWkuhkkHWkm2PGSxUuywotPXEQ8mmM9kTKmh4XY5nn8pd7Cfh3NqA5WFFlqUgr/aIwwVKr9HzReFac8qwxCFxqUxzdRRuQ1r2BrEFVxOZVqF5H3xIc1TpFaoV9aaGQegNDwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvam/YZ/eDqHqEp8ToiSa3PuFcnOSmoOOyUdP1mmPQ=;
 b=Y5nA8XI6818HfQnLMHEzViCb1rVl1Zp9wA3lFVJi+lwONd0yjfBp+wB8SMWnzJ8URUN1//Zj1/+u6r6ItEvPr2sSSgC2+Y3DTJlDidDpU4aURUvJATBdHe89hfAv82spCx/sLrtl509XGQ2DAYxYaQgSZwr23Ehxk0T+Ng99vZA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Topic: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Thread-Index: AQHc1k50BMsvUkAtf0yXvEOre8XAa7X/maIAgASD5YCAAJ2MAIAAqTsA
Date: Sat, 9 May 2026 07:50:40 +0000
Message-ID: <93C7B83B-A7AB-46F4-9E9E-98DD88483A00@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
 <F5384D51-933E-48E6-AE7E-B54022AEAE11@arm.com>
 <CAGeoDV907jTK5RsN51ezapA5inhvG1jWpeybbqF=LkxWcEGnbQ@mail.gmail.com>
 <6E040BE7-0133-46AE-8B5C-85EA02704285@arm.com>
 <CAGeoDV9+kdwkdkA1CtPrOoBPeMH=TL5mdjrDoqdrS64hHuZGHg@mail.gmail.com>
In-Reply-To:
 <CAGeoDV9+kdwkdkA1CtPrOoBPeMH=TL5mdjrDoqdrS64hHuZGHg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7265:EE_|DB4PR08MB8005:EE_|AM3PEPF0000A798:EE_|AS2PR08MB10155:EE_
X-MS-Office365-Filtering-Correlation-Id: f0fd7e0b-b2f8-485a-a98a-08dead9fd11c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|38070700021|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 zxTfKkdbsGtwtRXASQMu/09B5zGU9qCAOZxH1x4jyNYaZFtD74orHlg9qp96O9j9uU3L6Zxpi5HUH9TMw75/K+20cae40hJiq94X2kup7ZxXg8PV/C7QDtE0eMv1isBOx15aMePZH9lOuorn4XjWJRoOhtz1GJZiTKpMbGje+WJyLLwWYiNFHcPSfvPTk1cwKgAAhmQsFNjAMENWCFZ1/crmPXcjYkPYeD59QWNQYGyAdYINFRfqd2k9vyr4DY7Kz0rI47O20h7FR7qK/2/wE9VZ/qS3+HIR+u0/qRkQ30Bp4UhGjDrzGtFqtXuztq6onaKP5GvDoKeGimIBltzv4DH/6aWPI2p8Cg0ROshXxoD+taK2rwkM2w+mpVF4O/98OBtr1kNe86x7xkWGNi9FGOhMbbATr3nxZKgKWZ9jNGTmmQtJC6gPDbtY2NNbUIFkDnssxw9C0F4L6/J+FHCEonAmkdBP8Fl7B8q53p1Se0Fx2AAGFSOCARgncWQVjdXcArKDoBtZCroPyPOiW9eCMqr9rp3GnsSDShD/IMBxPzn4GZ9qZWolhIFjmd8VkqsCehmZu5+zauWHjTnt78od+QQ3OwHMe6cSkhFbZTrTIT486OIYcUvw8uCNhoXQqc7Vf7cLdkk8HRz8UiLS+xm/tpL+p7BsgvekP9hk15rbPGvPn7EIpF1AnAq5gP3QAhM9WcmfmblkTwXHMApJ+TA+euX5DePovXQgqGDpqZyIfwumBZxOSP1WuW027Z2AW44H
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7265.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <43AD2EDEB958FA4189B1C61A2A62B7CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 l5WmaJsTxKulg/E3d4SMZ0h15VWedzLq5hbNix2PsdiiS2WYbt4mKtzd5Vr18iErLbSYPTdxk1XNpVcibVmOP1OMiJNT6HVBGF5eZFA9TkcJwDCRYps6qOpGNvBr2aXSRXPQjrESKQi9TC/kV0m8jKCnxdN1rUmt02CcHxCP5zNz8Yf4wVThljEpw31H9QKTWa7hnmIPjNTdzKBSiGodMuDNtRMBT1x3LtHszfeTkATqX0UTpwWn7C/ekLXJtmPXz2Zf8v/pZJA966tF9rG+haYp4ezVCpOxCX1JtwSLjThbGZLODcIzTVMKbvNwugM8hS7hgbUsFHvkmSbLwmWlYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8005
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae4ef47b-b827-4cca-36a8-08dead9faaa5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|82310400026|14060799003|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YW5leyGvX2Or18NfmX+SWt8D6xnXTAJaMvxBkKRbzk7esEZ+ygDvNQV710Uc9aEBpAcMN+gECY2z37jEIpPTw/p5w873V9AMSOmS/0NSECYoBfudfbUTHYwa7obfy2QVKa32BUr9sMNv2bcOoxUFHArnIiyXmBWJ4f8uO/eB5DoPnqqR/ZPVw6700S/guuUQe0srlBTk0z4Sw1U5eKdA/ZF9IIrM20jeBxOzqTIn6z3qLe1PAi7f/BvSnkdwSp9cQ6DVPjfSX9ISC4Ae6LGFigIqE/IapWQImwJFKzd5f5ZAxh9UuHS8S4/dtsqEaQHAsW5lYqf7RtlwBD8yLygnv/3eL232Mx5K0gnWwyXD5+oQ0UWPJP7zGFvmeeFYcuPTNZ4ohgs722E+3aZ1UpK8J9DzoC87NP/Bx3QERNMqyLGRx9+DqBI5FMzcl1s3Yj3nf44l73Kq5ppaMVrTnr0O6i51laXrCpPEGZLQxS3CxUKte1oH952JkYKKRY0ozrp8PziDWWaExCeKVBWZ+ZUbPDyXmHlNBdN/b+WftCfeus1k5LctW2P7Ncc5ZRFb5vnaT7ZcLtNkTMHvGGgdiN1s5blJQePqrOfh5BBQrbgCgq6n/f5Rf7VZ0WemZIcq6bDESq/auFlknC0BToMPh9UF5LD3HWtl7O9VYf49xK/j8Pvkai9emiYw3OJjhxLAIW/20mYtcVMLMHMhZzuHRiFsQQMJ0NglrVNytgz/fLxKbkf/ZJAqPpl2kydOlbQKlsY1
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J+c65WhtwpLsZh1kHZZhwQuJd6UBlElQ/7UGVgnJPZemtikfnO03HYFAAth55q0EoSl5H5bMN4t9yptkh4bhEBzPg9hr+2kZq+oy+KXc4p3ESVDCbzA0troJjB5eJQDaj1sanvP1VHqr1r/iwi33vtElta6HfLV0omdLEXg3jYGGJdgGAOsgg1hjDHO8Dxdktwy4uh/GA2zq4EnnL4b94NsWB44qHBwL7T9FFnzofWOcigYa/B6Gq4PASlf8sZCr3Zio2AzZPff72aVyxlKaAJMQ2pNXUeILeFL3l4+Sn1eBcjt2SEljJAJQqFeGrl1sT0dqHlHzFBwOaKpdnG588vnCk/0NeWtPLamqSWftafbF+vWSu8Zz8qfJyBhVpOj6BjTVhj1jcaqL0N7CotjNagAaWQgTv8sSbM5cMVIu3E7pTqxUW7zPIVuWMgsAz1+Q
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 07:51:45.1997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fd7e0b-b2f8-485a-a98a-08dead9fd11c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10155
X-purgate-ID: tlsNG-c1860d/1778313109-C447DDB1-BD7EC4BE/0/0
X-purgate-type: clean
X-purgate-size: 3716
X-Rspamd-Queue-Id: 075414FE95E
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:Bertrand.Marquis@arm.com,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IE9uIDggTWF5IDIwMjYsIGF0IDIyOjQ0LCBNeWtvbGEgS3ZhY2ggPHhh
a2VwLmFtYXRvcEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBNYXkgOCwgMjAyNiBh
dCAzOjIy4oCvUE0gTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90ZToN
Cj4+IA0KPj4gSEkgTXlrb2xhLA0KPj4gDQo+Pj4+PiANCj4+Pj4+IC1zdGF0aWMgaW50IF9faW5p
dCBhcm1fc21tdV9kZXZpY2VfcmVzZXQoc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSkNCj4+
Pj4+ICtzdGF0aWMgaW50IGFybV9zbW11X2RldmljZV9yZXNldChzdHJ1Y3QgYXJtX3NtbXVfZGV2
aWNlICpzbW11KQ0KPj4+Pj4gew0KPj4+Pj4gaW50IHJldDsNCj4+Pj4+IHUzMiByZWcsIGVuYWJs
ZXM7DQo+Pj4+PiBAQCAtMjE2MywxNyArMjE2Niw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGFybV9z
bW11X2RldmljZV9yZXNldChzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11KQ0KPj4+Pj4gfQ0K
Pj4+Pj4gfQ0KPj4+Pj4gDQo+Pj4+PiAtIHJldCA9IGFybV9zbW11X3NldHVwX2lycXMoc21tdSk7
DQo+Pj4+PiAtIGlmIChyZXQpIHsNCj4+Pj4+IC0gZGV2X2VycihzbW11LT5kZXYsICJmYWlsZWQg
dG8gc2V0dXAgaXJxc1xuIik7DQo+Pj4+IA0KPj4+PiBXZSBhcmUgbW92aW5nIHRoaXMgb25lIHRv
IHRoZSBwcm9iZSBhbmQgLi4NCj4+Pj4gDQo+Pj4+PiArIHJldCA9IGFybV9zbW11X2VuYWJsZV9p
cnFzKHNtbXUpOw0KPj4+Pj4gKyBpZiAoIHJldCApDQo+Pj4+IA0KPj4+PiBjaGFuZ2luZyB3aXRo
IHRoaXMgb25lLCBidXQgYXJtX3NtbXVfc2V0dXBfaXJxcygpIGFsc28gY2FsbHMgYXJtX3NtbXVf
c2V0dXBfdW5pcXVlX2lycXMoKSB3aGljaA0KPj4+PiBjYWxscyBhcm1fc21tdV9zZXR1cF9tc2lz
KCksIGFyZSB3ZSBzdXJlIHRoYXQgb24gcmVzdW1lIHdlIHdpbGwgZ2V0IHRoZSBzYW1lIHN0YXRl
Pw0KPj4+IA0KPj4+IFRoaXMgZm9sbG93cyB0aGUgc3BsaXQgaW50cm9kdWNlZCBpbiB0aGUgTGlu
dXggYXJtLXNtbXUtdjMgcnVudGltZS9zeXN0ZW0gc2xlZXANCj4+PiBzZXJpZXM6DQo+Pj4gDQo+
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMjAyNjA0MTQxOTQ3MDIuMTIy
OTA5NC0xLXByYWFuQGdvb2dsZS5jb20vDQo+Pj4gDQo+Pj4gVGhlIGludGVudCBpcyB0byBrZWVw
IElSUSBoYW5kbGVyIHJlZ2lzdHJhdGlvbiBhcyBvbmUtdGltZSBwcm9iZSBzdGF0ZSwgd2hpbGUN
Cj4+PiByZXNldC9yZXN1bWUgb25seSByZXN0b3JlcyB0aGUgU01NVSBoYXJkd2FyZSBzdGF0ZSBh
bmQgcmUtZW5hYmxlcyBpbnRlcnJ1cHQNCj4+PiBnZW5lcmF0aW9uLg0KPj4+IA0KPj4+IFlvdSBh
cmUgcmlnaHQgdGhhdCB0aGUgTVNJIGNhc2UgbmVlZHMgZXh0cmEgY2FyZS4gSW4gdGhlIExpbnV4
IHNlcmllcyB0aGlzIGlzDQo+Pj4gaGFuZGxlZCBieSBhcm1fc21tdV9yZXN1bWVfbXNpcygpLCB3
aGljaCByZXN0b3JlcyB0aGUgU01NVS1zaWRlIE1TSQ0KPj4+IGNvbmZpZ3VyYXRpb24uIEkgZGlk
IG5vdCBwb3J0IHRoYXQgcGFydCBpbiB0aGlzIHBhdGNoIGJlY2F1c2UgWGVuIFNNTVV2MyBNU0kN
Cj4+PiBzdXBwb3J0IGlzIGN1cnJlbnRseSBkb2N1bWVudGVkIGFzIHVuc3VwcG9ydGVkIGFuZCBp
cyBub3QgcGFydCBvZiB0aGUNCj4+PiBzdXBwb3J0ZWQvdGVzdGVkIHBhdGgsIHNvIHRoaXMgcGF0
Y2ggb25seSBjb3ZlcnMgdGhlIHdpcmVkIElSUSBwYXRoIHVzZWQgYnkgWGVuDQo+Pj4gdG9kYXku
DQo+Pj4gDQo+Pj4gSWYgWGVuIFNNTVV2MyBNU0kgc3VwcG9ydCBiZWNvbWVzIHVzYWJsZSBpbiB0
aGUgZnV0dXJlLCB0aGUgcmVzdW1lIHBhdGggd2lsbA0KPj4+IG5lZWQgYW4gZXF1aXZhbGVudCBN
U0kgcmVzdG9yZSBzdGVwIGJlZm9yZSBJUlFfQ1RSTCBpcyByZS1lbmFibGVkLg0KPj4gDQo+PiBJ
biB0aGUgbWVhbiB0aW1lIHNob3VsZCB3ZSBjaGVjayBtYXliZSBzbW11LT5mZWF0dXJlcyBkb2Vz
buKAmXQgaGF2ZQ0KPj4gQVJNX1NNTVVfRkVBVF9NU0kgZmxhZyBhbmQgZG9jdW1lbnQgaXQgaW4g
Y29tbWl0IG1lc3NhZ2U/DQo+PiANCj4+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGl0PyBJ4oCZ
bSBqdXN0IHdvcnJpZWQgc29tZW9uZSB1c2VzIENPTkZJR19NU0kgYW5kIHlvdXINCj4+IGZlYXR1
cmUgYW5kIGVuZHMgdXAgaW4gc29tZSB0cm91YmxlLCB3aGlsZSB3ZSBrbm93IHRoYXQgeW91ciBm
ZWF0dXJlIGJyZWFrcw0KPj4gQ09ORklHX01TSS4NCj4gDQo+IEdvb2QgcG9pbnQuDQo+IA0KPiBJ
IGRvbid0IHRoaW5rIGNoZWNraW5nIG9ubHkgQVJNX1NNTVVfRkVBVF9NU0kgaW4gdGhpcyBwYXRj
aCBpcyB0aGUgcmlnaHQNCj4gYXBwcm9hY2gsIHNpbmNlIHRoYXQgcmVmbGVjdHMgaGFyZHdhcmUg
Y2FwYWJpbGl0eSByYXRoZXIgdGhhbiB3aGV0aGVyIFhlbiBpcw0KPiBhY3R1YWxseSB1c2luZyB0
aGUgU01NVXYzIE1TSSBJUlEgcGF0aC4NCg0KWWVzIHlvdSBhcmUgcmlnaHQsIEkgcmVhbGlzZWQg
dGhhdCBtb21lbnRzIGFmdGVyIHNlbmRpbmcgbXkgcmVwbHksIGEgZ29vZCBjaGVjaw0Kd291bGQg
YmUgdG8gY29tcGxhaW4gb25seSBpZiBYZW4gaXMgYWN0dWFsbHkgdXNpbmcgdGhhdCBwYXRoLg0K
DQpMZXTigJlzIGdvIGZvciBkb2N1bWVudGluZyB0aGUgbGltaXRhdGlvbiB1bmxlc3MgbWFpbnRh
aW5lcnMgZGlzYWdyZWUuDQoNCkNoZWVycywNCkx1Y2ENCg0K

