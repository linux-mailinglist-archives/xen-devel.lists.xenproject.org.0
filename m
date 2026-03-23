Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJNLHJ5nwWliSwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:17:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5622F7DB9
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2026 17:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259421.1552728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4hxD-0001tS-8S; Mon, 23 Mar 2026 16:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259421.1552728; Mon, 23 Mar 2026 16:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4hxD-0001qo-4u; Mon, 23 Mar 2026 16:16:35 +0000
Received: by outflank-mailman (input) for mailman id 1259421;
 Mon, 23 Mar 2026 16:16:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1w4hxB-0001qi-Eq
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 16:16:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4hxA-007grc-MK
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2026 17:16:32 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69c1675f-2eae-0a2a0a5409dd-0a2a4502c0a2-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:16:31 +0100
Received: from [52.101.69.9]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69c1675f-63bb-0a2a45020019-346545091fad-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2026 17:16:31 +0100
Received: from AS4P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::14)
 by DBBPR08MB5945.eurprd08.prod.outlook.com (2603:10a6:10:1f7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 16:16:26 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::d2) by AS4P251CA0014.outlook.office365.com
 (2603:10a6:20b:5d2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.29 via Frontend Transport; Mon,
 23 Mar 2026 16:16:26 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19
 via Frontend Transport; Mon, 23 Mar 2026 16:16:25 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAXPR08MB6685.eurprd08.prod.outlook.com (2603:10a6:102:133::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Mon, 23 Mar
 2026 16:15:22 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 16:15:22 +0000
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
 b=jlXxrOUdHrJLopPcH4/os6i7aU92xSA+wvrz1g5A3lhgKbYhgRovuuRGL4IJsp0aPYJ1Sx0YKweDRs9JV2grzOHzzuJFgR8slNOGaDvrfaFnYduSPWVBuuLel4g1eoSy00U88xjuobn7MbDtyROJnmLC5/OQCDRvr/qqOymvBj6HLqCcHD13ZrLoV0H397I9T4L/6x2MlkSHsuh9Psl/VicwOE7O7/yf0/u3PKkylWpMFFT5F/+ivDIeCRPO3qbffTt5vhu+IsAE1dwmvVXy48MPG6oZ9jvXWV9V8XX/0yi/p9dbMFo8oBYVaCZ0TWYZAnJCIeyhC+Q11YveUgBdMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CidpbdwhBUiXhAvou3nUyWCGJqIAN6pkUr5rVCqeDA=;
 b=jvx4JMJKUxWQIzlYdr0wtbvpOSDpx2aWJSIbJ58GUqtR4JcSVi3xrKTfqJpeyr9WnNepMfmdsMSiZN0EIuF2ZT6IwQdwJUKe/BqtEYIvFzkvlou1ATJky4VwA37sJBSqfukaHi0abunmDQxPQoF0zFBb63ZfApJBE+AyNHzf9xFr6dEMb7L7VmYokTlrbYWhBCuXyiX3HuDmHmdfY6eWleM856ZT4GEbEHVYw80Vj3tEQEWJDCPegqmfWzK4GmaMZUdbUywkMnvKvWrj7klG21AqNfAKY16fXviBqWQg35jUXaYHHkdth7s/WzoJP44Dm1N5oqY4ogDvNWqXRIVImw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CidpbdwhBUiXhAvou3nUyWCGJqIAN6pkUr5rVCqeDA=;
 b=ow2BVB14f5ATGZ7sRIZO57oX8U8jJFCB7Cc3ygUSSZtPNOHwcEatSnrbrepLCIzoix2qo2ow3APgcEsap3Ybk00tg2YlVce9eel6H0vvsNd10nRnDS5PeXqfqsAxIZXqWRh0+atL/h9YO9q4TzrnO5Dw3q/4qww7KUMIkPD8WXM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq9t9aFDHevdzKFNhhyKjz2Ca+0bpHiB3ATHq1Gms59ZO18KzcKrz2HUGBozjeLfUdUdQnWJ5t+QLXHUTi0LPXkQeToURC6Hid67wLoR1HLdBrCxb6jE45p7T5mPelbHuJANVz0ezqtqzH8DAhQ2I8cEicTMPAvbeHaP+G5qXT/UOvmaUHS+W7Wn9SMBksm2LqURVBUZb4VdFCBRAQEU7AFvyW0Cp0Cv165f089lUGndVi97TjwqFDb2v2nN+91lRI+qq/g+eMSofnNZNZ+OSl59euXrWpeufGPj3Yok803oGFFO/UjV6RhNATI4ELZ7A9TLKJwQ6tiPEQwg2BpCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CidpbdwhBUiXhAvou3nUyWCGJqIAN6pkUr5rVCqeDA=;
 b=Wb1rmfl0nLl4L9Q+nixsy9I/1UnQt1EHU6W+HkmDA668ZWM72CFOdHf9u+4Rvkcxi6SiZC5FWBGw8htqXnnGf1xxsS3mRuJPiA9HE16A4niFIMdzGYVciIu4Y2TJ/g/NIdMAaf5hn3KJnMNOrhVHGTHdwfiAWjHi2M4/FqSt8iCnxPbXqpjFfmylycjVEfUrSc9OW/0tGJ4e6drokUPqGohEhTftXdxHlHt137+uSVmt+gJt4Zh3Yd4Z/9D1TjbHmGW+S9iDSHWHHZ9bq10iMFd3NbTLlMQnJSjuB/97lIqKnr+c9Z9qBMSyJNOPjebN++G1y0ScxF18TtsA7idS1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CidpbdwhBUiXhAvou3nUyWCGJqIAN6pkUr5rVCqeDA=;
 b=ow2BVB14f5ATGZ7sRIZO57oX8U8jJFCB7Cc3ygUSSZtPNOHwcEatSnrbrepLCIzoix2qo2ow3APgcEsap3Ybk00tg2YlVce9eel6H0vvsNd10nRnDS5PeXqfqsAxIZXqWRh0+atL/h9YO9q4TzrnO5Dw3q/4qww7KUMIkPD8WXM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Topic: [PATCH v2] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Index: AQHcurYjsTX9WA5Mqk6o6Mf3ZcTrT7W8SwcA
Date: Mon, 23 Mar 2026 16:15:22 +0000
Message-ID: <5D7F45D2-BA69-4BDA-8A04-41DBB652F66D@arm.com>
References:
 <cde430238469198082114121b14d88bce9f1ceef.1774263939.git.mykola_kvach@epam.com>
In-Reply-To:
 <cde430238469198082114121b14d88bce9f1ceef.1774263939.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAXPR08MB6685:EE_|AM3PEPF00009B9E:EE_|DBBPR08MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ae8093-c6ac-4ad0-1d49-08de88f78877
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 a6omwZV96Q0JYqWxgcXpPCrc+4Siw7aP+lY1vOmzXAM7Ikw+JYPRU3D0c6PATGkCjOiNNSQ2cUm8b57cZXVItEtHHaV5TIKFf3903Dwsfkm8XmPmm8m5chaEjwCBhY5O+fEFHVIYoJGpmnqQMv1DZiPVg2OQXlLXCBXzo3VcOijoXmCHbRDlx5qPoAhk0pBkgoBrmE6WsQi21WrzDzvwoewW0w3HKDWvqOsu+Mcg9YRA068d+cnAjKZQvVqlzOPpQlJgSEggBLkQahaiFnWlxpwutUX1vC3tGGp/77WhQ5Z4dOOSoePl6ZSeUyeyxoL3OBe3ACqim+xOdGHQUfGVDUAxVRL6ihlMLVOgGFVpyPfbwXZjiy2vwkaZV57gvAVMSuSRTQjDPKprSuTXG5F0Gy8WKAtXjkpBPj6nYnPpej1CUn0rUmcLyGztfDIWkYt6Yxzqd4RE2hdcYhV+omWP4gmooWv9w0tQ+TW4nllGO+KyzEe1/pO7puSi6KmO6ZkgnU4WfN/YSepN8uwWlCvmdCTL8trpQZE3MyASiraNzPiXhm2eO0I4dtFuqPgd9xm8B/sMEhUyiNHE7YE5NTPH/Qsb4CgDgO46a07UAuqyO9IjH9jmv9MwjBU2ZhzgSO0WscHH13AOEUOE60p3KXxuwSClK+KgCKqnf9/qMTDsQGSECre2MshEnP99bsu1dg9N2rDBS6F+hW5YTgAp977wgqF/o47PrhDa7NARb1t3DCbkEVp6hOHNK8APZOIlWDTC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87359AC5AB1B5946827634275E9EC153@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 KA9xwbwlnz3Lj34hyLe7t1iLAfvPGwUQR5Q8xsDWaa69DAGPi7Wq8ZsAuzPcq1IXWPSHIm4FdjVeddnMcDO1vzszS4qXH12p3g6WVcv66+oC/71Bb7liKQCIZTS8Llzdfa0oDYlHZN3JtcZya8IlejTgLYpcVy1KDbIwIgalaxF024MI8NF7hxjo7Gd9kSfI19cmfoZzTu/87tXFq/VSowIBgx9SPBYjpNKqlOasjfjkNtaDe3cGZEYhLGpXQyN88Jb/mPgyw1UPsjnRG7SoaOnNUzKEAdidzQyXRsZTsltzMo6pLJ+xLqSRK3tgUsssr1jdVsycZqiWiaw12jWlFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6685
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2321903c-bd0e-48f9-86d8-08de88f762ab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|35042699022|376014|14060799003|82310400026|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	OPVjgi9YRnIahJQrw+TstEWIWheu3WroFni2AFeBSlkt/B9E6VK8/dUbzFv2Hui/BZEUsyA19n3k1cF45Jm+mX1K2366b6RbPXu5gEqm4ZrWlrz4reClfKiqUGhyR+NqCi3SaSlddFzx1UOoIb7D07fEj2sOP5pFNcsuRtWA3I3n0Vs8PaLAPNXa1HWVWVs9fNDXprQuP9qE6rwLReLMr9ySePjMzKchBI/J0eyb7dOILj1IbQaVXDjDgnt2qT/a5aNGS55nyBC3SBtTHprbFEnbicq2qmkzkd4G+3n2FdCXKHcy9Coz7WkCHFdkEZJ6+V7vrc1lt/KkUm2mEZvdzP+SpC5ctacrM0k5wMBErluBStNda3biwILx3QOh8xInVWvjg/9utBaINwrp1s8xR3D7jEPtmWNXzr19bZPg+2FI6JtBnC1JGIqT2Ot7feZdSiNIcudApZIk+BZdL8j7fQLfdEZJLJZIBDcO43I9UvmGSjAAv2IVEShT9loDbH2rTCURvCVku84K27Wlir+D24P7hddFCLci+xIpq2E69a0DYRPFiBHbRo0g/+/PLixoK9tEI0UEKhdynWsFcc0wKLgszxFzaiaCdVP1SmflfhlGIX/O8hXASL5JOxoVOwGKah0dxPwWNwT9Kg87j4pVr1+CwY3Vhpz5BEtsVYnZ7kbg6RAluUv4avSyo3e9QKP24y3EyEKtCCbsGXhLWOSKgALpLfgkyOTyno0XAyreb00=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(35042699022)(376014)(14060799003)(82310400026)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kcdvRImvrYHYF/ma7n8QkwOD4UySn3w4+ZPek8P9g7t7bXOFsS/izaPYeONlILXEQLRNtSJpgMlPVlIJLr/PE/WpyMWZjyXoSkCXvuPStVt2H0omVu6h+7utP73hMQVLV3AwquEjoVgGxAMjlXy08RtihuB0jLbq0zNWJZ6SYbRmtZb0kDyHRy8ZsY0lDhSvOqcz2PQhMiWxbWZrtBUkCPrd8+jKDdwAZ5DhgfYbYdocKS9ZjYK5ECLRks+zmFcVYZ2wwFu+PeXEY6Ja2UYzqJq9Ili3YvqZruG3M3aAlNCdOKAXBJjXgLquj8bO7qiRMIozL09qNOT0B4ig+ObL+LtaoIwkamPMqPigluoeWKjRXKPOnAYZSPs2nT0o/oHirDBhLIgUvmrdAxmxJY4R2DlyFw7J+3zVUlvEC1MvZr2YPi2BC5bOeVNvwzbWsMDX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 16:16:25.9920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ae8093-c6ac-4ad0-1d49-08de88f78877
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945
X-purgate-ID: tlsNG-720697/1774282591-68D70DB8-98C6B2E2/0/0
X-purgate-type: clean
X-purgate-size: 4661
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,xen.org:email]
X-Rspamd-Queue-Id: 8A5622F7DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

> On 23 Mar 2026, at 12:11, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> SMCCC DEN0028G, section 3.1, states that for AArch64 SMC/HVC calls
> using Wn, only the least significant 32 bits are significant and the
> upper 32 bits must be ignored by the implementation.
>=20
> So for SMC32 PSCI calls, Xen must not treat non-zero upper bits in the
> argument registers as an error. Instead, they should be discarded when
> decoding the arguments.
>=20
> Arm ARM DDI 0487J.a (D1-5406) also notes that the upper 32 bits may be
> implementation defined when entering from AArch32. Xen zeros them on
> entry, but that guarantee is only relevant for 32-bit domains.
>=20
> Update PSCI v0.2+ CPU_ON, CPU_SUSPEND and AFFINITY_INFO to read SMC32
> arguments via PSCI_ARG32(), while keeping the SMC64 handling unchanged.
>=20
> No functional change is intended for PSCI 0.1.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

PS: this could be treated as a bug fix but as no implementation we know of =
has
been falling into this error, i do not think it would be needed to backport=
 this.

Cheers
Bertrand

> ---
> v2:
> - introduce PSCI_ARG_CONV() to centralize convention-dependent argument
>   decoding for PSCI v0.2+ calls;
> - use smccc_is_conv_64(fid) instead of open-coding per-call SMC32 checks;
> - keep PSCI 0.1 handling unchanged, except switch on the already-decoded
>   fid instead of re-reading x0/r0.
>=20
> Link to discussion: https://patchew.org/Xen/cover.1751020456.git.mykola._=
5Fkvach@epam.com/072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.my=
kola._5Fkvach@epam.com/#7070f416-119c-49f8-acd0-82c6e31f0fc6@xen.org
> ---
> xen/arch/arm/vpsci.c | 19 ++++++++++++-------
> 1 file changed, 12 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
> index 7ba9ccd94b..65dea5cf6c 100644
> --- a/xen/arch/arm/vpsci.c
> +++ b/xen/arch/arm/vpsci.c
> @@ -230,13 +230,16 @@ static int32_t do_psci_1_0_features(uint32_t psci_f=
unc_id)
> #define PSCI_ARG32(reg, n) PSCI_ARG(reg, n)
> #endif
>=20
> +#define PSCI_ARG_CONV(reg, n, conv_64) \
> +    ((conv_64) ? PSCI_ARG(reg, n) : PSCI_ARG32(reg, n))
> +
> /*
>  * PSCI 0.1 calls. It will return false if the function ID is not
>  * handled.
>  */
> bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid)
> {
> -    switch ( (uint32_t)get_user_reg(regs, 0) )
> +    switch ( fid )
>     {
>     case PSCI_cpu_off:
>     {
> @@ -271,6 +274,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, ui=
nt32_t fid)
>      * adding/removing a function. SSSC_SMCCC_*_REVISION should be
>      * updated once per release.
>      */
> +    bool is_conv_64 =3D smccc_is_conv_64(fid);
> +
>     switch ( fid )
>     {
>     case PSCI_0_2_FN32_PSCI_VERSION:
> @@ -303,9 +308,9 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, ui=
nt32_t fid)
>     case PSCI_0_2_FN32_CPU_ON:
>     case PSCI_0_2_FN64_CPU_ON:
>     {
> -        register_t vcpuid =3D PSCI_ARG(regs, 1);
> -        register_t epoint =3D PSCI_ARG(regs, 2);
> -        register_t cid =3D PSCI_ARG(regs, 3);
> +        register_t vcpuid =3D PSCI_ARG_CONV(regs, 1, is_conv_64);
> +        register_t epoint =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> +        register_t cid =3D PSCI_ARG_CONV(regs, 3, is_conv_64);
>=20
>         perfc_incr(vpsci_cpu_on);
>         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_on(vcpuid, epoint, cid));
> @@ -316,8 +321,8 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, ui=
nt32_t fid)
>     case PSCI_0_2_FN64_CPU_SUSPEND:
>     {
>         uint32_t pstate =3D PSCI_ARG32(regs, 1);
> -        register_t epoint =3D PSCI_ARG(regs, 2);
> -        register_t cid =3D PSCI_ARG(regs, 3);
> +        register_t epoint =3D PSCI_ARG_CONV(regs, 2, is_conv_64);
> +        register_t cid =3D PSCI_ARG_CONV(regs, 3, is_conv_64);
>=20
>         perfc_incr(vpsci_cpu_suspend);
>         PSCI_SET_RESULT(regs, do_psci_0_2_cpu_suspend(pstate, epoint, cid=
));
> @@ -327,7 +332,7 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, ui=
nt32_t fid)
>     case PSCI_0_2_FN32_AFFINITY_INFO:
>     case PSCI_0_2_FN64_AFFINITY_INFO:
>     {
> -        register_t taff =3D PSCI_ARG(regs, 1);
> +        register_t taff =3D PSCI_ARG_CONV(regs, 1, is_conv_64);
>         uint32_t laff =3D PSCI_ARG32(regs, 2);
>=20
>         perfc_incr(vpsci_cpu_affinity_info);
> --=20
> 2.43.0
>=20


